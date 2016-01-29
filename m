Received: by 10.25.159.19 with SMTP id i19csp1204180lfe;
        Fri, 29 Jan 2016 14:55:50 -0800 (PST)
X-Received: by 10.140.38.47 with SMTP id s44mr13768222qgs.22.1454108150484;
        Fri, 29 Jan 2016 14:55:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si17416554qka.89.2016.01.29.14.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:55:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHxG-0007sR-3A
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:55:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsp-0000Z1-4G
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsm-0003Th-My
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:15 -0500
Received: from mail-by2on0117.outbound.protection.outlook.com
	([207.46.100.117]:38976
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHsm-0003Rx-1Q; Fri, 29 Jan 2016 17:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VLnyrXd/Q1+xl+yQbROM2QU8LtHzqliJz9m3MLvYb1Y=;
	b=YodfLeWR5T5buFwnSzORCYPNrFiJlsYxTyW7iXzN6XXHqgiEmwuNqj9vN1pV48feCyVS5BsbHAiWzeAHou1Kiyy9FJOrLzMnqCfPrt+vu3WkHPWf42splzGpJhpqGCx9mvN9FT6C9grugwoJOhNfhuZbdVDHhxRioXsINHIMUUw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:08 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:43 -0800
Message-ID: <1454107844-15704-8-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: d763c9ed-e949-4553-e691-08d328feae29
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:R44LIygYSMC3QySz2bsWX8wp55M5g3KgtcxZZtznfCLZAkoqy96MJt3No1HVuqBBR8jw0ZQhdZsQZpFNTAiWqxAOM0f19UtuAdjOxaWndepxLSdipboOTngXsIyLmgi851DtWTaSNUaCoceXcgQUw7bYxdkEN8rpChHb7qyCS9KhbUW4TnAVJFi/1x1MZUx2;
	3:Rqx3drSXcAOWU88J+rOAzh2wiTjD1MU8bFfplI8BSvg1uXA3BCafhYfrEP0QOYNGA5bj3SH66vxDftJcatuubqSMMdr2+DzVARCknCKdmj9zwo/We8P1y5mJU4QjEOA/;
	25:zenDKHnsvDv2vAGdBi4D8DwW4zcrFsgfWj3reA0rj3MSba2/1uXPprDbBrPvpPR6eH5n2K+FBRXGxbg00tVl3zu5YQBNdwhkSbdgxaTTy15B8m/8bPZCCEVya96MmJtznqANGxb4V9q0y2GpdxGVKJ2nvMKP60t3WAoc+BX0j18Rk3N/nQTObrES081pUDA5Yokll6AG6fu9aXyOlXNfhD6TIgZ/pb15P8A6KCYHmoGW0KOCgt6qjcsBow8rOoUA+ZM1sUWgHK0h0uXSVmAAkMvxHUs7xD7VqLUhExDa02s=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:Z3AhhDgsdL6xw96yT8R7Www7R83QOyDSqrJmiZGIctAbL0jSsVijr1DZn0mQVplG/3tuTM4za1zV5a9tC3MlOAQFHaPPht37Ae/2zdK518L7fZiBHptEhysZcMVMRx8UAwstSPa7AWqmb3EJJJuY6EilUCv8r6BiBijbEuJG/UDYfdeBakY4NxdtkzT693zGlb8r7nwTvPH/zCKNVss8hFpI4/N+2120rw4EocwQtkpNZETUJRNKWPR41OofCXJ4C2iuGR7AFDyBZK0LhZ0uy4Dpo/VqSX4crUTSZvXmjQMlHcfXjxVEr38CraLL2oDaZOBBiexZf+HIpoR7u9FozcWZk95lfVG2vqk7h7cJm8u58Znq4gOh36gpdtNQBvqblB2af6uX5zFttVT9YBA7A2nNvuqCQTdgK1dqYLnJG79NkxS2JH5RaEjb7HCE0fjGk+U9qmc9JHDcDQtfFCUQZjvlm8ytd+1lOTU9h0JqkR35DNlpA/E4wnz3HjvAkNF6;
	4:55vY6HBinTURuPAyJBSRSZxX9LuJpGc+i/+YH7yYzmaaF/+m1sTtkhQ7DJplZTiSPT5Jd2ee/qoZ1DxMPtZH4amg7MAZ8duAHLw4U4R3bI0cJQ4FWkVqM8NscC0C/LTtSDlZmJ9iW9snQ8zEONwcILwtgVZ4HLM45UYXU+SxYvvLqo6Y3lMb67sTOJQLb8kiuKlvQxc7WcTC77t/ScpIlyKF+hYahSt+rp21E9iEF1KFBCkWrOetFDmoRa/pvoDFX4FJGutSUyGQ89dFbikn8wgdm7G7vZFYjQp7NLy08RlmKm8wzhHvoA3diGRRACSWRUzc0pAOlspJXIG124ZATP53PGU19qfGBXZ1KhcDVAGuzX4UzVvkQwQdNHRNJ2LF
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2034DD11003CD022C2185ACC9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(229853001)(2950100001)(1096002)(6116002)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(575784001)(86362001)(50986999)(4001430100002)(189998001)(76176999)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(19580405001)(2906002)(19580395003)(42186005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:XH9Od0n3hrPM3UD3HNp8xLuOvgRIFF1RQ27jnd0?=
	=?us-ascii?Q?4lMdGQBhKwDhO9j0/cHelONZhvozJeR9JpERJWGRsEdf5mk+FVHs6UEAwbJe?=
	=?us-ascii?Q?I4ueHzRVxQdbqqYRmiFFGSFWDVoZXv75kUHvjEEuSFWqIJ7+K+k1N1IILODV?=
	=?us-ascii?Q?ET0Ng7JQwxeXSRkzZaRXLTfgaiQDLc4M4yS8XQ6a4YkvAU2B9DNOpZtWbk2n?=
	=?us-ascii?Q?xb77XOALB2Zp+y0LJStaF+1osl3ZuO/0vzkL4I6PaZ3PZ37AEgz5/9W8oRmO?=
	=?us-ascii?Q?TMdWqWi8TUQel2bpEzNbzAu1tSe1DzaGwtwdixRM/qeNaBOeLXy6LljdcM81?=
	=?us-ascii?Q?3CGGuLOH4wsG0xr/xMgrupiwMm7dNsRNxrWZliyD43+Nhc9MwTsXrjtzlNhE?=
	=?us-ascii?Q?hf4yUNYPkxYCbkYXU6I9PO2DEjWhViqPiMp9ZoDj1px8rNmLQcMp7mW0CCFs?=
	=?us-ascii?Q?1ouTrDEqoTYIG2LgC1v4w5NTdE1WN6zDGK4XovHRt4A1vYxwGF8v0B4euHEM?=
	=?us-ascii?Q?slZWLMyzsASdFcJIePCfsXFNVLqcifJbPMwO3nju5eRxkLoK3lOOq6GQru0t?=
	=?us-ascii?Q?NerdiAKD5ZG3W6FgrCxridemjWlHYJ7vAykgT0uA7HPQ5+VQe8RZ13HuRgkC?=
	=?us-ascii?Q?oU/mFUDL1cNi66qbaSAO+umTbjcr+JA5T3gv6aOGeZUb9w1jp/uBuf0CKglV?=
	=?us-ascii?Q?ew0H/oOQj+TKggIkYb6gfWyWbhEkHZYX2x6r9glwoz/43hEQ9VIApKXrzJqQ?=
	=?us-ascii?Q?dclcjvgmVZwkyomjkP3i3Yb/UtHKNashLinpcTZf13YFtejNW+TCmEuuPFSC?=
	=?us-ascii?Q?gz64LvO+ZvTBpU53p0TrYQyBjfA5nr8ZYMKmoZY+DGSFr+w1BHcp0CD8Ionp?=
	=?us-ascii?Q?8Gu/49XCzbwGCQdqIm5r/BOArLYqndL4xdvGRhxFPEsBAWcT4rjSReMR/1tg?=
	=?us-ascii?Q?ozjyG7GxD7UnTokDuDZGaYUkFA9sNtFqnwb23TTXt+tWaCA3Qx9o30QUnb9t?=
	=?us-ascii?Q?v3Pcf9Map/9dgMimN8OGTfBjWLmy+EL88Jrae0nxEE2RtIMWEURLikTgrg5o?=
	=?us-ascii?Q?yrWiAP4Vz6IH5SzjTtSQYdfRX5u84ibjtO6H1/y9ca6Bd0mA/ZA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:pv1g4AgRRGeN9D0Rd6stPMVnppnrV/kbxF4DlfNPMu9+56RxfvfNRli0PAfmHVSJ2mUGo6/h5uSw88EcWPBSuj3H3P1KZhVnLeiPCzzJkm+csieqkSeMIhCo0wqNwbc2+TKd8Zpm0jrhNG4MgflO6Q==;
	24:rqoQIIGGiespVRY09xj1TiqObvQqd7S8LdbP1BZjgQDW42aCxLEB6ylr41p6+cyw4zukGTxszPCxPOEMMLAKoS09CQco0r0Etp071MAHdk4=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:08.9563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.117
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v5 7/8] arm/boot: move highbank secure board
	setup code to common routine
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
X-TUID: 8Lo58a3ONYIq

The new version is slightly different, to support Rasbperry Pi (in
particular, Pi1's arm11 core which doesn't support v7 instructions
such as MOVW).

Tested-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v5:
     * style/formatting changes only

 hw/arm/boot.c        | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/highbank.c    | 37 ++-----------------------------------
 include/hw/arm/arm.h |  5 +++++
 3 files changed, 58 insertions(+), 35 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 7742dd3..5c662fb 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -178,6 +178,57 @@ static void default_write_secondary(ARMCPU *cpu,
                      smpboot, fixupcontext);
 }
 
