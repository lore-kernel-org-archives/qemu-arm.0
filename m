Received: by 10.28.173.206 with SMTP id w197csp1007468wme;
        Thu, 11 Jan 2018 12:59:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBova0sWCzPuewOBYhUBNtu0QZeLSVP0SVbJKtsgeurS8q2SVLtwFDprwBsLFZDZL0avmMhRh
X-Received: by 10.37.208.66 with SMTP id h63mr14644805ybg.35.1515704389428;
        Thu, 11 Jan 2018 12:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704389; cv=none;
        d=google.com; s=arc-20160816;
        b=yrfqOlp723PMULJzj/64C7ZojT7nkxOvkvwES7CvKFsCLlYuVxuHRBIPcrJlvdgyPT
         Rxac+um1gDD7IwOtWAfKvG4Kyf7H/Yvp4/bnuwgMMs3tSnVcgMBSeZEPd9Fj9iP8geQ4
         jhJaSjMLIyDB43Qo5rJnklZdsLQtKMNLz/cNBxhA7toE1c7bONl14/I5IumZ8hvAK+zP
         ijKLr4CfyIbNZWAOskAuXTvIF00rKcQURJo4yvKiqVTMafFC+PU9GG4qOKT7MsHsVPnc
         gZ+ZbnndGBTADCVd0pj+KokzFm7wS46wLYYn4go+AQI6PG4Rsyb3IjgHiL2cCE2YkCdd
         XRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cspdg5K53UkXYDqrLlVZyWU8yT9NxOvzEYUUx7iyp10=;
        b=pOPMgYKevpOgN77KyvkN+JIZxaqBikYU6zIWttjVx+o3VeWEDmdBvQGE8KlkkZULLT
         bcuYl7b0XbdeezE5F04JGx0XWLRtyysp4nUl0p44rR1oNmAeaxaBVDfaFWz4C+ftFRWG
         U5JItc3a2JJpYD6MASz7+k67mgCx4ORrCy7Oy6WuFgnFn4SErdi/2AshY32A9Ae6p/Nk
         FlyExh250ctJ05C1HnpFB5FZMcn5SJXjL4SA8CbBpZUyT5+bOm+0RrXPNDxxP6VcWhEl
         jp4S1mLkqd4Wj8rQXpFhGwEa8aj1BGM2ohXSQ5ySFuKbVfs9RniMOOw9JMC9v6ZFn042
         1R6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ASQrrQsp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si4029282ybj.398.2018.01.11.12.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 12:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ASQrrQsp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjwy-0007m6-P9
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 15:59:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjun-0005tP-G0
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjul-0002hG-VY
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:33 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjul-0002gg-QT; Thu, 11 Jan 2018 15:57:31 -0500
Received: by mail-qt0-x244.google.com with SMTP id k19so3557760qtj.6;
	Thu, 11 Jan 2018 12:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cspdg5K53UkXYDqrLlVZyWU8yT9NxOvzEYUUx7iyp10=;
	b=ASQrrQspA3xjvnQPmSPov8KqgxNWxG5tg5qbvuBNsj0eZ8/oGol7b2DcwlNHs64kNL
	CJhy1jSlPsf2Kgsn+MfQAxPERNUVeJSoDQxL0n7DXd6XN1wUbc1pteJEPwIiGtHPRQEF
	dVTHkhjTRKzQjXrF5rnYoay2om/Dy90+9ByLENKXsTSascs5AIN6qw2a8t9ngIjhF3vK
	Xu7oux4MhI0oiC1le68E4cIap4gkjbOMjPN2GsCH7UEskdGdksAm+7NaYn/tjo22Mb42
	1imgjKIoe+IFRJUpdLZWAftrUSzvIoNbFrY5IwF6cvDr2kvI8BHZiLPAzVbI/33WZIrO
	13eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cspdg5K53UkXYDqrLlVZyWU8yT9NxOvzEYUUx7iyp10=;
	b=nDVy4B1NYYILM4lpgoDnfN7Y5lW7nWarrKwQPxBOGVkKRPHugW0nJ6eVuGK4WuBmg5
	hqS1neyG0aduW+8ufyVMC/IspQKYWM8eEh6lHPtMdIYySRQz2Z7edsRqZJL9cwhf/kKp
	jEBLqwjIGAPaNsCNQ2MWccCexX/XZ3yN3k6CPyeJkpoQ54NWy6Gc5CBR0Mj6idSAVZ3C
	rqotFqEs92RUIY4VYBqQ8m+ESZOsSjESTzIVsoI7oef8Kt+JEEJSKq7xa+rpL590h02K
	1nrFBop2NisEtWqwMNw2HIvdUiRukOfBNcl7cpkbLtp+wqGUFXqyjNrwUmv4YC6NKMgq
	TChQ==
