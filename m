Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3617264njk;
        Wed, 29 Jan 2025 00:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXoDpwD7ylBXQsojX62Ml3v2ISIkAvw8lb3h1/9CVI3ky8GbK7LbuIGKgXIn6p5nd39blgD83Eck46UHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEm4uZq1kbmSYhu97uWNaWLOLMhEJUy1BYaxzB8OkTVwGYE8KNDY+jpxJ8sH/Kxzp1kArY0
X-Received: by 2002:a17:90b:280c:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2f83abb8dd5mr3438676a91.11.1738137945259;
        Wed, 29 Jan 2025 00:05:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137945; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ezj9cM5WP4VgKAlssyHrqBA6g+z5r3zk8PAIwnOqZvHVnkXFpOf2A0ysKOnKxN1PWF
         eGPEog37+Tad+7scsFX+IicHb/dDZFfLsBR4GAMj8zNG2vw9LQIQdCnKjqxwiITSeHk1
         BM+lKaon/1Z3KNNh9F8lXNbLh8kXiheS/MTrvTzF7uSPh+Pk3G0jpStYTXjZXVCzi69W
         CZnbDNMhZp/qseHaM1syjmkY5mO/wKxOZykv6lLVLAvvZ3mCNqTdImB2WDVpIh/eNITa
         58n5lOKjUQo9ua6ul5IgJIF87re6m6bGxrL6W40B9dYo3FOr+mbGb1nbcMZ272ZsbmZr
         Lgmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=VteJWjdXoFQQOcSlVZghKWnURTstyWzGhfQdwmntRu8=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=IOYPmwhuURhAlyWeCPM3MBPYAXemeuLOJRscfy/sHSyljtvB7bQlVrfe9f+bhe4K22
         DtwFzFJI4n/ejk+uWY1kiMaVdl6SDaI3r98i9CvQKp/WRo1jgHIzij+8+f2pWLkO1KrE
         RfqG5BNaHPk+r48Vj/0YSKDmiyuE20qWrxT9dEytZL/3IDDlKqXot8czNCpHH0/hnO7Y
         xjP/o9iObM8WWkFbiOYmYFdcCQj/nhA+UxKeCwLfE6iZFbVJCbtsMVhuNNQ2ViRry8KP
         jZWo5l0eciSW7QOttzOwUPtYiMKkLgq5z9OnqsqbNi9s/GsSY6O9Bv/fAC+T7okrcwum
         82gA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hRrO6X4N;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492180-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492180-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492180-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2f83bd11194si1279263a91.63.2025.01.29.00.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492180-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hRrO6X4N;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492180-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492180-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 422EC3A5414
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958361AC891;
	Wed, 29 Jan 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRrO6X4N"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9B19AA58
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=pXQNCQkfKgAHrQXF/E3HD+IzWjCOUX7txrNA6M4FzC3aWJZttFX9SOIXWIRIlwEvN0+pMdVIVqk6PHLyHpNKjkIG6pJdH9xJf03tKjxesoencxCMx/p/2226WHeWNwWlTWbqXy6kPjJVdd2vu5QAVqQo/P9kULkwLbfXwQI/ImA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=meLwX2WgCLY/FKFJs1/PZ4OTAM+LLg2Xn/7Trx0DQKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtBrAE/i+MmFBfo5yybyC/wSQSYklF5Ro7Xbb7VJUfU34x4fHCSOnxwFKGTnFFsspdE2mFmMdXmIZTo+LyCaeVq2RjmYtdysG0g3DqpDD2R0XW4ZDQjzCbSt94Oc45di00RnOIFdXvOqlTJqv27sJXq9phgGw5yQR77quvc5UL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRrO6X4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E039CC4CEF2;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137867;
	bh=meLwX2WgCLY/FKFJs1/PZ4OTAM+LLg2Xn/7Trx0DQKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hRrO6X4N3ZhZ5K2e/UcyUgZqGVKrH4ZLhwwi6L6wQCEYwu0PQl2IS8XHYvYbK9B2e
	 qqu79LMa8iHPdGDl/gZCN3sReffS3cCQCbymbRy0uJW6VRKxMP5WmE1JfitLQexMh+
	 8FR6y08JCrb3MbHEVCf7IA96IwEaM1ZzN/UFhfh4IPEI1b5PkEQauHN4JKG2HvAF+u
	 zO7Z0EXr633uStXrCZCc+4jnSLq5nFGVEeiYcQ4GF9LXzk3SiKIxtYZWbgDbB6W8Od
	 eOyvjLmYCTUy02ZwC4qFfn42A+oryMLsmyYLmm4v1d3HjYWWPs+W7T0zoL0ubS4x1n
	 1qZnvGBxOgY1w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DQI-44Gd;
	Wed, 29 Jan 2025 09:04:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] tests/acpi: virt: add a HEST table to aarch64 virt and update DSDT
Date: Wed, 29 Jan 2025 09:04:18 +0100
Message-ID: <7036f18f9c25852aeae6526d424e259211a0c9cd.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Pqq4Ya1U/64h

DSDT has gained a GED device to notify errors:

