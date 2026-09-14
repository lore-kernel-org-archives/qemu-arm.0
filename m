Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F530C88E6E
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:01:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x696y-0003RO-6G; Mon, 14 Sep 2026 12:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696Y-0002zQ-Gf
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696W-0004c7-FQ
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49e78adf099so15366325e9.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789401623; x=1790006423; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5szqtR8RuknodoYZb3hLembf/Wl4J7+JvbplK6l/9Mg=;
 b=UuUgEIQRQeC+smmk6f6j/NONW6Ix0GFmR/cEvMludroSidPgD8WWRQFlgKJPE+prLa
 FV6X3WlGf6cHU5/JHOoEV9Z0pQPvX3g7BMjtmr1gOd7TNaj2c4rBA1XxP2zer64LMjsp
 yj5qiN2obAemOtAlipTQUooOcm8PL+2Gj27UZ312Zp7+Q1M7LOeQ7KYhGN/wrqo6j4QZ
 ds2+R89ztholMSKSJUZJ84/HUZMB2X9DH3rw3/uhtI9XUmsUDYHoiC+w7uourShb3h6y
 4RdKzS2tvAhW2pL0tPeQrkzKAcojJELiZVEpPoJIB6gXWdYiXqDxuun0UIOjIzTeRmOv
 6ovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401623; x=1790006423;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5szqtR8RuknodoYZb3hLembf/Wl4J7+JvbplK6l/9Mg=;
 b=W7G+mHksrufoFk4kRAPZ75vO/9Cm8XauD0/k3kiAB5pNU9sWsUs+rDQ17FD0Pj1oNl
 /2cyroy/IOBhuo80rIDaK5ATi1lIqC2gae6kcjZREdTB4ksuokzcvfuFyQFzj1m+Fo90
 kTDKZxaxRK+i4K/34OS+y6Q9+JP4mn4YzE5HjS36ZjoN5ESwxhTG17pUiAZEPG5F1K9N
 YZ7pa6Lnj6xc2iQEbQExJfnXEeYheY1T819AUNSyzyWGrfokp1rI6KWaasja7Jitn67A
 4WCM9xJr+DzWO77QYlgCWKCTr0RAy/pWAbROAwy8yF5zCKLBMlHsF4o2MBNLEzJNtOSA
 lpHA==
X-Gm-Message-State: AFuF++m77uX/eHnQAPHALj6L3yxOkypTU/efMyYxNCA/KW53V+Remghu
 oUsprYJ/m+i+j67TCrppXpAMzt1w8epb8kkRYf9aIomsaKjdpZ6tdsyTYN9BMf1lCs1N+HBzJCX
 beLodtFs=
X-Gm-Gg: AYBFou3szpEfYpMdgLTMkaPTwJGLA59Fhi4pwGnMo4DGzixJymr9aRN+p8GKv9X+DHm
 o52dFWzLftGyjeTv5FjFLzBNzcRhGpj/Lvt5TYBN5FcvWWVe/8c2qJMlcHWQ+TpdTBb8DtUvtko
 GEEgMb8nzlyFTHLgJcC0eV87TxJkgd5Z2TWM6PG0vCikkVPV8BtQ9O+WrPfXsyn85h2RtnabTii
 qQQI+V0YGI81tbj2dD91G59ehHZmAt8i3rIjmlJ13rRKs1Q6X2/PkJyZ8Pzf+6SRtxSTj6xC7QV
 5vbDUvonf3+XtfTL9Dw8PUAC3U7R0c04qB63fZ8QYprmbktL58ggOe1/zAQoRElBnvk0dC9jDgv
 AFFSrT2IWrVOogvr/nrJCjNfVcNpHWK5q0IA7tnXBVOYXbwadg5shwFxfmrFZ6SjyrTkb200DxQ
 W92mi3Jw5LvPbu1iIFl5Ti4uVur4ANpffOxXTb2EFnVakB5IaFjOyzOcnY/bDC1cRduWHg6gbQn
 Tia6N2Fz6Ysy0HLCydQpjK2opcL943mxL0W3L1NE+lwbX6LOv6AyBDHrhWWxSq23UYOj6Y8V8CE
 PtNl
X-Received: by 2002:a05:600c:a47:b0:49c:fc6e:8cb4 with SMTP id
 5b1f17b1804b1-49e7a67741cmr40422615e9.24.1789401622458; 
 Mon, 14 Sep 2026 09:00:22 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm30797695f8f.27.2026.09.14.09.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 09:00:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] hw/intc/arm_gicv5: Minor fixes and cleanups
Date: Mon, 14 Sep 2026 17:00:11 +0100
Message-ID: <20260914160020.327787-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patchset is a compilation of minor fixes and cleanups to the
GICv5 code that I found in the course of implementing virtualization
support:

 * Various in-memory data structures are defined to be aligned to
   their size, even if the guest provides a base address that is less
   aligned
 * We had some extra blank lines that didn't match the style in the
   rest of the file
 * We were unnecessarily extracting a bit from a raw register value
   when we already had it cached as a boolean in a struct
 * We weren't tidying up our allocated memory on finalize
 * We can re-use arm_cpu_set_irq() rather than implementing the
   set/clear IRQ/FIQ/NMI locally. (This doesn't matter much for these,
   but VIRQ/VFIQ/VINMI have more complex logic in arm_cpu_set_irq()
   that we don't want to have to duplicate.)
 * Now we have a 'max-v9' we can clean up how we deal with the GICv5
   needing a v9 CPU
 * having the cpuif identify itself by IAFFID and the IRS do an
   IAFFID->cpu index lookup is unnecessarily clunky

Changes v1->v2:
 * fixed the lack of ~ in masking calcs in patches 1 and 2
 * patches 7-10 are new

Only patch 3 here has been reviewed.

thanks
-- PMM

Peter Maydell (9):
  hw/intc/arm_gicv5: Ignore low bits in IRS_IST_BASER.ADDR
  hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
  hw/intc/arm_gicv5: Regularize spacing in config_readl() switch
  hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
  hw/intc/arm_gicv5: Free memory in finalize
  target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set IRQ/FIQ status
  target/arm: Only allow GICv5 on CPUs without AArch32 at EL1..3
  hw/intc/arm_gicv5: Pass CPU index to CPU interface
  hw/intc/arm_gicv5: Pass cpuidx rather than iaffid in gicv5_get_hppi()

 hw/intc/arm_gicv5.c                | 72 +++++++++++++++++++++---------
 hw/intc/arm_gicv5_common.c         |  5 ++-
 include/hw/intc/arm_gicv5.h        |  1 +
 include/hw/intc/arm_gicv5_stream.h | 10 +++--
 target/arm/cpu-features.h          |  8 ++++
 target/arm/cpu.c                   | 61 ++++++++++---------------
 target/arm/cpu.h                   | 10 +++--
 target/arm/internals.h             | 14 ++++++
 target/arm/tcg/gicv5-cpuif.c       | 41 +++--------------
 9 files changed, 120 insertions(+), 102 deletions(-)

-- 
2.43.0


