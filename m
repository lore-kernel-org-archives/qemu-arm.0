Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4935612ejq;
        Fri, 12 May 2023 10:03:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+DsjTUK+7Ca78SYnKepFTbi/tM4gAnkBenRsKlseqVwDGd6euoZdUtTNirfw9ew7mlWtQ
X-Received: by 2002:a1f:2801:0:b0:452:ff1b:d24b with SMTP id o1-20020a1f2801000000b00452ff1bd24bmr5858463vko.1.1683911027574;
        Fri, 12 May 2023 10:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683911027; cv=none;
        d=google.com; s=arc-20160816;
        b=slXQamnKZw7p1gpr6VY7FDbfeSIXfdQ9GDbO7O+vduLAntbuXzuuyfRCl7XyOdstC9
         kDU3g1mxR9fdSh9UmAlA3dTKVit6TmTzg2fzHNNAnDYCFUJ3NkAgGSOFbeCsJ3DXjgQF
         tVJJgfhmGKUu64PvJwnXAjNrbHwvf9r0tOkA0v7vIcN/iaVC5VmxoLwLnxWl1wKFgUHx
         NFG+jVveXuferHjqBqElyjVDriZ15lnx1lx+j24dtYnV9UGccDoNgh2yuUQ416Nkp9xk
         8IpF7SNlRMb0U0uy2OF/CRzMQVjX1au+BMoHLzgM4VykythilZS1APrSVsSMf5s9fHyJ
         7Wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zSeckB/DU/ftoxKs9zBa0uYqulCiNpn9zBPfGQQqV0Y=;
        b=FJ31bxoJ3atNMr1xnDiB/3Yo/uK4OovrFval0yizKcKaxQZetq3dp5bwNFGQ69hWhm
         0ImSkB688N66x2SlqhqtnFQy7oxAjnt6tgDa81v52uabeS2QEN/BDXTU+AaZNDokPEUf
         deRsg6vROakzCaIRzA8k6Sfw/HpbH9xT7iu0EbtUWO4GyjDbeRB3qQb3HtSgsQrltJ/O
         K4JMQF+/8tNMq/7nytCKo8QrduYISAIWObBXpNxloGL9zK8EdG0eYqfOOdMSQzu1Dd2M
         u/B/1U+mvCFNS7zEERFuT9bCI81KeRXwJ+AaPApWZQwquxXkX6VgnnfU5f9yzDhiVOjM
         /5kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RlOsSVfc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t199-20020a1f91d0000000b004539ad00437si324878vkd.130.2023.05.12.10.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 10:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RlOsSVfc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxWA8-0001CQ-G8; Fri, 12 May 2023 13:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA3-0001Ay-DB
 for qemu-arm@nongnu.org; Fri, 12 May 2023 13:02:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA0-0002Ah-L0
 for qemu-arm@nongnu.org; Fri, 12 May 2023 13:02:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso33566515e9.3
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683910945; x=1686502945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zSeckB/DU/ftoxKs9zBa0uYqulCiNpn9zBPfGQQqV0Y=;
 b=RlOsSVfcNLRYGCxjhQmpNDzp+tByx80LezNUtv8G7omXcCeNcpgwb/ZOpAf1uqb8z5
 tuw95c+90zr5z1fZD0Ih8MA8FrZZPLl0cJKSy+mufJ++/xEgeF/m5mGlraFMhRN3+pIV
 axX8N6XvnQsxvgBJvSpGRK5FVB5iW2LcFfqHwoxSk40kTstwRV8kgD5BfNWzpwLOakyw
 lbwa0beBtrwvFNyOBdlwgQ7yNsKbJJb5XT8WUx4lFiCZfTICXvh0R3+YJsFrSKxPZUJc
 p5qm9Tbgg38Ec4u4Q8o6EjtBmI3nExk8dNZogMX3WxH6v8V04nltBVQYunTpuKbXOOCB
 gUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683910945; x=1686502945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSeckB/DU/ftoxKs9zBa0uYqulCiNpn9zBPfGQQqV0Y=;
 b=diVZ4VTKc0fDRmFouSHJupWZ+KNxPjYZilmVHOhZUcyVuJP8p9yIszPPzfbKwhL+w9
 PmfGDOPbjdUc8Eo+MeRCjssfsXbva6hSNHn9UXw+y/9RMvRq9bKyss8S3s2sVIt5vgoo
 cUMEwB12ZQSLtCU7+X3f2zUu0oq9UQNWrqcrkTshx8/U6zYgGvgbnTXJC24A+lJ8N4s1
 lBlxks8rWw4e0DgC7kk6hnF46uA1bptNXJ0KyJvUaylP/aJRobBJsPjJFK4WBwal7Ajd
 4BAnz7Zq4d9jpABwIX7rBTY2DSDNd/hFizlIWN21x4mWJTKmTnZMX3i+9GuHXhRJK0SO
 GxPA==
X-Gm-Message-State: AC+VfDwAQr81iZMpV2NvIeIpRmbbewyNNGFyvw2sz5tBfw6o6g1CtcGG
 /Nxw/bMg2dqcrMyArWbxs+zeAjz3ozge4Pr01Ks=
X-Received: by 2002:a05:600c:3787:b0:3f4:2bcd:5a6e with SMTP id
 o7-20020a05600c378700b003f42bcd5a6emr8770251wmr.30.1683910945703; 
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm3521004wmg.20.2023.05.12.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Saturate L2CTLR_EL1 core count field rather
 than overflowing
Date: Fri, 12 May 2023 18:02:22 +0100
Message-Id: <20230512170223.3801643-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512170223.3801643-1-peter.maydell@linaro.org>
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mUEDCSEKM3Ne

The IMPDEF sysreg L2CTLR_EL1 found on the Cortex-A35, A53, A57, A72
and which we (arguably dubiously) also provide in '-cpu max' has a
2 bit field for the number of processors in the cluster. On real
hardware this must be sufficient because it can only be configured
with up to 4 CPUs in the cluster. However on QEMU if the board code
does not explicitly configure the code into clusters with the right
CPU count we default to "give the value assuming that all CPUs in
the system are in a single cluster", which might be too big to fit
in the field.

Instead of just overflowing this 2-bit field, saturate to 3 (meaning
"4 CPUs", so at least we don't overwrite other fields in the register.
It's unlikely that any guest code really cares about the value in
this field; at least, if it does it probably also wants the system
to be more closely matching real hardware, i.e. not to have more
than 4 CPUs.

This issue has been present since the L2CTLR was first added in
commit 377a44ec8f2fac5b back in 2014. It was only noticed because
Coverity complains (CID 1509227) that the shift might overflow 32 bits
and inadvertently sign extend into the top half of the 64 bit value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cortex-regs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/cortex-regs.c b/target/arm/cortex-regs.c
index 17708480e75..ae817b08ddf 100644
--- a/target/arm/cortex-regs.c
+++ b/target/arm/cortex-regs.c
@@ -15,8 +15,15 @@ static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-    /* Number of cores is in [25:24]; otherwise we RAZ */
-    return (cpu->core_count - 1) << 24;
+    /*
+     * Number of cores is in [25:24]; otherwise we RAZ.
+     * If the board didn't configure the CPUs into clusters,
+     * we default to "all CPUs in one cluster", which might be
+     * more than the 4 that the hardware permits and which is
+     * all you can report in this two-bit field. Saturate to
+     * 0b11 (== 4 CPUs) rather than overflowing the field.
+     */
+    return MIN(cpu->core_count - 1, 3) << 24;
 }
 
 static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
-- 
2.34.1

