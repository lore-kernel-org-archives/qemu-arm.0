Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4067048lfi;
        Tue, 31 Mar 2020 07:59:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuimtDMZBR8UOFQ4o2r/QdplNv/yIWAr219eI+xlthA830EuhKN+RUWtVJGBZ895yD9goCB
X-Received: by 2002:ad4:4581:: with SMTP id x1mr16147442qvu.152.1585666758552;
        Tue, 31 Mar 2020 07:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585666758; cv=none;
        d=google.com; s=arc-20160816;
        b=FOwOG4m1PLKomjpxlC3dg2YDoccOTmgAZs2kUrts2aPlMvZLpccwBz7RbXmSRzBHlz
         WVop/mT5pdU6ODZgIoco5Ol5YPLeGUAxd8w2EjXdIgqBTfmsRgM4iS0rFgy9VlIPHCKq
         Xn8rLXaYgEEW12dwt57Rtq22vTSNgQ4NpuUgI1dUXGJ5YNCmXNVAgPjSFlz4gL/riZHy
         lp0TlaCW06hRnZZlHBkR9v5tXV9rDzz4uhRZGPjqoBU3j2Tbfc72a6VQjfxh6JECQ5pc
         Ks5Un5SGAzyUmSyI6ybvA1gszAaN5l/MNMr4RAofl479fUg/PlgrwBBm6fKZ0pxPmzXo
         D4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=8QtCPGEv/CZtqoxyrND20GKfQEi1sCdM3G8yZMGmfOo=;
        b=ILEm8ocNvWD5c7paPDToEAjAzTBp52jIvJANFAQhawtv/orifcdbV5WP9kQPPeGsSa
         /G2kWuycbrMm3c34fAu17KY7pfPHa1kT36f5cS6A94pTjRbZKUdfLmfu+d6rmwmsGpXr
         +HM/2LBKpGEBifnJ6DDXbLMahERyoLbv3Mjf/OpuEY0CkM9oJ3XTA2ycrSSWveZopnfR
         1GB2HPcIhwNozlpaBq4ze16azbUlhz65036KX4R/tWJDvXNcbRHKnm6fa7rHVsSDVhqY
         3xO5RiIhYlgz6KvHc6XhsldndouZIv6XOnsGH4YQcZKQx4ivLj8PDv9h3y4gDBhTvFEu
         Zutg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A1kqJE+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx9si10079387qvb.43.2020.03.31.07.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 07:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A1kqJE+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJIMH-0003Od-Tz
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jJIKa-0000Tt-Dl
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 10:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jJIKY-0005Jj-GO
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 10:57:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38227
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jJIKY-0005JG-A4
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 10:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585666649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QtCPGEv/CZtqoxyrND20GKfQEi1sCdM3G8yZMGmfOo=;
 b=A1kqJE+LbAkf2TSElGWVZnvLA496eh0Z9B5lusec4pSAGBd6XePodOVmWZHyYL8r5vORZA
 IoOIGXIyyK01GMn+JFehc94xCVbQ3G6WoUrvfl2qMZoBE3vXA0jKoMUR2WT7mAAa3GyKyO
 CGXXPOlcctjAF34mesEackZzkUkAzqw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-F_WfuExtPceuBrkpWS9ozA-1; Tue, 31 Mar 2020 10:57:25 -0400
X-MC-Unique: F_WfuExtPceuBrkpWS9ozA-1
Received: by mail-wr1-f71.google.com with SMTP id f15so13177558wrt.4
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 07:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DO2c2hX6OozgKYw5tPhyMzNh8a/0BxHCgkRpZwXkAWc=;
 b=Fc9ClROdvwGhK0sSHGF0v7sg+BwWD7Rx8wrpSsWqoJTN2248Fevr9s0fQ8fPuAidI4
 oP19ErgW9nZuNi+8zdH/Io6d4K1BVJeJVliHw4+UGoOAv3Sd6iNAPseCHkhp41HAmkrf
 EeGRorPAynCeV5exz5yaGMY2AVLAK4fsu8dlCWhlo2S8L5FWG/ojjnKviW/iqK3vW6kD
 880Kyh5B/u99Ji+LMsS2MH1XyqQaVw092MEG3X6qrEY2a7/cPK32SdlkjpDFgkJ2QRFi
 Hr85oxaJzDWcalEkicbJFLC38PCVQVInhyH5lruJSBBoWXDoKKNMIHFbEQDxo/SWQ4Hv
 xT/Q==
