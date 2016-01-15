Received: by 10.25.159.19 with SMTP id i19csp769463lfe;
        Fri, 15 Jan 2016 16:01:30 -0800 (PST)
X-Received: by 10.140.142.207 with SMTP id 198mr17891168qho.77.1452902490215;
        Fri, 15 Jan 2016 16:01:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si16052264qka.89.2016.01.15.16.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEJ7-0008GD-NW
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:01:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHL-0004oq-9q
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHK-00016u-16
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:39 -0500
Received: from mail-bn1bon0140.outbound.protection.outlook.com
	([157.56.111.140]:29368
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEHD-00014J-8a; Fri, 15 Jan 2016 18:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=q2Pjut4SeLg8TK/tkAMwP/QFNL5QvgBV+S+AJgzc6Ew=;
	b=eGSYa8HQ0LOI2ANb42bbb+xP2SG75lJxvCoLftIVzZs5wx4ubKXNyMKUYeYKZSbRljXJm4HAdvpKU3FGy82Z1j/yQ0PGudBNxN76D6jyAU3LEDwOXYnrytpYlgvIoonSv6fKVimfDY3rRIDmZd6nDk52+xxkf4u/rEtk/PzUj8Q=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:27 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:56 -0800
Message-ID: <1452902337-13844-8-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: 888129c9-e547-4ade-5f11-08d31e07e787
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:SNJqJ9ghYijicX9FxjrtOPDGK12qkU0Etiwdo9lyvBNVC9UEwUNlCKYgIDGE+VgWVlPAxiKFRka9Ex8q3FAoN/PKtPJKMq3cnzY7EGaipyEfbg7dddtQnbARun6Gjnzt2omAEl9CRXn5al8T+zcukjPRW+fK1YfeSBocAd3djfgtOqmWDTRqYbL4qz0HOT+q;
	3:GKiX16fulEGoPX8i49tDdB5HrD8l0iWEgaNcRkoCKan7LJ90FR+6YH7axeLmRa4YWL/imS0KJAP84B1fpTJgIWx4P5yV8AsQjU3rQhcGD8hBwn/3voNHH/0cycgeCWYJ;
	25:uWjfnDXROcWtyuQ7DOy0KdUPwJb2znJJmEW4YjM8/gxOBmUDbo3wG7FZonX/HzHnku80RtNCHXSD6/CU3FBVWe8UHEmsgmM4Z8ALpPBTYlZk0SE0ZXjj/qMozdvdDTZRAwzracux+uL3Q79P8Qx+Nr8DqYDJxjI6jYFCWzbAIpa+vGH0qF8MZ4GNQxv+iZzW8VcVErFBSsGY+8NUJAUie0IhNNUNtIqhtG933rJm8hT+91Dt9YDhPkSMwNIaGE8+aaCl2hLUVMCEwLIeU/FlSku1wQRH6DGmqjpR7w5zp3Q=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:VO5RhCsUttoN/6aiQ4aZX4cZziDc2bOm/Xb4wExg3yQYKAx4k46IkbMcsguwBCLl2YzzJcIHpIgFb2AvGHvOQBUfCKH8x9yFPMo1zbIfQg+IrNxlxPJ7tbKMIKt5U05z/8TNW07MtmxhnOM8cNOaCkdw+Qqh3mJZnZXB+t1mfOT0FpglnxDB8ujccrCnvSr2ONkNzSixEyjzmnN0qCjISbkkav/hagSA/N8k8ptHGDMUzYACNpPkJH7Oh9V6iYE1nSfQpGaelog5YyFpiCn4czblvyZ5nLE2nUywp2bw8duBrFLDiHvLzTkxilYA0xlI7Jc+kpsmDDzhJWcfwwJ2GNw/Z1HrPIIx3aXjDJjrikIXAY+ezI7ao6IRZSooLsxDAdAtwOsShsswZWl981hAFwOw8hwwGnNoC+zkIPUMg+yfHf3RXbo5Xn3taVFY/Ag7UIqImpsgKuI4ipC5PrC5DBe1Q1Dj+FlH8gA/11xz9QxSKmU3qeB23GhhS3YqcH4E;
	4:rlE49bbE3OUbESmgb9B/IdOkztjPo6fh9YtLqarAgzJFB7pr+VMuFRVysqnHZw5VaKFbY8F8T2w06E534gcdB4q69mlLjgMG/JKJq0gzwzWlFXikd3DpO+SZK1Yg4lmM3iKuVObRs6PU5/T4fOFJ9zukyzWe35lDrYeaNojxVwTehQIz1bAKRYdjARi8ZiLS+Fm1L84S7xbdjEsPyvY9YI+Zow3snAiIyXMe8HI84OKPboHlunZtM117JBDqwVKxTef8K3fr6vtE2B6dIeiitjq5kfnQAeJBGmzwo1TeIZwtsMQVlNqqDejNZKBHXCo0AVZHtij5xlSqLTp6iX+kG6FOmAiUOJXc7a/V97vLejQl94YUlQ1i4j6Xyxwij9rz
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20333C2E5693F26ECD721A949ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(4001430100002)(575784001)(106356001)(86362001)(2351001)(2950100001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(76176999)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(19580405001)(10290500002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:FiLyPdV6uzxUNBwLu6drrA/pGQspnrAc+U55WdE?=
	=?us-ascii?Q?egHL3htGDT5mfhpFSEVDs3oIVyaiC2kHSA/8UzkCN908rQlSUhvNh1haun2h?=
	=?us-ascii?Q?nsbN/YEuEvebxxJHw+eVH81Ccj36JyZh0fqkGeuTbV74dyBsTr41s85AIO2T?=
	=?us-ascii?Q?oJyd5hXeBM4xYT6NiNX6rafFDUTiC0x+HGsZxxCB7iqFCRBKuoGre13cVyOh?=
	=?us-ascii?Q?J8N7UQ6sRJJPzTtiyWzELwUGjV06lmMoyC0yfmWDHOwKLdB7Vc7dlF2UyXkD?=
	=?us-ascii?Q?x98FfxPyrieII6t72i7vmp7mVfNFR1NJrjgUAJ6Yq8bAzJ4OIqlJfNa5LCdo?=
	=?us-ascii?Q?HTwy1vFS4Cy6jMriw3Ndu2nyyse4uGIz8n8nTEH6GLwYMaWg1jwBggsHQ3RF?=
	=?us-ascii?Q?2Ggja5F0mSQeqE1dyzDN1GWma+EjHcRDeaNXrB4qOSLQakjgQUKLLqMuxXzJ?=
	=?us-ascii?Q?7WNu0IcSov0UrSSzgWWz2geUCaQ38uxf5YH/efloNkWJXRRXh7mM1fMHqe/M?=
	=?us-ascii?Q?BIVF/x0w0ej4xYkrjbSZ/izk0jia2GojdU8uCDivJv65lhnG4K+cYS4w7XB4?=
	=?us-ascii?Q?F7feFjPKkRq6sSB+2TcB213I1n5Fvo9nUXTbfAxRkxB+i+9eLCN6l/se+C2F?=
	=?us-ascii?Q?xne3f72z8kYVtTzaXJx+oNIqvKUqBvnjkBBypQ4nwQTpkvq9dhURjSmm/1aZ?=
	=?us-ascii?Q?5mL7lGrDOp6NwioSWuVsnhGR5DtwESU65tdYnDyIKcxDRSocgm1tW/Y7w04x?=
	=?us-ascii?Q?lbwqnQHjWG8X8GGQFqD7WvfoHXlQemV3wY7qCFUlfK9yvVF81ZZcfDtHFPGp?=
	=?us-ascii?Q?PxcNPgfiS+Nwc+yD8Zhy7yOqQY/MwNHWdriPC1QhnPwHROgLa6kvMhKALhWh?=
	=?us-ascii?Q?+9OXP4wc2NI77QWf4612neoXXyrMlmj1dXZ6iiFJFb1F/WIpXrD/QQB3W4cx?=
	=?us-ascii?Q?im+ZoxDt9HCIyenTFzlQoNnrdDVfwpEFKVj5MgtM0/6Pe2I+TjZ4Otd6Rqxl?=
	=?us-ascii?Q?fOamuDRZcKEf9p1bQz8CQwfRs/3NZpeJkTi2dC+kLjKfDG5vkymM4ah1BI0P?=
	=?us-ascii?Q?HO1ChQCqOAtCo9go5FLmfTNGDZyk/l0NS+Scbp9Y1bCOQ1sYuG2Uxk3yh2UO?=
	=?us-ascii?Q?WBbaFzud/wN5RqSTY1NN331JqNHraEyldAZD3nJnL/O2XJ9WR3PutTUWZ2ql?=
	=?us-ascii?Q?O/oQt/P/8hwKS2hDfrLuwtKz9LgGZls8JWqBLy4KZsENDLafOaeT89zI7ZA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:7JiQxBP4VDcMXc1NKTZ/abYhgCyUFRXf9PcC9dHFZdmDczgOiKnNZtU8GuDX7blhc/hpa8BWBzkfY1Px7maFsyy4URz6YvEoasTYaOe5hpV8umm6CPNvqTy3WosqpVOy+J4UFk3XPY6IgV9bEw9Ydg==;
	24:9f8KcHR16pWq6jGMmtYXymLDdSyl1BlfNrt1TzEuFS/DQ5UCzblBVlCANPilez5lNVXYMi+RZoEuz5GkkSraZdkSPtbik1Cwbriv+gRr/PE=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:27.8009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.140
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v4 7/8] arm/boot: move highbank secure board
	setup code to common routine
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
X-TUID: XzUC7BzK/8z3

The new version is slightly different, to support Rasbperry Pi (in
particular, Pi1's arm11 core which doesn't support v7 instructions
such as MOVW).

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    This has not yet been tested on Highbank! Peter C -- please help :)
    
    Honestly, I fear that the overhead of maintaining support for two very
    different platforms (including Pi1) may outweigh the value of unifying
    these blobs.

 hw/arm/boot.c        | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/highbank.c    | 37 ++----------------------------------
 include/hw/arm/arm.h |  5 +++++
 3 files changed, 60 insertions(+), 35 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 75f69bf..bc1ea4d 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -178,6 +178,59 @@ static void default_write_secondary(ARMCPU *cpu,
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
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+        0xEAFFFFFE, /* (spin) */
+    };
+    uint32_t board_setup_blob[] = {
+        /* board setup addr */
+        0xE3A00E00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
+        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
+        0xEE110F11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
+        0xE3800031, /* orr     r0, #0x31              ;enable AW, FW, NS */
+        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
+        0xE1A0100E, /* mov     r1, lr                 ;save LR across SMC */
+        0xE1600070, /* smc     #0                     ;call monitor to flush SCR */
+        0xE1A0F001, /* mov     pc, r1                 ;return */
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
+
+
 static void default_reset_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index cb9926e..e5105fb 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -34,49 +34,16 @@
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
index c26b0e3..75bfe26 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -126,4 +126,9 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info);
    ticks.  */
 extern int system_clock_scale;
 
+/* Write a secure board setup routine with a dummy handler for SMCs */
+void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
+                                            const struct arm_boot_info *info,
+                                            hwaddr mvbar_addr);
+
 #endif /* !ARM_MISC_H */
-- 
2.5.3

