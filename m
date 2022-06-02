Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5206554lfh;
        Thu, 2 Jun 2022 15:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyerqoLjABN96oMNb1Njf8Zb3nhP3pSvlEtC3w3/YmRUxgiohIm5eQjBDMKPK5nAM7fAc9G
X-Received: by 2002:a05:620a:1708:b0:6a5:7c13:1a04 with SMTP id az8-20020a05620a170800b006a57c131a04mr4549247qkb.23.1654207857402;
        Thu, 02 Jun 2022 15:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207857; cv=none;
        d=google.com; s=arc-20160816;
        b=oC6QMhwGjVBwo7t2fiJW10ROCDM2IBFzSeILygIgsg37Qd5uiMmckTdUQLKdYy3iv7
         EhVeyx+FLhYSGINdzoNQi7iaPmOLhKh2Qf8JXrtuzLZ8RBOoVcSnKHtW/xywdBn4BbHA
         znBx/WJADec7QM13eL8ayZnQnItGByz3c/wYsvQta/mnHUK8E5NiQTl+Ua3tBKDqtUYL
         UnSsqTMtVG5POp5o6XEfHwUEGXmEFRZpW6tjfEVZoa1fYFrOScV2mOfHjHlbpE5s7sAL
         mGsi25p6/yP9rHWc/i+VYU2igBsgHXr0BTf9FTeE7yHvEChHmhji97QZMtotqsz7x/+8
         kAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
        b=k6cq86TN1zCyMKvwu3mpgChbh91D8N2VHktvcIOR3kUmMzYsrQiFxg9CRUmnFsbfRN
         aip46SLJPnMupk7Ibior9qfqIpoZqwlKQTHM2lPlFCTf43duUzdsptvVXE2Xk5jVPqxc
         qNtaqrUrTfyEtvut92tqSP8j+VPDfeQ91IsMK5CDoFMxqeGzpzkyUxV/eRubF6HQdJqL
         EaA4L1BDVfhHN4piVZrlVAbhHEzMapK2xr/DtGuPGPBdG3S/YfsX7O3AhhzWfC4NHnVP
         tmToQCxZAwNMJNlvC4K/8ztzdnvcvvSGpCT1AD5Yy3sjCaVN2WihMcljocBAJETbvWTv
         kWsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="k/0rUhe9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a188800b002f91038e682si2807365qtc.5.2022.06.02.15.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="k/0rUhe9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwt1s-0003hy-Td
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh5-00051f-Tq
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh3-0008Ut-CS
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:27 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gd1so6024440pjb.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=k/0rUhe93OnFpqfx96UKtFrthpyt5fraiPax6W4qdLrQZM0Vndxhk3/P8nSZ542XRO
 ySBOBL7OuHgSkho2UceHuQhS7cJajsl/gXcPWhtbC7k36B/DndU5+fExikfHhZnXBeYM
 RW0/PKDllXKL2gxYVZ5ZTx/H0T9RYiZR6pIaCCag1DsBtUouH3pjvjpzgX2XLFCw6zGX
 L3kmayLpNdhdptNLDLTJCbRFs80y4MxxyrJ8DZck/ls9/B8ZqBCcCy7sOVkw2svFX1W4
 /HF6YT782uNIo6MXhz+uGQryI4v4WHEvrUiJccdrweIpTXUVNbrijNr/KD3Ev8bnpkNE
 Zb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=WUJ5nvfGXgn/auRbGSKg4yc1AwPLZNCYCtOKnbWrQfvMDipITOmIKSYZR/ckm3+wlH
 bLAf1iy6fIio3/t85aPLavJ5mnnTAasarZqZWkY3QsuBSFpXpV1NzPVzfxYhi/v7Uyq8
 DfEJWEHpayXL16tbRwhqDm0mPOqw/0GNMnsestAzi2FEc282IefgsqY02ODjwMyD6QuM
 aD5n//lgU6f/ND+0VCgxwMS3atP//AVxBmN+2b8dZ5KrIof5TQ/fL6czrZagxOV/+GRv
 8X/VHAnn541HtVuXwUM0hb6fuqSFwKsQxei4gFqSP5D6PzAUxtZcdMz6RUywDGVBWP8D
 UNpA==
X-Gm-Message-State: AOAM5331+l93llHFqVDqgkmyFsmLRNNn7ZWgyxpPQsMkrl7knxZ6PiAk
 wScoDpbBRyAI64elikeR20uPvQ==
X-Received: by 2002:a17:90b:1e47:b0:1e6:7d04:2f4 with SMTP id
 pi7-20020a17090b1e4700b001e67d0402f4mr7336195pjb.93.1654206564595; 
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
Date: Thu,  2 Jun 2022 14:48:16 -0700
Message-Id: <20220602214853.496211-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQv/NnS/BgBA

Rename from cpu_arm_{get,set}_sve_default_vec_len,
and take the pointer to default_vq from opaque.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dcec0a6559..c5bfc3d082 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -638,11 +638,11 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
 /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
-static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t *ptr_default_vq = opaque;
     int32_t default_len, default_vq, remainder;
 
     if (!visit_type_int32(v, name, &default_len, errp)) {
@@ -651,7 +651,7 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
 
     /* Undocumented, but the kernel allows -1 to indicate "maximum". */
     if (default_len == -1) {
-        cpu->sve_default_vq = ARM_MAX_VQ;
+        *ptr_default_vq = ARM_MAX_VQ;
         return;
     }
 
@@ -675,15 +675,15 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
         return;
     }
 
-    cpu->sve_default_vq = default_vq;
+    *ptr_default_vq = default_vq;
 }
 
-static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    int32_t value = cpu->sve_default_vq * 16;
+    uint32_t *ptr_default_vq = opaque;
+    int32_t value = *ptr_default_vq * 16;
 
     visit_type_int32(v, name, &value, errp);
 }
@@ -706,8 +706,9 @@ void aarch64_add_sve_properties(Object *obj)
 #ifdef CONFIG_USER_ONLY
     /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
     object_property_add(obj, "sve-default-vector-length", "int32",
-                        cpu_arm_get_sve_default_vec_len,
-                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sve_default_vq);
 #endif
 }
 
-- 
2.34.1

