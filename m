Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4687706lfp;
        Mon, 3 Feb 2020 17:47:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpNd5Byr6gYu7uuqBdYMZcW99UEVnhlrRyPvBghocEGwA8czo0m8S9L65MAizgue28nsXX
X-Received: by 2002:a05:6214:1428:: with SMTP id o8mr26005636qvx.87.1580780833475;
        Mon, 03 Feb 2020 17:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780833; cv=none;
        d=google.com; s=arc-20160816;
        b=WD5ZqT25Lhe+4DIeOKFKo0fTBwh8KbJIiFxM7AcL656XqF02nmW2ZgUf3IO1++TbPx
         WgMjmSsn9bDCeOLHm4b0lWnLUv0HeIvnfBrEuGFplHdun8I80Hf39Z6l7C4qOQMdDKww
         arR8pgJIAqJaW+M8TmJT2LsKryJt3Pb0f2j0zV+OOh3AGf8ctNNxCInCkKlvKFOY+uXf
         uQ8mI90Z/w76UMRK06NJEw2h0GeeAigacJ/cKj77UfKiN0HPQf/AOml6oB6AOJQV81Lm
         gIzicmmSYkbCE/lXiI9eJt5FF6E1fx981hkDwNMMH8TL4jwDN1Me0E/LESMbXCShaU42
         RkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qt9gO2fPWg3/v14fnekAPcHan7Bvn6nC4zZHAfvMI4M=;
        b=JiaXunmd/nAuniwxO+zB3bhT3yzJCzuL0s69RFsaxNsJ1pgmWxZ22iqyNtM+Z9o7ox
         BndC+r6S8UiVdQ/7jUJo1YDetuE43vNoOutFqFHCjOA/G7QHqJ0212fc7CI9iHGR3hoo
         0akS5QnHmQQuPO+5T7Oi3sO11cD2e13BFb9SuE3Um0jhJKzX3Wf/IMRod+TnuqYAZVWE
         mifCRGlSJu9jGzgEipyvWxA8HX/B3CH7iYSJPAThdkLngkh6LqclAiXYSFSVsj05wPbI
         fBCmcq2UUHfgXHLIr6Wr4RuNvgP0y5e8W/VbMEu9K4vRFt9fX9ldeUBHB605RkdMBwpp
         O6Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si11941438qth.188.2020.02.03.17.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:47:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynJ2-0008F7-N3
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIW-0007lB-DS
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIT-0008K5-6Q
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2694 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynIL-0008B1-9K; Mon, 03 Feb 2020 20:46:31 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 45B71803D8D6B998D2E7;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/7] arm/virt/acpi: remove meaningless sub device "RP0"
 from PCI0
Date: Tue, 4 Feb 2020 09:43:20 +0800
Message-ID: <20200204014325.16279-3-guoheyi@huawei.com>
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
X-TUID: /D+2f9CwJ6io

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

