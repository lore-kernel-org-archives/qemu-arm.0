Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y23-20020a05600c341700b00406408dc788sm12869598wmp.44.2023.11.06.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:58:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E75A265760;
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
Subject: [PATCH 16/22] plugins: allow plugins to be enabled on windows
Date: Mon,  6 Nov 2023 18:51:06 +0000
Message-Id: <20231106185112.2755262-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ps6TgvocdHbu

From: Greg Manning <gmanning@rapitasystems.com>

allow plugins to be enabled in the configure script on windows. Also,
add the qemu_plugin_api.lib to the installer.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-5-gmanning@rapitasystems.com>
[AJB: add check for dlltool to configure]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231103195956.1998255-30-alex.bennee@linaro.org>
---
 configure   | 4 ++--
 meson.build | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index e50ec99fe2..abcb199aa8 100755
--- a/configure
+++ b/configure
@@ -1011,9 +1011,9 @@ if test "$targetos" = "bogus"; then
 fi
 
 # test for any invalid configuration combinations
-if test "$targetos" = "windows"; then
+if test "$targetos" = "windows" && ! has "$dlltool"; then
   if test "$plugins" = "yes"; then
-    error_exit "TCG plugins not currently supported on Windows platforms"
+    error_exit "TCG plugins requires dlltool to build on Windows platforms"
   fi
   plugins="no"
 fi
diff --git a/meson.build b/meson.build
index dcef8b1e79..b855224acc 100644
--- a/meson.build
+++ b/meson.build
@@ -3904,6 +3904,11 @@ endforeach
 
 if get_option('plugins')
   install_headers('include/qemu/qemu-plugin.h')
+  if targetos == 'windows'
+    # On windows, we want to deliver the qemu_plugin_api.lib file in the qemu installer,
+    # so that plugin authors can compile against it.
+    install_data(win32_qemu_plugin_api_lib, install_dir: 'lib')
+  endif
 endif
 
 subdir('qga')
-- 
2.39.2
