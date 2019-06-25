Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4912805wrg;
        Tue, 25 Jun 2019 05:37:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwB4cyAuw14Kh4ul03vdjHQaw8dvNyc6vV5K+gg66g0LZtg8RwyPAmJXp3baye1LV8Dw5If
X-Received: by 2002:a50:be01:: with SMTP id a1mr54163863edi.287.1561466225137;
        Tue, 25 Jun 2019 05:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561466225; cv=none;
        d=google.com; s=arc-20160816;
        b=X8tUWPgq7eDTHHTuoodQszxM6bK6dzcDzJeTT4sbl9lHHDkhYlBkZpW0VG4EPKymU4
         tM9yVjwFC+ZSk8JY/Dxd/d4aH2Ukki9eLFcSxlfkoVVgs+WHTHvjX3edpvZ74RhzYfxC
         hGv7Ehv1v+FXUF4bT11JmnI3sBa6Y8Z1Vf9o+lUEjiNp420PmTQB7p0mpJm7wo6KB3Iy
         vTbDIuD6H8+p+FZk2zr+delIxlpw3ubRK0f2WrkCPAgzJ93aTVzCdYZNCQIoRMsTMlcD
         TxO1NW/SkmLzIIb9eiIXc1JfiYPuWuqwxB1wnEqz/8pFRq22QY5Lyc9do3U9l2Bc+PrA
         sfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=rCWHrMBZftcnydBxe20riTAsROaY/Psm0j7VxlBy/YM=;
        b=TmbC8qjWhdpw3R7zoJfUAQf/WPqhVKuSKQrdJ+jA2pl3aS6NaAjspExNPwKwCKns5P
         vDVyi4kB+A7/EPBhgRSItAzIMdBgQoEAZRwELvQkFi4s13018dtF6irpNIYNn5y2CjZW
         E722vdg9/N0pVW8PyAzU/+tjVIThXBS6KQj4ZwLxAvuMX8wSOD4Ur9JmKulXHmaI2dG7
         5ss1bCjnaZgnR4XRN/JgvNUpaUFHMK/QAWzsIIW/se8FZ5lxsBBQxGQXtIfLvI5nTqI2
         iC8wa1LZl3LEzHVw0E7kbmaNqKzvDnZeA8y7RXdAAC1vdZ1Gir9XCoCdrLp7HAGSfrX/
         npSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p23si255053ejj.55.2019.06.25.05.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfkh6-0003WL-5i
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 08:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36274)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkMh-0007Bw-C7
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkMY-00048L-Nr
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:15:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2179 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkMT-00040C-1W; Tue, 25 Jun 2019 08:15:46 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 64560D0D11A5D8470602;
 Tue, 25 Jun 2019 20:15:39 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 20:15:32 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 25 Jun 2019 13:14:15 +0100
Message-ID: <20190625121421.22280-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v6 2/8] hw/acpi: Do not create memory hotplug
 method when handler is not defined
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +bqd3L4W4gwO

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


