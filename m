Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5204943lfc;
        Mon, 8 Jun 2020 09:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB/qh+VxHtsOzqgna3I6hNYKcgTApj/ypE40Begfnpmoc5GF8hWFgIxwGhveKAtEwJlF3P
X-Received: by 2002:a25:810f:: with SMTP id o15mr36895064ybk.35.1591632266923;
        Mon, 08 Jun 2020 09:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632266; cv=none;
        d=google.com; s=arc-20160816;
        b=YJCJxmpGhwtc7oyMEIsJ/Eswhhd0GBriTemQVN5/nF3DQwF4T8XlzHljloWJk2UqzB
         bTXXfRjbO/LHtI5f6vcEEY1lnwHWJMaV6y8t8Fm85wJPsMXTI0zp/TsUmuPbwlg2sBzf
         UUe9NTUesr04NsNCXTQOWtkCcPQOkIbjfW0uqSmuNlULPBF6vKtMSxlMhorpEO7jk3vE
         OM+LlDUkgAbGrf0IOXhPKLDZJVKbEubgctrqBcKJelNzKzSbp3dZtFVDLRACYFakRzJC
         Ia91j5XharEu3faS3t91Jh4aKk+oCuJ2vB9Xrg+9Qr+ocJo9FeI3pKVnVtopYPIZIgg/
         RUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
        b=JlzdD4z4NMEtGAJfcHTMFD/ruRrZUu1I3W4OuZiU60TSvWV8yODROS8G5UEadJk4q6
         BQEUVhMHTBtLxyOSosg4lyTcdgNg3rkctnrtTLFEfsK7R73bNzMyWizX78xHqYNb7ozf
         uz/pWfX7oY2m6rgBjLma3JJy3DiKOrN+nel4XwSXZInfWufaPetTAvmUG7pL89PIOCpx
         ZllKpcD33+g9K9pzxKx/akHZ5ufsniGdrUrVHQT7Hjtc9qPHjJVXryc1GDVw1nIMiUEk
         iR2Uj4wzysCENELiir4aPFcFJGQD62izsmG1MzFnq2VW1Q9YXTWOjoj/Sq4tCJsPjPlr
         YgKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fnGHtiUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e82si32805ybb.429.2020.06.08.09.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fnGHtiUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKG9-0007p0-Rx
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCw-0005zi-Rv
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30272
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCm-0007QL-IV
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
 b=fnGHtiUWE2LM4j38X40NYaHkSd4Jf6d0YJt17pODpTNcs2r8oZmi7eFxmzl86AxNIswF6V
 v027L7Ek//TnOW3KpmTpShykoOaOn44I6CFV7kbwHyWXgfH69a0i4Uj+0IajYrpgJ0e1Yi
 zC1xnXWoXFjZ4m9iTIBQT/OgcC4uGC4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-U1JaqzieOxOlfPMZRY4mlw-1; Mon, 08 Jun 2020 12:00:49 -0400
X-MC-Unique: U1JaqzieOxOlfPMZRY4mlw-1
Received: by mail-wm1-f70.google.com with SMTP id b63so114236wme.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7PHbUODraiyYDfGeXtIeVn3Evhw0HgQCb8r2diF6v0=;
 b=VmljkJ5KbOVc0Zu7hK0Wokq8nfyza4gFHcxgqJ6jWdHppp73Drm/7S026v/5xFiIKs
 +fHA+0hvDJvITuHtmzWgN9I2Q06Dk4d57Y6Lh1yy5YrGPEnyOx5uFhgQLqlL1B0a0Qsu
 2i8bmHSBgaM3YC2XFsZqrd+dnNuofNBlBxptC7rQMY1KTQob00cJy07i4Knr2EXRmAwX
 dTElgMKqI77XwG3uPh46UG+0bSfgo2Cj+rmafU1o/1lwRR5sUZ7xtIMHTdW6FCzylUYh
 ouoOvyMJ32eyKpHB8MLXOTcB314VIg6UMMbcbvH6bvg80JKEJTMrCvA2FBBEY9ywlWp4
 YQ4w==
X-Gm-Message-State: AOAM533CDgqmt2M7df55g4jWpiJQ7bnR5A1N3vmWj81dIz4AQ4KA3nLH
 Lnl3rHlNNQ3F4AZKkKVUZaUfqlkGSIPHwV1mCWRIby6G1FD0XA34dA2dtDcRfwUJWeC35CX6hBQ
 DVYYjtX8NTsXE
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr24291802wrw.91.1591632048433; 
 Mon, 08 Jun 2020 09:00:48 -0700 (PDT)
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr24291746wrw.91.1591632048080; 
 Mon, 08 Jun 2020 09:00:48 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o15sm175107wrv.48.2020.06.08.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
Date: Mon,  8 Jun 2020 18:00:09 +0200
Message-Id: <20200608160044.15531-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_TEMPERROR=0.01 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S7Z6P2NBxDSY

Based on today's IRC chat, this is a trivial RFC series
to anotate pre-qdev/QOM devices so developers using them
without knowing they are not QOM'ified yet can realize
it and convert them if they have time.

qdev/QOM devices are introspectable, so easier to test
or even fuzz.

