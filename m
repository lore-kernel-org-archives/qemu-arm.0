Received: by 10.182.158.201 with SMTP id ww9csp3563125obb;
        Tue, 22 Dec 2015 09:25:00 -0800 (PST)
X-Received: by 10.55.15.228 with SMTP id 97mr34465600qkp.98.1450805100085;
        Tue, 22 Dec 2015 09:25:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d90si35410126qge.52.2015.12.22.09.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Dec 2015 09:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBQgF-0001AC-N6
	for alex.bennee@linaro.org; Tue, 22 Dec 2015 12:24:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aBQDU-00014T-Kj
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:55:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aBQDS-0001M8-Cw
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:55:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aBQDS-0001Ld-33; Tue, 22 Dec 2015 11:55:14 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9CE873B712;
	Tue, 22 Dec 2015 16:55:13 +0000 (UTC)
Received: from redhat.com (vpn1-5-205.ams2.redhat.com [10.36.5.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tBMGtAkZ012571; Tue, 22 Dec 2015 11:55:11 -0500
Date: Tue, 22 Dec 2015 18:55:10 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1450803119-4223-55-git-send-email-mst@redhat.com>
References: <1450803119-4223-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450803119-4223-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PULL 54/55] acpi: extend aml_or() to accept target
	argument
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
X-TUID: //wMYU85/Adu

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
---
 include/hw/acpi/aml-build.h | 2 +-
 hw/acpi/aml-build.c         | 4 ++--
 hw/arm/virt-acpi-build.c    | 6 +++---
 hw/i386/acpi-build.c        | 3 ++-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index dd3e1ca..245c475 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -252,7 +252,7 @@ Aml *aml_to_hexstring(Aml *src, Aml *dst);
 Aml *aml_to_buffer(Aml *src, Aml *dst);
 Aml *aml_store(Aml *val, Aml *target);
 Aml *aml_and(Aml *arg1, Aml *arg2);
-Aml *aml_or(Aml *arg1, Aml *arg2);
+Aml *aml_or(Aml *arg1, Aml *arg2, Aml *dst);
 Aml *aml_lor(Aml *arg1, Aml *arg2);
 Aml *aml_shiftleft(Aml *arg1, Aml *count);
 Aml *aml_shiftright(Aml *arg1, Aml *count, Aml *dst);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 0ab8087..1f5ed5b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -505,9 +505,9 @@ Aml *aml_and(Aml *arg1, Aml *arg2)
 }
 
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefOr */
-Aml *aml_or(Aml *arg1, Aml *arg2)
+Aml *aml_or(Aml *arg1, Aml *arg2, Aml *dst)
 {
-    return build_opcode_2arg_dst(0x7D /* OrOp */, arg1, arg2, NULL);
+    return build_opcode_2arg_dst(0x7D /* OrOp */, arg1, arg2, dst);
 }
 
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefLOr */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7aa0ab3..ff2fb70 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -278,12 +278,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                                 aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08)),
+    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
                                  aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10)),
+    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
                                  aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
@@ -292,7 +292,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(method, ifctx);
 
     elsectx = aml_else();
-    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4)),
+    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
                                   aml_name("CDW1")));
     aml_append(elsectx, aml_return(aml_arg(3)));
     aml_append(method, elsectx);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4e9855a..374644f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -680,7 +680,8 @@ static Aml *build_prt(void)
 
         /* route[0] = 0x[slot]FFFF */
         aml_append(while_ctx,
-            aml_store(aml_or(aml_shiftleft(slot, aml_int(16)), aml_int(0xFFFF)),
+            aml_store(aml_or(aml_shiftleft(slot, aml_int(16)), aml_int(0xFFFF),
+                             NULL),
                       aml_index(route, aml_int(0))));
         /* route[1] = pin & 3 */
         aml_append(while_ctx,
-- 
MST

