Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp908242ejc;
        Mon, 22 Aug 2022 06:24:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7k7LgH0OoJ5llCMCz91SPDEwHNfR5ADLxM8A066HIcnNo3Y8tJpzMc1bLOCpqVoNZCeJNT
X-Received: by 2002:a05:620a:1928:b0:6bb:83e3:3249 with SMTP id bj40-20020a05620a192800b006bb83e33249mr12130822qkb.245.1661174665052;
        Mon, 22 Aug 2022 06:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661174665; cv=none;
        d=google.com; s=arc-20160816;
        b=MAQQmaCEMHb1LsQCz1qrN5rK2wbaJUDgw7+kq9gbxgaWhsyGqaLsIUBVTPCfSdQEKi
         Csjgwuws7GAGSV/YvLLHQrY+1cTHW2+4ZcgSA7iQY6XdNVhxSPaVPO2H4NvlRQP0aVl3
         AgkhGW9SpaxtaLCJSLp66he6B+hU2bHIOSRpqMoP4nCHhFJ23wHCIfSkhFOWl0RIRcH/
         B9fTjZUhLdvQ3a7kgCNwHoFv7ZXiUe45oWhQkQ6l9huD4AVfDAyIr0IsaUHuCtVOvLTn
         E0qNIQ7nFjcJB+glMi92Zture+a8EcBhsFfKquSihynzLcokGRpETLqX5ICXyAw6eZz9
         7H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fYJRGJbHqfyzGRsSKt0/Tu4Z570kNymq2RC3ejv5XA8=;
        b=dVFNPQSBVB11AYhZ+QO5Ovy/ZxAIO41IGzIprtbqAk1FUW9RWQtb/lQAe54xakJuQZ
         vKL/+s/ADjsSVBiSQYRGhJibdf223/gUEkDfnFWys0iaCQlLFzvvVOPuLD0d6tM2kjXc
         yz9QRToNmNzxPieafos3uz6z2X9XW2jB5OsZ9cE7qoAPWCioBGy9xW2e0TpVsuiVSutF
         iZOhiD49E5Ukd7s9dWKUdlNlHNsLD2dJl9pqk7fhu1zg34T7E2tX20rNZUU8P2eJwaD2
         54c7aC3na/MB76i+5876I55sR7+m33S/nTNKr2Z9+wx+wZBE/dqCD3JjHlkPP5u3c7i3
         YrLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MQDLFPdi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05620a25cd00b006b99a7a74d5si5119529qko.573.2022.08.22.06.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MQDLFPdi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7Pk-0005uX-JJ
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PS-0005sE-5c
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PQ-0001dj-0V
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n4so13189517wrp.10
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fYJRGJbHqfyzGRsSKt0/Tu4Z570kNymq2RC3ejv5XA8=;
 b=MQDLFPdiGKea+u64F0TyqoyISPHhSQtA1tHINcj2Q/HOxEX5f/QIt22vzWa+YZXrwM
 kCdf4d1evxnE4JEp0B+vkPrIV2kMA3WMwR28F2toIOdj8dtEMOhl6rNhY4pSlEA2Isq+
 H2xNh/y7pvqcTDtF30E10DfYoUx6oR/+7Yk3cwkRq9D2YC9tlGnP675GQFfq80di/zQM
 fJ7Ni8lhTZJ2oan6pJY6QNs3lt3oaOqle8cvARkbhFpsIEgjxIGca9QR/6PCQ/NbyY4E
 JltVFEGl+HtrIjYewmMHSgQPl7ZSgltJyS0cUHre4QnN/Av781Ty+omKM/5wFNx2mwpu
 b5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fYJRGJbHqfyzGRsSKt0/Tu4Z570kNymq2RC3ejv5XA8=;
 b=3Jm1ew7bUhcnu81ub356wP+rd20DSVvQhPdOi4QgCExNGLPBH2tCBFS6E3ZSIrCW+g
 1WnCtQFqGha1+2tGqREepoR2rTXKNjb4R5HsL8pxSnU/j7zehgpntvbFXC4J7iZHhv6R
 TzKQC42WoCicy4SP1rRQ9hlb5+XwCvi8w0IHkaCF9HY88+cLVCj6bKSumx+PHD5QELHS
 YCLhMt3sv4FCR/ik5IcE7+dkqdr9aFznPq4p/+RK0GCsCCUJ30l3LWbRiitJuc84kSTN
 R3M93lgRmWfV3xlTA91sjNp3hnr5CVCTdgvB5RrcrwAMvpzzVA6bl1FPjg9JaCVasnfP
 h9ZQ==
X-Gm-Message-State: ACgBeo0lPWVpbNnSz2ZAeqdwRtNWf8EfM+3t/C+tf8idihLJFrRwDT82
 5mgtySIRl8ge457DoixSIdNMpCGrVIdvtA==
X-Received: by 2002:adf:fb4c:0:b0:225:2033:b745 with SMTP id
 c12-20020adffb4c000000b002252033b745mr10272553wrs.447.1661174641624; 
 Mon, 22 Aug 2022 06:24:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/10] target/arm: Don't corrupt high half of PMOVSR when
 cycle counter overflows
Date: Mon, 22 Aug 2022 14:23:49 +0100
Message-Id: <20220822132358.3524971-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: Len1hxsb04N6

When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
to indicate this. However a missing ULL suffix means that we end up
setting all of bits 63-31. Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a5..87c89748954 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
         uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
                                  1ull << 63 : 1ull << 31;
         if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
-            env->cp15.c9_pmovsr |= (1 << 31);
+            env->cp15.c9_pmovsr |= (1ULL << 31);
             pmu_update_irq(env);
         }
 
-- 
2.25.1