--- a/DSDT.dsl        2025-01-28 09:38:15.155347858 +0100
+++ b/DSDT.dsl        2025-01-28 09:39:01.684836954 +0100
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001516 (5398)
+ *     Length           0x00001542 (5442)
  *     Revision         0x02
- *     Checksum         0x0F
+ *     Checksum         0xE9
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -1931,6 +1931,11 @@
                 {
                     Notify (PWRB, 0x80) // Status Change
                 }
+
+                If (((Local0 & 0x10) == 0x10))
+                {
+                    Notify (GEDD, 0x80) // Status Change
+                }
             }
         }

@@ -1939,6 +1944,12 @@
             Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
         }
+
+        Device (GEDD)
+        {
+            Name (_HID, "PNP0C33" /* Error Device */)  // _HID: Hardware ID
+            Name (_UID, Zero)  // _UID: Unique ID
+        }
     }
 }

New HEST table:

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20240927 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 *
 * Disassembly of hest.dat
 *
 * ACPI Data Table [HEST]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "HEST"    [Hardware Error Source Table]
[004h 0004 004h]                Table Length : 000000E0
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 68
[00Ah 0010 006h]                      Oem ID : "BOCHS "
[010h 0016 008h]                Oem Table ID : "BXPC    "
[018h 0024 004h]                Oem Revision : 00000001
[01Ch 0028 004h]             Asl Compiler ID : "BXPC"
[020h 0032 004h]       Asl Compiler Revision : 00000001

[024h 0036 004h]          Error Source Count : 00000002

[028h 0040 002h]               Subtable Type : 000A [Generic Hardware Error Source V2]
[02Ah 0042 002h]                   Source Id : 0000
[02Ch 0044 002h]           Related Source Id : FFFF
[02Eh 0046 001h]                    Reserved : 00
[02Fh 0047 001h]                     Enabled : 01
[030h 0048 004h]      Records To Preallocate : 00000001
[034h 0052 004h]     Max Sections Per Record : 00000001
[038h 0056 004h]         Max Raw Data Length : 00000400

[03Ch 0060 00Ch]        Error Status Address : [Generic Address Structure]
[03Ch 0060 001h]                    Space ID : 00 [SystemMemory]
[03Dh 0061 001h]                   Bit Width : 40
[03Eh 0062 001h]                  Bit Offset : 00
[03Fh 0063 001h]        Encoded Access Width : 04 [QWord Access:64]
[040h 0064 008h]                     Address : 0000000139E40000

[048h 0072 01Ch]                      Notify : [Hardware Error Notification Structure]
[048h 0072 001h]                 Notify Type : 08 [SEA]
[049h 0073 001h]               Notify Length : 1C
[04Ah 0074 002h]  Configuration Write Enable : 0000
[04Ch 0076 004h]                PollInterval : 00000000
[050h 0080 004h]                      Vector : 00000000
[054h 0084 004h]     Polling Threshold Value : 00000000
[058h 0088 004h]    Polling Threshold Window : 00000000
[05Ch 0092 004h]       Error Threshold Value : 00000000
[060h 0096 004h]      Error Threshold Window : 00000000

[064h 0100 004h]   Error Status Block Length : 00000400
[068h 0104 00Ch]           Read Ack Register : [Generic Address Structure]
[068h 0104 001h]                    Space ID : 00 [SystemMemory]
[069h 0105 001h]                   Bit Width : 40
[06Ah 0106 001h]                  Bit Offset : 00
[06Bh 0107 001h]        Encoded Access Width : 04 [QWord Access:64]
[06Ch 0108 008h]                     Address : 0000000139E40010

[074h 0116 008h]           Read Ack Preserve : FFFFFFFFFFFFFFFE
[07Ch 0124 008h]              Read Ack Write : 0000000000000001

[084h 0132 002h]               Subtable Type : 000A [Generic Hardware Error Source V2]
[086h 0134 002h]                   Source Id : 0001
[088h 0136 002h]           Related Source Id : FFFF
[08Ah 0138 001h]                    Reserved : 00
[08Bh 0139 001h]                     Enabled : 01
[08Ch 0140 004h]      Records To Preallocate : 00000001
[090h 0144 004h]     Max Sections Per Record : 00000001
[094h 0148 004h]         Max Raw Data Length : 00000400

[098h 0152 00Ch]        Error Status Address : [Generic Address Structure]
[098h 0152 001h]                    Space ID : 00 [SystemMemory]
[099h 0153 001h]                   Bit Width : 40
[09Ah 0154 001h]                  Bit Offset : 00
[09Bh 0155 001h]        Encoded Access Width : 04 [QWord Access:64]
[09Ch 0156 008h]                     Address : 0000000139E40008

[0A4h 0164 01Ch]                      Notify : [Hardware Error Notification Structure]
[0A4h 0164 001h]                 Notify Type : 07 [GPIO]
[0A5h 0165 001h]               Notify Length : 1C
[0A6h 0166 002h]  Configuration Write Enable : 0000
[0A8h 0168 004h]                PollInterval : 00000000
[0ACh 0172 004h]                      Vector : 00000000
[0B0h 0176 004h]     Polling Threshold Value : 00000000
[0B4h 0180 004h]    Polling Threshold Window : 00000000
[0B8h 0184 004h]       Error Threshold Value : 00000000
[0BCh 0188 004h]      Error Threshold Window : 00000000

