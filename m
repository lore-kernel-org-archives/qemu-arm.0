Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp178268wrt;
        Mon, 26 Nov 2018 11:17:44 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UOd+9Y/eA7o6RHs82333PIyT+2Objlyo9+UwjaPE4HdoXxefKNi6eMS1a0jzyV0Zxsreec
X-Received: by 2002:a81:2514:: with SMTP id l20mr16146446ywl.3.1543259864697;
        Mon, 26 Nov 2018 11:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543259864; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/3fy+68kn5IugrkQOtQfoFFW6MAaufydMaoCMB87svNfp+xd8xdXDBbJCSsbyO3cu
         voujqFE89H+JOzofE6WhZrcbbaLkCvasavqfgYun4ua6yN3klWaflhh/hjeN+tOxnIqT
         oMQvIJLq/GTlseq3JG/AW9wn3rHVhEprzaYoPQo1saLa/jZbdhpM8vUVJrcciVxo2g/H
         82+45x/ltqiRA+zefZIr+emDpUaodbyYhFTQbV8xVbUQaXm+g9fLOhJJtLXZpIELCgJb
         EM75LRtxrCf2YuWKRmdTZwtith4iwHC+il/Z43TiWLTagbY/SdudpYPRMP/6ZFU/z5qV
         2gYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=KUvtBLWirH8dhFZIu1vlTWfBtACF7XwDYhmIDIX2SII=;
        b=Z6Dvfe0ahKwuD6fdh5HfI+0NMFuFhBrHkRUrBf4EFcE0qRE4a2TE2KX218a+L7bX9B
         kKo1wh4mdGKWG3a5yWwxaRTd43UY8rAYO3UEp4ucfnO7REz7Sde0YY9u5l1e31HI2cbf
         O7IK+5fcVwCh2SWtXJMdK4EFeCr2wjvAuoLKjWFLys09OnZzJUghG/IB9Xv7qNHO2bEI
         r3FhHI10u0dU/0sYuhl6j505LsZwpJw8YitC8HXYHlkbtLVe9TZSBCcefBRb1oGgKVXd
         L9eqevppO5pPYWQDaS3RvVXldz7ZVbEAa7w9VWyOXc1Z7JqalfG2FOv1WS3maBtSIOqM
         Kt1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com header.s=selector1-nokia-com header.b=cvrSmq82;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nokia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13-v6si925588ybk.45.2018.11.26.11.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 11:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com header.s=selector1-nokia-com header.b=cvrSmq82;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:38309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRMO8-00042o-3A
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 14:17:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ricardo.perez_blanco@nokia.com>) id 1gRMME-0003LV-Db
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 14:15:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ricardo.perez_blanco@nokia.com>) id 1gRMMA-0007dL-NA
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 14:15:44 -0500
Received: from mail-eopbgr40134.outbound.protection.outlook.com
	([40.107.4.134]:62240
	helo=EUR03-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ricardo.perez_blanco@nokia.com>)
	id 1gRMM4-0006N6-Mf; Mon, 26 Nov 2018 14:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KUvtBLWirH8dhFZIu1vlTWfBtACF7XwDYhmIDIX2SII=;
	b=cvrSmq82oECHidFK/i9F4Scgnr2QMjYT7MdYM6Sy8WWnS5UBtBgVCx8BSqrPKJOvzUv9dA5e/LDg7xrWL1t/E0mkO1/gnZ89lvX61ozCPIcxCi0Hrw6DnnB+gdb23Z66dvqJi1uaY+Pf0BYEXx5tjzs88UeRwGUreGhgw5zp0rE=
