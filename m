Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2353323wrt;
        Mon, 17 Dec 2018 03:11:34 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UfGQApP7HaaNDtBxJ1YcigDPLEIGWGweG00ZDMOy+G6YCGM/VXR4SqsgaO+tfVFAdalo2s
X-Received: by 2002:a37:4386:: with SMTP id q128mr11911213qka.45.1545045094186;
        Mon, 17 Dec 2018 03:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545045094; cv=none;
        d=google.com; s=arc-20160816;
        b=RS8NqK/ZCgXEy1bclRLJifijiKQxwYAeXxL0jjQhk8U7pQdO9j5Xw342DWN5OtZjq2
         ZIkON+K430GBs0khZFxK8ZoWHclAvWjXgqHrkKgWbEfcCDcgKuc0lNDYH2df087jrtwB
         o7+0OacuJUKdg0sY5HYUJLBsth+YTnGg6vCVZQN1f0y/B+Rxn7kzz7T3IYncgBAADGlO
         Dy/0937mGjJh+Mf0jVfWT8RCqw13GTJTUyKfVR2l7HhJsZffpTYozGEghMA3mOqn88pV
         WR0Tv/XmIo1XVgRQhFQuggQ7J72xEQ3gJTsK2MyLRm3O780718iXhmF6OMj+ihvUOfWd
         Iihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YzdTn7z4bpJZnsDU+RuJHqfBzsXK7aneiGiQmf6/21c=;
        b=ceeptZcgn2WkWzNSGQKVylzyXekWyO2WN9pslWdqJYSFZpQiWyqg5CUSgqIFgKr7D1
         jFNRlwM3ldCYJ+7P2g+GXMo6OFvW32KqnpFpxJRc1K3s7Iup9MzGAgdFqLtTQ7ufyPLX
         s2aDkXDU0hVcvbjUM65TPm/uMa3vcVIJyuOpHH/s05GI4t8CM0vasmUlZk07rBL4IbRT
         d2u8KuxXJTKJrxZjYnPfjctMaNa5ekktmOM4twu16DNTZl7hSg/RNT9JUMZRIB4fk0Mb
         XgcDzYfDRreal+/Jp30XaeLnnEVV5WfgOCOoU5cLVJA4PVO8yXDErIIsegvCAIBBPj8p
         Og4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b42si13700qvh.197.2018.12.17.03.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 03:11:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYqo9-00049t-I1
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 06:11:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqcS-0003Ls-O0
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqSi-0003Md-2G
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:49:25 -0500
Received: from mga06.intel.com ([134.134.136.31]:26416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYqSe-0003Gq-NN; Mon, 17 Dec 2018 05:49:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 02:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="130583627"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.185])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2018 02:49:09 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Dec 2018 11:48:31 +0100
Message-Id: <20181217104838.18957-2-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181217104838.18957-1-sameo@linux.intel.com>
References: <20181217104838.18957-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v4 1/8] hw: acpi: The RSDP build API can return
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
X-TUID: Vkmt69Myedqc

For both x86 and ARM architectures, the internal RSDP build API can
return void as the current return value is unused.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
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
2.19.2

