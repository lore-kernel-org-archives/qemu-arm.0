Received: by 10.25.208.137 with SMTP id h131csp3022814lfg;
        Thu, 19 May 2016 06:20:40 -0700 (PDT)
X-Received: by 10.55.22.5 with SMTP id g5mr14591735qkh.101.1463664040688;
        Thu, 19 May 2016 06:20:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e190si12204287qkf.156.2016.05.19.06.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 06:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3NsW-0007wX-21
	for alex.bennee@linaro.org; Thu, 19 May 2016 09:20:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b3Nrc-00070A-3Y
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b3NrY-0001xg-0C
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:19:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b3NrX-0001xb-Q9; Thu, 19 May 2016 09:19:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E4B763140;
	Thu, 19 May 2016 13:19:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4JDJWQZ016615; Thu, 19 May 2016 09:19:38 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 May 2016 15:19:27 +0200
Message-Id: <1463663970-23661-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
References: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 19 May 2016 13:19:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/6] acpi: cleanup bios_linker_loader_cleanup()
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
X-TUID: ekdb58AyReMi

bios_linker_loader_cleanup() is called only from one place
and returned value is immediately freed wich makes returning
pointer from bios_linker_loader_cleanup() useless.

Cleanup bios_linker_loader_cleanup() by freeing
data there so that caller won't have to free it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c                  | 3 +--
 hw/acpi/bios-linker-loader.c         | 8 +++-----
 include/hw/acpi/bios-linker-loader.h | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8104d06..42955d6 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1531,8 +1531,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
 
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
 {
-    void *linker_data = bios_linker_loader_cleanup(tables->linker);
-    g_free(linker_data);
+    bios_linker_loader_cleanup(tables->linker);
     g_array_free(tables->rsdp, true);
     g_array_free(tables->table_data, true);
     g_array_free(tables->tcpalog, mfre);
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index a2f20ec..7a2e4d2 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -128,14 +128,12 @@ BIOSLinker *bios_linker_loader_init(void)
     return linker;
 }
 
-/* Free linker wrapper and return the linker commands array. */
-void *bios_linker_loader_cleanup(BIOSLinker *linker)
+/* Free linker wrapper */
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

