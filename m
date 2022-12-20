Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4232900ejb;
        Tue, 20 Dec 2022 03:14:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77r3CdoJ60vGTrJ1wpI9waaGjLk0KoKWnEPCuUR4q4jc1yLIuFjrfCpKHtEwxFKHJkz4Hy
X-Received: by 2002:ac8:75d0:0:b0:3a8:2b87:9fd8 with SMTP id z16-20020ac875d0000000b003a82b879fd8mr39961908qtq.48.1671534872781;
        Tue, 20 Dec 2022 03:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671534872; cv=none;
        d=google.com; s=arc-20160816;
        b=BWOK3UbdfCjGtsC0QD0AUbnrleuUHByiRU8Cf+JmafdOgIwlCZbZl4G63RVnovgkwc
         g7PKrzf2Ow0ZstKApTPe6/U9aLf017AdNfSnhD5SWUulmF8oT72usHPnFl1yLkskclum
         qfG8PsfQmoKq8foACzq6nNyHhax15dPMPp01YYxtxmuOSy0W6qRWhmZ88Cabnr2ZXufM
         rIuyNJiSU7Kzg/gnSV/14OxRSAiCtj7j9MmqRAaErk44M3eeAX8Q4ixpUB8JGB51FkBm
         iveEzdmD3BKAUaWpnzl/CYCXDUMih5Sbmphu1lbUj0WTNsBTkG6/YoA7Zt1j1Tf4CiKj
         HykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bpGlv5Im1QiqXz4tNSw5DXHhllEUKFBTGKynECqClis=;
        b=aog6gc/tbMpw+gyN8w25L1iR9BYvSsLNXyncpdASXHh9t31xWAPqXNcT9ra5xoBacC
         2+Hdwb6nUoMJyHOI64ow1WtOfVmOuewAgFbnadmqksnMUg2ReTnCktxMGxVhsHfdOuVy
         +ANjgLlYgjS+yczu8YXXnlyjESDpLV0q4BC2cFmdLcJwtK57z//d+/hSOIPFuazllDi3
         tQzvib3gNZXWQQQTqeF9zZgbEdQbp9brnUcuEbwS8tZQrpJ4LOtpZZWYzb86aMO/p0Zh
         XXQMGSXD67KfjvIc1an7cUD+t6f7zNKCoEKITKxkOR69MqIzzOsIzBjQPckqvZSDhbOO
         sYfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKlr0Zk6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020ac87614000000b003a5cd4b067csi4906285qtq.776.2022.12.20.03.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:14:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FKlr0Zk6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aXB-000464-B8; Tue, 20 Dec 2022 06:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aX7-000425-DM
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aX4-0003hv-NE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so8466207wml.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpGlv5Im1QiqXz4tNSw5DXHhllEUKFBTGKynECqClis=;
 b=FKlr0Zk6ExK6JcNhOcjuyY+udH7JTVYrpyE4cSm0vyoOg91WOu6KQdyusPNjpxSWk9
 XopBqEd0yDsOR4um9wk9SGbsWJTSKugpyQJFC4B11Q3m2sWCwM2whVi8eWx5bu4Wim44
 hlcfqoifG6mtcwddkqsrE9JREfw73D50hQ53RI3hEYvCwcIWRyuMgvYlVtHUCTBV09Vw
 pRsdvkXI3fwEBmFWAuNL+Cy4uCvqIu27bxYy+uuGM7p9LWZdFamWLx5e5i1vREdc+B6A
 mds56Khd0POMG1Q0wbRTrRyMat8EXsWh2BkGjKegdnoOdRxE3c5lNrrVjyhjnKZiIn1k
 oLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpGlv5Im1QiqXz4tNSw5DXHhllEUKFBTGKynECqClis=;
 b=HxRSX76/08LK+ZNDOngMSpJnl8rjao9ksR6NkZ9UuWaZxBuGNNxHdOxpbIx0WqLazl
 SU4kuqZELgXdveb2WYX1ToBC8lRlvditL4O7wApg4uVSxKjYkot8lWSHvPYGZfMWV4oU
 dPwfJqR5piRa3LHG9b/ZdXmwkHq6/9JIKayFXY9E7E9t0ywIeEWFNycXYhMCT5amStjI
 MqDFrAnI4V+4XbHoJy2L/hfnUmemwu1W6j0c5jiHJuTk7i4SZ9y2XH5u4rXCkyyPTl2u
 xLUMHiVgfb/8X1twnOGAwObx1gv+axPpBnRz3eULMhMC1M4ForOVg1VPacW96TIAFaai
 Zl4Q==
