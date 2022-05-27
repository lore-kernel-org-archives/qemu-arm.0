Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1202488lfh;
        Fri, 27 May 2022 11:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVw31sD3KWDrc3ISIqzPlozSNBr5vpYXHF5CZnsDgCqcT8IOwfuV+DIlg5ca4T5WDg79Nq
X-Received: by 2002:a05:622a:193:b0:2fc:6df:bbc with SMTP id s19-20020a05622a019300b002fc06df0bbcmr8783042qtw.285.1653675236290;
        Fri, 27 May 2022 11:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675236; cv=none;
        d=google.com; s=arc-20160816;
        b=aA80T8TLvxRH2xwbjOWhg9eS2pjteBdhRPcEUM94kbF8bd0AsvCiELdQ5L0WmLtALc
         9IuWWciB4kanE6z3q+4Xjk/DOq028v0V7MNYVg0QcSt9oH5sdenQ/I4AAES2cKVoXifc
         PYFyFDPIz6KSi4wTFr3zPwNNnpvHcl9F3T1wY9hrweFhNgqHzMuUGmpdX99x4r+0TwPQ
         GdtIE2M7xBmCictElX3TcH4RmIYbDN0f9HDEPPJpSbfRPryenb54RpLmQigEbXhPkMQg
         A9ykrAT76Qeki5Ok8ld7jMqJqY87POjvauC/fp7R3duw8o39jCz3brVXsU93s0o1GZVr
         lsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CjwMy/u7BmGHWp6cphS1Ihq36Xg3IYexqKmZ8A6LwiQ=;
        b=x9061w1ci4Ezmfz0ZVjgIdLAkXlrGCprquZomPojcAr3AFsL8CaMhARTOswUIhK8fM
         mcIMFK1DfO/cn/y4J3Og8T1SkqsaeTz5c/nukgr/hYFYWmCGjjq/QqjYsaAp+s+8HabA
         ZaXL4eCPHbBKvhcZ/YDrzJYXRy5g+thXib9BicNSH56KCyq3/yzKW7NnDrMPLWjKXVd3
         1JfhyB2v5m9Uc/0W5VbEk34t3HvBqWXqQAKbTf7UYf4phcDYkFXnDtZfeLRZa2e16BY4
         i//IIVBS82DhUtksJGrSwJo6ual0Ujzl0rDfUvDBxhpZciR4y7My8nsqEJQTazJq4axc
         BYPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4EEWCfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17-20020a05622a105100b002f9551842e8si2771750qte.393.2022.05.27.11.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4EEWCfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueTD-0006Q7-Gz
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM7-00036f-C8
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM5-0001em-SE
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id y189so4934227pfy.10
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjwMy/u7BmGHWp6cphS1Ihq36Xg3IYexqKmZ8A6LwiQ=;
 b=K4EEWCfEZ/hXlpQPrsweVT7CTqYfwcQUYNfzz2D49gcp5KDv/brzDWhOgZrYJLAs7H
 /RLC1hrVE63byBLnC3R4u/QiQRMa5H45LRQPghqPAvqhuFBjp4JLwkVpGVWZEjo+p8sg
 WeVhMDdBMejryAJjiV2Yl6qWebSFcby2Cr5MTtYskm1MUPa84Ws/miNXN400I8Wh9Qk0
 5UXxNcHgGp2M4qr8V64CK3qBFellVVNCDcTKUGMSGiXUrGotRq6AoqYzfcqjVvr7+20V
 xolxBr3I9WvGdoPq3ybZYmmX7nZTxZgRh2b0vV39JJMvNciL9aa7BATpZCD2zIUKAtrS
 yj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjwMy/u7BmGHWp6cphS1Ihq36Xg3IYexqKmZ8A6LwiQ=;
 b=Z//mfQZaNA+hiXT3/m1wFHkqqzKCAOvZWpwNpel/Zs94QGrqBEJyNU/25JgB28AvKv
 yMvstTME5f0H7VUQN7FB7aa+KpMdV+jlVUrgVqK1XBRnZ3otSCxlZ2ggddWxLogsgCBX
 MoKyuyu7PjIwOtftwSElGYZ/4bPbvSW5xORmilz0zepSnvATOil5kEDYXMBs+Y0PA26v
 p+u/pXlTcVslJoVkUG52Ezg8uIT+iY4aHunU/IGquhGmqN2cKmBVCE65hUouXzfmpH6F
 rPVYXN4fU/PCuAZc1r8ZUtGS5wwOx4SX4rFOgzlzNGkP1bu0jrS1Ir/gP67gJwupyC+V
 lwXw==
X-Gm-Message-State: AOAM531F3vbGACD7xW1Go/1yl7Qa+4nGrOJeMCuDR/xNoXhVoH5lf9XS
 7syv7T98sBAkdRPoad4vD5A7kg==
X-Received: by 2002:a63:c116:0:b0:3fb:2109:f714 with SMTP id
 w22-20020a63c116000000b003fb2109f714mr7378527pgf.237.1653674792617; 
 Fri, 27 May 2022 11:06:32 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 09/15] target/arm: Use el_is_in_host for sve_vqm1_for_el
Date: Fri, 27 May 2022 11:06:17 -0700
Message-Id: <20220527180623.185261-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: BtRf4wJG4cgc

The ARM pseudocode function NVL uses this predicate now,
and I think it's a bit clearer.  Simplify the pseudocode
condition by noting that IsInHost is always false for EL1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1b6c2459b..69b10be480 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6230,8 +6230,7 @@ uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
 
-    if (el <= 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.34.1

