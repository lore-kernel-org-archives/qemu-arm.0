Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp295054lfp;
        Wed, 12 Feb 2020 23:37:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/xGVaT3ghgff76V63DwpWpfaouGvUf2NB6pmbEkxLWkkThy8QaiYDGseE+SIZKKtuiH4w
X-Received: by 2002:a37:b601:: with SMTP id g1mr11170800qkf.114.1581579447832;
        Wed, 12 Feb 2020 23:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581579447; cv=none;
        d=google.com; s=arc-20160816;
        b=d2ve4yf0ZIvwLi33NnXniJ7/OdDx80Kc/nukaiuf9RjC8Ycs1ku9pwlImUYlhDZwX2
         B6RmQ2ZQaqy05aNY9P1j70ERmfihuxc2MLz8S6ttAoLDO8wk071oNDztiGVnusGknyjI
         m6uPd6/nK2vw9hREwNCFEESUevOfBV3U4bl4KGMpYcyc5fjUw78Ym8qHNdnZJTJ9qZB/
         fPZXVOigiUN0Rq59UpKSsWEuvsIdoUp4VkcWNuVbEMSAtrw2lxVsY6HH2BzzwGeOC5Kh
         /f/D8+B6sW01RrsGrTaW1pRpaOP7XnosOubUqGzAt9dAsxNcWpYoYvNlyDznA2lzPfSH
         Vq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7BGaiRB+e7/B57lYDWhq1IzdRrJFDb9DGTgCxY2v2FU=;
        b=YyZlKuqaGzFsOsqkl6iX2DB3tgQj5e+wVUe6o4a6dhQW0W5gbi609rAiSoTlK6BVZh
         nKIB0f0/TamcuGCxL4sIkR3I87EoUAAJFe+TWS2oEl1hfL3ynCbZEAJzhsdXjtg15elI
         cglQQdASzik+beTl8oC1t9dEf03qwKLV4HAtqp202DxJGfSxbHGNLPHaj0cxjhM0J+nJ
         uGxTIeSX8me4unUO293N2rxQA5VQk6yigWjeaWJc/Cv/wk9H8PjAa3o0e2T5nMcEpjWI
         /dyGIOMCX0dtwQTO00s6aSbGQ9J9l9ew1JQijYULQysb3Mel9wcKzej7/ODTDfzKKYBq
         agbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si753967qkb.99.2020.02.12.23.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 23:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j293v-0002eV-6z
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 02:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56456)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j293J-0001ha-5U
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 02:36:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j293G-00056H-KB
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 02:36:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2705 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j293F-000557-AL; Thu, 13 Feb 2020 02:36:46 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C84ED23787A711AEBACA;
 Thu, 13 Feb 2020 15:36:41 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 15:36:34 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 3/4] arm: Add the cpufreq device model
Date: Thu, 13 Feb 2020 15:36:29 +0800
Message-ID: <20200213073630.2125-4-fangying1@huawei.com>
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
X-Received-From: 45.249.212.190
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
X-TUID: Icrp6DSSVp4u

On ARM64 platform, CPU frequency is retrieved by ACPI CPPC,
so here we create the virtual cpufreq device to present
the CPPC registers and ACPI _CPC objects.

The default frequency is set host CPU nominal frequency, which
is obtained from the host CPPC sysfs. Other performance data
are set to the same value, since we don't support guest performance scali=
ng.

Performance counters are also not emulated and they simply return 1
if readed, and guest should fallback to use the desired performance
value as the current performance.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/Makefile.objs |   1 +
 hw/acpi/cpufreq.c     | 249 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 250 insertions(+)
 create mode 100644 hw/acpi/cpufreq.c

diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 777da07f4d..61530675d4 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -16,6 +16,7 @@ common-obj-y +=3D bios-linker-loader.o
 common-obj-y +=3D aml-build.o utils.o
 common-obj-$(CONFIG_ACPI_PCI) +=3D pci.o
 common-obj-$(CONFIG_TPM) +=3D tpm.o
