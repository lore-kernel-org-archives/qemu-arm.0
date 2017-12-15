Received: by 10.223.159.74 with SMTP id f10csp7096470wrg;
        Thu, 14 Dec 2017 19:25:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBovk8RNE/91yx/edPJiIBW3iNLpLKqULsO/46P+TUuTTvZeCTIcas8rQ9DE6DUcRrdrYqbeo
X-Received: by 10.13.202.134 with SMTP id m128mr3386592ywd.88.1513308316594;
        Thu, 14 Dec 2017 19:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308316; cv=none;
        d=google.com; s=arc-20160816;
        b=f3Afghdd9qb9NybO1Gz8GR8xqDsOBlY40uosWTx5uY7zqArm0IfKf+oKPrnovkRFSR
         ZOByeRNtkLVdK3INhQ9LTktMY+viDLjoblakMWIONz6qzLFl5hXpTFzBESDs8YdpzdII
         N+JlaAeyfXQR0X4XplJYG5CCuamTQroQi0vfy76SAUopwXK/Ft8d6qreBKVvVtzrlCFJ
         ggU4ALhCDGcCfvX6KdF1bn2Ox2ihD9+qhuhNYzBpfItxXW5cecj4lICxyqqYlUPLBsZY
         NWyuETaeXt/1Qzl6FZZxC57PeXgOiQJYzHjbckciZ3CZmGuCDR3wL+udAuPMRo/NY4Vn
         fXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=/R85GTF+aUI8qr1fMhEhzd4JzhCvAIZFCuYhirRW5EI=;
        b=G6/iz2uIbQOuyghVQIToypSCctjHkCl0R2oifsrHLjoQ623S47bHudVQZA46cd3uu3
         Z2+XnXov0G5REiHw7b6zytT2t88ReuyLQ/tQEhsco5kVSz8FkeXvERsoFMkRIi2s1LlK
         yQIOW6mEitMWZpm1JzIhfQ4tDtFTJspGSUK2D7zRwPnWH4uYz2L8Q78oNFX/6i/GUSlt
         WFrkBFhSGHTrGkOjP+t8xSaCvWm7bmosz+JMkB9piPuTnW3qsJjEVqI7+6QTqWFm46I8
         yvb83REENrgRQAtP9okiCSI3RVkZ7vaB2AEs8aPTOJEA6n+ZBnH/EG8mOj+Mb11H1oYe
         ls4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lzxP7W9Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e70si1080536ybc.171.2017.12.14.19.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lzxP7W9Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgcd-0004f8-U3
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:25:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUY-00063O-0C
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUW-0001Nj-H2
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:53 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUW-0001NK-BK; Thu, 14 Dec 2017 22:16:52 -0500
Received: by mail-qk0-x244.google.com with SMTP id h19so8843955qkj.11;
	Thu, 14 Dec 2017 19:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/R85GTF+aUI8qr1fMhEhzd4JzhCvAIZFCuYhirRW5EI=;
	b=lzxP7W9QW6X0xT+cB/i7UCDzOWG/FiZ2wcdWBK7O2Ycj6vf1z0bcRdFyeYm0Wv+bO7
	e/B4TBsa/Tr/SPmSVkMiK2vb8OTsA6+z4X3AGOf3NF+EvILcKOJ/mMOeLW6ERwZR+ONb
	pJ+U4ooWyD17xpvCCUNXQ15GJy/KkE+4ymLngsVJ7C7CzLaFp42sMNJy5McNeorkCnSX
	u491kFUAaG6MTNJDtCsLwJipwUcFV7ucufygRFGo2UwK0a5i3R3Vv4eisX1qppqL4YSq
	zgYNl38Ll8xXFTv78Bt+Zp8l8vNw3YKaaQAQhMmpJB7s4yGevsrQaf/0yJRRQ6HM372V
	PdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/R85GTF+aUI8qr1fMhEhzd4JzhCvAIZFCuYhirRW5EI=;
	b=CVgIX8YrUOYxR/DQ6a1IIfDtdsa7U9nfQhqDetjaOK+pmk5F38kacwlFAcWCB5dTvL
	btoErnvYDcaHZOHQByZt1hg8wPCZD+xnwPMcOrHou2TlCNhAgV6n5yGPAdD2sCkFefkk
	Y2mAdzv3INoeCxKe07wGwNdKfoSHgqfUeUgDup6MWFWA9Eeqm9FjQbBxmP9VTEnBy4fB
	ousTHT6epTI5r6nnu860nqAouflQt83B+29GKzoY2RPuPdtxwmSDAQWBqRyqI9IDDrtv
	+vGlpKZBcmmCqZ8VQ97QhQvJhwrs4OCCHH0Nv90FBNmoq0c7nbQjUou4Q2VzY64dYOl0
	V+8A==
X-Gm-Message-State: AKGB3mIc0su2mykflimxbLZz72EB55OWVhdbRJwwRM20+HhBoi17TS48
	xPRQ5o46wbtRSrU0a2m1l9A=
X-Received: by 10.55.18.92 with SMTP id c89mr19148883qkh.297.1513307811872;
	Thu, 14 Dec 2017 19:16:51 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:38 -0300
