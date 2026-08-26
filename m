Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFFDC5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:44:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIbp-0003EI-Qr; Wed, 26 Aug 2026 14:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIbn-00032g-RK
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:44:23 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIbl-0002fS-Bs
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:44:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2d032846c95so18090175ad.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769860; x=1788374660; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g47wJ4WBi7Stp9jnoE21g0pDTQck93gzO7r7wKRbrtQ=;
 b=XgYHvgX45xZdM8qlTPA+GoHN6gu6XkUiK75ar2VZrNQi2hynwWXF+NOR8L5AEI6YQ5
 AEeqVZ50wGa4fCWBVasdN2h7tQTYKXnwFrouwas8dG318Ut3NuFIzpIQidCRTq/hB2m0
 cOjE/EfrWq9O+hBHRFUckvvCBslzfW0dXAa9N7CKezdJWyOJbG+zI0EnLzE3AWWeoemU
 ivTXeQ2AnZM/K/5Q+kexIknvUc95HJ02UASEaXnxDp+8YjocrDgoW11GZhI0X7bFM5TZ
 6cZraXU3HJTm4WXx65DJPIau5BvcoBBkdcpPaOD7xjMoKvzjDF8Rk0CgGWCfE3QvIk9G
 /3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769860; x=1788374660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g47wJ4WBi7Stp9jnoE21g0pDTQck93gzO7r7wKRbrtQ=;
 b=NUHG2YnK0el4RwiDSxQ09OePAB4TGmINt09aG90bQ6mqVdQqj87C0WJqNi3RPTq1Lz
 pG2N+m1WTHqKR5s8e1XbeTvnYk9HB1Y/RtdONjfrYUKiwauUJSeuqKUVOqLzCSExHxKt
 j6bGoNguJBqX3l8BUcGiwdGCrnubmEEtDWgyh610o3sPEWG/G6BQkVcytCA1RK/Usa0Q
 /GjLptpc2Dq7QnMyKulDXfxFzUnM15YzAT+AwpP8jC4AT/F/AIkEPkloKpkj44A5Aa9N
 4KGxyB3dbvt5B+bwDORcrosHER0Zx5xzo/4jQOvdQfq6ANgw1EtXPTG8Ua9BzhPo0JtD
 cHwQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpY75NYjKta7vjwK0pOkD/olW7I7od+dKc99FN3LJuoYVYtq8FrRkUzJg2BFF0qLSw9T0KNhNNUWQ==@nongnu.org
X-Gm-Message-State: AFuF++kNi72cA3fg5Cmlh/vDEm9uu/htk7hBAVuCaQLrYJiPv1tRebvH
 uBDcYivQNowo3hoHrb+fSK5C1qqBjEoLmSHVGsOw7+o4xqXO9rnv/IWG
X-Gm-Gg: AR+sD10TQXJtyXDP18bL/8UVubOm/giRwb2DGV1T7ORS8luKzRHIvtS5de2ub0BMSH2
 KBEPFtHvJ4pKvGctCy98M+QcPWQbBNfqcBfVxYQnYdyjw8kb2gvxPxOJaZnF2TIAT9vPaYxWpAm
 DcXPKDsPTQs6nEuQxj3R+23pBbJx7kuP0WAluPn4M8plal0aqEOueAdgrepuq4AchLdsPLoStkF
 DrOAXeCv+KJh9CwMDJRj9GK9d2n01VCuzjHblQbsG3wQxmEk3bVI/hTxZ9BOU7Yh59pT8urbAa9
 v3vX0JtBmiU8QtMoHYQ3JYa4U3oZ2hNQHmZnnXKf5hDHxZWKPjwBW/N0qmkS6aJvLUNRxI926yy
 PoQOVHklA6nyg5TvRNiBCjOWYLduKLosHTnvprUT+iG5rOzcSPEHLrGQrHxMdiFZ0OZ/7iiT1Rb
 APZAwbiLPLFCATzENf6QzDQSLD1Ey55ovjrnrwQUokRSb1ppA3NwgmW4AFn+DmXvtgqIBZtwZAV
 E0qRtfer6HhpAcpAbHBDbfInyBet5Cp
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id
 d9443c01a7336-2d7079ffd98mr175930535ad.2.1787769859773; 
 Wed, 26 Aug 2026 11:44:19 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:44:19 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 11/13] system/vl: add new option -target