X-Gm-Message-State: ANoB5pnvyu0p6S0SkaLEoYsdVtVV8gSDJB90yabYVYaGU2h0Ff2+P1on
 IUIN1hi0jHNtj0rAxvx/235eUVzxTDjwN2noYZ4=
X-Received: by 2002:a05:600c:20c:b0:3d2:39dc:f50e with SMTP id
 12-20020a05600c020c00b003d239dcf50emr17157167wmi.7.1671534696821; 
 Tue, 20 Dec 2022 03:11:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6b7f5567csm2669421wms.0.2022.12.20.03.11.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:36 -0800 (PST)
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
Subject: [PATCH RESEND v2 2/5] target/i386: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Tue, 20 Dec 2022 12:11:19 +0100
Message-Id: <20221220111122.8966-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: +Cp6ItdmvtSY

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Guard qmp_query_cpu_definitions() within CONFIG_USER_ONLY; move
x86_cpu_class_check_missing_features() closer since it is only used
by this QMP command handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.c | 74 +++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae502f0bfe..435980dd3a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -31,11 +31,11 @@
 #include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
+#include "qapi/qapi-commands-machine-target.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
@@ -4713,40 +4713,6 @@ static void x86_cpu_get_unavailable_features(Object *obj, Visitor *v,
     visit_type_strList(v, "unavailable-features", &result, errp);
 }
 
-/* Check for missing features that may prevent the CPU class from
- * running using the current machine and accelerator.
- */
-static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
-                                                 strList **list)
-{
-    strList **tail = list;
-    X86CPU *xc;
-    Error *err = NULL;
-
-    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
-        QAPI_LIST_APPEND(tail, g_strdup("kvm"));
-        return;
-    }
-
-    xc = X86_CPU(object_new_with_class(OBJECT_CLASS(xcc)));
-
-    x86_cpu_expand_features(xc, &err);
-    if (err) {
-        /* Errors at x86_cpu_expand_features should never happen,
-         * but in case it does, just report the model as not
-         * runnable at all using the "type" property.
-         */
-        QAPI_LIST_APPEND(tail, g_strdup("type"));
-        error_free(err);
-    }
-
-    x86_cpu_filter_features(xc, false);
-
-    x86_cpu_list_feature_names(xc->filtered_features, tail);
-
-    object_unref(OBJECT(xc));
-}
-
 /* Print all cpuid feature names in featureset
  */
 static void listflags(GList *features)
@@ -4875,6 +4841,42 @@ void x86_cpu_list(void)
     g_list_free(names);
 }
 
+#ifndef CONFIG_USER_ONLY
+
+/* Check for missing features that may prevent the CPU class from
+ * running using the current machine and accelerator.
+ */
+static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
+                                                 strList **list)
+{
+    strList **tail = list;
+    X86CPU *xc;
+    Error *err = NULL;
+
+    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
+        QAPI_LIST_APPEND(tail, g_strdup("kvm"));
+        return;
+    }
+
+    xc = X86_CPU(object_new_with_class(OBJECT_CLASS(xcc)));
+
+    x86_cpu_expand_features(xc, &err);
+    if (err) {
+        /* Errors at x86_cpu_expand_features should never happen,
+         * but in case it does, just report the model as not
+         * runnable at all using the "type" property.
+         */
+        QAPI_LIST_APPEND(tail, g_strdup("type"));
+        error_free(err);
+    }
+
+    x86_cpu_filter_features(xc, false);
+
+    x86_cpu_list_feature_names(xc->filtered_features, tail);
+
+    object_unref(OBJECT(xc));
+}
+
 static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
@@ -4915,6 +4917,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
                                             bool migratable_only)
 {
-- 
2.38.1

