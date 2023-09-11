Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1360367ejx;
        Mon, 11 Sep 2023 06:55:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECLt49OE8Nlv1NsFE3meAH/fBTCxGd/tsDzvh8RsgUoVZDjbkfAPLRqpTGP8Ms3nCyxRlH
X-Received: by 2002:a0c:e146:0:b0:655:d86b:6710 with SMTP id c6-20020a0ce146000000b00655d86b6710mr5455648qvl.49.1694440519445;
        Mon, 11 Sep 2023 06:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440519; cv=none;
        d=google.com; s=arc-20160816;
        b=v+nLsSydfhfLJMy+9vsdbm/ouiTDVc7QPJC5aF5tADLD86mFwtkvr8eto0t8EW3B9L
         ZQd8Yy7kfbC+Mwu0L1glwVV1Iogok3T9F7gWnAJcE2XTr84MAXaSs/aWwVgOFdYUvD69
         NAcIF5lbuD5BTQiazkX/LWMpjLBcKFJXXrSmlvsjCvQSumRGNUkWNWUpORaoLZsP+RJ/
         whZUhW0i2VCzlolyMDoAI5YbliTHKm8cBar8JwOsJbZSS1emRQArkB8sZcGwKWNeR/Xm
         kZ4H7y0w585n5O2txs6XtwFMb6lN7BHii+mTK8k+NtcgSet7OLr/K+FXXclmnDzX1alj
         0KYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EhsANPr+s+DzOUAyiokLp6LNqlQRXOf6IY9mVxsXL14=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=HjveFSKFZWmt65qRTxrTrbQqZggEnIEtkYJ8ORegAkA2/7xLTHicOlFiowKgD/5BfH
         F59L/ElERmN4mIFW/TWjvITd+3F0yxaRYBIOccopsSsdtWmFCs++Ei/jc4bRlkU3/m0w
         yzXMDwuj9HUuC1XLLX6KTgLhqKLllHIqGLxDyX35CWMfRRM4uwqMDPVUjrLXSkpXR/iz
         jI1j+r+YX+LWkDTHuptpFoDlncKoGCEy/qHZLe+allOEoPoSJLf7Hj+OrjVJ/NYPFPlr
         PaCtanqzqLA1l1KyBpQ7d9TGENCSo77LZw1HLr2wlSfu6zoKvPnyGg54f6q+u8Muo7bD
         U0fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zi40qD8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a0cd989000000b0064f3df53a64si4809401qvj.328.2023.09.11.06.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:55:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zi40qD8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMR-0005ij-Lt; Mon, 11 Sep 2023 09:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMP-0005h7-Tg
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMI-00039t-Eg
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so47881535e9.1
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440423; x=1695045223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EhsANPr+s+DzOUAyiokLp6LNqlQRXOf6IY9mVxsXL14=;
 b=zi40qD8bBOdUYEg2SB2DsPlzO9HoWgOlDL9Z/qr6/8SBNPZ7aY10qa3r5iEyKA4cOk
 bSBMXbselHh7mxeVZrcg0A/62W3NIrKWHB7qS5rfB1L2YDR8eWPyhfQj+YEaiU2wcQX0
 axuwLlIDHOqZ7mBVDIfZwi0n1jes3C1BKpEqNJfjnidzav216Lea96Ghq3eAhgHBI7zo
 PYOZztYDpdEl8XiMdBTbsxNP2GhsOItW0DEvkXB3600eAYkAoqZ2JORo16VfxNqSlDyj
 7AVLJNeN2U/z+KwVwNWzJ1j5a9/3g7RXhZVslfFTUitG0LeurBKrp1J+NXiS/ueANP1z
 LSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440423; x=1695045223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhsANPr+s+DzOUAyiokLp6LNqlQRXOf6IY9mVxsXL14=;
 b=ap+O4Pu5jpC1ADyLbHThh/k0iLNHnxGrknGnv9J+SjPmI0Smv5l8uqk24dlWeyw6Z/
 BxNnNbwx3o3tR0xA3q4m9etzNMAiGU/iFN/ejOcg18UUmlUB+aadI9jLK6Yq7MhjXwkG
 wTs3C1ITcgAiGNNnImg+4P89Syvz+jrJoJHFWq5/QMEregoXY5aNfnhDVvKtxnom+Q/9
 mztJbaXzTgPVhdTfIQyrdGzO4jcKNbOLxpG4MOwEbjVqgO4f/quQYxGWUj8VBgpLUo2g
 BllKqsXB+b6Ln9nBDabqQwis70S0ZOGTGqja0wh5Qx2Oz9yLMjq+Pu6J89ahqXDPWkKX
 /Khw==
X-Gm-Message-State: AOJu0YwT5dOSn1cMzIMXmWo3pJO6pgVn4zWvkhFRyWNJaUC7qNQeDc5O
 3o4noWWYD0ozX42apvYWPbOQSaN/DQfiJtKOhck=
X-Received: by 2002:adf:d082:0:b0:31d:c3d2:4300 with SMTP id
 y2-20020adfd082000000b0031dc3d24300mr6535375wrh.71.1694440423429; 
 Mon, 11 Sep 2023 06:53:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm: Add ID_AA64ISAR2_EL1
Date: Mon, 11 Sep 2023 14:53:34 +0100
Message-Id: <20230911135340.1139553-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: yEX6eRz9r9HT

From: Aaron Lindsay <aaron@os.amperecomputing.com>

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
[PMM: drop the HVF part of the patch and just comment that
 we need to do something when the register appears in that API]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     | 1 +
 target/arm/helper.c  | 4 ++--
 target/arm/hvf/hvf.c | 1 +
 target/arm/kvm64.c   | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d50cd918580..e637796fd83 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1033,6 +1033,7 @@ struct ArchCPU {
         uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
+        uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3f5a7d2bdc..f9f7c3c39e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8435,11 +8435,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64isar1 },
-            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64isar2 },
             { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 486f90be1d2..546c0e817f4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -847,6 +847,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
         { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
         { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
         { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
         { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4d904a1d11b..ac440c33f9a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -304,6 +304,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 6, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
                               ARM64_SYS_REG(3, 0, 0, 6, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
+                              ARM64_SYS_REG(3, 0, 0, 6, 2));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 7, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
-- 
2.34.1