+common-obj-$(CONFIG_CPUFREQ) +=3D cpufreq.o
=20
 common-obj-$(CONFIG_IPMI) +=3D ipmi.o
 common-obj-$(call lnot,$(CONFIG_IPMI)) +=3D ipmi-stub.o
diff --git a/hw/acpi/cpufreq.c b/hw/acpi/cpufreq.c
new file mode 100644
index 0000000000..57fa35a29e
--- /dev/null
+++ b/hw/acpi/cpufreq.c
@@ -0,0 +1,249 @@
+/*
+ * ACPI CPPC register device
+ *
+ * Support for showing CPU frequency in guest OS.
+ *
+ * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO.,LTD.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License alo=
ng
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "chardev/char.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "qemu/option.h"
+#include "sysemu/sysemu.h"
+#include "hw/acpi/acpi-defs.h"
+#include "qemu/cutils.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+
+#define TYPE_CPUFREQ "cpufreq"
+#define CPUFREQ(obj) OBJECT_CHECK(CpufreqState, (obj), TYPE_CPUFREQ)
+#define NOMINAL_FREQ_FILE "/sys/devices/system/cpu/cpu0/acpi_cppc/nomina=
l_freq"
+#define CPU_MAX_FREQ_FILE "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_=
max_freq"
+#define HZ_MAX_LENGTH 1024
+#define MAX_SUPPORT_SPACE 0x10000
+
+typedef struct CpufreqState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t HighestPerformance;
+    uint32_t NominalPerformance;
+    uint32_t LowestNonlinearPerformance;
+    uint32_t LowestPerformance;
+    uint32_t GuaranteedPerformance;
+    uint32_t DesiredPerformance;
+    uint64_t ReferencePerformanceCounter;
+    uint64_t DeliveredPerformanceCounter;
+    uint32_t PerformanceLimited;
+    uint32_t LowestFreq;
+    uint32_t NominalFreq;
+    uint32_t reg_size;
+} CpufreqState;
+
+
+static uint64_t cpufreq_read(void *opaque, hwaddr offset,
+                             unsigned size)
+{
+    CpufreqState *s =3D (CpufreqState *)opaque;
+    uint64_t r;
+    uint64_t n;
+
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+    unsigned int smp_cpus =3D ms->smp.cpus;
+
+    if (offset >=3D smp_cpus * CPPC_REG_PER_CPU_STRIDE) {
+        warn_report("cpufreq_read: offset 0x%" HWADDR_PRIx " out of rang=
e",
+                    offset);
+        return 0;
+    }
+
+    n =3D offset % CPPC_REG_PER_CPU_STRIDE;
+    switch (n) {
+    case 0:
+        r =3D s->HighestPerformance;
+        break;
+    case 4:
+        r =3D s->NominalPerformance;
+        break;
+    case 8:
+        r =3D s->LowestNonlinearPerformance;
+        break;
+    case 12:
+        r =3D s->LowestPerformance;
+        break;
+    case 16:
+        r =3D s->GuaranteedPerformance;
+        break;
+    case 20:
+        r =3D s->DesiredPerformance;
+        break;
+    /*
+     * We don't have real counters and it is hard to emulate, so always =
set the
+     * counter value to 1 to rely on Linux to use the DesiredPerformance=
 value
+     * directly.
+     */
+    case 24:
+        r =3D s->ReferencePerformanceCounter;
+        break;
+    /*
+     * Guest may still access the register by 32bit; add the process to
+     * eliminate unnecessary warnings
+     */
+    case 28:
+        r =3D s->ReferencePerformanceCounter >> 32;
+        break;
+    case 32:
+        r =3D s->DeliveredPerformanceCounter;
+        break;
+    case 36:
+        r =3D s->DeliveredPerformanceCounter >> 32;
+        break;
+
+    case 40:
+        r =3D s->PerformanceLimited;
+        break;
+    case 44:
+        r =3D s->LowestFreq;
+        break;
+    case 48:
+        r =3D s->NominalFreq;
+        break;
+    default:
+        error_printf("cpufreq_read: Bad offset 0x%" HWADDR_PRIx "\n", of=
fset);
+        r =3D 0;
+        break;
+    }
+    return r;
+}
+
+static void cpufreq_write(void *opaque, hwaddr offset,
+                          uint64_t value, unsigned size)
+{
+    uint64_t n;
+
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+    unsigned int smp_cpus =3D ms->smp.cpus;
+
+    if (offset >=3D smp_cpus * CPPC_REG_PER_CPU_STRIDE) {
+        error_printf("cpufreq_write: offset 0x%" HWADDR_PRIx " out of ra=
nge",
+                     offset);
+        return;
+    }
+
+    n =3D offset % CPPC_REG_PER_CPU_STRIDE;
+
+    switch (n) {
+    case 20:
+        break;
+    default:
+        error_printf("cpufreq_write: Bad offset 0x%" HWADDR_PRIx "\n", o=
ffset);
+    }
+}
+
+static uint32_t CPPC_Read(const char *hostpath)
+{
+    int fd;
+    char buffer[HZ_MAX_LENGTH] =3D { 0 };
+    unsigned long hz;
+    const char *endptr =3D NULL;
+    int len;
+    int ret;
+
+    fd =3D qemu_open(hostpath, O_RDONLY);
+    if (fd < 0) {
+        return 0;
+    }
+
+    len =3D read(fd, buffer, HZ_MAX_LENGTH);
+    qemu_close(fd);
+    if (len <=3D 0) {
+        return 0;
+    }
+    ret =3D qemu_strtoul(buffer, &endptr, 0, &hz);
+    if (ret < 0) {
+        return 0;
+    }
+    return (uint32_t)hz;
+}
+
+static const MemoryRegionOps cpufreq_ops =3D {
+    .read =3D cpufreq_read,
+    .write =3D cpufreq_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
+static void hz_init(CpufreqState *s)
+{
+    uint32_t hz;
+
+    hz =3D CPPC_Read(NOMINAL_FREQ_FILE);
+    if (hz =3D=3D 0) {
+        hz =3D CPPC_Read(CPU_MAX_FREQ_FILE);
+        /* Value in CpuMaxFrequency is in KHz unit; convert to MHz */
+        hz =3D hz / 1000;
+    }
+
+    s->HighestPerformance =3D hz;
+    s->NominalPerformance =3D hz;
+    s->LowestNonlinearPerformance =3D hz;
+    s->LowestPerformance =3D hz;
+    s->GuaranteedPerformance =3D hz;
+    s->DesiredPerformance =3D hz;
+    s->ReferencePerformanceCounter =3D 1;
+    s->DeliveredPerformanceCounter =3D 1;
+    s->PerformanceLimited =3D 0;
+    s->LowestFreq =3D hz;
+    s->NominalFreq =3D hz;
+}
+
+static void cpufreq_init(Object *obj)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+    CpufreqState *s =3D CPUFREQ(obj);
+
+    MachineState *ms =3D MACHINE(qdev_get_machine());
+    unsigned int smp_cpus =3D ms->smp.cpus;
+
+    s->reg_size =3D smp_cpus * CPPC_REG_PER_CPU_STRIDE;
+    if (s->reg_size > MAX_SUPPORT_SPACE) {
+        error_report("Required space 0x%x excesses the maximun size 0x%x=
",
+                 s->reg_size, MAX_SUPPORT_SPACE);
+        abort();
+    }
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &cpufreq_ops, s, "cpufre=
q",
+                          s->reg_size);
+    sysbus_init_mmio(sbd, &s->iomem);
+    hz_init(s);
+    return;
+}
+
+static const TypeInfo cpufreq_info =3D {
+    .name          =3D TYPE_CPUFREQ,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(CpufreqState),
+    .instance_init =3D cpufreq_init,
+};
+
+static void cpufreq_register_types(void)
+{
+    type_register_static(&cpufreq_info);
+}
+
+type_init(cpufreq_register_types)
--=20
2.19.1


