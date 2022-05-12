Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp484111lfj;
        Thu, 12 May 2022 08:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEDhgtgLP6tYm+xW4XqNp68zGYlI2peOWQxa1QzuO5KQZRpjr+VuYmPD1ha8+zcNRbcs4X
X-Received: by 2002:a67:cf07:0:b0:32c:eb51:e1d8 with SMTP id y7-20020a67cf07000000b0032ceb51e1d8mr115055vsl.2.1652368541829;
        Thu, 12 May 2022 08:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652368541; cv=none;
        d=google.com; s=arc-20160816;
        b=0zG4lNRSidJJmmItziaa9Jal+MRNBpTbXJaZW9nGYwuVEF9l1qrk7DKY0B46ZNaedm
         Ga4SV1gNVm6yDXhVE7Ln4xNYwVBWrXBu4wemr9h+0y9Kmis/Mf9asAcAg0+eBVI+VCRt
         v36nL1uMurCR8ozzHmxD5+E/tEliLnICo7pll19PSAZWlDtukyNKm41ABJaAvAZcsEPj
         EuLQscqarFgl78MHDYvIMuxz7p+JZcMZHfCOJ8rlJTMnWqwMKoKdAV2mF/PYuiEs5TFA
         X0p6PEC5/uCp0Lx/r8y58LmJ47YWQhzYpw3KFS6gXSTY6CUDQeEkBUG8/WNwxpU4gmuY
         40bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=F4NZwA8ge6C+ju35yO9CmUblphVx+yvgRUYns9xyf3A=;
        b=NdmV3yJavdfSsjUce5WL1y9neBtMOBKUCdsYmUe+hUMPV8xhivg4DdUxCO04yMw6ZF
         BIJMMhFzCWq0Hc1cnVtvEw30jXDjaaSG5iMTtu6S9WE73ifPUAPvtoR440EuSXaU2Ln8
         t41gJaVwi4/36CJYbBsn/76Me5tdQmN+9PUjJKczj9m++Tyk0PFKgPbgv8VAdTniKXYZ
         a8uZMuYWzpel4U0+q1JKcaYMYctoVHJL0APP0Cuzt89DxGQ39FkWHENWNVXvhPBJBaz3
         4pOWhWZOXTdefUMWenNbN/JndDqpK+4iiRH/NGnB71iCT9s7zIR/mDTaAQwwHtU4OmXb
         e4wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H79cUtFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a1f1d15000000b0034f64d831easi1106944vkd.140.2022.05.12.08.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 08:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H79cUtFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npAXV-00032c-9s
	for alex.bennee@linaro.org; Thu, 12 May 2022 11:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWs-00032J-Mm
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWq-0000Ao-QR
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id bg25so3215897wmb.4
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4NZwA8ge6C+ju35yO9CmUblphVx+yvgRUYns9xyf3A=;
 b=H79cUtFgfTKTDHwdS7gpOTcMBPjGUibrZBNDTFJ+MfS/S+uOKIQqpggmh3A2Js9WvM
 yyaExiLuQMM0VWYuZAQ5ebK8QuN6JIYEoSKnzYbRvEvWzyEN62lhR3uAGMVUQ5zTYotE
 73J6a7DBiuNIOvoND+vUduyT899w49yvF7mS/49wMfI83xAJq5dEsH2+9LOpNl0Ozx3k
 A/NWZeD7CJ2Hw/RSsUHKGAfKJjixxbHmPdf5WV93KVNucHaDei82YTd3Hv46kh8G3baX
 Kesae7DWdSU/gmiM3GO+mSUi/6rYn/kILeyOVNpzB6Cz3l51CadFyMD4dm3iyX9ULLtv
 N3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4NZwA8ge6C+ju35yO9CmUblphVx+yvgRUYns9xyf3A=;
 b=PWdKxwiExbha5+kyjsbLagAjEOJ9A86rj6J/bY6apLCrOnG4hrV8MQSd0gkcbc9YlF
 HGXJXm/bmUTcLZrSTib+rs6wJvfrMilr50nBjP9Od3b6yAF+le7Nh3drKcUYkawb+9HB
 c92LGMzxS5CHfmet6g30BS+EZ7Ex3z3F8xQbnY85xfQWc4JC6ToHFfLhap55b0Gvg872
 d/L/ZSq2jiKFFUGgahPLqnJCGidh8Bg/kfuhOyv9CfN5eP3BrjGCZC9xqxf3W0gbnVk4
 1gmGOtmpNYAc2bww6ABFJxgt1wbfyNdOM1n4oYxtr0FBOZIih4BzEO9sR5SPryE9coII
 j37w==
