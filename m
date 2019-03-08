Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8268209wrx;
        Fri, 8 Mar 2019 03:45:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqymC+SvAp8JppsimuJnh96IfEMgS6PuLzUEoAq5WNZX7NgtMn9IXe0OtinX7WK+GlL8qcyN
X-Received: by 2002:a81:7445:: with SMTP id p66mr946359ywc.194.1552045502719;
        Fri, 08 Mar 2019 03:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045502; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUZIF5HsfVBOXtPYzI2QscZW/CFWjCqWsarg5786hPjHYaKp/abEJG+swyloPvaP2c
         QdvRIBRAloZkNkQUKz9bAvVqhFE3U1t2WEWi2kcclREeB67HcD/MrtUOq3Q+ULSbGtoR
         JbX0pMt88qlJnUrFqr8G++mtH6hyjDO6HGcqdHlmLfuiOI3B3Gc/16+akxuU0O1bGwwq
         LC46x6UeiOYUDjyCDYDrw7MnvrjbBqLoULy0OUOnYT7l3mwwMv+TtAitY5JMOCa2TxtH
         FUK1PmN/9DksNUyju/iLtnYAGZ3WjjszxTqEUIEKDiHnAas3bdC/UNrtURj/A+XUm6UQ
         6X0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=pkHvbKwiU4EqPm9mQdr/8i5WsI7eNKc9PxspeAgBYRI=;
        b=Z+KDMUOA1n/vmwPfD5Id+I//S7xUkhB0tar/YuoV/Oar2n8T1MeEI8D/lkncmkRjhu
         44cK9FaHSNhTSm+GdYLVyO7o9hDlUQ5e2aQPnWuVCEuyomKLf0guZcxKRlnolTfpbQN5
         Bqr977I80zdZZctC39bwL6oOWQUgOT4/5miSoxoaEb+u29I9+hjs3YMOrpgTQ9kBWLxq
         Nmp4Y0uUkPcPkMV9XnDCEysSWuanHYazO2R8031CqUAZDIKh7Ox+KvsIDiJVqU5ot5s9
         D714z/6gK2we+r2Yy+UdpDj6Pq86kOEiiF0Hb7BuXTH5wj0XtvsOiPls133u8Tre2JbI
         hx6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si4226110ybo.316.2019.03.08.03.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Dvy-0008MG-4R
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:45:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvR-000847-UM
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvO-0004sQ-Vo
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2244 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvO-0004JS-J9; Fri, 08 Mar 2019 06:44:26 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 12D7CAAC261A0EB052F2;
	Fri,  8 Mar 2019 19:44:18 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:08 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:08 +0000
Message-ID: <20190308114218.26692-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v2 01/11] hw/acpi: Move constant definitions to
 header files
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7TDVJPO4lUVy

From: Sebastien Boeuf <sebastien.boeuf@intel.com>

By moving the definition of memory hotplug related constants used
by ACPI for both CPU and memory, this commits allows those to be
used from  other parts of the code.

Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/memory_hotplug.c         | 26 --------------------------
 include/hw/acpi/memory_hotplug.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 921cad2..a6beb10 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -8,32 +8,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-misc.h"
 
-#define MEMORY_SLOTS_NUMBER          "MDNR"
-#define MEMORY_HOTPLUG_IO_REGION     "HPMR"
-#define MEMORY_SLOT_ADDR_LOW         "MRBL"
-#define MEMORY_SLOT_ADDR_HIGH        "MRBH"
-#define MEMORY_SLOT_SIZE_LOW         "MRLL"
-#define MEMORY_SLOT_SIZE_HIGH        "MRLH"
-#define MEMORY_SLOT_PROXIMITY        "MPX"
-#define MEMORY_SLOT_ENABLED          "MES"
-#define MEMORY_SLOT_INSERT_EVENT     "MINS"
-#define MEMORY_SLOT_REMOVE_EVENT     "MRMV"
-#define MEMORY_SLOT_EJECT            "MEJ"
-#define MEMORY_SLOT_SLECTOR          "MSEL"
-#define MEMORY_SLOT_OST_EVENT        "MOEV"
-#define MEMORY_SLOT_OST_STATUS       "MOSC"
-#define MEMORY_SLOT_LOCK             "MLCK"
-#define MEMORY_SLOT_STATUS_METHOD    "MRST"
-#define MEMORY_SLOT_CRS_METHOD       "MCRS"
-#define MEMORY_SLOT_OST_METHOD       "MOST"
-#define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
-#define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
-#define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
-#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
-#define MEMORY_HOTPLUG_DEVICE        "MHPD"
-#define MEMORY_HOTPLUG_IO_LEN         24
-#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
-
 static uint16_t memhp_io_base;
 
 static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
index 77c6576..fbfcbe6 100644
--- a/include/hw/acpi/memory_hotplug.h
+++ b/include/hw/acpi/memory_hotplug.h
@@ -5,6 +5,32 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 
+#define MEMORY_SLOTS_NUMBER          "MDNR"
+#define MEMORY_HOTPLUG_IO_REGION     "HPMR"
+#define MEMORY_SLOT_ADDR_LOW         "MRBL"
+#define MEMORY_SLOT_ADDR_HIGH        "MRBH"
+#define MEMORY_SLOT_SIZE_LOW         "MRLL"
+#define MEMORY_SLOT_SIZE_HIGH        "MRLH"
+#define MEMORY_SLOT_PROXIMITY        "MPX"
+#define MEMORY_SLOT_ENABLED          "MES"
+#define MEMORY_SLOT_INSERT_EVENT     "MINS"
+#define MEMORY_SLOT_REMOVE_EVENT     "MRMV"
+#define MEMORY_SLOT_EJECT            "MEJ"
+#define MEMORY_SLOT_SLECTOR          "MSEL"
+#define MEMORY_SLOT_OST_EVENT        "MOEV"
+#define MEMORY_SLOT_OST_STATUS       "MOSC"
+#define MEMORY_SLOT_LOCK             "MLCK"
+#define MEMORY_SLOT_STATUS_METHOD    "MRST"
+#define MEMORY_SLOT_CRS_METHOD       "MCRS"
+#define MEMORY_SLOT_OST_METHOD       "MOST"
+#define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
+#define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
+#define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
+#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
+#define MEMORY_HOTPLUG_DEVICE        "MHPD"
+#define MEMORY_HOTPLUG_IO_LEN         24
+#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
+
 /**
  * MemStatus:
  * @is_removing: the memory device in slot has been requested to be ejected.
-- 
2.7.4


