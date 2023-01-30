Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149492ejb;
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8apc31q2c1/+lHQdmBynZEmYg9wPd61XDNx4uZRdQNhzgdprx3KnbCfP67GBeZGb+a8YnQ
X-Received: by 2002:ad4:46d3:0:b0:537:791f:73d9 with SMTP id pm19-20020ad446d3000000b00537791f73d9mr25791537qvb.21.1675103164663;
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103164; cv=none;
        d=google.com; s=arc-20160816;
        b=MrH1J43MRid+xL1jVUQGEhbhSW9zNTsVS3z44B2NJgxm/086Jyw5yyT+x1ajFn7q8W
         D91EDevyQSE05WmcNM7Xcjz94YZOsbvNCO2wJ3CHgKUa568nGKpDbLriZ8Tl3Bh+AGf3
         alR6TyToUNyXRMIrUhi5R3g3QfVWiwniVI7Ikr3svrgT1dri1KgvaLD9/Z85233KquI7
         2jfCEEROy+WwYSla1IsTwU/yApGUjF85lU48a0DWK5Ev1IMm5Tjt4R42JHO+vgw1b16X
         1Y/woJyQV5GgItyU1tP1eluq4c8x4ishHXJkWP7r7JUDl3kKgz5l8TaEK/YI+WooWUMn
         Y+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=KTUZj6OwTzx4KnfWCe+7Mw0jDxWQUK6APccDZAtmbdo=;
        b=qfxkdC3mEvkj7NU0wuki3H20Ij98k/DCNemWA72AhGlYWDGPc53qIlENnfVHSIMzJ4
         XLeRhxYfh17mwTxCh1mjLcsx39ecvdEE3hP9LlEN0ej6Cuvvw6souIACnUh00EdfDUfp
         ZdlIlDU4qLI0eD1cOp1kM4ulCLVr1hDI1TsstU2ZjY0gzlm3XQMG3TkHspch7imh2B9F
         9d2RgGfCSFA/kuINOsbj2acqH8q3QZcwz72QZ8IfBKTQ6CFj2xG5WgXwayDBiffoN/7v
         GM0+RkzBw5rbBbbeiIT5cDjiUdPvX3xwI/KmskrUzEUAXravCqMBHD8/KMSRV5NF2r3o
         M/BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypxKx5yT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020ae9f442000000b0071d7f09151esi1407168qkl.94.2023.01.30.10.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypxKx5yT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqF-00012M-H8; Mon, 30 Jan 2023 13:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq7-0000yi-EV
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:11 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq3-0008CA-4F
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:10 -0500
Received: by mail-wr1-x433.google.com with SMTP id bk16so11966534wrb.11
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KTUZj6OwTzx4KnfWCe+7Mw0jDxWQUK6APccDZAtmbdo=;
 b=ypxKx5yTJW/VJn8GqVpjT8fbdq8taNAKII9x8Wqxk9OiJMrhQkjAmIVunNbE/AcRfW
 Z1gCVEyUMhJ9CKOKAGFAsZi9LhYA5354peHXWEObOixaS2yN8t7g/2BXMyjRvCAgqD4I
 Vy/Ymn8+kEmfceXFAPD10AFNoJ5w+8VDlW9vbJMRXQJTfR3+UBbvvYCupa6B2GQfWZU/
 AQ1Cf+0sDy9ggZlfuVldY9w9g68d9QHBagIVex0kQzhUZuj8+PqEoog47evFs0Vxys3+
 1U3onAMbmQw+5jC8MQpIF+y5zs67TxurtESk4CfU7TH+Ys9XX2qh5gCbiBQh+h+HuST3
 5K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTUZj6OwTzx4KnfWCe+7Mw0jDxWQUK6APccDZAtmbdo=;
 b=KxUszK4mO1wljR8rKc1D0O/xZ8G5e7wP/nyJD+R5qvIWg5EWnKzEC/FWCxxkAXfMve
 sRm8wZeB4+te5KY11f+uTgw2JHTT+SUsScxxz10Gz1J5LKQElEAsFwrgfy+GmLNlGuJA
 rv8/ZqlfJ0IA7EskMjnDapVI59X2FFhPE7+gOq6pTl+yX9wQ2XBRIOKJPBOR8BzKh3Ej
 xavxl/1qvyN8GoSCifty5BrNRSiXvhHraiSEtJ9xNwoXunP7Bhhpa48LLoyTwpXiS+xI
 jTPyvHNBG5OYunHK1jdvmMBubcFUfJt0rEYJrTslzq10dXxlGF4HU58WDQNWDahJUxjv
 R64A==
