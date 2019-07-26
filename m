Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11749085wrv;
        Fri, 26 Jul 2019 03:46:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzPwHyM1e0WVNO7uiIbKb/p7q6MH9U0MeIsfkuBOhvgCLjm5Ck+OChnhGmD5i3iBqGcyI4
X-Received: by 2002:aed:3ee9:: with SMTP id o38mr64882552qtf.193.1564138004828;
        Fri, 26 Jul 2019 03:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564138004; cv=none;
        d=google.com; s=arc-20160816;
        b=X4igMMZ2xrKxB9G4mNEfX62YMSLql79QBF7tIy6lRmpVWjynqm/KdGxIZqKfY6VmCz
         IDcsk9m5kaR/gG10le0T35X/7alildk4HhYpYnCaAO1MW6Nmcu5OSSdi/C1/ElJyE4PB
         3IqEQ5yI38YUIO5mU41oUjtRWeS6AZ9OlTzh3Svea0H6wvs6FqaqfJZ6rzU+VVfO45sQ
         aAmf4ZVLY6fCXNfBxhd3GpNflx3n3ndxUanvBYlskXosF3nVAa31FofuHJbZGqqHzIGQ
         MDMj3ufIEe89rxuFS2ZEskQSWYacsCpW8ByGLwxGoR2Pzspd//Jc+7kqpySNSvhLv+GR
         YfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=rCWHrMBZftcnydBxe20riTAsROaY/Psm0j7VxlBy/YM=;
        b=suYXTVRzJRF8npdo/+ZV0FZ26Lufrq9zOuwLNIKGs+ASQGAdx+4ydkNco9qHlgrW/d
         qM+H42XD1XT7mjubG9U0Rkj+XlE/mFTUoK32P/5P4B2SSMJmnojalJkrr/RNRsP4cR96
         TYbMXiug7cLbgkmTKYWD80MKqG86Szi8AjDbF2XidUq5BYqlaBhCvuDZIpyTubivl2Xc
         +oDc3y53oHjybHpUbb7OMGQxc0ACSOguneB+rSJFOEPbHOR04jRDSje/gGYEXyO8K17+
         8CKwga5WkD7uiXGNP81YZ7t3FPSEcWk6yhPV93TjNrcXQzZMaAiUXY3vYPDPi+beFZji
         Uddg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si33900635qtv.201.2019.07.26.03.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqxkF-0006cc-Di
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkA-0006bW-0f
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxk3-0005ex-U5
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:46:31 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxk3-0005C9-HO; Fri, 26 Jul 2019 06:46:27 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E92EB5B47EB6A29C04DD;
 Fri, 26 Jul 2019 18:46:20 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 18:46:12 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Fri, 26 Jul 2019 11:45:12 +0100
Message-ID: <20190726104519.23812-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v8 2/9] hw/acpi: Do not create memory
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
X-TUID: Zf5+n0aHlXI+

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


