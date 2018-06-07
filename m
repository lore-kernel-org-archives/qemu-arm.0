Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2404883wrq;
        Thu, 7 Jun 2018 11:07:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLpHXWcLeujzsJYibgg0vretZN4QzEPwSiPw0bTt0a7T0fnx1RcETlpHoe4U/gTrjK5zCKh
X-Received: by 2002:a0c:874c:: with SMTP id 12-v6mr2649367qvi.223.1528394858519;
        Thu, 07 Jun 2018 11:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528394858; cv=none;
        d=google.com; s=arc-20160816;
        b=x8vgG0at3cnBmjBYmsHbqaiKON9DkYcIzqM+g6HIVPFQWeqJGdca93xaLoZrZluTYV
         tGlbABd5tL79B8K3fc6FTl9bsw3CbOklQfUKQjpbk0RMj8BikkzwPdZQJ4d2vELQGkuV
         La5OC/BQVEReMu3E+iT0oCyclt8TVv7cEYqIlsAe0PlbL9/OzgWJ1f6/4c4ZstroaDD+
         zeKqEe+7qAJrckq3A05Q9kBpAox+0Mp6IdY9gX9KHHETq9ynj+Enqfwx3IFAsxRynNLx
         pS7tyRia2qrsRslnAYuYg1WqaQQ/Oi3POsH2qSUuR1Ni/Gi8ZbkAvVwcUpGi2C+V0tsP
         g/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=lOoU4srSGzyMHA96IQ33DE0CD0Wkm6Mltfv0GmandPk=;
        b=YbPQY0otmWBYgyclqsaSjDMqTt5RCc8q/zukbqc0XlJSJMWAuhG+wI0UcSZOvlEKX7
         sN+Paeetm9YplssIno91J7/mDQTqvE04uS1e1EZif+xX+Ut+5jVG2jpcXQJwezmEkYd9
         16QPl7KMphMRftnTHDg/Orknk+KGoeB1HXx2goYbUNDNqLHGAmi0XZk7bG3dV7lpCNVY
         pH+jI6FCbxKocZmfH2/Yk3fiWqauo0QFr1qgvrwIrBcVJ6x2TFx767Y1B7O/xpEbYHA8
         pLTWu6n69tHAktiGgPcwIjUpJy0bhAQwcwJNl3Ah5bpt2P54Cv9WWy0Mv3Ghu0izEg+c
         esTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FIyyMatu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j95-v6si1369660qte.335.2018.06.07.11.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FIyyMatu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzJx-0002Oe-Tt
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:07:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJc-0002Hh-48
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJa-0004ZK-OS
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:07:16 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJX-0004XT-Ed; Thu, 07 Jun 2018 14:07:11 -0400
Received: by mail-qt0-x241.google.com with SMTP id o9-v6so10787092qtp.3;
	Thu, 07 Jun 2018 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lOoU4srSGzyMHA96IQ33DE0CD0Wkm6Mltfv0GmandPk=;
	b=FIyyMatuf2qOGsxs5zqZ3ottgobg6rBBYMJRBONnJB+hp5BAcIJdXNSsNw3n9EZ4YA
	Vn64+Sv+0oZR7ccyQrqquJ6yBln6BkowYG1iV95HmZAX9tegzlTvMCxCFixwjag5Mp6j
	yg+BZjGJ2YnIgVQ3C89bRKD9ocAI9mPHhRuhXvLn1P7HWkaALYvKHGiO6OVHapII8Xb9
	2ZJKVcGdeZBycV3l4pELyItEmJDz97+DZFFjQt2MmtXAXxP42QboHAD0bbs1DPeu3GyR
	X8Ay3oJWMXpT9b2PDz07n/ptjGK2wSHfarWd6+Gbq+N9MepgK1Oc5FLauxiBc9ttkgvz
	qTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=lOoU4srSGzyMHA96IQ33DE0CD0Wkm6Mltfv0GmandPk=;
	b=iFna54Rl5MF9KhBuSnvNFwi/goiSALLjSif1nZuTIJtJGobsgRQnIFPdH10DB4r0q1
	qHDP/hkKO7hxS5An/VFNSeYefKJHkAu4Ee5B4huKnn0AIoSYH85QMgbWTMMOLX82sBPs
	9jbD6eQYREl/VeaqjChI0+6py8PO4POIZdMvsCjW+pGwndzUucfvYQnCpyc6zyR+Myt7
	WcgFlhb62x5bsgsA8oxLtfS+8vC4I441PT1LHuE0GIDY4Z7uXnL+0ulQjWUnMbgsLBx8
	EruSesGqSBhANbx2oMAM9d5doJeaAWhUDr8zPNSjBUa+HdMANHMvKe3z6EhCbaK85Ox5
	+Kcg==
X-Gm-Message-State: APt69E1dVgvadwXoCrCt3GNpW6OTdlQYz0MVGzfS3G/uemY8p/KbWu3W
	XNvWGSuk66dYw6TyGyFiIN4=
X-Received: by 2002:ac8:3347:: with SMTP id
	u7-v6mr2783799qta.195.1528394830916; 
	Thu, 07 Jun 2018 11:07:10 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:07:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Date: Thu,  7 Jun 2018 15:06:41 -0300
