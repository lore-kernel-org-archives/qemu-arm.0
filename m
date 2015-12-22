Received: by 10.182.158.201 with SMTP id ww9csp3564686obb;
        Tue, 22 Dec 2015 09:27:57 -0800 (PST)
X-Received: by 10.140.42.20 with SMTP id b20mr8703720qga.16.1450805277678;
        Tue, 22 Dec 2015 09:27:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p23si17294075qkl.19.2015.12.22.09.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Dec 2015 09:27:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBQj7-0005qz-9Q
	for alex.bennee@linaro.org; Tue, 22 Dec 2015 12:27:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aBQDW-00019h-S2
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aBQDV-0001N9-Ot
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:55:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aBQDV-0001N3-EF; Tue, 22 Dec 2015 11:55:17 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id E965D693D1;
	Tue, 22 Dec 2015 16:55:16 +0000 (UTC)
Received: from redhat.com (vpn1-5-205.ams2.redhat.com [10.36.5.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tBMGtEEu012599; Tue, 22 Dec 2015 11:55:14 -0500
Date: Tue, 22 Dec 2015 18:55:13 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1450803119-4223-56-git-send-email-mst@redhat.com>
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PULL 55/55] acpi: extend aml_and() to accept target
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
X-TUID: SCHvmWsgAjgp

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h | 2 +-
 hw/acpi/aml-build.c         | 4 ++--
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 8 +++++---
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 245c475..ef44d02 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -251,7 +251,7 @@ Aml *aml_to_integer(Aml *arg);
 Aml *aml_to_hexstring(Aml *src, Aml *dst);
 Aml *aml_to_buffer(Aml *src, Aml *dst);
 Aml *aml_store(Aml *val, Aml *target);
-Aml *aml_and(Aml *arg1, Aml *arg2);
+Aml *aml_and(Aml *arg1, Aml *arg2, Aml *dst);
 Aml *aml_or(Aml *arg1, Aml *arg2, Aml *dst);
 Aml *aml_lor(Aml *arg1, Aml *arg2);
 Aml *aml_shiftleft(Aml *arg1, Aml *count);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1f5ed5b..78e1290 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -499,9 +499,9 @@ build_opcode_2arg_dst(uint8_t op, Aml *arg1, Aml *arg2, Aml *dst)
 }
 
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefAnd */
-Aml *aml_and(Aml *arg1, Aml *arg2)
+Aml *aml_and(Aml *arg1, Aml *arg2, Aml *dst)
 {
-    return build_opcode_2arg_dst(0x7B /* AndOp */, arg1, arg2, NULL);
+    return build_opcode_2arg_dst(0x7B /* AndOp */, arg1, arg2, dst);
 }
 
 /* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefOr */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ff2fb70..0caf5ce 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -274,7 +274,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D)),
+    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
                                 aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 374644f..4cc1440 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -470,7 +470,7 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     Aml *if_ctx;
     int32_t devfn = PCI_DEVFN(slot, 0);
 
-    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot)));
+    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
     aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
     aml_append(method, if_ctx);
 }
@@ -670,7 +670,8 @@ static Aml *build_prt(void)
                    aml_store(aml_shiftright(pin, aml_int(2), NULL), slot));
         /* lnk_idx = (slot + pin) & 3 */
         aml_append(while_ctx,
-            aml_store(aml_and(aml_add(pin, slot, NULL), aml_int(3)), lnk_idx));
+            aml_store(aml_and(aml_add(pin, slot, NULL), aml_int(3), NULL),
+                      lnk_idx));
 
         /* route[2] = "LNK[D|A|B|C]", selection based on pin % 3  */
         aml_append(while_ctx, initialize_route(route, "LNKD", lnk_idx, 0));
@@ -685,7 +686,8 @@ static Aml *build_prt(void)
                       aml_index(route, aml_int(0))));
         /* route[1] = pin & 3 */
         aml_append(while_ctx,
-            aml_store(aml_and(pin, aml_int(3)), aml_index(route, aml_int(1))));
+            aml_store(aml_and(pin, aml_int(3), NULL),
+                      aml_index(route, aml_int(1))));
         /* res[pin] = route */
         aml_append(while_ctx, aml_store(route, aml_index(res, pin)));
         /* pin++ */
-- 
MST

