Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4241219ejb;
        Tue, 20 Dec 2022 03:29:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4X0mYX9yMnTrNNRlzikP3awE+aQBcXqW+Eu+jWXiHWv1jSaYgD9AqSmlAx4/8PrafzBf6d
X-Received: by 2002:ac8:7c89:0:b0:3a7:e33b:5c0f with SMTP id y9-20020ac87c89000000b003a7e33b5c0fmr56217442qtv.8.1671535769975;
        Tue, 20 Dec 2022 03:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671535769; cv=none;
        d=google.com; s=arc-20160816;
        b=nQx3B01uKrQmsvS0Op5Zd96fWgtglKnVxjgQVCIJxO4v2ppsJZRI637XAiI84tw9J2
         PFwOhRpQ+ZxvbGmGcg3Y1nuxqbpm3xDz1got2pvv3AxWtvT2yUJhRciUZFZmSFJ9/yHB
         efS+kGBa+nmaq4qqAw/5/uKRNB1CE2pYZFhzlS0MWv39YpvcQ8Qu+W4XD1C+RMI+OvI7
         8BLsKYxYyRbTYyK1TDwMP+q3Y4573lsI4DD9JNOe7HCczIfDKRMRcj7T4ghcMaF6jc49
         orxlodnGwlFILWVVs4cvKm1Tqx7gDn2VvHANVe7CZglrDvx1hej5QkjHtqukzx2Yj0eg
         D+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Tc4icU5uIZDb6KV/spc5EMSSVzOZKwdCLgvhFKNLqtU=;
        b=v2BBT+AP2MuYAdlRikJy/q447rjUOMwBNO5YqskDQtaH2q0hDt9ka3mWdIZd4CX/Ks
         pE6f86jCZGklVV0qj/a/k+70ZejSxYjl+JiKIyf0+XM66vkXVJRhc/7yXWGIAQEztQJM
         no9R1IwBE3yfGAJZOWT9TibNfrQxBvcMrTO+h5HIwBzV7FJJVErs0gQ5Ovgf0vpxAiid
         hxNnVyXT9PUNHC8bp5O7JY/d/8FL1lkZSkHot5ra2PUYQlfaXafI7ciFfRy1fws8z5D9
         8rZv/tXU+V6GwBOgSwB/k1ktswW7Z8vdsk1GDk+LT/FZXVqrCovhvsldZBQXTkFXQaRX
         O0og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEaPaBFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020a05620a095400b006feda799d24si4768561qkw.296.2022.12.20.03.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:29:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEaPaBFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7aXk-0004Ui-EL; Tue, 20 Dec 2022 06:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aXN-0004FE-HG
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:12:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aXL-0003pV-J8
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:11:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id a17so10224988wrt.11
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 03:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tc4icU5uIZDb6KV/spc5EMSSVzOZKwdCLgvhFKNLqtU=;
 b=jEaPaBFnMMMTXTAbj0RWIMod/taycHimtJ3KMac21k/WUeS5wzsP7f+eEiiNo6NHk4
 b99Icr/ffinJVL62Fqy+N49q9yBwee5uBjsehKbP6ALntLdIPLtcWO6H10Qz/AhASjEL
 117tCuUVxXFnd1C+1v9sXf79jXsnRViryfy8oe/8y/NVF5rQN/AWg3Nc2FTmVv+sCul8
 pMe7Qc9Xuhp50tFjthMh704EplmVm6CG7/ymY4U34tws99+2oIGEBI1IkenmgvelrUOj
 Wx8NPExLjGs5DoaDCIds9qDwaS6A6Wq6NCUTE6pvpOtM+yGiwyFI8195LePQUOa6ZeoF
 cdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tc4icU5uIZDb6KV/spc5EMSSVzOZKwdCLgvhFKNLqtU=;
 b=b1vBdTPnYGcy9hKSA/VOFcdWngr4yeyjAupdZGCuxk1EpJ7OR1qQ0MjK+adP8o3BJm
 niGgr0lDVd66vpT+xasMswKloKG39ZsezAioafMjAd/y1n7vr0qpJZKbOQDi5MYNCpdI
 lYNVMPo7N+XbCGzGToi96gmbkMCnmNL22Gp9nUl6XPJzwgzy+NQKh5prEip8iitAqBBC
 gq1nLpRecXJFyhlBR/1QJiBinBl2d8SRMrJVV9qwc9Ci/4jUhsUm/A4Hcrmi6XeopWI5
 lKuy/x2jJUKz3GYwS5jwmO8o4LIi0P2SWOy7Q2L7UyliyLgoAZSqJNq54CX65Tw14y14
 OhUg==
