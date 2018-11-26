Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5801509wrt;
        Mon, 26 Nov 2018 08:30:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V+XWml5VH2WjY39F4v+0Il+nbo8ihEFXyxfOu7K0O1yFXbCqNNQep+6l9t/QlAg+Ho/NLB
X-Received: by 2002:a25:7108:: with SMTP id m8-v6mr30357815ybc.174.1543249854284;
        Mon, 26 Nov 2018 08:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543249854; cv=none;
        d=google.com; s=arc-20160816;
        b=bFnmMr1SdKO5W8vkMgIdIEB7APDKvUpHC8K6jQby+UM8H1FCS4Ehr/XE/dHortfcEV
         MxOawrw5Rv8sory6OvwavdDBNXpaLdEAcjpLuX8b1YX0Z+OS20KR+RJvfCmfrsiZ2D+X
         ddr6YebeHPbhjwSycVG3i48/1M7V1iS7pVznG3iyp3hmghEB4C0G9UYQWjE3aekbGt3v
         QI2Bxh7hlh2Jk94dBrQtie+4AmAuIeii2UcpPSPMWmg5TJU/R617SHay6FBBxY1nasQj
         dSGYVgAIPfDSsMq3SiJaD7zmSaonWycZgl2pZ46W9Ro9DFcmTE8T+g4XIIRk/5eia/8O
         X4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vv7g91cEse7pgCDQQLyr0yT/VHv6rqL9I8bCpmcv1Wo=;
        b=XesXROoc55HmQUg9RenG9B421aDfIc2kbpY+B2s+kR+tk+8oZ1Vt5IZ+Y3TI72UOqN
         lLW+wKv9cUB/eU5jqhUFrCo7f3Krqc7Ov5g+EgnQv/mqEE6/GiKpdJtf2X0iUlOqHDsr
         sAcLixEbdvNWOOCQrh7MsSvgYVdaBt7bvm/PDY20HiBujK/ofCK5AyZYeZ2jAL/D8X5L
         quO4r7FUtZcEM7zgVvwofeKA3R9gEskdM9wnWWNTgO+QbCaJPK4BmuayxcJAAFN1b5+W
         gD+sSC5JLTT9c1sH6c85tQAl0Ag6F0NpE8L+PSU1L8KsRgx8I7WUqitujhJkGO+IYRkG
         f1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142-v6si572321ybn.35.2018.11.26.08.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 08:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:37516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJmf-0000oM-LG
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 11:30:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmU-0000mq-3J
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 11:30:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmT-0004XQ-DE
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 11:30:42 -0500
Received: from mga14.intel.com ([192.55.52.115]:1713)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRJmK-0004Hm-Rc; Mon, 26 Nov 2018 11:30:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2018 08:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,283,1539673200"; d="scan'208";a="90949793"
Received: from sunandos-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.82.176])
	by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2018 08:30:19 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Nov 2018 17:29:34 +0100
Message-Id: <20181126162942.21258-2-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126162942.21258-1-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-arm] [PATCH 1/8] hw: acpi: The RSDP build API can return void
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Y2ppMPwNXnw

For both x86 and ARM architectures, the internal RSDP build API can
return void as the current return value is unused.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
 
 /* RSDP */
-static GArray *
+static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
@@ -392,8 +392,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
         (char *)rsdp - rsdp_table->data, sizeof *rsdp,
         (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
 }
 
 static void
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 236a20eaa8..35f17d0d91 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2547,7 +2547,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
 
-static GArray *
+static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
@@ -2569,8 +2569,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
         (char *)rsdp - rsdp_table->data, sizeof *rsdp,
         (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
 }
 
 typedef
-- 
2.19.1

