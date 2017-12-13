Received: by 10.223.159.74 with SMTP id f10csp5534765wrg;
        Wed, 13 Dec 2017 12:50:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBou1sAQoVq46UBMx0JOHH8JMGIqlFtILWimbv0Bd8pNah0pi644FTZupefFFIt8iqxGc4Xt5
X-Received: by 10.37.177.143 with SMTP id h15mr2749888ybj.190.1513198246236;
        Wed, 13 Dec 2017 12:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513198246; cv=none;
        d=google.com; s=arc-20160816;
        b=JG5FdQQmsjVFRyckP28/2afjMPqOaoZQbJzhMnbL4OxbvKbPKmTu99T/YjuUq6f8zo
         tcVZMDm78RP0HjTifROoHdFX9uIH4O7Vxm7QOy+bDlUDQ/904rARLpjo1KPv8OA8Z8q3
         NbS4sjW4H4hR5HloIpfRZNDvKL2VZqrd5zwl8I0BPqkmkb2PzHwZL5jJUvJ6kqYtEVEI
         bkK64MfrJsuY+FaNp4/fzSzpyZFj+FWiI6Z10JfR/MCQCfGWIkF48b52gtT7XNqiRxzE
         Ngmiu6k8BI4TidDfA7xDfgd1vr4yLYJvPuCInhu1FwrwtHAbDMoLZiYBFhKIaY7OvXjN
         fqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=D3NM544FSfEQ2ZrOY542ydX9a/ev+wyKDl1y7x2lz8g=;
        b=IbuPDOtYW7CHJQ3KMRi5VN2Fa504Azr2wBAm6DBkiQYMD+73fl228Cn3goIElR05hp
         KTMiUoaAPYEi4C9zztfIb+2M71AkTz4WlpnwDCxQicbEfh7dmG1KVVLaz3jUUUXmXHHp
         j/cujtdaRCnNvMLgJSQgFnw4hYerv5CkYgGKcHmyawtzKdk95X7WNna2XavuhDqPKlAb
         di2+Ynz45aUxJhrCFcsO+xcpfTA+cbTaIjKt222Jt7M3aHe2z1ChenICUhdT05xEObzZ
         kH4gSe5nMFtTLjbMXQXdjUGSy4vU//5Ej3N5vbEPbLOkKtqkAyyrDcsx4cI5GHmtKzai
         QPGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rr6pyZjR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si512094ybf.159.2017.12.13.12.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 12:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rr6pyZjR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePDzJ-00084h-JE
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 15:50:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtq-00048A-OV
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 15:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtp-0006Td-58
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 15:45:06 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDto-0006T6-Vu; Wed, 13 Dec 2017 15:45:05 -0500
Received: by mail-qt0-x242.google.com with SMTP id a16so5413236qtj.3;
	Wed, 13 Dec 2017 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D3NM544FSfEQ2ZrOY542ydX9a/ev+wyKDl1y7x2lz8g=;
	b=rr6pyZjRKAc9CW47ueIDvsUn3btmwPTbsyPCU5NpTpJ3Hhb1M1B7QGPV0mT7QSQ5qL
	TwXW1KDa70SoXGEcMlPxLnWK1bgDna/u7WG30eXEJkB656Qfb1tsY/WE5K5ObDGVTPRW
	5poRL4MAQZiFjVz2PS9FEoDodScZSCK1AiSPK3luzoKFmVNI17gWiBx86iY75/5w/0O2
	vIk7Q+FJG5XA5unP2ib7GsjbCoovZT5LPqPuoyQujotNLr0EhVvEHw0jV64P0uxfREfQ
	rOsE/0V4/6KCWRAujM4qRmIOicif+L79imATb3TUUUsWrbW/NL8vgy+DMTI/IPBBLqqr
	EvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=D3NM544FSfEQ2ZrOY542ydX9a/ev+wyKDl1y7x2lz8g=;
	b=mMPWU3ECadYy11sMZ1sv5PcS29DzP2EQ69nSkohAVFGB+hGVixo5XZWk86+ExqXK5N
	e+s4+CUpz4Ej59japjoOnx7TXtapUpOdxJDZvOPi8/sk0Rshi6te1f/floJGCwdfuvga
	n9P34MdMeMJA2KjDIXNBJAGoVJNUnVFgozwh0imCiRpp2TZAzhXiP4ei4KianCe9u5MZ
	R3spG53f+jW0t60eAOOSHh841YqzBhCi8TctMIwljS/+s2Ajc+0xc3zW16Yxj0qolAbX
	ABOvN28A4ljan4Mcs4scnpjBxsbkv3FwXrhMr4Z8KZNg0oeia6zIuGbyFDXvOG3+3NjU
	d/5g==
