Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp295999lfp;
        Wed, 12 Feb 2020 23:38:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcp6d8XKLYoHPluuh7W2KDZ2xXX0tSFTzoMniAeNPrcTEcfc2eTNxzF1VarXkduiFkzMe5
X-Received: by 2002:a37:4dc4:: with SMTP id a187mr14653842qkb.436.1581579520665;
        Wed, 12 Feb 2020 23:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581579520; cv=none;
        d=google.com; s=arc-20160816;
        b=hy84iQxl+5DyLNJtxJmfkIONmFpWMtwHYuJF+cIghPvnfj4+qZNblMPGFt6bPTcmlB
         +TQiA3uGQqXxFjK27l5a2sERz2DWKer5JEiT3EbKB4vWpo6BrNU4Ea2HSesdJif2J/aP
         UgrSq8ZF0PWb9oGzZNGColA2A0pGFWEyNXPVYiFUXRpTgXwjE1L3Uu4OjRY/HwTqRReg
         CEs7LFf/4IiINXJxA6cLuEfFXRtjFHjvyofFf38NeHXTTVzgcMFDf/vf0F8zpTkoJTh1
         tai820ZNPWiF1sX3YPROn6oAxGXMw6zKqz2XaFhbJ0WDbd5Esd0iJOyPQkgEdo9B8zhL
         z+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1n3lqZSoTv31YaIWwdtWAgvBt2nwUo6Y3bsQJbU+S4M=;
        b=RT28B60X0YXARykGg/yLFCR2ZK9P+HJr4qHC429RGfAM8Dp4vNpUK+EW/kp26nKBxV
         BntjifJYfaTR6zk50tsTx29LlW+iojTi0HOXFLyd5UappIcqojQv+JDfnvtZL1DW4Vad
         ke2vAljJN6fUCKjHBXVNxxJNF0pNeB5nz3ZkK+oZZ8FfpND48h7MwYBPdAjECriem5Y9
         qpaDZUMOyrRmlje27lp/umbl81Ke9zxLkKmsg4LMYIiN4cBvkdhbZHL+ig0BH25lyknc
         omP/n+HlifcZIofMMo9ytOIuwrzySSVlNzNMfky+v0kNcQWreYFSWDAXRyIHHOIxGSpm
         UP3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b27si815808qkh.304.2020.02.12.23.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 23:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2956-0004fq-50
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 02:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j293K-0001mI-Ny
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 02:36:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j293J-000578-ES
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 02:36:50 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2765 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j293J-00055t-1d; Thu, 13 Feb 2020 02:36:49 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 77AA469E7198E136C052;
 Thu, 13 Feb 2020 15:36:45 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 15:36:34 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 4/4] arm: Create the cpufreq device
Date: Thu, 13 Feb 2020 15:36:30 +0800
Message-ID: <20200213073630.2125-5-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20200213073630.2125-1-fangying1@huawei.com>
References: <20200213073630.2125-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DnobvaSPYihW

Add the cpufreq device to arm64 virt machine

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 default-configs/aarch64-softmmu.mak |  1 +
 hw/acpi/Kconfig                     |  4 ++++
 hw/arm/virt.c                       | 13 +++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch6=
4-softmmu.mak
index 958b1e08e4..0a030e853f 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -6,3 +6,4 @@ include arm-softmmu.mak
 CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
 CONFIG_SBSA_REF=3Dy
+CONFIG_CPUFREQ=3Dy
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 54209c6f2f..7d8aa58492 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -38,3 +38,7 @@ config ACPI_VMGENID
     depends on PC
=20
 config ACPI_HW_REDUCED
+
+config CPUFREQ
+    bool
+    default y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ed9dc38b60..53638f9557 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -764,6 +764,17 @@ static void create_uart(const VirtMachineState *vms,=
 int uart,
     g_free(nodename);
 }
=20
+static void create_cpufreq(const VirtMachineState *vms, MemoryRegion *me=
m)
+{
+    hwaddr base =3D vms->memmap[VIRT_CPUFREQ].base;
+    DeviceState *dev =3D qdev_create(NULL, "cpufreq");
+    SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
+
+    qdev_init_nofail(dev);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0))=
;
+}
+
+
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -1723,6 +1734,8 @@ static void machvirt_init(MachineState *machine)
=20
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
=20
+    create_cpufreq(vms, sysmem);
+
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
         create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
--=20
2.19.1


