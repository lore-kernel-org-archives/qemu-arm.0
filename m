Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787888dye;
        Fri, 27 Jun 2025 02:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBxS9TLeN/5jpe05ZYNe6h0Vz03wVLl3VKmoC/IvqlN7r5mb3pKabGqh27Wdvlu6X5QN+dgRVmHW1wMA==@linaro.org
X-Google-Smtp-Source: AGHT+IEAjGhfbW9JuMO6m04ZkUoAxRx+m1AU80S5CiFQllMKEpwpCWYjBP/TQVXjB+RGvGgLPaUq
X-Received: by 2002:a05:620a:424d:b0:7d3:f0b0:39b2 with SMTP id af79cd13be357-7d443944ff4mr413706285a.22.1751018246457;
        Fri, 27 Jun 2025 02:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018246; cv=none;
        d=google.com; s=arc-20240605;
        b=ORAlxBwnlGcsKl2SZipXEi10bZ52OYhy0pyG58v6zi4PlZh0+zESG5y1aEf3l8v2Ns
         SuALvsvd9XjgnDF1IGgXco/Kcm1axIfAHd58g7nGgDBWEjkvRGMYkh/SxM6B4O9il6Tw
         b0Jaa+dykmG+ZpstrZTgHgq58G6R0el+FMEXn+H4IRtRHeG7K3nYvJhoKUnHGHGRpTJe
         xAQYCg96IR4vfMy+ErNP2KQKCTqAuYJ+qlGbWjklpZEZ2K/yEKtV+06usHTmzHxYw69x
         ofTdnsQBRbQLSdh/6qbJuTGxnQGLuL6Rw6jQy7u+wn7lxDRAaZR599ifv65lmYxJISkC
         KtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bQXuqYC8+A0PxLD/IROVfX+LNO5m3NH6okjQbeS/K14=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=VyZ3HZUrp1mHIb6xpzj1q0kilKugL+Ie9yk3YW0e07EuSEYEggYfjMpByddPPanbnc
         wLeeDtXysI5N8WBLLN9s1DjgHonmgcoWiwd6xkp7A+IXeJcE6agQL/RKPM6r3VmKj1D+
         FMTnqedKV765G2aFIJDaD+zshvHjqrPcZOMS2/INrF3HzI7ai/YQReKwnWZmePi4/hPA
         dAbKUVwvC8FjKa9kzTbUBsmBwjc1Oc8IhGepsOPKE6HEXGnTXpCC1s211eevlxQzFTty
         zKbbnLf+RrVrRWYCgiI2s83O+XweDKJpev3dbbENDj45j3UHa9ztzKJDObBToZmd2q1g
         3T/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KupTEZLT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44324ea36si185901285a.352.2025.06.27.02.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KupTEZLT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQXuqYC8+A0PxLD/IROVfX+LNO5m3NH6okjQbeS/K14=;
	b=KupTEZLTR6OLEAE5UMue5yaekSqFaQ5OObwB69YmPQMuJ5HC3lruKUmm65bBfkCaqB5vyl
	hdVqwtk+cSeV+ghBhKcywlLby9xHfbeCBQJXosezVgY6KSR7eHFcWr5Efh9xDctiuc4uZR
	A4nkWqcSuNZDD1Ab9mBobsF63mYkqQ4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-Tapo-VVoMF25bIWQKfMAxQ-1; Fri,
 27 Jun 2025 05:57:20 -0400
X-MC-Unique: Tapo-VVoMF25bIWQKfMAxQ-1
X-Mimecast-MFC-AGG-ID: Tapo-VVoMF25bIWQKfMAxQ_1751018239
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D5491801207;
	Fri, 27 Jun 2025 09:57:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BBD1B19560A7;
	Fri, 27 Jun 2025 09:57:14 +0000 (UTC)
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
Subject: [PATCH v4 10/32] tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change
Date: Fri, 27 Jun 2025 11:54:59 +0200
Message-ID: <20250627095620.3300028-11-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 5ZkIr0u4TH+U

Update the reference DSDT blobs after GPEX _OSC change. The _OSC change
affects the aarch64 'virt' and the x86 'microvm' machines.

DSDT diff is the same for all the machines/tests:

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
v3 -> v4
- fix the commit msg: dsl reverse diff (Jonathan)
---
 tests/qtest/bios-tables-test-allowed-diff.h   |   7 -------
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5158 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5244 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6519 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7603 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5360 bytes
 tests/data/acpi/riscv64/virt/DSDT             | Bin 3576 -> 3538 bytes
 tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
 8 files changed, 7 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 333e5acf63..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,8 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/DSDT",
-"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
-"tests/data/acpi/aarch64/virt/DSDT.memhp",
-"tests/data/acpi/aarch64/virt/DSDT.pxb",
-"tests/data/acpi/aarch64/virt/DSDT.topology",
-"tests/data/acpi/x86/microvm/DSDT.pcie",
-"tests/data/acpi/riscv64/virt/DSDT",
diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..acab6e65febbc210158d4c39be0680bbb90250f5 100644
GIT binary patch
delta 114
zcmX@3u}p)@CD<iIO@x7g>C8kfX{JVpjp}Y(OkR^V=X2?C2#NTx$NL96vvg%MIJ<-!
zF7RWWyjw`i#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;W@BMV
FMgSUfAKd@|

delta 152
zcmZ3caYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SSgm<T!#u0|FR0oI`?q7)0DS
z<Nbr3S-P?roL#~V7kIEwUN5BOX9QAG;Or7^3{q7MBDmy1<N|?7lQS7>L29`;z&gYx
bO@^t12n&FO3qXoN;!Cm@@@?i7mSh9~5Tq&5

diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..54c27e7d95b4956ed1b5dee0d299ccb08dc2a73e 100644
GIT binary patch
delta 114
zcmZ3a`A37xCD<jTMudTZsdFNiG*i3lM)f&dOkR^VALY{H5EAiWkM|FDX6ediaCQkd
zT;Rt#Sx{KZ#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;=1yTr
FMgUJNAb|h?

delta 152
zcmeyPu}G84CD<iokq83=(~XH-(oDVX8`bA<F*!`#e3VO%LyjXjG$4S1!#O0#he5=R
zGu}VgnWZb6!PzC;aDfN=WL9A<KO>Nm0%w<SW00z95Wyu6A{Piunw-g43sTF)0oEZl
bX);V5L|6bMTmVuG5?_+NkZ*Icup}b@<J&8B

diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..4330bc97cba0950191c45ac833533db7a190db81 100644
GIT binary patch
delta 114
zcmbPh{N0GlCD<jTT#|u->Fq==X{M&B8`a&on7k%!&gatO5EAiWkM|FDX6ediaCQkd
zT;Rt#dAE?3iE%=80+)Qk0)a`BGZ||^GF%*BdErTuon69>6Ch#&AhCi3kjO%w&Bnr6
FYyg6XAvXX3

delta 152
zcmexvG}oBRCD<iot|S8klg&gfX{L_p8`a&om>i~V&gatOkmCpr4G3W1a1IIbVGwcS
zjQ0<AX6ediaCQkdT;RbzdA*R9pAkq&fwN1vF-TQ4h~Sb3kqZPSP0nPj1*zrY0P7H&
bG#RE2A}jzBE&wS8i7&}s$hVnSIExJcpiV0*

diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..7fdbc03e2bf9fb7d35704779253de36e362f0bf9 100644
GIT binary patch
delta 207
zcmexwz1f<}CD<iovn&Gx)9r~|(oB6fHmbXEG5NM`&ga^|E+pc^9`7IQ%+i(3;Or7^
zxWJEfa-NKqiE%=80+)Qk0)a`BGZ||^GF%*BdErTuon69>6Ch#&AhCi3kjO%w$<JhL
aH-8e+V`TE0v{^|+kAs?qZ+<2t$p`>t?mg51

delta 282
zcmdmN{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=W}gfm*WTy4G3W1a1IIbVGwcS
zjQ0<AX6ediaCQkdT;Rbz*-%K!&j_TXz}Y3-7^JEiL~zN2$OQtECTB9%g4A+xfOUvX
unhaA15f%Um7l0Il#Fu0*<lEdYl+DQGFm>}EVLcA|TR*v9$aeB|nL7Yd7E^Zs

diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
index 029d03eecc4efddc001e5377e85ac8e831294362..969b4f6560d3ae39f5b7e0064b7122905476fce8 100644
GIT binary patch
delta 114
zcmbQH^+A)%CD<k8g9rly)24}B(oEex8`TB4nY<=#w&d315EAiWkM|FDX6ediaCQkd
zT;Rt#xm8%p#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;=D)&{
Fi~vUbAmso6

delta 152
zcmeyMIZcbpCD<iIOq79viGL!OG*hGhMs)#hCWon;ExGkL<T!#u0|FR0oI`?q7)0DS
z<Nbr3S-P?roL#~V7kIEwt`yetGXg0oaCQkd2C1qB5nS>ha)H34$(f9`Ahlc^U>#zU
bCd1T0gatst1t7&B@g>;{`8Hn{mSh9~yBaCk

diff --git a/tests/data/acpi/riscv64/virt/DSDT b/tests/data/acpi/riscv64/virt/DSDT
index 6a33f5647ddd6de3a0f000f718b58f6fff44f0fd..527f239dab13a00ad42e5a70b8dc2b89f12aa84a 100644
GIT binary patch
delta 113
zcmew%eMy?jCD<k85-$S-lgdOcX(r!W8`WD`nA|39UdN)vAtd6%9`7IQ%+i(3;Or7^
zxWJEf@;4qW6XS&H1TMLR1p<>MXEN4;WVkrM^1_oQJG+D%CqTpmKw<?6Ad!VUlk<4H
E0ByV>p#T5?

delta 151
zcmca4{X?3|CD<k82QLEyQ_(~&X(s2p8`WD`n0%&eUdN)vA;%FM8W6z1;T#g=!yw|u
z8SfwL%+i(3;Or7^xWI#b@+%%KKO>Nm0%w<SW00z95Wyu6A{Piunw-g43sTF)0oEZl
aX);V5L|6bMTmVuG5?_+NkZ-aFZx;X$O)QlF

diff --git a/tests/data/acpi/x86/microvm/DSDT.pcie b/tests/data/acpi/x86/microvm/DSDT.pcie
index 8eacd21d6ecdf9a3cd3e4f03cf1b40748dcbf53e..ba258f454dc0e59ef2fd67e0ce37e270e7c122e8 100644
GIT binary patch
delta 113
zcmX>vzEYgaCD<ioB{u^D)Axy7(oD|VH>#&HG5Ji`+{YxqAtd6%9`7IQ%+i(3;Or7^
zxWJEf@*XZN6XS&H1TMLR1p<>MXEN4;WVkrM^1_oQJG+D%CqTpmKw<?6Ad!VUlTEm1
F0{}^9AprmY

delta 151
zcmZ1}eqNl*CD<k8JU0Ualj}q-X(rE|8`V>pn4BhW?qd?*kmCpr4G3W1a1IIbVGwcS
zjQ0<AX6ediaCQkdT;Rbzc>|Z0pAkq&fwN1vF-TQ4h~Sb3kqZPSP0nPj1*zrY0P7H&
aG#RE2A}jzBE&wS8i7&}s$Tyjfdo}=5#47aw

-- 
2.49.0
