Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1252336dyc;
        Fri, 4 Jul 2025 07:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjFNi1Ikho2VWDQJE4Bn3hVkVEAz5oChtB0UsAhHM2SzV5Ni3dw5LUtZkifqgWZf+nlys5fV3pty3zDg==@linaro.org
X-Google-Smtp-Source: AGHT+IF/8wBmbkduVnojt9rdVDwbWWq30QM9RcSjVJWFIMQZzhuwnlw8JHEYCm37fbjxBqaoGjJC
X-Received: by 2002:a05:620a:708e:b0:7ce:f58e:7e9c with SMTP id af79cd13be357-7d5df107714mr286812285a.7.1751639195888;
        Fri, 04 Jul 2025 07:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639195; cv=none;
        d=google.com; s=arc-20240605;
        b=IngZC6kGHEGMpI9EafnuqdpzjJLkZab8ko/sKYIAeENf1c0Cg8FmszhNJNAHUanf/2
         IoK/UvslCMLrlb+MvSfuv+4UxZoagg3g2mZU4J8pQNvAZo8TjGSAGLpIAeuSaH1N525P
         7WYpq5s5w56T/d1pEcuZMdQ824Qsa/Uh9TKV14MfXb9VsUpLwLg1maiJ1sUlbGjBoJP/
         Jv0NEingzx1pnSPZDUFM3M9SpId3Wnz0F2qh1yKdnkhvMsLhnWHgffwcJeoA8qjZZ3/v
         4dOkCJjQi/Rree2kIdhImNQ0eoSL0dz+zBlCVpR+rvcpS0LWnhfLGm1yYo0hWrTzdtm+
         Dkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MESEd0mA1nIIoktuVnBsPsHvzltJ4JN+uRnJz4lGeYA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=GM2T0Gc9IpTTddbXeA2x/FFYUwZpCF65q9c/6rVptd7BQs026medcf0F/Uluajs23a
         ZTH3CW5g3JouiACtAJVlhV4RuXr6jlX0kMVj91lWOxEY30l9HPJAVLKFrFFbVAWtJSNa
         PoOBtnKkj2Y7Pc/NMCQu2jPkNVII/Ppr+8WCbO3GxY/ypvKT6HQxgmXdALozGQ16nVA4
         g7t/SI/S4Tia9sLo63ue0QNPGBOkLhDKfvrZPzJlLA8xZjPtKJNEUYACdl93OxmyfZAu
         U3FburoNpaQ0ytug7IO/4tx9tVC7uSiaD8zzVrBmssHcTxJS5/IkAhqMHXlgSe/PBfXj
         mYOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u6l1jDgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbdea488si207370785a.145.2025.07.04.07.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u6l1jDgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhKZ-0000IR-Jr; Fri, 04 Jul 2025 10:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhID-00053n-Cq
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:36 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIB-0005cP-KU
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:21:33 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2e9071e3706so775983fac.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638890; x=1752243690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MESEd0mA1nIIoktuVnBsPsHvzltJ4JN+uRnJz4lGeYA=;
 b=u6l1jDgEJr+umjKiWJlYj2NkpOdLoP3Mjm+yJy/7Z+LaO3Y83+K6uMDh07qMhpv3kF
 SzAyVqADxAgx/ta37/HhJRYXUHHh5USWkrp6WxGPtAeqLYU3doMka+/fsphGYvBe6Ohb
 hMComGFMAfbOtaM6nWgPmH06NOzGxCOex+dxsprmqAvVnfiQoaq3wfxqxawVPvDYw5oa
 7HTe3nn7S+dnZo7xNkT4ogbGsZyAeJsyo11h9dDYs6tJ2jpsMCgsgD/bV7L5m2iXI9Ez
 aw3FIuCQ1qVS9UKm7D09YAanPGXen1ShDpvsUGJ34dq+ayQ6ZMvw/icjADpIcGqRAj6m
 qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638890; x=1752243690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MESEd0mA1nIIoktuVnBsPsHvzltJ4JN+uRnJz4lGeYA=;
 b=aPcNrwpRR9TUc9WnZVbXrdimTqIeW+y2g9+l2Zu91TIrZfRokpsuPbbLn4xfIuFfHe
 98fJsJnoRAv+MlNp4lWxxcECkBk7dpKNPsKAyWTCyog0CdUD/9w1jS9oDwop0E9mAU1v
 j5A00blwbjr7B9oR+wmdRm8W2fArK50i4qW8GcRk2MXlNU8ixxWqp1nkp4S8j2j8v5Tt
 SbXp+KXB5ESoCBZ3K4vUxYSjef2r1YqiQz+5a31O0Q9wCJBndaM65H3QEQZM+0dxbsyA
 h8CUNBzlZtSVXOLCBVG+PdjE26ZWJV+VyyDAcC/qGRyhDjTnGTCnNiFsi6P6w48wON0P
 B/SA==
