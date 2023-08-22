Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp467691ejx;
        Mon, 21 Aug 2023 21:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbf95JmJViYxh18FQp6SutyBvb88cf2NrTSy0rUI/I/0X9r3IuCH3IaNx97KeJaVYWrHfO
X-Received: by 2002:a05:620a:24c2:b0:767:ea44:daf9 with SMTP id m2-20020a05620a24c200b00767ea44daf9mr11064699qkn.31.1692678437339;
        Mon, 21 Aug 2023 21:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692678437; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqwYu2tOB3pw6CusqzB5g2NjZSuM3TzjoJys+9OomAvUFLo5PjMWIB+XITG4wGZQfN
         mGa9ioHAddT/KESClS0ATpedvK9EqBpu4rIVMhy2AtJZF2hx9k9ixPTWRVxclJQm8ZKS
         rApoyKtqQdnCZtOSJS0gEbyy5ou22hraEVatMolGEaeSoP5psIUPlKkil4zSra47KkG+
         fLr1TAaWokmg6Jm3skykBjEOKEglD8AjhTyE+bC7nqZh8F8CNwj6aebrbvSMC5Q7VSOM
         GDUqoNihsfaR6TJ/lHlQSvDQnnssj75LrS04EoGaqoQ5F1jYJ3G+QLUr89334TPqlWT2
         Gf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=toHkAvNUsxddzvlMZhAu54QiPCxJpyfW30OdoFF5T1c=;
        fh=JeB3dVDTdYB7kPCK0u8jYmZ9QUU9ibi3wPLgIaJF/lk=;
        b=eCEGRRTV98RNrIipkVTQVMFNuhtMGuH+ocbeTFrvhohgQkS9CJCPPjX44qWPGRX3YS
         y8zVRTJ9BbuSFFtXRvCor8ALJll3JUBJ0UmMvq1z4fMBfB/AY/4LW2MNKZtF3/kn6R/T
         fzgJ8gSCRybZniiCZTuRktsO+1/GO/HsonBeeN25cvB7b0f2PS6hXHcTEJcft2sWxzsk
         vHGDPW67gqXQKqkslH7hhdrn+ZZyB+Cv1iDsFCBMWOIfZk9Vi0YTWKSKfPvPBou4tohb
         Bk0C6ZR0rP9qJn06fXapfc/021dINmyhsmZIoDBi6HzGvprQXjQVx9Uf4MrRKpC/1Z7n
         FJgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ingf3qaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020a05622a111500b00403df34987asi775401qty.376.2023.08.21.21.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 21:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ingf3qaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYIxa-0006Jn-BE; Tue, 22 Aug 2023 00:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxY-0006I3-Rg
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:40 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxU-0007WP-3U
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68a3082c771so1564156b3a.0
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 21:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692678335; x=1693283135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toHkAvNUsxddzvlMZhAu54QiPCxJpyfW30OdoFF5T1c=;
 b=ingf3qaVb+xg81KpgXHZDvJ1QNhH4nNIYCp3QKi06MX6QHT0Fkp5Rzp7kPeVVuMby9
 iAl1B4EBogIm/Obi8M4tAtXWC2JZmf+7X+h39i6OzL3pfoE0LPYgjUo9VzmExXSmPsFm
 TxlFf1dMicn3MrQAJJ3nuhpZ+uj2aniZTZyCExHfv9MnSMyX5H5vE09xujDFiB72NjeG
 a8IF87FLYobPsSxcy6Q89beRPZzPlmEa1Uz6ZiKHtTMOC7Qrby5Bh0uGUDiD3DFPG+32
 Juja2byqj7mPqDHtWX9qIBIqBMxs27rivIcH200+jnpVuunUV8xsENffT8JDNmEa2LUH
 rrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692678335; x=1693283135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=toHkAvNUsxddzvlMZhAu54QiPCxJpyfW30OdoFF5T1c=;
 b=Qwf8SVSAy5tpKgiE9hzXi9eY3rmGp3NoveP9NshKOnZnPox36KYE9fQwHPbvroZO/e
 tTmrDftxYbwMn7A7c6eWe6myE3bdRe61XTy0yt35DLOzJGvFVZqSBu4speXqCOzJ/qKk
 VHMDadMiRKtu3aFvcM+VHvhRqSKMcW3U/krD2UDDBUqvcq1XZQYUtj9gFYBfBP+MqPaw
 ab3o28se+BWjX76HLckioXtqwXNylNSMQaeGp8awLaXy4Vg8I08TtUS/rlrgRFJGXHGg
 SEu9aB+3+sq2UT0R9jO+7t3b7iqOoB7KLdCJrUtr+gc4hG++mWU5PJSiX0ZrWzFvGS0L
 ZSVg==
