Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647871njc;
        Tue, 27 May 2025 00:43:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiVpg6JKJnBcD9am8yPfWvKr1275QTJoqACMCiBJCn4bP4DfJkO0AXuTxFVhNTHP/DFGH7dV8ynJX+pQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFp4mSO9y5fOqRw8tfmrILGDJMRYwS6uQ8E6K1Q5X5Er5bDvZdGZkbJC9ANRE2xbLTgkMoF
X-Received: by 2002:a05:620a:1a0d:b0:7ce:bdb5:d58a with SMTP id af79cd13be357-7ceecb95f19mr1555564485a.31.1748331809147;
        Tue, 27 May 2025 00:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331809; cv=none;
        d=google.com; s=arc-20240605;
        b=iAhKMS0FihYdHXwf63dOdUAIL1a12q3J7jndmH3z742i1x0W8eVjAwJjcPWBA2agdF
         PHgln2+GXstk8zqb4lFPAtGhCCbkwQJWp/6QZRbYgT2TCGhFTkK6BwHnbSQtA/QckBqA
         iPZyITSu630BPnd00Ly0OWSZ6Ste+bi27Tiha+rrFGOO0cCrtW7wmKgqjJ5wglVQaoUY
         0s+MZzD+SVmmLOi32r6dZJARFU16KJ6407vPCVDVNL5big5s6kKAQGL9piXF8GiNZtvw
         zQUm0mDST4hbt/CRkbjT9RwT7HxTZN/b1ik5Jn6kYpTA9CiX3j65vtKjGOlPWBfjpCK1
         IXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g1J/1ny99bXm6jJSDCsDKzW2QOfAqrpYhal9qFozJ1U=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Xdi95e+m4xqBBeI0Zf2JSGMg80o7jE3hek6NywKdndy+UTB+CFDK3kbc7A3qiRvUeZ
         imLaUCj9duHMnmbJ5mU7Tfw2jGSS1u0T+tKDCbJefOsKKb8RmyckBBJiDKjdO9Bt9ZSb
         /VQu2hrX/wAjk+iW+2O1SaVNm+bFjCg97cK/qX9hHhB037xc+xeeEUpoXpf5G7/arU4W
         MWrdpkEZarn6FrX9kuVkAoSWlDLJ2GGbNMe7b5Kyt/GpNlQjGOmyVN5sNJzni+tkGjb+
         D24d1pG24HANJs3dVonRryFrElO4QqA8yZRl+P7Mie13sCIH7h+DDJZK24uBCtEEravp
         wjrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qnqdcg8T;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468b1bbasi2528376585a.362.2025.05.27.00.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qnqdcg8T;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1J/1ny99bXm6jJSDCsDKzW2QOfAqrpYhal9qFozJ1U=;
	b=Qnqdcg8To629o+ja9zUP7T4vmEvOseuoHhorA8DfPnj1jx5rXgOYE7TsExxKmEQLgKZIxD
	XZqOLQtrppGspZCJRffY5RCrHYY759eL+vp2x+rpfSYM/rtcvI8i+A5na06LpKfz2PsYAV
	GOqynpHsEry4IoXIo0OqoTjGy5RZ+1w=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-wPh0mYWBOKKZjiVNS7o-4g-1; Tue,
 27 May 2025 03:43:25 -0400
X-MC-Unique: wPh0mYWBOKKZjiVNS7o-4g-1
X-Mimecast-MFC-AGG-ID: wPh0mYWBOKKZjiVNS7o-4g_1748331804
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C78A1955DAD;
	Tue, 27 May 2025 07:43:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BAEEC19560AA;
	Tue, 27 May 2025 07:43:19 +0000 (UTC)
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
Subject: [PATCH v2 10/25] tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change
Date: Tue, 27 May 2025 09:40:12 +0200
Message-ID: <20250527074224.1197793-11-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: kRlcEN7W4SQq

From: Gustavo Romero <gustavo.romero@linaro.org>

Update the reference DSDT blobs after GPEX _OSC change.

DSDT diff can be found below.

  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of dsdt.dat, Mon Apr  7 05:33:06 2025
+ * Disassembly of dsdt.dat, Mon Apr  7 05:37:20 2025
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001A4F (6735)
+ *     Length           0x00001A35 (6709)
  *     Revision         0x02
- *     Checksum         0xBF
+ *     Checksum         0xDD
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
-                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
-                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    CTRL &= 0x1F
+                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
+                    Local0 &= 0x1F
                     If ((Arg1 != One))
                     {
                         CDW1 |= 0x08
                     }

-                    If ((CDW3 != CTRL))
+                    If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

