Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6617366wrt;
        Thu, 20 Dec 2018 10:53:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VoDqXgbxsYIIfJgEJ+b1oT+1KmMVopnFc/Ks2LamKctYVLC+2Hrt3T38bblJSevXILCakB
X-Received: by 2002:a05:6214:c7:: with SMTP id f7mr27938406qvs.44.1545332009318;
        Thu, 20 Dec 2018 10:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545332009; cv=none;
        d=google.com; s=arc-20160816;
        b=cM6ikwiQ+LdYQV0x++3Tqy8PSS+PVs0LibqIODeTJ+QYhu9CZ+jSqa5rF7Xndok+QJ
         /b+HlOcBkZipKlYFkxXY35p9tm9U3fmCSe9Dkuq3TDUAJ4lUyLwezajG+DmKRikYR53J
         32YenXa67XiH2sQ2AoJhy9fVK3VshRBlG8p13BBXezM9dI0h/4nmLnZ3rObNBIBCAjn7
         ACzArXq9zX9YDHaLwCPBmssUOqlPkGWplUrxgAoA/zdAzqM1iKKNjdGc+hhMgf4E+Ppj
         3VUQi/oTPj65hu81r6q4OlH5o4YKORLQQpuWxiYOeIgru1blPEwD6JwBKhgl35eSQPW3
         rMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=MjBytLS703Zo+miNdeZd0PqlXYxs9XsR/qAzFKn9+0g=;
        b=gcHUwmx2sX0dhgVCju+p2IM7A+7aNbRPl6g8ewkXbjno7TDyiuUN1ZVv2zceqb8Vci
         lGkxuRd8GnTLuD1uFbmPDfrNB8Hv+jXSFr4RCXj2ksw2u1m3F//Dcc4vs3HXeXxzLWtW
         dQmzL72pIz0GVYbn5Auy7cxIgVwpaVEWZh0JyM5/F4eIMPnRwmEJ5ExnPQGcXi447WOm
         PiwxgfVx5uQCOgVcA5lgcw4kB2skeAFtLBjkDDy6M8KP/aos8RAp7+qrt04r6VwdsQ9I
         LvJ3VWdY2foFA94zk4aPxVGcEdnj0iOxB8Ui0S6dt17yYN1BRDHrdCcLZy52A/SVwNQt
         XzWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m27si4731878qta.366.2018.12.20.10.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Dec 2018 10:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ga3Ro-0006sb-PZ
	for alex.bennee@linaro.org; Thu, 20 Dec 2018 13:53:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3El-0005Hh-A5
	for qemu-devel@nongnu.org; Thu, 20 Dec 2018 13:40:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ga3Ek-0001CE-0l
	for qemu-devel@nongnu.org; Thu, 20 Dec 2018 13:39:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ga3EZ-0000ky-Jd; Thu, 20 Dec 2018 13:39:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79949624D4;
	Thu, 20 Dec 2018 18:39:39 +0000 (UTC)
Received: from redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with SMTP id 68C186B64C;
	Thu, 20 Dec 2018 18:39:38 +0000 (UTC)
Date: Thu, 20 Dec 2018 13:39:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181220183059.20726-24-mst@redhat.com>
References: <20181220183059.20726-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181220183059.20726-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 20 Dec 2018 18:39:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v3 23/44] hw: arm: acpi: Fix incorrect checksums
 in RSDP
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ryv5+fexdOU9

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