Message-Id: <20171215031547.31006-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v2 11/20] sdhci: add a "dma-memory" property
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nVaopQQa55UY

Add a dma property allowing machine creation to provide the address-space
sdhci dma operates on.

[based on a patch from Alistair Francis <alistair.francis@xilinx.com>
 from qemu/xilinx tag xilinx-v2016.1]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 36 +++++++++++++++++++++++-------------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 5391430c59..715048d77b 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -41,6 +41,8 @@ typedef struct SDHCIState {
     /*< public >*/
     SDBus sdbus;
     MemoryRegion iomem;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 866be44db5..0f3ff657cf 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -505,7 +505,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                     s->blkcnt--;
                 }
             }
-            dma_memory_write(&address_space_memory, s->sdmasysad,
+            dma_memory_write(&s->dma_as, s->sdmasysad,
                              &s->fifo_buffer[begin], s->data_count - begin);
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
@@ -527,7 +527,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                 s->data_count = block_size;
                 boundary_count -= block_size - begin;
             }
-            dma_memory_read(&address_space_memory, s->sdmasysad,
+            dma_memory_read(&s->dma_as, s->sdmasysad,
                             &s->fifo_buffer[begin], s->data_count - begin);
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
@@ -565,11 +565,9 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
         for (n = 0; n < datacnt; n++) {
             s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
         }
-        dma_memory_write(&address_space_memory, s->sdmasysad, s->fifo_buffer,
-                         datacnt);
+        dma_memory_write(&s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt);
     } else {
-        dma_memory_read(&address_space_memory, s->sdmasysad, s->fifo_buffer,
-                        datacnt);
+        dma_memory_read(&s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt);
         for (n = 0; n < datacnt; n++) {
             sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
         }
@@ -593,7 +591,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
     hwaddr entry_addr = (hwaddr)s->admasysaddr;
     switch (SDHC_DMA_TYPE(s->hostctl)) {
     case SDHC_CTRL_ADMA2_32:
-        dma_memory_read(&address_space_memory, entry_addr, (uint8_t *)&adma2,
+        dma_memory_read(&s->dma_as, entry_addr, (uint8_t *)&adma2,
                         sizeof(adma2));
         adma2 = le64_to_cpu(adma2);
         /* The spec does not specify endianness of descriptor table.
@@ -605,7 +603,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         dscr->incr = 8;
         break;
     case SDHC_CTRL_ADMA1_32:
-        dma_memory_read(&address_space_memory, entry_addr, (uint8_t *)&adma1,
+        dma_memory_read(&s->dma_as, entry_addr, (uint8_t *)&adma1,
                         sizeof(adma1));
         adma1 = le32_to_cpu(adma1);
         dscr->addr = (hwaddr)(adma1 & 0xFFFFF000);
@@ -618,12 +616,12 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         }
         break;
     case SDHC_CTRL_ADMA2_64:
-        dma_memory_read(&address_space_memory, entry_addr,
+        dma_memory_read(&s->dma_as, entry_addr,
                         (uint8_t *)(&dscr->attr), 1);
-        dma_memory_read(&address_space_memory, entry_addr + 2,
+        dma_memory_read(&s->dma_as, entry_addr + 2,
                         (uint8_t *)(&dscr->length), 2);
         dscr->length = le16_to_cpu(dscr->length);
-        dma_memory_read(&address_space_memory, entry_addr + 4,
+        dma_memory_read(&s->dma_as, entry_addr + 4,
                         (uint8_t *)(&dscr->addr), 8);
         dscr->attr = le64_to_cpu(dscr->attr);
         dscr->attr &= 0xfffffff8;
@@ -682,7 +680,7 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    dma_memory_write(&address_space_memory, dscr.addr,
+                    dma_memory_write(&s->dma_as, dscr.addr,
                                      &s->fifo_buffer[begin],
                                      s->data_count - begin);
                     dscr.addr += s->data_count - begin;
@@ -706,7 +704,7 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    dma_memory_read(&address_space_memory, dscr.addr,
+                    dma_memory_read(&s->dma_as, dscr.addr,
                                     &s->fifo_buffer[begin],
                                     s->data_count - begin);
                     dscr.addr += s->data_count - begin;
@@ -1183,10 +1181,20 @@ static void sdhci_realizefn(SDHCIState *s, Error **errp)
 
     memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
                           SDHC_REGISTERS_MAP_SIZE);
+
+    /* use system_memory() if property "dma-memory" not set */
+    address_space_init(&s->dma_as,
+                       s->dma_mr ? s->dma_mr : get_system_memory(),
+                       "sdhci-dma");
 }
 
 static void sdhci_unrealizefn(SDHCIState *s, Error **errp)
 {
+    if (s->dma_mr) {
+        address_space_destroy(&s->dma_as);
+        object_unparent(OBJECT(&s->dma_mr));
+    }
+
     g_free(s->fifo_buffer);
 }
 
@@ -1269,6 +1277,8 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
+    DEFINE_PROP_LINK("dma-memory", SDHCIState, dma_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.15.1

