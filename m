Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1915922lfj;
        Fri, 6 May 2022 09:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfNV7J4bER3TRN/ce4wwOJr6ywB9DE/6UHy54uurn0mSIMYs3wwG4/qTiW7cCkIzJd4D4G
X-Received: by 2002:a05:622a:3cb:b0:2f3:c135:fddf with SMTP id k11-20020a05622a03cb00b002f3c135fddfmr3592305qtx.386.1651854189405;
        Fri, 06 May 2022 09:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651854189; cv=none;
        d=google.com; s=arc-20160816;
        b=n+GyoisA8i1c2NZ5jj4b9649JiI4171beY7DbOcFczdaObtrdIOE8zJIm1ZVTwvck+
         aH02dd0WSLRGWMnH256CxyZgXAlmkrh0S4ztxZNlLTa0Xz4NKsD+ZNAtsUhzRXZYqF4M
         0qPcZmRtJCcOfQLbKa7xxXxYAQ1c7jgGL229TOBh2VtOry3VkDeOA4lMKq5ENmaQ6GPD
         4Llrh9uhnXPe7yO5cHHrC+aUHrQ0B03wWjmtw2mV537TVhiJtjjRmACCL9bkAsLSAFFf
         Up5hTzp+eBctsJn64aaE4/d0lRmYpRpus5ty03+JwHbDazsq6iDW+slarJ7uSol/Wj6w
         3GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ydvGhN0t90iiq5XA2T/fENqieiHK1rfWLY/HogNzzMQ=;
        b=KgDe/QMD2bRowy6s1C9sEsXbb/sUhaGE32ixirsmD8xMgTgCdopCyYPbS3Qrd8b24m
         1P5L7C+BiUT+5mEhuQxvFeRmrB0P3ZqUhfLs8DeWrtXu7I0rWU5eiADq5XzE5I3p7aaC
         QZ0RHFYoK5W6Py9HyqnNbTyB53ifeqOT9M7qZaOvpc7MXxoOJMc7K8ceJyHApiDv4dz2
         F0L+ft9oQbWVxiPJrdYfRBzu1gphewYfsgmB7gEY90eI/6WCxvOjqNgUjOm9YKOfFhEu
         QQLuqIrayohDNjOern0E8CP6SvWW5uKgj758S2kbDQ5Gg9oOWU1s+BFZuKjj6+TaSwDg
         OmIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mg1+TFFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h132-20020a379e8a000000b006a023aee545si2430854qke.550.2022.05.06.09.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 09:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mg1+TFFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn0jU-0006Ef-S2
	for alex.bennee@linaro.org; Fri, 06 May 2022 12:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hz-0005N3-OU
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hy-00051e-25
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so10659228wrv.10
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydvGhN0t90iiq5XA2T/fENqieiHK1rfWLY/HogNzzMQ=;
 b=Mg1+TFFFhlicPhHTToZ8ET0LfFBc8QkCedXw+yYmQmix3Xh2BqQ/Lthm84MaMAYwAz
 JaHMMgAIvQPmbfsecuCLNudP5mssHBrQ8jiGGx1b5ZlyFvBsXBuMuw/GcddfdUhYenaa
 ZUiAgvaxhkFlp0WoIOZl5oJimOIIwS1sUMPPdkGZeZj5U0UGjs+P5dtMUF7PQ8LoX0VV
 7AE2akSGDCX89lE+gQKbComrajdqHXmMGHwyafCT1nVqcYB9lMDVkKM5ybek4lQqcqUO
 tJi9hAOxKDZj2MIr2I0NbOv+MEI5Nq90yjvurwvIRRz52LZ8kVB4IgL1vmF+jmw9a8aL
 Br8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydvGhN0t90iiq5XA2T/fENqieiHK1rfWLY/HogNzzMQ=;
 b=z44ky+IYqgJbUkHMsoi4m6zg6MV+D4EkV5qGIqvA8/NF8yKPR1CGd3O2MtCBhcvqls
 tp1A35p6REVn/4GgaS4JlR8cX9bRBVKnlVtWdRoFzLLCoHoFhQ5GUTC5kVa8SDESJNwh
 WGy5hjO4zVLrq5q9UP6AieVKFISnQ6AL2oo4nBYK2BiR1qyecUQBmj4GZyDUpvVhUwXR
 ZvpOQwKRLsezupEBH9O6aBB+D2CC0qwYYQ2MHfJVueQ4pVFSzvM7CfKEilZZZtGPfuVO
 mP6fGYm0ifynNDgd6YF49k2wUS16DQQ2E19FBb7ykfZiSUlBiyqaty0aqKy5/S7/orJP
 HQ7w==
X-Gm-Message-State: AOAM531hvpV7KNL8eHW0wQJtFlBHTHmPjfQqkVFSpMcukQN5UANiw6ZY
 pp3z3DP50Q7q1Zu8COt1IsLEuZ4dRQnfSw==
X-Received: by 2002:a05:6000:168b:b0:20c:54e5:7beb with SMTP id
 y11-20020a056000168b00b0020c54e57bebmr3282395wrd.223.1651854091733; 
 Fri, 06 May 2022 09:21:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] gicv3: Use right number of prio bits for the CPU
Date: Fri,  6 May 2022 17:21:24 +0100
Message-Id: <20220506162129.2896966-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: uk2ed9+ZzpNx

This patchset fills in an odd inconsistency in our GICv3 emulation
that I noticed while I was doing the GICv4 work. At the moment we
allow the CPU to specify the number of bits of virtual priority
(via the ARMCPU::gic_vpribits field), but we always use 8 bits of
physical priority, even though to my knowledge no real Arm CPU
hardware has that many.

This series makes the GICv3 emulation use a runtime-configurable
number of physical priority bits, and sets it to match the number
used by the various CPUs we implement (which is 5 for all the
Cortex-Axx CPUs we emulate). Because changing the number of
priority bits is a migration compatibility break, we use a compat
property to keep the number of priority bits at 8 for older
versions of the virt board.

There is one TODO left in this series, which is that I don't know
the right value to use for the A64FX, so I've guessed that it
is 5, like all the Arm implementations.

Patch 1 is an independent bugfix; patch 5 is cleanup.

thanks
-- PMM

Peter Maydell (5):
  hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
  hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
  hw/intc/arm_gicv3: Support configurable number of physical priority
    bits
  hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
  hw/intc/arm_gicv3: Provide ich_num_aprs()

 include/hw/intc/arm_gicv3_common.h |   8 +-
 target/arm/cpu.h                   |   1 +
 hw/core/machine.c                  |   4 +-
 hw/intc/arm_gicv3_common.c         |   5 +
 hw/intc/arm_gicv3_cpuif.c          | 208 ++++++++++++++++++++---------
 hw/intc/arm_gicv3_kvm.c            |  16 ++-
 target/arm/cpu64.c                 |   9 ++
 7 files changed, 179 insertions(+), 72 deletions(-)

-- 
2.25.1

