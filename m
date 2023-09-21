Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp799018ejm;
        Thu, 21 Sep 2023 11:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx4VUYdiGboKEdlOfUP1VBcnQDDLki8fMs86pcoVpuRsjlgqFA3wuBk16b+l6ij2GOaGjz
X-Received: by 2002:a05:620a:4083:b0:76e:fa4a:3003 with SMTP id f3-20020a05620a408300b0076efa4a3003mr7101252qko.16.1695322541438;
        Thu, 21 Sep 2023 11:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695322541; cv=none;
        d=google.com; s=arc-20160816;
        b=ghj7VtkZzC0ubrjSytSN9qUwGVLWXbW7OiVFGUMJ/9rSE3PBee8MO46xY3rQohu/C2
         pG6TQiFmpH5SDNqRsuB/ZTctckx+R+V/0K/Yb9D42JLvSOJMYJ7RBIkzAboDrG5RHZnu
         aghqfrMQSf1tJyzfabjo0vJeLq7Ft8YjBpK7I6yaN5xnE0xuibRJmfNHBBQnxGf9gaCs
         2TKUmJWJy+hV5beK4LbJIPOHc8DvchSLFfwDE5PfaPDXnes1gpDOK0U3LC28E+hvLRPL
         e2Um8dS64V74cbcQ5D9jmoiprFfRMl0efAztLuVP/OPBfOKar5r7W1nzDor2uBu4xkUq
         JYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sqjX+Qa5UKaKX85hr+XzR9jndKCAoKkj1gkGqjAhUAE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=VBQU8i2r+Snq/5/AH5P3hrEnQQvdqf8Ne8IZPs5LuQKOTesrT5dIQFWTfHIqGhYC+m
         bMD9h1Ksl3A7/kBo82eFne1677SKRHdLygF9yg3UX/Oa6LZ6zJc9ZgjpC1PT3fayfKWr
         gGyJPUepr1f0aJ79RBIVSXIMWc4kxVKmBQOMvLsG0KgFnOsUmWjL4vSp7W0pqPzttFcX
         fJjUgU4IgRosidA/PUJHvgN2qG1h4njeWLfUA3+I/PRlq6zCC2kTkKFxtNIitSC61FPx
         uvea1SbV83VrhGBVSYf6rBv6KlzCsJe1cuoHwq/YneEXqlE+Bjv/pwwQ+scW7nO5sATB
         8bQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDKgjK30;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi37-20020a05620a31a500b0076c7efa5c38si1385977qkb.616.2023.09.21.11.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Sep 2023 11:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDKgjK30;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjOpA-0002DR-VW; Thu, 21 Sep 2023 14:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qjOp9-0002D3-QP
 for qemu-arm@nongnu.org; Thu, 21 Sep 2023 14:54:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qjOp8-0006OQ-40
 for qemu-arm@nongnu.org; Thu, 21 Sep 2023 14:54:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso1302507f8f.3
 for <qemu-arm@nongnu.org>; Thu, 21 Sep 2023 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695322487; x=1695927287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=sqjX+Qa5UKaKX85hr+XzR9jndKCAoKkj1gkGqjAhUAE=;
 b=XDKgjK30yjx5sr30rdTX+/Of2zxYBF8jbP7omFVoHSAhmRA6Uq63vk8wOXJrWe5hRP
 PXoKQ/RfS9OERfA69u96RHx/H/KCw/QPM3Z8YPTsgX6d6vt/SXVIa9ZjN/ExXfV/sECV
 9VjtjHMMbR/GPxGHKPnVDBdFB3zlsnCslxcxOjaRZdGKw6y5igezArtt5U4DsY1RkvJC
 YaJ98exSQDSMggVn8kzL6/WQHFyPegnAfp0qU+IiQjwePI81CMIEyHeZ9gxudBJKAf+W
 IWpckoX1QR08piIq5hk7fKnkketIqLwgTk5UYTxX9ThTv9mi7DXy3KEJKdaa8Yna7d0e
 Ef1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322487; x=1695927287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sqjX+Qa5UKaKX85hr+XzR9jndKCAoKkj1gkGqjAhUAE=;
 b=Z1jGY+WWUTX0aWbm+8r3eb3zkDGe5HeWjMC//f1eOPQDFnOSlk3pHgniJu3NOvNuQo
 IfiROnhpJSRH6Ql5KfDKIRHBy1n/P+I6yEwhmZlHl2c9N5nlAeK5lep9aRHrtovig8ZQ
 OoxOL4DRdHoG8fw7Q+DzhPiPVOLAExCvBM7iUbtbXSLdmg6Q4QRkGa7V/+/yIFtC1zFP
 hZ1t6NqfAnJtm+c/dXzhsmDTV19R/6sZ9MynIoddZz7D1ikkUvk9mzznV/bMr5EBXcBe
 KF7mQJQnUs+n155Kxn0nDWAtCsvhAgHrZLQr1bE9ZxOi/10V2aleOeGIYHaSr25NzMQo
 hjjQ==
X-Gm-Message-State: AOJu0Ywnm3lfanvUcM5rN7QHP2+a4LPrROnOtnuetY8TxsJPJYjhFJRW
 MTpNVYLwMztfpS95YThIgqJNcwy59j9NORxh4dw=
X-Received: by 2002:a05:6000:1f95:b0:321:8d08:855e with SMTP id
 bw21-20020a0560001f9500b003218d08855emr2661636wrb.24.1695322487277; 
 Thu, 21 Sep 2023 11:54:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c229100b00401b242e2e6sm5472913wmf.47.2023.09.21.11.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 11:54:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Implement FEAT_HPMN0
Date: Thu, 21 Sep 2023 19:54:45 +0100
Message-Id: <20230921185445.3339214-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: XKx3P8Rkef7E

FEAT_HPMN0 is a small feature which defines that it is valid for
MDCR_EL2.HPMN to be set to 0, meaning "no PMU event counters provided
to an EL1 guest" (previously this setting was reserved). QEMU's
implementation almost gets HPMN == 0 right, but we need to fix
one check in pmevcntr_is_64_bit(). That is enough for us to
advertise the feature in the 'max' CPU.

(We don't need to make the behaviour conditional on feature
presence, because the FEAT_HPMN0 behaviour is within the range
of permitted UNPREDICTABLE behaviour for a non-FEAT_HPMN0
implementation.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/helper.c           | 2 +-
 target/arm/tcg/cpu32.c        | 4 ++++
 target/arm/tcg/cpu64.c        | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3df936fc356..b19ea198c24 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -45,6 +45,7 @@ the following architecture extensions:
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_HPDS2 (Translation table page-based hardware attributes)
+- FEAT_HPMN0 (Setting of MDCR_EL2.HPMN to zero)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
 - FEAT_IESB (Implicit error synchronization event)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3b22596eabf..ea3e5c6fd0f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1283,7 +1283,7 @@ static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
         bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
         int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
 
-        if (hpmn != 0 && counter >= hpmn) {
+        if (counter >= hpmn) {
             return hlp;
         }
     }
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 1f918ff5375..0d5d8e307dd 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -89,6 +89,10 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
     cpu->isar.id_dfr0 = t;
+
+    t = cpu->isar.id_dfr1;
+    t = FIELD_DP32(t, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
+    cpu->isar.id_dfr1 = t;
 }
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 7264ab5ead1..ee369f10db6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1104,6 +1104,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
+    t = FIELD_DP64(t, ID_AA64DFR0, HPMN0, 1);     /* FEAT_HPMN0 */
     cpu->isar.id_aa64dfr0 = t;
 
     t = cpu->isar.id_aa64smfr0;
-- 
2.34.1

