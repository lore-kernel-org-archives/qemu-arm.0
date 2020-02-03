Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3333790lfp;
        Sun, 2 Feb 2020 16:17:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4TapBftsmf+KxUVOKTPcszXcS5O5zbBR2WctNWGUeOXiGW4m53CAsiHmnc35XEf4sev3C
X-Received: by 2002:ac8:5048:: with SMTP id h8mr21196647qtm.328.1580689043696;
        Sun, 02 Feb 2020 16:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689043; cv=none;
        d=google.com; s=arc-20160816;
        b=Dg8KIUuxTCZNnCBs2MjYNc6peO08MtSGiGragYos7Ger9Sfb5MEOSymdDEOQcHb698
         ce1EwPtzMR0W9hXcpO+Ye+y7OUvicj/qWI9/+O26OcObRVsHSCKs8EREYKjEIuqal5HI
         ohMIsj5yuR/0lt372l3kYPpz+qHraTTTOWLmNP6+AZFKz2o4eX6Kacwdc+ls094p/irF
         jqeVYx2NAnSApBRQ/O3qBW+J4ESTnv3SACRfgMItsuovpf6ZUYRcClwYbo+rAki3M6GT
         0I64sbDMK9VFjqyEfEE3RdWaUHYBN7hHjKa3FftS04QE6Fo8yJdKAIS7MgmNv3a7DAdo
         T9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qt9gO2fPWg3/v14fnekAPcHan7Bvn6nC4zZHAfvMI4M=;
        b=r+hBsJwzgPztfwNmzTsNX0OBdfobDXUiHJTR9EoekXG0xCG4Z9cL/8Uece7wfBpr0q
         Co3+36NwY5v2tVJI34s9vHlWhYVbAollMCW6/lLPxyfcmZbYLJ/WmUOumGdrgbnDd50Z
         QpbrLoZLw+oxXwiz2xYSVcGh54CrdUjbCffsbm7BcZL8MusSedno0/2cfcFsrzc5GW2X
         hhw2TiGFZpQY+CNn82CPFdhSR5MDO6w01XdXQcI4Lk8uoopdohXTMsN1YBxJVtT4WOUQ
         AT1Um+ASM+GNP2Dky8G/mJIrmQE6Sg9euNh3KCgKnAvx6ryaRdl2z/zYAda1IHOaZqof
         UaZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23si10593287qtq.221.2020.02.02.16.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPQZ-0006lo-4h
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQP-0006jb-SO
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQO-000445-Ua
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:13 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:34610 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQO-00041A-K8; Sun, 02 Feb 2020 19:17:12 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 85F2949815C5284A2986;
 Mon,  3 Feb 2020 08:17:09 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:01 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/7] arm/virt/acpi: remove meaningless sub device "RP0"
 from PCI0
Date: Mon, 3 Feb 2020 08:15:00 +0800
Message-ID: <20200203001505.52573-3-guoheyi@huawei.com>
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
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h0WTYAHOzIoQ

The sub device "RP0" under PCI0 in ACPI/DSDT does not contain any
method or property other than "_ADR", so it is safe to remove it.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Acked-by: "Michael S. Tsirkin" <mst@redhat.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd5f771e9b..9f4c7d1889 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -317,10 +317,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemM=
apEntry *memmap,
     aml_append(method, aml_return(buf));
     aml_append(dev, method);
=20
-    Aml *dev_rp0 =3D aml_device("%s", "RP0");
-    aml_append(dev_rp0, aml_name_decl("_ADR", aml_int(0)));
-    aml_append(dev, dev_rp0);
-
     Aml *dev_res0 =3D aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
     crs =3D aml_resource_template();
--=20
2.19.1

