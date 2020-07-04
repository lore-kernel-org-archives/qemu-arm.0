Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3422635lfm;
        Sat, 4 Jul 2020 08:39:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo9fgv2TZIOPxJM0mxYVUkfQCbFC3tuMlKQ/y7/ZDcJ1sxxUYExvM6s9EHl7xD6WVTPKVI
X-Received: by 2002:a25:848f:: with SMTP id v15mr69527983ybk.473.1593877172533;
        Sat, 04 Jul 2020 08:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877172; cv=none;
        d=google.com; s=arc-20160816;
        b=Vsz76BmF17yTdl18nJhePeG20+Dol2qECuzKAQ87mM+3j27TYWppqL0ZoK/uhh7o7P
         f8qGqS3VFx5zCMAmFhm5yRsOUz4rCSNyaItQEEK9LrKzPVU/Ua+xL3YfAR5rLlp3KyxV
         gtpwEahrmB6n6KivpAjgy9sOVkoPC08y8Yx/DcMIZBzdJoRsJhLyT92fjpbV+zFkUHfI
         8pVux4xncvpAb0CHImnvCxtc7uJbv8UN87wO61npJxvKwcWcm7DAHW2xn/EornhJM9Lr
         +k7ddFxof2NBJ/EWl7/t5gmFnYo7fwPp27/dIowF3n3qdL5zgfOHrmh0E0QNIk/8Lq8f
         BMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nr0/mEmyL3K5IVI928eiIdMK3sHSZE7ocqWvKvjJWbw=;
        b=NDz02wVCppyqJoJGFG5JS9SnWhJfzhFanYe1YrdSLLwsT9lYq5233cv9EtZBns0Xd4
         g0uxsr2+vWNQYwDGS+Arq5L3LHhbMvxHvOzWAUHr7Gu7szmCd+ypuk1jWeYI0NXQXW6u
         +qY96DgoLH2IzWzzSmhwz5IS1O6D+2/TFOXooCz0JzKh5ALmGfITP06XBjTyI06nJhBN
         dobTetfUudjk/40Bu9GepYrzHiG8j9TbNz5dw/+YrDsrWTX1X4dOnSu4ymwKSXctloKr
         ooPk2qY6quaJRp8EqG/sgVVjX67FOa+IcNX87xsEmZeBlywqDHsv2w5kn1v2do/ctUT3
         1elg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z7FyLF4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si3719580ybb.269.2020.07.04.08.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z7FyLF4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkGJ-0000hk-QO
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkG8-0000cI-0Z
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42971
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkG3-0007Rq-Rx
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nr0/mEmyL3K5IVI928eiIdMK3sHSZE7ocqWvKvjJWbw=;
 b=Z7FyLF4IGbRflmsvRdXBENsQXhdqs3ZgqAYBbE4jUuO6gwtkjoThLTueTLk2rMgMy2lANM
 sVE7t+WSCwIR1swsHtOLQrakhC4wGRMt7x8YFZsVHMvndu26KREqF3PorEIUkbuB0togdm
 iVvklr124wCJfJ3qhOjT9kOTxUwNhf4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-qPCaKtP8NYeFTfWkmqbsng-1; Sat, 04 Jul 2020 11:39:13 -0400
X-MC-Unique: qPCaKtP8NYeFTfWkmqbsng-1
Received: by mail-wm1-f70.google.com with SMTP id z11so39701307wmg.5
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nr0/mEmyL3K5IVI928eiIdMK3sHSZE7ocqWvKvjJWbw=;
 b=cLZD4Syz6X2ba/kHZLe7EENjNqVk4mkaXb2HnF//BPRn/5wIjK9/Q+XEb9Bh/itHFT
 eaja0f1aevtRosWieeUAXr3kQl/sJFAyMuNH/N4uquulyXzTEZnQESHC+JO+msKsQKW4
 5X5/Cg9MFz/9LMCYtJPL6sn7LPbWHa5R1sHiy71I9KzeGUeZve/y9wGUD3uKCq2PrNbZ
 NRc2t8I43v+QtOwvismV4nD+8AxjCYwd2frz0DSaM+ahZY1fG9oZeHQc7aG2k30x9k0v
 QFe8xEanzwnb9vWxPAyzfX/Td8nsac3rccbqgQWeAMt6tB5b4/M6Tb5q5BWbNzAkmQMw
 bCkQ==
