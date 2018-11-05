Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2029642wro;
        Sun, 4 Nov 2018 17:42:28 -0800 (PST)
X-Google-Smtp-Source: AJdET5c61FFM8a1oKz4d10A/52ee6HGEet5OgqovbP1heUZGwoXah7hAbz/oWMjhzs5Ohm3bbCR7
X-Received: by 2002:ac8:3222:: with SMTP id x31mr17104561qta.275.1541382148271;
        Sun, 04 Nov 2018 17:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382148; cv=none;
        d=google.com; s=arc-20160816;
        b=VQE3P/Bsm5B4Nb6WZ2q5Gsj5mkV32ykxJ0zJU94APZV0ohQVxwlG6Wu7DfWPhlsdZN
         Xm87YWsZ++vo6xlAEdQXQUirA/WfNU03EDQukSDgUax/ewQeBbVzGvOAmvxZY6J/Ye4L
         p5mARB81sY1rJzd6y2vk62UDTVqITKrQcejXN+wriQvScvNcntMRYnFZk8V0XOUV9HCz
         /7l5wx+Wa17hKYgdRYIIvDVzB0l+lwmlBDNuTU6qm6g6VkgWPQls3fk3r+7GeJExHGZ2
         DCnn1LnFSMPhddKo1nwQtEkGGRwbGeo+1yZLAhsBrk9siKaEjFpmMzeLH4dMrnrr9Dg1
         tNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=z8QQZB1nI8jdWwk3g5pTH+5EzE0d4qGkPk2CYYUb4zo=;
        b=deiq4mntSP4msNgsKrZ1083Z7t9epzcGS+A9O7AYBu0x5gPyARrWN2k1bJ1nkb4ecU
         ZQOEgLK49h8beTFDTvj5Vb5AVjeOhZKNOOGdMCdBKHrrF+8/ka7/i6g+fe8YW2H7dTki
         ZrK/ZnoNzfPWMOWJEKj3hr+sntAmILRmarBK+D0BdQCSSndc5UBiMrfSYN0yIEQzotuO
         HC6Gv/3yz2H41mrERv+yftALecpzrJVx+Z5hBrgM/PXVzD1brteTHpHd2zmEKxDO++i6
         9wMpr7eXAoy8Wb+QDknqgVuoxkQbHg9rAK9QJytrTOLs04B5oxeAxakoQ5JG4n2NdiXe
         723g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184si1425681qkb.48.2018.11.04.17.42.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTuN-0006Lv-Oc
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:42:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTu5-0006Hq-Ip
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTu4-0001te-C2
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:42:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:31881)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTtv-0001ds-1G; Sun, 04 Nov 2018 20:41:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:41:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074275"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:41:52 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:27 +0100
Message-Id: <20181105014047.26447-5-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-arm] [PATCH v5 04/24] hw: acpi: Export the RSDP build API
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XR4mgSMq+E0+

The hardware-reduced API will need to build RSDP as well, so we should
export this routine.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/aml-build.h | 3 +++
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 73fc6659f2..c9bcb32d81 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -390,6 +390,9 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
+build_rsdp(GArray *table_data,
+           BIOSLinker *linker, unsigned rsdt_tbl_offset);
+void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 void
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fc59cce769..623a6c4eac 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 }
 
 /* RSDP */
-static void
+void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 74419d0663..f7a67f5c9c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2513,7 +2513,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
 
-static void
+void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
-- 
2.19.1

