Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2447162lft;
        Sun, 3 Jul 2022 02:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ut8HQK6WybRcdnwi7bT5be9/2II6GyqVWHYAmn83WNuJO0aBOD1lELv7L+nBqvtr4rhnLN
X-Received: by 2002:a81:6c11:0:b0:31c:4c41:f4a with SMTP id h17-20020a816c11000000b0031c4c410f4amr17695007ywc.406.1656838994464;
        Sun, 03 Jul 2022 02:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838994; cv=none;
        d=google.com; s=arc-20160816;
        b=BypePv2lfK9sHkqKEzN0hEe8Mfi5USqBHS18hHg431+H3/b5YEK/D8kscejbHq4Ins
         aYP8otyIrs0MWKOdXCNj3Z+OD+szcCHIPRXmDSkTxRAudQIyXLMgofCCzwgPj0cj6ZQZ
         spmwm0xym/EwY07Jo0tDn2g8eNR/iZwS76YUdqwID+UEvl4CX/N+2Q9pvovmQ0YyoVQj
         eCphpM8zDX4jCsg/BF6ZDaqFc6tnJJXN0pBcUiOHBuBCw4qQWIx8cUZo+dNXYvIetcTZ
         g6EeuCym3dOz6wTwihuB07GltFNm3bn+5szpGmjeTtwZloooLzo24flnq6zaBUk1RI3S
         ex7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vebk4kjBIMxCcXUePIuYSzzVW8J2WXPtrvs+wC4TX+s=;
        b=WSKVe8fAnINF1QNk23jTtH16HOap8BG7NSfNvnFBG+xj6JIWxq2CJm1Lqah6AjMUZr
         Sk1tTIw2ljYY+fgsdLkvQDMrBXYED42OxF7qsEE1h8mj1zOCSVo5dUO3LQdqiSwqPCrH
         AsjP3AjkuF96XSupAxMAp+FiCk+DZBHwDeww002zkdlPm7jfDZV4DOCK2bTPcRUNoe9g
         0150Oyua4DpKDDHbHWdtZF5OCOG/xGLmoeQ51C5Ep7TxJSyYPSkJXUOKVhVBAtEHOs29
         aDhQrNEwfs3m4D95NxZxgcqnf4djhjNPDSimGi8sqcawcKIbSNyIjCX0nu55rFRJWlvN
         hB9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEhuURVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a811107000000b0031c85d650c4si3654592ywr.57.2022.07.03.02.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEhuURVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vVZ-0006f5-S2
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzK-0000rL-7t
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:54 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzI-0006hP-M8
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:53 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 68so6241466pgb.10
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vebk4kjBIMxCcXUePIuYSzzVW8J2WXPtrvs+wC4TX+s=;
 b=DEhuURVFVp7EJy07GV+ATk5or0qjnXLt86dCkaD+KMmloXjISNYIWkk7YxjN7VnCu8
 3XFCoUKNcoYPrOCAm/4+Hf3lc5a5se4B9DXNsliokfGzqsATDty1uHTCmg/jHormOrHp
 xvfoe/oy37lWZ38vRSZDCGdeqgdx/CxZCzkuogwofxFcP4U1Z07Ri8g8WKvSDLcrFRnb
 NMc2RCuzrBU2mm/TCEeI2DBBi/zDhgkv8rh408CdUFqBQ1grpkO1JBiY21t/oHb+exPG
 qfXjRbRFhNzidMHmQjnP2RDQIpXrlHoAgCrfAj4FV0zS4L+c6Ht6Q4ELF3su/0nxNQ6o
 pB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vebk4kjBIMxCcXUePIuYSzzVW8J2WXPtrvs+wC4TX+s=;
 b=okii2JFPkg3Kfh6flcuop5WCbdHdiA9N4FBgkN8ASkWQ2pIuNU3wvxCTITX0eeuTg0
 92BrlwaBpjA+Yxra4QxwwZChXWceeIu0n7f/YyXqvd8pyETjbtGkc3GrQegSjGfCY/Jx
 ybWwPLlsKA7ZoeWynzkb/ZBJbb8bySvbXH48zOL2ybxsXnZ3OV3xKzbyjmiJaM7BijZO
 Z4SVI6iGjoEfHjUxYQlYU3dQ4eopF1/N6fIZcDKXJH7N6MM8G16/N9qtnStK8nrVIxLx
 1tmL+K9f+yuI2w1Bd0bHmeaiSzeA1AJTKy0YHzOMrTS22AyOV8h7t/md5SVyXDenwbj+
 qYuA==
X-Gm-Message-State: AJIora/zfSesysgRMfPbn+0xEKyH08cyst9HwQVHmkYqRDDrj24hQdWl
 ysi80OEe9wrC0uxTOWS7qx44SuipdCnurqUh
X-Received: by 2002:a05:6a00:1ac7:b0:525:4ef2:175 with SMTP id
 f7-20020a056a001ac700b005254ef20175mr30316801pfv.50.1656836991312; 
 Sun, 03 Jul 2022 01:29:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 47/62] target/arm: Hoist check for disabled stage2 translation.
Date: Sun,  3 Jul 2022 13:54:04 +0530
Message-Id: <20220703082419.770989-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: NHDbgK9lg835

If stage2 translation is disabled, E1&0 translation is
just a single stage.  Use the complete single stage path
rather than breaking out of the middle of the two stage path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ed25f4b91e..84d72ac249 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2433,9 +2433,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-         * translations if mmu_idx is a two-stage regime.
+         * translations if mmu_idx is a two-stage regime, and stage2 enabled.
          */
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
             hwaddr ipa;
             int s1_prot;
             int ret;
@@ -2448,9 +2449,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
 
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
-                                                   is_secure)) {
+            /* If S1 fails, return early.  */
+            if (ret) {
                 return ret;
             }
 
-- 
2.34.1

