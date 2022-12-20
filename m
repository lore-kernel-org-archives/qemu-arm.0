Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4247799ejb;
        Tue, 20 Dec 2022 03:40:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXus0SO81T2E2AhrqRQ6FwXl2uHojfhzpX5Wvu6BnEILuYgnsUagDW1IF5zeGMSByFYo0gYF
X-Received: by 2002:a05:6214:3111:b0:515:5e33:5059 with SMTP id ks17-20020a056214311100b005155e335059mr7096529qvb.26.1671536435216;
        Tue, 20 Dec 2022 03:40:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671536435; cv=none;
        d=google.com; s=arc-20160816;
        b=YnTJEfpxgHUKl38TYNCIWheHe7x2ue4MGb4fubnd4QQlVcsCPwRyAs2UCwQBBpCIne
         6yRCeGFQPVoxX1Z0Zni1bOZzpKFh78Djl6lygCt28luMJUPwmNb0GCIHg1UO5RIQU6Y7
         MCKGKt9OY2+59L0pwKVeB60AaBqHt+ROduID2bfXs5pnQ1b4n5V2qFtdptQeBdV0A5fd
         1jsWBI17UwoQVzldjaZmTKq+b0Bu5DKuZBxG0litsyIE83abJvM7jyc2vFult+1Z+SSu
         wsJEKtFZiADtpoUU0rRY3npqXHRwQAAhe88BtX2SGIvziiRR+Aj+aUAMqxn8cxMkJA9a
         8QjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VCqVdn1MR+8q4KNBpfFHWACRBuZ63eQE6lUtevF78ks=;
        b=zD284A+ahTgbiZKe6kZMban0mU8DGwnyphilJuDbK1VO1DVL58HTHDpuKgM+pcrH86
         YrCyfelZPNiOKoqb4jG+deEb3Yfqu4H5LYQERoskisMSzg6GMoGbQgs0F+lLXNc6Rpo4
         hycdEgPPzn+JFkmmVjhMXRgJbXszlAqgrIIb5emrfCBIFF/lKtlkSoEddmMhyL9D8VwI
         c0/XTK540ib69jY3WGe632gwj6X850ZpFgdotC1AjQLO2EPB5twJEzd+w/1QG2oIt/sA
         n07x6yfFuKc1orFq2jp8NzDyh8uep78uV99PlKmBH5ucYenlGwS11PdPbsRMHiTBbKWi
         XIuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9I9n35A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020a05620a100b00b006fc76d252c2si4750218qkj.258.2022.12.20.03.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:40:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9I9n35A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7aX9-00040i-0z; Tue, 20 Dec 2022 06:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aWz-0003vx-RD
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:11:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aWy-0003g5-4X
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:11:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h7so11386627wrs.6
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 03:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCqVdn1MR+8q4KNBpfFHWACRBuZ63eQE6lUtevF78ks=;
 b=m9I9n35AZ90i95iGax9u7TMEhXh7YAgapljHRhcm9uHC7lNWfexO1qBDhFJ+eT6yAk
 pb7tjkxt8a9fnvXwhL1OZl3cLsWZ57AZyxLQIiEw7nqPnlw12nq2nAAQ11p+GrHyj89x
 RbV4SX0JnJIFLo1+fP9WCPCr2m20x8jtQ7bpQQUeDDgeCYwmbtjzERyHVGCUa79+tp78
 ZONVI4oYhg0VE5tf5dB8qzcZguYjslbQFR7jGUQfdoYTPNTJqmshERVhOcGcxyeD1gFW
 Fi3rjU3B2eH3toD1xXNyDBsHMYVL1no2D7+I8rASgT1QhX5n/JkwvBsSGldVntLOqOdc
 HTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VCqVdn1MR+8q4KNBpfFHWACRBuZ63eQE6lUtevF78ks=;
 b=vJpnexCfE1W39fWNlYYDi2br9rx4sUurWvoWEWYbo6Rm4AlvOxwSR9QfWvOXne6yIA
 JI75QAn+ed4yAPOcgWvB3jIYtgLJMpdb9f7TnmM3+ORdVGukeduZ1NSQNTW/Sl6UwXeZ
 dLwyuvYTtCmk5cyX2z8qFiDLz3dgYoinYLNOJiP9/ymDT++PHGOXhIUVc4i6HRNcS28n
 jncQ8FLjqGGHDb0dT+anOiPfh3COi02K2Z8HRmlaJBaRUq/4sPunjam0Xd5reYybH4xM
 +QzqGc/9nBfvI7D6U+hSbi82bcVfKh+Ou1rA56TrPvpbk9fReR8NJgVwoniEZviHNoUU
 9eJQ==
X-Gm-Message-State: AFqh2koaLQeTKCikce9SEtT2Hek33IldRKMpBIRJMoME87gFyK4KfjwM
 8jaYr8HwEfaCZ7SCu2zNsdkvYQ==
X-Received: by 2002:a5d:4143:0:b0:262:3647:c1b1 with SMTP id
 c3-20020a5d4143000000b002623647c1b1mr862528wrq.58.1671534691371; 
 Tue, 20 Dec 2022 03:11:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002368f6b56desm14709827wrm.18.2022.12.20.03.11.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:30 -0800 (PST)
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
Subject: [PATCH RESEND v2 1/5] target/arm: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Tue, 20 Dec 2022 12:11:18 +0100
Message-Id: <20221220111122.8966-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 7K5ZE/T8D9AF

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Move the QMP functions from helper.c (which is always compiled) to
monitor.c (which is only compiled when system-emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c   | 29 -----------------------------
 target/arm/m_helper.c |  1 -
 target/arm/monitor.c  | 28 ++++++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..399603b680 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -27,7 +27,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
 #include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
@@ -8514,34 +8513,6 @@ void arm_cpu_list(void)
     g_slist_free(list);
 }
 
-static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
-
 /*
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..11008528b5 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -26,7 +26,6 @@
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index ecdd5ee817..c8fa524002 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -227,3 +227,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
+
+static void arm_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
-- 
2.38.1

