Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp688240ejc;
        Thu, 23 Feb 2023 04:45:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+9+zMXJGMfqYkBSPj/aZwbSiqFJdTUhKahS3SoYp+qrizZuzags3qmPAG6e9/YWKpxm6Wf
X-Received: by 2002:ac8:7d01:0:b0:3bf:a031:9519 with SMTP id g1-20020ac87d01000000b003bfa0319519mr16334786qtb.14.1677156313381;
        Thu, 23 Feb 2023 04:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677156313; cv=none;
        d=google.com; s=arc-20160816;
        b=s67TtCjtZrnzMJplycQziwl5+BcHlkTkuQlromFBkIL/dQ05Y4Y0D8z72jLxs2SwRl
         fMclLM4hCEjdc0eoVe8zqzn135kelWMHgy1DLazv0tkMyWbJK6pKEfGa2RJkZ4DAvE2A
         bzbg2F/s+5teYRpZ69rCPFdR405ZlT8fOeYNcxnjmRYTB9GIdmZ8/HdV0oZTD1bk7UkP
         omTCQ6dHdE+d8QkyN5Klso39+Mohf59AzmnGpdYnJ++07rlbLrckBuzxzbR3zOdmJC46
         Ny+3decC+LeIYlwoxKL2Z3jSFq6jl84WemJW6z2RRsSvh7PblkTFvosDQw2UWL0tIluC
         F4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UieqvLMYtzXamcR/EnTubGkk6CG/pA9dzjTw8XpqXso=;
        b=BvqDsQmLSmMsNGkoU9fBb9Hq6IbixQRVwZaoIotqMtnlfRT1kAkKfQOqm5b+CmwCfY
         EJoG8KKCn1fDxITso1xyCcA93pWyisV6rtXYP7ERvFVAcktCqj71B0veLK4KYyngTMeo
         yk0kUdMdWMch/fsBW/rG+X4B/cawXxQKDO2YFDAAFStMM3sZOsuEYzomdCu0RvQhe2sz
         7g1WVd6ssSRSOA6ps4XLXB7P6OdwRx8kFJYE3PsSXqwZ5i7kfcBjmNCWWWTRa3j40gf2
         3ACT7hblLF866MraA+qpPdQXKviAp/Z2cBhW6r+NnlCAnsnx7ZrK2T6UnynnqF5uZlhZ
         5jXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJnuX4dT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020ac85e11000000b003b86a673061si2319433qtx.128.2023.02.23.04.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 04:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJnuX4dT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVAx6-0007bS-9h; Thu, 23 Feb 2023 07:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAx4-0007b1-PF
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:43:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAx1-00032x-P8
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:43:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so3698736wmb.3
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UieqvLMYtzXamcR/EnTubGkk6CG/pA9dzjTw8XpqXso=;
 b=JJnuX4dTA2N3L180fA0KX5m9j1rbgos4BmjcPIetUoy2apXAg3vVhrkQbsCgYmCr9w
 ciIMPCKSO1vtAuNqpHkxTttzI7Pap3aIV2gE6MeuZ5uIurX9F2bIxCCAkeJn5LtEqCT1
 vhx41Hzx2JEYGcP7E8zSZRKr2YKeLYWTkl9eKqMzUSb6cxz3p3jSaYZoi/3fN9bNQz5W
 amHDqzIL3dbI7/TOSPyT6X5rM5IMxjaxYXQLPaz1bfuaN1xPSY+g5kTUg3qJdrGN5x/o
 2TFOhXXCcVGSXlYMaYd+vwzPO6z5hbas+rSAeLwRk3BBwCCJsE9JpOLC3eDKRYMJ45yq
 +7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UieqvLMYtzXamcR/EnTubGkk6CG/pA9dzjTw8XpqXso=;
 b=go3vDLySvaQSjOneo93o4vG/xBlzyp3w/i0ZGC1IEdYlyF6E9ySWdiAtj8Ra1LQUxi
 adT/xkES0F9Fm7SChyQ02s5LyNtbVwmK8wiuA5zgC12G2T8ewbpzGyNBGwVT1JxMVE+A
 7qteWVvg4jrxnMDsPSz40po2HBuXSwHNdffozA3copkbFbnjF3zfAMcCoaq/gUBy2kuS
 v6LZWu6mvv9cGoQ5G0hscwjf5W5t8CRPLFJjq+NScuAUlCJ8o1nQDhK8x62NnL7xqJFI
 qJcLjJq4A2ETR86zRUzxe9qtcwFI31Qbs0fXBPyguqOkueCPL3w6vaJb0s9QgsuNiZBv
 q0Hw==
X-Gm-Message-State: AO0yUKUeBGyHbxs1zImsHUc4MPgxrf6JrktqtIm0ljsqh1N2uOmKWJtQ
 Hs1dVWTwR/judZYSI1DiPPSkHQ==
X-Received: by 2002:a05:600c:1da5:b0:3e2:1dac:b071 with SMTP id
 p37-20020a05600c1da500b003e21dacb071mr10813211wms.13.1677156234252; 
 Thu, 23 Feb 2023 04:43:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056000114900b002c5584d0e3dsm9976086wrx.24.2023.02.23.04.43.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:43:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/4] target/i386: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Thu, 23 Feb 2023 13:43:38 +0100
Message-Id: <20230223124340.95367-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org>
References: <20230223124340.95367-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: YLXo9WGkFY9x

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
index 4d2b8d0444..c8da082b4f 100644
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

