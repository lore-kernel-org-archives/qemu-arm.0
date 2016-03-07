Received: by 10.25.208.211 with SMTP id h202csp1440127lfg;
        Mon, 7 Mar 2016 07:19:51 -0800 (PST)
X-Received: by 10.140.42.39 with SMTP id b36mr28428033qga.4.1457363982743;
        Mon, 07 Mar 2016 07:19:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si8487883qhp.6.2016.03.07.07.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 07:19:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acwwg-0004y1-8c
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 10:19:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwX-0004sS-Bv
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwQ-0005LM-LM
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1acwwQ-0005Kr-Dw; Mon, 07 Mar 2016 10:19:26 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 193EB7EBB1;
	Mon,  7 Mar 2016 15:19:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27FJBIx013702; Mon, 7 Mar 2016 10:19:24 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 16:19:06 +0100
Message-Id: <1457363948-71300-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
References: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, guangrong.xiao@linux.intel.com,
	ehabkost@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, pbonzini@redhat.com
Subject: [Qemu-arm] [PATCH 4/6] tpm: apci: cleanup TCPA table initialization
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nsGjeMWksAB1

At the time build_tpm_tcpa() is called the tcpalog size is
always 0, so log_area_start_address which is actually offset
from the start of ACPI_BUILD_TPMLOG_FILE is always 0.
More over if tcpalog would be not 0 sized at build_tpm_tcpa()
calling time it would make tcpa->log_area_start_address
point to ACPI_BUILD_TPMLOG_FILE+log_area_start_address causing
guest to write beyound ACPI_BUILD_TPMLOG_FILE which
would resulted to memory corruption.

As 'TCPA' is allocated 0 filled, there is not point
to calculate constant 0 log_area_start_address and set
tcpa->log_area_start_address to it since the field should
always point to start of ACPI_BUILD_TPMLOG_FILE.
Make code easier to read dropping misleading at best offset
calculations and making it impossible to silently backfire
if tcpalog size becomes non 0 at the time build_tpm_tcpa()
is called in future.

While at that move tcpalog allocation closer to the code
that defines its size.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e13f96d..3540815 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2310,11 +2310,10 @@ static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
-    uint64_t log_area_start_address = acpi_data_len(tcpalog);
 
     tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
     tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
-    tcpa->log_area_start_address = cpu_to_le64(log_area_start_address);
+    acpi_data_push(tcpalog, tcpa->log_area_minimum_length);
 
     bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false /* high memory */);
@@ -2327,8 +2326,6 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 
     build_header(linker, table_data,
                  (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
-
-    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
 }
 
 static void
-- 
1.8.3.1