X-Gm-Message-State: AKGB3mL9oPDI9y1TCermQsXePcF3KJNLMNjdw3W6hLtge87oLt733dYY
	zU7ZkSDizY1oQwOPF0+7oJw=
X-Received: by 10.200.56.75 with SMTP id r11mr12830543qtb.65.1513197904319;
	Wed, 13 Dec 2017 12:45:04 -0800 (PST)
Received: from x1.local ([138.117.48.211]) by smtp.gmail.com with ESMTPSA id
	n64sm1507938qkd.97.2017.12.13.12.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 12:45:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>
Date: Wed, 13 Dec 2017 17:44:29 -0300
Message-Id: <20171213204436.5379-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213204436.5379-1-f4bug@amsat.org>
References: <20171213204436.5379-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH 04/11] sdbus: add sdbus_create_bus() to replace
 qbus_create_inplace()
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: daWoL3vLyoSz

A "bus-name" property can be use to change the default SDHCI "sd-bus" name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h           |  1 +
 include/hw/sd/sdhci.h        |  3 ++-
 hw/arm/bcm2835_peripherals.c |  2 +-
 hw/sd/core.c                 |  5 +++++
 hw/sd/sdhci.c                | 36 ++++++++++++++++++++----------------
 5 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index f6994e61f2..dc9d697c12 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -51,6 +51,7 @@ struct SDBus {
 };
 
 /* Functions to be used by qdevified callers */
+SDBus *sdbus_create_bus(DeviceState *parent, const char *name);
 int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
 void sdbus_write_data(SDBus *sd, uint8_t value);
 uint8_t sdbus_read_data(SDBus *sd);
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index e6644e6e7d..579e0ea644 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -39,7 +39,8 @@ typedef struct SDHCIState {
     };
 
     /*< public >*/
-    SDBus sdbus;
+    char *bus_name;
+    SDBus *sdbus;
     MemoryRegion iomem;
     MemoryRegion *dma_mr;
     AddressSpace dma_as;
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 7f30f19c4c..60a0eec4d1 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -310,7 +310,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
 
     /* GPIO */
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
-                                   OBJECT(&s->sdhci.sdbus), &error_abort);
+                                   OBJECT(s->sdhci.sdbus), &error_abort);
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
                                    OBJECT(&s->sdhost.sdbus), &error_abort);
     object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index eda595973b..021a8d7258 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -187,3 +187,8 @@ static void sd_bus_register_types(void)
 }
 
 type_init(sd_bus_register_types)
+
+SDBus *sdbus_create_bus(DeviceState *parent, const char *name)
+{
+    return SD_BUS(qbus_create(TYPE_SD_BUS, parent, name));
+}
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 5f8064c59b..40596f6ebe 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -186,8 +186,8 @@ static void sdhci_reset(SDHCIState *s)
     memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
 
     /* Reset other state based on current card insertion/readonly status */
-    sdhci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
-    sdhci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
+    sdhci_set_inserted(dev, sdbus_get_inserted(s->sdbus));
+    sdhci_set_readonly(dev, sdbus_get_readonly(s->sdbus));
 
     s->data_count = 0;
     s->stopped_state = sdhc_not_stopped;
@@ -223,7 +223,7 @@ static void sdhci_send_command(SDHCIState *s)
     request.arg = s->argument;
 
     trace_sdhci_send_command(request.cmd, request.arg);
-    rlen = sdbus_do_command(&s->sdbus, &request, response);
+    rlen = sdbus_do_command(s->sdbus, &request, response);
 
     if (s->cmdreg & SDHC_CMD_RESPONSE) {
         if (rlen == 4) {
@@ -278,7 +278,7 @@ static void sdhci_end_transfer(SDHCIState *s)
         request.cmd = 0x0C;
         request.arg = 0;
         trace_sdhci_end_transfer(request.cmd, request.arg);
-        sdbus_do_command(&s->sdbus, &request, response);
+        sdbus_do_command(s->sdbus, &request, response);
         /* Auto CMD12 response goes to the upper Response register */
         s->rspreg[3] = (response[0] << 24) | (response[1] << 16) |
                 (response[2] << 8) | response[3];
@@ -310,7 +310,7 @@ static void sdhci_read_block_from_card(SDHCIState *s)
     }
 
     for (index = 0; index < (s->blksize & 0x0fff); index++) {
-        s->fifo_buffer[index] = sdbus_read_data(&s->sdbus);
+        s->fifo_buffer[index] = sdbus_read_data(s->sdbus);
     }
 
     /* New data now available for READ through Buffer Port Register */
@@ -402,7 +402,7 @@ static void sdhci_write_block_to_card(SDHCIState *s)
     }
 
     for (index = 0; index < (s->blksize & 0x0fff); index++) {
-        sdbus_write_data(&s->sdbus, s->fifo_buffer[index]);
+        sdbus_write_data(s->sdbus, s->fifo_buffer[index]);
     }
 
     /* Next data can be written through BUFFER DATORT register */
