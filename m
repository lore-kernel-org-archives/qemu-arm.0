Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2031433wro;
        Sun, 4 Nov 2018 17:45:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5dcGjq7J7TqKNM7kWqwBurHdHgznTO+8n2iLvJTEXSN8pAYkpkrJK+ea1eT390DDlgsUlkw
X-Received: by 2002:a37:77c5:: with SMTP id s188mr18257890qkc.174.1541382312513;
        Sun, 04 Nov 2018 17:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382312; cv=none;
        d=google.com; s=arc-20160816;
        b=E7keIqlfBjkc4IhyZUljOHnnRIIcoP0cOZbWVCG361EVEymo2HNfGqhym9UXA4wUm9
         svIaWo3EsTFn2A2cOd550g+esQMETGN/tHdf9YjKnasDzxWZerSAeejCmWVLQQWx6VwA
         nIkyybMcHi7H9J05p4mtzvphFXA/W5nz26vKwXX2dy5hzSHtjZNry3aVwVHHeEDy8UpG
         OG8vIYp6U4AWlMw6voYhRilmw2icGUl/NMPWIacie+sAFYuzzjwp7orAaEp0seFGvjc1
         2gEE0cY5EL/p8oMlImGCHTJ8ivD3UN8LgwVzGWKnNMIT59Gbiaixq8kpbHEIDuqaSUie
         4PNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7/yE/OpE+nqMjp1rM1XciuaxcAsMMIzcBzyblRcRRk8=;
        b=T8x5To1345yoU9yYo9EMWeg+UhEcIXn2PddnaxdllW7afSSIsc1qILnPQi862TArCT
         tVUAaXLvVstnijVbv73wXKmyv7id6dZAVVOjcqhH95sps29wuzDO0IoX1AhKxTwfKp1a
         iIT4I0eT5bEVhhFCGLlkvHinqNtpROili+VCJu4hD3KSO1b0pTZ1OYyvwbKkcypVBclH
         N1YGiahnZl/V+rxPkgW0aqgN1at+ZYkda3NEKszw6JkKevmS7XHMxPvzcM01PcVRmxbU
         8IdKv1vcOJ6UpVjPad0mhP/6X9XYdSV1PYTCZTYveKg7Htyc3HmEea7erMssCzx8atu0
         kINQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v184si519322qki.208.2018.11.04.17.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTx2-0001aF-1I
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:45:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTtq-00066E-Gh
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:41:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTtp-0001Nw-LD
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:41:54 -0500
Received: from mga03.intel.com ([134.134.136.65]:21934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTto-0000tf-IM; Sun, 04 Nov 2018 20:41:53 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074261"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:41:47 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:26 +0100
Message-Id: <20181105014047.26447-4-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v5 03/24] hw: acpi: The RSDP build API can
 return void
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T3rxj4YqCyFJ

For both x86 and ARM architectures, the internal RSDP build API can
return void as the current return value is unused.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 4 +---
 hw/i386/acpi-build.c     | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f28a2faa53..fc59cce769 100644
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
index 81d98fa34f..74419d0663 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2513,7 +2513,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
 
-static GArray *
+static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
@@ -2535,8 +2535,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
         (char *)rsdp - rsdp_table->data, sizeof *rsdp,
         (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
 }
 
 static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
-- 
2.19.1

