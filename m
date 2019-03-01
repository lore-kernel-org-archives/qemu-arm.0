Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp119081wrx;
        Thu, 28 Feb 2019 18:29:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFAc9P8wdIYgRnagUbTr+Pt1Yht0aLJlCNBDp+x9Pmm4NpJsBJS1+8ze1ScmGw5zIThSQA
X-Received: by 2002:a81:5509:: with SMTP id j9mr1810275ywb.409.1551407397245;
        Thu, 28 Feb 2019 18:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551407397; cv=none;
        d=google.com; s=arc-20160816;
        b=mLCamcrS5bnvJTkZxlyqc64e5o0cIdFbjcYSh64FIpf8tRxdAzNvm6ESM7CMgbubUR
         JC7eZoRvf0crPq8tbc2n+yfzc8yLYvMI3UEK4ePxurP/AlzxvCLRS/x1RtqFZEphOF7n
         EFQn6B7bI4XS66sgU+ON/03bPyzsvrew2q4IoLn8Vb9YXW9x+zcvDuiJ9HBlu6w5K9Xw
         N6V+rjo2ZagXDIMfBL8AH5hFCvrQudv5/3WfL9mE4gDfkqDUSyYkvvQSw0f9ukIlA19v
         HaFe0DSZ2nk1AeZZuB/RLn/h4MXLr02axdCTDZt0fj6DCel7xZX/9O0TkV5xXmVb6IY/
         6vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=ELBVLsNIt4g5zI8Y1Kz92EzLbv8njQ43KQf/QC0Uk1M=;
        b=gOQ8eCh3lPtwsFJo/AjL8monWPH3IvTX5ZCBOLiBAjtHKNnl1PoPnKXbWzRAkp1Ixd
         sI/JGcH7rS43yjgRv/3tZz2ZezpUnv0zqHKhTBa6J1+3kmyaIInxK22YULh2SCJp5TAl
         /DuvMLE5SjdZTJ1hyPI6V3vyr7kJoCP0bRdxSQ844sqlIy3/3a13HDW0UNP1pweMHuvG
         imjSn9cZDzwp2RYwJkExDiEx3FkzNNx26euD8Z/TDpPJSrz7kM1soxUYX1Fx75dVtclW
         6L4fwUTeho4lnSWfkS5m2qP2IFfVnE3tuSS6v6nY1UFVhws7CqMLhETsZ0FCatezKiG3
         Ot/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si4048235ybn.297.2019.02.28.18.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 18:29:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzXvw-0008D1-L2
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 21:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gzXvm-0008CY-Pp
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 21:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gzXvm-0001GH-0r
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 21:29:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2178 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1gzXvl-0001Ep-Mm; Thu, 28 Feb 2019 21:29:45 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id A105B6E4906C84222529;
	Fri,  1 Mar 2019 10:29:39 +0800 (CST)
Received: from linux-fhAnjn.huawei.com (10.175.104.222) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 1 Mar 2019 10:29:31 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Fri, 1 Mar 2019 10:28:30 +0800
Message-ID: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH] hw/arm/acpi: enable SHPC native hot plug
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
	Shannon Zhao <shannon.zhaosl@gmail.com>, Heyi Guo <heyi.guo@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqPIp7BeeDVr

After the introduction of generic PCIe root port and PCIe-PCI bridge,
we will also have SHPC controller on ARM, so just enalbe SHPC native
hot plug.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Heyi Guo <heyi.guo@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 04b62c7..7849ec5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
+
+    /*
+     * Allow OS control for all 5 features:
+     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
+     */
+    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
                                 aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-- 
1.8.3.1

