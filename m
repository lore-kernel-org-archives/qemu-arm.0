Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4227265ejb;
        Tue, 20 Dec 2022 03:05:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvM/kGSKfOx08z+tdOUwwpgi9Zo3KDQUAcj+F4Hn8r3FBYgCuICWNd4vWcISuwTXTbVVK6F
X-Received: by 2002:ac8:5481:0:b0:3ab:5bbc:bbe3 with SMTP id h1-20020ac85481000000b003ab5bbcbbe3mr79861qtq.19.1671534327542;
        Tue, 20 Dec 2022 03:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671534327; cv=none;
        d=google.com; s=arc-20160816;
        b=Sr3hlTanDfNd6G49Rn2scL5xd9i80wAYRvR3XfFEpwS3SMljPISVNwCGkBqQ7eVcf2
         mDghfVr+5xWgJKTXEGOTL9lwXNv53aD3qQCT1Hobbthh+LD7uQq/sEAZhWnrrTYn9bkm
         gd9CToAPQQiM9M/WKoZNTpJQQ0/n0eN/3noLYH+77L1ZB2ayP9/Xh2LvG6qsN58mDsXg
         PkONKM+yAeINcNKUNRwCg7fx3Cq+dmsL/1cFcD2LFePI2yXVOLS5Zzdvb33eMPJ5Qc1Q
         I5y4xKBfTNJWFQKyN0lAyVAH1TtFGmXZmqae7t2t5+/Yb3OGz9uBaERdscLPlYmRgsBo
         rfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N/h6l6Dt4LtktYJzyaWdIUhcMQmq+IUjXoUtOmfFZYU=;
        b=fd5gk+zzHxFM1ZHMqapUqwoenMLfUcZ3yzwXkAr4tFTZ5ViywZq8Ka5zbsAOTqmZHX
         M/m5rr+UK8Z/RacoQ9E1G+52Bv504olOAJU2Q6qHZP6lonhbtbk+HC8pX/aqhb1PGOzA
         tgMjmLUevccemINbAbY1l5IQo2fRJeBbbCAcF2safNC5soeBIW/+fIBYPG3niNzCKFAd
         rEMgoywE1FzaLVJ1KBw4CGCM671HHihOvhaIeTsyGyHkKg0iH0MOx82Tvhde5ObhYZxd
         2gd6NGzY33GTc5xnL5C+Em2k7XVjNJu/FKYWbk1USj0j+d9J66tQurVnQyTIVGSzKtY8
         plSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1Y6gzfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ew12-20020a05622a514c00b003a6a4397a34si5121538qtb.138.2022.12.20.03.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:05:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1Y6gzfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7aPF-0000fw-2K; Tue, 20 Dec 2022 06:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPA-0000e8-UE
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:03:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aP8-0002Fa-Qy
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:03:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id a17so10204602wrt.11
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 03:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/h6l6Dt4LtktYJzyaWdIUhcMQmq+IUjXoUtOmfFZYU=;
 b=B1Y6gzfnRX2slGZn1yrWt62YpN3fgoftDdBks09/8a1Bqux/jGxPx722o07OrXZ1KY
 egg+6Byaq9uTn0vnN21lMNx3hm9iaUx1DiSSiTdPc77kqA0y6O6uxOdn6YTBCldLklvz
 +1Ci9Quaz3moHMRPHyYd4heuuwtpoKsdv7zVkjDqKdqrF7X1Xd6mXG/lQN7VEvkLC+x4
 n9lSyV4wNg9w2+cTxncCDxkI90goyDgZ32Lsc/IaMo7sJKioGSr8DVyTdxCgZtkaisKO
 F1aX7qFd3Yb43PkY/fWXuAuKMvOV5OeuGOML1jyV/huDCRIvPmjIaJPA32HMiF2HRLtA
 jgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/h6l6Dt4LtktYJzyaWdIUhcMQmq+IUjXoUtOmfFZYU=;
 b=Qw7Hf/nLwQ/IOqdwBDniNKBoYaCc01EiZiqkuXoiR7EkRGBlUzIJ0ytvjQxv1iX9Gn
 r1OHp1/AaPyXg0hRTegKjUtQ6voPFNcL2YrZXfz5mF2wGSGz0P/Cs4DpAFDn384cppPC
 RRCwTHQS6uuFrCuigVlSPREgIJGBYzrKCERB2BswbjniomJdSz0Olp4lnzFB6aN/Agqz
 VdXWvRqVJyRRPqUcs9xxRukjXYiOiyjbsEguzbHgweqTAZLi1wE8tbgtESoZq4lNGGPd
 rJwDNIp83bu4G3nXvXXkSy040HdLVT7Vj9pbj/2NzDBXFqK7O2D+CkR4R/bD2532lfUj
 CwaQ==
X-Gm-Message-State: AFqh2krQqy3ozBfUCWn6qkJu0+eMeLEMhAASkyRRpwXeyYuWA6fmv2+J
 UWVFTKajIJv+eXSKHl+lbcd/PQ==
X-Received: by 2002:a05:6000:1c13:b0:263:56a0:4fde with SMTP id
 ba19-20020a0560001c1300b0026356a04fdemr3719696wrb.14.1671534205962; 
 Tue, 20 Dec 2022 03:03:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az29-20020adfe19d000000b0024246991121sm12402834wrb.116.2022.12.20.03.03.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:25 -0800 (PST)
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
Subject: [PATCH v2 2/5] target/i386: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Tue, 20 Dec 2022 12:03:07 +0100
Message-Id: <20221220110310.8656-3-philmd@linaro.org>
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
X-TUID: 2MgMdO+NncxC

From: Philippe Mathieu-Daude <philmd@linaro.org>

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

