Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5198064lfh;
        Thu, 2 Jun 2022 14:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpkxDs7iyqGgaHuZbJGCR55+nGhnM+6pODHa7s+zaE6wC1gMzn06tTemftikSMhlLRKAcT
X-Received: by 2002:a05:622a:120b:b0:304:bf48:8f15 with SMTP id y11-20020a05622a120b00b00304bf488f15mr5428613qtx.446.1654206899212;
        Thu, 02 Jun 2022 14:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654206899; cv=none;
        d=google.com; s=arc-20160816;
        b=0CM2J/LJhoNWA9OsCxJfCmk05vCjHJBg5IBcUmDPu7oZIPfePvvDQfvIG23vyzwJze
         Xwd7pc+fpG9l+YYaDS1yErP1/xR4YmAnb6aEjN89HcRB2Eb4cTexigFY1EagxyF3Gh5S
         h3Nuc/JGVmDQqMCrNJRZD6XIjC49PTZdXRWwLQNYgbdwJx4156atfvIzB4rF5uDrZX1r
         +N7bwXUqWZTvlL/klSXLL1dON4ksYx0JVk2CjyfZQnnj2YJhVnDssUgvYaCli6eqPcYW
         VUcAkZev/trIxRbTz8njrTVNuJW3qMqXTU6e9k68TXAqZ64FOL+aZmR2MekuMDIRJ9vD
         JKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
        b=h9z/TfHTKSNZpnAjVJD495o+FuozwmxWOHh7d2wdRYx+7SPkiLH/KSsmRUhFaZxs5I
         fsDQSpg7MvhWl7uOxoZOgiN57NYou3cFEH25pIsm2FFBmdFJuUyV3vVRlbbsVdKeMAeK
         TR8mttQM5zawSQFitem7rlxvoQVKhDtFZHiovlJKKScZCIbzsihVW5S9sVD2pBRP5MJy
         BPrmC3jc5n9AHV7eI0acxBFoUvxBpaazbT3CYVpMEeIVQqM9dDWjpUkkITfIEb2Oo0yQ
         VVDYBMw6rDlTnZ+K54RpQUoMB+i2BLZzIzXZJpnlyPGFV0GeEFExT4ZYNi8QJHRUM25W
         ut6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oaEB+Kht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac84e8e000000b002f92989b355si2628249qtp.476.2022.06.02.14.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oaEB+Kht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsmQ-0002yg-Ng
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgg-0004Uv-W2
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:03 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgf-0008VG-4u
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p8so5795319pfh.8
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
 b=oaEB+KhtZc1zLhG/G4M45S21gRBhcnC6h1BoqWq7DFhO+a3mUG88XRWbsFwjjRcnNy
 opfJJzBqlqkirgFODo2TQyyo0Hnkbp97pvJqTOXQwEApv5zBX06Zm3QGL9a33k0jAAcv
 7CwA57mmRw4JULmmmGsakVtZZjPDb9BxoYnR+9zy+syXEQgGznO+TnMIsi+teazVU76v
 DfvVF5Das5j5GmJdQLepyTQyrVx2UQHACaaXyveMyqK7liouukb/wslF89tMjGpStWl5
 im9D+Tfqb8ubztacgBAVQh6qZ9sbt9Fems6Tdga32lw/awWABGl4CmuBND1eNmeE6Eem
 ivLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gadtRptqMEMWzO7/udpBazlKdbGTM/FsnG+P+qdCdG4=;
 b=Tv34MUAAZdI7l+Y3AA4WvtlbRyjbwWMXWHC2r9BdDpCyD4brE80fb0Yg9yfrNHI7IM
 MNUas1YjJ/w3XJqTi78jZTx17Ty6BGzyvxgrXlzoJwb+Kh006kcKbXvlGAxxoebgKp3H
 ZbnsP7VOdeWi31JgYq4DAxoAVQwqHzEl+AnBFO1CH2UErtgpWTAbV10QoJxxEVQn3YJD
 hUp36g84oupbDCcoPEQXz15W64UloaOtxUauZi3jPtTaLqeqRkIXxY5hAU29Ib4lqS1+
 VqJ2t2pxcL/S3nrXKKTAGQrPjXSvP9qjBT1IrD4NiAvZXAv60/bhP+DT1FrTKrRUF9UX
 MFsw==
X-Gm-Message-State: AOAM532Q0qXzQI85dnl4BRED/cNCl1mCZie53lNJAuc9/8YZn5uDEqkT
 kpsYFPt3S1Bmq9wvDNaK0JWiTQ==
X-Received: by 2002:a63:2c15:0:b0:3f6:6a5f:8f0a with SMTP id
 s21-20020a632c15000000b003f66a5f8f0amr5891187pgs.76.1654206539702; 
 Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 06/71] target/arm: Use el_is_in_host for sve_zcr_len_for_el
Date: Thu,  2 Jun 2022 14:47:48 -0700
Message-Id: <20220602214853.496211-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: zxjGFtNuhBxf

The ARM pseudocode function NVL uses this predicate now,
and I think it's a bit clearer.  Simplify the pseudocode
condition by noting that IsInHost is always false for EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 839d6401b0..135c3e790c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6248,8 +6248,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
-    if (el <= 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.34.1

