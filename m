Received: by 10.25.208.137 with SMTP id h131csp3022516lfg;
        Thu, 19 May 2016 06:20:09 -0700 (PDT)
X-Received: by 10.140.109.10 with SMTP id k10mr13590278qgf.89.1463664009033;
        Thu, 19 May 2016 06:20:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b86si12484957qkh.199.2016.05.19.06.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 06:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Ns0-0007MO-AJ
	for alex.bennee@linaro.org; Thu, 19 May 2016 09:20:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b3Nrg-00073G-A8
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b3NrZ-0001xx-MJ
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:19:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b3NrZ-0001xt-Gw; Thu, 19 May 2016 09:19:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 108AD49470;
	Thu, 19 May 2016 13:19:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4JDJWQa016615; Thu, 19 May 2016 09:19:39 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 May 2016 15:19:28 +0200
Message-Id: <1463663970-23661-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
References: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 19 May 2016 13:19:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/6] tpm: apci: cleanup TCPA table
 initialization
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
Cc: zhaoshenglong@huawei.com, qemu-arm@nongnu.org,
	guangrong.xiao@linux.intel.com, ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9bvigG03l4Xf

At the time build_tpm_tcpa() is called the tcpalog size is
always 0, so log_area_start_address which is actually offset
from the start of ACPI_BUILD_TPMLOG_FILE is always 0.

Also as 'TCPA' is allocated 0 filled, there is no point
in calculating always 0 log_area_start_address and set
tcpa->log_area_start_address to it since the field should
always point to start of ACPI_BUILD_TPMLOG_FILE.
Make code easier to read dropping not needed offset
calculations.
While at that move tcpalog allocation closer to the code
that defines its size.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce96533..c99dbe7 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2391,11 +2391,10 @@ static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
-    uint64_t log_area_start_address = acpi_data_len(tcpalog);
 
     tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
     tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
-    tcpa->log_area_start_address = cpu_to_le64(log_area_start_address);
+    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length));
 
     bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false /* high memory */);
@@ -2408,8 +2407,6 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 
     build_header(linker, table_data,
                  (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
-
-    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
 }
 
 static void
-- 
1.8.3.1

