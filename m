Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4867CD6E5D
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Jun 2026 04:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVMLp-0000f7-Mn; Fri, 05 Jun 2026 00:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kylefoxaustin.github@gmail.com>)
 id 1wVLWz-0003KD-NW
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 23:47:37 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kylefoxaustin.github@gmail.com>)
 id 1wVLWy-0001C0-4T
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 23:47:37 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7e1c3f47d78so16591777b3.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 20:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780631254; x=1781236054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bmUZCPxlCwVjimaSrjGKpX2GbNzr8cV/TW/s7Au1g3A=;
 b=amRgoYFwhWFLPJLIfQ9a5Qdd6ePOMnMAabcf2wFXh3NHZwjfewib1VY+mhvQa7ILuk
 STtxV/cQ9S/XNDH/UPEgNXP2r5ZM2S98JmRoEbs5i4uBU2n6Ql7cZ+S9ztsOH2HPSo/v
 SeskkTs8QPGQbkmYlNSLo3g0cpQAAKZuJ9AAtZGvR1O5z8+uxZdiRBxFkzVHf5+C4R4r
 yA7p6sw3h45/KpFRpQzubeQLk+MWnfoSNPY9DibGfxn22MGgoS5Si6jubSy0gmONGsDk
 J69ysCRnp1Uw5ZLLiC8vI7KTXWjCSDGQYVUXeFu8o524hVZapS9RMgFmQJZDRLGvKL53
 Gq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780631254; x=1781236054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmUZCPxlCwVjimaSrjGKpX2GbNzr8cV/TW/s7Au1g3A=;
 b=lqPFAl3UBy+6VtkV4aldOk8B8HmExjE6tGiqUaaa5+lBuW5+xzTajTI5GUwuH+hSMj
 mXDmshzWlyxRHJgwNleGClDM5taUjdFhGUPl12fIIHpv8EOiZHIVCcx9j81RdIppb3G6
 FQMHMWLQMKE8/NYRcG0lDzTzhAsOkxvyTYcD5AewSJYg/nZAsfG/8MgJvdJW3njmXcol
 eNsWmM9jhVdWNljwrVqar4U1vypNgAkOWTVqQGFxaEy7BSLKsstHkO7jOj8nwRxatqYd
 QO72ZyvU2Kx4mwIeYq+XmJYH24fDEyuxFG1vs9830cu+81/E73xfMAflqkligV+WlSLZ
 zCVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+gwl7kf6a5Qo8FJh1eLAceHZQOiSKMSoUn+bWnccaKS0n55gHtMvHyFbnNf7mlB1QxjksunDf6vQ==@nongnu.org
X-Gm-Message-State: AOJu0YwmABi9Rs136kRKMxRAYwH92tNEjJB1dG9IyEKASn+9ybJAfOKC
 YhEFpsMr1N3d1Z5ZnnrjnvbL0e2lALSLQM/ZNcvbO3IOH0oZnupVIytK
X-Gm-Gg: Acq92OE3NqsKQ1KAp03Z3iATiPIvbnkSPSNX+WSlPcKM9vKrT43sj6ecbfOg38gqe1e
 qvQF/cyg/thuSSvD7jHj/8KFXUGmPX7Xo8IWGNn4mKEva36zWULyLK4+VASn8bNUjOioIDzdarq
 pD1dyPBrNvjq6Fs+zZSy4E0UNX7mU0V1fjquKh2xuu8raWFQqnGNeqQr0kcgaaTlI20CzQcgJc2
 u0qhBkmDz8SJ8JjhkC0H0uAxU1a8GHG/1YA0gHYk7wXJB/iHO5jzhswCiwsXkSibZqvxTzPsNBJ
 JpeTqlfFLLDoSbeSVZwjgBAsq1tw83+A/moQXEaSw7lzfFwQXscNqsEqkg8TwrdHDiRHl9KJ940
 Oh5UcqWAoheQhtE7XgfY8PSXKfAdDBzRS3CLCmvyNYEYdNZdFb0mrjb1sx9TsIY120+t422LnSv
 THcqRFmfUo+U30eB8q9LhlvhWlty/fhxKRispop6VNbPHd0dgAZ0jCBuYZW71Z7O3A+1WgvFibu
 XVwj8q8xgyEQAMVv3on
