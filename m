Received: by 10.25.205.13 with SMTP id d13csp3745127lfg;
        Thu, 22 Dec 2016 06:03:45 -0800 (PST)
X-Received: by 10.200.43.167 with SMTP id m36mr9657903qtm.117.1482415425607;
        Thu, 22 Dec 2016 06:03:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w33si17501509qte.320.2016.12.22.06.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Dec 2016 06:03:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cK3yD-0000YA-6H
	for alex.bennee@linaro.org; Thu, 22 Dec 2016 09:03:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david.engraf@sysgo.com>) id 1cK3xY-0000Wm-V4
	for qemu-devel@nongnu.org; Thu, 22 Dec 2016 09:03:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david.engraf@sysgo.com>) id 1cK3xY-0005LJ-70
	for qemu-devel@nongnu.org; Thu, 22 Dec 2016 09:03:04 -0500
Received: from mail.sysgo.com ([176.9.12.79]:44114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david.engraf@sysgo.com>)
	id 1cK3xR-0005Ff-26; Thu, 22 Dec 2016 09:02:57 -0500
From: David Engraf <david.engraf@sysgo.com>
To: peter.maydell@linaro.org, qemu-arm@nongnu.org
Message-ID: <d15e8de4-f7d8-1c28-7e5e-31d0aa10819d@sysgo.com>
Date: Thu, 22 Dec 2016 15:02:54 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------8875C6CC09A0B51199EFB81B"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 176.9.12.79
Subject: [Qemu-devel] [PATCH] vexpress fix flash device-width
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1d1Je61Nqeh

This is a multi-part message in MIME format.
--------------8875C6CC09A0B51199EFB81B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The current implementation uses width = 4 and device-width = 2 for the 
flash configuration. When using u-boot or Linux, the flash is detected 
as 32 x 16 bit, thus the sector size is doubled to 512 KB. When u-boot 
sends a sector erase, only the first 256 KB are erased because the QEMU 
flash implementation uses the configured sector size of 256 KB and 
ignores the width and device-width ratio.

This patch will change device-width to 4, thus the width and 
device-width are equal and u-boot detects the flash as 32 x 32 bit with 
the correct sector size of 256 KB.

- David


--------------8875C6CC09A0B51199EFB81B
Content-Type: text/x-patch;
 name="vexpress.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vexpress.patch"

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58760f4..85ec347 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -526,7 +526,7 @@ static pflash_t *ve_pflash_cfi01_register(hwaddr base, const char *name,
                          VEXPRESS_FLASH_SIZE / VEXPRESS_FLASH_SECT_SIZE);
     qdev_prop_set_uint64(dev, "sector-length", VEXPRESS_FLASH_SECT_SIZE);
     qdev_prop_set_uint8(dev, "width", 4);
-    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_uint8(dev, "device-width", 4);
     qdev_prop_set_bit(dev, "big-endian", false);
     qdev_prop_set_uint16(dev, "id0", 0x89);
     qdev_prop_set_uint16(dev, "id1", 0x18);

--------------8875C6CC09A0B51199EFB81B--
