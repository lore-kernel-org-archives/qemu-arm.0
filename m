Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4687689lfp;
        Mon, 3 Feb 2020 17:47:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9kAN8xATG5UNjIHo4jEYS8F7OIcthnN51MddXyXfChftjUjx7xHXiDvWOq520ledUM34w
X-Received: by 2002:a37:a2d8:: with SMTP id l207mr25722469qke.315.1580780832295;
        Mon, 03 Feb 2020 17:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780832; cv=none;
        d=google.com; s=arc-20160816;
        b=r8uZgfZCT61t9Kh+utXx4kiXjI6XXQR0LkVv6AmfqSm7CD7s7qkkcsHftN0aAADDVB
         3JfX/iKlR6T8JW3VB4jLByzIkzjhbSbX/hjpiGImg5sCeyHMnqRp5Ai0orIDV8+gdjlz
         X0Sqrb2naaOijNoF/73bdbdIxv5FxYD0NVOcBULHWFd2xr++WoE1QVtoz/oLPdx2MXwc
         YxcQ9LLDBbH4dweakqd8onwYXjtW9+Ka9x4ITlhCywf+8OHG17dYPn4PQAZKCMtZ8Z8j
         4skN7Z7W5ylFp+OF3unmggTUjsPRRtT8oajhUoAS56l0YoSA7w05bntmdqQS+LDXY+6E
         Sh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ciInS8jJ/fWcw0f6iz5jD4xv+CFL1skMIRtOVoMBQK8=;
        b=XScSW9nTDkdnM6kPdfrV51D/K294fCkgTh50TTU3CxDxG6RS/a16qOANfFKBCmbzx9
         Mcv1Ze1U4kQZZ/ekcV9A09BDW8+zJLWSuUgtJsFi0UzXs/FQvVwq9d2h8A/Ccis6cBp+
         c5FdhSuhnCf4cDoJMspyzMTZKiwE1xKEG3hTcefTfJV5yIMEARXTO5Y6N7JT7h6BkFwm
         iFkc8yUnjmPMzEMTxi8RAXdJyDqiJL4G/u3mhOPpikcKkWmAG5KbM4rJYJoYqFVQJWBk
         GnJM74aklKiOejhK6cSEPgQqCPh4sBf5bWCneefdDZVE2JcD2/uR48odFxE4rBP+0+24
         pnvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si13008484qtc.78.2020.02.03.17.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynJ1-0008Cj-Mf
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIK-0007ht-MN
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIJ-0008De-Eq
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2751 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynIJ-0008Av-3l; Mon, 03 Feb 2020 20:46:27 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2A6CCDB06235DFBF1763;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/7] arm/virt/acpi: remove _ADR from devices identified by
 _HID
Date: Tue, 4 Feb 2020 09:43:21 +0800
Message-ID: <20200204014325.16279-4-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
References: <20200204014325.16279-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
X-TUID: KZ9nyUqiK5Ml

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
Acked-by: Michael S. Tsirkin <mst@redhat.com>

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

