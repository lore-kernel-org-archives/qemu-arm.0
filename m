Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4688447lfp;
        Mon, 3 Feb 2020 17:48:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnzmQ8saLwl3F2C7bE8keC5lE11cb8UfEU1gXWEwqvWXaNx+hi0a0PVijh+0sNY9VoeRZ8
X-Received: by 2002:a37:68a:: with SMTP id 132mr25370886qkg.139.1580780884801;
        Mon, 03 Feb 2020 17:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780884; cv=none;
        d=google.com; s=arc-20160816;
        b=ExZYL/aUV8cXa8fgestibEpwmzE/LJnP1GJdqX9qs0V5e3DRHavOBYCmO47+BYzXkD
         NIEvL3eKi3wEluDRB8W61G5mnD+LXBsrNjfAmI1e00bsDOA9UP50QWLWlBjmgO67nMJd
         6BNo77hoHd30NGoEchmJvPPNWZ5+fCe4+JTTy61qUXFf1eiH3kNZbBU0f61SBq6oDxsH
         6lwYakAJxwyLhlS/khB9IF7SSRYUoZIQq5fEEj/XcHJgDQ04l7715+weP+KmLvk5TguV
         +aH1KREjX6W0BNaz37FIFDw6EJoNVaFI2Z6gfXpchm6yD9Hk+miFCqGFFm+ZVHhyL3hF
         UHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=xnHRowrONCnbEWqTe6mAo/NOdwU3sEtCqIKcVORs+oM=;
        b=naHpjFFFJCO14G5toTBmoRpdORZjnPcxlLNGQO/5rqJrLqgKQVLBD8kBvkBG/HPop2
         7koTRWZ8tzJtvyBOtX/2zgqEuXYDr7siVWnt3UBkFvIzTTixwEi4LQpJw1VdZPSzTZPx
         B4wYkPiAgCBa6Br1bXTcCOQhIsKVgTbSJ3617Cse5O9239rb/h6DwMDuCxQXeYHxzdeq
         O0YYXR3hfIm67R2mLYSh+CS8HItvDAoSW4Ix4FtMu6lFTB7NxUU62zulVhoR1iy7hi0Y
         xD5lCb9f9ybb/8pyqY8o9x8QPvKd5fs2PGAsPqFsPCP75H91yq9058K479RyCjrlVMpE
         DzJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si12051932qtb.400.2020.02.03.17.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:48:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynJs-00012A-8d
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIK-0007hb-E3
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIJ-0008DK-BT
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2750 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynII-0008At-Vu; Mon, 03 Feb 2020 20:46:27 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2546E9063938F7983AE5;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:17 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 4/7] arm/acpi: fix PCI _PRT definition
Date: Tue, 4 Feb 2020 09:43:22 +0800
Message-ID: <20200204014325.16279-5-guoheyi@huawei.com>
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
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yq03dvUFqHj3

The address field in each _PRT mapping package should be constructed
with high word for device# and low word for function#, so it is wrong
to use bus_no as the high word. The existing code adds a bunch useless
entries with device #s above 31. Enumerate all possible slots
(i.e. PCI_SLOT_MAX) instead.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

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

