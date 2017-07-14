Received: by 10.25.44.15 with SMTP id s15csp760403lfs;
        Fri, 14 Jul 2017 03:52:09 -0700 (PDT)
X-Received: by 10.55.135.199 with SMTP id j190mr9972113qkd.72.1500029529648;
        Fri, 14 Jul 2017 03:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029529; cv=none;
        d=google.com; s=arc-20160816;
        b=oOBTrKDzMzZMFaYCxOXhZqeL8vJWvBEGiL4mAVuZXWV721GBPSPdw1zk3EyI32j/Sn
         h3O7C4LX8CRFxYHvR6pYOCctideMWwYmAapr8wngfGGpkppH3/hgXXngQo7rogSzq5S+
         FDdXe2ebE3sjPs+VZ+SFto24uV4iYLOhSHT/fglHCl/RBWMNTTegI4OCJtlMIdT5f+Mg
         UuCVSxn/LNaD4aO7zwL2uTyfkqRGW7T3CJNK0aeAXmfg+FXNPMgD1P9uIZpIGj/M0oIU
         Tk19E4yig7sQfF9gZshZ0RztVHwGeeu0cybPFrG3InSlo2/2IV66nRIl1wb+wwCk2gZ+
         AgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=Q8ICpNDvc/GVGPOoT9XTPIxxZW65m/kYhw9YjaXArxw=;
        b=oVhe/GBfau9vyTr75h7SWTon5TV4cjxTYUnP7sXaSEiZhtAUNVvlDADqmUNqMIpTtz
         MxL16XBq9+lzxQkNrFkcgOadN41I7azqHIDEiHTWiAcn54L+9NqSq/EesmDE8424LzZi
         +YHK2SY1FT8juPw87CrNjhif29M/pvPvcoKNCrDuxnCfMevSswr3kwKwsuiqTIinZrp3
         4l4Jwo2+ryPFcYrWnkLV6gGw1px0nR+N9PCrDOqXtxAbUYd00He05d3qfPjmsq15kF/f
         F092HdbrUTKAPzEwYIYNP7agEjAAaBccT2eHOKUaXyCeL+5ATtjwIPeiYv7fVC0Uiwkl
         MrGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c41si7540740qta.350.2017.07.14.03.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:52:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyCc-00055r-TC
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:52:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCL-0004sH-OH
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCH-000794-JF
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:49 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCH-00072e-BO; Fri, 14 Jul 2017 06:51:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyBz-0007jR-F2; Fri, 14 Jul 2017 11:51:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:18 +0100
Message-Id: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/9] ARM: implement MPS2 board (with 2 FPGA
 flavours)
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aR+19JwPLmfO

This patchseries adds support for the ARM MPS2/MPS2+ dev board:

The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
FPGA but is otherwise the same as the 2). Since the CPU itself
and most of the devices are in the FPGA, the details of the board
as seen by the guest depend significantly on the FPGA image.

We model the following FPGA images:
 "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
 "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511

They are fairly similar but differ in the details for some
peripherals.
Further info and links to all the documentation for the
board and the various FPGA images can be found here:
 https://developer.arm.com/products/system-design/development-boards/cortex-m-prototyping-system

This patchset adds the boards themselves, and the UART, timer
and system-controller devices they need. There are a number
of other devices on the board which are not yet modelled
(notably more GPIOs, a watchdog, another different kind of timer,
and a display device), but this minimal set is sufficient to
boot the "hello world" binary of the Zephyr RTOS and the
"blinky" binary of the mbed RTOS.
[To run the zephyr binary you also need this fix:
  http://patchwork.ozlabs.org/patch/782811/
 which is in the target-arm pullreq I just sent so should
 get into master in a few days.]

We can add more devices to the model later, but I figured
this was a sufficient place to start.

The underlying motivation here is that the v8M work that I
have planned will need a board, and there is a v8M FPGA
image for the MPS2 that we can use. It's also perhaps a more
useful M profile board for general purposes than the stellaris
boards (64K RAM) or the Netduino2 (128K RAM), since it has
16MB of RAM.

Changes v1->v2:
 * fixed handling of ID register arrays in uart and timer devices
 * moved variable declarations to top of function
 * removed stray braces
 * log guest error if Tx enabled with bad baudrate
 * fixed cut-n-paste error in mps2-scc.h header comment
 * added ethernet support (I actually wrote this patch earlier
   but forgot to put it in v1 ;-))
 * added MAINTAINERS file entries

Non-change:
 * I've stuck with the naming of types/files/boards in the
   first patch, because after consideration I still think
   this is the best choice overall.

Patches which still need review: 1, 2, 8, 9

I'd quite like to get this into 2.10 if possible
(softfreeze deadline rapidly approaching) so if people
have time to review before tuesday that would be great.

thanks
-- PMM

Peter Maydell (9):
  hw/arm/mps2: Implement skeleton mps2-an385 and mps2-an511 board models
  hw/char/cmsdk-apb-uart.c: Implement CMSDK APB UART
  hw/arm/mps2: Add UARTs
  hw/char/cmsdk-apb-timer: Implement CMSDK APB timer device
  hw/arm/mps2: Add timers
  hw/misc/mps2_scc: Implement MPS2 Serial Communication Controller
  hw/arm/mps2: Add SCC
  hw/arm/mps2: Add ethernet
  MAINTAINERS: Add entries for MPS2 board

 hw/arm/Makefile.objs               |   1 +
 hw/char/Makefile.objs              |   1 +
 hw/misc/Makefile.objs              |   1 +
 hw/timer/Makefile.objs             |   1 +
 include/hw/char/cmsdk-apb-uart.h   |  78 +++++++
 include/hw/misc/mps2-scc.h         |  43 ++++
 include/hw/timer/cmsdk-apb-timer.h |  59 ++++++
 hw/arm/mps2.c                      | 384 +++++++++++++++++++++++++++++++++++
 hw/char/cmsdk-apb-uart.c           | 402 +++++++++++++++++++++++++++++++++++++
 hw/misc/mps2-scc.c                 | 310 ++++++++++++++++++++++++++++
 hw/timer/cmsdk-apb-timer.c         | 253 +++++++++++++++++++++++
 MAINTAINERS                        |  14 +-
 default-configs/arm-softmmu.mak    |   6 +
 hw/char/trace-events               |   9 +
 hw/misc/trace-events               |   8 +
 hw/timer/trace-events              |   5 +
 16 files changed, 1574 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/char/cmsdk-apb-uart.h
 create mode 100644 include/hw/misc/mps2-scc.h
 create mode 100644 include/hw/timer/cmsdk-apb-timer.h
 create mode 100644 hw/arm/mps2.c
 create mode 100644 hw/char/cmsdk-apb-uart.c
 create mode 100644 hw/misc/mps2-scc.c
 create mode 100644 hw/timer/cmsdk-apb-timer.c

-- 
2.7.4

