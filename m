Received: by 10.223.159.74 with SMTP id f10csp5779424wrg;
        Wed, 13 Dec 2017 18:02:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBotxmo1Stz2PTHE2BnO72AqqC7xu127qka5MxpmW1Nu8GAn6RZvAJanpBd6UFilAMf3bMnUn
X-Received: by 10.37.203.141 with SMTP id b135mr3377829ybg.388.1513216923367;
        Wed, 13 Dec 2017 18:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513216923; cv=none;
        d=google.com; s=arc-20160816;
        b=V9XVeoLasBOfd/M5vwNdVDfCqrOc/USBD+w6v1gaqrBwXboFS6uOgmyv66rEhFScCV
         zd797fs9rx29awrF84l+laDzFXx74OUfKONNoXR+Ne+BCpVCYlWxKwgP2ee3fJJ862Bs
         DiWGwkGnQk3ILvDspz6J2ejqrEZ0rr269QTGDTiE/UfLBDZZcSVgynvdDRDrLLKgC4fY
         lktjIhj0HzvZ2hw4TRS/mNlPpGMzUCTtmbOQSbLqP+qspSBfLaW1kDYb+SOD+xMdN7X5
         2bDfRS69HgVJo0geBjBx06hLUE50iFtLG06J14BmK0X/j3QxaMurxVJcWRmVazKlHQFO
         KhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=adt9Hl5qa5pMgKy+C/LUtVzOFneofvsbAZ378k8MCmo=;
        b=AyrGF9ls04K3CY28nZiSGuHN0s9moBbplX4BduT+NvAhm2pjDYvXuTlU/VKrccgdPx
         X3rhWLeOpp/IVx4j3MOjOEtEjtTlzkqldh5cSNQZ5PMFIOWSdKPZkQyOLkYcfOL4d9MP
         bpTacrrX++Z2burtk52l3w81GZnIMjoGMMbXH41fz1w0FAGRscDgVxHD6fYoF5zIuBCG
         XZ8szhRRjpEbr40VGdlbLZaVThUT8S5FB3xT9Z1cakIe+LGCQ4BbTmGGqf27FdHtgplT
         WYfhk2xw9jzcG2d+VZZqRuU31g/5v7fV+K6A9iM2M/N4Z/k1AgyjI2EFD3YwapB2uLW7
         sUFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CQQg20Hr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4si599090ywl.792.2017.12.13.18.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 18:02:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CQQg20Hr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePIqY-0006af-Mh
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 21:02:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpa-0005yH-Ct
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:01:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpZ-0003cz-Dx
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:01:02 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpW-0003ay-IT; Wed, 13 Dec 2017 21:00:58 -0500
Received: by mail-qk0-x244.google.com with SMTP id i130so4494672qke.4;
	Wed, 13 Dec 2017 18:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=adt9Hl5qa5pMgKy+C/LUtVzOFneofvsbAZ378k8MCmo=;
	b=CQQg20HrlJc+45fAKT+PZ4SYT4u5nAW29Oe0I6eAWwPSTX9Xb4FDLvpmzI6r1anGuB
	OI/9Zhz3ztEJStuHsShe2yaTmTEH86Rfva5PKbVgw2ywIQtuqKd4LJHFmEEv5CVPhIr4
	Jo1fKrENqobRO+xZfgBSB4dttqLwLIBPmMiwWbS15COjqpkNY3S7Vc4QM+GKLQXReEoc
	z2Cd5wBGZ1unhpAsCyYy0MM4qQpjXFj/kiH26DUHYL+kJ+7fpygqR3RFpbqMDYB1E/aL
	Nw7FTXkm2nTpVH4dAYIKAE243mA1SF3miJT3/gKbFiLF7v39clQSXmg9JLffukV2qNdW
	xc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=adt9Hl5qa5pMgKy+C/LUtVzOFneofvsbAZ378k8MCmo=;
	b=Lh/R8FLJ44PzbPwdyJsrD69Be4LIRAFfNGDTMQnikrI56eGwaSdV5s4Qvbi3otAp5a
	Rhke2Dftdhgwm1XhRl1B/JzJ1VSs4NvF5UatPLAYu5uPI5iUwoSJeX6BORAxOuCAAoak
	laSXtdsrGC7No8GvI/4NlUPZWy22RL+CaZcY0To4T4lNmnoW5Y5Ija+s6VMrJcVEq2Di
	hzgjpYmx2XdiqP3+By1JRkLUQsdPVxEfQG3vdhuHGOmd3tuRUs6E0iDT96xpOCFVB8ln
	eMKFZD/HYSzdL6nGqXtWf/EoW4uhPZVtPqtNot0nABWEisssDk0Kduj9cocZy0itfPnW
	npqQ==
