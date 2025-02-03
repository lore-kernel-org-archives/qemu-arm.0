Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a59855sm763310266b.180.2025.02.03.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:40:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 673165FB89;
	Mon,  3 Feb 2025 14:40:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	Peter Xu <peterx@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-rust@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 08/18] tests/qtest/migration: Add --full option
Date: Mon,  3 Feb 2025 14:40:38 +0000
Message-Id: <20250203144048.2131117-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +ppqbNESKw1M

From: Fabiano Rosas <farosas@suse.de>

Add a new command line option to allow selecting between running the
full set of tests or a smaller set of tests. The default will be to
run the small set (i.e. no comand line option provided) so we can
reduce the amount of tests run by default. Only hosts which support
KVM for the target architecture being tested will run the complete set
of tests.

Adjust the meson.build file to pass in the --full option when
appropriate.

(for now, set the option unconditionally until the next patch actually
creates the small set)

Use cases:

configure --target-list=aarch64-softmmu,ppc64-softmmu,s390x-softmmu,x86_64-softmmu

                        | before - 615s/244 tests  | after - 244s/100 tests
------------------------+--------------------------+-----------------------------
make check              | full set for all archs   | full set for the KVM arch,
make check-qtest        |                          | small set for the rest
                        |                          |
qemu-system-$ARCH       | full set for $ARCH       | small set for $ARCH, KVM or
./migration-test        |                          | TCG automatically chosen
                        |                          |
qemu-system-$ARCH       | N/A                      | full set for $ARCH, KVM or
./migration-test --full |                          | TCG automatically chosen
                        |                          |
migration-compat-x86_64 | full set for x86_64      | small set for x86_64
CI job                  |                          |
------------------------+--------------------------+-----------------------------

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20250130184012.5711-2-farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/migration/framework.h         |  1 +
 tests/qtest/migration-test.c              | 26 +++++++++++++++++++++++
 tests/qtest/migration/compression-tests.c |  4 ++++
 tests/qtest/migration/cpr-tests.c         |  4 ++++
 tests/qtest/migration/file-tests.c        |  4 ++++
 tests/qtest/migration/misc-tests.c        |  4 ++++
 tests/qtest/migration/postcopy-tests.c    |  4 ++++
 tests/qtest/migration/precopy-tests.c     |  4 ++++
 tests/qtest/migration/tls-tests.c         |  4 ++++
 tests/qtest/meson.build                   | 11 +++++++++-
 10 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration/framework.h b/tests/qtest/migration/framework.h
