Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788119dye;
        Fri, 27 Jun 2025 02:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg2k5mKlDO+RN81IgsNsNReJatAgJZeCMm+g+pjCzFfWL4HwOx6shPkVxqhbns7m5ujpxrRqX222UXHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF89FJed55IGb4JGk+l0V8R9pcFrz88XpMa4j6zbdzuuPkf2lTnmB4gD8K9ZVrBFgXY0Ozb
X-Received: by 2002:ac8:5c93:0:b0:4a6:fa39:63a4 with SMTP id d75a77b69052e-4a7f2db5dc1mr122497611cf.2.1751018288885;
        Fri, 27 Jun 2025 02:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018288; cv=none;
        d=google.com; s=arc-20240605;
        b=lQ8TgZC2XUiv/7zHjBV6ZcgLrysG/YUYfEzzNZfKTXkouzBA8IrhmxjvjQrYM5kmZ/
         +8tdbNIjxSJSkBj5yZK5bOBwMk1AHpbQqsuaVSsvZZnbZdztPooyFWmGereq25xpYSae
         TAcev9u/KgzXSaJCemmFJ+he0OkN0Zg8UIFfPmdPkRNYN56SRhKqAIB6ebxta4D7QKJr
         FgvXQS7Kgry9Y5UFXDIpObGoF5wLJFAwgKvhAUggiTkpkAe/Cs+8E3t5oo3NeGejftCH
         BerSDCqV7rbbKgeOWpqTLEcUT0h7E+rJsBjxqm9egDm/ggvegaGnTXmtXW7LTyXGQZJ8
         lynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3P0lk6reQ0jJHbmCNRDUlBNJ8kYS7VDrLmKg9C1u1os=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=AmjDuneZkZxdLf/7hDF+fDreHW23+n4c/Ef5pVm8IYqPh2Zxi24eI5G9+VIeAe//wT
         GV4tSpHbDadpTsA6tfBA1qvx3aFepxdVeKVYmsbX3ekGKfrF52n9Bz85jou0qNPYnPJQ
         24Z0fHc3Z81OpMOQvBQ3V2Ex+sv3EW49t/AlmX8BbGKiv1RrocIMGJfO6WcKYzHoguMB
         HfjZq344sPOaMUfL9ClkX69xTdzQjSzgSI7xRUBRFKHRao43xYjoc0B0MM2/DLWP1Vm2
         TSO+1f9NEvnkoZDRRuUeDhZfcDXpzrYQXG1gusDYotBeug3jCksBKcuvRnaefYrdAPdv
         9JaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gGQP+ufA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc12aa0fsi20314441cf.156.2025.06.27.02.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gGQP+ufA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3P0lk6reQ0jJHbmCNRDUlBNJ8kYS7VDrLmKg9C1u1os=;
	b=gGQP+ufASCD4At1gnFuQwn6nyGs0HtswTyYfJJnWT1moDuZ4ZZWEGr9TgDSbXDW0+rxTUw
	DYS2y8jz+nr97XxDf8vDISYpeI566d1IeXRrIkMzEszG1MFAFFP6b49fqHkK2EqT05FrZD
	lYxjldECi6YDipOJYPwhRmQxh5wbNqw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-cnZOd8bkMZutBue0sovOpA-1; Fri,
 27 Jun 2025 05:58:05 -0400
X-MC-Unique: cnZOd8bkMZutBue0sovOpA-1
X-Mimecast-MFC-AGG-ID: cnZOd8bkMZutBue0sovOpA_1751018284
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30FC8180120B;
	Fri, 27 Jun 2025 09:58:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BCBD619560A7;
	Fri, 27 Jun 2025 09:57:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 19/32] tests/qtest/bios-tables-test: Update ARM DSDT reference blobs
Date: Fri, 27 Jun 2025 11:55:08 +0200
Message-ID: <20250627095620.3300028-20-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 9OtbqAq/C+yZ

Changes relate to the introduction of pieces related to
acpi-index static support along with root ports with no hotplug.

+
+    Scope (\_SB.PCI0)
+    {
+        Method (EDSM, 5, Serialized)
+        {
+            If ((Arg2 == Zero))
+            {
+                Local0 = Buffer (One)
+                    {
+                         0x00                                             // .
+                    }
+                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+                {
+                    Return (Local0)
+                }
+
+                If ((Arg1 < 0x02))
+                {
+                    Return (Local0)
+                }
+
+                Local0 [Zero] = 0x81
+                Return (Local0)
+            }
+
+            If ((Arg2 == 0x07))
+            {
+                Local0 = Package (0x02)
+                    {
+                        Zero,
+                        ""
+                    }
+                Local1 = DerefOf (Arg4 [Zero])
+                Local0 [Zero] = Local1
+                Return (Local0)
+            }
+        }
+
+        Device (S00)
+        {
+            Name (_ADR, Zero)  // _ADR: Address
+        }
+
+        Device (S08)
+        {
+            Name (_ADR, 0x00010000)  // _ADR: Address
+        }
+
+        Device (S10)
+        {
+            Name (_ADR, 0x00020000)  // _ADR: Address
+        }
+    }
 }

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

above changes are reported after running make check V=2
then I launched ../tests/data/acpi/rebuild-expected-aml.sh from the
build directory and it putput those reference blobs.

But I run make check V=2 after committing those changes I get and error
which looks totally unexpected to me:

acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-LZSL82], Expected [aml:tests/data/acpi/aarch64/virt/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-FTSL82.dsl, aml:/tmp/aml-LZSL82], Expected [asl:/tmp/asl-ZAWL82.dsl, aml:tests/data/acpi/aarch64/virt/DSDT].
--- /tmp/asl-ZAWL82.dsl	2025-06-27 03:34:45.518848387 -0400
+++ /tmp/asl-FTSL82.dsl	2025-06-27 03:34:45.514848036 -0400
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20210604 (64-bit version)
  * Copyright (c) 2000 - 2021 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/aarch64/virt/DSDT, Fri Jun 27 03:34:45 2025
+ * Disassembly of /tmp/aml-LZSL82, Fri Jun 27 03:34:45 2025
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000014BE (5310)
+ *     Length           0x000014AD (5293)
  *     Revision         0x02
- *     Checksum         0x8C
+ *     Checksum         0xEA
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\_SB)
     {
         Device (C000)
         {
             Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
         }

@@ -1929,24 +1929,19 @@
                     }
                 Local1 = DerefOf (Arg4 [Zero])
                 Local0 [Zero] = Local1
                 Return (Local0)
             }
         }

         Device (S00)
         {
             Name (_ADR, Zero)  // _ADR: Address
         }

         Device (S08)
         {
             Name (_ADR, 0x00010000)  // _ADR: Address
         }
-
-        Device (S10)
-        {
-            Name (_ADR, 0x00020000)  // _ADR: Address
-        }
     }
 }
---
 tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5158 -> 5310 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5244 -> 5379 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6519 -> 6654 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7603 -> 7768 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5360 -> 5495 bytes
 6 files changed, 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index abe00ad4ee..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/DSDT",
-"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
-"tests/data/acpi/aarch64/virt/DSDT.memhp",
-"tests/data/acpi/aarch64/virt/DSDT.pxb",
-"tests/data/acpi/aarch64/virt/DSDT.topology",
diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
index acab6e65febbc210158d4c39be0680bbb90250f5..b897d667971500da4732000091a6f0828d05d89e 100644
GIT binary patch
delta 173
zcmZ3cu}_oBCD<iop9lj3Q_n^&8IgJccg`5S_+Y2_0B27F5pPykmtbGs1!j}87zzZL
z85t55NKKlYAt=lxaKZfK(_qso--+U{d?gP%`z}dXz&<sTi)l$h0as&30t3U6gatB_
zv$)s`gjksvco`B3nmckB7!nH-A(GKe+`$G0@f`7vE<p^@P5i+I7V#YMl8!DxJPZts
OU=c&8G!Fv<69WJ)j4yfs

delta 19
acmdm|xlDu0CD<iIO@x7g>C8qh84&<COa$Tp

diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
index 54c27e7d95b4956ed1b5dee0d299ccb08dc2a73e..2cef095bcc1bb404f8cd9ec77a879ed81c191875 100644
GIT binary patch
delta 156
zcmeyP(X7Sg66_MfEXu&Zv}_|+kx0FO8%K;@e6Uk|fU~E8h&QXNORz8R0<+0k3<ZMB
zj0_12q$W+y5ESMTxL|(rX|QRP??mxezLJNXeU~IGV4s@F#k3@$fUB`1fq`L3!UCDe
zSzPP|Laa;-ybK8i%^f)m42cDa5XtB!?qCChc#e2Smmr4dCjMXpi+GNB4o8<D9tH+R
F1_1j$EA9XQ

delta 19
acmZqH`lG?+66_LEBf`MI)VYzXNCW^oYz1ck

diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
index 4330bc97cba0950191c45ac833533db7a190db81..372ca3d7fb1e2927c7c12f97eec406d597f294ab 100644
GIT binary patch
delta 156
zcmexv^v{^fCD<k8pCkhV6Zb~0T*-O?H;x#+_+Y2_0B27F5pPykmtbGs1!j}87zzZL
z85t55NKKlYAt=lxaKZfK(_qso--+U{d?gP%`z}dXz&<sTi)l$h0as&30t3U6gatB_
zv$)s`gjksvco`B3nmckB7!nH-A(GKe+`$G0@f`7vE<p^@P5i+I7V#YM9F8tQJPZts
F3;>E4EZYD8

delta 19
acmexo{N0GlCD<jTT#|u->Fq|YTuA^&WCm0K

diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
index 7fdbc03e2bf9fb7d35704779253de36e362f0bf9..c2779882494e16920787b8ab7b4cb3c3b70f224b 100644
GIT binary patch
delta 168
zcmdmNeZz*!CD<h-LXLrf$!jCmN?BzA7p@q+_+Y2_0B27F5pPykmtbGs1!j}87zzZL
z85t55NKKl&K}IZRNx}m5shM0%OA-pW8aomg7?va~keQst#a<x9%EZ9SkWkRvk;A}{
uSda*jjBer%HZX|ih<9`eVu)^%2{y2RaCjIP7#YxH`GXCiN_iL<m>2+L6)WZd

delta 19
acmca%v)P)<CD<iovn&Gx)9sC1D`f#g-Uey_

diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
index 969b4f6560d3ae39f5b7e0064b7122905476fce8..ebbeedc1ed30d811315c350f4cb42f8aa265af73 100644
GIT binary patch
delta 156
zcmeyM`CW_4CD<jTT$F)<>HJ2nXCn0iZX7Xs@xe~<0nVNVBHpa7F2TOM3(O{GF%$?g
zGcqJBkeW0(Lr|DY;DY(dr@^LGz7xe?`AQyk_Fa;&fPHEv7t@l20<Ol61O|pB2@7N<
zXK}F?2(dCT@G>M6G<W1MFeDZvLL{S`xPuK0;yL0SU4j^*oA`qbEaExhIUHSrco-NM
F8359@EocA$

delta 19
acmeya^+A)%CD<k8g9rly)25AF&qM%8i3Z^S

-- 
2.49.0
