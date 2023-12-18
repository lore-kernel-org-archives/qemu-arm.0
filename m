Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724055eji;
        Mon, 18 Dec 2023 03:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkbZqH+M5tbuPKyn8oUqYvRQ62Z5UqsIhWtpNcZxQqlXdjOA2RtsUrQv3KQ7OUjVyxky38
X-Received: by 2002:ad4:574c:0:b0:67f:dcb:57b1 with SMTP id q12-20020ad4574c000000b0067f0dcb57b1mr10449328qvx.54.1702899423909;
        Mon, 18 Dec 2023 03:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899423; cv=none;
        d=google.com; s=arc-20160816;
        b=djHFXYsrS7wLAjyUQeBMIYQSq48FM3/G/VQu+bIOk1E3eejTMJ1P3jQu8atydrz573
         50YBDrgzEGz/vVrjJEB7o3F47f5CoKZQsMqCSprB639FOacV2Q88HzKo1xoTUg0DNJfi
         UJpFywhHoH2ZuQuOFzwODSq8SOp2VGaHouiyscBan0a7p6x5Jw+Gkl8kLNlxNde6opld
         ///Jv0Cd6f+CdF3ev0iwjM8jhbrSkGdgT+U9n+rultSx7ce49UAHEo6uJwuFVjuB2dak
         4L2u//iNx2UrRXc4TzqEZ79irKnTYD+kdJeHg4VkHs2giITk595Ljeg7CUjeV/3r/bbQ
         sL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XBGAau5xQawMv1TIkYCOIFZhD76YOOoYpu6Y5VQfn/w=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=UcmaoKgxMtDMhYLmUkDcRStVj3M+HRO5p/+smVuLKENkZXelwNLciVeJjlnUjNFD6J
         dRHvv+ORYYpZ059gPAmE+G/bQYp7gjP0wIy6Pw7QItt4ksjrlgGvTJ1RK6GLy0OdrORF
         7YnAgF1Ghu6o+lvY766BxmpqYXjT4YLPzldtS+bDpXQQeta+jRNiGAr/ybPU8ipce+Ym
         fwoCCo6JVMcUgfUksM7eYI8pfVFlcvTEbcwS5ok2sN5XJ6PiMF/N9kwICoXkMoABxYTG
         Em9Is0mLGC/ILLFitDuL9IbqM1m/jGGko2LdfLfyM4Cp7ZGSgJsyEnYFq6s7Fy979clu
         Oq1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p1nx/xiz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a0cd6c3000000b0067abb363a4bsi23400324qvi.231.2023.12.18.03.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:37:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p1nx/xiz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsE-0006zU-TI; Mon, 18 Dec 2023 06:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsD-0006w2-K0
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:25 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs6-0003Li-AG
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:25 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33668cdb982so617252f8f.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899196; x=1703503996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XBGAau5xQawMv1TIkYCOIFZhD76YOOoYpu6Y5VQfn/w=;
 b=p1nx/xizLrpkfy5i/rxVvJxdN22v/GAJQne56MBnSRuBZvZOtlKlgmp4NT0TKUnBQn
 JuqdXo/XhaL82QhWyrStx4rIZkv9SdNo/90lEM2lkluZqhglRLK+25rg1f0vknL8ci6X
 x68X9dXwgkUNgiRINGOmYrqMI/e3AwRt9J44UnhJoSW+GgP4CcfJHvueR8pTAY13IsJ7
 MatwDNAI0Yy/16z6BNtzBSoraupwFANvxKXXszfYMdF3Zf2jzFBb07zFxx9XMklNq9fu
 z03IJFoPm2LRruqhJRXfiqFyrp8KoPZUz1B+SMGhe/rvFDEJ5PqYbmPYq98nlJa0Tz3T
 GUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899196; x=1703503996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBGAau5xQawMv1TIkYCOIFZhD76YOOoYpu6Y5VQfn/w=;
 b=erT5C5QZu/4fs8+HV/+Qrlb01HUTOJJ4aHhCCuaaTJT1oYpeFGOfNehDK6lRIS+2Sy
 BcZhTWLunNtzJaSvY5QhxiuhXKo7Z6kbFo6SSFCxbn4r4fNgVTzUWtLS0RsaJlcXRnW/
 /nPb7afL6aD0oAClqO+F5DUjfG54hB61zXt0440TmE91/2yfMp7ApGkfV3Vce+VNnI0c
 tofuWh5ahuNuM+xXX9ovonYCvoRVTZ3/smQp1oSCcjPdfL7scwakH/QEm/KK4E4eCKu1
 SogP//2JYwK5em+H3kmCy7G/I3WDvoANl9NypnTPHT/DHO/c3WiTCNi4prAJIyjjzG6u
 /7sA==
X-Gm-Message-State: AOJu0Ywaej4T5AFgznLizAfBq7rVeAFH8xJDQ8bUGasEbvoujdpMg9Qv
 FDv8usjKF/mKyRvljlzojxpshfy8q5XrxFgTVcM=
X-Received: by 2002:adf:e2c2:0:b0:332:eaa7:56b0 with SMTP id
 d2-20020adfe2c2000000b00332eaa756b0mr7873228wrj.14.1702899196728; 
 Mon, 18 Dec 2023 03:33:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/35] target/arm: Add FEAT_NV to max, neoverse-n2,
 neoverse-v1 CPUs
Date: Mon, 18 Dec 2023 11:32:51 +0000
Message-Id: <20231218113305.2511480-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EfrOblabm7jG

Enable FEAT_NV on the 'max' CPU, and stop filtering it out for the
Neoverse N2 and Neoverse V1 CPUs.  We continue to downgrade FEAT_NV2
support to FEAT_NV for the latter two CPU types.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 8 +++++---
 target/arm/tcg/cpu64.c        | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0b604f90059..d827b42de79 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -63,6 +63,7 @@ the following architecture extensions:
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
+- FEAT_NV (Nested Virtualization)
 - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
 - FEAT_PACQARMA3 (Pointer authentication - QARMA3 algorithm)
 - FEAT_PACQARMA5 (Pointer authentication - QARMA5 algorithm)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index efb22a87f9e..da0c02f850b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2238,9 +2238,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         /* FEAT_MPAM (Memory Partitioning and Monitoring Extension) */
         cpu->isar.id_aa64pfr0 =
             FIELD_DP64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, MPAM, 0);
-        /* FEAT_NV (Nested Virtualization) */
-        cpu->isar.id_aa64mmfr2 =
-            FIELD_DP64(cpu->isar.id_aa64mmfr2, ID_AA64MMFR2, NV, 0);
+        /* FEAT_NV2 (Enhanced Nested Virtualization support) */
+        if (FIELD_EX64(cpu->isar.id_aa64mmfr2, ID_AA64MMFR2, NV) > 1) {
+            cpu->isar.id_aa64mmfr2 =
+                FIELD_DP64(cpu->isar.id_aa64mmfr2, ID_AA64MMFR2, NV, 1);
+        }
     }
 
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 40e7a45166f..93f040e6e96 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1204,6 +1204,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
+    t = FIELD_DP64(t, ID_AA64MMFR2, NV, 1);       /* FEAT_NV */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, AT, 1);       /* FEAT_LSE2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
-- 
2.34.1

