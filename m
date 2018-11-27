Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp177418wrt;
        Tue, 27 Nov 2018 12:34:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U72rIedij5aSiGJOxoKNFTj/nSbqlRpVBEKl1IrR7eUbojTHDM+bZTCi5JgbKFmcHeRCJJ
X-Received: by 2002:a5b:412:: with SMTP id m18-v6mr35029879ybp.132.1543350889804;
        Tue, 27 Nov 2018 12:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543350889; cv=none;
        d=google.com; s=arc-20160816;
        b=S9RGqhyXDUUtc73cfnZ3/1BHb+7P/JjwOPnH+0TE1qwPh8fgzortxz6MkZCKhNLNP9
         vEWIcIbVyeYIpW1YvneZgOBiy9nKdsuYnNtJQq+CAJHySdmBWkDEsGkShb+8xnsQ7A5a
         BbYNUO9ceFLtSGQKK6Qn5/ZSlx6mn9aoYnSGvwZ6Aci7W8LuGOyC+e91oIyD3mFX0Y8i
         1EOoY98YmCVPhRfgLVUlRWhNC6rpYDuLjJEf/SfUNcy1qMfL4xVD8/wKa9jVMbmJ1trD
         nWo2Ffl3lgjnjkZO54OVqFc5Un9H+Q5cXR3Sg+uIr+D36cBgXRzJWoIfZJanNFUzGpFp
         Uw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=/2DIgo3vwz1dy4WtZPGYLtCT+5SKhlbvBSM5ngXRlFM=;
        b=aGdVrj6uYKJv1fRxEk7xJIUJRrnuVm7AMO9pDn5lJwx5mgRmqHT3ayEXAsvAKhh7r2
         1FUu/Z8Ro+DQnRv0ntT6q4MFlmUyWkzNfHBhVqQ3cGOdagF3jwLrMGm1SlK3QfN4+H9e
         P0oAONSCj9T2ZHy0P6YMsi8ZXL1YFzZq+BcBj5wM/LNW1s++4/RT8NIyM5JOubeMQKIn
         +L3z8xVNgs+Hr+iWk0jllCJiQM9p9OwNd9nbM1XGcuVmXdzYsqz18zDBBx91QH91Nedf
         Jx+o7Bo4eSPf7eQc8tRn6XFMNsrym1CWNupsp7boOBuyh/BnsUsOLAX7YxCgvP7iM0ph
         znAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com header.s=selector1-nokia-com header.b=HwRbY4X4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nokia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 205-v6si3222585ybq.236.2018.11.27.12.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 12:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com header.s=selector1-nokia-com header.b=HwRbY4X4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:44342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRk4H-0004tJ-6R
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 15:34:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ricardo.perez_blanco@nokia.com>) id 1gRk1B-0001gX-Vf
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 15:31:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ricardo.perez_blanco@nokia.com>) id 1gRjv1-0007TI-2y
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 15:25:16 -0500
Received: from mail-eopbgr00100.outbound.protection.outlook.com
	([40.107.0.100]:39232
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ricardo.perez_blanco@nokia.com>)
	id 1gRjux-0007K7-Ho; Tue, 27 Nov 2018 15:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/2DIgo3vwz1dy4WtZPGYLtCT+5SKhlbvBSM5ngXRlFM=;
	b=HwRbY4X4FkTDHJsHjOL2Mj2UzU/DISE2JkY0VR0IChJ4t6QQXOvajEQcobz4DidjhyVJBt02eIGUoUIBcIQqyU3G6c3A2M5EWIk+eVE9MGCUh3ZRp8g2on/3cBVifRk/4mTrVJr7YEZaSP47a2GhUwKxFjiNoFRqGqYwiNok6uA=
Received: from AM6PR07MB5368.eurprd07.prod.outlook.com (20.177.199.157) by
	AM6PR07MB5144.eurprd07.prod.outlook.com (20.177.197.222) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.11; Tue, 27 Nov 2018 20:25:06 +0000
Received: from AM6PR07MB5368.eurprd07.prod.outlook.com
	([fe80::983:19fd:7bdd:792f]) by AM6PR07MB5368.eurprd07.prod.outlook.com
	([fe80::983:19fd:7bdd:792f%4]) with mapi id 15.20.1382.012;
	Tue, 27 Nov 2018 20:25:06 +0000
From: "Perez Blanco, Ricardo (Nokia - BE/Antwerp)"
	<ricardo.perez_blanco@nokia.com>
To: "ricardoperezblanco@gmail.com" <ricardoperezblanco@gmail.com>
Thread-Topic: [PATCH v2] Allow AArch64 processors to boot from a kernel placed
	over 4GB.
