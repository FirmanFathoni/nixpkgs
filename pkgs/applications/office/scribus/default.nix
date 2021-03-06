{ stdenv, fetchurl, pkgconfig, freetype, lcms, libtiff, libxml2
, libart_lgpl, qt4, python2, cups, fontconfig, libjpeg
, zlib, libpng, xorg, cairo, podofo, aspell, boost, cmake }:

let
  pythonEnv = python2.withPackages(ps: [ps.tkinter]);
in stdenv.mkDerivation rec {
  name = "scribus-1.4.7";

  src = fetchurl {
    url = "mirror://sourceforge/scribus/scribus/${name}.tar.xz";
    sha256 = "1v2ziq3k0yjz35nk5plcbc1jpi53p9v1cq1z3spch9lwlns3bls2";
  };

  enableParallelBuilding = true;

  buildInputs = with xorg;
    [ pkgconfig cmake freetype lcms libtiff libxml2 libart_lgpl qt4
      pythonEnv cups fontconfig
      libjpeg zlib libpng podofo aspell cairo
      boost # for internal 2geom library
      libXaw libXext libX11 libXtst libXi libXinerama
      libpthreadstubs libXau libXdmcp
    ];

  meta = {
    maintainers = [ stdenv.lib.maintainers.marcweber ];
    platforms = stdenv.lib.platforms.linux;
    description = "Desktop Publishing (DTP) and Layout program for Linux";
    homepage = https://www.scribus.net;
    license = stdenv.lib.licenses.gpl2;
  };
}
