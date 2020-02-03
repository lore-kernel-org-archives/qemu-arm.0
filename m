Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3333910lfp;
        Sun, 2 Feb 2020 16:17:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcGUx+nbubDhhD9KkbegGRK0qUanVFYNOZA5eCrQW409kVAOOg7j+Wc1nJifunWFFPwRnU
X-Received: by 2002:a0c:ecc6:: with SMTP id o6mr20706002qvq.220.1580689054305;
        Sun, 02 Feb 2020 16:17:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689054; cv=none;
        d=google.com; s=arc-20160816;
        b=lunUWJNLyq5Pb3ayTypQmfw3oQjY/rrOKADm1ykd0/DkA7facM+9sjV7pZNWI7HxSs
         Qea6cnjgHDEYriPJgc+IqceYjNCf6zM9aRTCjrl11KQA8yRJHZkpWDF4kExLj9Jnhlnu
         LXzF038JHRB0hIFvuZiG4Yst+uFnaUtA0WaS2TEwSy4VUiaFke0Btu0JDI4NM8tW6Kk5
         JbfvCwXYtZ2wjS9/DF2jLjfi7yifXOKcpaHWNbrGmV+NIDTNZQBRoCGZzw0zLg1PhWHw
         gQZgKYLZtfwBCW1wzWO1rHEMvWIzdNPhrL6PbcuYnO7I+zaD/pQMhI655uBamZ+936tw
         S2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ECYf9nT2FN/ikPr76I0/On8oleq/ANzhzvrIJsNbpJ4=;
        b=L1gCZhrA5YEXsVY5Glby7qIXekb9iGKzlPpUrfSIL3wfTgM7YetjzxXQe6q4yaCnw8
         IIXegr2PmLWY3e1vYA9oaoyi2ssYmB8RDaQcwOATtDch/QTgkKe4mXCxtSE1p2L3uSZG
         9CqMrIb21LqINy1ptGNVsnXfPaEqCKX5f7qqmxTbUl2AESdWg+0wcLwc695JGtclinol
         Zls8aZfNpoUCT7MopW7Q3V1PaM8ZGOn946NyufsZfEMAlBpuvgKj3rRkxJLVn4014tvW
         kilrYIoMrd2i+eLGqdupkSmyi8gbDhAovGsieDObnbzWSUe+zBV6i5QmQPYZBPMruJyR
         IZIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si10907700qki.27.2020.02.02.16.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:17:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPQj-000750-Nu
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQR-0006ks-02
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQP-00045n-Jq
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2691 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQP-00041B-97; Sun, 02 Feb 2020 19:17:13 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 53ECE588DA811476CAAC;
 Mon,  3 Feb 2020 08:17:09 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:02 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/7] arm/virt/acpi: remove _ADR from devices identified by
 _HID
Date: Mon, 3 Feb 2020 08:15:01 +0800
Message-ID: <20200203001505.52573-4-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200203001505.52573-1-guoheyi@huawei.com>
References: <20200203001505.52573-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +VMBk47U3Cbe

According to ACPI spec, _ADR should be used for device on a bus that
has a standard enumeration algorithm, but not for device which is on
system bus and must be enumerated by OSPM. And it is not recommended
to contain both _HID and _ADR in a single device.

See ACPI 6.3, section 6.1, top of page 343:

A device object must contain either an _HID object or an _ADR object,
but should not contain both.

(https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf)

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>

---
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9f4c7d1889..be752c0ad8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMa=
pEntry *uart_memmap,
                              AML_EXCLUSIVE, &uart_irq, 1));
     aml_append(dev, aml_name_decl("_CRS", crs));
=20
-    /* The _ADR entry is used to link this device to the UART described
-     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR.
-     */
-    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)));
-
     aml_append(scope, dev);
 }
=20
@@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
     aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
     aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
     aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")))=
;
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
@@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemM=
apEntry *gpio_memmap,
 {
     Aml *dev =3D aml_device("GPO0");
     aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
=20
     Aml *crs =3D aml_resource_template();
@@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 {
     Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
     aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
     aml_append(scope, dev);
 }
--=20
2.19.1

