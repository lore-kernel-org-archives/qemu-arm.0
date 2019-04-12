Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp782817wrx;
        Fri, 12 Apr 2019 09:55:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUNrDnHWUipxzVciVLldrdJ8FHKW3vofw06fksiPjTrKhBUoLIImKDPODDFVEO6qC5sS1Q
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr12824162wrj.118.1555088139599;
        Fri, 12 Apr 2019 09:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088139; cv=none;
        d=google.com; s=arc-20160816;
        b=Xfzj5xw+7FF6rBWBrSd997IlT4GJqfqbRIDefbgZq6dmUwKVNSENdoubm+fSEnWCSP
         eblsyUyY6yhMZXO0WjRQKNzUzNJ1N0CvKi+iDW3A2c+kYPOjF/bxfv7lE7xBQJeU6ueM
         9ZPxSSWjk7fiT7fgBEbN1lQR/iuHPegVtcrf1HemdJzOsF6qjqUNkEX2xyube0H+krAm
         0qMn7fCgoqwiUdTu5DaDDxnHFBDRosngcO5wAxEisVsgn/J/aXkRb0nAcsAQFyInfsc0
         cLuq+1XkJdctH0+v+r8OW4i8/3SPCCFgsl25CX6EBtULafZBm0SsQ2b85xE7LomgUFXI
         B1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=swXlvaxdUG+zn4VpkvZlZYomI4dMtMReP6XZEiTVLGo=;
        b=k4S8Md9ptFyAUHP2bMIpVoFBwnM7cHt41OCRS8u3Sd84gxD0RkD5+ju47LIYlrKDN1
         inICkvdrSvBd3Iaif1rOlZjPk+OO3Z0bDRZM1L+J/LUFTW3N+/7Xqp7b+CuAdDvV4T8f
         7hUbScjwcMDt9u0gbVqX6otZeJVmfZ6xGCFFxmxuhA+FVnw8MCUq5wnphb/Eir4k7Xnq
         5VNb/OBcxfJqty/1X2Od80qb/2VLHkroQvZwjAjg6SDB2tW1HinRCdAgmCr3mzbNmwN5
         uIkSAiDiEyKqblW9oYZf0qMNHYQ2AuCaGooyQ0EN7SpzRn17ZF4mfiYkX/JODG3P/Tgd
         ROjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t128si5655018wmb.132.2019.04.12.09.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzSk-0001ee-Ke
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:55:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRd-0000kR-TA
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRb-0006ED-Rh
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRZ-00065U-TA; Fri, 12 Apr 2019 12:54:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 318E6308FC4D;
	Fri, 12 Apr 2019 16:54:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9627360BFC;
	Fri, 12 Apr 2019 16:54:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:04 +0200
Message-Id: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 12 Apr 2019 16:54:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 00/12] hw: Remove "hw/devices.h"
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
Cc: Thomas Huth <thuth@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VoNTDDTp6DUI

Hi,

As his first comment describes itself, the "hw/devices.h" contains
declarations for "Devices that have nowhere better to go."
This series remove it, creating new headers for devices covered there.
MAINTAINERS is updated.
I also included 2 cleanups while working on this, in "qemu/typedefs.h"
and "hw/net/ne2000-isa.h" header guard.

v3:
- rebased
- added 2 patches suggested by Markus
- addressed Markus review comments
- added Markus's R-b

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg00925.html
- added R-b, T-b tags
- addressed many review comments from Thomas

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00611.html

Phil.

