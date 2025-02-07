Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4c8a3966sm995512a12.46.2025.02.07.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:31:20 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3CACA60870;
	Fri,  7 Feb 2025 15:31:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Kyle Evans <kevans@freebsd.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-rust@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 09/17] tests/qtest/migration: Pick smoke tests
Date: Fri,  7 Feb 2025 15:31:04 +0000
Message-Id: <20250207153112.3939799-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YYwkS4sGNB7+

From: Fabiano Rosas <farosas@suse.de>

Choose a few tests per group and move them from the full set to the
smoke set.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20250130184012.5711-3-farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/migration-test.c              |  1 -
 tests/qtest/migration/compression-tests.c | 11 ++++++---
 tests/qtest/migration/cpr-tests.c         |  2 ++
 tests/qtest/migration/file-tests.c        | 17 +++++++++-----
 tests/qtest/migration/misc-tests.c        | 12 +++++++---
 tests/qtest/migration/postcopy-tests.c    | 18 ++++++++++-----
 tests/qtest/migration/precopy-tests.c     | 27 ++++++++++++++---------
 tests/qtest/migration/tls-tests.c         | 10 +++++++--
 8 files changed, 67 insertions(+), 31 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 61180fcbd5..0893687174 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -46,7 +46,6 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     env = migration_get_env();
     env->full_set = full_set;
-    env->full_set = true; /* temporary */
     module_call_init(MODULE_INIT_QOM);
 
     migration_test_add_tls(env);
diff --git a/tests/qtest/migration/compression-tests.c b/tests/qtest/migration/compression-tests.c
index 9d0a258d51..8b58401b84 100644
--- a/tests/qtest/migration/compression-tests.c
+++ b/tests/qtest/migration/compression-tests.c
@@ -151,10 +151,18 @@ static void test_multifd_tcp_zlib(void)
     test_precopy_common(&args);
 }
 
+static void migration_test_add_compression_smoke(MigrationTestEnv *env)
+{
+    migration_test_add("/migration/multifd/tcp/plain/zlib",
+                       test_multifd_tcp_zlib);
+}
+
 void migration_test_add_compression(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    migration_test_add_compression_smoke(env);
+
     if (!env->full_set) {
         return;
     }
@@ -183,7 +191,4 @@ void migration_test_add_compression(MigrationTestEnv *env)
         migration_test_add("/migration/precopy/unix/xbzrle",
                            test_precopy_unix_xbzrle);
     }
-
-    migration_test_add("/migration/multifd/tcp/plain/zlib",
-                       test_multifd_tcp_zlib);
 }
diff --git a/tests/qtest/migration/cpr-tests.c b/tests/qtest/migration/cpr-tests.c
index b1651fe48c..4758841824 100644
--- a/tests/qtest/migration/cpr-tests.c
+++ b/tests/qtest/migration/cpr-tests.c
@@ -104,6 +104,8 @@ void migration_test_add_cpr(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    /* no tests in the smoke set for now */
+
     if (!env->full_set) {
         return;
     }
diff --git a/tests/qtest/migration/file-tests.c b/tests/qtest/migration/file-tests.c
index 5b190853a5..f474b3590a 100644
--- a/tests/qtest/migration/file-tests.c
+++ b/tests/qtest/migration/file-tests.c
@@ -300,17 +300,25 @@ static void test_multifd_file_mapped_ram_fdset_dio(void)
 }
 #endif /* !_WIN32 */
 
+static void migration_test_add_file_smoke(MigrationTestEnv *env)
+{
+    migration_test_add("/migration/precopy/file",
+                       test_precopy_file);
+
+    migration_test_add("/migration/multifd/file/mapped-ram/dio",
+                       test_multifd_file_mapped_ram_dio);
+}
+
 void migration_test_add_file(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    migration_test_add_file_smoke(env);
+
     if (!env->full_set) {
         return;
     }
 
-    migration_test_add("/migration/precopy/file",
-                       test_precopy_file);
-
     migration_test_add("/migration/precopy/file/offset",
                        test_precopy_file_offset);
 #ifndef _WIN32
@@ -330,9 +338,6 @@ void migration_test_add_file(MigrationTestEnv *env)
     migration_test_add("/migration/multifd/file/mapped-ram/live",
                        test_multifd_file_mapped_ram_live);
 
-    migration_test_add("/migration/multifd/file/mapped-ram/dio",
-                       test_multifd_file_mapped_ram_dio);
-
 #ifndef _WIN32
     migration_test_add("/migration/multifd/file/mapped-ram/fdset",
                        test_multifd_file_mapped_ram_fdset);
diff --git a/tests/qtest/migration/misc-tests.c b/tests/qtest/migration/misc-tests.c
index 996256ef87..d03199f3c5 100644
--- a/tests/qtest/migration/misc-tests.c
+++ b/tests/qtest/migration/misc-tests.c
@@ -258,18 +258,24 @@ static void test_validate_uri_channels_none_set(void)
     do_test_validate_uri_channel(&args);
 }
 
