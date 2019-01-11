Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp209456wrt;
        Fri, 11 Jan 2019 06:37:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6/GYM95o0/OrSTf5wesY3TM9BulPfA39/7OaH8qaIJDaz7HwhPBheLQOSkLUARkGFcJTm7
X-Received: by 2002:a1c:a755:: with SMTP id q82mr2659864wme.6.1547217465893;
        Fri, 11 Jan 2019 06:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547217465; cv=none;
        d=google.com; s=arc-20160816;
        b=cNXWfjE1uPl4MWrVKrZp++LICPdcEJkDlTKDvBwsiUsfL55jao7lYRkvWP3ziU70wA
         sYlmiCXvPgGa/mDjXZ0sUtWa9SMbIEvMeWtJGyd2RbIlv/HSNmxBoFNDc6imILagGOT4
         Y6F0shDcvjCyY8xANwKtV+2xDGUAv0rQQi9kAlsAkfeSTbH83bVHVbKXn7Q3k27TbjZ7
         59pktxmwi7nDr3AudOTBeOw6HxIy3Pug/3rbSStvW50mIuSUPjNWynRcpei2KKMxkGqA
         orfOeefuFm/V0tMd+stRSSOWCisu6uARxOUUslUXPMbjlx6jIDWnZ0FeF2W6i9KCB5rI
         l2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=qjMzuf6TdS94KJz/ELpEhMQFZnV2MHqrxDIRlXXAW1g=;
        b=fje26emjMvdrnAMQdj2xGvw99b2cSAGyhv7wmBZEV/K2rJA9DWnjj+Rpa5ZE6ScAPt
         PyeGCRmVvI+Vm1/Y5eNKsft/daXOpGVoCNLG/NQA1MEH1QrheY8nZse+lWWp7Wtwht3l
         ua1Clu+IlkujYm9EpnXeyOoT53BVD/Oe/fY22/NyXc7fktICbz19FuiNlx5X75FJ8ILu
         Bd8TiK0yG8tqAiAo1gafqRPIB+rgLjIcp1mX9YQUGc0F1py+bkNZeEAEelcDzGfqlX2W
         Ir6aZrgXH0EA4LUd0rolK0HBCd6x7oOMY+bNl4Y1W3RhxbPa5kPKBmpHZsk861IJ2EuC
         IcCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x191si13615036wme.127.2019.01.11.06.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxwO-0004KI-PF
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:37:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe6-0005j5-Uw
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxV8-0000Oj-Ku
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:09:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxUu-0007vq-Iw; Fri, 11 Jan 2019 09:09:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7966E6380D;
	Fri, 11 Jan 2019 14:09:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D67E5D6AA;
	Fri, 11 Jan 2019 14:09:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:42 +0100
Message-Id: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 11 Jan 2019 14:09:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RESEND 00/15] typedefs: Remove scarcely used
 declarations
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FdFcrQC0iKmg

Hi,

Since this file became a hot topic [*], I took previous cleanups
from last year and continue to clean it.

Regards,

Phil.

[*] "HACKING: Clarify the paragraph about typedefs"
https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02132.html
[*] "Fix duplicated typedefs to be able to compile with Clang in gnu99 mo=
de"
https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02117.html

Philippe Mathieu-Daud=C3=A9 (15):
  hw/input/ps2: Remove PS2State from "qemu/typedefs.h"
  hw/pcmcia: Remove PCMCIACardState from "qemu/typedefs.h"
  hw/ssi: Remove SSIBus from "qemu/typedefs.h"
  hw/ide/ahci: Remove AllwinnerAHCIState from "qemu/typedefs.h"
  hw/nvram/fw_cfg: Remove various typedefs from "qemu/typedefs.h"
  hw/i2c/smbus: Remove SMBusDevice from "qemu/typedefs.h"
  hw/bt: Remove HCIInfo from "qemu/typedefs.h"
  hw/char/serial: Remove SerialState from "qemu/typedefs.h"
  hw/i386: Remove PCMachineClass from "qemu/typedefs.h"
  range: Remove Range from "qemu/typedefs.h"
  audio: Remove AudioState from "qemu/typedefs.h"
  ui/console: Remove MouseTransformInfo from qemu/typedefs.h
  ui/console: Remove QemuDmaBuf from "qemu/typedefs.h"
  ui/console: Remove DisplayState/DisplaySurface from "qemu/typedefs.h"
  RFC ui/console: Add "ui/pixelformat.h" to declare PixelFormat

 audio/audio_int.h         |  4 ++--
 hw/arm/strongarm.h        |  1 +
 include/hw/acpi/vmgenid.h |  1 +
 include/hw/arm/pxa.h      |  2 ++
 include/hw/arm/virt.h     |  1 +
 include/hw/char/serial.h  |  4 ++--
 include/hw/devices.h      |  1 +
 include/hw/i2c/smbus.h    |  2 ++
 include/hw/i386/pc.h      |  4 ++--
 include/hw/ide/ahci.h     |  4 ++--
 include/hw/input/ps2.h    |  2 ++
 include/hw/mem/nvdimm.h   |  1 +
 include/hw/nvram/fw_cfg.h |  8 +++++++-
 include/hw/pci-host/q35.h |  1 +
 include/hw/pci/pci.h      |  1 +
 include/hw/pcmcia.h       |  4 ++--
 include/hw/ssi/pl022.h    |  1 +
 include/hw/ssi/ssi.h      |  1 +
 include/qemu/range.h      |  4 ++--
 include/qemu/typedefs.h   | 19 -------------------
 include/sysemu/bt.h       |  4 ++--
 include/ui/console.h      | 25 +++++++++----------------
 include/ui/pixelformat.h  | 31 +++++++++++++++++++++++++++++++
 include/ui/qemu-pixman.h  |  2 ++
 24 files changed, 78 insertions(+), 50 deletions(-)
 create mode 100644 include/ui/pixelformat.h

--=20
2.17.2

