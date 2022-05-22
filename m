Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3072836lfh;
        Sun, 22 May 2022 11:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS5aLwPkbDf+++axo6WlvyxlfznqlQIcYBMWXrp8NiU0yjStHdmR8Q5z4p6yTkYvgVoi7S
X-Received: by 2002:a05:620a:40ce:b0:6a0:3f91:7162 with SMTP id g14-20020a05620a40ce00b006a03f917162mr11977747qko.34.1653245422451;
        Sun, 22 May 2022 11:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653245422; cv=none;
        d=google.com; s=arc-20160816;
        b=w4CKWjcueONzp4FRaY0tFzAALgmF05X4iJyCjW7ZWjg+tHxVDlKpgn7ioZVU9LYD2v
         N97H7n5sLfK9/kwVWzqa8v27uyfxVyiqZcjmjKWbq0BuwsldcggmV/bHpiAAcPJImA3u
         9hCfggGaQW3H+cxbeAZDLD0C9QUBJMTCNS0pDpSyYyJ717AuYvdLhiCsQRY2XAZ55cyA
         sT7xKMFeICEi6XI5XdEcm/to3PneAou6XcP+c5u8gFpdV/Os799AoWh8ndUZ05Gu0vQM
         5APJMW6aHi9wGk0stvZImaXDm5SmQYzdsCaht7wr6IdIz2pNxz1X5shTUQ6c7dLUYdpo
         F38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ODXTrlSiemej5p65V4ZLSxop6J+RhlnTW+zYLVGJJJc=;
        b=TRz+UcS7jWzhnFwDdaPY4AnWKw4YpwhYCmJPJB4gnUWwSKZNEhraVOu/p0WkHW9eok
         1zvxVZ+WcSHGRsstRb4PCliAazboDE14OWfGPor9ASsbtd5+UmkNozLd20sot2H3H+9W
         kmF8xVwmzaHXBzwUrlf9P7+oNTZMOYIFSnsWnNPcuCHTY+F+ba/0ptQJ46iagHx1DQNz
         9fSDmj0e7gmUtpmBil9wLOra6nKToku7wiMiVzkpsoD2J3X9yDTh0xuVLX4gF8yLmP70
         yfoAFPbZVjG1wAG0/jHVm6lUJQGTlTND3vJ6gT2PiKlUxF/PLeCm1w/ueZrcegUWzhja
         osbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=neSoNYtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm8-20020ad45ec8000000b0046207d465a8si1893039qvb.352.2022.05.22.11.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=neSoNYtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:58138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqej-00035d-Uy
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBo-0007yw-8r; Sun, 22 May 2022 14:20:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBl-0003pG-Em; Sun, 22 May 2022 14:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ODXTrlSiemej5p65V4ZLSxop6J+RhlnTW+zYLVGJJJc=; b=neSoNYtBZi+caLcztVpVQjipS8
 VI58bSkBFiz0cxK+HR1LHgrrDbAAHdSG1iZu+Msvt2dISJjar56r2TI+IkuVPmiWRXtc83hUF8aGv
 7etJzkuGdvpFchXhQlxBgjR07KlTVPO9njMI3mbpUIt2nTbRdvUxPmKslHh1HaaCzQR6/tpuOJFCV
 U1TLM0wsTGSEEWI6V4YZlkZOGhBMzBAO1IoXReKOgxn7tJJ4hA5UOSd9mSRw4SP0W8bGz4S3nIjct
 RzZYBRRINpip03BnoD+71MnP/Upa0CYhXGGfxqlnw5s9FCeyu+JFfMudrFhFg6Avwmmr3Enlfo7WM
 CudZMOz4EpRuFrl4IMYGCl61oyr1rOLgJ79txUmC4xwXiNat/mcldbc/UcdGyggDDApXRLV1ZvcPK
 OdjPpsb3+rWCbbgdz/BGPuC5PZS/aIN0/9aMFHwE586/0Ft8I0a/P1FSkawjXOvBbux4/HhFQJe/k
 tIVUv4cFTFFAiOLGPq0XJCTsYAjWsfVVac7TwgMQTpEIfV+h/dBTmPZ8L+RNq2sl6HUnnr0Zd44Sa
 CPtMQF/ckSkkn1kr4K2hg6yb7UtoscyRoR7DddY+ZYtrJhhhdX3Ba6WmbsqqG/UG8GFbQ76IPdfnX
 nxoHOZr0W/pCEi4TaOdggawbYQzLIZkqMTBNe7mXs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAK-0007pH-ME; Sun, 22 May 2022 19:18:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:14 +0100
Message-Id: <20220522181836.864-29-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 28/50] pckbd: move mapping of I8042_MMIO registers to MIPS
 magnum machine
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8r9GM64RNVCK

Now that the register memory region is exposed as a SysBus memory region, move
the mapping of the I8042_MMIO registers from i8042_mm_init() to the MIPS magnum
machine (which is its only user).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         |  5 +----
 hw/mips/jazz.c           | 11 +++++++----
 include/hw/input/i8042.h |  3 +--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index a7f1439994..eb77ad193e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -707,8 +707,7 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 }
 
 MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                            MemoryRegion *region, ram_addr_t size,
-                            hwaddr mask)
+                            ram_addr_t size, hwaddr mask)
 {
     DeviceState *dev;
     KBDState *s;
@@ -724,8 +723,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
-    region = &I8042_MMIO(dev)->region;
-
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6598d7dddd..80c9206230 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -136,11 +136,11 @@ static void mips_jazz_init(MachineState *machine,
     MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
     MemoryRegion *isa_io = g_new(MemoryRegion, 1);
     MemoryRegion *rtc = g_new(MemoryRegion, 1);
-    MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
     MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
     NICInfo *nd;
     DeviceState *dev, *rc4030;
+    MMIOKBDState *i8042;
     SysBusDevice *sysbus;
     ISABus *isa_bus;
     ISADevice *pit;
@@ -361,9 +361,12 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x80004000, rtc);
 
     /* Keyboard (i8042) */
-    i8042_mm_init(qdev_get_gpio_in(rc4030, 6), qdev_get_gpio_in(rc4030, 7),
-                  i8042, 0x1000, 0x1);
-    memory_region_add_subregion(address_space, 0x80005000, i8042);
+    i8042 = i8042_mm_init(qdev_get_gpio_in(rc4030, 6),
+                          qdev_get_gpio_in(rc4030, 7),
+                          0x1000, 0x1);
+    memory_region_add_subregion(address_space, 0x80005000,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(i8042),
+                                                       0));
 
     /* Serial ports */
     serial_mm_init(address_space, 0x80006000, 0,
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index d05cd33e3c..9d1f8af964 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -65,8 +65,7 @@ struct MMIOKBDState {
 
 
 MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                            MemoryRegion *region, ram_addr_t size,
-                            hwaddr mask);
+                            ram_addr_t size, hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
-- 
2.20.1

