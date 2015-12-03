Received: by 10.182.158.201 with SMTP id ww9csp244613obb;
        Thu, 3 Dec 2015 14:24:54 -0800 (PST)
X-Received: by 10.55.77.134 with SMTP id a128mr14099608qkb.104.1449181494103;
        Thu, 03 Dec 2015 14:24:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si4043178qhw.121.2015.12.03.14.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 14:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4cJ3-0001XA-Mf
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 17:24:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4cJ1-0001VG-Hh
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:24:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4cJ0-0001CT-PH
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:24:51 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4cIy-0001B1-Th; Thu, 03 Dec 2015 17:24:49 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4cIq-0005mg-Ck; Thu, 03 Dec 2015 22:24:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  3 Dec 2015 22:24:37 +0000
Message-Id: <1449181480-22209-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 0/3] hw/sd/pxa2xx_mmci: convert to sysbus and
	vmstate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ayzAd8nDpaqO

This patchset updates the ancient pxa2xx_mmci device to something
resembling modern standards for devices. In particular it makes
it a proper sysbus device and switches to VMStateDescription structs.

The only change here (apart from a trivial rebase) is that since
I sent the first version, commit 5ec911c30ff433 has updated sd_init()
so you can now call it with an already-attached-to-a-device block
backend. This means that the ugliness in the first version with a
pointer property has gone away and we now have a DEFINE_PROP_DRIVE.

(Question: when should a device use DEFINE_PROP_DRIVE and when should
it use DEFINE_BLOCK_PROPERTIES to get the PROP_DRIVE and some other
stuff? We seem to have examples of both...)

There are clearly further cleanup opportunities for this device,
like making the sd callbacks into sysbus gpio input lines rather
than having an ad-hoc pxa2xx_mmci_handlers() function to set them,
but one thing at a time.

Changes v1->v2:
 * (1/3) use an actual DEFINE_PROP_DRIVE property for the drive

Peter Maydell (3):
  hw/sd/pxa2xx_mmci: convert to SysBusDevice object
  hw/sd/pxa2xx_mmci: Convert to VMStateDescription
  hw/sd/pxa2xx_mmci: Add reset function

 hw/sd/pxa2xx_mmci.c | 254 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 152 insertions(+), 102 deletions(-)

-- 
1.9.1

