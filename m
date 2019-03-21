Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp96310wrx;
        Thu, 21 Mar 2019 03:54:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxseUWbQvg+O8dgJT1z00HpkS5vJz5D5lj0bQe+5ViMpM2B2aEVJ3iRqQiQ6JMtjfl6vSDy
X-Received: by 2002:a1c:ef1a:: with SMTP id n26mr2109135wmh.67.1553165683317;
        Thu, 21 Mar 2019 03:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165683; cv=none;
        d=google.com; s=arc-20160816;
        b=Bdpk3UYjhSGqmUir3d2IoTCjTdn0ZE34El3bMMglKNCipdU8nerhQ8O44wtuQGpVsm
         Yqe2CTNoSYGcQEvFV61jnjRdZ62D7ZKM3p9h8uH/zO3DI7wuoplJl2kaSNrkfn5snzTq
         gsvXE81+2xn6YgjSpAj+LqnKSSo82FfRM0P+2RxGgZ2kPg8cTOs0icdiObX3P1uG/GfD
         TuIXvU1+p+4qqOng3iq89q6tFT7NoQWzb4x4/lLDtl/0FQIRvC4q0qcEpJbjMyYn0phI
         B5nKu+Aenz9rFj7L/CtSzZY89krEJqmOMLhenbDbbo8DPyx4O0zgH+yFu+qd2stXfv0J
         VMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=fKctV7GUD3Uo7WpHZwl71IY0iimmutABw+rl8Ebg4u4=;
        b=mo5yuI6M2kj1C1OSCaS1PhiAISTpfYj4SzlLMxiyFlOBxIbCDnxFE+GX9v/iSoiBHQ
         35hF5TxPmrr9lQAHEUGGNzwWWieY89gzaQi/wswEQKITD8CB+ryP/N3/SR58OnNJR6FP
         yrXOvEOUCcYz24dZ7SmCmPENrHFXRahieEsiP+CwvsgL+iSz+Ip39vnTCHMkyIRVqZUi
         OTHuxGUhp0DoPIs5g18NORBi70sKdaXibXy25mfgWhqCLgipAPno05hFESyhKgoQbNnF
         hZEFMtQHfGxkpPCoMPynbKNeajkRybH6TJWS7WxBPaZghCPmo3/xBsTNevaRhKE4QCiX
         e7hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si3126830wmh.144.2019.03.21.03.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vLO-0007JL-B4
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:54:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHm-0004XC-9l
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFq-0001M1-TW
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:48:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2196 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFp-0000pF-85; Thu, 21 Mar 2019 06:48:57 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 86CEB75FF1BB59E97E57;
	Thu, 21 Mar 2019 18:48:52 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:44 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:37 +0000
Message-ID: <20190321104745.28068-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v3 02/10] hw/acpi: Do not create memory hotplug
 method when handler is not defined
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8lFVjlD63kQ

From: Samuel Ortiz <sameo@linux.intel.com>

With Hardware-reduced ACPI, the GED device will manage ACPI
hotplug entirely. As a consequence, make the memory specific
events AML generation optional. The code will only be added
when the method name is not NULL.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 80e25f0..98407e3 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -720,10 +720,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
     }
     aml_append(table, dev_container);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method,
+                   aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(mhp_res_path);
 }
-- 
2.7.4


