Received: by 10.28.173.206 with SMTP id w197csp2623090wme;
        Mon, 8 Jan 2018 07:56:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBoui6WBd8moVNk29h59YObCYGYrTurce5dXrhC8z0NVnR8GJ5AGJXyOddmu/aBgg3Fu+WVuS
X-Received: by 10.37.104.141 with SMTP id d135mr11433274ybc.248.1515426986828;
        Mon, 08 Jan 2018 07:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426986; cv=none;
        d=google.com; s=arc-20160816;
        b=063OV0ILSuw5tblKuKg2wUZYlEd2ZCgqc0xs/Gh/G9n0Znb3+K6tTEM4E4DRs4EKhc
         hdPi4WOv3j+RdZJo6pVLoAepg79R3MGLbTDDR7Li29Nu1TYkBB6EntKDEeS7q85BOHGD
         JB1Hq1X5xp4ccfu9XnKUlJ7J5ExJ+AGA20j0U5Jy14u1srr7lpqP+KfDSd+mKQpol35v
         ZBPa/8oe6ZKuVaDvF2gQY45zbqTq++B6In9VgJTogDCItxVjoONQV3CEx2IMKF4me5MQ
         N1bjxf6GjmujFwZypY/kZqnDTubQ9OrmclyJXWGMNtmVJYXancE/+Ik9yNDxc0ej8AAd
         p6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vmz558vZLThbBBsMoSp5uuDRv6mHMSWsey97AcQ4xAI=;
        b=efp2UuKih3uMJr42+zQZ9s91/ViHpHK+fX/rMtbmy9Rd0ITdhDkRYAUwb3BxTIMTNV
         keS827xkotW204O15HUw7XqLoo6bR9Emng0jc2m+DruXcSxrZ1X1KIkbNjBM1uE2+2oe
         ohCJrNYRXZ+J7Js1j2sFV1QwJ0e8QnSkj2lRMGLPk9cs332ERNTy8D7xM4KWFdMuqdnG
         0NCtE43y+FYolB8x1OC/UAN3YzXYXOIWmUGDMG94GjoQJEvBJDSEDRaqKji2KfQ4KWSR
         4X1gztQ6Roc8X7SVr19IgIOv/bA+qL4q+8k41trhLqIQUiwFxf0ACtt2ZSNwFjaGejs/
         wBTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UIKHpHk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8si2534838ybj.448.2018.01.08.07.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UIKHpHk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZmk-00048Z-7Z
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:56:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbZ-0002MQ-El
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbY-0007wC-Ew
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:53 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38579)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbV-0007u8-RW; Mon, 08 Jan 2018 10:44:49 -0500
Received: by mail-qt0-x244.google.com with SMTP id d4so14073573qtj.5;
	Mon, 08 Jan 2018 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vmz558vZLThbBBsMoSp5uuDRv6mHMSWsey97AcQ4xAI=;
	b=UIKHpHk5dYwKF+NuABBPeb8oOZ/jbkp8jMN9OuWfFEs4wp+54amo1JoUQP8nCWIDAV
	2TYLdAAorKrXZViopppg4fanmMQXUaFgJg1wNsWLUFJakzfJ1cv/rrvJkwbQ/Qvu1DD6
	aDcc2gt/maP+HXlIfASctC3jgYov+pfxX8ZN59u1kEbAfH2HGOIxulfMyAYI8lI6OGtO
	n2BCo95s0sNrOD4wB3d9NT6W3PD6zXgGKGkjqu6dvYIQ+xNRiFcFfEicJNrU3h4ClbGL
	RCVKJjQqSoCW/eIQQ7srWaEklfFo9d8x7aq0udHCGVsGGTDz3tmO96WOAtVlQvCIG859
	kFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vmz558vZLThbBBsMoSp5uuDRv6mHMSWsey97AcQ4xAI=;
	b=N4iV3+yby3CHyvux8Ai8dYoT+uV0aXzALJuoJGqx6ll8F1yuYhCBSPjnrQPWktQ3CC
	sJO7Pq+OKJnKnVOw1zBzhYE1DTYiVlDksHcQ5y6tFGVMCOrGtr1gfyJxaN/6G8E+dKL2
	PWQwaxlA0SNwYnOaaZyj8+lVbdobWDlSc3SjTWplI5/bQDKZMVeMWZii5AViaomGsGWq
	75qmlKv5l7gz/7zoPf17yHEGIvGdzqGdtiTXuiz7C55/aXdPwIDvULQ5CX2hzE4lsYqK
	zZBeeTT8eHFFvKxIXBGILc0LsrjknPcMN8OtINDSbZXYhnNriaBUVt/+Eas3jkqSWlzs
	qRAg==
