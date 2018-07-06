Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2881825wrq;
        Fri, 6 Jul 2018 09:22:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdUV7J9pd1vu635s7TySioa3Uc35QbsW4tF7rDe6qFigfksMVe/do4yOFZTiVVF6eAofrMk
X-Received: by 2002:a0c:de13:: with SMTP id t19-v6mr9521516qvk.101.1530894149227;
        Fri, 06 Jul 2018 09:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530894149; cv=none;
        d=google.com; s=arc-20160816;
        b=jhluKbAW6iunktJE4PpvqlR6ao2AoH8mPHPc+Oow+QAspWPuamZWKovNMtyRf/FkO/
         vOnZNuay0kSvq47Oh19T1W2Q7Mf8wi/9WuIESGYnCdmY6ssxaQ1oKMpYSOn55msbT1L+
         QfNwqd/kytQWOelrq4OfyTlpzUbgpz/vpB4p535BDZWx8+ixLe8LAdWjJ5PnY7wRcJUW
         FaJ5xP9nij1/XsZ0Q9Dw6If0tfOrcVGI5pUxz1ATWYrlx4UYol9MkpzNEHpwrVgp1CGE
         xpSGV4AXTRv0sxE+hjhzByYpQLC7uYIuRbYmhja1qH31NJ1EzvCXwJVTlntIl2Prp+fk
         t4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=T55/G6QSkk3MOH+7GvT7f+1CG5bIIE7Dhrrl7KzXDl4=;
        b=SimR4gySMXVwrbsCFLwl/DVfxnBZKToMgKXIfDpfFCKuUTQet3KrdJIUj/8St/kQSK
         M1lPkIqnl6kwq78wogbX63P2lrsZ/G7hfa/XZFdU1KjMupNf/8ByEAP/kh0CccHihWcC
         F9/oS0ccGJvCBj0y14gJbZHGzZVn4BN1K4SnldBSWyWeMAmsrzsdA6y+lwVr2iCQ4KR2
         2haqLaT7zJSKa5LTim0+cJ0AJevCuSBkO5BV0SAvMMx02lryZCqrot4S8Nw2c4Hij9mt
         +vXnIujrLB+mp0VpLKMjmsNZ6VWT3BTbaCXb/xJKcblNFFYo3o723326G/gARr8XBgON
         HPKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LKxLtzp2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y1-v6si612851qvc.17.2018.07.06.09.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jul 2018 09:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LKxLtzp2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fbTV6-0006mB-Jj
	for alex.bennee@linaro.org; Fri, 06 Jul 2018 12:22:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbTUl-0006lz-4y
	for qemu-devel@nongnu.org; Fri, 06 Jul 2018 12:22:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbTUj-00073m-VX
	for qemu-devel@nongnu.org; Fri, 06 Jul 2018 12:22:07 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:42198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbTUj-00073S-Qx; Fri, 06 Jul 2018 12:22:05 -0400
Received: by mail-qk0-x242.google.com with SMTP id u62-v6so6591739qkf.9;
	Fri, 06 Jul 2018 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T55/G6QSkk3MOH+7GvT7f+1CG5bIIE7Dhrrl7KzXDl4=;
	b=LKxLtzp2aZBxMIS+L1rw0ADSGhi+TZ07YphOOV+snpYXbgyUJEP+gxh6Uyb1Z09wKW
	xL/R4TDdMoy7EtaLCZKzlYvL0xmxZIKNvFbfUB2Gsh866MgZ4LGLsbpUC9EHu56vGZ0e
	0fSDXtQVlMGljReTL12lsvcQ5CoruH1r7EugeKbL+aUfFACwAUbtFHpV5KZaFcboWljn
	/4Mgt5kC3bRYqXOB1WGKXL+iyVDghJsjaD7f5cuRFQYOqhQ3mSoGhohPosjlZtaCaXuM
	v83HdTuQF+IEckTj4zH4Q2gINk4+FJom4G52Ak5hv/dycYtJhsaSoYfkAX3ZHxXbYhrz
	9pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=T55/G6QSkk3MOH+7GvT7f+1CG5bIIE7Dhrrl7KzXDl4=;
	b=gD5BPLBMM0BQsPTaNVmhC5nBa4C0tsnxg4qdMcoZWFajD1UJU4FrrzfpPTwoGzALr3
	gXkVShmhSL+voDc0Cxpw/tIxruMibRHkNNKlTLmU7T1nn/+jQo36TejH8ncmCF0b6bWw
	upazPcifAyC1nCAan0MXs2Z/iuG/iqmQ2yICYax95oktkuU+Ao2pCtyMiZ5Rn9DiM4ZH
	ksXmukVAAFvlTK0a5fpa7ow4213vvyKcttcN+bimtUSS055rhRTjl8ASkBdirn7kJBaV
	XnzSWpd+5voddJMuDGjFijh1t8d0BkhvBRlsU/fJ5Ov+8r/4uGZ9Gxqw8PS2rHUW0qrP
	Y6Wg==