X-Gm-Message-State: AKGB3mI3bOYSYIT3w1ih7RLoaPAQYMNYYHtqiYPjOcdBoKdf2YoxlrmP
	1X4SAAoe+S+MO31MX17JNK0=
X-Received: by 10.55.207.7 with SMTP id e7mr13879323qkj.291.1513216857933;
	Wed, 13 Dec 2017 18:00:57 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	n39sm1938120qtn.95.2017.12.13.18.00.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:00:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>
Date: Wed, 13 Dec 2017 23:00:21 -0300
Message-Id: <20171214020025.4004-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214020025.4004-1-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH 4/8] sdhci: fix CAPAB/MAXCURR registers,
 both are 64bit and read-only
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 85NfAFoaXGb4

running qtests:

  $ make check-qtest-arm
    GTESTER check-qtest-arm
  SDHC rd_4b @0x44 not implemented
  SDHC wr_4b @0x40 <- 0x89abcdef not implemented
  SDHC wr_4b @0x44 <- 0x01234567 not implemented

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  4 ++--
 hw/sd/sdhci.c         | 25 ++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index f8e91ce903..d5093fe3fd 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -75,8 +75,8 @@ typedef struct SDHCIState {
     uint16_t acmd12errsts; /* Auto CMD12 error status register */
     uint64_t admasysaddr;  /* ADMA System Address Register */
 
-    uint32_t capareg;      /* Capabilities Register */
-    uint32_t maxcurr;      /* Maximum Current Capabilities Register */
+    uint64_t capareg;      /* Capabilities Register */
+    uint64_t maxcurr;      /* Maximum Current Capabilities Register */
     uint8_t  *fifo_buffer; /* SD host i/o FIFO buffer */
     uint32_t buf_maxsz;
     uint16_t data_count;   /* current element in FIFO buffer */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d6145342fb..4d269c7ac4 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -99,7 +99,7 @@
 
 static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 {
-    if (s->capareg == UINT32_MAX) {
+    if (s->capareg == UINT64_MAX) {
         s->capareg = SDHC_CAPAB_REG_DEFAULT;
     }
 }
@@ -893,10 +893,16 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = s->acmd12errsts;
         break;
     case SDHC_CAPAREG:
-        ret = s->capareg;
+        ret = (uint32_t)s->capareg;
+        break;
+    case SDHC_CAPAREG + 4:
+        ret = (uint32_t)(s->capareg >> 32);
         break;
     case SDHC_MAXCURR:
-        ret = s->maxcurr;
+        ret = (uint32_t)s->maxcurr;
+        break;
+    case SDHC_MAXCURR + 4:
+        ret = (uint32_t)(s->maxcurr >> 32);
         break;
     case SDHC_ADMAERR:
         ret =  s->admaerr;
@@ -1117,6 +1123,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         }
         sdhci_update_irq(s);
         break;
+
+    case SDHC_CAPAREG:
+    case SDHC_CAPAREG + 4:
+    case SDHC_MAXCURR:
+    case SDHC_MAXCURR + 4:
+        qemu_log_mask(LOG_GUEST_ERROR, "SDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08x read-only\n", size, offset, value >> shift);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "SDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08x "
                       "not implemented\n", size, offset, value >> shift);
@@ -1266,8 +1281,8 @@ const VMStateDescription sdhci_vmstate = {
 static Property sdhci_properties[] = {
     DEFINE_PROP_UINT8("sd-spec-version", SDHCIState,
                       capabilities.spec_version, SD_HOST_SPECv2_VERS),
-    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg, UINT32_MAX),
-    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
+    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
+    DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
     DEFINE_PROP_LINK("dma-memory", SDHCIState, dma_mr,
-- 
2.15.1

