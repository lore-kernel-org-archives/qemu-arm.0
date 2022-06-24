Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp332555lft;
        Fri, 24 Jun 2022 06:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2ci6ErfTDXU6GNTw5zpaJcAKMD4PYftPW1d5SZwgPqD0wSheg3gCUOM3tx9rro+LhZsSI
X-Received: by 2002:a05:620a:2606:b0:6a7:1dd:1904 with SMTP id z6-20020a05620a260600b006a701dd1904mr10615322qko.106.1656078111128;
        Fri, 24 Jun 2022 06:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656078111; cv=none;
        d=google.com; s=arc-20160816;
        b=VzovYvC+fAcLotnsXIX2G62ueERxy3/jlNFFiL40Hxk0cvXktAv4jP3opzFbXCd6Zb
         HFS5uta5W2TpKjMKXCnvp1FBd0M1EmKvrrgAen+YYKRGxQ6uY3eUvUtcI1vqErUImHbA
         94SyK2esm03XO8svt0iOUbecS+gGFJuA8AJ/uCCzPeplKTxVqMbRS+m2L4dkDt6MAmjt
         KKIm+28p7Tv+zWMYNPJUO7O6np5GcIut1r1seVuo1ZEHTs2332D1MdsMgn8ay2bRTFe1
         1qZEbmARrsNorNPKfmXvrTYOI+BUvWmOmAyw2GilccBR0+a53utMslvCygEZ+PIKKAYO
         P9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=JVNmybBQMWU5+dM/W0q4tQ0Aiqs81/fmKx9PQ15Zppo=;
        b=xSfLDHd219gfpqc91oYAu5BJx441No0jPpSGTttI5+c6mPJe8SXKY8dQDU4QjtXAOp
         K+lpNjAAQpdXzE9qZXrrzLzSRPUnTJg6WjieI/+2e6uapQm9wki6jg65Qs0hTYJGUm/m
         ZcS/lzlRKE1ZOaQdFn5xXu2UDLuQ93yzs7q2t6q7ZCxJ7yfUkPsRVbqFjIK/DX03TQ+g
         KxMS8r1ZCeYkXItxhdDNPNNbnr6dx7Z15JP9lGbPaM4YmeNsUcznY+aXlbWXGBYct3nl
         IcXqAS6yq2S6uJM0CDxKQXYqO0tMLL7EvgUXbyYEJVVpPGsDYcuNTLwOHghigwPa9Mfl
         Rxzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=FpPAFN8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a0562140c8300b004703fabfebfsi1447349qvr.22.2022.06.24.06.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=FpPAFN8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jZG-0006nQ-Gb
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYr-0006lN-PD; Fri, 24 Jun 2022 09:41:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYp-00050W-Rf; Fri, 24 Jun 2022 09:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JVNmybBQMWU5+dM/W0q4tQ0Aiqs81/fmKx9PQ15Zppo=; b=FpPAFN8WRwEx6rYYZ4GtKKaHr/
 MdXac3ErMu0Q1XTES5KBDEarsgPRnINkC+z85C2a3OnSkbSkjFOkWQBaWI5cI8dUtdNzC/M7g8K+O
 t0oJQqyuypD/6MvcnnCra34aV1u0PmvdLeRJUMYOtx0D84c5pQoMaG/h5CFRfNZ+OKfFj1IbjBuDO
 SmMfIIHb4455Rmz5k7anXVrCAEFFSIYymrmrsP88eOpI9b2E2O6xhVEgv9qNv94jLhbfCqUzFrKDI
 2cYBpCY6Tx1RwvhdO+6GHNieO6pk7REnKoyN4QrsBA1t0cWmcFjvSwQ6dqf2Gwhg6TYdGtFiN4L3h
 JPhT1kljdqkLrXW7eg2eUoHNLXYm4ZHdtsJLCDKI0pCgWlCtz/7cbYTJ1uQOHyI/+GSjSEhsAxgup
 eFYZ9lsTjzW2Z7/GCFEvRd+czkKtCNwGAYeqhd/Qu13oWGXbiWliIFWgsECKZdJFihx6LE4jeA+/i
 IHdpThfzsAsEB0L0DMIXKhLZ5+Pqlytck8zra7lxlYOOW+uU9An5RnsZb2FIB/w2QE9bbqf7Cu1xw
 dzGBYRZ9V6wb6Xg52tDolEg/p4CdQIxtE+DR5tZZjpaTrGeAdyRqMBcsxLVQknw1jMfddQI3sTx14
 G8+EPOEGdf/DRrp3Q6ULzRoqDcXy2CbsJCInxL5Mc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jXX-00037t-9T; Fri, 24 Jun 2022 14:40:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:15 +0100
Message-Id: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/54] PS2 device QOMification - part 1
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
X-TUID: tPlS7EAPEKKU

This series came about when looking at improving the LASI PS2 device for
the HPPA machine: there were improvements that I was keen to make, but
was restricted because the PS2 device(s) weren't QOMified.

Trying to do everything in a single patchset would be a very large series
indeed, so here is part 1 of the series which does the basic QOMification
process and consists of:

- QOMifying the basic PS2, PS2 keyboard and PS2 mouse types

- Moving any functionality that exists in a global device init function
  directly into the relevant device, so that all device behaviour is
  configured using qdev properties and QOM