X-Gm-Message-State: ANoB5pm967CMk/xOIbFYGolUJFgzyKEA4a+KkbFraIwgDCNSUCIjlL8e
 Yh9MJTjpUaFcYHLoOcU2HnmHiA==
X-Received: by 2002:adf:fa4c:0:b0:242:4990:b751 with SMTP id
 y12-20020adffa4c000000b002424990b751mr29196536wrr.34.1671534714346; 
 Tue, 20 Dec 2022 03:11:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b002683695bf97sm578629wrt.58.2022.12.20.03.11.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH RESEND v2 5/5] target/ppc: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Tue, 20 Dec 2022 12:11:22 +0100
Message-Id: <20221220111122.8966-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E/REkiRrdJit

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Move the QMP functions from cpu_init.c (which is always compiled) to
monitor.c (which is only compiled when system-emulation is selected).
Note ppc_cpu_class_by_name() is used by both file units, so we expose
its prototype in "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h  |  2 ++
 target/ppc/cpu_init.c | 48 +----------------------------------------
 target/ppc/monitor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 89ff88f28c..6431c520c8 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -31,6 +31,8 @@
 
 OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
+ObjectClass *ppc_cpu_class_by_name(const char *name);
+
 typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cbf0081374..7858cc4c6c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -40,7 +40,6 @@
 #include "qemu/cutils.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
-#include "qapi/qapi-commands-machine-target.h"
 
 #include "helper_regs.h"
 #include "internal.h"
@@ -6816,7 +6815,7 @@ static const char *ppc_cpu_lookup_alias(const char *alias)
     return NULL;
 }
 
-static ObjectClass *ppc_cpu_class_by_name(const char *name)
+ObjectClass *ppc_cpu_class_by_name(const char *name)
 {
     char *cpu_model, *typename;
     ObjectClass *oc;
@@ -6956,51 +6955,6 @@ void ppc_cpu_list(void)
 #endif
 }
 
-static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **first = user_data;
-    const char *typename;
-    CpuDefinitionInfo *info;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
-
-    QAPI_LIST_PREPEND(*first, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-    int i;
-
-    list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
-    g_slist_free(list);
-
-    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
-        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
-        ObjectClass *oc;
-        CpuDefinitionInfo *info;
-
-        oc = ppc_cpu_class_by_name(alias->model);
-        if (oc == NULL) {
-            continue;
-        }
-
-        info = g_malloc0(sizeof(*info));
-        info->name = g_strdup(alias->alias);
-        info->q_typename = g_strdup(object_class_get_name(oc));
-
-        QAPI_LIST_PREPEND(cpu_list, info);
-    }
-
-    return cpu_list;
-}
-
 static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index 8250b1304e..36e5b5eff8 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -1,5 +1,5 @@
 /*
- * QEMU monitor
+ * QEMU PPC (monitor definitions)
  *
  * Copyright (c) 2003-2004 Fabrice Bellard
  *
@@ -28,6 +28,9 @@
 #include "qemu/ctype.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu-models.h"
+#include "cpu-qom.h"
 
 static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
@@ -172,3 +175,48 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
 
     return -EINVAL;
 }
+
+static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **first = user_data;
+    const char *typename;
+    CpuDefinitionInfo *info;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
+
+    QAPI_LIST_PREPEND(*first, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+    int i;
+
+    list = object_class_get_list(TYPE_POWERPC_CPU, false);
+    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
+    g_slist_free(list);
+
+    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
+        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
+        ObjectClass *oc;
+        CpuDefinitionInfo *info;
+
+        oc = ppc_cpu_class_by_name(alias->model);
+        if (oc == NULL) {
+            continue;
+        }
+
+        info = g_malloc0(sizeof(*info));
+        info->name = g_strdup(alias->alias);
+        info->q_typename = g_strdup(object_class_get_name(oc));
+
+        QAPI_LIST_PREPEND(cpu_list, info);
+    }
+
+    return cpu_list;
+}
-- 
2.38.1

