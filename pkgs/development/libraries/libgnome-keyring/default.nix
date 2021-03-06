{ stdenv, fetchurl, glib, dbus, libgcrypt, pkgconfig,
intltool }:

stdenv.mkDerivation {
  name = "libgnome-keyring-2.32.0";

  src = fetchurl {
    url = mirror://gnome/sources/libgnome-keyring/2.32/libgnome-keyring-2.32.0.tar.bz2;
    sha256 = "030gka96kzqg1r19b4xrmac89hf1xj1kr5p461yvbzfxh46qqf2n";
  };

  outputs = [ "out" "dev" ];

  propagatedBuildInputs = [ glib dbus libgcrypt ];
  nativeBuildInputs = [ pkgconfig intltool ];

  meta = {
    inherit (glib.meta) platforms maintainers;
    license = stdenv.lib.licenses.gpl2;
  };
}
