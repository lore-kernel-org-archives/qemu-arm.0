Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp269471wrs;
        Tue, 12 Mar 2019 02:39:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQBCLdF4XFsN1Fjojo3TTgi44l3l9PegesSMiH/S49S/HcIzB36WJBafk/URHTKM9zr4or
X-Received: by 2002:a25:ab2f:: with SMTP id u44mr30754424ybi.377.1552383578618;
        Tue, 12 Mar 2019 02:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552383578; cv=none;
        d=google.com; s=arc-20160816;
        b=eCZ6hSG3DkFNjiYrVHhvViwE6UnkwQiKiahi7EiBJmUPfZD8pewK2d4gJwzbkNR6sj
         JQjQbba3wybWW3zCKP8IRidj5l1ktWPwN3sASAntEUFKFkzUokG9X2z9trRETUG2HF+I
         GqyasfPIQ1KXS7hOOr90jL9Gf+S1zuEStLnTOnUdefa4KdIwfjA6mc6Lq8xWeT58LcLi
         /obx12t9wMRMyPusXhIXDtDnkriAJHQu1n5CaUQoPGrktZE8bVX3ZvzBktOWVlQOF4Bk
         ROuLoTTVvMBoAeziFucu8689MZqowBmHywB0wKn3YuMrmElqoUSW3/0Ss+Sf/7z95RSK
         /gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ZkNxydAn1oXeGWIOHFGRA5amzjTxlm44AYv1ZdAkLBI=;
        b=XUA/J/TmkqI/z2ZHYxdFGthbUThVX9WrrLcGGRdzcYIBF6G0XJaZVHdjLOIIALbjcv
         BOv8iI1JIokk6E3uaMqMrU3KxitQBqvSu7bTPUtBcDfdDR7G0FnfbtpPJszsZS0sN/1K
         ArBs2tTLI10G/d0wVXVgJXw6X1VMqfa1BaRSqUtlnnyMnkFezr+P41kpcILZewEF+hH6
         nF65GoSQ5LbEMw0deCljk/ELeJqtk981KhiYTRgVSMUxKbFLKxnOrPyvUU0jJYQWzTpV
         5dnRuqobWbyST1JUZJ7h1fiG9NtJz4eZLPeGBsGUYrD71/pPWBbnaYYK6DsHBXOEbqDZ
         uDpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si4398588ybg.296.2019.03.12.02.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 02:39:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3dsn-0007Bx-Uw
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 05:39:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3dTO-0007iw-Hn
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 05:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3dQn-0005TI-UQ
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 05:10:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3dQn-0005ST-Mr; Tue, 12 Mar 2019 05:10:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E85EF307E044;
	Tue, 12 Mar 2019 09:10:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 496D6648A9;
	Tue, 12 Mar 2019 09:10:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, shannon.zhaosl@gmail.com
Date: Tue, 12 Mar 2019 10:10:31 +0100
Message-Id: <20190312091031.5185-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 12 Mar 2019 09:10:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/virt-acpi-build: Fix SMMUv3 GSIV values
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bf+z80dGaRjW

The GSIV numbers of the SPI based interrupts is not correct as
ARM_SPI_BASE was not added to the irqmap[VIRT_SMMU] value. So
this may collide with VIRTIO_MMIO irq window.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7e2e4885b..aa02d8d74e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -405,7 +405,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
     its->identifiers[0] =3D 0; /* MADT translation_id */
=20
     if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3) {
-        int irq =3D  vms->irqmap[VIRT_SMMU];
+        int irq =3D  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
=20
         /* SMMUv3 node */
         smmu_offset =3D iort_node_offset + node_size;
--=20
2.20.1

