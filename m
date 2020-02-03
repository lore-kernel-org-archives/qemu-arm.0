Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3333838lfp;
        Sun, 2 Feb 2020 16:17:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlf/zJBdKPAJRm7sbizDK+X1TITiJFx5u64EYfM4zSBPzsiGTGQwyr1uJ++TGb7A+2ATcQ
X-Received: by 2002:a05:6214:9d2:: with SMTP id dp18mr20336398qvb.98.1580689047873;
        Sun, 02 Feb 2020 16:17:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689047; cv=none;
        d=google.com; s=arc-20160816;
        b=hfcD1LPLpCNQzmyeygz5E86TwarM2lqwOLpbsYBJNGTN8p/4r6sph+4HVOl0aZbYBy
         KkYdW66ptwcqKJmaE+ju2YkIFGD0zwq8J08NyO4GbWq3JEbJQaKxE1GQMtKDKnZTq1Xb
         aiK6XeC6doUuoWvXwcnigjHzaD7a7bvf9PAsN4AqW6rcugX/qT2Sy179x9aFFJcZDQTD
         7fjh2aC/dmetunpdp4KF9v9uhsvt0WcMjiD3AKVMC5xr2FwbAnsuqetSOiA53biHweXg
         ny2DopYibSttUS7PMmnHXP/YfbeqaeWjIMpVhg9kb/89LDLHXmP6racYAQl/TRWt2+Rh
         kOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=JNahfZfoVFXp1RPl/Kbo+5qfTxlDN82WA+D2qIoqqSI=;
        b=FlcYDZ3mttwXfaETC4vmFjOEQKVDBWyZ8S7TFMzCc5c2tWovQkstxHveFxRjn/E+U9
         gb6NaZj7BDsolU3MCgargU98bj/9ZlFcHZTrwbXp02bVfDPcIrcZCvMcAsICyBBBLpEU
         NPzL7D/yfY6AVWST8qskLIq+yJfnDERoZeimdxzOKccyAxCrEWvfDitlV6D/tlE87tv4
         yLmG7lizoEz9BVM9aQaGNW9R1g6h19LVvaTtAW4GIMWiFhQOYWbXm4Glr+wOdHdcwDI2
         NJq6rcaGwva6Y87TFH3r8jYvZdZWunUQsVpHwdk5nHvDPpGmx8wBtGDHXDovMtBoDkIh
         3AAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si11454980qke.286.2020.02.02.16.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:17:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPQd-0006t2-AT
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQQ-0006kP-Nu
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQP-00045s-K1
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2692 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQP-00041C-9N; Sun, 02 Feb 2020 19:17:13 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5E670FE6E6B5D5E7C80C;
 Mon,  3 Feb 2020 08:17:09 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:03 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 4/7] arm/acpi: fix PCI _PRT definition
Date: Mon, 3 Feb 2020 08:15:02 +0800
Message-ID: <20200203001505.52573-5-guoheyi@huawei.com>
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
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OzRDXnysKyS2

The address field in each _PRT mapping package should be constructed
with high word for device# and low word for function#, so it is wrong
to use bus_no as the high word. Enumerate all possible slots
(i.e. PCI_SLOT_MAX) instead.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index be752c0ad8..5d157a9dd5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -151,7 +151,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
 {
     int ecam_id =3D VIRT_ECAM_ID(highmem_ecam);
     Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
-    int i, bus_no;
+    int i, slot_no;
     hwaddr base_mmio =3D memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio =3D memmap[VIRT_PCIE_MMIO].size;
     hwaddr base_pio =3D memmap[VIRT_PCIE_PIO].base;
@@ -170,12 +170,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const Mem=
MapEntry *memmap,
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
=20
     /* Declare the PCI Routing Table. */
-    Aml *rt_pkg =3D aml_varpackage(nr_pcie_buses * PCI_NUM_PINS);
-    for (bus_no =3D 0; bus_no < nr_pcie_buses; bus_no++) {
+    Aml *rt_pkg =3D aml_varpackage(PCI_SLOT_MAX * PCI_NUM_PINS);
+    for (slot_no =3D 0; slot_no < PCI_SLOT_MAX; slot_no++) {
         for (i =3D 0; i < PCI_NUM_PINS; i++) {
-            int gsi =3D (i + bus_no) % PCI_NUM_PINS;
+            int gsi =3D (i + slot_no) % PCI_NUM_PINS;
             Aml *pkg =3D aml_package(4);
-            aml_append(pkg, aml_int((bus_no << 16) | 0xFFFF));
+            aml_append(pkg, aml_int((slot_no << 16) | 0xFFFF));
             aml_append(pkg, aml_int(i));
             aml_append(pkg, aml_name("GSI%d", gsi));
             aml_append(pkg, aml_int(0));
--=20
2.19.1

