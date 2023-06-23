Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0030aefa3a957sm9442679wrs.28.2023.06.23.05.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D844C1FFCA;
	Fri, 23 Jun 2023 13:21:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 19/26] plugins: fix memory leak while parsing options
Date: Fri, 23 Jun 2023 13:20:53 +0100
Message-Id: <20230623122100.1640995-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4uuuHu3QxteY

It was hard to track down this leak as it was an internal allocation
by glib and the backtraces did not give much away. The autofree was
freeing the allocation with g_free() but not taking care of the
individual strings. They should have been freed with g_strfreev()
instead.

Searching the glib source code for the correct string free function
led to:

  G_DEFINE_AUTO_CLEANUP_FREE_FUNC(GStrv, g_strfreev, NULL)

and indeed if you read to the bottom of the documentation page you
will find:

  typedef gchar** GStrv;

  A typedef alias for gchar**. This is mostly useful when used together with g_auto().

So fix up all the g_autofree g_strsplit case that smugly thought they
had de-allocation covered.

Message-Id: <20230519170454.2353945-3-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c     | 2 +-
 contrib/plugins/drcov.c     | 2 +-
 contrib/plugins/execlog.c   | 2 +-
 contrib/plugins/hotblocks.c | 2 +-
 contrib/plugins/hotpages.c  | 2 +-
 contrib/plugins/howvec.c    | 2 +-
 contrib/plugins/hwprofile.c | 2 +-
 contrib/plugins/lockstep.c  | 2 +-
 tests/plugin/bb.c           | 2 +-
 tests/plugin/insn.c         | 2 +-
 tests/plugin/mem.c          | 2 +-
 tests/plugin/syscall.c      | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 2e25184a7f..5036213f1b 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -772,7 +772,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
 
         if (g_strcmp0(tokens[0], "iblksize") == 0) {
             l1_iblksize = STRTOLL(tokens[1]);
diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
index b4a855adaf..686ae0a537 100644
--- a/contrib/plugins/drcov.c
+++ b/contrib/plugins/drcov.c
@@ -148,7 +148,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
     for (int i = 0; i < argc; i++) {
-        g_autofree char **tokens = g_strsplit(argv[i], "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(argv[i], "=", 2);
         if (g_strcmp0(tokens[0], "filename") == 0) {
             file_name = g_strdup(tokens[1]);
         }
diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index e255bd21fd..7129d526f8 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -227,7 +227,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
         if (g_strcmp0(tokens[0], "ifilter") == 0) {
             parse_insn_match(tokens[1]);
         } else if (g_strcmp0(tokens[0], "afilter") == 0) {
diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 062200a7a4..6b74d25fea 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -135,7 +135,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 {
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
         if (g_strcmp0(tokens[0], "inline") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index 0d12910af6..8316ae50c7 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -169,7 +169,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", -1);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", -1);
 
         if (g_strcmp0(tokens[0], "sortby") == 0) {
             if (g_strcmp0(tokens[1], "reads") == 0) {
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 4a5ec3d936..0ed01ea931 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -333,7 +333,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *p = argv[i];
-        g_autofree char **tokens = g_strsplit(p, "=", -1);
+        g_auto(GStrv) tokens = g_strsplit(p, "=", -1);
         if (g_strcmp0(tokens[0], "inline") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
                 fprintf(stderr, "boolean argument parsing failed: %s\n", p);
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 691d4edb0c..739ac0c66b 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -263,7 +263,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
 
         if (g_strcmp0(tokens[0], "track") == 0) {
             if (g_strcmp0(tokens[1], "read") == 0) {
diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index a41ffe83fa..e36f0b9562 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -323,7 +323,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *p = argv[i];
-        g_autofree char **tokens = g_strsplit(p, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(p, "=", 2);
 
         if (g_strcmp0(tokens[0], "verbose") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &verbose)) {
diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index 7d470a1011..df50d1fd3b 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -104,7 +104,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
         if (g_strcmp0(tokens[0], "inline") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index cd5ea5d4ae..e251a84d86 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -196,7 +196,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 {
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
         if (g_strcmp0(tokens[0], "inline") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index 4570f7d815..f3b9f696a0 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -83,7 +83,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
 
         if (g_strcmp0(tokens[0], "haddr") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_haddr)) {
diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 96040c578f..72e1a5bf90 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -121,7 +121,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (int i = 0; i < argc; i++) {
         char *opt = argv[i];
-        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
 
         if (g_strcmp0(tokens[0], "print") == 0) {
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_print)) {
-- 
2.39.2
