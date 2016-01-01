Received: by 10.182.158.201 with SMTP id ww9csp8833072obb;
        Thu, 31 Dec 2015 16:34:57 -0800 (PST)
X-Received: by 10.140.144.10 with SMTP id 10mr84917836qhq.38.1451608496244;
        Thu, 31 Dec 2015 16:34:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125si41015983qhb.48.2015.12.31.16.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEngF-0000Bd-UI
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:34:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndR-00030e-Ty
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndQ-00066k-F2
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 19:32:01 -0500
Received: from mail-bl2on0101.outbound.protection.outlook.com
	([65.55.169.101]:27464
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndJ-00064C-QJ; Thu, 31 Dec 2015 19:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Qq0XbVXQELvVFJWYz/VMc2x4X55e9Iupe4fRYRZJyDA=;
	b=kDIeWdn65yYvfSkbloVjfCktwnST3RRnWa3zrVX8gJotlm1ZVcszdpI/AuyeTq3se2KhTDpZERJQelfRyRrqopXeB4l+WX8QBVS7bVXv6cDeveJsIB32RoECmpERpASolrgqlxb6F1HxRt9pn/MaGbtZZbycSURdlCnoRRYV7lA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:51 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:34 -0800
Message-ID: <1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:2UOTbauK6n82hRNuVaK3OFgUUgPS9KiI1x5PB2oJsZDPDuZTPZEy6pUvMwTyAitPhvsBcFr3Hea5d1798UNdFhp/n78FwjStUGO/ID2v/6mD64fVzq55J8gti2m0dwXJu+NFptKO13kyGiaB/3eNSA==;
	3:4mTdLIurnirkRmoSWfQEMxkcxSYxPeZypyp429zUf/ECPsyZiUZm25A+C5wVLv3I/eGGyRDTYkCU4Ocwr5Gx0eokpDqgz97E5CmuD+4S8fmr7AAjCVp1L9QI0Es+fRgy;
	25:Nc6ujwqLsCQ9TnUJD9t6mZwtt/PyUqL7rO06MVViYap1xjXKVWVi+T67kwzIIY8asQKDgMzoD6PA6taG6csiYDd5uwJXsdy+BCin6k9NfUZ0tHX6XJ+XuBKgRbydYz5mCmgnU+sNzmHH0nS45NSnefKmLzCyH1A7gVHZhIO/MBLxLdFFLuwzw8K8qGohM52DzlWkwlc1WZzw+PjZo6onqWUE+EpqafyyharsmoA++E/iBOVO9w515pEgXX0HuVXjp2Hzl7g4oUn2iY48xV8ejRUeBRdXFAmbzfYMKNXqZks=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:2OLRB8J8uidwovZStg2yCpI6HfFqkGfnkzlpVOLdHlLAOP2I9fc7iGaklfQEeDhabKr16kp8IKbkK53UuANYmEb9gnxxhFaUQddIvtQVGmYcY0zDiRYErLMtf02jCPpBxq478Lov7h1QApBCELDwVBGdms0GWoL12S2QliAF/z/8X0iiD8dR2zDRZwM2dTxr4Dw+mqRedACOUjEKF487uESEHAj2v7NkUXw6FX0+PD+ytvQwiXB+1KaujH6o3+Djd+6oKVR1C6jotmOwcic9Ls7YZQ2RwDHdnAWnL6DPeAF8iLxZtmvUVFkC03H94aMxgymKkdr/C5nG6JBaCTVCv17LTbP76rTzC0bwuKuDXAD++B0nuB/5Vg8OmDd7bYb7fAuQ1FoFdM1ZBa2UozyEPRp5DJkXv0u+2uzL3p63iHi++yb92PNSz1ED9R+BLXgdAGC2vM6oPW4PmpbRCo5p7zlGjiLLZZh1QkrlpF2lxzMnRG5uhz/GRFveijEyIXdU;
	4:uUjztveerN0ZVbvpyN/k9HhT+uSNZqTZfw0eu/NCQPPtd2PPSrtfrTEmbm5yfU4PxoyKLPCaCFVabII2LpsP0hwf47CzULZHjBl8D1xjZpdvWrvPIAV3r7W3tEmBBj+leNDu/izyzLyIuXZtqBRAFTShUVwdJdUDWvVz408BwS4ZhkwugOOQYbfODy5CPkbSDIJYZufWujmmSoD9medPHxf5eI6RMnB15pQNl68+3ZuR3eKDOCrXuDMdD/hK9g5qIHNVD2ZczLHOBeBWyf/yn7OGwKSeV3W1Dnp6sApIBTFt9c9Ya7NfYWGhLd0zSNwH3I6XDxEGECdZ5/yH7WiWh8F2sjR4hqn0pLwuj5zcUPbABffGWVx/TLnksicAk7th
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2043DA28B90046046C2409679EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(575784001)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:+bdU8v1WJdn1fiPPdJqt+rZwkAQnXG9lu+wbj25?=
	=?us-ascii?Q?Y1nZpcVGxf4UaXwrAcjQSTMr442X4DO2tYE+EusFsSXfrdyVs2DNhnFg7NoE?=
	=?us-ascii?Q?Ia9Zmb4i7q//XbeKyddAIOquDBodidf1MTQ1aysUHUZIttjaG7xNTyVjXKiC?=
	=?us-ascii?Q?CTeZZdfn2+svuHKQzkiwPHVp56Lk/Qjp6nnf8x92uSR/2LVSFbKEWzGxjL9I?=
	=?us-ascii?Q?WLJtpxFXMRpKO5cvTB8nlFVuHF2GvhdqESJ/cZRixAUHACH1H0VtpfL3k6qa?=
	=?us-ascii?Q?xuyIJsUCqspJEgjGWqSLVnXJoOYJ+MFTToXz9ZrcaL9eQ9FDCRA1AUXaMSlk?=
	=?us-ascii?Q?+8IqTDU7/Wu5Bm6t+Xc2oQzjaUm6tDL9g8j/zmB1wlwWb50+Jocq/fhCFuhO?=
	=?us-ascii?Q?ThBCxrBqdulpFmV0c4+LlzC2Jg/u+0+YNPi+bcvPQ+wxKWjoG9M3CoJku/yt?=
	=?us-ascii?Q?3WB3GCgBg5QZYTcWG+c40lEVJIydNB/cAVEXfz8pie7r95vy76VTg+qgPIux?=
	=?us-ascii?Q?Ch+XVV17HbpoLelr2qgIfnRHt52zhHWSq4KDPQ/aokMw1bqstzTQ8P/VkSai?=
	=?us-ascii?Q?fUBiLiYkHlEIHPo637CxQGIDhu+/6EGoCnM66BVh7vJluJeFIgtDVbEnidcY?=
	=?us-ascii?Q?+w8MNqURHlYPPpf9edkhmX0EUq0z5ReGz1nwSHlEQO8UF5R3+f+IgLGCo49Q?=
	=?us-ascii?Q?hOHOhHR7Av1s1HE8IToWoNrqRsPChVJV+sY+fGiR1MqYHXunG9BBejS4Rtwb?=
	=?us-ascii?Q?VHml2DVwGLLgOdBobTbPoUbkL+wsIAT90qVsdArdloJ4NuQz+bnb+7b48EFo?=
	=?us-ascii?Q?TAazeZVE/OVGC7f9Jg5y8HoIjY7DY/BJyn5pUbgTJCS3KnEQQHbfv+NxxeVa?=
	=?us-ascii?Q?pLJa5aUP+h+jmxdETgBXETxheSCWsZjhl88lH9m45q0K3V2Xu2nhy4SesUPA?=
	=?us-ascii?Q?ArF+f4pdgghFZymkcOHGDUm8+oNkS5jjvvuyRlhxqsuBi4FJDzLE9tVmXflg?=
	=?us-ascii?Q?epzW4HIykJ2Hnu96beIANQ55Gywp3Gmy/fCVtqdG7rTYaQdDunBBwPXO5tHh?=
	=?us-ascii?Q?Voda3euTljSeKd0VfepphS99gsAUIvaVSdXDE4HXvE4jF69/r+bvtVMCywVo?=
	=?us-ascii?Q?kUZX3rKiRT1d8+s1sIv+Kul0AGMFWrZsDdwkkJgNcn4o56LqtWmNp2TWINBY?=
	=?us-ascii?Q?9MkpKkSxX+ylysbZURPJwxVeA/RfFZqlzRIAdADH9tC4ZwUgar5GDEqMRzA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:yF8lovLW2v7ZGRRvUZUGDuclCPFp2f4Bld6wY+maamYqcjLQp457SD909V0MkZbbsfsub/kFoWmDbB7tGZm2E/y7dV4iflIxzwnLr8LyDeBS7cdvR4yXva7mZs1Ugfsyk/zvrYlhzGjAshL9iJHNUw==;
	24:NXEGxa55RXkeCGha4lH3Fp8xGsEkMAXlfrp/C7kADSEREvg+/ffOciujibMRaxeSK2j3c/2sxG54SF4RUm/EQOKoTV5NwZscj+jn1N48rd0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:51.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.101
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: Iatcg5hZukTb

bcm2835/Pi1 requires more peripherals, and will be added in a later
patch series.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v3:
     * fix board setup to remain Pi1 compatible
     * pass ram property

 hw/arm/Makefile.objs |   2 +-
 hw/arm/raspi.c       | 180 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/raspi.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index f55f8d2..a711e4d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
 obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o
+obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
new file mode 100644
index 0000000..b73f544
--- /dev/null
+++ b/hw/arm/raspi.c
@@ -0,0 +1,180 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+/* Based on versatilepb.c, copyright terms below. */
+
+/*
+ * ARM Versatile Platform/Application Baseboard System emulation.
+ *
+ * Copyright (c) 2005-2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#include "hw/arm/bcm2836.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/arm/arm.h"
+#include "sysemu/sysemu.h"
+
+#define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
+#define MVBAR_ADDR      0x400 /* secure vectors */
+#define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
+#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
+
+/* Table of Linux board IDs for different Pi versions */
+static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
+
+typedef struct RaspiMachineState {
+    union {
+        Object obj;
+        BCM2836State pi2;
+    } soc;
+    MemoryRegion ram;
+} RaspiMachineState;
+
+static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    static const uint32_t smpboot[] = {
+        0xE1A0E00F, /*    mov     lr, pc */
+        0xE3A0FE42, /*    mov     pc, #0x420           ;call BOARDSETUP_ADDR */
+        0xEE100FB0, /*    mrc     p15, 0, r0, c0, c0, 5;get core ID */
+        0xE7E10050, /*    ubfx    r0, r0, #0, #2       ;extract LSB */
+        0xE59F5014, /*    ldr     r5, =0x400000CC      ;load mbox base */
+        0xE320F001, /* 1: yield */
+        0xE7953200, /*    ldr     r3, [r5, r0, lsl #4] ;read mbox for our core*/
+        0xE3530000, /*    cmp     r3, #0               ;spin while zero */
+        0x0AFFFFFB, /*    beq     1b */
+        0xE7853200, /*    str     r3, [r5, r0, lsl #4] ;clear mbox */
+        0xE12FFF13, /*    bx      r3                   ;jump to target */
+        0x400000CC, /* (constant: mailbox 3 read/clear base) */
+    };
+
+    assert(SMPBOOT_ADDR + sizeof(smpboot) <= MVBAR_ADDR);
+    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
+                       info->smp_loader_start);
+}
+
+static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    static const uint32_t board_setup[] = {
+        /* MVBAR_ADDR: secure monitor vectors */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        /* BOARDSETUP_ADDR */
+        0xE3A00B01, /* mov     r0, #0x400             ;MVBAR_ADDR */
+        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
+        0xE3A00031, /* mov     r0, #0x31              ;enable AW, FW, NS */
+        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
+        0xE1A0100E, /* mov     r1, lr                 ;save LR across SMC */
+        0xE1600070, /* smc     #0                     ;monitor call */
+        0xE1A0F001, /* mov     pc, r1                 ;return */
+    };
+
+    rom_add_blob_fixed("raspi_boardsetup", board_setup, sizeof(board_setup),
+                       MVBAR_ADDR);
+}
+
+static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
+{
+    CPUState *cs = CPU(cpu);
+    cpu_set_pc(cs, info->smp_loader_start);
+}
+
+static void setup_boot(MachineState *machine, int version, size_t ram_size)
+{
+    static struct arm_boot_info binfo;
+    int r;
+
+    binfo.board_id = raspi_boardid[version];
+    binfo.ram_size = ram_size;
+    binfo.nb_cpus = smp_cpus;
+    binfo.board_setup_addr = BOARDSETUP_ADDR;
+    binfo.write_board_setup = write_board_setup;
+    binfo.secure_board_setup = true;
+    binfo.secure_boot = true;
+
+    /* Pi2 requires SMP setup */
+    if (version == 2) {
+        binfo.smp_loader_start = SMPBOOT_ADDR;
+        binfo.write_secondary_boot = write_smpboot;
+        binfo.secondary_cpu_reset_hook = reset_secondary;
+    }
+
+    /* If the user specified a "firmware" image (e.g. UEFI), we bypass
+       the normal Linux boot process */
+    if (machine->firmware) {
+        /* load the firmware image (typically kernel.img) */
+        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
+                                ram_size - FIRMWARE_ADDR);
+        if (r < 0) {
+            error_report("Failed to load firmware from %s", machine->firmware);
+            exit(1);
+        }
+
+        /* set variables so arm_load_kernel does the right thing */
+        binfo.entry = FIRMWARE_ADDR;
+        binfo.firmware_loaded = true;
+    } else {
+        /* Just let arm_load_kernel do everything for us... */
+        binfo.kernel_filename = machine->kernel_filename;
+        binfo.kernel_cmdline = machine->kernel_cmdline;
+        binfo.initrd_filename = machine->initrd_filename;
+    }
+
+    arm_load_kernel(ARM_CPU(first_cpu), &binfo);
+}
+
+static void raspi2_init(MachineState *machine)
+{
+    RaspiMachineState *s = g_new0(RaspiMachineState, 1);
+
+    /* Initialise the SOC */
+    object_initialize(&s->soc.pi2, sizeof(s->soc.pi2), TYPE_BCM2836);
+    object_property_add_child(OBJECT(machine), "soc", &s->soc.obj,
+                              &error_abort);
+
+    /* Allocate and map RAM */
+    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
+                                         machine->ram_size);
+    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
+
+    /* Setup the SOC */
+    object_property_add_const_link(&s->soc.obj, "ram", OBJECT(&s->ram),
+                                   &error_abort);
+    object_property_set_bool(&s->soc.obj, true, "realized", &error_abort);
+
+    /* Boot! */
+    setup_boot(machine, 2, machine->ram_size);
+}
+
+static void raspi2_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 2";
+    mc->init = raspi2_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->max_cpus = BCM2836_NCPUS;
+    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
+     * we do not yet support the framebuffer / GPU, we need to limit
+     * RAM usable by the OS to sit below the peripherals. */
+    mc->default_ram_size = 0x3F000000; /* BCM2836_PERI_BASE */
+};
+DEFINE_MACHINE("raspi2", raspi2_machine_init)
-- 
2.5.3