+void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
+                                            const struct arm_boot_info *info,
+                                            hwaddr mvbar_addr)
+{
+    int n;
+    uint32_t mvbar_blob[] = {
+        /* mvbar_addr: secure monitor vectors
+         * Default unimplemented and unused vectors to spin. Makes it
+         * easier to debug (as opposed to the CPU running away).
+         */
+        0xeafffffe, /* (spin) */
+        0xeafffffe, /* (spin) */
+        0xe1b0f00e, /* movs pc, lr ;SMC exception return */
+        0xeafffffe, /* (spin) */
+        0xeafffffe, /* (spin) */
+        0xeafffffe, /* (spin) */
+        0xeafffffe, /* (spin) */
+        0xeafffffe, /* (spin) */
+    };
+    uint32_t board_setup_blob[] = {
+        /* board setup addr */
+        0xe3a00e00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
+        0xee0c0f30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
+        0xee110f11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
+        0xe3800031, /* orr     r0, #0x31              ;enable AW, FW, NS */
+        0xee010f11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
+        0xe1a0100e, /* mov     r1, lr                 ;save LR across SMC */
+        0xe1600070, /* smc     #0                     ;call monitor to flush SCR */
+        0xe1a0f001, /* mov     pc, r1                 ;return */
+    };
+
+    /* check that mvbar_addr is correctly aligned and relocatable (using MOV) */
+    assert((mvbar_addr & 0x1f) == 0 && (mvbar_addr >> 4) < 0x100);
+
+    /* check that these blobs don't overlap */
+    assert((mvbar_addr + sizeof(mvbar_blob) <= info->board_setup_addr)
+          || (info->board_setup_addr + sizeof(board_setup_blob) <= mvbar_addr));
+
+    for (n = 0; n < ARRAY_SIZE(mvbar_blob); n++) {
+        mvbar_blob[n] = tswap32(mvbar_blob[n]);
+    }
+    rom_add_blob_fixed("board-setup-mvbar", mvbar_blob, sizeof(mvbar_blob),
+                       mvbar_addr);
+
+    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
+        board_setup_blob[n] = tswap32(board_setup_blob[n]);
+    }
+    rom_add_blob_fixed("board-setup", board_setup_blob,
+                       sizeof(board_setup_blob), info->board_setup_addr);
+}
+
 static void default_reset_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 620b526..e25cf5e 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -35,49 +35,16 @@
 #define MPCORE_PERIPHBASE       0xfff10000
 
 #define MVBAR_ADDR              0x200
