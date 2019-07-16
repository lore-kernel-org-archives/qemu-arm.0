Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1139157wrv;
        Tue, 16 Jul 2019 08:41:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGU1yQTBcTT2/ue8CD+XEgUpVezs/hgmbxb5m3NyezZ9uOwi4XpVSrSZHk7W60Qvri7wR/
X-Received: by 2002:a17:906:25c5:: with SMTP id n5mr25770856ejb.195.1563291677950;
        Tue, 16 Jul 2019 08:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291677; cv=none;
        d=google.com; s=arc-20160816;
        b=a1cFSvOkokZvJU0n20WyB9pfoHLAwkKXj+Ap9PkDERCrxkyweJgdxKGs0hy3i5ofZW
         vLhDXNQ+m0wk8R9SMuMxhzEKlxafmEItaH2lrOlsnbKj+sQY77zDlXs3SPW6iBdROvRG
         7rLVoFlDwlgkAX5VmY326yvdMI5XagbX4ZE8eV/XucriYME0X0oGAzv6yty+oRwz4kvp
         XU2fuKXWMC+4JOPMh/1OH0HE4F7Q//lOLnlGX3B6aoFBcF+6/1kS53+1KZR+rsImngqn
         lv+rHLTHbtmU5nEBycdBuR5H9V3LMdgDxeRwQMw51aTYbbPrd+ZgIeMzhNI75b9DzYlg
         jgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=rCWHrMBZftcnydBxe20riTAsROaY/Psm0j7VxlBy/YM=;
        b=hrYgAomYP9+ytrGVcjcu0Mkrdlp49cEbYLaT+JgaWbZBYKJLnrI9gFOMTJZ0FfGYX/
         tFNLyXzZksr++acbLX7UtYBj5KkCjtdnrAA/GBMttJZyku6f/ppC7LXXjZ3BEGRq2Aj/
         F17JVGr8JaFMZToWVeGNQv8/+i60TEYoZIToo5DWoKGBTzBJfPAsmH1rhHCU4PIGXfXo
         jjy00NpIq3I9k0URkc/VEJP7vGpg4oAzyFHrQdCL0k7VpAlTgw94pRwfX4GCqPtCJte2
         /OkJlhKfcu/MQqS/A70DUsQ8p7xhIpIUH2yDLGeQjMB5ElAaGO5BBkse8MWGFLT4XM0K
         5B+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si10791106ejr.264.2019.07.16.08.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPZs-0007Sg-9l
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZo-0007S3-86
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZn-0004N0-6v
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2235 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZl-0004B7-PU; Tue, 16 Jul 2019 11:41:11 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3D8A3E59FF59AFEC0BBD;
 Tue, 16 Jul 2019 23:40:49 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:40:43 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:08 +0100
Message-ID: <20190716153816.17676-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v7 02/10] hw/acpi: Do not create memory
 hotplug method when handler is not defined
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rmQF7ZSk6x66

From: Samuel Ortiz <sameo@linux.intel.com>

With Hardware-reduced ACPI, the GED device will manage ACPI
hotplug entirely. As a consequence, make the memory specific
events AML generation optional. The code will only be added
when the method name is not NULL.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index c724f5f1e4..7e30e6f886 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -719,10 +719,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
     }
     aml_append(table, dev_container);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_call0(MEMORY_DEVICES_CONTAINER "."
+                                     MEMORY_SLOT_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(mhp_res_path);
 }
-- 
2.17.1


