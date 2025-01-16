Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7527fc4sm63884695e9.27.2025.01.16.08.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:12:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC355608E6;
	Thu, 16 Jan 2025 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 34/37] docs/devel: add information on how to setup build environments
Date: Thu, 16 Jan 2025 16:03:03 +0000
Message-Id: <20250116160306.1709518-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rPBBjzAFCqll

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

MacOS and Linux are straightforward, but Windows needs a bit more
details.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20241209183104.365796-5-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - add new files to MAINTAINERS
---
 MAINTAINERS                      |   3 +-
 docs/about/build-platforms.rst   |   4 +-
 docs/devel/build-environment.rst | 118 +++++++++++++++++++++++++++++++
 docs/devel/index-build.rst       |   1 +
 4 files changed, 124 insertions(+), 2 deletions(-)
 create mode 100644 docs/devel/build-environment.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b9d9a7cac..1d2b9f4ab8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -72,9 +72,10 @@ R: Markus Armbruster <armbru@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 W: https://www.qemu.org/docs/master/devel/index.html
 S: Odd Fixes
-F: docs/devel/style.rst
+F: docs/devel/build-environment.rst
 F: docs/devel/code-of-conduct.rst
 F: docs/devel/conflict-resolution.rst
+F: docs/devel/style.rst
 F: docs/devel/submitting-a-patch.rst
 F: docs/devel/submitting-a-pull-request.rst
 
diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index d8b0445157..482b09819c 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -29,6 +29,9 @@ The `Repology`_ site is a useful resource to identify
 currently shipped versions of software in various operating systems,
 though it does not cover all distros listed below.
 
+You can find how to install build dependencies for different systems on the
+:ref:`setup-build-env` page.
+
 Supported host architectures
 ----------------------------
 
@@ -130,7 +133,6 @@ Optional build dependencies
   cross compilation using ``docker`` or ``podman``, or to use pre-built
   binaries distributed with QEMU.
 
-
 Windows
 -------
 
diff --git a/docs/devel/build-environment.rst b/docs/devel/build-environment.rst
new file mode 100644
index 0000000000..f133ef2e01
--- /dev/null
+++ b/docs/devel/build-environment.rst
@@ -0,0 +1,118 @@
+
+.. _setup-build-env:
+
+Setup build environment
+=======================
+
+QEMU uses a lot of dependencies on the host system. glib2 is used everywhere in
+the code base, and most of the other dependencies are optional.
+
+We present here simple instructions to enable native builds on most popular
+systems.
+
+You can find additional instructions on `QEMU wiki <https://wiki.qemu.org/>`_:
+
+- `Linux <https://wiki.qemu.org/Hosts/Linux>`_
+- `MacOS <https://wiki.qemu.org/Hosts/Mac>`_
+- `Windows <https://wiki.qemu.org/Hosts/W32>`_
+- `BSD <https://wiki.qemu.org/Hosts/BSD>`_
+
+Note: Installing dependencies using your package manager build dependencies may
+miss out on deps that have been newly introduced in qemu.git. In more, it misses
+deps the distribution has decided to exclude.
+
+Linux
+-----
+
+Fedora
+++++++
+
+::
+
+    sudo dnf update && sudo dnf builddep qemu
+
+Debian/Ubuntu
++++++++++++++
+
+You first need to enable `Sources List <https://wiki.debian.org/SourcesList>`_.
+Then, use apt to install dependencies:
+
+::
+
+    sudo apt update && sudo apt build-dep qemu
+
+MacOS
+-----
+
+You first need to install `Homebrew <https://brew.sh/>`_. Then, use it to
+install dependencies:
+
+::
+
+    brew update && brew install $(brew deps --include-build qemu)
+
+Windows
+-------
+
+You first need to install `MSYS2 <https://www.msys2.org/>`_.
+MSYS2 offers `different environments <https://www.msys2.org/docs/environments/>`_.
+x86_64 environments are based on GCC, while aarch64 is based on Clang.
+
+We recommend to use MINGW64 for windows-x86_64 and CLANGARM64 for windows-aarch64
+(only available on windows-aarch64 hosts).
+
+Then, you can open a windows shell, and enter msys2 env using:
+
+::
+
+    c:/msys64/msys2_shell.cmd -defterm -here -no-start -mingw64
+    # Replace -ucrt64 by -clangarm64 or -ucrt64 for other environments.
+
+MSYS2 package manager does not offer a built-in way to install build
+dependencies. You can start with this list of packages using pacman:
+
+Note: Dependencies need to be installed again if you use a different MSYS2
+environment.
+
+::
+
+    # update MSYS2 itself, you need to reopen your shell at the end.
+    pacman -Syu
+    pacman -S \
+        base-devel binutils bison diffutils flex git grep make sed \
+        ${MINGW_PACKAGE_PREFIX}-toolchain \
+        ${MINGW_PACKAGE_PREFIX}-glib2 \
+        ${MINGW_PACKAGE_PREFIX}-gtk3 \
+        ${MINGW_PACKAGE_PREFIX}-libnfs \
+        ${MINGW_PACKAGE_PREFIX}-libssh \
+        ${MINGW_PACKAGE_PREFIX}-ninja \
+        ${MINGW_PACKAGE_PREFIX}-pixman \
+        ${MINGW_PACKAGE_PREFIX}-pkgconf \
+        ${MINGW_PACKAGE_PREFIX}-python \
+        ${MINGW_PACKAGE_PREFIX}-SDL2 \
+        ${MINGW_PACKAGE_PREFIX}-zstd
+
+If you want to install all dependencies, it's possible to use recipe used to
+build QEMU in MSYS2 itself.
+
+::
+
+    pacman -S wget
+    wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/heads/master/mingw-w64-qemu/PKGBUILD
+    # Some packages may be missing for your environment, installation will still
+    # be done though.
+    makepkg -s PKGBUILD || true
+
+Build on windows-aarch64
+++++++++++++++++++++++++
+
+When trying to cross compile meson for x86_64 using UCRT64 or MINGW64 env,
+configure will run into an error because the cpu detected is not correct.
+
+Meson detects x86_64 processes emulated, so you need to manually set the cpu,
+and force a cross compilation (with empty prefix).
+
+::
+
+    ./configure --cpu=x86_64 --cross-prefix=
+
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
index 0023953be3..0745c81a26 100644
--- a/docs/devel/index-build.rst
+++ b/docs/devel/index-build.rst
@@ -8,6 +8,7 @@ some of the basics if you are adding new files and targets to the build.
    :maxdepth: 3
 
    build-system
+   build-environment
    kconfig
    docs
    qapi-code-gen
-- 
2.39.5
