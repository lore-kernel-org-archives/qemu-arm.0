Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4359085wrg;
        Sun, 19 May 2019 18:01:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyj3E595zYc5lpVJhFQAAQ8LLx7/1plXo7segS9AptJAZVSVUuw1BKkiKPKg/nFpCmlN1dC
X-Received: by 2002:a17:906:4911:: with SMTP id b17mr49570848ejq.3.1558314068770;
        Sun, 19 May 2019 18:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558314068; cv=none;
        d=google.com; s=arc-20160816;
        b=v5Gv3kSWcI/UTY6TSG+BcC+bEJ9s+3tgyvQKzZgFSn8PRjY3MiWDNVSTZis9f3PJml
         M26JbNlLxFKK5Chb3h2iNBBgxKevU0bOvVq+AspmbRNwl9/4uKsXDe7buhf5J8mVvFxz
         vG8kYSnmyTCwivTLb1FPCJs+JquySveE/qgHC7MsgKUdgzYyFDLqX4V2JI6nhImis0TP
         Mez7n1eMh74aSKT+HxpHSKRIx1IBatrjTWYrnA5mX1yT9MaspJtrPoBXDXm8fqhcYRmI
         QT1FqegIWt23VI8algJ7pf2DdSPcIBmDjq9kdXdbZhxVRWSoFgsutQnoiYpXCp/D5gqi
         SidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=au1CgXkiKkQOWuI13qLSzWwq2SQAAjPuBV90e5SAFTQ=;
        b=x+q1lk7h7XhBnTI+YzgMueFz6OyNL4/lpW2V6DrXJaV/pyNY0XDRKP8/yJlkaRA4i6
         qdW9bNd6xV7nT7dj68zK8hOBOHsO0W3KlBv1lV3SDx98HvP/dFoCoB4PLD7cYf+LfZnW
         n9pzsoWhS/1fIPjqyYBWWpvD4JnHb4QniVtF2g1ovD5oZQU8iacgHJcGak9BPZWl8zqm
         Hgux7hThmGIhWaQeCTJOePp14vWKJ6oErE3NVM0+ANomEX6pUr8yKx8KDJBzoqSdAHlR
         vKGgeSASU/btm1uEURzrE+iOvqAqy1lmR9SoR69nekw0MrTPiM/iXUxrlY2gitr3TuXQ
         UIBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si5082846ejz.129.2019.05.19.18.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 19 May 2019 18:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:55701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSWfr-0000gw-Qd
	for alex.bennee@linaro.org; Sun, 19 May 2019 21:01:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfb-0000bR-VP
	for qemu-arm@nongnu.org; Sun, 19 May 2019 21:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfa-0006bL-T2
	for qemu-arm@nongnu.org; Sun, 19 May 2019 21:00:51 -0400
Received: from mga04.intel.com ([192.55.52.120]:13790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSWfa-0006aZ-Kk; Sun, 19 May 2019 21:00:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 18:00:48 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 19 May 2019 18:00:46 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 20 May 2019 08:59:52 +0800
Message-Id: <20190520005957.6953-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520005957.6953-1-richardw.yang@linux.intel.com>
References: <20190520005957.6953-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-arm] [PATCH v5 1/6] q35: acpi: do not create dummy MCFG table
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7v2iZgF8Y0jr

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b4ec14e349..4fb6184cbc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2413,7 +2413,6 @@ static void
 build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
-    const char *sig;
     int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
@@ -2423,19 +2422,7 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
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
@@ -2604,6 +2591,9 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
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