X-Gm-Message-State: AKwxytebCmYOOPqpNCvbu2YKbP2OiB4X4GEjVaTQ59JOr6iJGc0mJGIi
	9rEPp+IsTZOPCmsYoWXcjp8=
X-Received: by 10.200.55.227 with SMTP id e32mr15468972qtc.227.1515426289298; 
	Mon, 08 Jan 2018 07:44:49 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:49 -0300
Message-Id: <20180108154303.6522-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v5 17/31] sdhci: rename the hostctl1 register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3h6IG6pfLEkv

As per the Spec v3.00

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  2 +-
 hw/sd/sdhci.c         | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index c0098fc920..ecd192ee47 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -65,7 +65,7 @@ typedef struct SDHCIState {
     /* Buffer Data Port Register - virtual access point to R and W buffers */
     uint32_t prnsts;       /* Present State Register */
     /* 0x28 */
-    uint8_t  hostctl;      /* Host Control Register */
+    uint8_t  hostctl1;     /* Host Control Register */
     uint8_t  pwrcon;       /* Power control Register */
     uint8_t  blkgap;       /* Block Gap Control Register */
     uint8_t  wakcon;       /* WakeUp Control Register */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3f5e0760f6..d7e247cb48 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -600,7 +600,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
     uint32_t adma1 = 0;
     uint64_t adma2 = 0;
     hwaddr entry_addr = (hwaddr)s->admasysaddr;
-    switch (SDHC_DMA_TYPE(s->hostctl)) {
+    switch (SDHC_DMA_TYPE(s->hostctl1)) {
     case SDHC_CTRL_ADMA2_32:
         dma_memory_read(&s->dma_as, entry_addr, (uint8_t *)&adma2,
                         sizeof(adma2));
@@ -789,7 +789,7 @@ static void sdhci_data_transfer(void *opaque)
     SDHCIState *s = (SDHCIState *)opaque;
 
     if (s->trnmod & SDHC_TRNS_DMA) {
-        switch (SDHC_DMA_TYPE(s->hostctl)) {
+        switch (SDHC_DMA_TYPE(s->hostctl1)) {
         case SDHC_CTRL_SDMA:
             if ((s->blkcnt == 1) || !(s->trnmod & SDHC_TRNS_MULTI)) {
                 sdhci_sdma_transfer_single_block(s);
@@ -898,7 +898,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = s->prnsts;
         break;
     case SDHC_HOSTCTL:
-        ret = s->hostctl | (s->pwrcon << 8) | (s->blkgap << 16) |
+        ret = s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
               (s->wakcon << 24);
         break;
     case SDHC_CLKCON:
@@ -1016,7 +1016,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         MASKED_WRITE(s->sdmasysad, mask, value);
         /* Writing to last byte of sdmasysad might trigger transfer */
         if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
-                s->blksize && SDHC_DMA_TYPE(s->hostctl) == SDHC_CTRL_SDMA) {
+                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
             if (s->trnmod & SDHC_TRNS_MULTI) {
                 sdhci_sdma_transfer_multi_blocks(s);
             } else {
@@ -1068,14 +1068,14 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!(mask & 0xFF0000)) {
             sdhci_blkgap_write(s, value >> 16);
         }
-        MASKED_WRITE(s->hostctl, mask, value);
+        MASKED_WRITE(s->hostctl1, mask, value);
         MASKED_WRITE(s->pwrcon, mask >> 8, value >> 8);
         MASKED_WRITE(s->wakcon, mask >> 24, value >> 24);
         if (!(s->prnsts & SDHC_CARD_PRESENT) || ((s->pwrcon >> 1) & 0x7) < 5 ||
                 !(s->capareg & (1 << (31 - ((s->pwrcon >> 1) & 0x7))))) {
             s->pwrcon &= ~SDHC_POWER_ON;
         }
-        qemu_set_irq(s->access_led, s->hostctl & 1);
+        qemu_set_irq(s->access_led, s->hostctl1 & 1);
         break;
     case SDHC_CLKCON:
         if (!(mask & 0xFF000000)) {
@@ -1284,7 +1284,7 @@ const VMStateDescription sdhci_vmstate = {
         VMSTATE_UINT16(cmdreg, SDHCIState),
         VMSTATE_UINT32_ARRAY(rspreg, SDHCIState, 4),
         VMSTATE_UINT32(prnsts, SDHCIState),
-        VMSTATE_UINT8(hostctl, SDHCIState),
+        VMSTATE_UINT8(hostctl1, SDHCIState),
         VMSTATE_UINT8(pwrcon, SDHCIState),
         VMSTATE_UINT8(blkgap, SDHCIState),
         VMSTATE_UINT8(wakcon, SDHCIState),
-- 
2.15.1

