Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1039595ejc;
        Mon, 22 Aug 2022 10:22:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR531FSgeUQxr+70aNC58Efa43F1S/qHn87RQLkeofuVXjuYxfB42cS7n/vFu+4/oEGTtBb/
X-Received: by 2002:a05:620a:4711:b0:6bb:7e1b:5f0b with SMTP id bs17-20020a05620a471100b006bb7e1b5f0bmr12837185qkb.127.1661188946492;
        Mon, 22 Aug 2022 10:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661188946; cv=none;
        d=google.com; s=arc-20160816;
        b=uQltognQZEQ0XrVDt3ocub9DpA/zYV3lzpOOlKyhG+/yR4LQPWFuwiK3SVapbdPfz8
         BO5VqpoyhE5ArngDj+EZaBvmmPSBfp66RWobGD9MOxSyU6WwOrccWdarGJsWFD16D6hw
         dRSOWP+TPb0qv+zAThk9CZWHHhEgBd8w4+sV4z7GDq4W2o7PzpNIm34TpI1o/x675l69
         tHdv97k9zCvUm+L/xhjj+MHrU15qien51zA4gXUT6cr58KuPBuoiUXR8F2opHicSu/x2
         nwvW3Tnl7dsjMjycXyzDSYV7mClu62jgs1JNOYCw60bcsTNKw7PO9nudVKIneVzC395X
         QlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tCVH1Kl59BnkmKbSQf/4G0BExsgfIMMri2yi/FRxOQo=;
        b=rAuPpC9RJXzQRYKzeunZiKsrdEROuLIWWq2uJosCL5MVbIXFoPF6j6U3bVgEbYmiZa
         hlT2po8reyPoVE9cRHLzTGBqq4B+LEV6N2/r701PL0IovsUqYlI8kQ06DvgytjjEq8FY
         FSmO2sRPfjLR8Dx0Pjam8txPvVAgbmodaqlO1w9lJ+7S+CyfWb5PHqt9YMHHsw1XLb8C
         V3Jq73E57x72n6Xh2/nshf9sAOVxHPqB68SP4Xma8HZ6c+1OHA/3CXUlJHDyerThdRcm
         vQsaY73mYPBHX5a/LgcwuXzT3K5umSNZ/6NjSamY7glgCdDlWdg4HtuNC9+I8KG70BWr
         B8uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6o0yTuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64-20020a370443000000b006bc28e87e0dsi698868qke.456.2022.08.22.10.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6o0yTuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQB86-0000b8-13
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9On-0004gc-G3
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oi-0001bM-PF
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:33 -0400
Received: by mail-pl1-x634.google.com with SMTP id x23so10241008pll.7
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tCVH1Kl59BnkmKbSQf/4G0BExsgfIMMri2yi/FRxOQo=;
 b=F6o0yTuF+CPWWucyTOzZen4xOlYTgXOFmhfJlkIBCB9av7gMgv3kFLemjenTVKlH3A
 xXth4pFoayFQP/CaJqaKOxJwst+lIhuqszvTh4aGXKis7QIh1TFZrhAtvLJLY6l43QLv
 ellNdKvLc1EPo3Ha+qfJWzl1MwXPmwplBogMnGTJOCbAS+mM+g4a+hb53WeOOWi5OZUC
 3nFYZEUTw4D1WDScSvc1Xn4aUj5nhvu7/p2mffIi0M6vzt8lRxMRZ2lgp5Wb920W0kj/
 ulqJ+JKQmyIixr5wHssiUyneGoJ3VNvIr82GJko/ZlbNvyqbFZ7uE0QzBcFqoRMV1ptA
 XGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tCVH1Kl59BnkmKbSQf/4G0BExsgfIMMri2yi/FRxOQo=;
 b=ZbuxrRjzZ8N8nL9qqrqcwGNM6GlLtECl8vP0vwIntOBlBMu16ze3//w32b17tU6V0F
 8a7kWpN5fY+05BA5qg8xgT8u0se7AIMFGdAT4W6ivOgzyg0R3+6dDbKUt4HdlIC9KEbJ
 O8i+0mWqBtiGLHTrwo91tc9s1H/QPGV4GmGAnElslUli2ExZ+5QvH2I6F9+31DJgCqT9
 dFiJwc/iQCc99HnFk2Hb3SODAGTnyv0LdxoXC9UhtcQJUmcngVXI4Wr/j+YhCyvq/Q+V
 JGRjcN7Y4rKnKlFTM9C9mUJKdmPqqXIHFy7mBrNali633HG7Yc8v8jd2nibQXChHtw1o
 Azcw==
X-Gm-Message-State: ACgBeo3+hZiJ/icjkYISdekjGmXw0JTaVBhXzRxjnjJQfndn3ORVLyFM
 ZRvk2i1JsNKNe/Zuif62HV0KJQ==
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id
 m15-20020a170902f64f00b00172a790320amr20671005plg.149.1661182287920; 
 Mon, 22 Aug 2022 08:31:27 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 51/66] target/arm: Hoist check for disabled stage2
 translation.
Date: Mon, 22 Aug 2022 08:27:26 -0700
Message-Id: <20220822152741.1617527-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: Gea7zcRQ/FQo

If stage2 translation is disabled, E1&0 translation is
just a single stage.  Use the complete single stage path
rather than breaking out of the middle of the two stage path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 628c046cab..d9daaf7536 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2437,9 +2437,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
@@ -2452,9 +2453,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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

