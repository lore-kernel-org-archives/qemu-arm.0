Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C02C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:12:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMWv-0004Fo-6n; Sat, 26 Sep 2026 03:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSk-00069V-Kf
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:50 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSg-0000mL-Py
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:46 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-33be7dfcfc1so2110827eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406281; x=1791011081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=21fhjDvzKpky6Ku2sIynCg3uBBBTvKEqFg0qhvihs/4=;
 b=e6+0J5uBddHayJQw9IpRPeNOjf+b6lxuBcX+AjEVcbLGqX8zksP9zflEVwERDnENl+
 Nb7hduXsHyJzj7O7c9/tceOUgF1zVk3CKvwA8aB5HLbY3wT2KgwKas2xc3IUZ/OTwtRl
 hCVreQ/VP5D6pmwqq4BEzcazVJEt8Io5x4Ub7VSI/7mxi+jX/65NxvBcf7a9t1P6ZGA0
 S/s/4b3m5EZYnrOn5tL5QtVzJm9oLRIGpwKD8J7CWIdkCJN/cIWT7fcfHKbzWSlCgvM/
 kglihz57rlZXLoy9gwLy0ZgZF9zzpRuTbVI8N5L9TumNv+tvpq4JuzCRoZfq4c9KoQiY
 3rmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406281; x=1791011081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=21fhjDvzKpky6Ku2sIynCg3uBBBTvKEqFg0qhvihs/4=;
 b=OCdAuBKdM6ljbwwsMndZ8Gj874HChSXTP7/LaMGQeFGmS49usviECk69E+ZX3g3D+2
 6XcO6G2KgG1wORqIbJ5uPs1Gb8t/S8iDLGYS1DVJrjfj9xXh4dvU7JG1NMa3VtD+Qejf
 IoBmOfirjSEMe3S8mAzwE7Z9tPeKa+xz1H7dTQ9DK/Ua2yxOlNfjK1yaTfoacDdBVDGh
 Ax4p/arLVN2NEDqS49IYe9stYlhieffeGhjNwcrEClR9aeRbVQN6IxyRKJi11kxkmVBz
 A7RtE3Axii8kqyY83MjzlivIXRwzCvSA1khNuM+1hx1ZTgfyYIf1UWQYSM3EhHpn22lj
 LIWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwx+xDHyx5pw6RGAlrsf0AEOq65rVNlY1lH1/eB+x0sf6RGbwQfq1ShewyxtaJrqjDgaZWgyLtMUA==@nongnu.org
X-Gm-Message-State: AFuF++m7zBEfZYnPDi/zLdiDiCCPDGEpGnFysjHZ781TuAWFK1sgIkhq
 yUFBI1ng30B3qLq+GiPwzszosije0a7LP+dA9qbzG2IZBFC7+b3bNYYX
X-Gm-Gg: AYBFou3ZvpJ3rLFVW77utsAcgJQ6GOwvthcz9iznW++bzO10DhtoWrZU6XcTy1fLgxW
 FK1F3A3vf7VZf9LpC8/VRqHODHBr6TSwdicJN9u+pusaVGW6OLfb5Gg8UhtCM/CGIWE5Enz0D5/
 HuN+rKSUnXPQ8VXkOGqkot9tcAsxdV4ThSpGXRyhVvdZ8hixaLlYsxhLX+gnK+FgPyF3tUWfqfE
 P6UDVnjImGm2U3bFHysdXEoseV8O6MfghuKhAgx4SVr24ZV96vGofPXLmEQxef0NPmQIrC4oo3Z
 P1j3d6LB8cJuBrFqtWLsiH4kh5tpthcUcn2qTNkKH+XQJEjhZgYjITIwMlBChWKI7PNJtBj8Z3m
 E1tvWhzKlulv6nYOaiVZO3qrkHu4pe/hp1NrnhgmDH3GcEEXFnov2b1wKqcnMpRrCBVBPgauXuk
 ZWRgd+AsEGFqFDRnNXGwRC3lbnNKcLmamiQ4Dhco8/uHVgnBbfY4BTtZ81LFfMi8OPtH/ocORfM
 r0T/4LiM6VHyAjQt0AxFw/3h2G59ok=
X-Received: by 2002:a05:7301:fd06:b0:342:94b:aa28 with SMTP id
 5a478bee46e88-3427236effamr2094539eec.27.1790406280135; 
 Sat, 26 Sep 2026 00:04:40 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:04:39 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 55/55] tests/qtest: cover combined qemu-system machines
