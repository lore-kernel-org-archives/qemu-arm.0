Received: by 10.25.159.19 with SMTP id i19csp573872lfe;
        Sat, 6 Feb 2016 11:27:40 -0800 (PST)
X-Received: by 10.140.31.8 with SMTP id e8mr25360472qge.14.1454786860503;
        Sat, 06 Feb 2016 11:27:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g184si107774qhd.51.2016.02.06.11.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 11:27:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS8WC-0002Zt-0h
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 14:27:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aS8Jv-0004vG-Q4
	for qemu-devel@nongnu.org; Sat, 06 Feb 2016 14:15:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aS8Ju-0002xm-BK
	for qemu-devel@nongnu.org; Sat, 06 Feb 2016 14:14:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aS8Jq-0002wt-NJ; Sat, 06 Feb 2016 14:14:54 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 623F33F3A2;
	Sat,  6 Feb 2016 19:14:54 +0000 (UTC)
Received: from redhat.com (vpn1-5-159.ams2.redhat.com [10.36.5.159])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u16JEmxU009165; Sat, 6 Feb 2016 14:14:49 -0500
Date: Sat, 6 Feb 2016 21:14:48 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1454784308-21177-40-git-send-email-mst@redhat.com>
References: <1454784308-21177-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454784308-21177-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Steven Newbury <steve@snewbury.org.uk>, Michael Tokarev <mjt@tls.msk.ru>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Aleksei Kovura <alex3kov@zoho.com>, qemu-arm@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PULL v2 39/45] acpi: expose oem_id and oem_table_id
	in build_rsdt()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jFEGGbr3FQzf

From: Laszlo Ersek <lersek@redhat.com>

Since build_rsdt() is implemented as common utility code (in
"hw/acpi/aml-build.c"), it should expose -- and forward -- the oem_id and
oem_table_id parameters between board code and the generic build_header()
function.

Cc: "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
Cc: Igor Mammedov <imammedo@redhat.com> (supporter:ACPI/SMBIOS)
Cc: Shannon Zhao <zhaoshenglong@huawei.com> (maintainer:ARM ACPI Subsystem)
Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86)
Cc: Richard W.M. Jones <rjones@redhat.com>
Cc: Aleksei Kovura <alex3kov@zoho.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Steven Newbury <steve@snewbury.org.uk>
RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1248758
LP: https://bugs.launchpad.net/qemu/+bug/1533848
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 include/hw/acpi/aml-build.h | 3 ++-
 hw/acpi/aml-build.c         | 5 +++--
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index c460bdd..aa29d30 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -364,6 +364,7 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
-build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets);
+build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
+           const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index e4b6c0c..603068b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1492,7 +1492,8 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
 
 /* Build rsdt table */
 void
-build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets)
+build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
+           const char *oem_id, const char *oem_table_id)
 {
     AcpiRsdtDescriptorRev1 *rsdt;
     size_t rsdt_len;
@@ -1511,5 +1512,5 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets)
                                        sizeof(uint32_t));
     }
     build_header(linker, table_data,
-                 (void *)rsdt, "RSDT", rsdt_len, 1, NULL, NULL);
+                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8017b12..560764f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -643,7 +643,7 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
 
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
-    build_rsdt(tables_blob, tables->linker, table_offsets);
+    build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     build_rsdp(tables->rsdp, tables->linker, rsdt);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 061a9cb..705d12f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2681,7 +2681,7 @@ void acpi_build(AcpiBuildTables *tables)
 
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
-    build_rsdt(tables_blob, tables->linker, table_offsets);
+    build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     build_rsdp(tables->rsdp, tables->linker, rsdt);
-- 
MST