index cb4a984700..e4a11870f6 100644
--- a/tests/qtest/migration/framework.h
+++ b/tests/qtest/migration/framework.h
@@ -24,6 +24,7 @@ typedef struct MigrationTestEnv {
     bool uffd_feature_thread_id;
     bool has_dirty_ring;
     bool is_x86;
+    bool full_set;
     const char *arch;
     const char *qemu_src;
     const char *qemu_dst;
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5cad5060b3..61180fcbd5 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -14,13 +14,39 @@
 #include "migration/framework.h"
 #include "qemu/module.h"
 
+static void parse_args(int *argc_p, char ***argv_p, bool *full_set)
+{
+    int argc = *argc_p;
+    char **argv = *argv_p;
+    int i, j;
+
+    j = 1;
+    for (i = 1; i < argc; i++) {
+        if (g_str_equal(argv[i], "--full")) {
+            *full_set = true;
+            continue;
+        }
+        argv[j++] = argv[i];
+        if (i >= j) {
+            argv[i] = NULL;
+        }
+    }
+    *argc_p = j;
+}
+
 int main(int argc, char **argv)
 {
     MigrationTestEnv *env;
     int ret;
+    bool full_set = false;
+
+    /* strip the --full option if it's present */
+    parse_args(&argc, &argv, &full_set);
 
     g_test_init(&argc, &argv, NULL);
     env = migration_get_env();
+    env->full_set = full_set;
+    env->full_set = true; /* temporary */
     module_call_init(MODULE_INIT_QOM);
 
     migration_test_add_tls(env);
diff --git a/tests/qtest/migration/compression-tests.c b/tests/qtest/migration/compression-tests.c
index d78f1f11f1..9d0a258d51 100644
--- a/tests/qtest/migration/compression-tests.c
+++ b/tests/qtest/migration/compression-tests.c
@@ -155,6 +155,10 @@ void migration_test_add_compression(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    if (!env->full_set) {
+        return;
+    }
+
 #ifdef CONFIG_ZSTD
     migration_test_add("/migration/multifd/tcp/plain/zstd",
                        test_multifd_tcp_zstd);
diff --git a/tests/qtest/migration/cpr-tests.c b/tests/qtest/migration/cpr-tests.c
index 215b0df8c0..b1651fe48c 100644
--- a/tests/qtest/migration/cpr-tests.c
+++ b/tests/qtest/migration/cpr-tests.c
@@ -104,6 +104,10 @@ void migration_test_add_cpr(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    if (!env->full_set) {
+        return;
+    }
+
     /*
      * Our CI system has problems with shared memory.
      * Don't run this test until we find a workaround.
diff --git a/tests/qtest/migration/file-tests.c b/tests/qtest/migration/file-tests.c
index 84225c8c33..5b190853a5 100644
--- a/tests/qtest/migration/file-tests.c
+++ b/tests/qtest/migration/file-tests.c
@@ -304,6 +304,10 @@ void migration_test_add_file(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    if (!env->full_set) {
+        return;
+    }
+
     migration_test_add("/migration/precopy/file",
                        test_precopy_file);
 
diff --git a/tests/qtest/migration/misc-tests.c b/tests/qtest/migration/misc-tests.c
index dda3707cf3..996256ef87 100644
--- a/tests/qtest/migration/misc-tests.c
+++ b/tests/qtest/migration/misc-tests.c
@@ -262,6 +262,10 @@ void migration_test_add_misc(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    if (!env->full_set) {
+        return;
+    }
+
     migration_test_add("/migration/bad_dest", test_baddest);
 #ifndef _WIN32
     migration_test_add("/migration/analyze-script", test_analyze_script);
diff --git a/tests/qtest/migration/postcopy-tests.c b/tests/qtest/migration/postcopy-tests.c
index daf7449f2c..b08cde3270 100644
--- a/tests/qtest/migration/postcopy-tests.c
+++ b/tests/qtest/migration/postcopy-tests.c
@@ -81,6 +81,10 @@ static void test_postcopy_preempt_recovery(void)
 
 void migration_test_add_postcopy(MigrationTestEnv *env)
 {
+    if (!env->full_set) {
+        return;
+    }
+
     if (env->has_uffd) {
         migration_test_add("/migration/postcopy/plain", test_postcopy);
         migration_test_add("/migration/postcopy/recovery/plain",
diff --git a/tests/qtest/migration/precopy-tests.c b/tests/qtest/migration/precopy-tests.c
index 436dbd98e8..c99a487bf1 100644
--- a/tests/qtest/migration/precopy-tests.c
+++ b/tests/qtest/migration/precopy-tests.c
@@ -955,6 +955,10 @@ void migration_test_add_precopy(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    if (!env->full_set) {
+        return;
+    }
+
     if (env->is_x86) {
         migration_test_add("/migration/precopy/unix/suspend/live",
                            test_precopy_unix_suspend_live);
diff --git a/tests/qtest/migration/tls-tests.c b/tests/qtest/migration/tls-tests.c
index 5704a1f992..aee56930ac 100644
--- a/tests/qtest/migration/tls-tests.c
+++ b/tests/qtest/migration/tls-tests.c
@@ -726,6 +726,10 @@ void migration_test_add_tls(MigrationTestEnv *env)
 {
     tmpfs = env->tmpfs;
 
+    if (!env->full_set) {
+        return;
+    }
+
     migration_test_add("/migration/precopy/unix/tls/psk",
                        test_precopy_unix_tls_psk);
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e60e92fe9d..1fa05e53a2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -404,6 +404,8 @@ foreach dir : target_dirs
   target_base = dir.split('-')[0]
   qtest_emulator = emulators['qemu-system-' + target_base]
   target_qtests = get_variable('qtests_' + target_base, []) + qtests_generic
+  has_kvm = ('CONFIG_KVM' in config_all_accel and host_os == 'linux'
+             and cpu == target_base and fs.exists('/dev/kvm'))
 
   test_deps = roms
   qtest_env = environment()
@@ -437,11 +439,18 @@ foreach dir : target_dirs
         test: executable(test, src, dependencies: deps)
       }
     endif
+
+    test_args = ['--tap', '-k']
+
+    if test == 'migration-test' and has_kvm
+      test_args += ['--full']
+    endif
+
     test('qtest-@0@/@1@'.format(target_base, test),
          qtest_executables[test],
          depends: [test_deps, qtest_emulator, emulator_modules],
          env: qtest_env,
-         args: ['--tap', '-k'],
+         args: test_args,
          protocol: 'tap',
          timeout: slow_qtests.get(test, 60),
          priority: slow_qtests.get(test, 60),
-- 
2.39.5