+#define BOARD_SETUP_ADDR        (MVBAR_ADDR + 8 * sizeof(uint32_t))
 
 #define NIRQ_GIC                160
 
 /* Board init.  */
 
-/* MVBAR_ADDR is limited by precision of movw */
-
-QEMU_BUILD_BUG_ON(MVBAR_ADDR >= (1 << 16));
-
-#define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
-                        extract32((x), 12,  4) << 16)
-
 static void hb_write_board_setup(ARMCPU *cpu,
                                  const struct arm_boot_info *info)
 {
-    int n;
-    uint32_t board_setup_blob[] = {
-        /* MVBAR_ADDR */
-        /* Default unimplemented and unused vectors to spin. Makes it
-         * easier to debug (as opposed to the CPU running away).
-         */
-        0xeafffffe, /* notused1: b notused */
-        0xeafffffe, /* notused2: b notused */
-        0xe1b0f00e, /* smc: movs pc, lr - exception return */
-        0xeafffffe, /* prefetch_abort: b prefetch_abort */
-        0xeafffffe, /* data_abort: b data_abort */
-        0xeafffffe, /* notused3: b notused3 */
-        0xeafffffe, /* irq: b irq */
-        0xeafffffe, /* fiq: b fiq */
-#define BOARD_SETUP_ADDR (MVBAR_ADDR + 8 * sizeof(uint32_t))
-        0xe3000000 + ARMV7_IMM16(MVBAR_ADDR), /* movw r0, MVBAR_ADDR */
-        0xee0c0f30, /* mcr p15, 0, r0, c12, c0, 1 - set MVBAR */
-        0xee110f11, /* mrc p15, 0, r0, c1 , c1, 0 - get SCR */
-        0xe3810001, /* orr r0, #1 - set NS */
-        0xee010f11, /* mcr p15, 0, r0, c1 , c1, 0 - set SCR */
-        0xe1600070, /* smc - go to monitor mode to flush NS change */
-        0xe12fff1e, /* bx lr - return to caller */
-    };
-    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
-        board_setup_blob[n] = tswap32(board_setup_blob[n]);
-    }
-    rom_add_blob_fixed("board-setup", board_setup_blob,
-                       sizeof(board_setup_blob), MVBAR_ADDR);
+    arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
 }
 
 static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index c26b0e3..52ecf4a 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -122,6 +122,11 @@ struct arm_boot_info {
  */
 void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info);
 
+/* Write a secure board setup routine with a dummy handler for SMCs */
+void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
+                                            const struct arm_boot_info *info,
+                                            hwaddr mvbar_addr);
+
 /* Multiplication factor to convert from system clock ticks to qemu timer
    ticks.  */
 extern int system_clock_scale;
-- 
2.5.3