@@ -488,7 +488,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
         while (s->blkcnt) {
             if (s->data_count == 0) {
                 for (n = 0; n < block_size; n++) {
-                    s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
+                    s->fifo_buffer[n] = sdbus_read_data(s->sdbus);
                 }
             }
             begin = s->data_count;
@@ -529,7 +529,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
             s->sdmasysad += s->data_count - begin;
             if (s->data_count == block_size) {
                 for (n = 0; n < block_size; n++) {
-                    sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
+                    sdbus_write_data(s->sdbus, s->fifo_buffer[n]);
                 }
                 s->data_count = 0;
                 if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
@@ -560,7 +560,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
 
     if (s->trnmod & SDHC_TRNS_READ) {
         for (n = 0; n < datacnt; n++) {
-            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
+            s->fifo_buffer[n] = sdbus_read_data(s->sdbus);
         }
         dma_memory_write(&address_space_memory, s->sdmasysad, s->fifo_buffer,
                          datacnt);
@@ -568,7 +568,7 @@ static void sdhci_sdma_transfer_single_block(SDHCIState *s)
         dma_memory_read(&address_space_memory, s->sdmasysad, s->fifo_buffer,
                         datacnt);
         for (n = 0; n < datacnt; n++) {
-            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
+            sdbus_write_data(s->sdbus, s->fifo_buffer[n]);
         }
     }
     s->blkcnt--;
@@ -659,7 +659,7 @@ static void sdhci_do_adma(SDHCIState *s)
                 while (length) {
                     if (s->data_count == 0) {
                         for (n = 0; n < block_size; n++) {
-                            s->fifo_buffer[n] = sdbus_read_data(&s->sdbus);
+                            s->fifo_buffer[n] = sdbus_read_data(s->sdbus);
                         }
                     }
                     begin = s->data_count;
@@ -700,7 +700,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     dscr.addr += s->data_count - begin;
                     if (s->data_count == block_size) {
                         for (n = 0; n < block_size; n++) {
-                            sdbus_write_data(&s->sdbus, s->fifo_buffer[n]);
+                            sdbus_write_data(s->sdbus, s->fifo_buffer[n]);
                         }
                         s->data_count = 0;
                         if (s->trnmod & SDHC_TRNS_BLK_CNT_EN) {
@@ -807,7 +807,7 @@ static void sdhci_data_transfer(void *opaque)
             break;
         }
     } else {
-        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(&s->sdbus)) {
+        if ((s->trnmod & SDHC_TRNS_READ) && sdbus_data_ready(s->sdbus)) {
             s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
                     SDHC_DAT_LINE_ACTIVE;
             sdhci_read_block_from_card(s);
@@ -1156,15 +1156,14 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
 
 static void sdhci_initfn(SDHCIState *s)
 {
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
-
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
 }
 
 static void sdhci_realizefn(SDHCIState *s, Error **errp)
 {
+    const char *name = s->bus_name ? s->bus_name : "sd-bus";
+
     sdhci_init_capareg(s, errp);
 
     s->buf_maxsz = sdhci_get_fifolen(s);
@@ -1177,10 +1176,14 @@ static void sdhci_realizefn(SDHCIState *s, Error **errp)
     address_space_init(&s->dma_as,
                        s->dma_mr ? s->dma_mr : get_system_memory(),
                        "sdhci-dma");
+
+    s->sdbus = sdbus_create_bus(DEVICE(s), name);
 }
 
 static void sdhci_unrealizefn(SDHCIState *s, Error **errp)
 {
+    g_free(s->sdbus);
+
     if (s->dma_mr) {
         address_space_destroy(&s->dma_as);
         object_unparent(OBJECT(&s->dma_mr));
@@ -1269,6 +1272,7 @@ static Property sdhci_properties[] = {
                      false),
     DEFINE_PROP_LINK("dma-memory", SDHCIState, dma_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_STRING("sd-bus-name", SDHCIState, bus_name),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.15.1