-                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
-                    Return (Arg3)
+                    CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
-                    Return (Arg3)
                 }
+
+                Return (Arg3)
             }

             Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5170 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5256 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6531 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7627 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5372 bytes
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
index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..21278dd23850f3714f82da4da37d8f6f0def7c41 100644
GIT binary patch
delta 113
zcmX@3u}Oo=CD<jzNQ8lbNoyjPG*hp`Ms+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zBNmvG|*h?oFKtRMj-vXE!9v9Kf~
E0NvLgQ~&?~

delta 139
zcmdm_aYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SP`!1l>5}{ezuZy0RIZUBV3)
zc(702Eu`gV6dW25P~hwmZtNTq<WmhIxa2|P0)a`BGZ||^YPmSTI>aVThN*)H3xI?R
SK#D=)OR^X8ZI%?4WCQ?(sV7tb

diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..a29aa5d2ea83f00c543b58fe33ec7ce826e050be 100644
GIT binary patch
delta 113
zcmZ3a*`dkh66_MvA;Q4G^lc)SG*h$NM)f&dOm34mALX*<5cFY>_YZbv>B?qsb_q9J
z;Kw>yP*}^vIH5X$OFm(Nz@*8UjI|&cE)KA~@TAGkF5$)r5HSIeSV00vWFgPyPGLz#
E06pL!c>n+a

delta 139
zcmeCsT%^h666_MPNQ8lb>BdAZX{KKHjp}o_m>i~VKFVdyA?U^#?;q^U(v{8N>=JIc
zz=M6Vps<#oQE+HLK!LMMxUq9ckWV#;;F1TC3j`)j&Sb0wspaAT>kykX8Kw>*EC3QN
S04WBEFUelWw>e)}k`Vy<UnqG1

diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..786466e58a7a81bf81fb7cadbb0630e803f19f28 100644
GIT binary patch
delta 113
zcmbPh+-%I{66_MvEXlyY<UNr~nyGK<Ms+tXCb!9(^SP`!1bx`!{ezuZy0RIZUBV3)
z__0pjEu>{)oKT&>C7-ZBVAAAF##)dJ7YA5gc+zBNmvG|*h?oFKtRMj-vXE!9v2Yd}
E01f0IF8}}l

delta 139
zcmZoRo@>nI66_K(SCWB&$z~##G*id)jp}Y(Ob$~w=W|(e2)c2``v*I-bY(L*yM!Aq
z@L-?3TS&{#C^$4ApupKB+}JrJ$fp`aaLI$n1p<>MXEN4;)N*lvb%;%x3{wXY761ts
SfE0tomt-&G+bk)Z#RdSwDJU-h

diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..cdefdbb92f6b509b39413a3150d0d5d575c22df3 100644
GIT binary patch
delta 205
zcmexwecGDKCD<k8v@8Py)7FVx(oAi)HmbXEF?qIa&ga_8F6hG^?;q^U(v{8N>=JIc
zz>jruo{W}>aYA(hmwdtkfk~4y8EZi@TpVC|;YpL7UBZnMAYuX_v4RAU$U>gU&tz;j
Ze-hGTWOAFlSxLm2gNkNvekLQy2mmfWJ;DG0

delta 256
zcmX?Y{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=X3347j)x{_YZbv>B?qsb_q9J
z;K4rGR!GawC^$4ApupKB+}JrJ$fp`aaLI$n1p<>MXEN4;)N*lvb%;%x3{wXY761ts
lfE0tomt-&G+dNw+n~}+3>ShiRYYw{DIC-{^?d10|cL0k$O`-q*

diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
index 029d03eecc4efddc001e5377e85ac8e831294362..8cb1d9ef7a6e5a0429e96bf4b6529bc814a936b0 100644
GIT binary patch
delta 113
zcmbQH^+%J-CD<k8j|c+;ll(+3X{L7Hjp_p2Om34mTXI`-2>P(c`v*I-bY(L*yM!Aq
z@ME3aDy(H<oKT&>C7-ZBVAAAF##)dJ7YA5gc+zBNmvG|*h?oFKtRMj-vXE!<Utvi`
E018GRTmS$7

delta 139
zcmeyPIZcbpCD<iIOq79viGL!OG*hGhMs)#hCWon;ExD~Z1l>5}{ezuZy0RIZUBV3)
zc(6}y71r`I3JwhjC~$TOH+BvQ@~H+9T=F1tfxx86nT)j{wOkxv9b%Iv!_+~91wg_D
SAjKf@CD{x4Ha`}YWCQ>=S0`Km

-- 
2.49.0