X-Gm-Message-State: AKwxyteI75MOwL8PQkWrwT2wW1VKOGDbTzq1UmSbZXnpDK/nW1HMIZQv
	NhHPs0VwgBBQ3Vwb6j8lkNk=
X-Received: by 10.200.33.195 with SMTP id 3mr48993qtz.102.1515704251210;
	Thu, 11 Jan 2018 12:57:31 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:14 -0300
Message-Id: <20180111205626.23291-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v6 09/21] sdhci: rename the hostctl1 register
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: civmq7+9vGfJ

As per the Spec v3.00

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 include/hw/sd/sdhci.h |  2 +-
 hw/sd/sdhci.c         | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index f45e911065..890dd1bbac 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -57,7 +57,7 @@ typedef struct SDHCIState {
     uint16_t cmdreg;       /* Command Register */
     uint32_t rspreg[4];    /* Response Registers 0-3 */
     uint32_t prnsts;       /* Present State Register */
-    uint8_t  hostctl;      /* Host Control Register */
+    uint8_t  hostctl1;     /* Host Control Register */
     uint8_t  pwrcon;       /* Power control Register */
     uint8_t  blkgap;       /* Block Gap Control Register */
     uint8_t  wakcon;       /* WakeUp Control Register */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 773eb68fd6..6593f5d8b5 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -595,7 +595,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
     uint32_t adma1 = 0;
     uint64_t adma2 = 0;
     hwaddr entry_addr = (hwaddr)s->admasysaddr;
-    switch (SDHC_DMA_TYPE(s->hostctl)) {
+    switch (SDHC_DMA_TYPE(s->hostctl1)) {
     case SDHC_CTRL_ADMA2_32:
         dma_memory_read(&s->dma_as, entry_addr, (uint8_t *)&adma2,
                         sizeof(adma2));
@@ -784,7 +784,7 @@ static void sdhci_data_transfer(void *opaque)
     SDHCIState *s = (SDHCIState *)opaque;
 
     if (s->trnmod & SDHC_TRNS_DMA) {
-        switch (SDHC_DMA_TYPE(s->hostctl)) {
+        switch (SDHC_DMA_TYPE(s->hostctl1)) {
         case SDHC_CTRL_SDMA:
             if ((s->blkcnt == 1) || !(s->trnmod & SDHC_TRNS_MULTI)) {
                 sdhci_sdma_transfer_single_block(s);
@@ -893,7 +893,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = s->prnsts;
         break;
     case SDHC_HOSTCTL:
-        ret = s->hostctl | (s->pwrcon << 8) | (s->blkgap << 16) |
+        ret = s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
               (s->wakcon << 24);
         break;
     case SDHC_CLKCON:
@@ -1011,7 +1011,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         MASKED_WRITE(s->sdmasysad, mask, value);
         /* Writing to last byte of sdmasysad might trigger transfer */
         if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
-                s->blksize && SDHC_DMA_TYPE(s->hostctl) == SDHC_CTRL_SDMA) {
+                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
             if (s->trnmod & SDHC_TRNS_MULTI) {
                 sdhci_sdma_transfer_multi_blocks(s);
             } else {
@@ -1063,7 +1063,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!(mask & 0xFF0000)) {
             sdhci_blkgap_write(s, value >> 16);
         }
-        MASKED_WRITE(s->hostctl, mask, value);
+        MASKED_WRITE(s->hostctl1, mask, value);
         MASKED_WRITE(s->pwrcon, mask >> 8, value >> 8);
         MASKED_WRITE(s->wakcon, mask >> 24, value >> 24);
         if (!(s->prnsts & SDHC_CARD_PRESENT) || ((s->pwrcon >> 1) & 0x7) < 5 ||
@@ -1277,7 +1277,7 @@ const VMStateDescription sdhci_vmstate = {
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

