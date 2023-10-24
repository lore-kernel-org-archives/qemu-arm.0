Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2174320ejb;
        Tue, 24 Oct 2023 09:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGib9QplsDcUVfLsFnv7yDDpbjx3E35WvRoc6NSRJSsm10P4/k++4rbcthMHbnbQmmH6SR
X-Received: by 2002:ad4:576e:0:b0:66d:1f11:8b85 with SMTP id r14-20020ad4576e000000b0066d1f118b85mr16395508qvx.13.1698165350572;
        Tue, 24 Oct 2023 09:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698165350; cv=none;
        d=google.com; s=arc-20160816;
        b=fFG6Vw/AR9MQKwxW5ekXaEAy515oNSbHUiT4Bp68xBeS7RVgLexs7uDucgrelT/4T3
         bBpye83rCfRN4ltqdV5nex2SGkLEIG7mcg/1S3R2y0Cz1vqMQE9cG8M5OhSkDmwgANle
         O/2R1FsLoHA08eV3oT7OWecG0YtJ7IBd8jYXNCwXo255qmUAGsyOR426jnEnJWWLuWCk
         UxPEbBbFH8kTNoNdLzriL2Rt0SxawXH40Gmh/Vjv+UkCaC4ZEfBZ9SxMeqX+JHcG8kUK
         gdEBJgrxROVIDSPyIODkIc0WcQ5ni5+Pporrbu0s/ubz+iCyB/lT6JmkcEArfEx4GPjQ
         ZFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V1oMrg7qxzgr5UV6tTr5kRpEnk47K095nUSDvFl0pXU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=q14661z8V2ksG8BPj6qt4nY+uEEOqhVNaNCAGJyiFSVP9xc0330tMf94c5LM1qLmSX
         aXUj25cNR7WcxrZZzAuFNvffOyhx9KDjtm4I8KR+TH2RW6gbmjnIUPfJY4glV2PAKt2M
         KVij84cj++MAqECPanmtoN/f2Awwo1fAxsHnUrxKLl73xnwS22J9yWrEb49+bXLxVNHS
         vZ6rcSKqrwqGkEzMqifdeKMz+ern/3zujSidgsoqWO69feLhlMJR4czsaLSTWCaPVGx+
         ErhQEteT7Vmg20k1grgcHjzn0v5oqO713LvtLObB5GpP1H0A+KdnsUZEd+D0h7RWzqdV
         5/fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9zfBuLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cr13-20020ad456ed000000b0066d17b7adabsi7293006qvb.153.2023.10.24.09.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9zfBuLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKNW-0002Bi-SR; Tue, 24 Oct 2023 12:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNE-0001xr-Rq
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:35:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNA-0004MK-2Y
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:35:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso38745695e9.3
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698165314; x=1698770114; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V1oMrg7qxzgr5UV6tTr5kRpEnk47K095nUSDvFl0pXU=;
 b=n9zfBuLWF2ALn0GZWk+bmaQeH5miYkvUZ5pZWv9jQswZwQynEiZt7VfBMNWTDnUW74
 2h9Mx0g2Bqkza5krLq+6rADjzDgoI06a70/KkUBjoC0gy59TcY629grKxNKRdIxptNxg
 WGoINd8mYZVr8xNX320yrqg/AU7lkvg1CbSuw05GftYI9t2PkTC1VWguSbIpY0v/WKJx
 wmOe3nKJieDVa8KNyqNUJTPVBiRgvt5d3vIN2pw6lJNGaWQUYhOez+0DKdasWe7nhKVM
 31iSsOMkjwXR08SRA9nGmnnY4FBmn+19NsjvbXKk1cPOmaNgvF85KoEX0dsXhGF7pNc5
 fdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698165314; x=1698770114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V1oMrg7qxzgr5UV6tTr5kRpEnk47K095nUSDvFl0pXU=;
 b=uCgopc+zisevwrj6ngH5u/h9zMLPczRQaz0qJcml3GykmIVp4x1Q2UMugoUKmcmK8X
 8/zMJeHfKduey0dduaZvh460XMYJq6+9ZCA2sd4UIu8bBbgzSjq8ai1Lc24iQoeCvNtl
 2OEcDOEMG14DyiL1nlvxaEkoUwRSwVYZaYYzWSyx+BpHge/B3ozcAE7xzHHSMx9bZToF
 hV4XTbTZ5DU7TIGX0YSorN7PXWuF962zKT8sIQk4Vpeu4XGOGN8T4x4JRirYtmIW7lr/
 Pl6QwVuj3tFhfCLU2P9UKl9mvk6jHW13SvBHs7zTsf7Xp9RQByrMIJLNQefrx6XonLF/
 iutQ==
X-Gm-Message-State: AOJu0YwcGywFatlZzLWwNOHCJb9zilW16x8wfxzyAr9F/8jPMddbbc/D
 KDt59l8lqz4eiinX5pVdv0F/qTDUx1juI6/lFuU=
X-Received: by 2002:a05:600c:3508:b0:409:c1e:7fe8 with SMTP id
 h8-20020a05600c350800b004090c1e7fe8mr2315214wmq.19.1698165314249; 
 Tue, 24 Oct 2023 09:35:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm16860101wmh.11.2023.10.24.09.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 09:35:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/arm: Move ID_AA64MMFR1 and ID_AA64MMFR2 tests
 together
Date: Tue, 24 Oct 2023 17:35:06 +0100
Message-Id: <20231024163510.2972081-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024163510.2972081-1-peter.maydell@linaro.org>
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: t3Dw1yxhFTL4

Our list of isar_feature functions is not in any particular order,
but tests on fields of the same ID register tend to be grouped
together.  A few functions that are tests of fields in ID_AA64MMFR1
and ID_AA64MMFR2 are not in the same place as the rest; move them
into their groups.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 60 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index bfc9bfafe70..fc85a8fe130 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -641,6 +641,21 @@ static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR1, TIDCP1) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
+static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
+}
+
 static inline bool isar_feature_aa64_uao(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, UAO) != 0;
@@ -676,6 +691,21 @@ static inline bool isar_feature_aa64_evt(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, EVT) >= 2;
 }
 
+static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
+}
+
+static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
+}
+
+static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
@@ -794,36 +824,6 @@ static inline bool isar_feature_aa64_fgt(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, FGT) != 0;
 }
 
-static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
-}
-
-static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
-}
-
-static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
-}
-
-static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
-}
-
-static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
-}
-
-static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
-{
-    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-}
-
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
-- 
2.34.1