Received: from AM6PR07MB5368.eurprd07.prod.outlook.com (20.177.199.157) by
	AM6PR07MB6070.eurprd07.prod.outlook.com (20.178.95.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.6; Mon, 26 Nov 2018 19:15:33 +0000
Received: from AM6PR07MB5368.eurprd07.prod.outlook.com
	([fe80::983:19fd:7bdd:792f]) by AM6PR07MB5368.eurprd07.prod.outlook.com
	([fe80::983:19fd:7bdd:792f%4]) with mapi id 15.20.1382.012;
	Mon, 26 Nov 2018 19:15:33 +0000
From: "Perez Blanco, Ricardo (Nokia - BE/Antwerp)"
	<ricardo.perez_blanco@nokia.com>
To: "ricardoperezblanco@gmail.com" <ricardoperezblanco@gmail.com>
Thread-Topic: [PATCH] [PATCH] Allow AArch64 processors to boot from a kernel
	placed over 4GB.
Thread-Index: AQHUhbxnS9dtkA7x9k+jVDOL/dG4DQ==
Date: Mon, 26 Nov 2018 19:15:33 +0000
Message-ID: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.14.1
x-clientproxiedby: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:62::32) To AM6PR07MB5368.eurprd07.prod.outlook.com
	(2603:10a6:20b:6f::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.66.52.11]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR07MB6070;
	6:pfG3y4VgR0Z7FEOcs48dHuQtR1K9jMzRqUnZ7VrDnDYJd5kOtOWqjqe/wWZP/ypbFp7gMtcyiJgk8Db0yykr9hwPYY0l3G6o4KdJuZ/qtCXeYPj1jT98R8ESENjJRcdH5QL4OxIldkBZIE2Cnl+x2w8KLF3gvbVlAOvhbFAglZ+uHM3Y5KvnNGa71TvgAi8XZqAuJ/dc3jZxu9JCIlYAJE4vkNg+mPg4EDjBvcwHNLW0wcxxyhPOqBn+pj3K0WPawU9xV251CFXNFw60R7BuLSCENlUTLVdvTZGNNi6P7qX1vfOKWccH76SQTOoCFnpBS699AhDxV8d2h2hQkObsmyBEFKb1Crsfx5qianKPKRA62TrcIpRJXo0gQa3uA5gAGehxhakRE8Bo7WMM0zXJD/ezHMANYjfayHeJmUefW7RzY8uXTnh9Kiid8xnzUFhAKUsiENrM8P6JtjffB/MeIQ==;
	5:PJODl97ExAqHLag1qZIsULAWV/coSu7STLmqp/kdX9BashetxXCv0Qrg3jw5E3JmcuEKqj2lpFR/w3bMyY0JZlccFMf9n64HcrOI/UdZclxgl9+z1JBjWR6MDrxMUgbcGaKcxNCiF3QAUi2vwqC+XPObPmKSR+EEH9/yxFdmdKk=;
	7:NU631cBXVrjEf3fhNLUBBNDSQ1Fh7MiTBE+O0dz0MFbvG9oGJBzobYtKJDfJEXsv+LgkbV0+PpQ230nmQKIYksghFoO71gPNJxlnfNqrFz+PmDL3JkdWleVZRWtH7qjuXLkJbd19E7qCfM6+8icdsQ==
x-ms-office365-filtering-correlation-id: eb9ec0a9-adc3-4d27-c95a-08d653d388db
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:AM6PR07MB6070; 
x-ms-traffictypediagnostic: AM6PR07MB6070:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ricardo.perez_blanco@nokia.com; 
x-microsoft-antispam-prvs: <AM6PR07MB607043B6429EE7B161684288B3D70@AM6PR07MB6070.eurprd07.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231443)(11241501185)(806100)(944501410)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR07MB6070; BCL:0; PCL:0; RULEID:; SRVR:AM6PR07MB6070; 
x-forefront-prvs: 086831DFB4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(396003)(366004)(39860400002)(346002)(189003)(199004)(1076002)(7736002)(4326008)(8936002)(39060400002)(1730700003)(305945005)(2501003)(81166006)(81156014)(3846002)(6116002)(8676002)(6486002)(86362001)(1857600001)(66066001)(2616005)(476003)(2906002)(486006)(256004)(71190400001)(68736007)(6512007)(71200400001)(53936002)(6436002)(5640700003)(2351001)(102836004)(386003)(6506007)(54906003)(6916009)(1361003)(99286004)(106356001)(14454004)(316002)(36756003)(186003)(52116002)(26005)(478600001)(25786009)(50226002)(1411001)(5660300001)(97736004)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB6070;
	H:AM6PR07MB5368.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: FaP4LnPEiOsHtC2YEIfKq9S/29C/yImRNDwrFbll7NFrv7kRbIGLr737Qi81CKJP9A69o02oYq82Psb59tTtzFcA4vIIXLIxf81ps8NbUTnMYuUrm1XNd6HoDz5AkARm1fW6VkqA0vw6TRjgNT7CeR2lNjVV6Xj6EhO6qoGyIYky7jX5KCTiJwGqG6l2WMlCDwFCxtDgLJT43LwB4uk6ogKDvY8wM0KWwUHEfJyioy+SfB0QVYc8yrQ1a8Bu51lDb5HNLMi/fhonXGIYpczsq84nWCNK0JprSj99g5Z9u00XneFqN4Uh6h5h36RD/wrXITeK49nr35IeNeB27fYGppDq9aW6ctZNpkgrG6hXWDg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9ec0a9-adc3-4d27-c95a-08d653d388db
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2018 19:15:33.1723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB6070
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.4.134
Subject: [Qemu-devel] [PATCH] [PATCH] Allow AArch64 processors to boot from
 a kernel placed over 4GB.
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
X-TUID: Ul4wpwLvaoMD

