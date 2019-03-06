Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5902986wrx;
        Wed, 6 Mar 2019 05:38:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgfaJGZU5OfOkRHH09t43tCreOzC0jkJepGvQorlmQpZ7ZJSeSTNXOBUR90DgBpK0ZOgyW
X-Received: by 2002:a25:2005:: with SMTP id g5mr6702639ybg.54.1551879526946;
        Wed, 06 Mar 2019 05:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551879526; cv=none;
        d=google.com; s=arc-20160816;
        b=MB3iz3YBPKgVvgOW7SOfPca3a78gP9ho3mjF4UUTNJwS5jjpg5B06iVJRYuZboscWH
         6mLAt+RA+5hhS6ZiHWJ/S9Yxwmas01rRvCan9wamm3SC6Vqy9+iBOOIov9Z0+B6MADI4
         QvHd8NQEeI2bXMcSr7nRx78x5hjS3CoGxSJcWqfG5/H78e5cCNj2bIseRX6gSfjj+YBA
         yIi2WeMMehPCjSoP2JlvMVp9YtkfwOYVuU9/Ryz8eREOp0+6OCJfA617Mb6LIUnohh+i
         9TJu/+o3OaFV/m/KpwiaPDfmvYloaFVKQi4xXwwTjgMEJUqnGcEYEmq/HCrQRZLPW6MV
         Wznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=p8yT5y5m1NQ+wXfIhAnRH+Quin4k6Y6qWNCDVtXv6S8=;
        b=0JSgTMKVtkSIgab0HZKYWmnhDINLMmkdbDm9FpDJrIagdzIQ+EMXBWvJy03vquVr+V
         zF/+BajgYnzc0aaYNzHrmepi+BQvWXhd3/CubDrONESLQO17c8PY5sFUoMyB9plmk+fI
         TaoS0NVZtTIp5cFswu2qyvbtHyctEYru01Jo3HEfjOmrauwjVekwfvi2NBNoNHTc9JLa
         XH0VtuWbxi5I0wuEuR8xSkt6IR1xLUjopE7FgTtWu6a285vwvTjIxA3fVjQeKPYzUqiu
         Z/D3DbDt+P4SiEeaHIAFe7FwbOAaCmA/YqnFX5BdIlovuG6QhJqSH9nJGxlx8XUccGXu
         jqnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si809342ybz.286.2019.03.06.05.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 05:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Wkw-0000Hw-CG
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 08:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1WkV-0008TX-7e
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 08:38:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1WkU-00026J-81
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 08:38:19 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:39378 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h1WkT-00025p-Rw; Wed, 06 Mar 2019 08:38:18 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 8540621EDEF431968BDC;
	Wed,  6 Mar 2019 21:38:15 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.408.0; Wed, 6 Mar 2019 21:38:05 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 6 Mar 2019 21:36:57 +0800
Message-ID: <1551879417-21031-3-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
References: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 2/2] hw/arm/acpi: enable SHPC native hot plug
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
X-TUID: vY6C+UnpQTVC

After the introduction of generic PCIe root port and PCIe-PCI bridge,
we will also have SHPC controller on ARM, so just enable SHPC native
hot plug.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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

