Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3924822wrt;
        Tue, 18 Dec 2018 08:24:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UBsXoBnGhWz/lgZHrRQw9VugLcEcPeWH1B+g/7eQd698EQ8GHHhJKS1H0PaIKAey+WVp2Q
X-Received: by 2002:ac8:c42:: with SMTP id l2mr18648295qti.68.1545150290362;
        Tue, 18 Dec 2018 08:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545150290; cv=none;
        d=google.com; s=arc-20160816;
        b=AQTjI6GIP5tzSvWvn30Ye24k2cXYTx+C+/rZyHtZ6vmtaKtQKeNq7VpnSfe70JoNwD
         xxjIm0EG3EU7LmnZTXMPovaw17GEZ/qI6mczZyRJcqVbl5sM8ri+nfas9qAoHQzJLGeU
         zqPtG4+cI7oGedaT3uTIev7m5eO5sb1LdhzS0jfcC7wOfKwKfCrpn6qwuxgNieKaRUFW
         OrWHfFtNhIRDVUxrPPI6Oc6EVRjYdDHoyrWoACAhn4E5TP/oORkySOF2eHnPiQ5f1Wp5
         nHCy/4ADRt66L7hvem/sIByiNEa6YQ3e2n3RmTkm1mjG0LenlpLagbdt/G8DGM32lFcN
         vVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=MjBytLS703Zo+miNdeZd0PqlXYxs9XsR/qAzFKn9+0g=;
        b=b/kBATHZwmvo0q0+wwT2kbKN77Szuuo9h+im1lcJR66HiiQteWshkrnyu+zy4nFbp4
         t952SmKegZEgQFqGihvz3aIJyArQ+apjpEj8uwreLxzXqJf245kk3IvMxJ0BBLljTYBp
         H+qMEYDYXNeOYzbJMBcMalTg8QbCe1g4R5IJlegVvStwVJPFt4Crc1qvHkdjJ7kzNMiV
         X2dKmpc2uoNdwus2CmEDKeHwPNgTqnpnq4/B0O/SQ5kV+0qjzm1gYY+s0Yly0F+lRx+T
         qMXKsg9t0uDar4j48vt6Xx3/oTPQq1mEuWH10JcQyYgZIAYiXhlP86O+fBmH7sfVJutp
         cwyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8si265295qtm.5.2018.12.18.08.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 08:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZIAr-0008UV-M0
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 11:24:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZI00-0007Lm-FN
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:13:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZHzw-0003FL-Ik
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:13:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZHzu-000379-9R; Tue, 18 Dec 2018 11:13:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 547CE88E4A;
	Tue, 18 Dec 2018 16:13:26 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id EA08527C34;
	Tue, 18 Dec 2018 16:13:23 +0000 (UTC)
Date: Tue, 18 Dec 2018 11:13:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181218161008.3882-24-mst@redhat.com>
References: <20181218161008.3882-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218161008.3882-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Dec 2018 16:13:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 23/30] hw: arm: acpi: Fix incorrect checksums
 in RSDP
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
	Samuel Ortiz <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yX9DFi1JKhXc

From: Igor Mammedov <imammedo@redhat.com>

When RSDP table was introduced (d4bec5d87), we calculated only legacy
checksum, and that was incorrect as it
 - specified rev=2 and forgot about extended checksum.
 - legacy checksum calculated on full table instead of the 1st 20 bytes

Fix it by adding extended checksum calculation and using correct
size for legacy checksum.

While at it use explicit constants to specify sub/full tables
sizes instead of relying on AcpiRsdpDescriptor size and fields offsets.
The follow up commits will convert this table to build_append_int_noprefix() API,
will use constants anyway and remove unused AcpiRsdpDescriptor structure.

Based on "[PATCH v5 05/24] hw: acpi: Implement XSDT support for  RSDP"
by Samuel Ortiz, who did it right in his impl.

Fixes: d4bec5d87 ("hw/arm/virt-acpi-build: Generate RSDP table")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>
CC: Shannon Zhao <shannon.zhaosl@gmail.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fcaa350892..0835900052 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -390,8 +390,13 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
         (char *)&rsdp->checksum - rsdp_table->data);
+
+    /* Extended checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
+        (char *)&rsdp->extended_checksum - rsdp_table->data);
 }
 
 static void
-- 
MST

