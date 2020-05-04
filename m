Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp511684lfb;
        Mon, 4 May 2020 07:41:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypIfGcFaaE5mhaQHf5goE2FXQ0Orbc0fh3i04hF6xjE22kd25DToCs/9B4yr2nQbUV+ryv0r
X-Received: by 2002:aed:258a:: with SMTP id x10mr17375211qtc.51.1588603260323;
        Mon, 04 May 2020 07:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588603260; cv=none;
        d=google.com; s=arc-20160816;
        b=0qXyp2CqX4ZUV8XAzzQwNvp/VUia28mU6eAhxGxE6JM7xYeX/39OmsP0AjTYfuMpjU
         cMHJpePm9mkpQ4tWi8emeyCwrhgb9oyUJwIv9cg3jl2to21+WQofKo+KmeO7QuPN5IB7
         sxqgDVYlwzqbQUW9ji7d79fzAEexNInF0AOl43FF1yphyfXBlN7JcNpq6VAnhFBfTjNM
         Rc0QrkoeHr8eWt9Hm4NioGTGzp4eREvFfkh8vNUH9NJ20jUGf9/7cA7p892ln+iWaZOL
         I2OImb0XEPcMvq2wjHHk5u3Sx916x4z06MA7LUljHH4PC9JkhrWNfRVJg4rDoLRgkhRl
         n/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=kyofElCtLr0NGuMPjOyHWPcjCxNtZ4I/3Dffj/xN218=;
        b=RrW7RUrVVfx5OfLwd6y24K/4ufH3/VmhcJtWA/nEhyFWh18c8QzNUbuv5E/JPDfqEO
         z+lZHH+Ml0vSuZsf/elzrruOZvue3f8/ex8aHs4zMSXSNlp10WlfK7IYdWs/GRiAjkWS
         6m9hKIC+SduigxBzwOXK4PXHQP8MHQRMG9tjnCJ4ICzkoEWzET6CEe4e2mMVKTtkkNjO
         yiHqdD1lRNdU2BjMm5zOqRnMvSzYxLlA3BUhK0KzfCoouhY+G5m3ZfQoUkhNSe1MNtuP
         uRBiNyR28YLFKPKZO2G+eQNHhU7RmLYRFZ68USvenl63DPA59c6vaqwyJx6ymS4jCCtk
         aVdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ggmcrIIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id h52si6517388qtb.39.2020.05.04.07.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 07:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ggmcrIIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVcHD-00016X-GQ
	for alex.bennee@linaro.org; Mon, 04 May 2020 10:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVc6c-000695-6o
 for qemu-arm@nongnu.org; Mon, 04 May 2020 10:30:02 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVc6a-0006NO-LE
 for qemu-arm@nongnu.org; Mon, 04 May 2020 10:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588602600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyofElCtLr0NGuMPjOyHWPcjCxNtZ4I/3Dffj/xN218=;
 b=ggmcrIIsly6yAjUkdbW0EO/TNUJBWriuPo0MNeHOyEZMTAtMzAQA0ik53XDa9j7CcIzyKx
 evPeg+vjoHj9VmCdV8vaKaKtLwVWcJbNjE3yDjb5QFQ0z6GHlXJjY/UMYCPjqpO4uzuG98
 832vayTP0bhfZXb7YMpIG11Uy2RTUeA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-yu1p39aROnCUDnZpFmJacg-1; Mon, 04 May 2020 10:29:57 -0400
X-MC-Unique: yu1p39aROnCUDnZpFmJacg-1
Received: by mail-wm1-f70.google.com with SMTP id f128so4984168wmf.8
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 07:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aaE2UTNnjw9bskNnUaoM6ia/J5Yf/idoEwzallZh50c=;
 b=R5frqED/6quHcgsiYM1k1EkTkWEkk9Eq6GWfgBH2HwCNa9jC0ppEL0vQXOpmzOUh3i
 PS+XCwL0QxUQ/22vqCGm5ihPmQP/V5itWfqV8Y6oTK4ARvus6eV9/pvP6/zqXETh4xVd
 vCNKB8BRusNFq4ZDQ82AgByHFGj26c+T33Cd00v/h5HcZ2U0fg62sHitv3227nhE/ovZ
 ehnI9oc74XfQiz/v/paKS/8T0vC7ZkfIdD3uvYNLQiuvWFAGK2bM3BbgqaOKMeX4Tldn
 cTfiaC0552K6iud//hXHZAUipb6mUnCNmIs5OSFi7k4+T0vB6fuRnoFb0PwcYjxY7i9Z
 aG4A==