Philippe Mathieu-Daudé (35):
  qom/object: Update documentation
  hw/core/qdev: Add qdev_warn_deprecated_function_used() helper
  hw/arm/omap: Emit warning when old code is used
  hw/arm/pxa2xx: Emit warning when old code is used
  hw/arm/nseries: Emit warning when old code is used
  hw/timer/arm_timer: Emit warning when old code is used
  hw/char/parallel: Emit warning when old code is used
  hw/display/blizzard: Emit warning when old code is used
  hw/display/ramfb: Emit warning when old code is used
  hw/display/tc6393xb: Emit warning when old code is used
  hw/display/vga-isa-mm: Emit warning when old code is used
  hw/dma/etraxfs_dma: Emit warning when old code is used
  hw/dma/soc_dma: Emit warning when old code is used
  hw/i386/pc: Emit warning when old code is used
  hw/i386/xen/xen-hvm: Emit warning when old code is used
  hw/input/lasips2: Emit warning when old code is used
  hw/input/pckbd: Emit warning when old code is used
  hw/input/ps2: Emit warning when old code is used
  hw/input/tsc2005: Emit warning when old code is used
  hw/intc/i8259: Emit warning when old code is used
  hw/lm32/lm32_hwsetup: Emit warning when old code is used
  hw/m68k/mcf520x: Emit warning when old code is used
  hw/misc/applesmc: Emit warning when old code is used
  hw/misc/cbus: Emit warning when old code is used
  hw/nvram/eeprom93xx: Emit warning when old code is used
  hw/openrisc/cputimer: Emit warning when old code is used
  hw/ppc/ppc: Emit warning when old code is used
  hw/ppc/ppc4xx: Emit warning when old code is used
  hw/ppc/ppc_booke: Emit warning when old code is used
  hw/ppc/virtex_ml507: Emit warning when old code is used
  hw/sh4: Emit warning when old code is used
  hw/riscv: Emit warning when old code is used
  hw/timer/slavio_timer: Emit warning when old code is used
  hw/usb/hcd-musb: Emit warning when old code is used
  hw/xtensa/xtfpga: Emit warning when old code is used

 configure                    |  8 ++++++++
 hw/lm32/lm32_hwsetup.h       |  3 +++
 include/hw/qdev-deprecated.h | 26 ++++++++++++++++++++++++++
 include/qom/object.h         |  6 +++---
 hw/arm/nseries.c             |  2 ++
 hw/arm/omap1.c               |  6 ++++++
 hw/arm/pxa2xx.c              |  3 +++
 hw/char/omap_uart.c          |  5 +++++
 hw/char/parallel.c           |  3 +++
 hw/char/sh_serial.c          |  3 +++
 hw/core/qdev.c               |  8 ++++++++
 hw/display/blizzard.c        |  3 +++
 hw/display/pxa2xx_lcd.c      |  3 +++
 hw/display/ramfb.c           |  3 +++
 hw/display/tc6393xb.c        |  3 +++
 hw/display/vga-isa-mm.c      |  5 +++++
 hw/display/vga.c             |  3 +++
 hw/dma/etraxfs_dma.c         |  4 +++-
 hw/dma/soc_dma.c             |  3 +++
 hw/i386/pc.c                 |  3 +++
 hw/i386/xen/xen-hvm.c        |  4 +++-
 hw/input/lasips2.c           |  4 +++-
 hw/input/pckbd.c             |  4 +++-
 hw/input/ps2.c               |  6 +++++-
 hw/input/pxa2xx_keypad.c     |  3 +++
 hw/input/tsc2005.c           |  3 +++
 hw/intc/i8259.c              |  3 +++
 hw/intc/sh_intc.c            |  3 +++
 hw/m68k/mcf5206.c            |  5 +++++
 hw/m68k/mcf5208.c            |  3 +++
 hw/misc/applesmc.c           |  3 +++
 hw/misc/cbus.c               |  3 +++
 hw/misc/omap_gpmc.c          |  3 +++
 hw/misc/omap_l4.c            |  3 +++
 hw/misc/omap_sdrc.c          |  3 +++
 hw/nvram/eeprom93xx.c        |  3 +++
 hw/openrisc/cputimer.c       |  3 +++
 hw/ppc/ppc.c                 |  3 +++
 hw/ppc/ppc405_boards.c       |  5 +++++
 hw/ppc/ppc405_uc.c           | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c         |  7 +++++++
 hw/ppc/ppc_booke.c           |  4 +++-
 hw/ppc/virtex_ml507.c        |  4 +++-
 hw/riscv/riscv_htif.c        |  4 ++++
 hw/riscv/sifive_uart.c       |  4 ++++
 hw/sd/omap_mmc.c             |  5 +++++
 hw/sh4/r2d.c                 |  3 +++
 hw/sh4/sh7750.c              |  4 ++++
 hw/ssi/omap_spi.c            |  3 +++
 hw/timer/arm_timer.c         |  3 +++
 hw/timer/omap_synctimer.c    |  4 ++++
 hw/timer/sh_timer.c          |  5 +++++
 hw/timer/slavio_timer.c      |  3 +++
 hw/usb/hcd-musb.c            |  3 +++
 hw/xtensa/xtfpga.c           |  3 +++
 55 files changed, 240 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/qdev-deprecated.h

-- 
2.21.3

