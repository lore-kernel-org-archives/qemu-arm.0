Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722607eji;
        Mon, 18 Dec 2023 03:34:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1qCuzOF9/Ls2DaMZsfKoUdD0OaxMn/Td/gDAe1NvWPNbTID2o6DGXC2oQaB51OtrSb3wN
X-Received: by 2002:ad4:5dca:0:b0:67f:13e7:7a4d with SMTP id m10-20020ad45dca000000b0067f13e77a4dmr8100081qvh.25.1702899247910;
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899247; cv=none;
        d=google.com; s=arc-20160816;
        b=GvEHtD8LUlmahozfmzmuW0SIt/IzkEJgPaGiWCPT7Pq2BMEGO6O4jwUCOCyocwpxB5
         co17+0KBJJpaHCju/yStqCwE6TmC9RKFp2jIpG6Cj0grxrFekqzXtr6uMUzROqzfhUQc
         DZWd8dxxlLmjfxR4MZZFgEka+lGS4DzFZGexY6ePtcqeDjwyAEFH6CPcVKGAeNAoKkH4
         YfIBCrw7ouuXkJr3G5zY6Hv6S//bkzRukN/+itpHwAZZWGhmVtXmE1f6wlsWflTTT+aL
         S7YLoDmJrAkh1WaiJ1VsMSiHDGQyRtbXctzOCQAu07F/QGQzc6Gj62HkSrRw4216vmP5
         LGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J+EE0+mnHPHGCOMaG+C9/pWFxkc9Xq3u5HldCrY3Xbg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=UBgvXUKMbZbz6zTOwZYAO+zilcPtdqN4BeHDEp631mPxe5pmvRWSr4LSE+MvkI9EpS
         mbYuILChm3obCHNZ06JkrwFD+3bJaZRFbJ3DCtYse4R3ynYhpoJEkzdSOB/Vrvu1POtg
         HE53UKLuE6cd5h6B01tBdkmLujvlQeya0PgKziRD19W34tUnZD3h0RxGbVa/pf4LE/GK
         taIwzjhcBtfu8PaPaT/uQ2N3vIGyziqVUOhOXJY59NSSe4xqpk+eFwbMUcdgxfyLwfM/
         3Fx+IelE73TiwSo+4WwIm0ZrGzGbpBHlGHYEB4bLx1fL6FbZAx/MB3WQO4GmT1UEacxW
         4iLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGHhG9lE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020a0cdf94000000b0067f270c98b4si5351358qvl.415.2023.12.18.03.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGHhG9lE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsa-0007YT-Si; Mon, 18 Dec 2023 06:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsP-00079I-NG
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:38 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsC-0003Px-UX
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so2834229f8f.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899203; x=1703504003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J+EE0+mnHPHGCOMaG+C9/pWFxkc9Xq3u5HldCrY3Xbg=;
 b=DGHhG9lEckTZhGquDpAFOCJ595TFNdttLrhaL6ZCEZy+DhrDeP46khkaOib0DPVDAO
 uLfrbyRhhg3NA5mAUQaDvVsggsScLROvEbhioEXXPv8vvUBEqK/69JVh4UNQt8hi2TvS
 P7xMW2SYgjt2ZJQLYgX/q7fY2VgMU4ptbT+d6NsRimgzOn/mApG2OQC7aMr8wRKNCJ2N
 a8Sg187wENN+YonMUjWwQ84+425KGwbhhYtn80TOGBYA8+boH0XAMWVvG+DovAWBdZso
 pGLknKc8j8hehJLrMaMUwJUbGLJkNVueZ/InVoAVPPcXG3uwYi9YUiXSVBkuVI1EfqHZ
 qvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899203; x=1703504003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+EE0+mnHPHGCOMaG+C9/pWFxkc9Xq3u5HldCrY3Xbg=;
 b=ZnDfL4Lg9asydgMDd/ehDgxoIRzOn9LsKXnmag/1lS61nyxVI7HJzxteGiPNZ9hgyE
 MlwVkrdabGadElW47AQCJ0DCQa/J8CikbZIU/9tQxa4dTP77LpQNP6apSfu6cDzdSmzG
 AebkbgCRhZd4ayUnB1xClihKGM6AMR22B33lZbbnSGo+yu6wfpTIS9rddsHv6gfyfdBU
 qjqIZbyplG+kkE/peKMmMv8HkK1GIV58KJc06IFvarTFfmG51X1QH9jAdpBjdsmyAbGF
 p/xL3mRk3YUZcd9824ZBRnkUGWACvofquy3ZV7uE9r19IN3ob1cmncIzsXLHtc+ZO/Od
 cRug==
X-Gm-Message-State: AOJu0YwvXr1dYZU5u9fsRLxYUwTQ094hzaJffCs5i4+67l7aW9qb+Rdv
 Ee6oU9SOn6gMFYGdr02MpJWmCxHdhHkRKQXT1sY=
X-Received: by 2002:a05:6000:1961:b0:336:6ba1:556e with SMTP id
 da1-20020a056000196100b003366ba1556emr422026wrb.4.1702899203633; 
 Mon, 18 Dec 2023 03:33:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/35] target/arm: Add FEAT_NV2 to max, neoverse-n2,
 neoverse-v1 CPUs
Date: Mon, 18 Dec 2023 11:33:05 +0000
Message-Id: <20231218113305.2511480-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: uLcuYcQFiOHC

Enable FEAT_NV2 on the 'max' CPU, and stop filtering it out for
the Neoverse N2 and Neoverse V1 CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 5 -----
 target/arm/tcg/cpu64.c        | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index d827b42de79..f67aea2d836 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -64,6 +64,7 @@ the following architecture extensions:
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_NV (Nested Virtualization)
+- FEAT_NV2 (Enhanced nested virtualization support)
 - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
 - FEAT_PACQARMA3 (Pointer authentication - QARMA3 algorithm)
 - FEAT_PACQARMA5 (Pointer authentication - QARMA5 algorithm)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d1d592609eb..65dc88ba864 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2243,11 +2243,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         /* FEAT_MPAM (Memory Partitioning and Monitoring Extension) */
         cpu->isar.id_aa64pfr0 =
             FIELD_DP64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, MPAM, 0);
-        /* FEAT_NV2 (Enhanced Nested Virtualization support) */
-        if (FIELD_EX64(cpu->isar.id_aa64mmfr2, ID_AA64MMFR2, NV) > 1) {
-            cpu->isar.id_aa64mmfr2 =
-                FIELD_DP64(cpu->isar.id_aa64mmfr2, ID_AA64MMFR2, NV, 1);
-        }
     }
 
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93f040e6e96..5fba2c0f040 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1204,7 +1204,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
-    t = FIELD_DP64(t, ID_AA64MMFR2, NV, 1);       /* FEAT_NV */
+    t = FIELD_DP64(t, ID_AA64MMFR2, NV, 2);       /* FEAT_NV2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, AT, 1);       /* FEAT_LSE2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
-- 
2.34.1

