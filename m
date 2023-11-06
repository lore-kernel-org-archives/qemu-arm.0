Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c138700b0040836519dd9sm13208168wmf.25.2023.11.06.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:51:19 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8AED6655DF;
	Mon,  6 Nov 2023 18:51:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 12/22] configure: tell meson and contrib_plugins about DLLTOOL
Date: Mon,  6 Nov 2023 18:51:02 +0000
Message-Id: <20231106185112.2755262-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cvr26wUzRB2O

To cleanly handle cross-building we need to export the details of
dlltool into meson's list of cross binaries and into the
contrib/plugins/ make configuration.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Greg Manning <gmanning@rapitasystems.com>
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index f1456f6123..cd6c521bd8 100755
--- a/configure
+++ b/configure
@@ -309,6 +309,7 @@ fi
 ar="${AR-${cross_prefix}ar}"
 as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
+dlltool="${DLLTOOL-${cross_prefix}dlltool}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
@@ -1659,6 +1660,9 @@ echo "SRC_PATH=$source_path/contrib/plugins" >> contrib/plugins/$config_host_mak
 echo "PKG_CONFIG=${pkg_config}" >> contrib/plugins/$config_host_mak
 echo "CC=$cc $CPU_CFLAGS" >> contrib/plugins/$config_host_mak
 echo "CFLAGS=${CFLAGS-$default_cflags} $EXTRA_CFLAGS" >> contrib/plugins/$config_host_mak
+if test "$targetos" = windows; then
+  echo "DLLTOOL=$dlltool" >> contrib/plugins/$config_host_mak
+fi
 if test "$targetos" = darwin; then
   echo "CONFIG_DARWIN=y" >> contrib/plugins/$config_host_mak
 fi
@@ -1764,6 +1768,7 @@ if test "$skip_meson" = no; then
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
   test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
   echo "ar = [$(meson_quote $ar)]" >> $cross
+  echo "dlltool = [$(meson_quote $dlltool)]" >> $cross
   echo "nm = [$(meson_quote $nm)]" >> $cross
   echo "pkgconfig = [$(meson_quote $pkg_config)]" >> $cross
   echo "pkg-config = [$(meson_quote $pkg_config)]" >> $cross
@@ -1869,6 +1874,7 @@ preserve_env CC
 preserve_env CFLAGS
 preserve_env CXX
 preserve_env CXXFLAGS
+preserve_env DLLTOOL
 preserve_env LD
 preserve_env LDFLAGS
 preserve_env LD_LIBRARY_PATH
-- 
2.39.2
