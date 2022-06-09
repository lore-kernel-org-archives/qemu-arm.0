Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp683761lfb;
        Thu, 9 Jun 2022 13:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyErc7kc11jMfFkoC3dLE1ysBeqY29HBGEwpHV2gzYkM6pqdViyIp9daLFklciUDGdrZo2w
X-Received: by 2002:a05:622a:3c8:b0:2f3:ef89:fa28 with SMTP id k8-20020a05622a03c800b002f3ef89fa28mr34315410qtx.136.1654806938253;
        Thu, 09 Jun 2022 13:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654806938; cv=none;
        d=google.com; s=arc-20160816;
        b=z6aYK7Isvg/aOv2A3qVoubtkqp9eTxVUL6gG7JmNtvwZsafnDpuaQ5pYsGRE/NnSUP
         7PIB0/7UNqUkvghGp6Ab8AE+t3hcLMlCUOo66qeOYAZJdE9GF1ykbo3bAJnfm0cBYysu
         s1Xuy64AsqpF8D2dOBxKFtpbHvC03gYkRz65Mco30eBqxndLOerUfHo3CfYRhgaJZJU3
         DS7Fmal4v8r7ZM207drd4AK0Vwkn4znMX543Nwji6/jGXiyfRMg5vySzmgyGBVcyKiFJ
         R2q0XgOXd52Z/T05UkXKVRtYTk7Kik8lrGJ43BiXQXCYwak9M5RSdqGTO68Yx1E6HccP
         l5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=or4hVFMgSgQ4bkROq2u2MyvWBg+YN6u3/ulE0jHiq7E=;
        b=u2R+neikr4LbCg/set0g47UdyGtswlV0Vz+JW3maLE+gcBBJgTXaHZEMJGaSCkBxQ7
         /GlIasSzoIIPmvSTBrRaza1FB+dme/K9JjRN65TzyygDYc0c4v5iTz6Z6AqPE+oFYcLN
         agMkfO0dBTsJYrkJNGZqi72k5H7V/PPOVEYuwzUi+6ZkFXY/6267un6+u1RIpPc16a+P
         uPECjFx3pzWHLTrj9DGNW+2HUxk8DsOFYzSNrxaazTLxJutV6BWDNe/sY1HHM95/iNsd
         dx/LBaMiGNbaRMG3Nh7p9bujits9zlV6dUe+kWjMxoGjCTWRGfHYI4zfX2fwR0KHB7by
         H0PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7qOLqSz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020ac85a05000000b0030502339b74si3117790qta.248.2022.06.09.13.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7qOLqSz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzOsT-0002Y2-LU
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmD-0003TA-K6
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:09 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmA-0008Qi-Ib
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:08 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so379259pju.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=or4hVFMgSgQ4bkROq2u2MyvWBg+YN6u3/ulE0jHiq7E=;
 b=d7qOLqSzGe3SlYCLMEVqsHC5BKw1lZfzjDZEXGYVdzvtks8WDH/nZQMAQuTo9YsgWh
 oL03qUF+wtt50SOLayegK2xisGzfOlh0xpjfWRTWwn5EFTv46vYcI6suN0DCgjnSoKTv
 8DPVisZcIx3x45aA4xMIIWYAIA3ft627At2+zhkegA7QGaHLQOzL27QByfvYsspPEDUv
 HzGaeo1QFAHdjUAI+bxkC7/IyzXQpdIGtyx0WTd95nT2SPAu00NFYasPLFeLc709FxPf
 dtCZPMeXu9t+pdWGnsCmS718PGOv4tqHrVAMPJeFE69SM2LbJQv1tebYluvlDmmsIOhT
 geBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=or4hVFMgSgQ4bkROq2u2MyvWBg+YN6u3/ulE0jHiq7E=;
 b=Jro4Nn3wZHb36Z8ccgRDidDYo1e+YqoXy9U8FDQy53tGy+eIL/JDWUFNzvyu4Hu1y7
 T1XZmO+ll6RCjR49Tp44106mJ5a1it7OZhuVY3PZNaVEo/0gJk2gSd4L64blBpZ1Ei/A
 W/unv5OjaNMj2DDCm1I5PapSTsvrSn0iG1dcuSBVm0n28v/TQJXpnRSjfBFP4N+YhNEs
 I2AZJBWKID5N165Yc/VqUykTBSm5Ow0z5SccNnBOBZ0FpLl9uQr2CPrryC4+dZWBHPb9
 aBDhDlpxdWOR1p7HltOqy+zyhh+T2QCqdibAWYDZmZSja1HAGG0UZ69G75UsKCLcVUs3
 6/LQ==
X-Gm-Message-State: AOAM5303wJe798xT/fEse3M3rbyq+3KfwDyY2PG7pTei3DtG8+Xug/42
 VJxPXizxM08OWsKuWYzPk077fw==
X-Received: by 2002:a17:90a:5c84:b0:1dc:9b42:f2cf with SMTP id
 r4-20020a17090a5c8400b001dc9b42f2cfmr5033134pji.123.1654806545247; 
 Thu, 09 Jun 2022 13:29:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 03/23] target/arm: Move exception_target_el out of line
Date: Thu,  9 Jun 2022 13:28:41 -0700
Message-Id: <20220609202901.1177572-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: kOuxNC7Er2d0

Move the function to op_helper.c, near raise_exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 16 +---------------
 target/arm/op_helper.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a1bae4588a..af9de2dbe5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1098,21 +1098,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
 
-static inline int exception_target_el(CPUARMState *env)
-{
-    int target_el = MAX(1, arm_current_el(env));
-
-    /*
-     * No such thing as secure EL1 if EL3 is aarch32,
-     * so update the target EL to EL3 in this case.
-     */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
-    }
-
-    return target_el;
-}
-
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
                                                  uint64_t sctlr)
@@ -1339,6 +1324,7 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
+int exception_target_el(CPUARMState *env);
 
 /* Powers of 2 for sve_vq_map et al. */
 #define SVE_VQ_POW2_MAP                                 \
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index c4bd668870..97c8c9ec77 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -28,6 +28,21 @@
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
 
+int exception_target_el(CPUARMState *env)
+{
+    int target_el = MAX(1, arm_current_el(env));
+
+    /*
+     * No such thing as secure EL1 if EL3 is aarch32,
+     * so update the target EL to EL3 in this case.
+     */
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
+        target_el = 3;
+    }
+
+    return target_el;
+}
+
 void raise_exception(CPUARMState *env, uint32_t excp,
                      uint32_t syndrome, uint32_t target_el)
 {
-- 
2.34.1

