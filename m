Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp750099lfb;
        Thu, 19 Nov 2020 13:57:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOcVu42TZhxn3wnyJrRFjxKl20bgSXtAZycRnkAvyGb5AINFXOk4QOWstcl1ZMuqVij+kA
X-Received: by 2002:a25:d049:: with SMTP id h70mr14297222ybg.190.1605823074771;
        Thu, 19 Nov 2020 13:57:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823074; cv=none;
        d=google.com; s=arc-20160816;
        b=BuSj54oJXHF6hNjFTzBqqBndY+M8mIeZenClyNlruvrEeyKAqo3R0hjZrW9QCtOuxi
         iPTwKMAZcgxAH60pRnDN6gNB4jsD8UvB+GCmNhUoGW7hs7QIxj4dtJ/Sa0GGlDZN/FEH
         98rVN4ae3nge9Vnq7Tf3Yg30QwqNYWWimKYs6RIzmigM1HVPSSUxxwYV1icY9XzRfLAq
         zWkFBbL8NRKotIiQ89gsfaqkQapcqMPJ7eoyENS96eXPHwrGo9Ix6aitcSJmUfxtZtq2
         UKOIruki1qQXp7qiFpkSz2kRtZ3xlSskTcHIs/QoH8z9aISQVFIV+H8d9696dXptMsQU
         KL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZiwH0dK+VVu6UtQJw9p4MqrlmBuqaVE13BH2luYxZGk=;
        b=FtIR+1R4BtxJKOblXRLC2rBd7n6zKrp9DuGxLRuVVzVWWaDIm4SVsu05YdFHf+xYWM
         A4FfUH0kZosznHttvjL63zq/7a5BeX7Obd5aA9zIJDlekqGrjMikiHxih6Y/atUlAVKZ
         YEnpa9RXrbKWN1PUdBs6gjUDS/TG0JqbDey0NUi+/9S2Ltm4edL8ZHVLstHiUg19PUE6
         vnHY1BMbiokC/mrBiR/GNhaHMJANGYYqu46X3nxj1RYSIRklrnM6VADX7K2OOw8IXUWD
         6tNeSOdLyrWz1clgPC/saqYQNck2q8UJzQM8KlXiOwT7Se5ZBB1rVsftuleGAlmU831k
         CHNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jN0O4zfS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si784252ybc.426.2020.11.19.13.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 13:57:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jN0O4zfS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfrw9-0000YR-M6
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 16:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruj-0000X5-Fd
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruh-00046i-Rb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:25 -0500
Received: by mail-wr1-x441.google.com with SMTP id l1so7973129wrb.9
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZiwH0dK+VVu6UtQJw9p4MqrlmBuqaVE13BH2luYxZGk=;
 b=jN0O4zfSV09LrhoUHY2/AcM5y09yCegdaR5fy5I2uyf/2rHTksoyaSLAEOOQs+W8Zq
 BeltieDBmjmoRIjf47RoiCAtT2SWgSrWv4PYiZoZ7EoaWz60GuwIBF/8pCqy5eHcqzTY
 EN+ScJc2qXVe8VDpuGA6+bLaFcx6ilIl0Nhu452DG87g+sEJEtMWhHuiqCIHGw+Yy0ci
 wQ28INoPPZfIvYz5CdQu1ajlsdTexWdlCfZb+rjGGmmt74PBCCc9OLRcj+svSWVCv/T6
 ADaudts52w5ri7rCndZanw8bAKzfORRGg4t4EBik8thVb6WLk51DH0b8Hfb1QBYXZSlk
 nNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZiwH0dK+VVu6UtQJw9p4MqrlmBuqaVE13BH2luYxZGk=;
 b=jp2HEEY9dlX/yq2d3Te8InB5Yur90W6gEnoX1aANdNoCyZ1OIwrIL1BPT0rsxIQDdb
 MgawuA9Dci9S/x/KoBbAwXHHsZP9VZ8v8g/Ebt3uiRHDbKYbw+SEWMm4LYFHTEvF3wqE
 vTdzgtRzOOkDaRnx1caOHlp0eX9d3jnN9U+hLIockstiz3j5Kptjt2rFtDAFu1SFzfUR
 lWhXisROHPvJ3+HneC/I19Tg5jD4rw/xj5DxoJA2WpFDwUzAlV2GCnZWp6YhNzZNKEIh
 pt4/c+C4Ssh6ETHcYcxwDMW7deOSlpi+ehaZNCoDFDOftLiw3nAIPhUFy4WFxwZvh2b6
 Rq3g==
X-Gm-Message-State: AOAM533HsnYrQs8ryRYpKQXZB2Zcr1iH5kN+AH/mm7ImqoGTkIyVG810
 nXVmS5oYwC8VuyKvNw+Qpns2KQ==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr11959050wrv.181.1605822982568; 
 Thu, 19 Nov 2020 13:56:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/28] target/arm: Implement v8.1M PXN extension
Date: Thu, 19 Nov 2020 21:55:51 +0000
Message-Id: <20201119215617.29887-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KQMXDSMaleE7

In v8.1M the PXN architecture extension adds a new PXN bit to the
MPU_RLAR registers, which forbids execution of code in the region
from a privileged mode.

This is another feature which is just in the generic "in v8.1M" set
and has no ID register field indicating its presence.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df72..abc470d9f17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        bool pxn = false;
+
+        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+        }
 
         if (m_is_system_region(env, address)) {
             /* System space is always execute never */
@@ -11761,7 +11766,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         }
 
         *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn) {
+        if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
         /* We don't need to look the attribute up in the MAIR0/MAIR1
-- 
2.20.1

