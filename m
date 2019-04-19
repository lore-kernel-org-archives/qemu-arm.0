Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1263591wrx;
        Thu, 18 Apr 2019 17:45:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaAYH8Dtk6y9hwzF5LMCJdYSAD2nUmOMdr8Fge7aG4gimpP13o8n5yfXkFbDqw3m7AGaR5
X-Received: by 2002:a1c:df89:: with SMTP id w131mr715903wmg.82.1555634731416;
        Thu, 18 Apr 2019 17:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555634731; cv=none;
        d=google.com; s=arc-20160816;
        b=XNpzHOr9/tVq3H0jemFeqiTAjEsV+GHOvvBgQIsrU1dgREH0UM+TRilcL9tOLp5+uc
         ZuaafXxFL05CHofznTkIfwpzvQ+p10tXh3GT9r2q8CO6OTZNvJAWyHCfpJZTZsPxSTro
         bVQI7WobEg+plo74Q90C29fjQUQAKNvgseo+UF19EtWcHi0lX7G0YvRbz5P21PB3bvsn
         uqPBsgnVF6azqj/6o/7UWZ7DMshaSN+h3HY+bDdp5NkkqDcxEMC614YDpj9dHE2Yzzc5
         bsWxg8BSuH3p8VgpzArOEOOhdBm6Bv4smVkDLEP+sp9VrS+93j11iATE/e2gC3Artix4
         rdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=C76ULdtufwpzeyRev/zXiYOzio4k/KvON12tyQLWJAY=;
        b=tENCVcvge1zMR0lwnbCrO6XW4jie+WljtB0Lxxd7H6Wvk3j6S0MG4OoNSLCG1jJf6U
         tVJpMuhzF5tAL12zuRaRq3ICPgX+CUk6+ANyC7A72xRP07ftc5b1WnP5hcZw1eIHObv4
         fI2/0sBwFZq3Ztjx3azpC/ivlW7fcf8vSWaG1Y0OMh7WZfSSENcgvlfQMJ2LZHmOLkwj
         MKd9zPYFZ/D2NGjO/pyta9JTEeIseQbQL5Zt7yWuQFbMDa+JGSYnuV4f5shaigfQseAH
         hiSPln/05bS40dExgDamzOSFWYvSYJ3F0t5LtxDYO9zC0ofSMJ97+qJxOnfUtTN05Afy
         nA7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si2854854wro.150.2019.04.18.17.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 17:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:49283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHHek-0001YD-HI
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 20:45:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hHHc7-0007cN-Ey
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 20:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hHHRD-0005r2-Sx
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 20:31:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:3686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hHHRD-0005og-L2; Thu, 18 Apr 2019 20:31:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2019 17:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,367,1549958400"; d="scan'208";a="163163321"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2019 17:31:29 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 19 Apr 2019 08:30:50 +0800
Message-Id: <20190419003053.8260-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190419003053.8260-1-richardw.yang@linux.intel.com>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-arm] [PATCH v4 3/6] i386,
 acpi: remove mcfg_ prefix in AcpiMcfgInfo members
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xTajrqrb1J7j

This is obvious the member in AcpiMcfgInfo describe MCFG's property.

Remove the mcfg_ prefix.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d009176072..f0d27bffd6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -87,8 +87,8 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 typedef struct AcpiMcfgInfo {
-    uint64_t mcfg_base;
-    uint32_t mcfg_size;
+    uint64_t base;
+    uint32_t size;
 } AcpiMcfgInfo;
 
 typedef struct AcpiPmInfo {
@@ -2404,11 +2404,11 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
 
     build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
@@ -2577,15 +2577,15 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     if (!o) {
         return false;
     }
-    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
+    mcfg->base = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
-    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
+    if (mcfg->base == PCIE_BASE_ADDR_UNMAPPED) {
         return false;
     }
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
     assert(o);
-    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
+    mcfg->size = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
     return true;
 }
-- 
2.19.1

