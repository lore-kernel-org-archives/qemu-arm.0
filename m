Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1833727lff;
        Wed, 18 Dec 2019 22:49:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYoX2Kie+4pXfD/YTPT7mZyOd3+zyWbDw2G892bmodseCLcuy3Jl9nirR3ts80yCFcb/p/
X-Received: by 2002:a37:9186:: with SMTP id t128mr6258873qkd.180.1576738197631;
        Wed, 18 Dec 2019 22:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576738197; cv=none;
        d=google.com; s=arc-20160816;
        b=porfPXzTVJg1LwjCPPk6llgFhOOwPdlOnWXgwYFMYOUrWvQduuNO8/8gx5diUxLUCC
         HTnvnzuI+y5hQvsjmX9awoXyg2O5URDNI7iYWsteXjqDjEa/QQrxG8VCx/lw+ndeGATk
         rBwudXAueeKOG0pR6njba3B0hmKLX9uZ6PNw4+HV41yYQ/LiRBMY+MYiUpPzBdaBm3E+
         0fFe/hKLOzFF/I0l9sDbfAhbzc8FzPm20GNPYlGHStE6bNZZHwwThtu9+nahdXmpKnyX
         DL+XeE1/PUXMathRHTzOpwQTtgkLGAAuDjbzviCGozp9XMfKXqOMxeLIVRmmiGjJsWmE
         TIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=bQLst5jYcBSgVzBYUOfXS3xJ97x66OcTQx2CGxQp0HY=;
        b=tnKyf6Qzc8Cn5lnfqse/BMp9G6h98G6Rc4Kvd7S/Asa/PcTKOqog+GYmGl1Vnsax6L
         XWXsno8uA9ppgn7HaLikwWiJaA/UCXCxwfNq1rfI/fXjgk9u2kUOl1HfgGZ4WpY0REyR
         OBhc4FoKQtpG7T7KoKQsb+I8w7fJHcEEDUOq9HbEtd4VPqDEe0ZIwLhIqKviNSQ6TO7Z
         58GTBZI4eOhACQp8XBvxVDAhuBduW4wAzTzNjwUTt79XwCznDT+mR5AbZunm8I26ckS+
         0zcT9IhNhqk+NwtSwMuodzjXVtagDs1LqTrNMnZwKchVQouwoP33HeblHWlA8FjbXV3D
         VO1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si2503842qte.105.2019.12.18.22.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 22:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihpdE-0000wr-RJ
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 01:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ihpcn-0000e3-Cp
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 01:49:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ihpcm-0006Qx-4f
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 01:49:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:42764 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ihpcl-00067O-Nb; Thu, 19 Dec 2019 01:49:28 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 474A6F41EA539C7D2369;
 Thu, 19 Dec 2019 14:49:24 +0800 (CST)
Received: from linux-CPUxgZ.huawei.com (10.175.104.212) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 14:49:14 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by _HID
Date: Thu, 19 Dec 2019 14:47:59 +0800
Message-ID: <20191219064759.35053-3-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191219064759.35053-1-guoheyi@huawei.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Wen+uFzYns6

According to ACPI spec, _ADR should be used for device which is on a
bus that has a standard enumeration algorithm. It does not make sense
to have a _ADR object for devices which already have _HID and will be
enumerated by OSPM.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c          |   8 --------
 tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
 4 files changed, 8 deletions(-)

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
diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf50519a6=
aea296e5e0f1e0c 100644
GIT binary patch
delta 72
zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=3DgU!!5x$Pt+
c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8

delta 94
zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao
tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.=
memhp
index 69ad844f65d047973a3e55198beecd45a35b8fce..6e5cc61977e4cd24f765fec06=
93f75a528c144c1 100644
GIT binary patch
delta 72
zcmX>#i*fTTMlP3Nmk?uL1_q|eiCof5eHSLGt1wzk^tIeLL4lL8ZSqD=3DgU!!5U7RH)
c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>03)CjmjD0&

delta 94
zcmdlyi}BPfMlP3Nmk=3D*s1_q}3iCof5t(PXMt1!8;O!Tqj;)r*23F2X3VBp-?s=3D&$E
tGkF=3DO0W(l&^JPwVXL<R6@E|9Scn?n(-T=3DP<17`zg2CxPo8S3f6006qZ7#siq

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSD=
T.numamem
index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf50519a6=
aea296e5e0f1e0c 100644
GIT binary patch
delta 72
zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=3DgU!!5x$Pt+
c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8

delta 94
zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao
tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_

--=20
2.19.1