X-Gm-Message-State: ANhLgQ0kaYppuC93tvOU50Wdr8oAIvPcNkGFrmwlG3ose0C+EU8ytlKH
 /21vtS/aeSivBhuAHMglaNgKK5PfhRXi/jfaYR2YEyRFF4+bbzA7qOoqEF2rWLPS+fmCXBj8Uzp
 G9BniSHofeG82
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr4015331wmc.135.1585666644229; 
 Tue, 31 Mar 2020 07:57:24 -0700 (PDT)
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr4015311wmc.135.1585666643935; 
 Tue, 31 Mar 2020 07:57:23 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h132sm4418038wmf.18.2020.03.31.07.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 07:57:23 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:57:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] acpi: add acpi=OnOffAuto machine property to x86 and
 arm virt
Message-ID: <20200331145631.135630-10-mst@redhat.com>
References: <20200331145631.135630-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200331145631.135630-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4JAH9QJnW8Gx

From: Gerd Hoffmann <kraxel@redhat.com>

Remove the global acpi_enabled bool and replace it with an
acpi OnOffAuto machine property.

qemu throws an error now if you use -no-acpi while the machine
type you are using doesn't support acpi in the first place.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20200320100136.11717-1-kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi.h   |  1 -
 include/hw/arm/virt.h    |  2 ++
 include/hw/i386/x86.h    |  3 +++
 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            | 36 ++++++++++++++++++++++++++++++++++--
 hw/i386/acpi-build.c     |  2 +-
 hw/i386/pc.c             |  4 ++--
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/x86.c            | 32 ++++++++++++++++++++++++++++++++
 softmmu/vl.c             |  4 ++--
 10 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 1f2dafbd7d..4bef575312 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -181,7 +181,6 @@ void acpi_send_gpe_event(ACPIREGS *ar, qemu_irq irq,
 void acpi_update_sci(ACPIREGS *acpi_regs, qemu_irq irq);
=20
 /* acpi.c */
-extern int acpi_enabled;
 extern char unsigned *acpi_tables;
 extern size_t acpi_tables_len;
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 893796d3b0..60b2f521eb 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -131,6 +131,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
     uint16_t virtio_iommu_bdf;
@@ -163,6 +164,7 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
=20
 void virt_acpi_setup(VirtMachineState *vms);
+bool virt_is_acpi_enabled(VirtMachineState *vms);
=20
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 22babcb3bb..54af8ab5cf 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -64,6 +64,7 @@ typedef struct {
     unsigned smp_dies;
=20
     OnOffAuto smm;
+    OnOffAuto acpi;
=20
     /*
      * Address space used by IOAPIC device. All IOAPIC interrupts
@@ -74,6 +75,7 @@ typedef struct {
=20
 #define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define X86_MACHINE_SMM              "smm"
+#define X86_MACHINE_ACPI             "acpi"
=20
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 #define X86_MACHINE(obj) \
@@ -104,6 +106,7 @@ void x86_load_linux(X86MachineState *x86ms,
                     bool linuxboot_dma_enabled);
=20
 bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
+bool x86_machine_is_acpi_enabled(X86MachineState *x86ms);
=20
 /* Global System Interrupts */
=20
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fb4b166f82..7ef0733d71 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -910,7 +910,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
=20
-    if (!acpi_enabled) {
+    if (!virt_is_acpi_enabled(vms)) {
         trace_virt_acpi_setup();
         return;
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94f93dda54..7dc96abf72 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -67,6 +67,7 @@
 #include "kvm_arm.h"
 #include "hw/firmware/smbios.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-common.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
@@ -1844,7 +1845,7 @@ static void machvirt_init(MachineState *machine)
=20
     create_pcie(vms);
=20
-    if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
+    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)=
) {
         vms->acpi_dev =3D create_acpi_ged(vms);
     } else {
         create_gpio(vms);
@@ -1934,6 +1935,31 @@ static void virt_set_its(Object *obj, bool value, Er=
ror **errp)
     vms->its =3D value;
 }
=20
+bool virt_is_acpi_enabled(VirtMachineState *vms)
+{
+    if (vms->acpi =3D=3D ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+    OnOffAuto acpi =3D vms->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &vms->acpi, errp);
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
@@ -2113,7 +2139,7 @@ static HotplugHandler *virt_machine_get_hotplug_handl=
er(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         VirtMachineState *vms =3D VIRT_MACHINE(machine);
=20
-        if (!vms->bootinfo.firmware_loaded || !acpi_enabled) {
+        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) =
{
             return HOTPLUG_HANDLER(machine);
         }
     }
@@ -2184,6 +2210,12 @@ static void virt_machine_class_init(ObjectClass *oc,=
 void *data)
     mc->numa_mem_supported =3D true;
     mc->auto_enable_numa_with_memhp =3D true;
     mc->default_ram_id =3D "mach-virt.ram";
+
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+        virt_get_acpi, virt_set_acpi,
+        NULL, NULL, &error_abort);
+    object_class_property_set_description(oc, "acpi",
+        "Enable ACPI", &error_abort);
 }
=20
 static void virt_instance_init(Object *obj)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9a19c14e66..2a7e55bae7 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -3024,7 +3024,7 @@ void acpi_setup(void)
         return;
     }
