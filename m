Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4778567wrx;
        Tue, 5 Mar 2019 06:07:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrXs5imRcyXHC6HMdE8mU0dYjn+Q2yj+te9X/InI0bLBc9MvhMwKVcPlOXoT7VGfCP2bAm
X-Received: by 2002:ac8:27ba:: with SMTP id w55mr1542470qtw.228.1551794864625;
        Tue, 05 Mar 2019 06:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551794864; cv=none;
        d=google.com; s=arc-20160816;
        b=mgOmN3eSm9iC5ylGMxK/0vpCfaZSA4D/7gnJr/wX7PbdzSnFit0Q0P9y8sMsN4ZYM6
         kDZEkb4K5cEKIvd29V7Z/3PovKnR+uO2FLcK16c9i7Dl+GnXUzbj+6ZoHZ8p1ftWANwL
         ysGZNmEO2mWhv7wmtzxAYbLH0695HeVjj+ZRFuBD7nFwNNBjUiKHxnDNKnSHn8+OPNvs
         MhwgtDxIoctF3BZuO5Dojp9t76NuXpZmXsvX9RynLadANDr1ZJkvGkXEQEVLODkpMys7
         dhLdnceUu71JVinBAC803MFlNVdoA4U1R6Y3q5D1Pa7ojC75hKcHm9zVEPQymL/0jpW1
         kL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=m4VWFZWebwI0WXSD3J+0k4meNBuxp6SrdO2KpgEqFZ4=;
        b=CVvWv+X5AIVFfFl+f0DES5B1mRRe55M8y1U9OXNE6PYHWXX1wV7g+ji6bcDXzMcxqd
         DQmKqELVtuhC/di/cGZYJ8RlxGEbV1Lhnb11nJ2yvX1ZQQH6gL6/5YB0sU4Sq6AZgtoz
         zGLiy/O8ha09wrZgQ1zbSmoElE1AooREtXB5uRU8f3UDaXR9ZUuQSXQY26UwqpeOeXH/
         W/19SCqFKl6cIfb8s1EG3CwLKdn8jH8CvJk0HqXnyXyx75eQAKaWE1sOUwTdXIknE+nK
         Q6zF1qCjD2w2PAqXy++IFXSAUZd9GOOEaxpidJVrHIcbIZhuuLX4oQafJy0ebP6iXng/
         ZNiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si1878872qtb.376.2019.03.05.06.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 06:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1AjQ-0004Rm-20
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 09:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1AjB-0004Nq-RT
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 09:07:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1Aj7-0004yO-Hn
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 09:07:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2242 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h1Aj6-0004ub-4X; Tue, 05 Mar 2019 09:07:24 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2EE63389EE66090B6BBC;
	Tue,  5 Mar 2019 22:07:18 +0800 (CST)
Received: from linux-PRbMHx.huawei.com (10.175.104.238) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 5 Mar 2019 22:07:11 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 6 Mar 2019 06:03:48 +0800
Message-ID: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.238]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v3 1/2] hw/arm/acpi: simplify AML bit and/or
 statement
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PGV+FGP8GJDV

The last argument of AML bit and/or statement is the target variable,
so we don't need to use a NULL target and then an additional store
operation; a single bit and/or statement is enough.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 04b62c7..1c84e87 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -265,16 +265,16 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
+    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
                                 aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
+    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
                                  aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
+    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
                                  aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
@@ -283,7 +283,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(method, ifctx);
 
     elsectx = aml_else();
-    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
+    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
                                   aml_name("CDW1")));
     aml_append(elsectx, aml_return(aml_arg(3)));
     aml_append(method, elsectx);
-- 
1.8.3.1

