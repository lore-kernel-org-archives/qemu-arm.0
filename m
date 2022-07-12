Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1702072lfp;
        Tue, 12 Jul 2022 14:53:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJxw7MD9/FqnORg7EbWR5bNAfPCugsQbwUHY5GkLVpI1y8jPJPqe05dQnn8AY4DizsAZ8n
X-Received: by 2002:a05:622a:40d:b0:31d:4be9:33a7 with SMTP id n13-20020a05622a040d00b0031d4be933a7mr63470qtx.655.1657662806097;
        Tue, 12 Jul 2022 14:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657662806; cv=none;
        d=google.com; s=arc-20160816;
        b=K2csvzlAie38XkeDVZWB+AJdhefozb7N4MXzFqE+oY/Mw+tywCcxwz/zkkhuBXaVmM
         nN+OgoyNNgrDL3f3KQj8969CoQ9Zh5d6lKAH/BlcJPaMnuL5fwo89JYpIIvvFRLwwtFA
         5xRayONcoefJEXCCkuIMSm4xQ/YtLH7IcXlFGtzeAS2v4DxSqPJDqcPIX9ksR3XuFVli
         hR1j6R/ur87qCL5frr8Xc54xWidfKPsj8jJT++E2UN4RzlVPr35W2v4O/e4t3yhz3Ey5
         I2pvjL/QN48bkAMKSjbVNzGPeCCZ4CCXPol6AmK0TERkJA8u8OK3j2Pi1O7zsjJtrTY6
         VE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=+x1bvruwCoiKBXSrncV44jSo9i/hbEnuuZaz2dS9CQY=;
        b=jETA7aEkRybGF9Zr7l1CJ2GNdoFCI2q9x3CNsjRLEUCS/zKaS/RXOLhuiDl4IszCXy
         JZFf9HI/azSomVeJjq8QzkBRPt+wTXYO36P7QbdjySVx7M4UJeHT1OfyeEDUQdxq2n54
         rdu+WDGrgnl7FuzgQfY92X0M6wSc6y7kSS3mR9kt4a3ccOFOUK8SOJzGOtaUiChalo2v
         wgKZe6JHwt5JkR2Vps7OBg55Lp0f8VZMHr4DI1seO3/JUq2tWiwgOBHxRSxhKu0IPNDd
         /lh+NLe/xv/S37ti2jI80mx4IVo7HQjbDw6Ay7/RkgVsKe0WeP6FdSZsL+IWKlFhRClL
         fmbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=glp803BG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85603000000b0031ec3f5ac1dsi1466516qtr.449.2022.07.12.14.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 14:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=glp803BG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBNor-0007vK-Hy
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 17:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoc-0007ts-4p; Tue, 12 Jul 2022 17:53:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoa-0007kE-C8; Tue, 12 Jul 2022 17:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+x1bvruwCoiKBXSrncV44jSo9i/hbEnuuZaz2dS9CQY=; b=glp803BGOuWTK7bU0Pxj7IIcz4
 gBcMqKQDYalkKpoxNiTOm0v2cOZmH3W6zTt9FQHh7VgA2d1zX5KdCf9GjYdT1GVkFO7HoRzO7r/z9
 LERim7ZUUx1splmLcBtOqKRkZNZMiddZgHQqfv5+QdX/sZ6aCDfZVPudtKDRv39t6DlfdsIFsNsP2
 q+568t+Eti0dkD6boS/wG/ALi/jX0esAS1v0SrPltFdfER0zkeziRzvSRmxd8roM6lhjXlhRaPRTt
 Tmfw6F07QUrFWZysnGN4Tj6PEdHVZ1J43YVovMcY34Oo71LP4vv1bhuGDGyZOV4mKXlOjWF81U5Qv
 mU4mtHek3sDVY47oF7EJUAGabeaoyn5G8+fsNrBpzV2uDLrfEAhgHKCbK0mBxz5z4Vm2k4JXcMG5M
 2mbfFS0W62v8TnXvEz9R/gSdG0vV5YdwXTkcJGIZGVejpeRbsMrvpvKS83wEj3pdBgjc5OBGvNomj
 ehR+jivOq/DVU9hB79EBS+7wp/+V7z3aPxxhs1lh//7s9enzC9hZUyXwbRQSQOZ4pV1lDSPutJcrG
 QSRez8NoubVwNpEQ5REeYCVzE+PtEa0LOcVk+81Qx/EpuYIcsJK7/d93Rvx+R4sg5CX1T8ud6/QUu
 iFYnQ33gW54XxoHrDi8JvsqjPMOsCA5pu30+gh224=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNn8-000Bqt-Ip; Tue, 12 Jul 2022 22:51:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:11 +0100
Message-Id: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/40] PS2 device QOMification - part 2
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
X-TUID: PrzuxiykWG44

