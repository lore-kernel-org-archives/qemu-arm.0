Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3285143wrt;
        Mon, 17 Dec 2018 20:33:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X+Yk6eANgGzGjll1+dplbCzFyt5btCGAKLM+DIvnbNP8HF75hpkB2MC3iM5MFDczzBmyrg
X-Received: by 2002:aed:3263:: with SMTP id y90mr15365827qtd.269.1545107608574;
        Mon, 17 Dec 2018 20:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545107608; cv=none;
        d=google.com; s=arc-20160816;
        b=rnCpFFNNVC24t1z9hQW3ooEco5rcPODGlzKEn6duK0uggPyBssV/WvW7ko9fF/MGQ4
         wk+VIuxHe4PxBT1PRBBzG02XZ5K6NmJbq+2sBW6rNY+jMFfOVUTkbiy8K09D2O9yJoQk
         FvikCN4xMIOzpmpBrx+PSLz4sLgUqfwlZLr+P3HBiBNY1qJWdvh8K3/KvdeUE+1puC4p
         aP3OPXNmlpzkXdHIWfEQuWB9+2fM+wmrr0Jz7/ywtOFP4QjrFAj89kuZQi9rqMAfz9XJ
         84BFLhgH4VuMK8C9FB0JRvTypt1srcScHId8FUaFOsOOkuhlfKGmkIQGIZAs6oH5ljn/
         uLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=3UFQIAquu3W5veCdbxkTZ0cK47JEMjvuXjrIxZ0EPGc=;
        b=cwEmJuHJBs50RDA4aPtJL6IA7NCf3h/zZT1o6svVbyc67/Izp6L/qQFaiAFzgL3em9
         SqXyikUPhqClh9wRSFw7r0joz0scuLLXNgo4lwmB0LRAGyJCKw4QUC82maqNvEA1+sox
         tVrr3DnTmkwBBzTbyr92piSzWoHU/T8+QUp6ok1kqqGPRILJfyj0DlRtgoKYve2FhIMY
         teC7JKrQf+fm4fAEFseQGVLCgeIK0/Ft+0rggjiSjwClJECBuY/lUi2F/6COmT+hoUjI
         09Y0QMHViF8SwUPCqLwyrrNhBbc0BITMlCRAHJn0mmFGINs6QBvjQhHtTX/f+pkWgGMN
         Ks1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s24si3916442qta.136.2018.12.17.20.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 20:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZ74S-000225-3J
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 23:33:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ6q2-0005y5-Aa
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 23:18:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ6px-0007jR-F8
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 23:18:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZ6px-0007iJ-8z; Mon, 17 Dec 2018 23:18:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2C1A76550;
	Tue, 18 Dec 2018 04:18:27 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC5686A692;
	Tue, 18 Dec 2018 04:18:19 +0000 (UTC)
Date: Mon, 17 Dec 2018 23:18:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181218041625.24969-24-mst@redhat.com>
References: <20181218041625.24969-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181218041625.24969-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Dec 2018 04:18:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 23/31] hw: acpi: The RSDP build API can return void
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
X-TUID: lcN4Kjdsc6bH

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

