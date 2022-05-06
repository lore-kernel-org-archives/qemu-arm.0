Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1915725lfj;
        Fri, 6 May 2022 09:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2h2g9RJo140xbFzDd2DoeJOq9j0d3IJsjUyXoLWJE+H1iMqfwBNVKTgDrMnAmFVPMsNBJ
X-Received: by 2002:a05:622a:14d0:b0:2f3:4279:687c with SMTP id u16-20020a05622a14d000b002f34279687cmr3558961qtx.551.1651854170523;
        Fri, 06 May 2022 09:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651854170; cv=none;
        d=google.com; s=arc-20160816;
        b=d589hLNr4sZMXozc36f37YmKR68S93KsJFeifyVQ8jjKxgyNYycAMVonJs1bf/5hId
         t+6FSKGo0VEKXco1v86PqS0somM4UJ+3JyejTsvkA6wxS/kZG8Lu5e3gIDUBnoiXZe22
         GQLY+pUA7uEUKCqdEPpiOowMsp9VYVUnF2UwPSYki2qIMTGzdwCShC6KEtn/vCqo4f7N
         lWQfcvhN6SOsfu1AMwy5R6T516ApduoCdJKjRDfxS0QXFK5QVuliqQT8uoIfx3V59jUQ
         qLLhjfkjQEwUV+Q1/qU/GVB0mu9B6gCaFKyOj8yHar3EgTv/r1Hg4SooFFYDtBMOEWhk
         SvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bOxIOXkxIovtGJKfDrlFz7G6tvoSu0yK5tycQxFKtgU=;
        b=KdSRZW/KqJCr1UxUhgsvv0RdZ5YcHx1j7juImdLzfiQH4fZyPGlAg97BFlOKTmmhmy
         OfYCkTWcPV4uqiEuKHUdAxhJLuyaPO8FAUsjfa2LvOhZaHmb1FXq0zRYW51Uc8dx8aGC
         gO1r3ONpdFPemiJyktpKBT86lgdCUVUurUmFUGfX8ByyM+f+ZYyr1xrsvfU29x3sFUcw
         Jv00D8IEnserFn3fLqUa2lID9PL3vXCOgR2cIL3ZG6uo0AbCxZEL9bynZ4shlUHCQEdc
         yLiMQeWL4n6wygmyuZWv/PuLyOSMPLfkck7XY9FdhLUvG4hzO2KQ0Ktwj7XvFa+MYd0c
         miAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFJvEg7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf14-20020a0562142a4e00b0045a9d614fafsi2950986qvb.261.2022.05.06.09.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 09:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFJvEg7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn0jB-0005Nu-GY
	for alex.bennee@linaro.org; Fri, 06 May 2022 12:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hz-0005N2-Q5
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hy-000527-4T
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d5so10687056wrb.6
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bOxIOXkxIovtGJKfDrlFz7G6tvoSu0yK5tycQxFKtgU=;
 b=LFJvEg7EPUuS+Imjoiisw6voPKs7IkJkmV4cPoO6Aiwi9HPYr1UiH9Yhm2rk1COJ/A
 rK07dAwJln5wVSyEIKsLRTKnlsSSJ/xxrFZQrdh1cmokSGFuHkrhG3vEeZ16NlOy8NQ/
 H0xgGAdVqQDR7Nw4E6hm00y57zPdiPjPlkYhOJj9uof1A9bpxNNs2XSzkhedWrBS0Lix
 EchE+N8hrCs2a3s2WKKMYdvxl62pw8b+Htb8FeOl6gjSKf1fQWHZC9li60rd8OT+jh6f
 9i81sNv7betxt+/9P9ImywfpwTkOwU08aNiqz1BzbawwmtxGhTIWyZ+Wyh5lBaItHDxI
 Y4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOxIOXkxIovtGJKfDrlFz7G6tvoSu0yK5tycQxFKtgU=;
 b=iYKdiVFRFBmAoGfEwushc2Gq9cJjB6V2/agrNBnUO8W7Ir1y0u3CoHLYbNc2Zh5ZgZ
 LXw4gNFsU6RUJMsO7C0c6ffXfuP3L5PSRjTVXYKTx4ZX4Dg7CuXm0nbsgj013XyxoVgt
 dtkiS/Oo9DzJREcNUH4/5eeWKqfkkX172H+coiAKYTz60rVQn1i5qKR0uo1DtuOisX38
 sZsGiLIrUmhJaMEu9J41NmiH7Lc2m/EtH7aIcynrNmXusjNYu+W604YHiQCzKGHKVOto
 bR3jWlUWis3ARkZdputC6/ZI6r/kKT/XXT0Xy+vZHVvLJFFihs7kH2vUWNZCb/Bk8CuF
 eq8Q==
X-Gm-Message-State: AOAM532eV52+VKnioXB64pnLTESXDewSzYDVmB5KrE75Ut15LIcgHz+G
 Vdvk0MLaKN0X6qc4XV7O1M5abXOLb1qSbw==
X-Received: by 2002:a05:6000:707:b0:20c:4fd8:1d61 with SMTP id
 bs7-20020a056000070700b0020c4fd81d61mr3396746wrb.407.1651854092561; 
 Fri, 06 May 2022 09:21:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/intc/arm_gicv3: report correct PRIbits field in
 ICV_CTLR_EL1
Date: Fri,  6 May 2022 17:21:25 +0100
Message-Id: <20220506162129.2896966-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: MQDbCw41RqNC

As noted in the comment, the PRIbits field in ICV_CTLR_EL1 is
supposed to match the ICH_VTR_EL2 PRIbits setting; that is, it is the
virtual priority bit setting, not the physical priority bit setting.
(For QEMU currently we always implement 8 bits of physical priority,
so the PRIbits field was previously 7, since it is defined to be
"priority bits - 1".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9efba798f82..d3b92a36636 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -657,7 +657,7 @@ static uint64_t icv_ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
      * should match the ones reported in ich_vtr_read().
      */
     value = ICC_CTLR_EL1_A3V | (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->vpribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
 
     if (cs->ich_vmcr_el2 & ICH_VMCR_EL2_VEOIM) {
         value |= ICC_CTLR_EL1_EOIMODE;
-- 
2.25.1

