Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1982686lfj;
        Fri, 6 May 2022 11:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGe1xpA9pqkyxQj606uEBS0HzOFJiPd50SkofovHh4+kLjwP5LxcvV39lSZYdj3lcGG4KG
X-Received: by 2002:a05:622a:1701:b0:2f3:b7aa:cad3 with SMTP id h1-20020a05622a170100b002f3b7aacad3mr4186410qtk.526.1651860962070;
        Fri, 06 May 2022 11:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860962; cv=none;
        d=google.com; s=arc-20160816;
        b=H1reAUWOmuJjLrTfb/mz8fWrUuo3QrUebEwjOxzlqZw3b+ugzqBiEmGUP2HN5XHzWz
         fMO5kmA0EDDVZMRBkkNXPvApzaEOEfpE8CBMZq1P5yvuhCfAV1bAt3g11fkv4mLQJybA
         H+74xfJurOaOdlXVpjqCdGB4b4CmQ/fFG3/Cg4RFZbI6K3dLSuJy9UgdxlkDzzzoA/UY
         u/FtPT6En0RBdbwXwku6vtaCgAk/aL2W6Um5L3qA2g4x6SyjF6uOQZ6eh9QzD1o+EbPi
         YaxFBJ0iRAVtpoe2X1ME8tyQr9u16i7BZ8YoYV4WgzEpZ/w5ZVUP94rGb8gi2SCIJ8Ft
         COsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
        b=VCH5VL6O+p5oMG7VUd2ZQVCup85tsqUxm6T7NVpffV/pXY2ZQce69/w7+MH/pV8vin
         ohRxhiByO6XarB5Liho7yLatvauDfwZYaeyknjXBztJ236eEvXXbC65/OzZGDVyOwmWA
         QD3EXW/a/4kRPPZTRkIPsXQwFd7wPURBK/161Rrr98pSw5CUPj5L91xL5hpPbTaDtzcE
         t9mMibh/AlXEytn/xsnYaGgc/8h6SO6VaT5Ce1r8MnthBh9KcR3+g693MI3RwvqBHR33
         h1em1eIYrBmfZZ9T+iNg5WE1z7o3hBBBXtEnIYD/I9efMIaFkniEAZxK/0QGdMPbq+Bw
         OBrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=igzE6ZVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac87f15000000b002f398bd4d42si2853406qtk.413.2022.05.06.11.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=igzE6ZVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Uj-0003Nz-Id
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IJ-0005xs-ST
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:15 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:33264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IH-0003ub-O7
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:11 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e656032735so8007425fac.0
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=igzE6ZVstxe+YSXa7OJlktNKrEuARDLIG7h/HIbOSjjoE+yGqX2cjxsIUmrRwC1O4b
 INAkI+jo45+9MqatTMSuVkIBwxbZuF/knTKElGlEq92KllSRFXEYwMSur9ZdDhvIJXzt
 p0gOQIdBEhh5Z/uGCiW5XXt3c41QXRHAeAj1k4/4Lzeeg4o0nfrkXebzBJsNkziMMKW/
 SzT6eYswgeD81yPEg+OlurnjRQQFd+kxOYK9zg/ejsXqUVPgClamxeSMqZVqCe6mXr9c
 rzaQ7W4PSLwRRlEJpM4vL6EkqTaRp6SWoQ8GvILFLHOoQHDGiUGl1RpeMjUbZeTSKo1Y
 LmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgQ5KSLzutwoLc046w/8oKdisj0tzJaMrdZLKPhobI8=;
 b=M6OyhLX1hr7Lse4QL7g3sO89E6+HY7nAMJvRv0UornPa9LWiqb1tYtR17EdadYNCoe
 TIggpxOHeEAKd583Hzc5RVNJ/BJ002lvJtqibdeBxaYo6+1QEtG3smUaA+JioNh5jePS
 CguoRYVdPXKOtvT4Rp2tc3mEoRAxoG0QbOCpIjR/+3Yaenoujg+fXQEr1wrbMspdLdka
 s2nDbNJEK3hu1GRn426P7mbBK4vng9Y/A/UaFRNdBqL0QK6VuEZiy84+6KfwjkI20sE+
 OBUXwn7VHr5g2rXiYCiUGcxuxGpNzWEnFAJ2NrQXR8JmTYcA/WI9qU/NrimOk2wA1NvL
 Xayg==
X-Gm-Message-State: AOAM532l71Qfx0dnaAc1+a/xvhxY+qe8eFFJTgTdAbYJJuBEU/WwD4Gg
 Ti5qgitXx9xW1CBwKv4lxub4XpXhzVPUK7Vn
X-Received: by 2002:a05:6870:796:b0:da:3d6a:101d with SMTP id
 en22-20020a056870079600b000da3d6a101dmr1863301oab.20.1651860188493; 
 Fri, 06 May 2022 11:03:08 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 14/24] target/arm: Enable SCR and HCR bits for RAS
Date: Fri,  6 May 2022 13:02:32 -0500
Message-Id: <20220506180242.216785-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dDRIoTEVIDag

Enable writes to the TERR and TEA bits when RAS is enabled.
These bits are otherwise RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37c5e42bc0..b6faebf4a7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         valid_mask &= ~SCR_NET;
 
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= SCR_TLOR;
         }
@@ -1769,6 +1772,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
+        if (cpu_isar_feature(aa32_ras, cpu)) {
+            valid_mask |= SCR_TERR;
+        }
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -5126,6 +5132,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_vh, cpu)) {
             valid_mask |= HCR_E2H;
         }
+        if (cpu_isar_feature(aa64_ras, cpu)) {
+            valid_mask |= HCR_TERR | HCR_TEA;
+        }
         if (cpu_isar_feature(aa64_lor, cpu)) {
             valid_mask |= HCR_TLOR;
         }
-- 
2.34.1