Date: Sat, 26 Sep 2026 15:00:54 +0800
Message-ID: <20260926070057.1234-56-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The combined qemu-system qtests check the linked machine list and
arch-prefixed -M help and errors. -readconfig [machine] type uses
arch:name, and a later bare -M keeps that prefix. The expected
arches come from single_binary_targets, plus none and the none
machine. Single-target binaries keep the historic -M cases.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                                   |   2 +
 .../qtest/machine-list-combined-targets.h.in  |   4 +
 tests/qtest/machine-list-combined-test.c      | 104 +++
 tests/qtest/machine-option-test.c             | 714 ++++++++++++++++++
 tests/qtest/meson.build                       |  38 +
 5 files changed, 862 insertions(+)
 create mode 100644 tests/qtest/machine-list-combined-targets.h.in
 create mode 100644 tests/qtest/machine-list-combined-test.c
 create mode 100644 tests/qtest/machine-option-test.c

diff --git a/meson.build b/meson.build
index 96f493cb746..085151d65f8 100644
--- a/meson.build
+++ b/meson.build
@@ -4294,6 +4294,7 @@ single_binary_bases = {}
 single_binary_deps = []
 single_binary_crates = []
 single_binary_available = false
+single_binary_targets = []
 
 single_binary_supported_targets = [
   'aarch64-softmmu',
@@ -4496,6 +4497,7 @@ foreach target : target_dirs
       single_binary_deps += target_stubs
       single_binary_crates += main_rs
       single_binary_available = true
+      single_binary_targets += target_name
     endif
     execs = [{
       'name': 'qemu-system-' + target_name,
diff --git a/tests/qtest/machine-list-combined-targets.h.in b/tests/qtest/machine-list-combined-targets.h.in
new file mode 100644
index 00000000000..ede99c53762
--- /dev/null
+++ b/tests/qtest/machine-list-combined-targets.h.in
@@ -0,0 +1,4 @@
+/* Generated from configured single_binary_supported_targets. */
+static const char * const combined_targets[] = {
+@COMBINED_TARGETS@
+};
diff --git a/tests/qtest/machine-list-combined-test.c b/tests/qtest/machine-list-combined-test.c
new file mode 100644
index 00000000000..90c4ae7b377
--- /dev/null
+++ b/tests/qtest/machine-list-combined-test.c
@@ -0,0 +1,104 @@
+/*
+ * Combined qemu-system machine list tests.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqtest.h"
+#include "qobject/qdict.h"
+#include "qobject/qlist.h"
+#include "qobject/qstring.h"
+
+#include "machine-list-test.inc.h"
+
+#include "machine-list-combined-targets.h"
+
+static bool qemu_binary_is_combined(void)
+{
+    const char *bin = qtest_qemu_binary(NULL);
+
+    return g_str_has_suffix(bin, "qemu-system") ||
+           g_str_has_suffix(bin, "qemu-system.exe");
+}
+
+static QList *query_targets(QTestState *qts)
+{
+    QDict *resp;
+    QList *list;
+
+    resp = qtest_qmp(qts, "{'execute': 'query-targets'}");
+    g_assert(qdict_haskey(resp, "return"));
+    list = qdict_get_qlist(resp, "return");
+    qobject_ref(list);
+    qobject_unref(resp);
+    return list;
+}
+
+static QDict *target_entry(QList *targets, const char *arch,
+                           const char *endianness)
+{
+    const QListEntry *e;
+
+    for (e = qlist_first(targets); e; e = qlist_next(e)) {
+        QDict *t = qobject_to(QDict, qlist_entry_obj(e));
+
+        if (!strcmp(qdict_get_str(t, "arch"), arch) &&
+            !strcmp(qdict_get_str(t, "endianness"), endianness)) {
+            return t;
+        }
+    }
+    return NULL;
+}
+
+static void test_combined_machine_list(void)
+{
+    QTestState *qts;
+    g_autoptr(QList) targets = NULL;
+    size_t i;
+
+    qts = qtest_init("-nodefaults -M none");
+    read_accel_flags(qts);
+    targets = query_targets(qts);
+    qtest_quit(qts);
+
+    g_assert_cmpuint(qlist_size(targets), ==,
+                     G_N_ELEMENTS(combined_targets) + 1);
+    for (i = 0; i < G_N_ELEMENTS(combined_targets); i++) {
+        const struct ShippedTarget *t = lookup_shipped_target(combined_targets[i]);
+        QDict *tgt;
+
+        g_assert_nonnull(t);
+        tgt = target_entry(targets, t->arch, t->endianness);
+        g_assert_nonnull(tgt);
+        assert_name_list(qdict_get_qlist(tgt, "machines"), t->name,
+                         t->machines, t->n_machines);
+    }
+    {
+        QDict *none = target_entry(targets, "none", "little");
+        QList *names;
+        const QListEntry *e;
+        bool saw_none = false;
+
+        g_assert_nonnull(none);
+        names = qdict_get_qlist(none, "machines");
+        for (e = qlist_first(names); e; e = qlist_next(e)) {
+            const char *name = qstring_get_str(qobject_to(QString,
+                                                          qlist_entry_obj(e)));
+
+            if (!strcmp(name, "none")) {
+                saw_none = true;
+            }
+        }
+        g_assert_true(saw_none);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_assert_true(qemu_binary_is_combined());
+    g_test_add_func("/machine-list/combined", test_combined_machine_list);
+    return g_test_run();
+}
diff --git a/tests/qtest/machine-option-test.c b/tests/qtest/machine-option-test.c
new file mode 100644
index 00000000000..4ccc854fba0
--- /dev/null
+++ b/tests/qtest/machine-option-test.c
@@ -0,0 +1,714 @@
+/*
+ * Combined and historic -M / -machine option tests.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqtest.h"
+#include "qobject/qdict.h"
+#include "qobject/qlist.h"
+#include "qobject/qstring.h"
+
+#include "machine-list-test.inc.h"
+
+static bool test_target_exists(const char *target_info);
+static bool spawn_args_targets_exist(const char *const *args);
+static bool cli_targets_exist(const char *cli);
+
+static bool qemu_binary_is_combined(void)
+{
+    const char *bin = qtest_qemu_binary(NULL);
+
+    return g_str_has_suffix(bin, "qemu-system") ||
+           g_str_has_suffix(bin, "qemu-system.exe");
+}
+
+static void spawn_qemu(gchar **out, gchar **err, int *code,
+                       const char *const *argv_tail)
+{
+    g_autoptr(GPtrArray) argv = g_ptr_array_new();
+    g_autofree gchar *stdout_buf = NULL;
+    g_autofree gchar *stderr_buf = NULL;
+    gint status = 0;
+    GError *gerr = NULL;
+    const char *const *p;
+
+    g_ptr_array_add(argv, (gpointer)qtest_qemu_binary(NULL));
+    for (p = argv_tail; *p; p++) {
+        g_ptr_array_add(argv, (gpointer)*p);
+    }
+    g_ptr_array_add(argv, NULL);
+
+    g_assert(g_spawn_sync(NULL, (char **)argv->pdata, NULL,
+                          G_SPAWN_DEFAULT, NULL, NULL,
+                          &stdout_buf, &stderr_buf, &status, &gerr));
+    g_assert_no_error(gerr);
+#ifdef _WIN32
+    *code = status;
+#else
+    g_assert(WIFEXITED(status));
+    *code = WEXITSTATUS(status);
+#endif
+    if (out) {
+        *out = g_steal_pointer(&stdout_buf);
+    }
+    if (err) {
+        *err = g_steal_pointer(&stderr_buf);
+    }
+}
+
+static void assert_spawn(const char *target_info, const char *const *args,
+                         int expect_code, const char *out_need,
+                         const char *err_need)
+{
+    g_autofree gchar *out = NULL;
+    g_autofree gchar *err = NULL;
+    int code;
+
+    if (!test_target_exists(target_info) ||
+        (target_info && !spawn_args_targets_exist(args))) {
+        return;
+    }
+    spawn_qemu(&out, &err, &code, args);
+    g_assert_cmpint(code, ==, expect_code);
+    if (out_need) {
+        g_assert_nonnull(strstr(out ? out : "", out_need));
+    }
+    if (err_need) {
+        g_assert_nonnull(strstr(err ? err : "", err_need));
+    }
+}
+
+static void assert_spawn_not(const char *target_info, const char *const *args,
+                             int expect_code, const char *out_need,
+                             const char *out_forbid)
+{
+    g_autofree gchar *out = NULL;
+    g_autofree gchar *err = NULL;
+    int code;
+
+    if (!test_target_exists(target_info) ||
+        (target_info && !spawn_args_targets_exist(args))) {
+        return;
+    }
+    spawn_qemu(&out, &err, &code, args);
+    g_assert_cmpint(code, ==, expect_code);
+    g_assert_nonnull(strstr(out ? out : "", out_need));
+    g_assert_null(strstr(out ? out : "", out_forbid));
+}
+
+static char *qom_machine_type(QTestState *qts)
+{
+    QDict *resp;
+    char *type;
+
+    resp = qtest_qmp(qts,
+                     "{'execute': 'qom-get', 'arguments':"
+                     " {'path': '/machine', 'property': 'type'}}");
+    g_assert(qdict_haskey(resp, "return"));
+    type = g_strdup(qdict_get_str(resp, "return"));
+    qobject_unref(resp);
+    return type;
+}
+
+static char *query_target_arch(QTestState *qts)
+{
+    QDict *resp, *ret;
+    char *arch;
+
+    resp = qtest_qmp(qts, "{'execute': 'query-target'}");
+    g_assert(qdict_haskey(resp, "return"));
+    ret = qdict_get_qdict(resp, "return");
+    arch = g_strdup(qdict_get_str(ret, "arch"));
+    qobject_unref(resp);
+    return arch;
+}
+
+/* query-target "arch" is SysEmuTarget, not always TARGET_NAME. */
+static const char *query_arch_for_target(const char *target_info)
+{
+    static const struct {
+        const char *target_name;
+        const char *arch;
+    } map[] = {
+        { "armeb", "arm" },
+        { "microblazeel", "microblaze" },
+        { "mips64el", "mips64" },
+        { "mipsel", "mips" },
+        { "ppc64le", "ppc64" },
+        { "sh4eb", "sh4" },
+        { "xtensaeb", "xtensa" },
+    };
+    size_t i;
+
+    for (i = 0; i < G_N_ELEMENTS(map); i++) {
+        if (!strcmp(target_info, map[i].target_name)) {
+            return map[i].arch;
+        }
+    }
+    return target_info;
+}
+
+static const struct ShippedTarget *lookup_shipped_arch(const char *arch,
+                                                       const char *endianness)
+{
+    size_t i;
+
+    for (i = 0; i < G_N_ELEMENTS(shipped_targets); i++) {
+        if (!strcmp(shipped_targets[i].arch, arch) &&
+            !strcmp(shipped_targets[i].endianness, endianness)) {
+            return &shipped_targets[i];
+        }
+    }
+    return NULL;
+}
+
+static const char *preferred_machine(const struct ShippedTarget *t)
+{
+    size_t i;
+
+    for (i = 0; i < t->n_machines; i++) {
+        if (!strcmp(t->machines[i], "virt")) {
+            return t->machines[i];
+        }
+    }
+    return t->n_machines ? t->machines[0] : NULL;
+}
+
+static bool help_section_header(const char *line, const char **name,
+                                size_t *name_len)
+{
+    size_t n;
+    size_t i;
+
+    if (!line[0]) {
+        return false;
+    }
+    n = strlen(line);
+    if (line[n - 1] != ':') {
+        return false;
+    }
+    for (i = 0; i < n - 1; i++) {
+        char c = line[i];
+
+        if (!g_ascii_isalnum(c) && c != '_' && c != '-' && c != '.') {
+            return false;
+        }
+    }
+    *name = line;
+    *name_len = n - 1;
+    return true;
+}
+
+/* First-column machine names. Aliases are omitted.
+ * only_section NULL keeps every section (historic help).
+ */
+static QList *names_from_help(const char *text, const char *only_section)
+{
+    g_auto(GStrv) lines = g_strsplit(text ? text : "", "\n", 0);
+    g_autofree char *section = NULL;
+    QList *names = qlist_new();
+    int i;
+
+    for (i = 0; lines[i]; i++) {
+        const char *line = lines[i];
+        const char *header;
+        size_t header_len;
+        const char *sp;
+        g_autofree char *tok = NULL;
+
+        if (help_section_header(line, &header, &header_len)) {
+            g_free(section);
+            section = g_strndup(header, header_len);
+            continue;
+        }
+        if (only_section &&
+            (!section || strcmp(section, only_section))) {
+            continue;
+        }
+        if (!line[0] || g_str_has_prefix(line, "Supported machines")) {
+            continue;
+        }
+        if (strstr(line, "(alias of ")) {
+            continue;
+        }
+        sp = line;
+        while (*sp && !g_ascii_isspace(*sp)) {
+            sp++;
+        }
+        if (sp == line) {
+            continue;
+        }
+        tok = g_strndup(line, sp - line);
+        qlist_append_str(names, tok);
+    }
+    return names;
+}
+
+static QList *query_targets(QTestState *qts)
+{
+    QDict *resp;
+    QList *list;
+
+    resp = qtest_qmp(qts, "{'execute': 'query-targets'}");
+    g_assert(qdict_haskey(resp, "return"));
+    list = qdict_get_qlist(resp, "return");
+    qobject_ref(list);
+    qobject_unref(resp);
+    return list;
+}
+
+static void read_accels(void)
+{
+    QTestState *qts = qtest_init("-nodefaults -M none");
+
+    read_accel_flags(qts);
+    qtest_quit(qts);
+}
+
+static bool combined_has_target(const char *target_info)
+{
+    g_autofree char *opt = g_strdup_printf("%s:help", target_info);
+    const char *args[] = { "-M", opt, NULL };
+    g_autofree gchar *err = NULL;
+    int code = 1;
+
+    spawn_qemu(NULL, &err, &code, args);
+    return code == 0;
+}
+
+static bool test_target_exists(const char *target_info)
+{
+    static GHashTable *cache;
+    gpointer cached;
+    gboolean have;
+
+    if (!target_info) {
+        return true;
+    }
+    if (!strcmp(target_info, "none")) {
+        return true;
+    }
+    if (!qemu_binary_is_combined()) {
+        return strcmp(target_info, qtest_get_arch()) == 0;
+    }
+    if (!cache) {
+        cache = g_hash_table_new(g_str_hash, g_str_equal);
+    }
+    if (g_hash_table_lookup_extended(cache, target_info, NULL, &cached)) {
+        return GPOINTER_TO_INT(cached);
+    }
+    have = combined_has_target(target_info);
+    g_hash_table_insert(cache, (gpointer)target_info, GINT_TO_POINTER(have));
+    return have;
+}
+
+static bool machine_optarg_targets_exist(const char *optarg)
+{
+    const char *type = optarg;
+    const char *colon;
+    g_autofree char *prefix = NULL;
+
+    if (!optarg) {
+        return true;
+    }
+    if (g_str_has_prefix(type, "type=")) {
+        type += 5;
+    }
+    colon = strchr(type, ':');
+    if (!colon || colon == type) {
+        return true;
+    }
+    prefix = g_strndup(type, colon - type);
+    return test_target_exists(prefix);
+}
+
+static bool spawn_args_targets_exist(const char *const *args)
+{
+    const char *const *p;
+
+    for (p = args; *p; p++) {
+        if ((!strcmp(*p, "-M") || !strcmp(*p, "-machine")) && p[1]) {
+            if (!machine_optarg_targets_exist(p[1])) {
+                return false;
+            }
+        }
+    }
+    return true;
+}
+
+static bool cli_targets_exist(const char *cli)
+{
+    g_auto(GStrv) tokens = g_strsplit(cli ? cli : "", " ", 0);
+    int i;
+
+    for (i = 0; tokens[i]; i++) {
+        if ((!strcmp(tokens[i], "-M") || !strcmp(tokens[i], "-machine")) &&
+            tokens[i + 1] && !machine_optarg_targets_exist(tokens[i + 1])) {
+            return false;
+        }
+    }
+    return true;
+}
+
+static void assert_run(const char *target_info, const char *cli,
+                       const char *type_need)
+{
+    QTestState *qts;
+    g_autofree char *got_arch = NULL;
+    g_autofree char *got_type = NULL;
+
+    if (!test_target_exists(target_info) || !cli_targets_exist(cli)) {
+        return;
+    }
+    qts = qtest_initf("-nodefaults %s", cli);
+    got_arch = query_target_arch(qts);
+    g_assert_cmpstr(got_arch, ==, query_arch_for_target(target_info));
+    if (type_need) {
+        got_type = qom_machine_type(qts);
+        g_assert_nonnull(strstr(got_type, type_need));
+    }
+    qtest_quit(qts);
+}
+
+static void test_combined_help(void)
+{
+    const char *help[] = { "-M", "help", NULL };
+    const char *qmark[] = { "-M", "?", NULL };
+    const char *aarch64_help[] = { "-M", "aarch64:help", NULL };
+    const char *aarch64_q[] = { "-M", "aarch64:?", NULL };
+    const char *riscv64_help[] = { "-M", "riscv64:help", NULL };
+    const char *none_help[] = { "-M", "none:help", NULL };
+
+    assert_spawn("none", help, 0, "none:\n", NULL);
+    assert_spawn("aarch64", help, 0, "aarch64:\n", NULL);
+    assert_spawn("none", qmark, 0, "none:\n", NULL);
+    assert_spawn("aarch64", aarch64_help, 0, "virt", NULL);
+    assert_spawn_not("aarch64", aarch64_help, 0, "virt", "q35");
+    assert_spawn_not("aarch64", aarch64_help, 0, "virt", "none:\n");
+    assert_spawn("aarch64", aarch64_q, 0, "virt", NULL);
+    assert_spawn("riscv64", riscv64_help, 0, "virt", NULL);
+    assert_spawn("none", none_help, 0, "none", NULL);
+    assert_spawn_not("none", none_help, 0, "empty machine", "aarch64:\n");
+}
+
+static void test_combined_props(void)
+{
+    const char *virt_help[] = { "-M", "aarch64:virt,help", NULL };
+    const char *def_help[] = { "-M", "aarch64:,help", NULL };
+    const char *bare_help[] = { "-M", "virt,help", NULL };
+    const char *none_help[] = { "-M", "none,help", NULL };
+
+    assert_spawn("aarch64", virt_help, 0, "gic-version", NULL);
+    assert_spawn("aarch64", def_help, 1, NULL,
+                 "No machine specified, and there is no default");
+    assert_spawn(NULL, bare_help, 1, NULL, "needs an arch: prefix");
+    assert_spawn("none", none_help, 0, "none-machine", NULL);
+}
+
+static void test_combined_errors(void)
+{
+    const char *virt[] = { "-M", "virt", NULL };
+    const char *riscv64[] = { "-M", "riscv64", NULL };
+    const char *aarch64[] = { "-M", "aarch64", NULL };
+    const char *q35[] = { "-M", "aarch64:q35", NULL };
+    const char *sbsa[] = { "-M", "arm:sbsa-ref", NULL };
+    const char *nosuch_m[] = { "-M", "aarch64:no-such", NULL };
+    const char *nosuch_t[] = { "-M", "no-such:virt", NULL };
+    const char *upper[] = { "-M", "AARCH64:virt", NULL };
+    const char *none_virt[] = { "-M", "none:virt", NULL };
+    const char *lead[] = { "-M", ":virt", NULL };
+    const char *colon[] = { "-M", ":", NULL };
+    const char *extra[] = { "-M", "aarch64:virt:extra", NULL };
+
+    assert_spawn(NULL, virt, 1, NULL, "needs an arch: prefix");
+    assert_spawn(NULL, riscv64, 1, NULL, "needs an arch: prefix");
+    assert_spawn(NULL, aarch64, 1, NULL, "needs an arch: prefix");
+    assert_spawn("aarch64", q35, 1, NULL,
+                 "unsupported machine type: \"aarch64:q35\"");
+    assert_spawn("arm", sbsa, 1, NULL,
+                 "unsupported machine type: \"arm:sbsa-ref\"");
+    assert_spawn("aarch64", nosuch_m, 1, NULL,
+                 "unsupported machine type: \"aarch64:no-such\"");
+    assert_spawn(NULL, nosuch_t, 1, NULL, "target 'no-such' is not available");
+    assert_spawn(NULL, upper, 1, NULL, "target 'AARCH64' is not available");
+    assert_spawn("none", none_virt, 1, NULL,
+                 "machine type \"none:virt\" is not available for target none");
+    assert_spawn(NULL, lead, 1, NULL, "needs an arch: prefix");
+    assert_spawn(NULL, colon, 1, NULL, "needs an arch: prefix");
+    assert_spawn("aarch64", extra, 1, NULL,
+                 "unsupported machine type: \"aarch64:virt:extra\"");
+}
+
+static void test_combined_last_help(void)
+{
+    const char *run_then_help[] = { "-M", "aarch64:virt", "-M", "help", NULL };
+
+    assert_spawn("aarch64", run_then_help, 0, "virt", NULL);
+    assert_spawn_not("aarch64", run_then_help, 0, "virt", "q35");
+}
+
+static void test_combined_run(void)
+{
+    const char *aarch64_def[] = { "-M", "aarch64:", NULL };
+    const char *riscv64_def[] = { "-M", "riscv64:", NULL };
+    const char *last_riscv_def[] = {
+        "-M", "aarch64:virt", "-M", "riscv64:", NULL
+    };
+
+    assert_run("aarch64", "-M aarch64:virt", "virt");
+    assert_run("riscv64", "-M riscv64:virt", "virt");
+    assert_run("aarch64", "-M type=aarch64:virt", "virt");
+    assert_run("aarch64", "-machine aarch64:virt", "virt");
+    assert_spawn("aarch64", aarch64_def, 1, NULL,
+                 "No machine specified, and there is no default");
+    assert_spawn("riscv64", riscv64_def, 1, NULL,
+                 "No machine specified, and there is no default");
+    assert_run("x86_64", "-M x86_64:q35", "q35");
+    assert_run("x86_64", "-M x86_64:", NULL);
+    assert_run("x86_64", "-M aarch64:virt -M x86_64:q35", "q35");
+    assert_run("i386", "-M i386:", NULL);
+    assert_run("none", "-M none:", "none");
+    assert_run("none", "", "none");
+    assert_run("none", "-M none", "none");
+    assert_run("none", "-M none:none", "none");
+    assert_run("aarch64", "-M aarch64:none", "none");
+    assert_run("aarch64", "-M aarch64:virt -M none", "none");
+    assert_run("riscv64", "-M aarch64:virt -M riscv64:virt", "virt");
+    assert_run("aarch64", "-M aarch64:virt -M virt", "virt");
+    assert_run("aarch64", "-M virt -M aarch64:virt", "virt");
+    assert_run("aarch64", "-M aarch64: -M virt", "virt");
+    assert_spawn("riscv64", last_riscv_def, 1, NULL,
+                 "No machine specified, and there is no default");
+    assert_run("aarch64", "-M help -M aarch64:virt", "virt");
+}
+
+static void test_historic_help(void)
+{
+    const char *target_info = qtest_get_arch();
+    const struct ShippedTarget *t = lookup_shipped_target(target_info);
+    const char *help[] = { "-M", "help", NULL };
+    g_autofree gchar *out = NULL;
+    g_autofree gchar *err = NULL;
+    g_autoptr(QList) names = NULL;
+    int code;
+
+    spawn_qemu(&out, &err, &code, help);
+    g_assert_cmpint(code, ==, 0);
+    g_assert_nonnull(strstr(out ? out : "", "Supported machines are:"));
+    g_assert_null(strstr(out ? out : "", "none:\n"));
+    if (!t) {
+        return;
+    }
+    read_accels();
+    names = names_from_help(out, NULL);
+    assert_name_list(names, t->name, t->machines, t->n_machines);
+}
+
+static void test_historic_machine_help(void)
+{
+    const char *target_info = qtest_get_arch();
+    const struct ShippedTarget *t = lookup_shipped_target(target_info);
+    const char *machine;
+    g_autofree char *opt = NULL;
+    const char *args[] = { "-M", NULL, NULL };
+    size_t i;
+    bool have_virt = false;
+
+    if (!t) {
+        return;
+    }
+    machine = preferred_machine(t);
+    if (!machine) {
+        return;
+    }
+    opt = g_strdup_printf("%s,help", machine);
+    args[1] = opt;
+    assert_spawn(target_info, args, 0, machine, NULL);
+    for (i = 0; i < t->n_machines; i++) {
+        if (!strcmp(t->machines[i], "virt")) {
+            have_virt = true;
+            break;
+        }
+    }
+    if (have_virt &&
+        (!strcmp(target_info, "arm") || !strcmp(target_info, "aarch64"))) {
+        const char *virt_args[] = { "-M", "virt,help", NULL };
+
+        assert_spawn(target_info, virt_args, 0, "gic-version", NULL);
+    }
+}
+
+static void test_historic_run(void)
+{
+    const char *target_info = qtest_get_arch();
+    g_autofree char *match = g_strdup_printf("-M %s:none", target_info);
+    const char *mismatch[] = { "-M", "aarch64:virt", NULL };
+
+    assert_run(target_info, "-M none", "none");
+    assert_run(target_info, match, "none");
+    if (strcmp(target_info, "aarch64")) {
+        assert_spawn(target_info, mismatch, 1, NULL,
+                     "is not available for target");
+    } else {
+        assert_run(target_info, "-M virt", "virt");
+        assert_run(target_info, "-M aarch64:virt", "virt");
+    }
+}
+
+static void test_combined_help_lists(void)
+{
+    const char *help[] = { "-M", "help", NULL };
+    g_autofree gchar *out = NULL;
+    g_autofree gchar *err = NULL;
+    g_autoptr(QList) targets = NULL;
+    const QListEntry *e;
+    QTestState *qts;
+    int code;
+
+    spawn_qemu(&out, &err, &code, help);
+    g_assert_cmpint(code, ==, 0);
+    qts = qtest_init("-nodefaults -M none");
+    read_accel_flags(qts);
+    targets = query_targets(qts);
+    qtest_quit(qts);
+    g_assert_cmpuint(qlist_size(targets), >, 0);
+    for (e = qlist_first(targets); e; e = qlist_next(e)) {
+        QDict *tgt = qobject_to(QDict, qlist_entry_obj(e));
+        const struct ShippedTarget *t;
+        g_autoptr(QList) names = NULL;
+
+        g_assert_nonnull(tgt);
+        if (!strcmp(qdict_get_str(tgt, "arch"), "none")) {
+            QList *qmp_names = qdict_get_qlist(tgt, "machines");
+            g_autoptr(QList) help_names = names_from_help(out, "none");
+            const QListEntry *ne;
+            bool saw_none = false;
+
+            g_assert_nonnull(strstr(out, "none:\n"));
+            g_assert_cmpuint(qlist_size(help_names), ==, qlist_size(qmp_names));
+            for (ne = qlist_first(qmp_names); ne; ne = qlist_next(ne)) {
+                const char *name = qstring_get_str(qobject_to(QString,
+                                                               qlist_entry_obj(ne)));
+                const QListEntry *he;
+                bool found = false;
+
+                if (!strcmp(name, "none")) {
+                    saw_none = true;
+                }
+                for (he = qlist_first(help_names); he; he = qlist_next(he)) {
+                    const char *hn = qstring_get_str(
+                        qobject_to(QString, qlist_entry_obj(he)));
+
+                    if (!strcmp(name, hn)) {
+                        found = true;
+                        break;
+                    }
+                }
+                g_assert_true(found);
+            }
+            g_assert_true(saw_none);
+            continue;
+        }
+        t = lookup_shipped_arch(qdict_get_str(tgt, "arch"),
+                                qdict_get_str(tgt, "endianness"));
+        g_assert_nonnull(t);
+        names = names_from_help(out, t->name);
+        assert_name_list(names, t->name, t->machines, t->n_machines);
+    }
+}
+
+static char *write_machine_config(const char *type)
+{
+    g_autofree char *text = g_strdup_printf("[machine]\ntype = \"%s\"\n", type);
+    g_autofree char *path = NULL;
+    GError *err = NULL;
+    int fd;
+
+    fd = g_file_open_tmp("qemu-m-XXXXXX", &path, &err);
+    g_assert_no_error(err);
+    g_assert_cmpint(fd, >=, 0);
+    close(fd);
+    g_assert_true(g_file_set_contents(path, text, -1, &err));
+    g_assert_no_error(err);
+    return g_steal_pointer(&path);
+}
+
+static void test_combined_readconfig(void)
+{
+    g_autofree char *aarch64_cfg = write_machine_config("aarch64:virt");
+    g_autofree char *none_cfg = write_machine_config("none:");
+    g_autofree char *riscv_cfg = write_machine_config("riscv64:virt");
+    g_autofree char *from_cfg = NULL;
+    g_autofree char *then_none = NULL;
+    g_autofree char *cfg_none = NULL;
+    g_autofree char *then_riscv = NULL;
+
+    from_cfg = g_strdup_printf("-readconfig \"%s\"", aarch64_cfg);
+    assert_run("aarch64", from_cfg, "virt");
+    then_none = g_strdup_printf("-readconfig \"%s\" -M none", aarch64_cfg);
+    assert_run("aarch64", then_none, "none");
+    cfg_none = g_strdup_printf("-readconfig \"%s\"", none_cfg);
+    assert_run("none", cfg_none, "none");
+    then_riscv = g_strdup_printf("-M aarch64:virt -readconfig \"%s\"",
+                                 riscv_cfg);
+    assert_run("riscv64", then_riscv, "virt");
+
+    unlink(aarch64_cfg);
+    unlink(none_cfg);
+    unlink(riscv_cfg);
+}
+
+static void test_combined_run_listed(void)
+{
+    g_autoptr(QList) targets = NULL;
+    const QListEntry *e;
+    QTestState *qts;
+
+    qts = qtest_init("-nodefaults -M none");
+    targets = query_targets(qts);
+    qtest_quit(qts);
+    for (e = qlist_first(targets); e; e = qlist_next(e)) {
+        QDict *tgt = qobject_to(QDict, qlist_entry_obj(e));
+        const struct ShippedTarget *t;
+        const char *machine;
+        g_autofree char *cli = NULL;
+
+        g_assert_nonnull(tgt);
+        if (!strcmp(qdict_get_str(tgt, "arch"), "none")) {
+            assert_run("none", "-M none:none", "none");
+            continue;
+        }
+        t = lookup_shipped_arch(qdict_get_str(tgt, "arch"),
+                                qdict_get_str(tgt, "endianness"));
+        g_assert_nonnull(t);
+        machine = preferred_machine(t);
+        g_assert_nonnull(machine);
+        cli = g_strdup_printf("-M %s:%s", t->name, machine);
+        assert_run(t->name, cli, machine);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    if (qemu_binary_is_combined()) {
+        g_test_add_func("/machine-option/help", test_combined_help);
+        g_test_add_func("/machine-option/help-lists", test_combined_help_lists);
+        g_test_add_func("/machine-option/props", test_combined_props);
+        g_test_add_func("/machine-option/errors", test_combined_errors);
+        g_test_add_func("/machine-option/last-help", test_combined_last_help);
+        g_test_add_func("/machine-option/run", test_combined_run);
+        g_test_add_func("/machine-option/readconfig", test_combined_readconfig);
+        g_test_add_func("/machine-option/run-listed", test_combined_run_listed);
+    } else {
+        qtest_add_func("machine-option/help", test_historic_help);
+        qtest_add_func("machine-option/machine-help", test_historic_machine_help);
+        qtest_add_func("machine-option/run", test_historic_run);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index aef99d2bf52..99b7b19283b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -19,6 +19,11 @@ slow_qtests = {
   'vmgenid-test': 610,
 }
 
+qtests_single_binary = [
+  'machine-option-test',
+  'machine-list-combined-test',
+]
+
 qtests_generic = [
   'cdrom-test',
   'device-introspect-test',
@@ -527,3 +532,36 @@ foreach dir : target_dirs
                 (slow_qtests.has_key(test) ? ['slow'] : []))
   endforeach
 endforeach
+
+if is_variable('qemu_system')
+  qtest_env_sb = environment()
+  qtest_env_sb.set('G_TEST_DBUS_DAEMON',
+                   meson.project_source_root() / 'tests/dbus-daemon.sh')
+  qtest_env_sb.set('QTEST_QEMU_BINARY', './qemu-system')
+  qtest_env_sb.set('PYTHON', python.full_path())
+  combined_targets_text = []
+  foreach name : single_binary_targets
+    combined_targets_text += '    "@0@",'.format(name)
+  endforeach
+  combined_targets_conf = configuration_data()
+  combined_targets_conf.set('COMBINED_TARGETS', '\n'.join(combined_targets_text))
+  combined_targets_h = configure_file(
+    input: 'machine-list-combined-targets.h.in',
+    output: 'machine-list-combined-targets.h',
+    configuration: combined_targets_conf,
+  )
+  foreach test : qtests_single_binary
+    qtest_executables += {
+      test: executable(test, [test + '.c', combined_targets_h],
+                       dependencies: [qemuutil, qos])
+    }
+    test('qtest-single-binary/' + test,
+         qtest_executables[test],
+         depends: [qemu_system, emulator_modules],
+         env: qtest_env_sb,
+         args: ['--tap', '-k'],
+         protocol: 'tap',
+         timeout: test == 'machine-option-test' ? 180 : 60,
+         suite: ['qtest', 'qtest-single-binary'])
+  endforeach
+endif
-- 
2.52.0.windows.1