X-Gm-Message-State: AOJu0YwgItVeLdKALJywd1NvD2whL1AoM+ygYxWAsHvNgw2TNzGhI6iy
 qsPBLuM25adf0T5yBP74LlAcF3Clc2ravE9BVoNt3fy3mL8LrW0jESI3ULm/scIv2IWLrbkbtdi
 Z5qmp9Pw=
X-Gm-Gg: ASbGnctLpb75kUt9+ZtFr96tFaC4GYcLBHR6qVDVqtY/zENOUTRTbDOo9eGEqfn5bS2
 HzIQsyBS40biGc9aJ6GaDtU42rTrptO9ymFfXHQSH6LKw8k/5qUPwSqpk7kc5ejIPFiYOw2u8Jr
 9n0A6I34PZHLcH6kvhoQljCnokA/hbT5afkETKlJxMxANXLOQzEn7rca5mXOLKA/s8brWgKwixc
 r6G3c88mMOLWMqj6+DxIeqGMkx1e033DLjMhRfmeUPBDgJimcXBWxyUXGvT8IVTLb6ODUGdy4t/
 aU55AR+2E7Yw2sYLA2OIR5bjhC83dal0DddPz2FGeb7NJbpXVNVQXYhYsmr9s/IegXmKgJLv4HL
 47FJRNyW3mF5To5jJw70G1SqYE/pFGGDTVUGd9AAOs3cW2xR6/HNSYKSLYkQ=
X-Received: by 2002:a05:6870:b614:b0:2b8:e4b9:47a3 with SMTP id
 586e51a60fabf-2f796caade4mr1568371fac.22.1751638890419; 
 Fri, 04 Jul 2025 07:21:30 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 014/108] target/arm: Add isar feature tests for SME2p1,
 SVE2p1
Date: Fri,  4 Jul 2025 08:19:37 -0600
Message-ID: <20250704142112.1018902-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: 1UuAqH6JIVHM

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 63 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h          |  1 +
 2 files changed, 64 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5d8adfb73b..5876162428 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -604,6 +604,11 @@ static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
 }
 
+static inline bool isar_feature_aa64_lut(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, LUT);
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
@@ -932,6 +937,11 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2p1(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) >=2;
+}
+
 static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) != 0;
@@ -977,6 +987,21 @@ static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, F64MM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_b16b16(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, B16B16);
+}
+
+static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
+}
+
+static inline bool isar_feature_aa64_sme_f16f16(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, F16F16);
+}
+
 static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, F64F64);
@@ -992,6 +1017,44 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_sme2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) != 0;
+}
+
+static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
+}
+
+/*
+ * Combinations of feature tests, for ease of use with TRANS_FEAT.
+ */
+static inline bool isar_feature_aa64_sme_or_sve2p1(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2p1(id);
+}
+
+static inline bool isar_feature_aa64_sme2_or_sve2p1(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) || isar_feature_aa64_sve2p1(id);
+}
+
+static inline bool isar_feature_aa64_sme2p1_or_sve2p1(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2p1(id) || isar_feature_aa64_sve2p1(id);
+}
+
+static inline bool isar_feature_aa64_sme2_i16i64(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_i16i64(id);
+}
+
+static inline bool isar_feature_aa64_sme2_f64f64(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_f64f64(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7db97e8038..c6041a9357 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2211,6 +2211,7 @@ FIELD(ID_AA64ISAR2, SYSINSTR_128, 36, 4)
 FIELD(ID_AA64ISAR2, PRFMSLC, 40, 4)
 FIELD(ID_AA64ISAR2, RPRFM, 48, 4)
 FIELD(ID_AA64ISAR2, CSSC, 52, 4)
+FIELD(ID_AA64ISAR2, LUT, 56, 4)
 FIELD(ID_AA64ISAR2, ATS1A, 60, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
-- 
2.43.0