Date: Thu, 27 Aug 2026 02:42:25 +0800
Message-ID: <20260826184229.1145-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

- Parse -target with QEMU_OPTION_nouserconfig, right after
  MODULE_INIT_TARGET_INFO, because later init depends on TargetInfo.
- target_info_qom_set_target() takes Error **errp. A name comes from
  -target or from argv0 (qemu-system-aarch64). qemu-system with no
  suffix and no -target fails; use -target ? to list names.
- Fuzz passes TARGET_NAME instead of relying on a unique TargetInfo.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info-qom.h |  3 +-
 qemu-options.hx                |  8 ++++
 system/vl.c                    | 36 ++++++++++++----
 target-info-qom.c              | 77 ++++++++++++++++++++++++++++++----
 tests/qtest/fuzz/fuzz.c        |  2 +-
 5 files changed, 110 insertions(+), 16 deletions(-)

diff --git a/include/qemu/target-info-qom.h b/include/qemu/target-info-qom.h
index 842cf241e0a..9e56383ea6b 100644
--- a/include/qemu/target-info-qom.h
+++ b/include/qemu/target-info-qom.h
@@ -10,6 +10,7 @@
 #define QEMU_TARGET_INFO_QOM_H
 
 #include "qemu/target-info-impl.h"
+#include "qapi/error.h"
 #include "qom/object.h"
 
 #define TYPE_TARGET_INFO "target-info"
@@ -40,7 +41,7 @@ typedef struct TargetInfoQomClass {
 
 OBJECT_DECLARE_TYPE(TargetInfoQom, TargetInfoQomClass, TARGET_INFO)
 
-void target_info_qom_set_target(void);
+void target_info_qom_set_target(const char *name, Error **errp);
 
 /**
  * get_machine_types_available:
diff --git a/qemu-options.hx b/qemu-options.hx
index 34970fffc94..824807be1d8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -24,6 +24,14 @@ SRST
     Display version information and exit
 ERST
 
+DEF("target", HAS_ARG, QEMU_OPTION_target, \
+    "-target target  selects the target architecture ('-target help' for list)\n",
+    QEMU_ARCH_ALL)
+SRST
+``-target target``
+    Selects target architecture ('-target help' for list)
+ERST
+
 DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop=value[,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
diff --git a/system/vl.c b/system/vl.c
index 4b1fcd2031f..28c5741c385 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -281,6 +281,15 @@ static QemuOptsList qemu_accel_opts = {
     },
 };
 
+static QemuOptsList qemu_target_opts = {
+    .name = "target",
+    .implied_opt_name = "target",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_target_opts.head),
+    .desc = {
+        { /* end of list */ },
+    },
+};
+
 static QemuOptsList qemu_boot_opts = {
     .name = "boot-opts",
     .implied_opt_name = "order",
@@ -2856,6 +2865,7 @@ void qemu_init(int argc, char **argv)
     const char *optarg;
     MachineClass *machine_class;
     bool userconfig = true;
+    const char *target_name_option = NULL;
     FILE *vmstate_dump_file = NULL;
 
     qemu_add_opts(&qemu_drive_opts);
@@ -2889,6 +2899,7 @@ void qemu_init(int argc, char **argv)
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
     qemu_add_opts(&qemu_action_opts);
+    qemu_add_opts(&qemu_target_opts);
     qemu_add_run_with_opts();
     module_call_init(MODULE_INIT_OPTS);
 
@@ -2898,13 +2909,6 @@ void qemu_init(int argc, char **argv)
     os_setup_limits();
 
     module_call_init(MODULE_INIT_TARGET_INFO);
-    target_info_qom_set_target();
-
-    module_init_info(qemu_modinfo);
-    module_allow_arch(target_name());
-
-    qemu_init_subsystems();
-
     /* first pass of option parsing */
     optind = 1;
     while (optind < argc) {
@@ -2919,10 +2923,25 @@ void qemu_init(int argc, char **argv)
             case QEMU_OPTION_nouserconfig:
                 userconfig = false;
                 break;
+            case QEMU_OPTION_target:
+                target_name_option = optarg;
+                break;
             }
         }
     }
 
