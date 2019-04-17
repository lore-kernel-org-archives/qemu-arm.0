Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4587095wrx;
        Tue, 16 Apr 2019 18:41:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG8jhFejhqcrZ0Cuj+y8uc4x8xEnNSk6Q4BvpJijUdBVBLvfQo4cT0raepjQLMKmLdBciO
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr2917920wrv.282.1555465303565;
        Tue, 16 Apr 2019 18:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555465303; cv=none;
        d=google.com; s=arc-20160816;
        b=x+B6QSKFOLbG97a2umj04LVA+LE4xZwDRsqMQqetpY3KwA/UDVRumAzcOntAYPz2Ry
         i/pWJkCxdCgttk3vw2RK+lMaJz5ZMfMSnvbaMjuYF/oRNO5VkgypeU6obhCgdF96NKRX
         VUilw4R+zgCrz6uR3eajD2mO2BqNNtU0VkRNKht2oNV34LVT+V9JfHlHw79hg3XG2Cci
         jeSu2Q8Gxp7zDNzRO/yu8sWF2Xbzn9o4R3fxc37ygRDtmI6QlhHvLZUJUBvavhiMEZi3
         UehtjUBwefucR4k7H8npX7dpSJm/pjxXPlU8CYMvcXi/8W2YNrkcFtGut9+kQce+YW5q
         O57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=r3qtPWMixnBRnBZ42tNBAdVRgdwvM7FpgNd/AYg0kr8=;
        b=gOu3AsHdCB6Ld9X12wXGTuGY9YqesWjVyFfP4+NVDOhd25GnLyGchTPP12KRENCR6B
         E2slbBDXGbeDMz2/qIyDnm2OWSyo3jpAolTHTYD5T9CtzNPEVOV5WOU4XSN3Frz9tZ2k
         AIMULMowqFr1BPxGEWqKM6eKw0r4BTTQq33UrXtSAacO6PBueM5fhDpybwNevHKvM+bv
         MKfu9mJIh8gWnUPiECX0J8Tg7rNcFq0ThhvAKHEWHF/LHqj96l/O0edKuFfF7QksrR7U
         0mmcr5JPYpIn8z5hBRV+PvGqicJx5BfKj6VVRa0Xi8kzcdPY61+UUrFjPiKPD0HVfn7u
         0Gyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si36456712wrm.195.2019.04.16.18.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 18:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGZa1-0006Sy-Vi
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 21:41:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZj-0006SO-GD
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZi-0006Ie-FE
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:47698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hGZZi-0006G3-4F; Tue, 16 Apr 2019 21:41:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 18:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="338161165"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2019 18:41:14 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Apr 2019 09:40:33 +0800
Message-Id: <20190417014038.26018-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190417014038.26018-1-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-arm] [PATCH v3 1/6] q35: acpi: do not create dummy MCFG table
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
X-TUID: vn00m6ZBSdp0

From: Igor Mammedov <imammedo@redhat.com>

Dummy table (with signature "QEMU") creation came from original SeaBIOS
codebase. And QEMU would have to keep it around if there were Q35 machine
that depended on keeping ACPI tables blob constant size. Luckily there
were no versioned Q35 machine types before commit:
  (since 2.3) a1666142db acpi-build: make ROMs RAM blocks resizeable
which obsoleted need to keep ACPI tables blob the same size on source/destination.

Considering the 1st versioned machine is pc-q35-2.4, the dummy table
is not really necessary and it's safe to drop it without breaking
cross version migration in both directions unconditionally.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/i386/acpi-build.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b17d4a711d..d009176072 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2401,7 +2401,6 @@ static void
 build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
-    const char *sig;
     int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
@@ -2411,19 +2410,7 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     mcfg->allocation[0].start_bus_number = 0;
     mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
 
-    /* MCFG is used for ECAM which can be enabled or disabled by guest.
-     * To avoid table size changes (which create migration issues),
-     * always create the table even if there are no allocations,
-     * but set the signature to a reserved value in this case.
-     * ACPI spec requires OSPMs to ignore such tables.
-     */
-    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
-        /* Reserved signature: ignored by OSPM */
-        sig = "QEMU";
-    } else {
-        sig = "MCFG";
-    }
-    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
 
 /*
@@ -2592,6 +2579,9 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     }
     mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
     qobject_unref(o);
+    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
+        return false;
+    }
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
     assert(o);
-- 
2.19.1

