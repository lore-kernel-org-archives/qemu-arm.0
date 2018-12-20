Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6626326wrt;
        Thu, 20 Dec 2018 11:03:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XAzUJxoOL355Jy+pYQT6091FRa2mGmcVliEDV6P8t4Uetebsy6N4AqMaixj4qgij1969MI
X-Received: by 2002:a0c:89e9:: with SMTP id 38mr27515887qvs.31.1545332631422;
        Thu, 20 Dec 2018 11:03:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545332631; cv=none;
        d=google.com; s=arc-20160816;
        b=C+8NH8oHLj+YM1QlfiMzpkAvKYmVZyMKBQMSzm9x6x6/6uUF5/eDdmEbBp6HDC+S1t
         FAYjpB3D7/cxw/H06HEdohvo8LkGQjvsF0m7oA7LjR5Y4qfFshMj7BQdkYhbfISFpiaN
         McQHmTMWwuu2AJ6q80LU3t8cCQczTe8OUb2Q5+sMFezWPAeh/MPFj5/r7h9dbIZSrutf
         6B4Ma7ac81t615eGVhlqn3iM0mOuoTEjg11ZxHqeYbmfSydXO6Gi0i9vPSpAR/dYOIXL
         VTHH4wjDihX8jYEegLDm/9++47BO55zPyqE0u/9XP2BwNk5YfqB6pXwkAJUL43z/8Tgq
         ChHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=3UFQIAquu3W5veCdbxkTZ0cK47JEMjvuXjrIxZ0EPGc=;
        b=CAIeSutrB1l1SMsUbHS2yWOozjGriRky5aj8jkbZaw3pAfJShQ3WxB8AW00KvEXyk2
         CNeQ52fJOZMJ3KMqqalYi1ZmDXXTl/V8c7abuJz8VwQnn/1g1aCHjzPgjSJ0fLCxUOq3
         luOAcpF1KzT7jGS5NoZu3x5U7ffLHA9qAVhk1Xr9Eljy9zoPl4g1tT2XvBz2C4QlnGAZ
         IzbnBkzAE7hr12MheJQFdeL3ekT0vpL1Rj7hXW7f98T7UeITThhnVRtKO8i2Bw8YPaq0
         32WrwCb/mTCD4N1WIj7k8zdi4G+7HAmz4mxx5uNi3IL3aLwAPdMeqEm4hemEPnUwbMkd
         fgrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si3545503qtq.250.2018.12.20.11.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 11:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ga3bq-0008SY-Qj
	for alex.bennee@linaro.org; Thu, 20 Dec 2018 14:03:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3Ee-00058w-7a
	for qemu-arm@nongnu.org; Thu, 20 Dec 2018 13:39:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3EZ-0000vB-KU
	for qemu-arm@nongnu.org; Thu, 20 Dec 2018 13:39:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8717)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ga3ER-0000jR-S7; Thu, 20 Dec 2018 13:39:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C32D113BF48;
	Thu, 20 Dec 2018 18:39:37 +0000 (UTC)
Received: from redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AF5E45A6;
	Thu, 20 Dec 2018 18:39:36 +0000 (UTC)
Date: Thu, 20 Dec 2018 13:39:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181220183059.20726-23-mst@redhat.com>
References: <20181220183059.20726-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181220183059.20726-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 20 Dec 2018 18:39:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v3 22/44] hw: acpi: The RSDP build API can return
 void
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k6Dp4g/DEaI4

From: Samuel Ortiz <sameo@linux.intel.com>

For both x86 and ARM architectures, the internal RSDP build API can
return void as the current return value is unused.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 4 +---
 hw/i386/acpi-build.c     | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb697c..fcaa350892 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 }
=20
 /* RSDP */
-static GArray *
+static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_off=
set)
 {
     AcpiRsdpDescriptor *rsdp =3D acpi_data_push(rsdp_table, sizeof *rsdp=
);
@@ -392,8 +392,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, un=
signed xsdt_tbl_offset)
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
         (char *)rsdp - rsdp_table->data, sizeof *rsdp,
         (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
 }
=20
 static void
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 236a20eaa8..35f17d0d91 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2547,7 +2547,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *lin=
ker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
=20
-static GArray *
+static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_off=
set)
 {
     AcpiRsdpDescriptor *rsdp =3D acpi_data_push(rsdp_table, sizeof *rsdp=
);
@@ -2569,8 +2569,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, =
unsigned rsdt_tbl_offset)
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
         (char *)rsdp - rsdp_table->data, sizeof *rsdp,
         (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
 }
=20
 typedef
--=20
MST