Thread-Index: AQHUho9Ip5DLVjza70+QZ9l7OyLSmg==
Date: Tue, 27 Nov 2018 20:25:06 +0000
Message-ID: <20181127202422.32745-1-ricardo.perez_blanco@nokia.com>
References: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
In-Reply-To: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.14.1
x-clientproxiedby: LO2P265CA0065.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:60::29) To AM6PR07MB5368.eurprd07.prod.outlook.com
	(2603:10a6:20b:6f::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.66.52.11]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR07MB5144;
	6:tgDaXrg/dhTvO3C9tX9EJa1JG/z+BcYGDD3Odh6m/ot+3d6N46BbCj8uDJDLBNd7gNkxvSHrvhWa8XX+b3kqCp/PvfYXPiOsxZd6EtRE4NcE6CgkNcFQGAS9PFx8M5dvKm9aeB1hMRdCn0IywV6cFCiIgSwLXl5WEEK4ZUz8xlRip1abu8oq/n7lnvtIZY81LPKaGBDc+YusabUfGWoiJ/J6eIjI5eQObTTXzgXu8KM/lPMk2xDCY9bPsev/Jue5HjJWCUDWItQps2OLlVcYJ7Am96OXMc+9ksCWr4qFowz2T2zNUfmHHgEmtpjMKwDDofkshx6HpUFZK2cUjnYy3R3ychfMr5O0K0ERiB356rFrcxFVWmrDocoZkcYb1jVuisiUWOszjsd+SStbdJ1vBqMHG+k91eb+PqaXUBPor2D48Tgyw7DpP+V41LfYk42/84O+bN/JP6JmHAeaGKz9ag==;
	5:C5+aHLRbLNmFpN5BWR/fgNUuUTMrzBD06l/7OAPE57ntfFsv5ws7n8+s/bfcBJ+8/ZWbWT+qXQia/CG92rieRvptWMNL9gOkZbdfD7yTkU+of0tsdv7vqSW9gNum7MgLOxBbKF4p1OxhR/eGYCFURQ9H8NR6pySE+oNVvdA4nxo=;
	7:5yOI+QN6/nIrouMTFax8aKKCKznGpdEOkuv0NmljhYIpYkvsX1Wuac+k86v0ir49d6SqWVyBilGMAEFGTdflPHIzlFRHXUdkGLE7ZMkCRSxfUDFo5MUfzI9KussP3uyFzByPsI62qfjrDuWVXLV1Dg==
x-ms-office365-filtering-correlation-id: a91efc58-d39f-48cc-3321-08d654a66ab1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:AM6PR07MB5144; 
x-ms-traffictypediagnostic: AM6PR07MB5144:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ricardo.perez_blanco@nokia.com; 
x-microsoft-antispam-prvs: <AM6PR07MB5144B775DBD5EACBC67F8991B3D00@AM6PR07MB5144.eurprd07.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231443)(11241501185)(806100)(944501430)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR07MB5144; BCL:0; PCL:0; RULEID:; SRVR:AM6PR07MB5144; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(6512007)(256004)(6436002)(25786009)(5640700003)(86362001)(3846002)(53936002)(8676002)(1076002)(81156014)(81166006)(1730700003)(6116002)(2906002)(6486002)(50226002)(14454004)(478600001)(106356001)(1361003)(105586002)(99286004)(2351001)(8936002)(6506007)(486006)(71200400001)(7736002)(54906003)(71190400001)(2501003)(386003)(305945005)(68736007)(97736004)(26005)(5660300001)(11346002)(36756003)(1411001)(186003)(446003)(2616005)(102836004)(316002)(476003)(6916009)(39060400002)(66066001)(52116002)(76176011)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB5144;
	H:AM6PR07MB5368.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: QFlHAG11IsnRCTwuNhg/xfZuCYY4M8OP6418uNhIr+K9qdmY+pc/IBcF4MKKOC8ZCEinXm0AQ+p9gDA/YGJDbMQ2g/5X7fmOnjGwRiJxTtgrz/BbWs94SgHyV0w0qf/ElmUIEX2DRtGwwf88Bip6cCJjnJ/1zfVlCq63jtC8Q9zefRN0D+2Tjm/KLc10ahcWLsT8h8UD102/nfEpo/uGK0wrziouBPaKk5c2BMKoO8knOUSLvwivYVmvLLjpOuqgWIa7DKEm3tTmVXDoqarEVxxPCfajenRKPS2efjCuoOyCgC0ferZc9jQLimStBvz2kgMrX2yn7e0n9GufkADqUXyCLTaACYJycZ1mT07Tz+0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91efc58-d39f-48cc-3321-08d654a66ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 20:25:06.2244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5144
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.0.100
Subject: [Qemu-devel] [PATCH v2] Allow AArch64 processors to boot from a
 kernel placed over 4GB.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Perez Blanco,
	Ricardo \(Nokia - BE/Antwerp\)" <ricardo.perez_blanco@nokia.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DGokTX95UwM7

Some machine based on AArch64 can have its main memory over 4GBs. With
the current path, these machines can support "-kernel" in qemu.

Note that, currently, none of the QEMU machines have their main memory over
4GBs.