X-Gm-Message-State: APt69E1giiwNITnZyCkNKmP2wSBTj8c7ovw0MhLmfnL7RlXuRQedHoWj
	G08borrXibm4HPgCegzWaMA=
X-Received: by 2002:a37:82c7:: with SMTP id
	e190-v6mr9186220qkd.313.1530894125299; 
	Fri, 06 Jul 2018 09:22:05 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	p63-v6sm5875372qkb.46.2018.07.06.09.22.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 09:22:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Fri,  6 Jul 2018 13:21:55 -0300
Message-Id: <20180706162155.8432-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180706162155.8432-1-f4bug@amsat.org>
References: <20180706162155.8432-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH for-3.0 1/1] hw/sd/omap_mmc: Split
 'pseudo-reset' from 'power-on-reset'
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RZVfx/Pqrb+V

DeviceClass::reset models a "cold power-on" reset which can
also be use to powercycle a device; but there is no "hot reset"
(a.k.a. soft-reset) method available.

The OMAP MMC Power-Up Control bit is not designed to powercycle
a card, but to disable it without powering it off (pseudo-reset):

  Multimedia Card (MMC/SD/SDIO) Interface [SPRU765A]

  MMC_CON[11] Power-Up Control (POW)
  This bit must be set to 1 before any valid transaction to either
  MMC/SD or SPI memory cards.
  When 1, the card is considered powered-up and the controller core
  is enabled.
  When 0, the card is considered powered-down (system dependent),
  and the controller core logic is in pseudo-reset state. This is,
  the MMC_STAT flags and the FIFO pointers are reset, any access to
  MMC_DATA[DATA] has no effect, a write into the MMC.CMD register
  is ignored, and a setting of MMC_SPI[STR] to 1 is ignored.

By spliting the 'pseudo-reset' code out of the 'power-on' reset
function, this patch fixes a latent bug in omap_mmc_write(MMC_CON)i
recently exposed by ecd219f7abb.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
---
 hw/sd/omap_mmc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 671264b650..d0c98ca021 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -1,6 +1,8 @@
 /*
  * OMAP on-chip MMC/SD host emulation.
  *
+ * Datasheet: TI Multimedia Card (MMC/SD/SDIO) Interface (SPRU765A)
+ *
  * Copyright (C) 2006-2007 Andrzej Zaborowski  <balrog@zabor.org>
  *
  * This program is free software; you can redistribute it and/or
@@ -278,6 +280,12 @@ static void omap_mmc_update(void *opaque)
     omap_mmc_interrupts_update(s);
 }
 
+static void omap_mmc_pseudo_reset(struct omap_mmc_s *host)
+{
+    host->status = 0;
+    host->fifo_len = 0;
+}
+
 void omap_mmc_reset(struct omap_mmc_s *host)
 {
     host->last_cmd = 0;
@@ -286,11 +294,9 @@ void omap_mmc_reset(struct omap_mmc_s *host)
     host->dw = 0;
     host->mode = 0;
     host->enable = 0;
-    host->status = 0;
     host->mask = 0;
     host->cto = 0;
     host->dto = 0;
-    host->fifo_len = 0;
     host->blen = 0;
     host->blen_counter = 0;
     host->nblk = 0;
@@ -305,6 +311,8 @@ void omap_mmc_reset(struct omap_mmc_s *host)
     qemu_set_irq(host->coverswitch, host->cdet_state);
     host->clkdiv = 0;
 
+    omap_mmc_pseudo_reset(host);
+
     /* Since we're still using the legacy SD API the card is not plugged
      * into any bus, and we must reset it manually. When omap_mmc is
      * QOMified this must move into the QOM reset function.
@@ -459,7 +467,7 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         if (s->dw != 0 && s->lines < 4)
             printf("4-bit SD bus enabled\n");
         if (!s->enable)
-            omap_mmc_reset(s);
+            omap_mmc_pseudo_reset(s);
         break;
 
     case 0x10:	/* MMC_STAT */
-- 
2.18.0