[0C0h 0192 004h]   Error Status Block Length : 00000400
[0C4h 0196 00Ch]           Read Ack Register : [Generic Address Structure]
[0C4h 0196 001h]                    Space ID : 00 [SystemMemory]
[0C5h 0197 001h]                   Bit Width : 40
[0C6h 0198 001h]                  Bit Offset : 00
[0C7h 0199 001h]        Encoded Access Width : 04 [QWord Access:64]
[0C8h 0200 008h]                     Address : 0000000139E40018

[0D0h 0208 008h]           Read Ack Preserve : FFFFFFFFFFFFFFFE
[0D8h 0216 008h]              Read Ack Write : 0000000000000001

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
 tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
 tests/qtest/bios-tables-test-allowed-diff.h   |   2 --
 7 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..a182bd9d7182dccdf63c650d048c58f18505d001 100644
GIT binary patch
delta 109
zcmX@3@k4{lCD<jTLWF^ViDe>}G*h$dM)euOOwJsW4+;nC=*7E+g>V+Q2D|zsED)Gn
zoxsJ!z{S)S5FX^j)c_F?VBivHb9Z%dnXE4&D;?b=31V}^dw9C=2KWUSI2#)?aKwjt
Hx-b9$X;vI^

delta 64
zcmeyNaYlp7CD<jzM}&caNqQoeG*i3NM)euOOit{R4+;lM%f`Egg>V+Q2D|zsED)Gn
UoxsJ!z{S)S5FX?-*+E1W06%jPR{#J2

diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..af1f2b0eb0b77a80c5bd74f201d24f71e486627f 100644
GIT binary patch
delta 110
zcmZ3ac}|ndCD<k8oCpI0)4_>c(oCIR8`a+lGdXii78eO-)SH|wBICY5U~+W=mjDBo
yK%2X(iwjpnbdzL2c#soEyoaX?Z-8HbfwO@#14n$Qrwc=LlO#wDl9aJAR0;r(tsHj%

delta 66
zcmX@7xk!`CCD<iokq83=(~XH-(oDVX8`a+lGdZzO78eO-l%1R{A|oB$BpDDM<irv0
W;pxH~;1^)vY~akm5g+R5!T<noi4jWx

diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..10436ec87c4859fb84b3ecb7bba5788f38112e59 100644
GIT binary patch
delta 88
zcmbPheA1Z9CD<k8q$C3algUIbX{MH08`WnBGdXcjJ}4Z_<jXo)OvH<SfxzVI1TFyv
qE`c_8R~MJfaU%At($P(lAPz^oho=i~fM0-tv#~J)M|`NK3j+W#;TF9B

delta 44
zcmX?UJlB}ZCD<iot|S8klg&gfX{L_p8`WnBGdXfiJ}4Z_<ij#qOvGz*p@=Oj039?8
AE&u=k

diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..0524b3cbe00bfe552de824dd1090bd00a208c527 100644
GIT binary patch
delta 110
zcmexwz1oJ$CD<iITaJN&sbC_PG*jDyjq2XAOwJsWOJsu?^(LQ?m2qDnFu6K`OMrn(
ypv~RY#f7UOx=Au1JjjV7-ow*{H^48zz}di=fg?WD(}f|rNfM+6Ny^w5Dg^+WYaFrw

delta 66
zcmZ2&^WU1wCD<k8zbpd-Q^!OuX{N5b8`ZsKnVi@sm&gV)%1%BZD<d7<BpDDM<irv0
W;pxH~;1^)vY~akm5g+R5!T<oNArgiF

diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
index 029d03eecc4efddc001e5377e85ac8e831294362..8c0423fe62d6950f9098983d86bfee256d7d003a 100644
GIT binary patch
delta 86
zcmbQHbx4cLCD<jzNtA(s>E%Q&X{O%5jp|7vOwJsWyG4Q-^(NmJk>Ot;Fu6K`OMrn(
opv~RY#bxqO5n1WzCP@&RBi_T)g*U)2z`)tqn1Lfc)YF9l01l28<p2Nx

delta 42
ycmX@4HBF1lCD<iIOq79viGL!OG*hGhM)f2SCMWjE-6Fw^vXk$N$V}!Dl?DLb(h64q

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..8b0cf87700fa1799c0f8e48610ce4b7ff751dd1f 100644
GIT binary patch
literal 224
zcmeZp4Gww0z`($m;pFe^5v<@85#X$#prF9Wz`y`vgJ>oO1_mw$28RFt85lu)5N2Ru
tU|?_nkxwi^d=43qAPxXkD*#pd?>_{9%>kRuh}CQksCsrH%$C4mHUOJBAprmY

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 46298e38e7b8..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/HEST",
-"tests/data/acpi/aarch64/virt/DSDT",
-- 
2.48.1

