Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2433826lft;
        Sun, 3 Jul 2022 01:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAw+WuUOaxhyUA4U3HBueN0yQR0A/UTQ/lyH8qUe3zqoA8mIeaH3/Jouyxkn6JaQqrfvE/
X-Received: by 2002:a81:990f:0:b0:2f8:c347:d11a with SMTP id q15-20020a81990f000000b002f8c347d11amr26035472ywg.507.1656836749222;
        Sun, 03 Jul 2022 01:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656836749; cv=none;
        d=google.com; s=arc-20160816;
        b=mKZTVitZLJkctuudmnEFX+Y7JVA43i6feoS8oD1NIvFiO/5P2YvrXVGozM7sEHJqo1
         +PCfbAnZqot3qKIzOLGLmRgvf22zDXKv75TETg9AHCX1hvEd9tr0jvlH/deJf/fDtWRD
         erRHpmHbmehzbO8c8JVLiRoLdU7WfjVC8WgRATp5YkN+LuXmva6slxu4IgGBped/SSc5
         TyaPO2vxmuN0LMojhFDuGWzf8RYFg0eXXEiJElvmp7L2Xj3Rtclf1LJEGWLOxOYECCwN
         RsEGpJqlsVIls31dnF97frRXNwTr7tk2C1QSio77JSwF1yzpg5raBAJWCczpA9hsCJ/L
         5dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=luVPKzasukavgin4n19Q4taZFn3j+af3jyeUe3XIhz4=;
        b=cRc40Mn/eg4OppqlB8vi/NdSXTuKpcCRRG4jrXoZZ7o3T6jrZrjQx/JjHbCsWfFqJV
         1ksL+y3hL9wET10HyKWR05dQbEHlkEu06PJbv+5SUNpDG4SSfB8fq02avrEBenzcBcFV
         OSVBvwW2T9lQlYQYeSuU42zl00DNxyiTnwPhTW7uRcgtLP4mBVcxukgs+3f8u16Od8f9
         RRmeSxiEND4mjlHzbqJX2kTFbaF1yuwUAZxs4jkPX9VkfLD3qGja/XyylsAb4JGqgtWJ
         dZ2Af4+lI15wxRKqzL1N50/L+G0osZ9qDLqvPoC2TCfZqtfyVejwtJyNXYJb+QRDrnHq
         eR6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/eAemyz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k185-20020a8124c2000000b0031c8cc2de94si1067029ywk.166.2022.07.03.01.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/eAemyz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7uvM-0007I3-Hv
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuD-0006P3-R3
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:37 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuB-0005od-Pz
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:24:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o18so6041653plg.2
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=luVPKzasukavgin4n19Q4taZFn3j+af3jyeUe3XIhz4=;
 b=C/eAemyzfdi7SQ0wNM8HnbS8K5cYr/V8RLlK8oA7aseRCfA6h2r0CdTIGVU7sQsbiZ
 0pt3IzlkjjELsfxaburKXJVVIMWLmnx3UmTZZY+SWAi+OoA7VhhOSmnFEVUE2WTEdz8j
 jqr0FO8aZJt29kYXVgk6lvLB2OCdMVpi5xQ+5TdjMgHrfa2p43HBChjWE83geyUSKQ/u
 1vO3lmokVpcmNzrYfkifzjOK+iYlvj4lyX3l3reGgbUJr9dV3y5Vdg8GoL8woxco0iYP
 MCfkD9sIe9+2o9T1mg83upZ0/RWXYVsxAuZEpv7rLeBgQ0RT62ip28AyGeSbsXdzRin7
 7BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=luVPKzasukavgin4n19Q4taZFn3j+af3jyeUe3XIhz4=;
 b=cr+82axryV/RwqU/8PE+QOB9tVG3oeJGaxd/lLgLFPLDtn5Tjd78PiGga1Xd5eoNyy
 LPQi8lMHuKc/7g8XipH6RBZM5FGHqjj25vx46SPqSSQOh5RZ/sh57x/f9G80Ms5ZVw99
 mvj9mEjwBNGhvF9olRmrlWT/JGRL1qXHCgRQThhfS1lr/Dzh1uz4J8OSzioyfKN1DFHc
 FPlrNiE3RNWyEiq9eG3eNXXMZXaWnb8HBFONMDI/ZGV9RmGqod5Sfve2x9zDCpgST0LG
 Xq/8dJxrZuqyjkwFRuXJSG+EHehTJ99Tr+AVld3BzgqnYloTYonc1y6/ecIqg9M2uO1+
 HUqQ==
X-Gm-Message-State: AJIora/aPcm5r29je1rhSe5lTbwmB0ziJpqALSime/imuBlnZfLOboei
 HnA1qJzhOeCSdEogxaRNcI8LQw==
X-Received: by 2002:a17:902:7204:b0:16a:22f1:f87 with SMTP id
 ba4-20020a170902720400b0016a22f10f87mr29561512plb.3.1656836674424; 
 Sun, 03 Jul 2022 01:24:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/62] target/arm: Fix MTE check in sve_ldnfff1_r
Date: Sun,  3 Jul 2022 13:53:20 +0530
Message-Id: <20220703082419.770989-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3hckgL0xn8+y

The comment was correct, but the test was not:
disable mte if tagged is *not* set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1654c0bbf9..db15d03ded 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5986,7 +5986,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
      * Disable MTE checking if the Tagged bit is not set.  Since TBI must
      * be set within MTEDESC for MTE, !mtedesc => !mte_active.
      */
-    if (arm_tlb_mte_tagged(&info.page[0].attrs)) {
+    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
         mtedesc = 0;
     }
 
-- 
2.34.1

