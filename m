Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3608331wrx;
        Mon, 4 Mar 2019 05:27:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsYfKxMNxavgiyXqvnQz8AZM20jo+9a3mGLLRXoL/EgkBM8wi9Gpuer3nvH3FRwig99dnX
X-Received: by 2002:a0d:cc46:: with SMTP id o67mr14471944ywd.123.1551706032013;
        Mon, 04 Mar 2019 05:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551706032; cv=none;
        d=google.com; s=arc-20160816;
        b=RQiNM5h0alEEMA3UB2nlAyHigdAxuLGlQJuW+MUJjV2brhybuJ4AoxW6hoO0JHeNqM
         hDea/eCj3wmj4gg5Ilrqqqq8w2WGCcCw1L3O4C+fK3uOC7w4qZmb7FvvfLg4GtPFtGlF
         /mJC+U17lh26G0y1gYlo9q+F6eOlTptVkFJlHU7o6Fxj83ANmYgLRnZRHZdH++3dx1Pu
         uXatYlt/H9cYOOs3VG38bWvRZAMjiHgtDFHuEKQsCFYkvwx8b0bi6kU8nAdP6SUujTwR
         NnvTPBAbVpnrVR2dKoIgDicsjZhBDzer8IarYr+pj7B88Iow6ld8pIxkxgA1aHb9pxV8
         +Y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=zfkieT2zRcZHdW+iqtnuX5bPLm6zeu/1SfRpHf8OPYU=;
        b=xfMzcUAqz92V5hTfAFT8lc7fs9jPQDrqHRNsn+oOBa5PW8gaIGU6l4kGffz/0Y3Yd6
         G0jyQU3+EU6E2sr4dnX4tjapF2DW3w9NJrFxeHIcAm1eoMYt+U+WVMX38gJ+ekviVu+Q
         fe8BavL0/w070ickxx5A4XBf1jsjkM71LxaLgV2UN3ttmjPF5nmxFHVqzfOHMFFzjZr4
         vtA/aQ7YDkdcnOrJJmXlYWxs1FecaSwTT8HnjcStKc69/zMZwDxOCYQk5dVvYCiEGeJg
         EjDLKC1sa9Bc4WnnS/ZhK89uoiSSG5A5J5VFxZwh0fOsCj2t78tAZ8CiawEHiUAuLTI+
         f5nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si558756ybk.344.2019.03.04.05.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 05:27:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0ncd-0001dl-EE
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 08:27:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h0ncN-0001cE-BE
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 08:26:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h0ncM-0007tn-77
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 08:26:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2240 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h0ncL-0007lp-Qq; Mon, 04 Mar 2019 08:26:54 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3944DB464A816DDCDAA8;
	Mon,  4 Mar 2019 21:26:48 +0800 (CST)
Received: from linux-fhAnjn.huawei.com (10.175.104.222) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 4 Mar 2019 21:26:37 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Mon, 4 Mar 2019 21:25:34 +0800
Message-ID: <1551705934-28745-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v2] hw/arm/acpi: enable SHPC native hot plug
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
X-TUID: QEWQrn3oDtAk

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