Message-Id: <20180607180641.874-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [RFC PATCH v2 7/7] hw/sd/ssi-sd: Force cards connected
 in SPI mode to use Spec v1.10
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hTBpEBRy1lFK

Due to physical restriction in SPI mode the maximum transfer
speed is limited. All the extensions added after Spec v3 are
simply not supported in SPI mode:

  7.1 Introduction

    The SPI mode consists of a secondary communication protocol
    that is offered by Flash-based SD Memory Cards. This mode is
    a subset of the SD Memory Card protocol, designed to communicate
    with a SPI channel, commonly found in Motorola's (and lately a
    few other vendors') microcontrollers. The interface is selected
    during the first reset command after power up (CMD0) and cannot
    be changed once the part is powered on.
    The SPI standard defines the physical link only, and not the
    complete data transfer protocol. The SD Memory Card SPI
    implementation uses a subset of the SD Memory Card protocol and
    command set. The advantage of the SPI mode is the capability of
    using an off-the-shelf host, hence reducing the design-in effort
    to minimum. The disadvantage is the loss of performance of the
    SPI mode versus SD mode (e.g. Single data line and hardware CS
    signal per card).
    The commands and functions in SD mode defined after the Version
    2.00 are not supported in SPI mode. The card may respond to the
    commands and functions even if the card is in SPI mode but host
    should not use them in SPI mode.

Some firmwares use the CMD8 in SPI mode to poll which Spec version
the SD card supports.

  7.2.1 Mode Selection and Initialization (SPI mode)

    The SD Card is powered up in the SD mode. It will enter SPI mode
    if the CS signal is asserted (negative) during the reception of
    the reset command (CMD0). If the card recognizes that the SD mode
    is required it will not respond to the command and remain in the
    SD mode. If SPI mode is required, the card will switch to SPI and
    respond with the SPI mode R1 response.
    The only way to return to the SD mode is by entering the power
    cycle. In SPI mode, the SD Card protocol state machine in SD mode
    is not observed. All the SD Card commands supported in SPI mode
    are always available. [...]
    If the card indicates an illegal command, the card is legacy and
    does not support CMD8. If the card supports CMD8 and can operate
    on the supplied voltage, the response echoes back the supply
    voltage and the check pattern that were set in the command
    argument.

The NuttX RTOS use it too:

    /* Check for SDHC Version 2.x.  CMD 8 is reserved on SD version 1.0 and
     * MMC.
     */
    finfo("Send CMD8\n");
    result = mmcsd_sendcmd(slot, &g_cmd8, 0x1aa);
    if (result == MMCSD_SPIR1_IDLESTATE)
      ...
    /* Check for SDC version 1.x or MMC */
    else
      ...

See https://bitbucket.org/nuttx/nuttx/src/nuttx-7.25/drivers/mmcsd/mmcsd_spi.c?mmcsd_spi.c-1645#mmcsd_spi.c-1645

The Stellaris LM3S6965EVB board is the only model using SD cards in
SPI mode. The firmware found to work with the board expect the card
to be following Spec v1 to work, and is the only one stressing the
v1 code path of the SD card model.
Thus it seems clever to restrict SPI connected cards to use Spec v1.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
This change would be better in the lm3s6965evb_init() rathar than here in
ssi-sd.

As suggested by Peter and Thomas here:
http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg06616.html

We can use -device sd-card,spec_version=1 to avoid this change.

$ arm-softmmu/qemu-system-arm \
      -M lm3s6965evb -nodefaults \
      -serial stdio \
      -kernel sd_card.bin \
      -drive file=sdcard.img,id=mycard,if=none \
      -device sd-card,spi=true,spec_version=1,drive=mycard 
qemu-system-arm: warning: nic stellaris_enet.0 has no peer
SD Card Example Program
Type 'help' for help.

/> ls
Open
listing

----A 2012/04/25 17:44        12  README.TXT

   1 File(s),        12 bytes total
   0 Dir(s),      61182K bytes free

/> cat README.TXT
Hello World

/> 

Even if there are still 2 cards...

(qemu) info qtree
bus: main-system-bus
  type System
  dev: pl022, id ""
    gpio-out "sysbus-irq" 1
    mmio 0000000040008000/0000000000001000
    bus: ssi
      type SSI
      dev: ssd0323, id ""
        gpio-in "" 1
        gpio-in "ssi-gpio-cs" 1
      dev: ssi-sd, id ""
        gpio-in "ssi-gpio-cs" 1
        bus: sd-bus
          type sd-bus
          dev: sd-card, id ""
            spec_version = 1 (0x1)
            drive = "mycard"
            spi = true
          dev: sd-card, id ""
            spec_version = 2 (0x2)
            drive = ""
            spi = true

 hw/sd/ssi-sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 96542ecd62..82470a12e2 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -252,6 +252,8 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
     carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    object_property_set_uint(OBJECT(carddev),
+                             SD_PHY_SPECv1_10_VERS, "spec_version", &err);
     if (dinfo) {
         qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
     }
-- 
2.17.1