+    /*
+     * Identify target: first from option, then from argv[0].
+     * This happens even before handling --help option, because it may contain
+     * entries that are target specific.
+     */
+    target_info_qom_set_target(target_name_option, &error_fatal);
+
+    module_init_info(qemu_modinfo);
+    module_allow_arch(target_name());
+
+    qemu_init_subsystems();
+
     machine_opts_dict = qdict_new();
     if (userconfig) {
         qemu_read_default_config_file(&error_fatal);
@@ -2946,6 +2965,9 @@ void qemu_init(int argc, char **argv)
                 exit(1);
             }
             switch(popt->index) {
+            case QEMU_OPTION_target:
+                /* handled previously, ignore it here */
+                break;
             case QEMU_OPTION_cpu:
                 /* hw initialization will check this */
                 cpu_option = optarg;
diff --git a/target-info-qom.c b/target-info-qom.c
index 68ad734049c..5f7af028749 100644
--- a/target-info-qom.c
+++ b/target-info-qom.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/help_option.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 #include "qemu/target-info-impl.h"
@@ -87,16 +88,78 @@ const TargetInfo *target_info(void)
     return target_info_ptr;
 }
 
-void target_info_qom_set_target(void)
+static void set_target_info(const TargetInfo *chosen)
 {
-    g_autoptr(GSList) targets = object_class_get_list(TYPE_TARGET_INFO, false);
+    target_info_ptr = chosen;
+}
+
+static void list_targets_available(void)
+{
+    printf("List of targets available:\n");
+    g_autoptr(GSList) targets = object_class_get_list_sorted(TYPE_TARGET_INFO, false);
+    for (GSList *elem = targets; elem; elem = elem->next) {
+        const TargetInfo *ti = TARGET_INFO_CLASS(elem->data)->target_info;
+
+        printf("- %s\n", ti->target_name);
+    }
+}
+
+static bool target_info_matches_name(const TargetInfo *ti, const char *name)
+{
+    return !strcmp(name, ti->target_name);
+}
+
+/* qemu-system-aarch64[.exe] -> aarch64; qemu-system[.exe] -> NULL. */
+static const char *target_from_argv0(char *base)
+{
+    if (g_str_has_prefix(base, "qemu-system-")) {
+        return base + strlen("qemu-system-");
+    }
+    return NULL;
+}
 
+void target_info_qom_set_target(const char *name, Error **errp)
+{
+    g_autoptr(GSList) targets = object_class_get_list(TYPE_TARGET_INFO, false);
+    g_autofree char *prg_base = NULL;
     size_t num_found = g_slist_length(targets);
-    if (num_found != 1) {
-        error_setg(&error_fatal, num_found == 0 ?
-                                 "no target-info is available" :
-                                 "more than one target-info is available");
+
+    if (num_found == 0) {
+        error_setg(errp, "no target-info is available");
+        return;
+    }
+
+    if (!name) {
+        const char *prg = g_get_prgname();
+        if (prg && prg[0]) {
+            char *dot;
+
+            prg_base = g_path_get_basename(prg);
+            dot = strrchr(prg_base, '.');
+            if (dot && g_ascii_strcasecmp(dot, ".exe") == 0) {
+                *dot = '\0';
+            }
+            name = target_from_argv0(prg_base);
+        }
+    }
+
+    if (name) {
+        if (is_help_option(name)) {
+            list_targets_available();
+            exit(0);
+        }
+        for (GSList *elem = targets; elem; elem = elem->next) {
+            const TargetInfo *ti = TARGET_INFO_CLASS(elem->data)->target_info;
+            if (target_info_matches_name(ti, name)) {
+                set_target_info(ti);
+                return;
+            }
+        }
+        error_setg(errp, "target '%s' is not available, "
+                   "use -target ? to list available targets", name);
+        return;
     }
 
-    target_info_ptr = TARGET_INFO_CLASS(targets->data)->target_info;
+    error_setg(errp, "no target specified, "
+               "use -target ? to list available targets");
 }
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index a3a131c80f8..c992fab4079 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -174,7 +174,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     /* Initialize qgraph and modules */
     qos_graph_init();
     module_call_init(MODULE_INIT_TARGET_INFO);
-    target_info_qom_set_target();
+    target_info_qom_set_target(fuzz_arch, &error_fatal);
     module_call_init(MODULE_INIT_FUZZ_TARGET);
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_LIBQOS);
-- 
2.52.0.windows.1