=20
-    if (!acpi_enabled) {
+    if (!x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 98ee763f68..0bf0aaca52 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1297,7 +1297,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
      * but pcms->acpi_dev is still created. Check !acpi_enabled in
      * addition to cover this case.
      */
-    if (!pcms->acpi_dev || !acpi_enabled) {
+    if (!pcms->acpi_dev || !x86_machine_is_acpi_enabled(X86_MACHINE(pcms))=
) {
         error_setg(errp,
                    "memory hotplug is not enabled: missing acpi device or =
acpi disabled");
         return;
@@ -1351,7 +1351,7 @@ static void pc_memory_unplug_request(HotplugHandler *=
hotplug_dev,
      * but pcms->acpi_dev is still created. Check !acpi_enabled in
      * addition to cover this case.
      */
-    if (!pcms->acpi_dev || !acpi_enabled) {
+    if (!pcms->acpi_dev || !x86_machine_is_acpi_enabled(X86_MACHINE(pcms))=
) {
         error_setg(&local_err,
                    "memory hotplug is not enabled: missing acpi device or =
acpi disabled");
         goto out;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e6756216f9..9cceae3e2c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -275,7 +275,7 @@ static void pc_init1(MachineState *machine,
         pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
     }
=20
-    if (pcmc->pci_enabled && acpi_enabled) {
+    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms)=
)) {
         DeviceState *piix4_pm;
=20
         smi_irq =3D qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0)=
;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 87b73fe33c..6ca3cf936f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -904,11 +904,37 @@ static void x86_machine_set_smm(Object *obj, Visitor =
*v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
=20
+bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
+{
+    if (x86ms->acpi =3D=3D ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void x86_machine_get_acpi(Object *obj, Visitor *v, const char *name=
,
+                                 void *opaque, Error **errp)
+{
+    X86MachineState *x86ms =3D X86_MACHINE(obj);
+    OnOffAuto acpi =3D x86ms->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name=
,
+                                 void *opaque, Error **errp)
+{
+    X86MachineState *x86ms =3D X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms =3D X86_MACHINE(obj);
=20
     x86ms->smm =3D ON_OFF_AUTO_AUTO;
+    x86ms->acpi =3D ON_OFF_AUTO_AUTO;
     x86ms->max_ram_below_4g =3D 0; /* use default */
     x86ms->smp_dies =3D 1;
 }
@@ -937,6 +963,12 @@ static void x86_machine_class_init(ObjectClass *oc, vo=
id *data)
         NULL, NULL, &error_abort);
     object_class_property_set_description(oc, X86_MACHINE_SMM,
         "Enable SMM", &error_abort);
+
+    object_class_property_add(oc, X86_MACHINE_ACPI, "OnOffAuto",
+        x86_machine_get_acpi, x86_machine_set_acpi,
+        NULL, NULL, &error_abort);
+    object_class_property_set_description(oc, X86_MACHINE_ACPI,
+        "Enable ACPI", &error_abort);
 }
=20
 static const TypeInfo x86_machine_info =3D {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 814537bb42..a331fb5321 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -144,7 +144,6 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack =3D 0;
 int singlestep =3D 0;
-int acpi_enabled =3D 1;
 int no_hpet =3D 0;
 int fd_bootchk =3D 1;
 static int no_reboot;
@@ -3516,7 +3515,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 vnc_parse(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_no_acpi:
-                acpi_enabled =3D 0;
+                olist =3D qemu_find_opts("machine");
+                qemu_opts_parse_noisily(olist, "acpi=3Doff", false);
                 break;
             case QEMU_OPTION_no_hpet:
                 no_hpet =3D 1;
--=20
MST

