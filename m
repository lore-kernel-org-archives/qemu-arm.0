Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp853193ejc;
        Thu, 23 Feb 2023 07:57:30 -0800 (PST)
X-Google-Smtp-Source: AK7set9aOtdSZY7hUy7jdJHtCQVxTBuXgfefQl5M54sye9bTNXy8RSewNQu1dDcQGKIb9eY3Di/Q
X-Received: by 2002:a05:622a:cc:b0:3a5:1ea1:bae2 with SMTP id p12-20020a05622a00cc00b003a51ea1bae2mr8044488qtw.34.1677167850184;
        Thu, 23 Feb 2023 07:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677167850; cv=none;
        d=google.com; s=arc-20160816;
        b=a7WSfN51OC1XMpiujyZ2yKLMxxvVdsj6ANIQokK0sQxMJmLcZy7QK9/3EZmo4EvnR7
         l7BH5f6Av5/4pTAzeLYFQm6sy1PsurRNL/cnI7hkCEikX/nWREUpAjdErWMSHBN8h56N
         kyFjpGq8ReXaT5RyRtmYh2iCoRf+sLFvf957AWZigKNuA6jXgfhri4bJ+fIU+q27uWHq
         3H3hEh/DjfptFt7CQbP0VzmqVtwGchqWnw8yv+4/Ysn+C366Qhpj5A+XKrhcG1stjoem
         RGtH+PEgQHe0qYR1YTbnGJvjlMuYp/AkfDgVkzexPSccjVwGlpAgKNKh4FE5utYyr/hK
         CEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UieqvLMYtzXamcR/EnTubGkk6CG/pA9dzjTw8XpqXso=;
        b=AO2wQuxjOmGWGzZSQOjvV15USGjrsAvkqbYnjqzbjE8rfpSRkuk5YTZ2yoPDVCAk0R
         pdWXZlFwO9T5cEUpHOEitI9E+o9e8Hv+W7yDIKF1Gz8PzHTx8jKBSlhoyr4bMcZewVC6
         Kv7YMARxETim4PNE5DKD6rFm4zcOLfMW0eWjB4mjPP5Aw0bWaZfiLcogK61rgUM+dvdV
         HZWPYUOOHn3Z9LLdKWihDmiZMZcOkfj47ObOrhdg++qiX0mpozFIGH50mKfdF5NEqwQO
         WOVfRAVOFPWOwQVWN9tGP7AYqkbU2/tAYqUmRBk4fIFkJO+cypVmoYfA2Xthhi+TAbeb
         putw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjVVFIv2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020ac87c4c000000b003bd07a8e55dsi3012867qtv.683.2023.02.23.07.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjVVFIv2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDwt-0005Py-6m; Thu, 23 Feb 2023 10:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDwr-0005PQ-P6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:55:57 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDwp-0004ND-Ve
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:55:57 -0500
Received: by mail-wm1-x334.google.com with SMTP id k37so6330613wms.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UieqvLMYtzXamcR/EnTubGkk6CG/pA9dzjTw8XpqXso=;
 b=EjVVFIv2OXrE8yqSVI9DjSKfmt0LAHM75BrT+OuZP3PhrTuz62Wjse51IkrLswrb1c
 IHst7NlS6LrDmjYV2DzRBs45Q5pTURP9AQA576ycylUkX/Rc6Z2rVFWq5Rb8jlf7Zd+2
 GT+4/6Rvgsy8ZbGWt1bfkeediG7KRV/xb8jVeSWzmUHdvmaJJn5uOw5bgjmAmdaKoQXL
 9bTtXCFvQRrK7vcnTKyotFO+6NEpWLp1PptUDfYWKClymqznFWgbBi7FWeWiE1k1aNZ+
 Gr1NFw8WH5Jp55JB3iIOMZwPnzb/p6tsRYiZjM894Wl3TXQrOOIYiHLss4EMpK8qLXet
 KW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UieqvLMYtzXamcR/EnTubGkk6CG/pA9dzjTw8XpqXso=;
 b=hR6qvBsi9s1sh3G6gM1LVA9YfixBzcjbQPIFlsB35UKQOT/WOA1pHD2nic4CDN4JQ+
 pejeS9mlmm1JrPw4cAy312ZZsNVqqh7Jbpm+SzM08hR3Kxc7psCQvnYWA36OX93OcKSp
 Jf3g1mYXJuqK4xfxpWGBFFPgQZmGSZn5lAiqdqKZF48ehpLHv0VgwIJY3JzsDHliP4Ju
 YRR+5FEwi6Lda/OcbEOnXQmBjiLNAnJKHMateF1VDqla4hFcMjQFJTPyz6i745PazT/p
 QvFUiCPUrlCdWTGTD0M6zEL7+teG3lc2VcovaLPeUa3HB/0I5vzPdNgLb5ro414sXZnH
 73yQ==
X-Gm-Message-State: AO0yUKXah2zTLFIIWRJHTgbWdCKE3HO0dH4J825cQ7CDyWdX0mcIq8mf
 BQlPLTVA+3CALOctqadLtFirNg==
X-Received: by 2002:a05:600c:3412:b0:3ea:d65e:4b31 with SMTP id
 y18-20020a05600c341200b003ead65e4b31mr623056wmp.18.1677167754518; 
 Thu, 23 Feb 2023 07:55:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adff9c6000000b002c5493a17efsm7356025wrr.25.2023.02.23.07.55.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 07:55:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 2/4] target/i386: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Thu, 23 Feb 2023 16:55:38 +0100
Message-Id: <20230223155540.30370-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223155540.30370-1-philmd@linaro.org>
References: <20230223155540.30370-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: AUZdARx2mGhn

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

