Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4588354wrx;
        Tue, 16 Apr 2019 18:43:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4ci90lzvyFgZlVRrUkA/ASrJAtVV5y8tU7If88lrroulMpvNOTbTG2J4ue8eTEm5ewSm5
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr29242931wmj.2.1555465422076;
        Tue, 16 Apr 2019 18:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555465422; cv=none;
        d=google.com; s=arc-20160816;
        b=v4z8OSZ9CCnHV8imoLamZZ1/CqmcP9T6qTzTiUaWth+f02ZmrAZ7eFty0bBcKSCRLc
         JdNKyaKZd9Djt0SJhB65N2Ov8DqyBtSSG4bMQYkFlwjnm6iwYMnhp6Ikm54lbQOhaIh9
         U1iN7aZssNnaTRozj7d6LhVkOM8tq2PgGfDF0nBzRzKA3ZISWBOAbywLgDsmh0vgcUOB
         +Jgd5M8YG3NEz859+wR7x6GBwXJvDA0PvjzPVc/mvjLcFc4f+Do0H83IpxxoqRF1ZSMl
         wWrIdvHORb2YuSO0l9jmPu+6RK0upfPBj8IgjKPxh0wEQ5IWbs7wnqfNU7GhSQxmIGoL
         GQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=C76ULdtufwpzeyRev/zXiYOzio4k/KvON12tyQLWJAY=;
        b=ttVgSuHfvwanoGZ2jk7MAsakG6NghFiPp9K+Pe1//D5dUBBjtnOxGWNvvZBbqv8JeQ
         JPi8YgC3TZgWPboz1wz2BfW1lVw8NQkY7eUaBNDtvSPf2/9uNZwSp2F+Fz0nzqlogsAa
         Obd/QeSSNURBEyglt2OB8XMLWQwID1mvyE5eUwwnkRt+v6EFz+mrAVpziKrwpSh1R7z7
         fbC42xxAAwiKcvMKOOwpmhd+D6di5ajD527n/3JrTo51sCst9JMit6HpgyVF0TdFn5ba
         fMbDbTvD3zfesvE9r76rYH/DXYa+Sbz0qrScL64lye+e0lEquHzPr1WOl6dXWVEDml4N
         PE1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t206si691552wmg.192.2019.04.16.18.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 18:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGZbx-0007Y8-2w
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 21:43:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZl-0006Sc-M4
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 21:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZk-0006Kc-Kw
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 21:41:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:47703)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hGZZi-0006H9-69; Tue, 16 Apr 2019 21:41:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 18:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="338161179"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2019 18:41:19 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Apr 2019 09:40:35 +0800
Message-Id: <20190417014038.26018-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190417014038.26018-1-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH v3 3/6] i386,
 acpi: remove mcfg_ prefix in AcpiMcfgInfo members
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oIfWVOvh45B+

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

