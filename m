Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1359961ejx;
        Mon, 11 Sep 2023 06:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI9MsWkqwR5qwu77zDmK/jNc8xccAXct1Bujm5cfA28cTZhHJw3eF9s5ivArme+BH6U8Ic
X-Received: by 2002:ac8:58cc:0:b0:412:2f5e:2779 with SMTP id u12-20020ac858cc000000b004122f5e2779mr12663681qta.24.1694440470933;
        Mon, 11 Sep 2023 06:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440470; cv=none;
        d=google.com; s=arc-20160816;
        b=heawpZTRu/kXLpxzd2c5NDHTYA+aW7jKFwpnfQA2yOYrj9ScWqkyy2aF7S3xiYffGN
         jVxKZbMssaBh16KlMs7b6T23Y1R9Z2KwMRfBOxHsJFIiE9t1MNYPjHpk6wfONP0JIJpC
         yXwR2gpi7Ld/IJssuoq9CMN9S3CRI3+nUV/R+30MEZ0xnUaL21u4d4et9kU1HRu+PIsZ
         wIYeBVifQoor6FqKTOrAwztCf90+AeFk/toPKxxXoxs0yr2zBnSo3emoUFI8U62wkXSf
         pc4WblgLJmE8pqA3XrAt3gxDG5VZkx56ZXj2kzpp1eHkqI7Rcj8mQOBnEeCxZWIcLqc+
         DwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ELrRVF0tIk1TLgBNd5bg7VAVQK5daGM7tIeCJh5jEMU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=loYpSPlLbR1NzKu3cmYumThVHVfa65G+rSksdiBA/kgfn0sFVH2wb/xYCHxT8wy7uU
         uc+3Ked7cDfSaPqmDTsLOA/NGim1A4e12mmIykLFIaBv1LryD9E2M0VYRjdb78p9yfn1
         2gN6UM7dbh+SXxiiIPcxG0Kj6TJT+3R5n5Ms973xzf/UTEziGmZm2pBJ2x75o2yOteO6
         escVhEu56b1asAgdc2PWpFY2mvlSM7rqxIfaD7tg8OAghDRgdFxGB1T1xsiUEQjKWNbh
         Ix7zOMw8dXYfNHsD8Zy7IqQg4jYj09fcW5Cwuv8FNEIq16SxQuLa7QaRRh8AWW0RY6FH
         DBeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LTLU7aUn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020ac87f8e000000b0040555dfef18si4844688qtj.666.2023.09.11.06.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:54:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LTLU7aUn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMh-0005tC-3b; Mon, 11 Sep 2023 09:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMf-0005sm-H2
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:54:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMJ-0003Ae-LY
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:54:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso48865305e9.0
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440426; x=1695045226; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ELrRVF0tIk1TLgBNd5bg7VAVQK5daGM7tIeCJh5jEMU=;
 b=LTLU7aUnq2AuqEJe0QjTzCJwvXz80xLixsWleczvAvCgRxOFwR1hwezK7vjSxA8ump
 o+y5C3QHOZardEBVMciNtYDdyZFv3drFq6CGt0uXhQwjglAD+j+W+kusHtH7R/Sr1wu0
 G0dRcT7FnifGewY6Oy99OSavUjZ0MnPEPchIQ3L2MjrTuFvKPUQ1NrREZPjhVh53WHQ7
 +ysStX6mBbkMisUllcKCzWf1wi4Exb++5oAEjcttJdkhkmphAhp0rQd2PVKt5lQch2I1
 6pVQdmWtnzvWNjKbiyaPoHUxavcUP3t508pv7Nm0gHWoxdDOiBDtm9sx50XcCm0uqtqo
 RS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440426; x=1695045226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ELrRVF0tIk1TLgBNd5bg7VAVQK5daGM7tIeCJh5jEMU=;
 b=RUgs2jtE4DuYRerD1S99lPuMOJ1bZ4yGLRrbZZOD21nNhEdJCVbNwYMswkju5cmLeI
 yyFP61FiMzdzefYeVsfy4Z+0J5xBilM+hVgoK7CvuJ9S0wfHbdzIYQEaOr6wJWh79nRG
 MPt2wOCIgkkTftZd+6bjnGVrxebsBiYeIQYn2XMvd/1hH4Vci2UoIvfno2zzg+l/ZBjN
 sd6MGxATJl0mcDry4pwug6WxrVrWcfNjb6WV9lRd4jqY3TFtwEzaDTPU8BmKsMvW7D3P
 4QixAZ1yEueVMykpJ/alKQ+PHSCnnEs23v+uUO0Z4M5SKf3a72TlePVmySgfQ3h1MaLk
 6vvg==
X-Gm-Message-State: AOJu0Yz8tfvAXp7m7TusIDcn44hKOyzEmmry07TQn9F5uhlBCdcxBJsR
 j9XxDjOsWAL5KK0os9jCeTUZNjH3TtWkqwIsh5Y=
X-Received: by 2002:adf:fdc2:0:b0:317:5d1c:9719 with SMTP id
 i2-20020adffdc2000000b003175d1c9719mr8571670wrs.9.1694440425944; 
 Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/arm: Update user-mode ID reg mask values
Date: Mon, 11 Sep 2023 14:53:39 +0100
Message-Id: <20230911135340.1139553-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: HTKlpnM/7NWn

For user-only mode we reveal a subset of the AArch64 ID registers
to the guest, to emulate the kernel's trap-and-emulate-ID-regs
handling. Update the feature bit masks to match upstream kernel
commit a48fa7efaf1161c1c.

None of these features are yet implemented by QEMU, so this
doesn't yet have a behavioural change, but implementation of
FEAT_MOPS and FEAT_HBC is imminent.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f9f7c3c39e9..ad84fcf041d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8621,11 +8621,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64ZFR0_F64MM_MASK },
             { .name = "ID_AA64SMFR0_EL1",
               .exported_bits = R_ID_AA64SMFR0_F32F32_MASK |
+                               R_ID_AA64SMFR0_BI32I32_MASK |
                                R_ID_AA64SMFR0_B16F32_MASK |
                                R_ID_AA64SMFR0_F16F32_MASK |
                                R_ID_AA64SMFR0_I8I32_MASK |
+                               R_ID_AA64SMFR0_F16F16_MASK |
+                               R_ID_AA64SMFR0_B16B16_MASK |
+                               R_ID_AA64SMFR0_I16I32_MASK |
                                R_ID_AA64SMFR0_F64F64_MASK |
                                R_ID_AA64SMFR0_I16I64_MASK |
+                               R_ID_AA64SMFR0_SMEVER_MASK |
                                R_ID_AA64SMFR0_FA64_MASK },
             { .name = "ID_AA64MMFR0_EL1",
               .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
@@ -8676,7 +8681,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .exported_bits = R_ID_AA64ISAR2_WFXT_MASK |
                                R_ID_AA64ISAR2_RPRES_MASK |
                                R_ID_AA64ISAR2_GPA3_MASK |
-                               R_ID_AA64ISAR2_APA3_MASK },
+                               R_ID_AA64ISAR2_APA3_MASK |
+                               R_ID_AA64ISAR2_MOPS_MASK |
+                               R_ID_AA64ISAR2_BC_MASK |
+                               R_ID_AA64ISAR2_RPRFM_MASK |
+                               R_ID_AA64ISAR2_CSSC_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true },
         };
-- 
2.34.1