X-Gm-Message-State: AO0yUKUTTTLYvWXSvcrTjuB8Migd1sWYQ3U3vE1lgLp7mpSQoxuqzeNe
 w6GyyBOSrDj3T4UWZNUbFc/cCNOb8/orM4tG
X-Received: by 2002:a5d:404c:0:b0:2bf:e7c1:46d1 with SMTP id
 w12-20020a5d404c000000b002bfe7c146d1mr6091409wrp.50.1675103101217; 
 Mon, 30 Jan 2023 10:25:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] target/arm: Implement FEAT_FGT fine-grained traps
Date: Mon, 30 Jan 2023 18:24:36 +0000
Message-Id: <20230130182459.3309057-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: mwNUPkyZ4K11

This series implements the FEAT_FGT fine-grained traps architectural
feature. The bulk of this is new system registers HFGRTR_EL2, HFGWTR_EL2,
HFGITR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, which have bits that enable
trapping of system register and system instruction accesses on a
fine-grained basis (typically one or a few sysregs at a time).

Changes v1->v2:
 * patch 6 updated to use RTH's suggestion of doing the check
   inline rather than in a helper function
 * all other patches are already reviewed

In theory we could implement this with our existing ARMCPRegInfo::accessfn
machinery, but we would end up with many many very nearly identical
access functions. Instead this series adds a new ARMCPRegInfo::fgt
field, which specifies which bit in which FGT register should be
checked; this is then tested by code in the access_check_cp_reg
helper function.

A few bits in HFGITR_EL2 allow trapping of instructions which aren't
handled by the ARMCPRegInfo mechanism: ERET and SVC. These we just
implement "by hand". FEAT_FGT also adds new MDCR_EL3.TDCC and
MDCR_EL2.TDCC bits for trapping the Debug Comms Channel registers;
these we implement with a standard accessfn.

The first seven patches are various cleanups and bugfixes that
I noticed while I was doing the FEAT_FGT work. In particular, we
weren't getting the priority of HSTR_EL2 traps right -- these should
take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
The rest of the series is FEAT_FGT itself.

thanks
-- PMM

Peter Maydell (23):
  target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
  target/arm: Correct syndrome for ATS12NSO* at Secure EL1
  target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
  target/arm: Move do_coproc_insn() syndrome calculation earlier
  target/arm: All UNDEF-at-EL0 traps take priority over HSTR_EL2 traps
  target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1
  target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
  target/arm: Define the FEAT_FGT registers
  target/arm: Implement FGT trapping infrastructure
  target/arm: Mark up sysregs for HFGRTR bits 0..11
  target/arm: Mark up sysregs for HFGRTR bits 12..23
  target/arm: Mark up sysregs for HFGRTR bits 24..35
  target/arm: Mark up sysregs for HFGRTR bits 36..63
  target/arm: Mark up sysregs for HDFGRTR bits 0..11
  target/arm: Mark up sysregs for HDFGRTR bits 12..63
  target/arm: Mark up sysregs for HFGITR bits 0..11
  target/arm: Mark up sysregs for HFGITR bits 12..17
  target/arm: Mark up sysregs for HFGITR bits 18..47
  target/arm: Mark up sysregs for HFGITR bits 48..63
  target/arm: Implement the HFGITR_EL2.ERET trap
  target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 traps
  target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC traps
  target/arm: Enable FEAT_FGT on '-cpu max'

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpregs.h           | 484 +++++++++++++++++++++++++++++++++-
 target/arm/cpu.h              |  18 ++
 target/arm/internals.h        |  20 ++
 target/arm/syndrome.h         |  10 +
 target/arm/translate.h        |   6 +
 hw/intc/arm_gicv3_cpuif.c     |   2 +
 target/arm/cpu64.c            |   1 +
 target/arm/debug_helper.c     |  46 +++-
 target/arm/helper.c           | 245 ++++++++++++++++-
 target/arm/op_helper.c        |  58 +++-
 target/arm/translate-a64.c    |  22 +-
 target/arm/translate.c        | 125 +++++----
 13 files changed, 974 insertions(+), 64 deletions(-)

-- 
2.34.1

