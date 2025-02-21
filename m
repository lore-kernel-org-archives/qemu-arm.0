Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp328007njc;
        Fri, 21 Feb 2025 06:36:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXP9dih6Mzbw8TEOpyAIcPRW/E84iU4b79SLDQA3ENLfusz5ZAQo1/U5vSoPucMjSN5lWvWJxOUdJLPbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIM/bNq0aQIyoXTYFAhT7D5GxZmc8+of5oIGGKbWhAMsLdmnXaQNMGs+P0zzha+odgDJIm
X-Received: by 2002:a05:6214:246b:b0:6e6:5e21:3b20 with SMTP id 6a1803df08f44-6e6ae9915c6mr43528616d6.35.1740148607508;
        Fri, 21 Feb 2025 06:36:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148607; cv=pass;
        d=google.com; s=arc-20240605;
        b=SST2uGj2Lun2tY1c/rjQUvi5VRj2EnpDpVIyTjRRzyyDfMhk2sZNwHyNEEvx7gDHUy
         iz4PXXyJNFIwwa90JU+vVXImXKdCsUK5U+zJr56xYrw/TTMSGXdHv1eIyPbGHXwaPzQG
         kOAuqBUx81Zf2B8+ixGGs1PSh6X2oho2tHtAHsqD8h+3dXNOgz7EY9GhWCpIAe5cDR55
         cMakzDvC54Mlb2EKTuuVyEVJHIvmv/sxmS5mIz2aBSyWPHK+sp3quC7ASzn9QwK1enPc
         AwgyPi1EB34fGc0mWKj8Y9qILn9UsHEU8kj4dx7t3X8LlsDRJcV1yYeOQj6uQUw4wgl+
         ci2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=avu5M29f0fVmtCJTE/QE86nIQGwxOflJ9iNhv92f2rI=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=kw8wjsU2ft2jJ67ZBVq8TfTOplIXIGg3oFTywuLoNIfr1tW1IFmfChz7EJ49FihhLO
         dtoE39VrReEhg6CBFwWyS77SgNkB5nwZIKJKL7zbBRJjs3JMirN5tkNRYTjjQfMrQwSA
         uXhVP0laj4P8VFD9p3Y6izJpmDIiGavD7cOZJgqpiOUcHvozVvEzShNMSDFAYqlg4VKi
         o4Oofez/R4l1T2BHfG+SLDM2badJiBPId9nhCDceD9nj51qZRaPsNGSWrR04LsZY2opF
         7HMdUxa6ySJJmWY5ae8PyMZm3FPy+bsQhewz0aOQGIjTpJFzxHcLmtXVB55QoGCzwPsH
         dPfQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Pf1NswBr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525920-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525920-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525920-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d7347ebsi167019226d6.76.2025.02.21.06.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525920-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Pf1NswBr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525920-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525920-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14FDC17D51A
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BBC21323F;
	Fri, 21 Feb 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf1NswBr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE620FA90
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=uyq47GTJ0DX3CiNB7EnXtDMQoymKYHGFoPujYgBTQo/sKRyTvEUJVHJtfglO66pOPoubSpwQqbLjN7z/AFAopvPQDeuckz8g3QN+8FNyT67GB3u9HlPpYPQd44AH08k8uiYhBYy0hXezf4hui60S429GaycKEySNzP59xNPEwGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=i9MVKKTfK37ScBDgPKvVwPNcVwzzFw/Yj2KPjgEtak0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AV9yOkNzQ3RpHACF8ZiuhLxWQqcWEa/DcWAjNe0XR/4/+El8tqJA7C5x9kDKa8E65wHQ9/A/V1i1En2BwS5voujxUnAKuMUjGBMIjLcjL4O+jcVbTyWdRFjaW55BN1OpkBAiamXZluT1zdAbHfaMX9Cb8U6PCjjxQCqXMeEYz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf1NswBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A060DC4AF0D;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=i9MVKKTfK37ScBDgPKvVwPNcVwzzFw/Yj2KPjgEtak0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pf1NswBrszPv2+HNrGeljQlRTqz8U5aNMSvlC6S23QUdkdNL95X8i/70NNG1M0QJb
	 7jCNP6MdPIFkebmY7/hff4wKBWazXKjNOh2l56cDwX61oW542Rya5j6EuUi6RMHvL4
	 cqu2+nlxfhcfcdRtaBcRqiToc/Kl7yW8jx2I6+p7SgRq39IjmlKuC46TZWb5qA6Tbc
	 iPrWaD4gz6rY5RMdboOfxfrpIv2lx4Jn2q+Ot6OSMAzQYfqLsc+cJL6wzFhukf1kzF
	 9/eankGPEpDO1YVcD2EgV2a1Qh3DEUSIEEM5U1ewPl/FEYuDPAO9maUFAXt7QYzuN0
	 v4BMGZsikS1dg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jEJ-3jQr;
	Fri, 21 Feb 2025 15:35:30 +0100
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
Subject: [PATCH v4 12/14] tests/acpi: virt: add a HEST table to aarch64 virt and update DSDT
Date: Fri, 21 Feb 2025 15:35:21 +0100
Message-ID: <c408dcb6993540514b01fae6434a73440030efdf.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: cjaIsTCOqWMv

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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
 tests/qtest/bios-tables-test-allowed-diff.h   |   1 -
 6 files changed, 1 deletion(-)

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

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1a4c2277bd5a..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/DSDT",
-- 
2.48.1

