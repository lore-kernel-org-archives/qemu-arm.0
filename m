Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3828120lfp;
        Mon, 10 Feb 2020 05:16:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzd2Tr4AqETFmqrmDdV8OYKCyuc80CMEhfHJaaMjumofjaeg98oe9LnpVzm7q6s839yu0FH
X-Received: by 2002:a05:6214:38c:: with SMTP id l12mr9878888qvy.224.1581340599249;
        Mon, 10 Feb 2020 05:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581340599; cv=none;
        d=google.com; s=arc-20160816;
        b=diLVeHAh2NZJP3cSmyREsJlGZGEySqnhUUzj8SouM2q1lPkFgK/O389Epc8hnd2JrL
         A90TauNKGT5HNFZKNvSJud1uyUPjbIJ4doAsGbnrpAzDHxfDIF+TDy5KAxrNixuiSLkD
         xrtRPmAkbQvmtVWQHTdcEZVPU1uTiq8/F0JxtOziPnUjVz50WJ+ByTVWFXIrOX/4sKE7
         rC9UOkR1DbZrZEwwHTLHIp9CYlGSoTSasCMUAEEHKFJdrIJBL7bvpKFd8TDsTufbJyEF
         5erQ7FR8UNjgirX5207PMO4qjwucj49BcskpNEMM7akK72qqTyiSia/PLXnxrpg1oUzQ
         qBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dh/lSWBqXBxbybD/o6JKzrOm4+bjnhpVXPdo7sUTQ8I=;
        b=ZL4gvLejHM4gMeyM+6vkC06n8wDPiocrdIbLR6WneYGZykbTdUN1lKvm3R49xG6m34
         ubxhKD/k5OZPG5GKIVOfKIRCsu4xz2/fBoKNoWuVU8JOHUxG4hQMGQVVVIQi5U/7GB10
         sA7bH/kZnuKzzrQBr2Z/HIsygcHqtas7gGzeX3gTWnBMM2sNes4Qcon1TAeotqtl8brM
         xCK9n+h4a55aei8Jk00+g1+s1uAPgC7/f8rX9EL2AsNzEwqjh7dR8bmZMvXU7n3ztuIt
         trlI71b0rYXIIDxNyd2F1YI39FRtKBBqX+UTn9cXEF6ZZi3L1ODQygHJ8g3tTF3XHfyM
         laeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZYfEpvh6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si117851qka.114.2020.02.10.05.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:16:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZYfEpvh6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j18vW-0004Gj-Lx
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j18uv-0004Ac-U7
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:16:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j18uu-0007On-Lo
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:16:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53403
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j18uu-0007OG-Hf
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581340560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dh/lSWBqXBxbybD/o6JKzrOm4+bjnhpVXPdo7sUTQ8I=;
 b=ZYfEpvh6a9iIJ3yqzoTND9n5SKMjsBV1HvvLHDGIvTCHliXp9nxpBodTJq1mCleB56bVjc
 D0ja1oQECVRWlTX0C5sjKs1VWSliCLG966QEfxfC3oGLzf3MgfOoEk80+3PEWgXu1WsBPv
 oz3yKfXdDCQtm7+VZNxdZyN+6XbvD/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-7xB0NNApNLGiCcRMz9TNAw-1; Mon, 10 Feb 2020 08:15:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50925800D5C;
 Mon, 10 Feb 2020 13:15:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C97AB2656C;
 Mon, 10 Feb 2020 13:15:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [RFC 2/2] hw/arm/virt: vTPM support
Date: Mon, 10 Feb 2020 14:15:23 +0100
Message-Id: <20200210131523.27540-3-eric.auger@redhat.com>
In-Reply-To: <20200210131523.27540-1-eric.auger@redhat.com>
References: <20200210131523.27540-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 7xB0NNApNLGiCcRMz9TNAw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8no0GPKNBMfB

Let the TPM TIS device be dynamically instantiable in ARM virt.
A device tree node is dynamically created (TPM via MMIO).

The TPM Physical Presence interface (PPI) is not supported.

To run with the swtmp TPM emulator, the qemu command line must
be augmented with:

        -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
        -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
        -device tpm-tis,tpmdev=3Dtpm0 \

swtpm/libtpms command line example:

swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
--ctrl type=3Dunixio,path=3Dswtpm-sock

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/Kconfig      |  1 +
 hw/arm/sysbus-fdt.c | 36 ++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c       |  7 +++++++
 3 files changed, 44 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3d86691ae0..ce0852f148 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -5,6 +5,7 @@ config ARM_VIRT
     imply VFIO_AMD_XGBE
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
+    imply TPM_TIS
     select A15MPCORE
     select ACPI
     select ARM_SMMUV3
diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 022fc97ecd..d723fad6ba 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -30,6 +30,7 @@
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/tpm.h"
 #include "hw/platform-bus.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
@@ -434,6 +435,40 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
 #define VFIO_PLATFORM_BINDING(compat, add_fn) \
     {TYPE_VFIO_PLATFORM, (compat), (add_fn), vfio_platform_match}
=20
+/*
+ * add_tpm_tis_fdt_node: Create a DT node for TPM TIS
+ *
+ * See kernel documentation:
+ * Documentation/devicetree/bindings/security/tpm/tpm_tis_mmio.txt
+ * Optional interrupt for command completion is not exposed
+ */
+static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data =3D opaque;
+    PlatformBusDevice *pbus =3D data->pbus;
+    void *fdt =3D data->fdt;
+    const char *parent_node =3D data->pbus_node_name;
+    int compat_str_len;
+    char *nodename;
+    uint32_t reg_attr[2];
+    uint64_t mmio_base;
+
+    mmio_base =3D platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename =3D g_strdup_printf("%s/tpm_tis@%" PRIx64, parent_node, mmio_=
base);
+    qemu_fdt_add_subnode(fdt, nodename);
+
+    compat_str_len =3D strlen("tcg,tpm-tis-mmio") + 1;
+    qemu_fdt_setprop(fdt, nodename, "compatible", "tcg,tpm-tis-mmio",
+                     compat_str_len);
+
+    reg_attr[0] =3D cpu_to_be32(mmio_base);
+    reg_attr[1] =3D cpu_to_be32(0x5000);
+    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr, 2 * sizeof(uint32_t))=
;
+
+    g_free(nodename);
+    return 0;
+}
+
 #endif /* CONFIG_LINUX */
=20
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
@@ -455,6 +490,7 @@ static const BindingEntry bindings[] =3D {
     TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_nod=
e),
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
+    TYPE_BINDING(TYPE_TPM_TIS, add_tpm_tis_fdt_node),
 #endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f788fe27d6..1bb34dfa0b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -47,6 +47,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tpm.h"
 #include "sysemu/kvm.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
@@ -2041,6 +2042,7 @@ static void virt_machine_class_init(ObjectClass *oc, =
void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS);
     mc->block_default_type =3D IF_VIRTIO;
     mc->no_cdrom =3D 1;
     mc->pci_allow_0_address =3D true;
@@ -2153,6 +2155,11 @@ type_init(machvirt_machine_init);
=20
 static void virt_machine_5_0_options(MachineClass *mc)
 {
+    static GlobalProperty compat[] =3D {
+        { TYPE_TPM_TIS, "ppi", "false" },
+    };
+
+    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
=20
--=20
2.20.1

