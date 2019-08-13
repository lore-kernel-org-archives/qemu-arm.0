Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp30521wrs;
        Tue, 13 Aug 2019 14:07:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwXi8NETSBc4u94+HUom6AB5jJQKiXIpesEFt2h6zfhbNSat7+5es+z5SdAYtKh9/9gJIE
X-Received: by 2002:a50:8687:: with SMTP id r7mr25885745eda.137.1565730449300;
        Tue, 13 Aug 2019 14:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730449; cv=none;
        d=google.com; s=arc-20160816;
        b=M/AxJAWBxuMpJN/IBMYEThsCD5vRg61X1H6o3Q0oDIMN599HQZ9sa3f2WIMo+PgL9M
         hhOBBipmY2xkpTZ7brrziY6QmhyX0z99inC7Z/hLkfqDigtmuw5AnwyOs0MnRfTlNR6c
         +f12aCgADImnpDvNf5OYa66KbVXyQbATeW10CYdbdPYMwLgE1JQxgETe6E/HpAZT4hiJ
         J/xdHcd3RPu9JihDpIEITz6i2q5PsOBZVXajZMAbC13pRcSoTJeNc3/mOLFj8JS194ah
         rqpVX0dCKkUN3OgoaR7Xya7EthUeC82j6uq6BEQ81Aif4n6aYNpL9ewiv7k+t1B/4ZzT
         1qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Mr1ezuKYoxi9xD3uOq/jX8oVxNnNpcd1PW9SAOmoapY=;
        b=nCb+IavrCoOKYRIvPwcWpbNkwXpepKIJ2ZYbnaPgRyP7UOV5/YhKdCqdrc1Drw2TCu
         B35/Wt+GzgeE2uaUV6lJnMcWRQ/bHPIo7ZAp2dscS9mejj6ZNkx7sAHVGqv8bn8rnUk2
         qiWxJZGekX5NJzn3PSYSsdGNUiqCYDGj0Obl2+RbtbR1cZ0Vph1Tlgop4PNycHeLKYW6
         OIGjUPse/uU2szRQ92vxJnXbGMKQNyxoaMAXMHOmP+aLTp8cVIoUHIY314V++mC3VvWJ
         I+S8VEawNNGA9Ke0lx1xKi6bmfwk8A0LJkphSMnWHctuBrDfRRBA+7KIIGuYprHtaAQi
         JFeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si3938370eda.146.2019.08.13.14.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe0u-0004Zf-CW
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41577)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0m-0004ZC-Vs
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0l-0000xT-QB
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:20 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2252 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0l-0000tZ-Fm; Tue, 13 Aug 2019 17:07:19 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D986516219B64C76B000;
 Wed, 14 Aug 2019 05:07:16 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:10 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:29 +0100
Message-ID: <20190813210539.31164-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v9 02/12] hw/acpi: Do not create memory
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
X-TUID: 19zQZOFx5GB2

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
index 1734d4b44f..552f60a716 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -715,10 +715,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
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