X-Gm-Message-State: AOAM533udDzsMIiSoaPLE0fx5EvKZmB8KSrCESJ+XzKek0hGuAANjb/r
 53lHH+E76dTxEUzdflc/fuQm1JnsNZCqEw==
X-Received: by 2002:a05:600c:2552:b0:394:65f:fbf1 with SMTP id
 e18-20020a05600c255200b00394065ffbf1mr291125wma.55.1652368499185; 
 Thu, 12 May 2022 08:14:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:14:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 0/6] gicv3: Use right number of prio bits for the CPU
Date: Thu, 12 May 2022 16:14:51 +0100
Message-Id: <20220512151457.3899052-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: sEB4P2iDJBgd

This patchset fills in an odd inconsistency in our GICv3 emulation
that I noticed while I was doing the GICv4 work.  At the moment we
allow the CPU to specify the number of bits of virtual priority (via
the ARMCPU::gic_vpribits field), but we always use 8 bits of physical
priority, even though to my knowledge no real Arm CPU hardware has
that many.

This series makes the GICv3 emulation use a runtime-configurable
number of physical priority bits, and sets it to match the number
used by the various CPUs we implement (which is 5 for all the
Cortex-Axx CPUs we emulate).  Because changing the number of priority
bits is a migration compatibility break, we use a compat property to
keep the number of priority bits at 8 for older versions of the virt
board.

The main change in version 2 fixes a failure in 'make check'
(oops...) by stopping the GICv3 from asserting when used with CPUs
which don't specify the various priority bit values.  In practice
that means one of the 32-bit CPUs which in real hardware don't have a
GICv3.  The fix is to use a set of sensible default values if the CPU
doesn't specify.  The other approach would be to make the GIC fail
realize if the CPU type doesn't officially have a GICv3 interface,
and make the virt board check for mismatches and handle 'gic-version'
accordingly, but this seems like less effort.  I don't think
anybody's likely using this corner case anyway: the only reason I ran
into it is that with my patches to add cpu->gic_prebits one of the
tests in 'make check' now runs into it because it unintentionally and
unnecessarily asks for gicv3 and cortex-a15.

The new patch 1 implements that "use default values" logic for the
existing gic_num_lrs/gic_vpribits/gic_vprebits, fixing a bug where
the combination of GICv3 + 32-bit CPU + EL2 would cause us to
register the EL1 GICv3 sysregs but not the EL2 sysregs, probably
causing a guest crash.  Patch 5 then gains the minor tweak to make
the new gic_pribits follow suit.

Changes v1->v2:
 * new patch 1, as above
 * patch 5: drop TODO comment about a64fx
 * patch 5: add settings for cortex-a76, neoverse-n1
 * patch 5: default pribits to 5 if CPU doesn't set it
 * patch 6: retain local variable for loop bound

Patches 2-6 have been reviewed.

thanks
-- PMM

Peter Maydell (6):
  hw/intc/arm_gicv3_cpuif: Handle CPUs that don't specify GICv3
    parameters
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
 hw/intc/arm_gicv3_cpuif.c          | 225 ++++++++++++++++++++---------
 hw/intc/arm_gicv3_kvm.c            |  16 +-
 target/arm/cpu64.c                 |   6 +
 7 files changed, 190 insertions(+), 75 deletions(-)

-- 
2.25.1

