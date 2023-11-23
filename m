Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150119ejj;
        Wed, 22 Nov 2023 20:44:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDiv57mPoAuJvbHspBiE4QRtzF+N01Xbz8pK46x02z4hQ8SrNOUh4q+5PZvT0hCF0dmX8X
X-Received: by 2002:a05:6214:1c86:b0:670:b327:c86f with SMTP id ib6-20020a0562141c8600b00670b327c86fmr1898402qvb.17.1700714687685;
        Wed, 22 Nov 2023 20:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714687; cv=none;
        d=google.com; s=arc-20160816;
        b=nuHQnWigUeDt9Kl2bHJ9556rInvHos8gp2jcpGZKZnpD5SKkCr6lsHolM8XdEnG7VV
         /Lwy+fE722B/ZylKRgU8daTPuv9NrDgGY7jp53EtWTcCpjsyUJqfP9GbpW8A9OFndZ5k
         iXA32a2jXXMDMgmfrniSnT0cu/vmp8NxdMQjaW1M8umT4FQrtymhPTrnE3inAPgnTEh4
         4TmZCKuajtl0NUGT+gnURT4756pNZWQrI3GablailRo/ZbgSrzjSYDUZYENHKkKQ+BDp
         hEG9nKKfY7vc8U3wZBg2mafp4ayz0irfowlmcLu69I5a0Y7ZZZPJluIvlURTCeIHMPRJ
         6glQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z9sYIWas5f3L9LVklxkBAZhldZmGtqlfaE/Pn9tmcPw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SWkJNRpGpIxJQdkMHx7I52grSlti2/n8en0Iikn9DmWWoRPa0I+T/0UJRIoz9DtgPg
         y18yR1MI5+LVhy3/WFXdOpSfY0BQ39+UIEPyeKphe9TC05P2Kdei7z25QwLsEFZsLAwa
         Ct71h5CjlTMmY+RWjKa/qch/X9quFhHOQecxXs2JRuSyOTBlRiURoD5GERVMmtIbcY+u
         TVbiFpEtzZmVmiCiKk4xxEb1rUHnaM0CdJXifZsqx0rgAluHQlW1X9L/PXjn/S6/oqed
         Q5TpnzjwMWbjJzmOlS/CJXckstOCcW9zMIkD813W2UlT99Cv9CUeg182H1VTlIsOtJ86
         VPhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aJRXV/Ty";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a0cec51000000b0066d07dcdcebsi418789qvq.475.2023.11.22.20.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aJRXV/Ty";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YP-0006fI-7c; Wed, 22 Nov 2023 23:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y4-0006PT-Va
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:46 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y0-0006EX-KH
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:44 -0500
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3b6cfc62514so258826b6e.0
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714557; x=1701319357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9sYIWas5f3L9LVklxkBAZhldZmGtqlfaE/Pn9tmcPw=;
 b=aJRXV/Ty+5lgI16quwOq0JbaOvc3Qcfp1rJsLB5GCVW1pD+ce52Y50FH3yFgQLZmLR
 Ca0TiuKrNl/5SUpsHnozh1g90bUJd2bxMLKOEsHnDUJCmWSSKw2VCM/GcwOPgWOH61Ba
 IWhNqkQqNzbbf77Hxf6Oxf4bqAOcRcbVrAwSVtJwGih3G3jx1dntz2GM8lnfdBKBUZE7
 CIfBiUYw62axht9dIOJuvzVhE2UBt0zrZWU1pVD9u0SUsTgT7I4tLmT843k/XxrZfxpH
 1JCRbyhHngj9usP3CsGzVUSL+ETkqLPpZET9ls4aumybJ+LaKHc8KSp+26I4QhHy0LSI
 xsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714557; x=1701319357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9sYIWas5f3L9LVklxkBAZhldZmGtqlfaE/Pn9tmcPw=;
 b=XBN5dBq0l0KUfllUdbJ+SOR4J/rhvnZ37sEg1zRP7h/zEt/qUxeEr1akonxpoYwvaq
 42V5txmeNG0hn6pgQ8AeS2BxJvA+UB28k1IPeGDMWIdCaftoWCTPnyQgptnyKZVIKXZ+
 IvFKtE7SiIXjevgU2YxvJ1t8yVk8H/2yyxTGQjR525rFeFyclTocckzsdy6kHlF9MQEi
 AKMe11mMhRUZGF897GhMB9bH2CS69WXXNSFGUwo6Sh05vc7VBP5jToUObEYgMWJegBED
 KfZvJsF/QhDX60sN26JOkntff97vQt3c+JzcFVlWnkoBmXXuAiWUoYiDFyqqrcfjpqrT
 ZNsA==
X-Gm-Message-State: AOJu0YzJ3w4m8hGzi1PRak2KV+dntdfHnRypFNtT4XuPwl+gzAExgzoi
 mJ8It7SgA4W9HhRhudPfe/WXsohUiIoEzz1zZi+bDfbB
X-Received: by 2002:a05:6808:209b:b0:3af:a80c:420 with SMTP id
 s27-20020a056808209b00b003afa80c0420mr850846oiw.7.1700714557171; 
 Wed, 22 Nov 2023 20:42:37 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/21] target/arm/kvm: Unexport kvm_arm_vcpu_init
Date: Wed, 22 Nov 2023 22:42:13 -0600
Message-Id: <20231123044219.896776-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Zlf0ogxwHt18

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 12 ------------
 target/arm/kvm.c     | 12 +++++++++++-
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 1043123cc7..b96ff35e34 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,18 +18,6 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
-/**
- * kvm_arm_vcpu_init:
- * @cs: CPUState
- *
- * Initialize (or reinitialize) the VCPU by invoking the
- * KVM_ARM_VCPU_INIT ioctl with the CPU type and feature
- * bitmask specified in the CPUState.
- *
- * Returns: 0 if success else < 0 error code
- */
-int kvm_arm_vcpu_init(CPUState *cs);
-
 /**
  * kvm_arm_vcpu_finalize:
  * @cs: CPUState
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 466b848156..a864d0852f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -58,7 +58,17 @@ typedef struct ARMHostCPUFeatures {
 
 static ARMHostCPUFeatures arm_host_cpu_features;
 
-int kvm_arm_vcpu_init(CPUState *cs)
+/**
+ * kvm_arm_vcpu_init:
+ * @cs: CPUState
+ *
+ * Initialize (or reinitialize) the VCPU by invoking the
+ * KVM_ARM_VCPU_INIT ioctl with the CPU type and feature
+ * bitmask specified in the CPUState.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+static int kvm_arm_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     struct kvm_vcpu_init init;
-- 
2.34.1