Some machine based on AArch64 can have its main memory over 4GBs. With
the current path, these machines can support "-kernel" in qemu

Signed-off-by: Ricardo Perez Blanco <ricardo.perez_blanco@nokia.com>
---
 hw/arm/boot.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 586baa9b64..183c5860bd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -64,7 +64,9 @@ typedef enum {
     FIXUP_BOARDID,      /* overwrite with board ID number */
     FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code addres=
s */
     FIXUP_ARGPTR,       /* overwrite with pointer to kernel args */
+    FIXUP_ARGPTR_HIGHER_32BITS,       /* overwrite with pointer to kernel =
args (higher 32 bits) */
     FIXUP_ENTRYPOINT,   /* overwrite with kernel entry point */
+    FIXUP_ENTRYPOINT_HIGHER_32BITS,   /* overwrite with kernel entry point=
 (higher 32 bits) */
     FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
     FIXUP_BOOTREG,      /* overwrite with boot register address */
     FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
@@ -84,9 +86,9 @@ static const ARMInsnFixup bootloader_aarch64[] =3D {
     { 0x58000084 }, /* ldr x4, entry ; Load the lower 32-bits of kernel en=
try */
     { 0xd61f0080 }, /* br x4      ; Jump to the kernel entry point */
     { 0, FIXUP_ARGPTR }, /* arg: .word @DTB Lower 32-bits */
-    { 0 }, /* .word @DTB Higher 32-bits */
+    { 0, FIXUP_ARGPTR_HIGHER_32BITS}, /* .word @DTB Higher 32-bits */
     { 0, FIXUP_ENTRYPOINT }, /* entry: .word @Kernel Entry Lower 32-bits *=
/
-    { 0 }, /* .word @Kernel Entry Higher 32-bits */
+    { 0, FIXUP_ENTRYPOINT_HIGHER_32BITS }, /* .word @Kernel Entry Higher 3=
2-bits */
     { 0, FIXUP_TERMINATOR }
 };
=20
@@ -175,7 +177,9 @@ static void write_bootloader(const char *name, hwaddr a=
ddr,
         case FIXUP_BOARDID:
         case FIXUP_BOARD_SETUP:
         case FIXUP_ARGPTR:
+        case FIXUP_ARGPTR_HIGHER_32BITS:
         case FIXUP_ENTRYPOINT:
+        case FIXUP_ENTRYPOINT_HIGHER_32BITS:
         case FIXUP_GIC_CPU_IF:
         case FIXUP_BOOTREG:
         case FIXUP_DSB:
@@ -939,7 +943,6 @@ static uint64_t load_aarch64_image(const char *filename=
, hwaddr mem_base,
             }
         }
     }
-
     *entry =3D mem_base + kernel_load_offset;
     rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
=20
@@ -1153,8 +1156,10 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_in=
fo *info)
             info->dtb_start =3D QEMU_ALIGN_UP(info->initrd_start + initrd_=
size,
                                            align);
             fixupcontext[FIXUP_ARGPTR] =3D info->dtb_start;
+            fixupcontext[FIXUP_ARGPTR_HIGHER_32BITS] =3D info->dtb_start >=
> 32;
         } else {
             fixupcontext[FIXUP_ARGPTR] =3D info->loader_start + KERNEL_ARG=
S_ADDR;
+            fixupcontext[FIXUP_ARGPTR_HIGHER_32BITS] =3D (info->loader_sta=
rt + KERNEL_ARGS_ADDR) >> 32;
             if (info->ram_size >=3D (1ULL << 32)) {
                 error_report("RAM size must be less than 4GB to boot"
                              " Linux kernel using ATAGS (try passing a dev=
ice tree"
@@ -1163,6 +1168,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_inf=
o *info)
             }
         }
         fixupcontext[FIXUP_ENTRYPOINT] =3D entry;
+        fixupcontext[FIXUP_ENTRYPOINT_HIGHER_32BITS] =3D entry >> 32;
=20
         write_bootloader("bootloader", info->loader_start,
                          primary_loader, fixupcontext, as);
--=20
2.14.1

