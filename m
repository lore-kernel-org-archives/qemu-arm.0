Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5902751wrx;
        Wed, 6 Mar 2019 05:38:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzlnfPPrrPf/9dOLb64+e9ix+mn2VMODy7qQdnVJ6EIuxZaATzt2Y/fQl1lW93S5Hl9keW
X-Received: by 2002:a81:142:: with SMTP id 63mr5492092ywb.119.1551879511882;
        Wed, 06 Mar 2019 05:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551879511; cv=none;
        d=google.com; s=arc-20160816;
        b=D8ubQ/Ch53UNyIyg04OKnDcbx4/qknxG28Us/OUXpsxuXhdoPfu3IxungeKKQQM+5M
         MRN8Gy9qjIDLpYxAOY3YmEfOQuT14e+Y5hr4+vJtpjRYjOQGaDuLgT7sofeM7DkR+w0L
         Q0hQI61FlFIM1UXV6Nv/XFqNaU8rP8OKqxF1DD7YjRcD0Vin+fgHdR0LuUpSqio/zHHM
         vUR2s7b5gns6J1zK5elnhjk0tu1zfaphD2Kd95Kga1ud9agQyZSgPR1OUUscE7DZoNCN
         AQrqHUPtmz7fP/lMMrwDnGh3jeHn+cHycZohHrCf5uFt+KRg4q1zjU+6nmi2QpSQTqKV
         sP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=aMyYYgtZpdTJUkicnMl/4wq5kGyyz3i7xi2zTjO5/d4=;
        b=0w9RO1NvSPT4TFq0E7pN04GaBwP+JjkCUt7Y9li3Q/MdUSvZeBZiIzD+/0yyp9GnOm
         dR8kR9DrOEH5ZMrN1bBT8o+wb2vtBLVAli8/+6HcOKJ/0UFS0aOMyKcZ7QZ03m8YYsoM
         eRgk27pzRPiYknP6Nm8hgwF+99VSvIEp6ll56lUTcoALaQuw2i7S1Ioe/aZu2FaOoE6L
         oSmyXkVn36WqvkXVfhgqyqtfJho5Lj/gwZ8A82fz45XD83GJ4U2KQSSWECKpypMFh+3a
         TfVifHLu56cJpmoPbw9naZlSjUOjfiPi7IAK0K7Q2LZXIX4r0fPPdzyzLPmYh5AT/gix
         sDhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si839772ybp.320.2019.03.06.05.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 05:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Wkh-0008VD-AX
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 08:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1WkV-0008TA-1S
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 08:38:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1WkU-00026D-7M
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 08:38:19 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:39376 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h1WkT-00025n-Qs; Wed, 06 Mar 2019 08:38:18 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7FD62F3E4F9FCAC4A929;
	Wed,  6 Mar 2019 21:38:15 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.408.0; Wed, 6 Mar 2019 21:38:05 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 6 Mar 2019 21:36:56 +0800
Message-ID: <1551879417-21031-2-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
References: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 1/2] hw/arm/acpi: simplify AML bit and/or
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
X-TUID: zc2Xe+QAEv/e

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
 hw/arm/virt-acpi-build.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7e2e48..cebec4c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -265,17 +265,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
-                                aml_name("CTRL")));
+    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
+                              aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
-                                 aml_name("CDW1")));
+    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
+                              aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
-                                 aml_name("CDW1")));
+    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
+                              aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
     aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
@@ -283,8 +283,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(method, ifctx);
 
     elsectx = aml_else();
-    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
-                                  aml_name("CDW1")));
+    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
+                               aml_name("CDW1")));
     aml_append(elsectx, aml_return(aml_arg(3)));
     aml_append(method, elsectx);
     aml_append(dev, method);
-- 
1.8.3.1

