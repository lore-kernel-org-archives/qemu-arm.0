Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3334773lfp;
        Sun, 2 Feb 2020 16:18:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8PueTyf1JLVHdjBkcQv8T+gAZRjV77oTuljglre5ZY6/6N7pl0BhHZ4cwexL44b35sMV0
X-Received: by 2002:ac8:710a:: with SMTP id z10mr21677928qto.181.1580689137091;
        Sun, 02 Feb 2020 16:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689137; cv=none;
        d=google.com; s=arc-20160816;
        b=s4xRdzXgHO9x4yyRkyXgtzbkvwCI2mLEYElQ2NqIQG3oWLOzL6YoaT3iokHAklZkTS
         HhN7vvWjXRoIn4gtCGc2dCPGTue5PnvAAX46ZDFrGq+1eFzKZXeh67G5Wavzfq/4lvmR
         mOisJRSTeTFVFIoztvokECxP9VW9LUTwbQkF64xF+fhaDFzIpSaFaRwClbW1A29I0FMw
         F9hMooqBWBYFtqlgnw+5ez0L2r3Oayp9JRnV88jUtuQ/yiVpK+9bwkKPD549mlYPX6OS
         h1Epn+l32XFxxiClWYwknWBrWbnOVuhNhklKZ+wL3HXQ6WPF/LJqWRx3DwaSl+Dv2dVk
         xjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Yft16GAQWbf4UMjM9MfffOWqUp1DAZ0gwvFgw3V+anU=;
        b=QzKdhc2AJgOF1WXzfKTAuq+Fdd/MmuCsk/czpE1dRjzWq8xi18rvKf+TYNznnUsCYJ
         dmW+jrnOf/DagDJ1TTtYM2Gq1JiHSuB219zyzLuZSAq8P2JmVv+dg+5elyBeLBXWNq5r
         QqaEt7CSfELAoOy2EgDSFk+6II2+x+lANMqlKEXsIznQDvz34glAJtS6w71CyxEj/czY
         JSz9dIh22PxP2PKKq9jOfjd35v0W0fxyUkJM4xxd4WPfdl1/JM0ypT38eJqMQSAUViUr
         OupL/mQkCxtHD46KwVehrWCQDhPN0WWEIojpV592+1yT7VWtLItrvZTT2+rg7PhMG1jg
         LITg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20si10550939qtn.3.2020.02.02.16.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:18:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPS4-0002Lq-Hy
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQV-0006vS-RI
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQU-0004Bc-PX
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:19 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:38210 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQU-00048B-Ey; Sun, 02 Feb 2020 19:17:18 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 626D8FD170912DF4A5B2;
 Mon,  3 Feb 2020 08:17:14 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:03 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/7] arm/acpi: fix duplicated _UID of PCI interrupt link
 devices
Date: Mon, 3 Feb 2020 08:15:03 +0800
Message-ID: <20200203001505.52573-6-guoheyi@huawei.com>
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
X-Received-From: 45.249.212.35
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
X-TUID: cqYOw7/enyRl

Using _UID of 0 for all PCI interrupt link devices absolutely violates
the spec. Simply increase one by one.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5d157a9dd5..f3e340b172 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -189,7 +189,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
         uint32_t irqs =3D  irq + i;
         Aml *dev_gsi =3D aml_device("GSI%d", i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F"))=
);
-        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
         crs =3D aml_resource_template();
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIG=
H,
--=20
2.19.1

