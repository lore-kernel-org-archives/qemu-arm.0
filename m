Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4780974wrx;
        Tue, 5 Mar 2019 06:09:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqy//qi/l+6vOkoEErkCHQiQ5p7MyfyxzHQSAJoYjQbKI1ftdhpwe3ZvVnOK0xZe9K/33TgD
X-Received: by 2002:a81:1dc1:: with SMTP id d184mr989620ywd.379.1551794994474;
        Tue, 05 Mar 2019 06:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551794994; cv=none;
        d=google.com; s=arc-20160816;
        b=dmKXVwzRwy2km9J8sv6x+wRn4h9NjbqnzC2aDP23nTnb0NqMRJCiHOTMWHp1cHA48s
         VZtNVrFuqPwwIT4GuGt5KpcT7WsEsfXIW/G+QpDX/4Phel86bABQXBRi4hEht3/QWRm7
         Ggj1Ems2ToodKEOwPYfxVzYm7t3Zwn9QBoFA6vDyz5WL+ffzxySYVLbEDDaMmi101tvr
         +bEmYCB1UXfMDDe2nSowW12xl4LdkSDlF3nupss30OvZWUCXzELF4V5pHRyjYF7qEPcV
         v3PEbNr8t4whbpEfJ+1iw2Eoo14St9K6KEJibu7AVsRH2VTKKhcUBQ5ATJX4Mz7iD/s1
         0HFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=a15SABd5TRPdbTpdloTtkEcCtOqVjcrdgKwa7NtSoGs=;
        b=aUUeh8DXHuD7Wn686faOxLk9DMF1Un/IKiyPQQvVo5+6Y1N1pXUplmBTSiZsEyhL2X
         Ggy/mwpU6qy3mfr4MoDmRbVNxmM2rnJByK67sWRx9uqdlKAUaYgoAcpvz7W+P+8XqQEl
         rUn6qV1MnrRdKk2icbBJsqEf2dfB0KMvYvPVxDVrVhT9BQPLd/yrogDxXd1WziEQJoPA
         LZp1n4KRTOO7D25guChm4XRPcJtswvSq5OqJqTPJYUGceF/Q+7uA3nqe8LGoDzkFZAWY
         rETt77PGOyljhvMyiLapVFhVE951cV2BQAm+AaS5MEYHcVWBIyd4Rth4CpQI5aX9gDlL
         jRZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si4949203ybk.165.2019.03.05.06.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 06:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1AlV-0006D4-RZ
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 09:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1AjO-0004YX-2Z
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 09:07:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1AjM-0005A6-5x
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 09:07:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:55802 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h1AjK-0004xa-51; Tue, 05 Mar 2019 09:07:40 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 47AF99BC4291B6982E15;
	Tue,  5 Mar 2019 22:07:23 +0800 (CST)
Received: from linux-PRbMHx.huawei.com (10.175.104.238) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 5 Mar 2019 22:07:13 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 6 Mar 2019 06:03:49 +0800
Message-ID: <1551823429-1440-2-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
References: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.238]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v3 2/2] hw/arm/acpi: enable SHPC native hot plug
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
X-TUID: szn+YtHg5guP

After the introduction of generic PCIe root port and PCIe-PCI bridge,
we will also have SHPC controller on ARM, so just enalbe SHPC native
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
index 1c84e87..e8e00fe 100644
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