X-Received: by 2002:a05:690c:610c:b0:7ec:552c:b8d7 with SMTP id
 00721157ae682-7ed0adc07b9mr18390097b3.14.1780631254430; 
 Thu, 04 Jun 2026 20:47:34 -0700 (PDT)
Received: from skippy.tail1682c8.ts.net
 (99-61-67-1.lightspeed.austtx.sbcglobal.net. [99.61.67.1])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea23a9a421sm45031457b3.39.2026.06.04.20.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 20:47:33 -0700 (PDT)
From: Kyle Fox <kylefoxaustin.github@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kyle Fox <kylefoxaustin.github@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] target/arm: align down misaligned PMSAv7 MPU region base
 instead of dropping it
Date: Thu,  4 Jun 2026 22:47:29 -0500
Message-Id: <20260605034729.2874861-1-kylefoxaustin.github@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=kylefoxaustin.github@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 Jun 2026 00:40:07 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

When a PMSAv7 (ARMv7-M) MPU region's DRBAR base is not aligned to its
DRSR region size, get_phys_addr_pmsav7() logged a guest-error and
skipped the region entirely (continue). The architecture calls a
misaligned base UNPREDICTABLE, but real Cortex-M hardware does not
disable the region: RBAR.ADDR is only bits [31:log2(size)], so the
sub-size low bits are simply ignored and the region matches against the
aligned-down base.

NXP's i.MX95 Cortex-M7 firmware (and the MCUXpresso SDK demos) rely on
this. The M7 sets up a deny-all background region (region 0, whole
address space, AP=000) and then grants the peripheral space with a
512 MiB region programmed as DRBAR=0x4c800000 - misaligned, intended as
0x40000000. QEMU dropped that region, so a privileged access to e.g.
LPUART3 at 0x42570000 fell through to the deny-all region and took a
MemManage fault (CFSR.DACCVIOL), trapping the firmware in its default
fault handler before it could print anything.

Align the base down to the region size (base &= ~rmask) to match
silicon, and keep a (now-accurate) guest-error note. This only changes
the previously-UNPREDICTABLE misaligned case; correctly-aligned regions
are unaffected.

Signed-off-by: Kyle Fox <kylefoxaustin.github@gmail.com>
---
Found while bringing up the i.MX95 Cortex-M7 in an out-of-tree machine
model: the M7's MCUXpresso-SDK firmware programs the misaligned 512 MiB
peripheral region described above. With this change the firmware reaches
its FreeRTOS/UART banner; without it the region was dropped and the first
peripheral access took a MemManage DACCVIOL.

The new branch only executes in the previously-UNPREDICTABLE misaligned
case (base & rmask != 0), so correctly-aligned MPU regions are unchanged.

Tested on master: qemu-system-arm builds clean, and the ARMv7-M / MPS2
qtests pass with no regression -- boot-serial (incl. stm32vldiscovery,
Cortex-M3), the stm32l4x5 suite (Cortex-M4: exti/gpio/rcc/syscfg/usart),
microbit, sse-timer and cmsdk-apb-watchdog.

 target/arm/ptw.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a5201763a..3914d05449 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2665,11 +2665,24 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
             rmask = (1ull << rsize) - 1;
 
             if (base & rmask) {
+                /*
+                 * The region base is not aligned to the region size. The
+                 * architecture calls this UNPREDICTABLE, but real Cortex-M
+                 * hardware ignores the sub-size low bits of RBAR.ADDR (the
+                 * field is only [31:log2(size)]) and matches against the
+                 * aligned-down base rather than disabling the region. NXP's
+                 * i.MX95 M7 firmware relies on this for its peripheral
+                 * region (e.g. DRBAR 0x4c800000 with a 512MB size, intended
+                 * as 0x40000000), so align down to match silicon instead of
+                 * dropping the region (which would leave the access to fall
+                 * through to a lower-priority deny-all background region).
+                 */
                 qemu_log_mask(LOG_GUEST_ERROR,
-                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
-                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
-                              n, base, rmask);
-                continue;
+                              "DRBAR[%d]: 0x%" PRIx32 " not aligned to DRSR "
+                              "region size (mask 0x%" PRIx32 "); aligning down "
+                              "to 0x%" PRIx32 " to match Cortex-M behaviour\n",
+                              n, base, rmask, base & ~rmask);
+                base &= ~rmask;
             }
 
             if (address < base || address > base + rmask) {
-- 
2.34.1