X-Gm-Message-State: AOAM531yRVHQ7vvIaCI+yX31Zui0yHl1TQIfQWhqUs+WL+6JBUEVGUYZ
 5nnKBclbRh0LZBSxp7C12y8GdiwbI4Ih1RhdASb7/PM9sUuTLccbpf3FcnpOtrvIBifT6DX42GR
 cxPKhV49BuRvI
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr6714554wrt.67.1593877151763;
 Sat, 04 Jul 2020 08:39:11 -0700 (PDT)
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr6714516wrt.67.1593877151479;
 Sat, 04 Jul 2020 08:39:11 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u8sm16658341wrt.28.2020.07.04.08.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 00/23] hw/qdev: Warn when using pre-qdev/QOM devices
Date: Sat,  4 Jul 2020 17:38:45 +0200
Message-Id: <20200704153908.12118-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tjdgdqvUtT0f

This is a trivial RFC series to anotate pre-qdev/QOM devices
so developers using them without knowing they are not QOM'ified
yet can realize it and convert them if/when they have time.

qdev/QOM devices are introspectable, so easier to test
or even fuzz.

Since RFC v1:
- Addressed bonzini comments, removed invalid patches
- Addressed thuth comment

Philippe Mathieu-Daudé (23):
  qom/object: Update documentation
  hw/core/qdev: Add qdev_warn_deprecated_function_used() helper
  hw/arm/omap: Emit warning when old code is used
  hw/arm/pxa2xx: Emit warning when old code is used
  hw/arm/nseries: Emit warning when old code is used
  hw/char/parallel: Emit warning when old code is used
  hw/display/blizzard: Emit warning when old code is used
  hw/display/ramfb: Emit warning when old code is used
  hw/display/tc6393xb: Emit warning when old code is used
  hw/display/vga-isa-mm: Emit warning when old code is used
  hw/dma/etraxfs_dma: Emit warning when old code is used
  hw/dma/soc_dma: Emit warning when old code is used
  hw/input/lasips2: Emit warning when old code is used
  hw/input/tsc2005: Emit warning when old code is used
  hw/m68k/mcf520x: Emit warning when old code is used
  hw/misc/cbus: Emit warning when old code is used
  hw/nvram/eeprom93xx: Emit warning when old code is used
  hw/openrisc/cputimer: Emit warning when old code is used
  hw/ppc/ppc4xx: Emit warning when old code is used
  hw/sh4: Emit warning when old code is used
  hw/riscv: Emit warning when old code is used
  hw/usb/hcd-musb: Emit warning when old code is used
  hw/xtensa/xtfpga: Emit warning when old code is used

 configure                    |  8 ++++++++
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
 hw/input/lasips2.c           |  4 +++-
 hw/input/pxa2xx_keypad.c     |  3 +++
 hw/input/tsc2005.c           |  3 +++
 hw/intc/sh_intc.c            |  3 +++
 hw/m68k/mcf5206.c            |  5 +++++
 hw/m68k/mcf5208.c            |  3 +++
 hw/misc/cbus.c               |  3 +++
 hw/misc/omap_gpmc.c          |  3 +++
 hw/misc/omap_l4.c            |  3 +++
 hw/misc/omap_sdrc.c          |  3 +++
 hw/nvram/eeprom93xx.c        |  3 +++
 hw/openrisc/cputimer.c       |  3 +++
 hw/ppc/ppc405_boards.c       |  5 +++++
 hw/ppc/ppc405_uc.c           | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c         |  7 +++++++
 hw/riscv/riscv_htif.c        |  4 ++++
 hw/riscv/sifive_uart.c       |  4 ++++
 hw/sd/omap_mmc.c             |  5 +++++
 hw/sh4/r2d.c                 |  3 +++
 hw/sh4/sh7750.c              |  4 ++++
 hw/ssi/omap_spi.c            |  3 +++
 hw/timer/omap_synctimer.c    |  4 ++++
 hw/timer/sh_timer.c          |  5 +++++
 hw/usb/hcd-musb.c            |  3 +++
 hw/xtensa/xtfpga.c           |  3 +++
 43 files changed, 202 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/qdev-deprecated.h

-- 
2.21.3