+static void migration_test_add_misc_smoke(MigrationTestEnv *env)
+{
+#ifndef _WIN32
+    migration_test_add("/migration/analyze-script", test_analyze_script);
+#endif
+}
+
 void migration_test_add_misc(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    migration_test_add_misc_smoke(env);
+
     if (!env->full_set) {
         return;
     }
 
     migration_test_add("/migration/bad_dest", test_baddest);
-#ifndef _WIN32
-    migration_test_add("/migration/analyze-script", test_analyze_script);
-#endif
 
     /*
      * Our CI system has problems with shared memory.
diff --git a/tests/qtest/migration/postcopy-tests.c b/tests/qtest/migration/postcopy-tests.c
index b08cde3270..7e84e60fea 100644
--- a/tests/qtest/migration/postcopy-tests.c
+++ b/tests/qtest/migration/postcopy-tests.c
@@ -79,18 +79,26 @@ static void test_postcopy_preempt_recovery(void)
     test_postcopy_recovery_common(&args);
 }
 
-void migration_test_add_postcopy(MigrationTestEnv *env)
+static void migration_test_add_postcopy_smoke(MigrationTestEnv *env)
 {
-    if (!env->full_set) {
-        return;
-    }
-
     if (env->has_uffd) {
         migration_test_add("/migration/postcopy/plain", test_postcopy);
         migration_test_add("/migration/postcopy/recovery/plain",
                            test_postcopy_recovery);
         migration_test_add("/migration/postcopy/preempt/plain",
                            test_postcopy_preempt);
+    }
+}
+
+void migration_test_add_postcopy(MigrationTestEnv *env)
+{
+    migration_test_add_postcopy_smoke(env);
+
+    if (!env->full_set) {
+        return;
+    }
+
+    if (env->has_uffd) {
         migration_test_add("/migration/postcopy/preempt/recovery/plain",
                            test_postcopy_preempt_recovery);
 
diff --git a/tests/qtest/migration/precopy-tests.c b/tests/qtest/migration/precopy-tests.c
index c99a487bf1..b16f10e908 100644
--- a/tests/qtest/migration/precopy-tests.c
+++ b/tests/qtest/migration/precopy-tests.c
@@ -951,14 +951,8 @@ static void test_dirty_limit(void)
     migrate_end(from, to, true);
 }
 
-void migration_test_add_precopy(MigrationTestEnv *env)
+static void migration_test_add_precopy_smoke(MigrationTestEnv *env)
 {
-    tmpfs = env->tmpfs;
-
-    if (!env->full_set) {
-        return;
-    }
-
     if (env->is_x86) {
         migration_test_add("/migration/precopy/unix/suspend/live",
                            test_precopy_unix_suspend_live);
@@ -970,6 +964,21 @@ void migration_test_add_precopy(MigrationTestEnv *env)
                        test_precopy_unix_plain);
 
     migration_test_add("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
+    migration_test_add("/migration/multifd/tcp/uri/plain/none",
+                       test_multifd_tcp_uri_none);
+    migration_test_add("/migration/multifd/tcp/plain/cancel",
+                       test_multifd_tcp_cancel);
+}
+
+void migration_test_add_precopy(MigrationTestEnv *env)
+{
+    tmpfs = env->tmpfs;
+
+    migration_test_add_precopy_smoke(env);
+
+    if (!env->full_set) {
+        return;
+    }
 
     migration_test_add("/migration/precopy/tcp/plain/switchover-ack",
                        test_precopy_tcp_switchover_ack);
@@ -993,16 +1002,12 @@ void migration_test_add_precopy(MigrationTestEnv *env)
                                test_dirty_limit);
         }
     }
-    migration_test_add("/migration/multifd/tcp/uri/plain/none",
-                       test_multifd_tcp_uri_none);
     migration_test_add("/migration/multifd/tcp/channels/plain/none",
                        test_multifd_tcp_channels_none);
     migration_test_add("/migration/multifd/tcp/plain/zero-page/legacy",
                        test_multifd_tcp_zero_page_legacy);
     migration_test_add("/migration/multifd/tcp/plain/zero-page/none",
                        test_multifd_tcp_no_zero_page);
-    migration_test_add("/migration/multifd/tcp/plain/cancel",
-                       test_multifd_tcp_cancel);
     if (g_str_equal(env->arch, "x86_64")
         && env->has_kvm && env->has_dirty_ring) {
 
diff --git a/tests/qtest/migration/tls-tests.c b/tests/qtest/migration/tls-tests.c
index aee56930ac..2cb4a44bcd 100644
--- a/tests/qtest/migration/tls-tests.c
+++ b/tests/qtest/migration/tls-tests.c
@@ -722,10 +722,18 @@ static void test_multifd_tcp_tls_x509_reject_anon_client(void)
 }
 #endif /* CONFIG_TASN1 */
 
+static void migration_test_add_tls_smoke(MigrationTestEnv *env)
+{
+    migration_test_add("/migration/precopy/tcp/tls/psk/match",
+                       test_precopy_tcp_tls_psk_match);
+}
+
 void migration_test_add_tls(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    migration_test_add_tls_smoke(env);
+
     if (!env->full_set) {
         return;
     }
@@ -755,8 +763,6 @@ void migration_test_add_tls(MigrationTestEnv *env)
                        test_precopy_unix_tls_x509_override_host);
 #endif /* CONFIG_TASN1 */
 
-    migration_test_add("/migration/precopy/tcp/tls/psk/match",
-                       test_precopy_tcp_tls_psk_match);
     migration_test_add("/migration/precopy/tcp/tls/psk/mismatch",
                        test_precopy_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
-- 
2.39.5