Signed-off-by: Ricardo Perez Blanco <ricardo.perez_blanco@nokia.com>
---
 hw/arm/boot.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 586baa9b64..2e443c2bd1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -63,8 +63,10 @@ typedef enum {
     FIXUP_TERMINATOR,   /* end of insns */
     FIXUP_BOARDID,      /* overwrite with board ID number */
     FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code addres=
s */
-    FIXUP_ARGPTR,       /* overwrite with pointer to kernel args */
-    FIXUP_ENTRYPOINT,   /* overwrite with kernel entry point */
+    FIXUP_ARGPTR_LO,       /* overwrite with pointer to kernel args */
+    FIXUP_ARGPTR_HI,       /* overwrite with pointer to kernel args (highe=
r 32 bits) */
+    FIXUP_ENTRYPOINT_LO,   /* overwrite with kernel entry point */
+    FIXUP_ENTRYPOINT_HI,   /* overwrite with kernel entry point (higher 32=
 bits) */
     FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
     FIXUP_BOOTREG,      /* overwrite with boot register address */
     FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
@@ -83,10 +85,10 @@ static const ARMInsnFixup bootloader_aarch64[] =3D {
     { 0xaa1f03e3 }, /* mov x3, xzr */
     { 0x58000084 }, /* ldr x4, entry ; Load the lower 32-bits of kernel en=
try */
     { 0xd61f0080 }, /* br x4      ; Jump to the kernel entry point */
-    { 0, FIXUP_ARGPTR }, /* arg: .word @DTB Lower 32-bits */
-    { 0 }, /* .word @DTB Higher 32-bits */
-    { 0, FIXUP_ENTRYPOINT }, /* entry: .word @Kernel Entry Lower 32-bits *=
/
-    { 0 }, /* .word @Kernel Entry Higher 32-bits */
+    { 0, FIXUP_ARGPTR_LO }, /* arg: .word @DTB Lower 32-bits */
+    { 0, FIXUP_ARGPTR_HI}, /* .word @DTB Higher 32-bits */
+    { 0, FIXUP_ENTRYPOINT_LO }, /* entry: .word @Kernel Entry Lower 32-bit=
s */
+    { 0, FIXUP_ENTRYPOINT_HI }, /* .word @Kernel Entry Higher 32-bits */
     { 0, FIXUP_TERMINATOR }
 };
=20
@@ -106,8 +108,8 @@ static const ARMInsnFixup bootloader[] =3D {
     { 0xe59f2004 }, /* ldr     r2, [pc, #4] */
     { 0xe59ff004 }, /* ldr     pc, [pc, #4] */
     { 0, FIXUP_BOARDID },
-    { 0, FIXUP_ARGPTR },
-    { 0, FIXUP_ENTRYPOINT },
+    { 0, FIXUP_ARGPTR_LO },
+    { 0, FIXUP_ENTRYPOINT_LO },
     { 0, FIXUP_TERMINATOR }
 };
=20
@@ -174,8 +176,10 @@ static void write_bootloader(const char *name, hwaddr =
addr,
             break;
         case FIXUP_BOARDID:
         case FIXUP_BOARD_SETUP:
-        case FIXUP_ARGPTR:
-        case FIXUP_ENTRYPOINT:
+        case FIXUP_ARGPTR_LO:
+        case FIXUP_ARGPTR_HI:
+        case FIXUP_ENTRYPOINT_LO:
+        case FIXUP_ENTRYPOINT_HI:
         case FIXUP_GIC_CPU_IF:
         case FIXUP_BOOTREG:
         case FIXUP_DSB:
@@ -1152,9 +1156,11 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_in=
fo *info)
             /* Place the DTB after the initrd in memory with alignment. */
             info->dtb_start =3D QEMU_ALIGN_UP(info->initrd_start + initrd_=
size,
                                            align);
-            fixupcontext[FIXUP_ARGPTR] =3D info->dtb_start;
+            fixupcontext[FIXUP_ARGPTR_LO] =3D info->dtb_start;
+            fixupcontext[FIXUP_ARGPTR_HI] =3D info->dtb_start >> 32;
         } else {
-            fixupcontext[FIXUP_ARGPTR] =3D info->loader_start + KERNEL_ARG=
S_ADDR;
+            fixupcontext[FIXUP_ARGPTR_LO] =3D info->loader_start + KERNEL_=
ARGS_ADDR;
+            fixupcontext[FIXUP_ARGPTR_HI] =3D (info->loader_start + KERNEL=
_ARGS_ADDR) >> 32;
             if (info->ram_size >=3D (1ULL << 32)) {
                 error_report("RAM size must be less than 4GB to boot"
                              " Linux kernel using ATAGS (try passing a dev=
ice tree"
@@ -1162,7 +1168,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_inf=
o *info)
                 exit(1);
             }
         }
-        fixupcontext[FIXUP_ENTRYPOINT] =3D entry;
+        fixupcontext[FIXUP_ENTRYPOINT_LO] =3D entry;
+        fixupcontext[FIXUP_ENTRYPOINT_HI] =3D entry >> 32;
=20
         write_bootloader("bootloader", info->loader_start,
                          primary_loader, fixupcontext, as);
--=20
2.14.1

