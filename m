Received: by 10.25.208.211 with SMTP id h202csp1440067lfg;
        Mon, 7 Mar 2016 07:19:44 -0800 (PST)
X-Received: by 10.140.91.245 with SMTP id z108mr27934342qgd.99.1457363981347;
        Mon, 07 Mar 2016 07:19:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t90si17212606qgd.103.2016.03.07.07.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 07:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acwwe-0004vB-R9
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 10:19:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwU-0004rU-Ea
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwO-0005Iq-Dp
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1acwwO-0005IU-8x; Mon, 07 Mar 2016 10:19:24 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E504772095;
	Mon,  7 Mar 2016 15:19:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27FJBIw013702; Mon, 7 Mar 2016 10:19:20 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 16:19:05 +0100
Message-Id: <1457363948-71300-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
References: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 07 Mar 2016 15:19:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, guangrong.xiao@linux.intel.com,
	ehabkost@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, pbonzini@redhat.com
Subject: [Qemu-arm] [PATCH 3/6] acpi: cleanup bios_linker_loader_cleanup()
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
X-TUID: omuinPNSfJOl

bios_linker_loader_cleanup() is called only from one place
and returned value is immediately freed wich makes returning
pointer from bios_linker_loader_cleanup() useless.

Cleanup bios_linker_loader_cleanup() by freeing
data there so that caller won't have to free it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c                  | 3 +--
 hw/acpi/bios-linker-loader.c         | 6 ++----
 include/hw/acpi/bios-linker-loader.h | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index aad4b8a..f72b5ef 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1482,8 +1482,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
 
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
 {
-    void *linker_data = bios_linker_loader_cleanup(tables->linker);
-    g_free(linker_data);
+    bios_linker_loader_cleanup(tables->linker);
     g_array_free(tables->rsdp, true);
     g_array_free(tables->table_data, true);
     g_array_free(tables->tcpalog, mfre);
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index 873e61c..a2aeb66 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -129,13 +129,11 @@ BIOSLinker *bios_linker_loader_init(void)
 }
 
 /* Free linker wrapper and return the linker commands array. */
-void *bios_linker_loader_cleanup(BIOSLinker *linker)
+void bios_linker_loader_cleanup(BIOSLinker *linker)
 {
-    void *cmd_blob = g_array_free(linker->cmd_blob, false);
-
+    g_array_free(linker->cmd_blob, true);
     g_array_free(linker->file_list, true);
     g_free(linker);
-    return cmd_blob;
 }
 
 static const BiosLinkerFileEntry *
diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index bee6dee..564e192 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -26,5 +26,5 @@ void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     void *pointer,
                                     uint8_t pointer_size);
 
-void *bios_linker_loader_cleanup(BIOSLinker *linker);
+void bios_linker_loader_cleanup(BIOSLinker *linker);
 #endif
-- 
1.8.3.1