- Introducing a new I8042_MMIO type for use by the MIPS magnum machine

- Switch all PS2 devices to use qdev gpios for IRQs instead of using the
  update_irq() callback function along with the update_arg opaque

Once this work has been done, a follow-up part 2 series will finish the
remainder of the work which involves i) improving the QOM object model
now QOMification is complete and ii) removing the legacy global device
init functions for PS2 and related devices.

Testing for this series has comprised of booting a machine with each type
of PS2 device and confirming that i) the machine responds to keypresses
when using a graphical console and ii) completing a successful migration
from a machine with this series applies back to a machine running latest
git master. The test machines I used were:

- qemu-system-x86_64 -M pc for the I8042 device
- qemu-system-hppa for the LASIPS2 device
- qemu-system-arm -M versatilepb for the PL050 device
- qemu-system-mips64el -M magnum for the I8042_MMIO device

Patches still missing review:
  22, 26, 29
  36, 37
  44, 46, 47, 48
  50, 53

v2:
- Rebase onto master
- Add R-B tags from Phil and Peter
- Add A-B tag from Helge (T-B tag dropped due to changes since v1)
- Move setting of extended_state from i8042_mmio_reset() to i8042_mmio_init()
- Move sysbus_init_mmio() from i8042_mmio_init() to i8042_realize()
- Use qemu_irq_is_connected() in patch 34
- Use named gpio inputs for pl050 in patch 36
- Use sysbus IRQ instead gpio out for laspis2 output IRQ in patch 46
- Use named gpio inputs for laspi2 in patch 47
- Use named gpio inputs for i8042 device in patch 52
- Add QEMU interface comments as suggested by Peter


Mark Cave-Ayland (54):
  ps2: checkpatch fixes
  ps2: QOMify PS2State
  ps2: QOMify PS2KbdState
  ps2: QOMify PS2MouseState
  ps2: move QOM type definitions from ps2.c to ps2.h
  ps2: improve function prototypes in ps2.c and ps2.h
  ps2: introduce PS2DeviceClass
  ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
    ps2_common_reset()
  ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
  ps2: implement ps2_kbd_realize() and use it to register
    ps2_keyboard_handler
  ps2: implement ps2_mouse_realize() and use it to register
    ps2_mouse_handler
  ps2: don't use vmstate_register() in ps2_kbd_init()
  ps2: don't use vmstate_register() in ps2_mouse_init()
  pl050: checkpatch fixes
  pl050: split pl050_update_irq() into separate pl050_set_irq() and
    pl050_update_irq() functions
  lasips2: spacing fixes
  lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
  pckbd: checkpatch fixes
  pckbd: move KBDState from pckbd.c to i8042.h
  pckbd: move ISAKBDState from pckbd.c to i8042.h
  pckbd: introduce new I8042_MMIO QOM type
  pckbd: implement i8042_mmio_reset() for I8042_MMIO device
  pckbd: add mask qdev property to I8042_MMIO device
  pckbd: add size qdev property to I8042_MMIO device
  pckbd: implement i8042_mmio_realize() function
  pckbd: implement i8042_mmio_init() function
  pckbd: alter i8042_mm_init() to return a I8042_MMIO device
  pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
  pckbd: more vmstate_register() from i8042_mm_init() to
    i8042_mmio_realize()
  pckbd: move ps2_kbd_init() and ps2_mouse_init() to
    i8042_mmio_realize()
  ps2: make ps2_raise_irq() function static
  ps2: use ps2_raise_irq() instead of calling update_irq() directly
  ps2: introduce ps2_lower_irq() instead of calling update_irq()
    directly
  ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq()
    and ps2_lower_irq()
  pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
  pl050: switch over from update_irq() function to PS2 device gpio
  pl050: add QEMU interface comment
  lasips2: QOMify LASIPS2State
  lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
  lasips2: rename lasips2_init() to lasips2_initfn() and update it to
    return the LASIPS2 device
  lasips2: implement lasips2_init() function
  lasips2: move mapping of LASIPS2 registers to HPPA machine
  lasips2: move initialisation of PS2 ports from lasi_initfn() to
    lasi_init()
  lasips2: add base property
  lasips2: implement lasips2_realize()
  lasips2: use sysbus IRQ for output IRQ
  lasips2: switch over from update_irq() function to PS2 device gpio
  lasips2: add QEMU interface comment
  pckbd: switch I8042_MMIO device from update_irq() function to PS2
    device gpio
  pckbd: add QEMU interface comment for I8042_MMIO device
  pckbd: add i8042_reset() function to I8042 device
  pckbd: switch I8042 device from update_irq() function to PS2 device
    gpio
  pckbd: add QEMU interface comment for I8042 device
  ps2: remove update_irq() function and update_arg parameter

 hw/hppa/machine.c          |  11 +-
 hw/input/lasips2.c         | 124 ++++++---
 hw/input/pckbd.c           | 338 +++++++++++++++++--------
 hw/input/pl050.c           |  56 +++--
 hw/input/ps2.c             | 501 +++++++++++++++++++++----------------
 hw/mips/jazz.c             |  11 +-
 include/hw/input/i8042.h   |  75 +++++-
 include/hw/input/lasips2.h |  39 ++-
 include/hw/input/ps2.h     |  79 +++++-
 9 files changed, 846 insertions(+), 388 deletions(-)

-- 
2.30.2

