Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b00405bbfd5d16sm3567011wms.7.2023.11.03.13.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D4D4D65759;
	Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 29/29] plugins: allow plugins to be enabled on windows
Date: Fri,  3 Nov 2023 19:59:56 +0000
Message-Id: <20231103195956.1998255-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aTPak21i+EQ8

From: Greg Manning <gmanning@rapitasystems.com>

allow plugins to be enabled in the configure script on windows. Also,
add the qemu_plugin_api.lib to the installer.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-5-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure   | 6 ------
 meson.build | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 04f2cdd166..1129e6dd94 100755
--- a/configure
+++ b/configure
@@ -1010,12 +1010,6 @@ if test "$targetos" = "bogus"; then
 fi
 
 # test for any invalid configuration combinations
-if test "$targetos" = "windows"; then
-  if test "$plugins" = "yes"; then
-    error_exit "TCG plugins not currently supported on Windows platforms"
-  fi
-  plugins="no"
-fi
 if test "$tcg" = "disabled" ; then
   if test "$plugins" = "yes"; then
     error_exit "Can't enable plugins on non-TCG builds"
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
