Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b137sm20168534wme.26.2020.01.14.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 07:18:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CF17D1FF9F;
	Tue, 14 Jan 2020 15:09:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 16/22] configure: allow user to specify what gdb to use
Date: Tue, 14 Jan 2020 15:09:47 +0000
Message-Id: <20200114150953.27659-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114150953.27659-1-alex.bennee@linaro.org>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Op7Q0TtE052F

This is useful, especially when testing relatively new gdbstub
features that might not be in distro packages yet.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure b/configure
index 08c3a1c1f0..df702a708f 100755
--- a/configure
+++ b/configure
@@ -303,6 +303,7 @@ libs_qga=""
 debug_info="yes"
 stack_protector=""
 use_containers="yes"
+gdb_bin=$(command -v "gdb")
 
 if test -e "$source_path/.git"
 then
@@ -1540,6 +1541,8 @@ for opt do
   ;;
   --disable-containers) use_containers="no"
   ;;
+  --with-gdb=*) gdb_bin="$optarg"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1724,6 +1727,7 @@ Advanced options (experts only):
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
+  --with-gdb=GBB-path      gdb to use for gdbstub tests [$gdb_bin]
 
 Optional features, enabled with --enable-FEATURE and
 disabled with --disable-FEATURE, default is enabled if available:
@@ -6576,6 +6580,7 @@ echo "libpmem support   $libpmem"
 echo "libudev           $libudev"
 echo "default devices   $default_devices"
 echo "plugin support    $plugins"
+echo "gdb               $gdb_bin"
 
 if test "$supported_cpu" = "no"; then
     echo
@@ -7422,6 +7427,10 @@ if test "$plugins" = "yes" ; then
     fi
 fi
 
+if test -n "$gdb_bin" ; then
+    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+fi
+
 if test "$tcg_interpreter" = "yes"; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
 elif test "$ARCH" = "sparc64" ; then
-- 
2.20.1
