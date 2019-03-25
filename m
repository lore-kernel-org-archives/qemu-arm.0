Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3819059wrx;
        Mon, 25 Mar 2019 05:53:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8VNYS0Q4nCAilijAEX1Zfy/NhSw60priBW+7kKZSsXpYtMQ+aRizJ2/fu21youV8Ivbvn
X-Received: by 2002:a25:c286:: with SMTP id s128mr19323890ybf.86.1553518407360;
        Mon, 25 Mar 2019 05:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553518407; cv=none;
        d=google.com; s=arc-20160816;
        b=rmWzaNMqwXogpHi8SUk7/NGORcZ7jt+arqHHViaHrB0UzfXkhsmXQuPJ9R3+tLrPjt
         QM5p1RwPNpkBhkOIgX9FnEIvnQXr6BH4KD6Nl2YzP1U4jSfQ1GiXhDxfWAD0wT/uStWX
         kwbPEV95PMioSIeUTmtbR4LPv6zXGzcfwP7Rg6D8IIpna5pdvxlkdZ2Ruuy/QwiHZv04
         QN7SdvYCvnBTGG0/+S/FWhEjNsdWyr/9fM7UsIZooTd6F6WG+SOnMSdeERNKCWIbJcDO
         cdD4xhY1ur6YEyeoxZToqbiu/IVfHLQBewBX0y7FIbL+5tJJzbsJODz+7dF+jL23gn7G
         7/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=GTXrRhyX1C2wbQAPJSegLVzGr5DufkhWY2fwhP56+jQ=;
        b=xR5WG6mDHIK2OSoWH167DVGoy8OWkmafjPIcsZtNWMB+mNZFLZK65IWu7ZlqRJwLHR
         hgV8TJzzZDCvKt8J5td+jQZL0uzbdfR0HHGrPY7bnu5/rTwJUPs06mZINbib1ZPCfc2i
         1JA3NtgnsgnF+l16nftXkxilOXvAknxGU0w5VQ6eqAXWRLXBYYTjepdwd0lF52ztqY8t
         xIZlfkTOz2wyduu7W62tm6IaI3wWD11IxykYhQsaHqhhp34jxuz/ZMWju4SNgWQubtc+
         /iHSIjmJgbtl0qSjvd+CwXHbSPhoxIlcp2I7nii8R/5L6gPXMYXBIQkes2FUBK/wco31
         bkBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si9589265ybp.326.2019.03.25.05.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 05:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8P6U-0002hT-Tv
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 08:53:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1h8P6N-0002gh-RK
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 08:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1h8P6M-0000Cj-RG
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 08:53:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2254 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
	id 1h8P6J-00009g-UQ; Mon, 25 Mar 2019 08:53:16 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 0C5BCEA9B759C78E26E2;
	Mon, 25 Mar 2019 20:53:06 +0800 (CST)
Received: from HGHY1z004218071.china.huawei.com (10.177.29.32) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 25 Mar 2019 20:52:57 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Mon, 25 Mar 2019 20:51:42 +0800
Message-ID: <20190325125142.11628-1-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC PATCH] hw/arm/virt: use variable size of flash
 device to save memory
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org,
	Xiang Zheng <zhengxiang9@huawei.com>, guoheyi@huawei.com,
	wanghaibin.wang@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWhBQoOqo29J

Currently we fill the VIRT_FLASH space with two 64MB NOR images when
using persistent UEFI variables on QEMU. Actually we only use a very
small part of the memory while the rest significant large part of
memory is wasted.

This patch creates and maps a variable size of flash device instead of
a mandatory 64MB one to save memory.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---

This patch might be insufficient since it also needs to modify the flash size
in ACPI and DTB.

BTW, I don't understand why it requires the two NOR images to be exactly 64MB
in size when using -pflash.

---
 hw/arm/virt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce2664a..8269532 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -44,6 +44,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/block-backend.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/bitops.h"
@@ -881,14 +882,18 @@ static void create_one_flash(const char *name, hwaddr flashbase,
     DriveInfo *dinfo = drive_get_next(IF_PFLASH);
     DeviceState *dev = qdev_create(NULL, TYPE_PFLASH_CFI01);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    BlockBackend *blk_backend = NULL;
     const uint64_t sectorlength = 256 * 1024;
+    hwaddr real_size = flashsize;
 
     if (dinfo) {
-        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
-                            &error_abort);
+        blk_backend = blk_by_legacy_dinfo(dinfo);
+        qdev_prop_set_drive(dev, "drive", blk_backend, &error_abort);
+        real_size = blk_getlength(blk_backend);
+        real_size = flashsize > real_size ? real_size : flashsize;
     }
 
-    qdev_prop_set_uint32(dev, "num-blocks", flashsize / sectorlength);
+    qdev_prop_set_uint32(dev, "num-blocks", real_size / sectorlength);
     qdev_prop_set_uint64(dev, "sector-length", sectorlength);
     qdev_prop_set_uint8(dev, "width", 4);
     qdev_prop_set_uint8(dev, "device-width", 2);
-- 
1.8.3.1


