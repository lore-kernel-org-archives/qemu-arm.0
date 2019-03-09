Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9054143wrx;
        Fri, 8 Mar 2019 18:32:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjkNehBovrjHXPJHhRwoqC+s12REQSIbDbIOVndDXK3Ch5UZQ4arDWY6Jgw2x9uAryHRdX
X-Received: by 2002:a25:ba87:: with SMTP id s7mr19224719ybg.49.1552098760519;
        Fri, 08 Mar 2019 18:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552098760; cv=none;
        d=google.com; s=arc-20160816;
        b=DAHZYcrYou6EZ4f8hZPELwdYWRhDLEIjeNEexta0ghHopXNuROrLfU0vaeiLRxWY0T
         lTRjurh73whIwKYbz8CcffBWAVR0cj6uFZI0QAGpIyUp9kYhjF1PXXzvhKpN29RK6Geb
         wbvI/nn90ywm6ddtd3bPrw9/0FBrpMPLOddsnM77X5J08S5uIlb9O667Vtn/Efw+xi5Q
         UrIHORyfEeSoH+UbS6fcLZHR9MCvnQ3FTahBjO/iUve6S8Nxn79hTpwM1UBpVMAZq06E
         XLVcSToVJYUOZxBGcS3kLkEE1n0zomN+aEiAozKZn/bblEsu8UabqG3R+LHL9WTV1SuI
         Tglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=aEHBetEWIsuBKaYslVNWh6iUCa4n1U+nTrt9WtS7CM4=;
        b=CjgC78yiGPPzFbTuPgyoNX1ZqWf2wPoUfHQSsKpRmlx9Wam97BYwpBMOLTnvUcRzNe
         ppN3biFbSyIZqzrPF4ZHoONnIzqMyBNIN7pETeybb0+ZqESVdR2xjSBxWlB4eUrFrDei
         pTtbD8sy+gqAeYE2fAsPFi5/PI1wiPFj0H2FLQtW3WGle2wN7l9jigWgdYxolqCtYTwd
         k4qpOeHO4jiE8I/qAFOMPNmDN9LuoRoET5AeSfBLXciEnnAbo7+lCoF6EOzdBlynm7D3
         H4cOeifswrWWPxjwlCX0XbETi92DHfZTlNv5GvSOydGW/UaqT3E1jwg//iMT8ogKF0Pd
         kYcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u83si5369570ybb.19.2019.03.08.18.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 18:32:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Rmx-0000m2-UB
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 21:32:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2Rml-0000kE-N9
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:32:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2Rmk-000531-Rw
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:32:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40330 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h2Rmk-00050o-GH; Fri, 08 Mar 2019 21:32:26 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 369CFCB4B16D90A6B580;
	Sat,  9 Mar 2019 10:32:24 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.408.0; Sat, 9 Mar 2019 10:32:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Sat, 9 Mar 2019 10:30:49 +0800
Message-ID: <1552098649-28341-3-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v5 2/2] hw/arm/acpi: enable SHPC native hot plug
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
X-TUID: xJxAXu5zLV7z

After the introduction of generic PCIe root port and PCIe-PCI bridge,
we will also have SHPC controller on ARM, so just enable SHPC native
hot plug.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index cebec4c..b6fef28 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
+
+    /*
+     * Allow OS control for all 5 features:
+     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
+     */
+    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
                               aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-- 
1.8.3.1