Here is the follow-on series from part 1 which completes the work to remove
the legacy global device init functions for PS2 devices. Now that part 1 has
been applied, the hard part to remove the PS2 function callback and argument
has been completed and all that remains is to improve the PS2 device
QOMification to allow the legacy PS2 functions to be removed.

Patches 1-11 update the pl050 device to remove the use of ps2_kbd_init() and
ps2_mouse_init(), whilst patches 12-34 make some more involved changes to
the lasips2 device (in particular completing the LASIPS2Port abstraction)
before doing the same.

Finally patches 35-40 complete the process for the pckbd (I8042 and I8042_MMIO
devices) before removing the now unused ps2_kbd_init(), ps2_mouse_init() and
i8042_mm_init() functions.

Note that this series is a migration break for the HPPA B160L and MIPS magnum
machines: I've had agreement from both Helge and Hervé that this is worth
doing to allow the use of the DeviceClass vmsd property to set the
VMStateDescription rather than manually calling vmstate_register().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Patches still requiring review for updated commit messages (no code changes
from v1): 27, 28 and 34

v2:
- Rebase onto master
- Add A-B and R-B tags from Helge and Peter
- s/jazz/magnum/ for consistency in commit message for patch 35
- Update commit messages in patches 27 and 28 to clarify why the int_status
  bitmap isn't immediately added to the vmstate_lasips2 VMStateDescription
- Update commit message in patch 34 to detail the extra changes to the
  vmstate_lasips2 VMStateDescription


Mark Cave-Ayland (40):
  pl050: move PL050State from pl050.c to new pl050.h header file
  pl050: rename pl050_keyboard_init() to pl050_kbd_init()
  pl050: change PL050State dev pointer from void to PS2State
  pl050: introduce new PL050_KBD_DEVICE QOM type
  pl050: introduce new PL050_MOUSE_DEVICE QOM type
  pl050: move logic from pl050_realize() to pl050_init()
  pl050: introduce PL050DeviceClass for the PL050 device
  pl050: introduce pl050_kbd_class_init() and pl050_kbd_realize()
  pl050: introduce pl050_mouse_class_init() and pl050_mouse_realize()
  pl050: don't use legacy ps2_kbd_init() function
  pl050: don't use legacy ps2_mouse_init() function
  lasips2: don't use vmstate_register() in lasips2_realize()
  lasips2: remove the qdev base property and the lasips2_properties
    array
  lasips2: remove legacy lasips2_initfn() function
  lasips2: change LASIPS2State dev pointer from void to PS2State
  lasips2: QOMify LASIPS2Port
  lasips2: introduce new LASIPS2_KBD_PORT QOM type
  lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
  lasips2: move keyboard port initialisation to new
    lasips2_kbd_port_init() function
  lasips2: move mouse port initialisation to new
    lasips2_mouse_port_init() function
  lasips2: introduce lasips2_kbd_port_class_init() and
    lasips2_kbd_port_realize()
  lasips2: introduce lasips2_mouse_port_class_init() and
    lasips2_mouse_port_realize()
  lasips2: rename LASIPS2Port irq field to birq
  lasips2: introduce port IRQ and new lasips2_port_init() function
  lasips2: introduce LASIPS2PortDeviceClass for the LASIPS2_PORT device
  lasips2: add named input gpio to port for downstream PS2 device IRQ
  lasips2: add named input gpio to handle incoming port IRQs
  lasips2: switch to using port-based IRQs
  lasips2: rename LASIPS2Port parent pointer to lasips2
  lasips2: standardise on lp name for LASIPS2Port variables
  lasips2: switch register memory region to DEVICE_BIG_ENDIAN
  lasips2: don't use legacy ps2_kbd_init() function
  lasips2: don't use legacy ps2_mouse_init() function
  lasips2: update VMStateDescription for LASIPS2 device
  pckbd: introduce new vmstate_kbd_mmio VMStateDescription for the
    I8042_MMIO device
  pckbd: don't use legacy ps2_kbd_init() function
  ps2: remove unused legacy ps2_kbd_init() function
  pckbd: don't use legacy ps2_mouse_init() function
  ps2: remove unused legacy ps2_mouse_init() function
  pckbd: remove legacy i8042_mm_init() function

 hw/hppa/machine.c          |   7 +-
 hw/input/lasips2.c         | 320 ++++++++++++++++++++++++++-----------
 hw/input/pckbd.c           |  82 ++++++----
 hw/input/pl050.c           | 112 ++++++++-----
 hw/input/ps2.c             |  26 ---
 hw/input/trace-events      |   2 -
 hw/mips/jazz.c             |  13 +-
 include/hw/input/i8042.h   |   7 +-
 include/hw/input/lasips2.h |  57 +++++--
 include/hw/input/pl050.h   |  59 +++++++
 include/hw/input/ps2.h     |   2 -
 11 files changed, 466 insertions(+), 221 deletions(-)
 create mode 100644 include/hw/input/pl050.h

-- 
2.30.2

