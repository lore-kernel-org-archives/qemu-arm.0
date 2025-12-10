Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCCED3E76E
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 18:37:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTP3l-0000zQ-Rd; Wed, 10 Dec 2025 13:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3k-0000yk-QE
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3i-0002Pl-DF
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:08 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so1152545e9.0
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 10:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765391823; x=1765996623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hBVLNLzh2h7x+zlFBYT2iI+TEnUQJ8dUS09XaPFchj4=;
 b=qDlI3MR1+0AySMB6QlO7Ni0joy8LsWtx7xgDj2ychIuSSCprrU0AZOkdzkhSGsyUqT
 8VSSyGuoyDKTaXsSi+RhJISWuIPWipacTfn+ekZjE7GCEdRsxMND+K75wE9pMqG7hZA8
 tNeRj/XNZpXePuOqSPwCH3iwyK5x0Wo9aAprGKHi8Hr6r7pVRV6mxsNRyAxkTcaKejUW
 gS0+bdZ65c+EKXm2yqxu1/V1H/H75uK+xCj3zzgvZi6jbtZ2fEz9hdkV77xKXrNvS6U4
 Dr6JgbfvG55yU5fXjO4+r4cxP9cJG3elNVDpiXEY0M7NhXYtv7hD6yEBmC9ovCxl48VY
 B4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765391823; x=1765996623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hBVLNLzh2h7x+zlFBYT2iI+TEnUQJ8dUS09XaPFchj4=;
 b=V0fJm+/T11/Xipa2kNialPpN4g2hXplkBmUspYEGid0U6ddPvBuqMHXnatJFQwSpj3
 giwfBbnaSntrpySDOT1uVdZF5aOD6B1dBaBPsXvnybwpYoTiO9MfXZi045RpuB95X/Pm
 QN+OYyiCBzM7KPuv22QE0VUKqw/8uMX5nJXRhXX1MvBAa2B2Bbft4HbPnnjhGPNyWnoc
 8QW1ALl5BBwc1uR42jbPkfnOF2TOwVqcTRNhUVqSvaCf5IQh+Oz1NUwV2IdSlNfAQE5N
 nN706J1gKNQeqHoSC7PIqynyc0AV4J47hcDRZX3jjJXCXxO7eoYOesoL2G5YVj8tZd+u
 HbKw==
X-Gm-Message-State: AOJu0Yw+r9GuOH3N1zX3w3nZ2mPewSILxoxBJZ/wKSscp7BiLsiRWVBl
 aSHw94F3UTQkcq4Kf8KAxIEI+ZnYR8udGgE02EGZ9koADQxIPWhHMI/fdw3okKo3txTp/1PWmB4
 7xIik
X-Gm-Gg: AY/fxX6ejK4c5nr9NRGr3XZkIdX6a0XYzCt/3QRSfJ/gBiWYwaRXCmZDqHgsyHF1Q49
 os2WiiRB5XSCytC5x4dnaSNOc5I+PmClUs2PtY99uhRjcR2CgubFIcN7xa+5N0iolMb4fGSfHbs
 B4ghUHtiItP+YA0OsGJ/PnFEZ8BYCFptw+zv85sHAFuzQ3ByS1HckfNgzqV+NMUg74tgy/AyKYV
 lTW4iaSGY0MdNIfsodxhQpKfQt+r0p7zja7zE3l9gX3XUUH5c4A/f7umkc0JCDkpQMewg0cMOqC
 LhXpMR4VfKzB27fHODHpVA420yzOpHaOOQrlmdPIZfzwh7xzTNfC5/8+xhyOTt7PQil/k1cojKZ
 7sFg+klNaHfCcWSEVjMfMMgP3PrcFvsSEgAK98m/EnpOgLUHs8vXEgVC9JS/QSwy6jRHwFMnkSa
 DfvWJXneEwQpBOaoWj
X-Google-Smtp-Source: AGHT+IHGOwdWq9kScrnFx6XVXxXDXDMCl1pCnbxGkGhRFLFbQeqxl3pEFav3ZApMoEBCDV+OuI2CNg==
X-Received: by 2002:a05:6000:208a:b0:42b:53ad:bbfa with SMTP id
 ffacd0b85a97d-42fa3b0651fmr4138323f8f.53.1765391823206; 
 Wed, 10 Dec 2025 10:37:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a7044csm477702f8f.15.2025.12.10.10.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:37:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.0 0/7] hw/arm/omap: Remove omap_badwidth_* functions
Date: Wed, 10 Dec 2025 18:36:53 +0000
Message-ID: <20251210183700.3446237-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The omap_badwidth_read* and omap_badwidth_write* functions are
used by various OMAP devices when the guest makes an access
to registers with an invalid width. They do two things:
 - log a GUEST_ERROR for the access
 - call cpu_physical_memory_read() or cpu_physical_memory_write()
   with the offset they are passed in

The first of these produces an unhelpful log message because the
function name that is printed is that of the omap_badwidth_*
function, not that of the read or write function of the device that
called it; this means you can't tell what device is involved.

The second is wrong because the offset is an offset into the device
but we use it as an absolute physical address, so we will access
whatever is at low memory.  That happens to be the boot ROM, so we
will ignore a write and return random garbage on a read.  This bug
has been present since 2011, when we did the conversions to the
MemoryRegion APIs, which involved changing all devices from working
with absolute physical addresses to working with offsets within their
MemoryRegions.  We must have missed updating these functions.

At this point it is unclear what the original intention was in feeding
these bad accesses back into the memory system.  Rather than trying to
make them do that again, this series replaces them with open-coded
calls to qemu_log_mask() and RAZ/WI behaviour, and then removes
the implementations.

The benefit of this is that we remove a callsite of
cpu_physical_memory_read/write that was doing something badly
wrong anyway.

thanks
-- PMM

Peter Maydell (7):
  hw/sd/omap_mmc: Remove omap_badwidth_* calls
  hw/i2c/omap_i2c: Remove omap_badwidth_* calls
  hw/gpio/omap_gpio: Remove omap_badwidth_* calls
  hw/dma/omap_dma: Remove omap_badwidth_* calls
  hw/arm/omap1: Remove omap_badwidth_read* calls
  hw/arm/omap1: Remove omap_badwidth_write* calls
  hw/arm/omap1: Remove omap_badwidth_* implementations

 include/hw/arm/omap.h |  10 ---
 hw/arm/omap1.c        | 203 +++++++++++++++++++++---------------------
 hw/dma/omap_dma.c     |   7 +-
 hw/gpio/omap_gpio.c   |   7 +-
 hw/i2c/omap_i2c.c     |   7 +-
 hw/sd/omap_mmc.c      |   7 +-
 6 files changed, 122 insertions(+), 119 deletions(-)

-- 
2.43.0