$ git backport-diff -u remove_hw_devices-v2
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/12:[----] [-C] 'hw/arm/aspeed: Use TYPE_TMP105/TYPE_PCA9552 instead o=
f hardcoded string'
002/12:[down] 'hw/arm/nseries: Use TYPE_TMP105 instead of hardcoded strin=
g'
003/12:[down] 'hw/display/tc6393xb: Remove unused functions'
004/12:[0006] [FC] 'hw/devices: Move TC6393XB declarations into a new hea=
der'
005/12:[----] [-C] 'hw/devices: Move Blizzard declarations into a new hea=
der'
006/12:[----] [-C] 'hw/devices: Move CBus declarations into a new header'
007/12:[0002] [FC] 'hw/devices: Move Gamepad declarations into a new head=
er'
008/12:[0002] [FC] 'hw/devices: Move TI touchscreen declarations into a n=
ew header'
009/12:[----] [--] 'hw/devices: Move LAN9118 declarations into a new head=
er'
010/12:[----] [--] 'hw/net/ne2000-isa: Add guards to the header'
011/12:[----] [--] 'hw/net/lan9118: Export TYPE_LAN9118 and use it instea=
d of hardcoded string'
012/12:[----] [--] 'hw/devices: Move SMSC 91C111 declaration into a new h=
eader'

Philippe Mathieu-Daud=C3=A9 (12):
  hw/arm/aspeed: Use TYPE_TMP105/TYPE_PCA9552 instead of hardcoded
    string
  hw/arm/nseries: Use TYPE_TMP105 instead of hardcoded string
  hw/display/tc6393xb: Remove unused functions
  hw/devices: Move TC6393XB declarations into a new header
  hw/devices: Move Blizzard declarations into a new header
  hw/devices: Move CBus declarations into a new header
  hw/devices: Move Gamepad declarations into a new header
  hw/devices: Move TI touchscreen declarations into a new header
  hw/devices: Move LAN9118 declarations into a new header
  hw/net/ne2000-isa: Add guards to the header
  hw/net/lan9118: Export TYPE_LAN9118 and use it instead of hardcoded
    string
  hw/devices: Move SMSC 91C111 declaration into a new header

 MAINTAINERS                   |  7 ++++
 hw/arm/aspeed.c               | 13 +++++---
 hw/arm/exynos4_boards.c       |  3 +-
 hw/arm/gumstix.c              |  2 +-
 hw/arm/integratorcp.c         |  2 +-
 hw/arm/kzm.c                  |  2 +-
 hw/arm/mainstone.c            |  2 +-
 hw/arm/mps2-tz.c              |  3 +-
 hw/arm/mps2.c                 |  2 +-
 hw/arm/nseries.c              |  7 ++--
 hw/arm/palm.c                 |  2 +-
 hw/arm/realview.c             |  3 +-
 hw/arm/stellaris.c            |  2 +-
 hw/arm/tosa.c                 |  2 +-
 hw/arm/versatilepb.c          |  2 +-
 hw/arm/vexpress.c             |  2 +-
 hw/display/blizzard.c         |  2 +-
 hw/display/tc6393xb.c         | 18 +---------
 hw/input/stellaris_input.c    |  2 +-
 hw/input/tsc2005.c            |  2 +-
 hw/input/tsc210x.c            |  4 +--
 hw/misc/cbus.c                |  2 +-
 hw/net/lan9118.c              |  3 +-
 hw/net/smc91c111.c            |  2 +-
 include/hw/arm/omap.h         |  6 +---
 include/hw/devices.h          | 62 -----------------------------------
 include/hw/display/blizzard.h | 22 +++++++++++++
 include/hw/display/tc6393xb.h | 24 ++++++++++++++
 include/hw/input/gamepad.h    | 19 +++++++++++
 include/hw/input/tsc2xxx.h    | 36 ++++++++++++++++++++
 include/hw/misc/cbus.h        | 32 ++++++++++++++++++
 include/hw/net/lan9118.h      | 21 ++++++++++++
 include/hw/net/ne2000-isa.h   |  6 ++++
 include/hw/net/smc91c111.h    | 19 +++++++++++
 include/qemu/typedefs.h       |  1 -
 35 files changed, 226 insertions(+), 113 deletions(-)
 delete mode 100644 include/hw/devices.h
 create mode 100644 include/hw/display/blizzard.h
 create mode 100644 include/hw/display/tc6393xb.h
 create mode 100644 include/hw/input/gamepad.h
 create mode 100644 include/hw/input/tsc2xxx.h
 create mode 100644 include/hw/misc/cbus.h
 create mode 100644 include/hw/net/lan9118.h
 create mode 100644 include/hw/net/smc91c111.h

--=20
2.20.1

