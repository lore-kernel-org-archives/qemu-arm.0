Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4992326lfp;
        Mon, 17 Feb 2020 03:51:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzdmqPOqYEkhnAlsOkcnt4POOExmTw1R4v+qi99ukmZ+Nu17KR397WDX/WZcJX7Gia1Xe48
X-Received: by 2002:a05:620a:1589:: with SMTP id d9mr13376831qkk.411.1581940310413;
        Mon, 17 Feb 2020 03:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940310; cv=none;
        d=google.com; s=arc-20160816;
        b=ohFDgLTTyV/QsBbK2FyUI3Ri1aq6mVCW9ij0cfFaYvW3+K4DUoB4Z1+9uvuj1A+2Kl
         3766GBO7X8M9KlzVMzExNohqHD9d9fSQ/i5+BG+RxYtBM542/W3GFkK1FtY7aFKqQKrt
         PXEZRZRgGkWJ3LU78RkSJmvuGQa8k6R3TmzkmHmJekIIE8TfNKfvtrb/zmDK3bUzb6yU
         E1zJEvjvZTBUCIoxB9xfBrqBBmrU/drQ8zfFEAwGQ7aFhnmsQO3bjIah9/IncKXT8XJp
         ru0cE1GZjAAWHBTwsIy7n+2mrG8yeUPItt9bqgKTMoIVwba/y7uvzThq9sAUDx72v1jf
         CPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ASmcAKpB+GmaZAnYISHB6Asx8SF2xpTt96K1WQnZHhw=;
        b=lI/PdEClMsK5GtJKJJQyXdYqMWNKKKPeWCZeXpBfkhOPM8n8SWMQbGrJujFA6xzL5h
         wIDlcGOpmno4gyq7AK4b9uI5H0ysD6m5wzaANer/2XeZyoq+F0A1HW54rQhd1bSFjtOh
         CO+sUp8Ano1FhdsF+8rvRJ2aE2VzLehUej3WaYVXJGGVLDkZagx6xQ1OGMfUwPbvoM9U
         MnHv0PPSpu6k0bXX5ywWbZ54RowDjJ2z9qFSczmlqvKgmdsEcXtavcVuQyfHgxC0m2lc
         adzK8V3BYSereVaSXdAbDWKyTM8pNS/OLzmXWOdj513CQ59HklURpYTIfk4GdizFPsu5
         iZnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jKTQCUnf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q29si122166qtj.232.2020.02.17.03.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:51:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jKTQCUnf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3ewH-0006dj-QW
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqa-0006qb-GQ
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqZ-0002ZI-9C
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:56 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqY-0002XL-5U; Mon, 17 Feb 2020 06:45:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w15so19340216wru.4;
 Mon, 17 Feb 2020 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ASmcAKpB+GmaZAnYISHB6Asx8SF2xpTt96K1WQnZHhw=;
 b=jKTQCUnfO4l8OkOwCIXXw2lG2dEZTgiy7leI1vivIB6zZoppA8LK6yJPasxCkmVTvC
 NUWB9x2IrU5Y4OLnp4jnbRkTGsbyok8zNNzr2fdYb13r+hdEgF+lUfSGBOC1IQ+w0UXI
 desjbqMNuPT4uFWdqnR2SoZTLZ3XpgG2dkLSfIqFPckBvaxbO/gXnVSNujCGn4F0g9GL
 bIqJkq2imeOPvAtIlyFLVsM92kmWgg9/qMbH5ksXuQ+ocnEZ9wGzmmC3mhFeD4T70nrs
 K3vb38IeKgN5lCCXYlW8EbLxbO9wMUnx78/NzK0N2HA9Y8JzZAMm98TFaDfZI264Wx5t
 CE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ASmcAKpB+GmaZAnYISHB6Asx8SF2xpTt96K1WQnZHhw=;
 b=ccpHVkGsOEW9bUoys2Na3tJxYjr8I8hlHCy/rE9wMbyZtjxjLuMk85la2dor9e7jHA
 VYHNdEnH5yUbBlDK9P1dpZYjEDS9gsCFO+nC+IGZEp3P/TC2I9li/b/OvwOh5D1h+QD0
 Xr8hDp/J7/WrVUxLuF3y8bJcAsf5B2XBWDlYo/uzIBnoTDNcSBRAMNcPW/2wuxTNSX7W
 7EUU42Jkry5zVG/koi3RQfWxmab2mv5MXuPdLf3RtCliO1vdAmwTgEu6gARy3leTA+La
 HT0qhmdYt6bHSN7JSFDBFl9YwNnbrDpPP4mN5pTMvun7u5bJc7xerfwQTjorW1FgPP5X
 5eIQ==
X-Gm-Message-State: APjAAAXvr/MWt78+5eCkX5/99szCnnF6UHvbaIfiaXcE6B6q6QmO4n2N
 x0TVz7O/8Pmzsoc10yje1mw4CeU5AEM=
X-Received: by 2002:adf:f012:: with SMTP id j18mr21769544wro.314.1581939951573; 
 Mon, 17 Feb 2020 03:45:51 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/13] hw/arm/raspi: Add the Raspberry Pi B+ machine
Date: Mon, 17 Feb 2020 12:45:32 +0100
Message-Id: <20200217114533.17779-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFo0kU/yQiXl

  $ qemu-system-arm -M raspi1b -serial stdio \
      -kernel raspberrypi/firmware/boot/kernel.img \
      -dtb raspberrypi/firmware/boot/bcm2708-rpi-b.dtb \
      -append 'printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0'
  [    0.000000] Booting Linux on physical CPU 0x0
  [    0.000000] Linux version 4.19.69+ (dom@buildbot) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1261 Tue Sep 3 20:21:01 BST 2019
  [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
  [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
  [    0.000000] OF: fdt: Machine model: Raspberry Pi Model B
  [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
  [    0.000000] bootconsole [pl11] enabled
  [    0.000000] Memory policy: Data cache writeback
  [    0.000000] cma: Reserved 8 MiB at 0x1b800000
  [    0.000000] random: get_random_bytes called from start_kernel+0x8c/0x49c with crng_init=0
  [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 113680
  [    0.000000] Kernel command line: printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0
  Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
  Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
  Memory: 434380K/458752K available (6971K kernel code, 635K rwdata, 2080K rodata, 464K init, 797K bss, 16180K reserved, 8192K cma-reserved)
  ...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 3537a329ac..2d9f4e3085 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -324,6 +324,15 @@ static void raspi_machine_class_common_init(MachineClass *mc,
     mc->default_ram_size = board_ram_size(board_rev);
 };
 
+static void raspi1b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0x900032;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
 static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -348,6 +357,10 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo raspi_machine_types[] = {
     {
+        .name           = MACHINE_TYPE_NAME("raspi1b"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi1b_machine_class_init,
+    }, {
         .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
-- 
2.21.1

