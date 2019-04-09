Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4556426wrx;
        Tue, 9 Apr 2019 03:31:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNBjllDdLMAWzne1KYW3feS4jillmOvyaWVtofqzqbCfRkL6gsvAn3sHJr3QWEVPxEac9Q
X-Received: by 2002:a1c:c186:: with SMTP id r128mr2325665wmf.100.1554805876109;
        Tue, 09 Apr 2019 03:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554805876; cv=none;
        d=google.com; s=arc-20160816;
        b=QPEF1mtAjxp2IT1Xp/3sOiA1Ew5X6kZ7Fw0QRtwkdwGxnQRBcJ824V+I8px2Gg+GME
         Z7IixzEycTvT+7O96m3DxiOIivtuM00kbp/ohxEi/qMUNqBc5YZUksdRZGunFcZejaVs
         C+bXB49nYKa0yRQkquKKRUmntNqaFweuncVbaKEVqFWqR3TkR9J/gBxgCoUDQML4yRQl
         Y168kvtytEln546vwIfOZ3CkLrWCFPdKWaCIKq7fnD34T+TVmZzmjblAg9cR7kibKIQC
         6ODUJDikC5iDs+yvxRA+5sV17KJg15HtXFUpfHozQuJF2uX8D3NMozSVA9ZtJSS2f3Vu
         XgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=a4JvsG/ZxGRpum2TQ4MP1GWSlM+BI1Q/uwNiQ0wAw+E=;
        b=D/tYGiM4Z+Fnwcmj0+gLHNlyVVQDHJiRoFIBuNFrquMhFCRQgVdQjZadrKgjY+lGB1
         4RtmFu7rkRzxAxIFEJ+ypDnm5o6j+d3Q620+ALea15Hd7AFNNpympt+qy+VzumJQ251I
         hq2XgFMyXz5/X96emTGehaFxg24EMaiewYyx8xJVP0Qn8WAzqOGsG3YWU7Wrjun4OK/o
         iKgB8UXv7QmwnG7Nra6zst2WDeGjWrHsa/WsemaZ09sRusmPVjQ6hLF0TeXCR1a8W+sY
         dJWUt1LloSY45pG64SW/G0qsRfvy1dWDDItnLfgWHejfo9JGbkZ6oYY9X15aZEZnX3kL
         /C2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i66si8709763wmi.36.2019.04.09.03.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDo27-00063b-5K
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:31:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1t-00062W-41
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1s-0007HF-6O
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2260 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1r-0007Gc-Pd; Tue, 09 Apr 2019 06:31:00 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8704FE86AAFF382C5120;
	Tue,  9 Apr 2019 18:30:57 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 9 Apr 2019 18:30:47 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Tue, 9 Apr 2019 11:29:29 +0100
Message-ID: <20190409102935.28292-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v4 2/8] hw/acpi: Do not create memory hotplug
 method when handler is not defined
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6zsYjll0PWiC

From: Samuel Ortiz <sameo@linux.intel.com>

With Hardware-reduced ACPI, the GED device will manage ACPI
hotplug entirely. As a consequence, make the memory specific
events AML generation optional. The code will only be added
when the method name is not NULL.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index c724f5f..b74a5e2 100644
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
+        aml_append(method,
+                   aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(mhp_res_path);
 }
-- 
2.7.4


