Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5119499ejc;
        Mon, 27 Feb 2023 15:04:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9XxtidsXTzK0CceI1xBsK+M7UC3IVpYVkkcWYAmTRUe+e05dh9To7NZM3rY2K049WgWayF
X-Received: by 2002:a05:622a:14:b0:3bf:dd49:bf26 with SMTP id x20-20020a05622a001400b003bfdd49bf26mr1973578qtw.24.1677539047767;
        Mon, 27 Feb 2023 15:04:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539047; cv=none;
        d=google.com; s=arc-20160816;
        b=rXvpCfIrVgMNuGAaCY7yhZlNOK8OXgfyOIS8PvMwi/admXA2h/wz/zLfQt7gdc87bW
         RFBEGd/Dxdnb2tWqBAXuYEQH8xBi9WBn6s8dpEVvdB3K7hJPrw/i2JqIc06dnJMyFLDE
         181vLZ3chK/ByQ1op6HIZEgrmlFKkWlaZ7UOjx9B995Ci8DyfGbwVVJyCRaHtXLtArdF
         zwJAXKrjLY8a1lcwDj4Qvp77JnYU7yqMZ2lQX8amxELSRZfGxSKJil9DWBhdmPMwS3RV
         gxzWAkpp5jv7hR8zvOi80Gk9YAfvo8Zjf3vupUf38sA6CKTYhZ3q1Ek/JP1BuevxrIpl
         ASuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AKzOS7a1/7VrG1zwCTYqvRSxgc9GTxbO/gKX1CrEEmc=;
        b=ChK3xuu99OZPe5NKwUpA54xAbzFDLsrXnVlVzE5gWKJaHKFnDsvmDJOV3f9cdzvlKD
         viDOLiwViu3Dppza30PIcOOzuf0VTVw4shGBNc2rmWX+V9hskxQZWwmFOJHJ1a8mpb7a
         OcEr4y5HfvdDzW5GTi7BUwar3VZjLffr1oq+x8ahXHkBZPoe9LrSUzcGGoyT6/N70YFl
         77+zhVenROp0PmfquJ08RU0FPJc8tAb7ufOEiQzPtBdRD80LPy7n4oC/POf5vkUBAZfF
         j/cEWLahHe1oYLmFYuTCE1On+iEmdaOX/fkZ8gXnOquh3shqghPA/ml+RKFVsB9AyIIQ
         LJ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khnllu7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020ac857c5000000b003ba11617afdsi7929863qta.267.2023.02.27.15.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:04:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khnllu7U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVP-0008Hy-Hc; Mon, 27 Feb 2023 18:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVE-0007wB-2A
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVC-00014Z-21
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:51 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso302311pjv.0
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKzOS7a1/7VrG1zwCTYqvRSxgc9GTxbO/gKX1CrEEmc=;
 b=khnllu7UiJfE+VCzWMdUIuBYp5kalyLXLEWdRLejppfslZJUt67nXdqbrRfCJvKLXv
 LB8rW10NG92BFTfP48ru/4cC7WUnXkjobcPSwa6hs3J/KvzImq/TsQ6DwH2aNNm1t5vR
 uAdK4iU1xRprAzajM21j24SLo03HVk9aRSrolB1gopqK7G40g5XxAdikhQuyXPOx+msX
 CPjohRheohjr2ljfBmynoecY24xqENe/f64KTf5x0EZ4AVvzDlQbxsHKTUVWzjXeJyaS
 2WzOadyW//DbXg1R/fAcucH4re0KWEDcP3qClirAjN4nTqVoJfjDYS8xaT7mxAGmnGzY
 QN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKzOS7a1/7VrG1zwCTYqvRSxgc9GTxbO/gKX1CrEEmc=;
 b=ZCWeJO/yoVlJvcvfbOdgvrcEn74i8w4ktqqASoPU70iGduDgF3R55BXHahYMTSJF0N
 iQNxkB3SXBHkmkXTdaO3Rh4sdn4cLkhEpnZRQDPPc/7VxbjKUOv+bIIK8x7XUjERGzeq
 5h3qt9h88ZO32yigMcNKgiEZbEtRx6iGNh8Tow/PNw5CPhM3S7RFO1ANl3QDVLMtN6L2
 VYK2JoCLzEr9w4w7yJoibuOU4ivaotsLyzGKFX3VHM/QWdyvdpDnf6dzOM4HQeGL+0lX
 c0RPpGbJNODVcmHrEJR7G9eCakOcl4GROJcsOsU0XPG2e1jF6KjSTaD5Uz9mQm1Q4j9I
 qTHA==
X-Gm-Message-State: AO0yUKUfWcbmgCQLAyIU+poNeu5RHD8+GjFt/EJhvw/M+CmEDew+rAZE
 isSc+PGtMQS8Zcx/whqpli5Lqg==
X-Received: by 2002:a17:90b:33c4:b0:234:8cd:c0e4 with SMTP id
 lk4-20020a17090b33c400b0023408cdc0e4mr891532pjb.23.1677538908475; 
 Mon, 27 Feb 2023 15:01:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 14/21] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Mon, 27 Feb 2023 13:01:15 -1000
Message-Id: <20230227230122.816702-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: uYNU3dEPPZYy

Do not provide a fast-path for physical addresses,
as those will need to be validated for GPC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2eae7a69cb..0177dea0cf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -232,29 +232,22 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (regime_is_stage2(s2_mmu_idx)) {
-            S1Translate s2ptw = {
-                .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = arm_space_to_phys(space),
-                .in_space = space,
-                .in_secure = is_secure,
-                .in_debug = true,
-            };
-            GetPhysAddrResult s2 = { };
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_ptw_idx = arm_space_to_phys(space),
+            .in_space = space,
+            .in_secure = is_secure,
+            .in_debug = true,
+        };
+        GetPhysAddrResult s2 = { };
 
-            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                   false, &s2, fi)) {
-                goto fail;
-            }
-            ptw->out_phys = s2.f.phys_addr;
-            pte_attrs = s2.cacheattrs.attrs;
-            pte_secure = s2.f.attrs.secure;
-        } else {
-            /* Regime is physical. */
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
+        if (get_phys_addr_with_struct(env, &s2ptw, addr,
+                                      MMU_DATA_LOAD, &s2, fi)) {
+            goto fail;
         }
+        ptw->out_phys = s2.f.phys_addr;
+        pte_attrs = s2.cacheattrs.attrs;
+        pte_secure = s2.f.attrs.secure;
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
-- 
2.34.1