X-Gm-Message-State: AOJu0YxhqnfWGzcOmmrFpyCUfaR1vlds7J82l43QH+Uz6+W1Cl8X5hA1
 bflNucIbbjF1GW9P/pXjQDCJw328TpX1o+wkz1U=
X-Received: by 2002:a05:6a00:801a:b0:68a:4163:66f with SMTP id
 eg26-20020a056a00801a00b0068a4163066fmr8829415pfb.9.1692678334683; 
 Mon, 21 Aug 2023 21:25:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:2c08:e710:4459:46f1])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b0068a3f861b24sm3364908pfo.195.2023.08.21.21.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 21:25:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v4 3/9] target/arm: Add feature detection for FEAT_Pauth2 and
 extensions
Date: Mon, 21 Aug 2023 21:25:24 -0700
Message-Id: <20230822042530.1026751-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822042530.1026751-1-richard.henderson@linaro.org>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: 28O1tQbeZSYO

From: Aaron Lindsay <aaron@os.amperecomputing.com>

Rename isar_feature_aa64_pauth_arch to isar_feature_aa64_pauth_qarma5
to distinguish the other architectural algorithm qarma3.

Add ARMPauthFeature and isar_feature_pauth_feature to cover the
other pauth conditions.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20230609172324.982888-3-aaron@os.amperecomputing.com>
[rth: Add ARMPauthFeature and eliminate most other predicates]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h              | 49 +++++++++++++++++++++++++++++------
 target/arm/tcg/pauth_helper.c |  2 +-
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fbdbf2df7f..e9fe268453 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3794,28 +3794,61 @@ static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FCMA) != 0;
 }
 
+/*
+ * These are the values from APA/API/APA3.
+ *
+ * They must be compared '>=', except EPAC should use '=='.
+ * In the ARM pseudocode, EPAC is treated as not being implemented
+ * by larger values.
+ */
+typedef enum {
+    PauthFeat_None         = 0,
+    PauthFeat_1            = 1,
+    PauthFeat_EPAC         = 2,
+    PauthFeat_2            = 3,
+    PauthFeat_FPAC         = 4,
+    PauthFeat_FPACCOMBINED = 5,
+} ARMPauthFeature;
+
+static inline ARMPauthFeature
+isar_feature_pauth_feature(const ARMISARegisters *id)
+{
+    /*
+     * Architecturally, only one of {APA,API,APA3} may be active (non-zero)
+     * and the other two must be zero.  Thus we may avoid conditionals.
+     */
+    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) |
+            FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API) |
+            FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3));
+}
+
 static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
 {
     /*
      * Return true if any form of pauth is enabled, as this
      * predicate controls migration of the 128-bit keys.
      */
-    return (id->id_aa64isar1 &
-            (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
-             FIELD_DP64(0, ID_AA64ISAR1, API, 0xf) |
-             FIELD_DP64(0, ID_AA64ISAR1, GPA, 0xf) |
-             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
+    return isar_feature_pauth_feature(id) != PauthFeat_None;
 }
 
-static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pauth_qarma5(const ARMISARegisters *id)
 {
     /*
-     * Return true if pauth is enabled with the architected QARMA algorithm.
-     * QEMU will always set APA+GPA to the same value.
+     * Return true if pauth is enabled with the architected QARMA5 algorithm.
+     * QEMU will always enable or disable both APA and GPA.
      */
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
 }
 
+static inline bool isar_feature_aa64_pauth_qarma3(const ARMISARegisters *id)
+{
+    /*
+     * Return true if pauth is enabled with the architected QARMA3 algorithm.
+     * QEMU will always enable or disable both APA3 and GPA3.
+     */
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
+}
+
 static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 62af569341..6271a84ec9 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -282,7 +282,7 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
 static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
 {
-    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_pauth_qarma5, env_archcpu(env))) {
         return pauth_computepac_architected(data, modifier, key);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
-- 
2.34.1