X-Gm-Message-State: AGi0Pua21iQktZfYGXmvyUDdm+RJY8gY1hsJkUmvnUEmc0p6S0hNzgue
 p+54L3ydcoRsJjUfGT8RDtAfIZazOJKTcpoPJTfiBB560Dkc5/9XMhCHn9StmfbCPFqw5czmZpg
 GtbCheZ91kaCF
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr3980265wrw.29.1588602596388;
 Mon, 04 May 2020 07:29:56 -0700 (PDT)
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr3980238wrw.29.1588602596135;
 Mon, 04 May 2020 07:29:56 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id v7sm270738wmg.3.2020.05.04.07.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:29:55 -0700 (PDT)
Date: Mon, 4 May 2020 10:29:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] hw/arm/virt: Add nvdimm hot-plug infrastructure
Message-ID: <20200504142814.157589-18-mst@redhat.com>
References: <20200504142814.157589-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200504142814.157589-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Eric Auger <eric.auger@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Kwangwoo Lee <kwangwoo.lee@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9XlNeKwj8DS

From: Kwangwoo Lee <kwangwoo.lee@sk.com>

This adds support to init nvdimm acpi state and build nvdimm acpi tables.
Please note nvdimm_support is not yet enabled.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200421125934.14952-4-shameerali.kolothum.thodi@huawei.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c |  6 ++++++
 hw/arm/virt.c            | 19 +++++++++++++++++++
 hw/arm/Kconfig           |  1 +
 hw/mem/Kconfig           |  2 +-
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 60b2f521eb..6d67ace76e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_SECURE_MEM,
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
+    VIRT_NVDIMM_ACPI,
     VIRT_LOWMEMMAP_LAST,
 };
=20
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 81d41a3990..f22b1e6097 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
+#include "hw/mem/nvdimm.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "kvm_arm.h"
@@ -826,6 +827,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildT=
ables *tables)
         }
     }
=20
+    if (ms->nvdimms_state->is_enabled) {
+        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
+                          ms->nvdimms_state, ms->ram_slots);
+    }
+
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 626822554d..87f29953c4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -150,6 +150,7 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =3D           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
+    [VIRT_NVDIMM_ACPI] =3D        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that siz=
e */
     [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
@@ -1884,6 +1885,18 @@ static void machvirt_init(MachineState *machine)
=20
     create_platform_bus(vms);
=20
+    if (machine->nvdimms_state->is_enabled) {
+        const struct AcpiGenericAddress arm_virt_nvdimm_acpi_dsmio =3D {
+            .space_id =3D AML_AS_SYSTEM_MEMORY,
+            .address =3D vms->memmap[VIRT_NVDIMM_ACPI].base,
+            .bit_width =3D NVDIMM_ACPI_IO_LEN << 3
+        };
+
+        nvdimm_init_acpi_state(machine->nvdimms_state, sysmem,
+                               arm_virt_nvdimm_acpi_dsmio,
+                               vms->fw_cfg, OBJECT(vms));
+    }
+
     vms->bootinfo.ram_size =3D machine->ram_size;
     vms->bootinfo.nb_cpus =3D smp_cpus;
     vms->bootinfo.board_id =3D -1;
@@ -2095,6 +2108,8 @@ static void virt_memory_plug(HotplugHandler *hotplug_=
dev,
                              DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
+    MachineState *ms =3D MACHINE(hotplug_dev);
+    bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     Error *local_err =3D NULL;
=20
     pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
@@ -2102,6 +2117,10 @@ static void virt_memory_plug(HotplugHandler *hotplug=
_dev,
         goto out;
     }
=20
+    if (is_nvdimm) {
+        nvdimm_plug(ms->nvdimms_state);
+    }
+
     hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
                          dev, &error_abort);
=20
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 188419dc1e..5364172537 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,6 +25,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
+    select ACPI_NVDIMM
=20
 config CHEETAH
     bool
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index 2ad052a536..c27844900d 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -8,4 +8,4 @@ config MEM_DEVICE
 config NVDIMM
     bool
     default y
-    depends on (PC || PSERIES)
+    depends on (PC || PSERIES || ARM_VIRT)
--=20
MST

