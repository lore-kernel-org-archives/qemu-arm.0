Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4227373ejb;
        Tue, 20 Dec 2022 03:05:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmGfuRGF02FT4MDzweAsm8PtlEVLUeUiVtAl5cblsxHQEWqDF946vUoOSx/gEJhlnJQYDe
X-Received: by 2002:ac8:4748:0:b0:3a9:70a2:2c59 with SMTP id k8-20020ac84748000000b003a970a22c59mr23907451qtp.39.1671534335999;
        Tue, 20 Dec 2022 03:05:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671534335; cv=none;
        d=google.com; s=arc-20160816;
        b=CkiqDv8U9Hd0EeY3bJ3tNl1l1y+FWFMpYF9rdHCPKqE/uGRE9S2sIyITIm0FadjjGH
         0CGcAzLpzfdnACc7SRtzlM+suYk3BS8h5uebPxb9mteTe8AfSpzsO1HuGlBariENN+QB
         Fv2rzwcyh/sYSjPNenfhSCa/aAxOnsnyK3C3g0vrH1EWrYd2VtxyOY7NJ/Re8fMj64hH
         Ls01nII6+Z7jUI2PfMtb4QsDgQycr/thXWRLEGoILZRllS7GRqP1QrxX6yH0zhI8DjOO
         ay3cEl02YbMt68aNZfRHiZstVo1FO5ss4oH21fOwVJW8NZw9ys06lUswnuXVeonvh5yJ
         CvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VCqVdn1MR+8q4KNBpfFHWACRBuZ63eQE6lUtevF78ks=;
        b=kyJV8Toqcpm1gUro2/jZQFeng6zmGpxF4VaEaCvcHWNMYaibug63Vb6forLTePoIhr
         2NpF+JjPdsIJvNTs5EP2CaduhXLd9nE2n6qdSFOzqE34uhSFUXN/IVkDW/+MqF9p8wKz
         RsvfUAG8a7L8WNl/8mmFusGAj3L2BbhSjmKM2K+0opP35GKgTmdoXlWOciYCW57k1klr
         +9UbjZWOpD2Mby/kdng45TCFLhOxP8QLkvGwZk8Yfyg8HWTHTKFC5ZWD0dPQMORvjCOr
         Rvm6ezRXDp7DVUvVTnQWvKax+7LAjLc8WV2unSAwyzp2qxSaNcWZq4tSF1HHBkzo148O
         kM7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IbmGcfax;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020ac81012000000b003a7e516e60bsi4844576qti.643.2022.12.20.03.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:05:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IbmGcfax;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aPF-0000fx-41; Tue, 20 Dec 2022 06:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aP6-0000bf-WD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aP3-0002HM-Fk
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id f18so11375768wrj.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCqVdn1MR+8q4KNBpfFHWACRBuZ63eQE6lUtevF78ks=;
 b=IbmGcfaxQjjoUj4M9k4hlUOnR4o0fsyYLTPSFI8cKOjIqCAw6dnov02C1C4zKqWDos
 kCFE28qLE75WmOyr4IR0Dce3lkMJyV7v6TmQzXNxf6+q3UUEwH8heosLdhO6EdZrXyQK
 mUOI+ldneUka09yGLG+aHkn02nwE8N0zvQdyI3bsAEv/F84S+L0iaiAF8Eo/6Nde17+U
 WR5lHCppoas0eMnqA3xK7UeOuSFEEAHyWzmBGwmNQCWmMrUE6aXH9xQx0GDnsjOoo/Bn
 RAgzsGB0NvLGrKFSGteecNeEKrkggfxwxEOElWI29/wYJaKjldR3df3hm7Dkku8Js7To
 nO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VCqVdn1MR+8q4KNBpfFHWACRBuZ63eQE6lUtevF78ks=;
 b=rFsGpy2wEdoctxVylt8QetG1oE0tV4PBulRJL9wxvI9MUKnkz8YE93Bx0GM+/txXHd
 QB7IIdvBdPFbcHpsjQ0zBKvRIGC2Kjgw73b3dzF/y2Aulysg7pRkhra/xOcdAi33vpZn
 8PRzzcyL5w/65BReEjez1BHREPpKfA2seFPIdZ9cP8118Ptp4GdQLogy+zbRLChfujPA
 wdUNPMVfylpYcFaFY2xjYQWUvZt4Vq8c8I4R+55ViQbsYIGEorDnP+P3fU8i9F5RElzA
 0mQaupSoMimaNJREv0IfAmh/kHLMqOxXgQrR6cchtGsezIrwcKxTsMAF/8WY1KAZnrkE
 JHwA==
X-Gm-Message-State: ANoB5pkj1mcHmmf9vMgYi+azZxSVI6es1rpE3Af44gU8f4M1C7wSnfhx
 wlhBDRF8/fbnJqMUInlo0yBiq0WfE/d6K7LAtNE=
X-Received: by 2002:adf:e710:0:b0:24c:f3b8:816d with SMTP id
 c16-20020adfe710000000b0024cf3b8816dmr24771787wrm.60.1671534199819; 
 Tue, 20 Dec 2022 03:03:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b002424b695f7esm12340039wrv.46.2022.12.20.03.03.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/5] target/arm: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Tue, 20 Dec 2022 12:03:06 +0100
Message-Id: <20221220110310.8656-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220110310.8656-1-philmd@linaro.org>
References: <20221220110310.8656-1-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NnRcx7+HU4it

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

