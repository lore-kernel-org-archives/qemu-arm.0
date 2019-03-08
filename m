Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8268312wrx;
        Fri, 8 Mar 2019 03:45:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwR/PN25LQ1H8SgTxtAHGYV4vqC+5nXh17lCW3QJe78M4UJpeK21EcsO3Xj07ZTY5knk6Po
X-Received: by 2002:a25:2c92:: with SMTP id s140mr15398458ybs.181.1552045511073;
        Fri, 08 Mar 2019 03:45:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045511; cv=none;
        d=google.com; s=arc-20160816;
        b=egb31W92FCEt1iT/OSpvgH4Z6ZH6ZlHnpsveSDTRUCtQhwwLEu0WocUam3Y6HhGsZV
         6cqaKuVwBVdmE1RytT9+m1pXMFdWsdDpcu26cWq9UuAIkX9KppsDtrTnyOfWS6Hc1h4Z
         CLDqRdwBQMsIQXjQIl2XI3Olo+GZw5oU/7DNV7fu6lpyqp2NVOChYZEkCRi17afViPJb
         Nzn6lgZhdKc455IGjkpy7DlBndLB43Tog9ttNGYytZl80EclQah+F974FZ0caHdGTgsg
         gxCa3vkz2eg/5rKMZnLS1Vks4sxaNA2arJbSBjotD84mXhs4lr9qMdj8aBBn8e88/PzT
         gVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=XqdpuubfZOx9kPn17mfDNAqHMU4Y0N6bN887XjNCnD8=;
        b=aKLIy1xsf6pKLRf55aaFRv9A4rEBx9+hnOL2QBn6xEWMXBpDMctn9ysToSjHH9izgq
         5l4+pMsDLoC1E1j2shID77gnCJaqOA6DaHfDWnNmktt1p0VSE7gnuhv6eltvtO/y8Mce
         8rHCQIKrGDQboxsgvPW97TwBuTCJvdITKM29GJWg4eiujif7MJxDTyc+zVOzXdpwiEP1
         VTLJXeJ+Ax2yYV0reOii/a0kX54DQkRkqb3zP2maaAJAc/zArvk3rWg4uhbGfGTHfksA
         SeJnURZCLNNsIn21JVjql2ruF8PdOyLaTxFX3SPbwCIflMg83p12FlAvpeDbWzXxQwbg
         cdqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n131si4579363ywb.412.2019.03.08.03.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:45:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Dw6-0008JF-DZ
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:45:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvW-000873-HQ
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 06:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvU-0005KZ-Pc
	for qemu-devel@nongnu.org; Fri, 08 Mar 2019 06:44:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2188 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvP-0004eh-Qt; Fri, 08 Mar 2019 06:44:28 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 16FE1672FD91F0642A08;
	Fri,  8 Mar 2019 19:44:23 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:14 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:10 +0000
Message-ID: <20190308114218.26692-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v2 03/11] hw/acpi: Do not create memory hotplug
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
X-TUID: 6yh834QVd617

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
index 77ff0af..b138bef 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -695,10 +695,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
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


