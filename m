Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp272585lfm;
        Thu, 20 May 2021 08:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+aHb/2WZSk2h8xTqT5Uk2dBV0KgNybTdecxcTynzqgWcj626sa/OQA5VcvoS0yYBhxDe/
X-Received: by 2002:a05:6e02:6cc:: with SMTP id p12mr6118367ils.244.1621524633883;
        Thu, 20 May 2021 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621524633; cv=none;
        d=google.com; s=arc-20160816;
        b=yiXcyKtYEVsVDBviqcIFCRAzXK6xibJg7LjFvpJvqLoXK4DVnZ2ncLKSYhErp7xOEG
         a8sT2UJXjQ8j4JoMVMwqP/f3ZqS5aCQRYUDyAWeMKT5mm0XVYi0UW6zW9eZqVGEhEXd4
         Tosbw8dNosrQNz6+c9uMCd06qokkKhGNxtRLC8Zkh13OzOlNvvuLCu7UzhG0AafG3CeS
         +mosOfnOW5+wBsEfbZiVP1CFLZfcZ550Fs1op44aadgjxjjahirlQEQ9vnMQsiboDPK7
         giPuhUAqZAqnIuHbk6rjyU+wLKx3JlGLvjQ2jDQ1UML9hzO5XotJll40NNzodwy+kOmq
         /o4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DnbJwhTPFVUYyLIk68eWKoH+oBvtevWOvwYTKcV4l1s=;
        b=LSiPLsguuMn/njwC2VsFmN6ft6gwMAszZ054SEW571dFYDUs+Je6WffCzjctDkIpo+
         WZMz5L1ROvp2x3A9p3FD7SgMNamjLO+1pYylDcuNAJWOEpmKCzCtjgpIt78SIUyUlt7S
         v+s5Pl8Pd6zZ7CLzk+66f5Fzm6kVTIKS4t4NvBf9Zbs0ahpRlBc+NhDsnhFpQlpLj+xn
         fTE6ZcgC3JPJ92PgHpxHBXEp6JaR03mSevqgmxnL1yqEyB9VADim6skM3R4oeyHOOUst
         q1iVXQa3QfkC30XSa9z7oLhU+RrqFdQk14TYfHAHN+OM9VQqg8KkUIg7bWY2VJXBQw7n
         vmsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L4DnhIB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si2442595jal.25.2021.05.20.08.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L4DnhIB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljkd7-0001Ol-54
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbO-0007nq-Tn
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbM-0000dz-7B
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id q5so18105541wrs.4
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DnbJwhTPFVUYyLIk68eWKoH+oBvtevWOvwYTKcV4l1s=;
 b=L4DnhIB3svIofXAgpA318UFWOvnhwsrRI0h1TdkUhsRL3HiQrI70S/wvTslhiD8XGn
 c049/S7gDtBVKsonySz209zRJzE6VeMbLh2UHfbGkjp+zvH6Y9Rcrh4zngZRIs+T95FR
 AovXAagxmolPrGQpph0F6JUCCHC3GqCCnKAbsx15eIy0INi8XrH4AjSqtfwOsnjEpVf6
 P3FgnK+I2n+BeNgMGhB6sT5dHILTmITXlz3jleuJv6xEq7wCBPbyo5FuC1ZhZ31viPvU
 UX5W4g3En/SHEA4vVm6zLzW1cFtxanCJVrsiOdVXmGXZG7yJegfPcAKGgz0KicoMRyAs
 1jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnbJwhTPFVUYyLIk68eWKoH+oBvtevWOvwYTKcV4l1s=;
 b=OO+JjQmSX304H0QdlTsC9APHDZphhKCmNH+uWNfSwV/+OLfGSJfQONPD5YE5nA2bBD
 mcHdJyptI2de7kQ2I90y2KbbWwetE9wAV9l1GClHDfc8lmfCLBpAcQS39hRqmyTJFsk9
 7nMO8DiOEXQdCUEq/1s+m9mjJNC5F7GX1IKnpw6sgqDjb7LhzeC0Y4DUZXPYbBu3GOZU
 SAPm2GR7BO4CfUF/g2or7i9cGN9VghwExIrVUKzc/AbGXxZpyEkgmvYB8UMSkcOqwMzP
 pQEycIb/hSWsLYG0VZJgTEeaxQtOkzP8y47pza9Sh3w9dh/GxSUqvKqFr3hc0q1IzokO
 Sdzw==
X-Gm-Message-State: AOAM533kVlNOSveC6ck7tt1jiln5rrax3KZfaQlC4rLG/wy/gNMFa/gJ
 3Zs1eMH63shDJYPHyHb0JxQ0bjmaeNtCRtu+
X-Received: by 2002:adf:fdce:: with SMTP id i14mr4763696wrs.303.1621524522868; 
 Thu, 20 May 2021 08:28:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/9] target/arm: Add isar feature check functions for MVE
Date: Thu, 20 May 2021 16:28:32 +0100
Message-Id: <20210520152840.24453-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: jw5F+zVPY31U

Add the isar feature check functions we will need for v8.1M MVE:
 * a check for MVE present: this corresponds to the pseudocode's
   CheckDecodeFaults(ExtType_Mve)
 * a check for the optional floating-point part of MVE: this
   corresponds to CheckDecodeFaults(ExtType_MveFp)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b3932534..d037f5530fc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3801,6 +3801,28 @@ static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
     }
 }
 
+static inline bool isar_feature_aa32_mve(const ARMISARegisters *id)
+{
+    /*
+     * Return true if MVE is supported (either integer or floating point).
+     * We must check for M-profile as the MVFR1 field means something
+     * else for A-profile.
+     */
+    return isar_feature_aa32_mprofile(id) &&
+        FIELD_EX32(id->mvfr1, MVFR1, MVE) > 0;
+}
+
+static inline bool isar_feature_aa32_mve_fp(const ARMISARegisters *id)
+{
+    /*
+     * Return true if MVE is supported (either integer or floating point).
+     * We must check for M-profile as the MVFR1 field means something
+     * else for A-profile.
+     */
+    return isar_feature_aa32_mprofile(id) &&
+        FIELD_EX32(id->mvfr1, MVFR1, MVE) >= 2;
+}
+
 static inline bool isar_feature_aa32_vfp_simd(const ARMISARegisters *id)
 {
     /*
-- 
2.20.1

