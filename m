Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741046njc;
        Mon, 16 Jun 2025 02:50:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLlVYYOlBWiHsWjH14GBWncdus0tw/ClrtHxCIUdgY6LQAgvM1Nd2mn8g71KZKUUkD2DocHnvtwhqBYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFt5CUBkYSfxnF8YTQLGox46sk+OMa1qLeagnZyHDAtynNEgvrxIYkjrzOF1lf0t4tLHMty
X-Received: by 2002:a05:622a:3cb:b0:494:7076:3422 with SMTP id d75a77b69052e-4a739136489mr178746701cf.21.1750067412205;
        Mon, 16 Jun 2025 02:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067412; cv=none;
        d=google.com; s=arc-20240605;
        b=WlHZJLQEXIq/RYfCI3xYwVgE9ss7wtt2PfFR6DUR5THVIT0FX3DlFDCMlBsfSVa21R
         UMSdPDpvUqzENGnI6/CjWKQKUJrjVVmqGOh82v6Ssa6nqGO/H9keko+/8XzouPMUwAhu
         kJ0Rg3TK52CKP7lJxMOQnpblJIgyTbPYdYFYZziXaMAlBEbF2EeWTBG7oWWIes2RBm8v
         r7dinKSPlgOkFKDN41GzRdS43reGxqzs3mdKraBjmsPVGc8wYAzm3fFt9tzqZXozQ4kw
         2pdTl4Xqju8aTARGQiGxqV2WAFvCPHVacxkmfGYSs3f79nrpHpWGuAfY93OQLBdrCKOY
         vZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yHfZ9ofMdgRilPHZZl02/jVopyJ56c9/oI7r/tTJRfg=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=ZWGun3se7OuiFHxg09pi7BEg5b5ph2Lyr52leexeazaxBB8xLiiTePYKCFLkWbV5Yo
         MEqeXrYmtVAAFnbwgCqdFUqimd20zd2GptRKsM0Se/8b1/aT7oHIFgpGnGjKG9+e4zKn
         lDd62/Y33+i/Xzlzk+LkbFZUPO2UJywkRPBSUXLuSKDYXszzh3B/ewiJzEXD5cDwXK6N
         5Gn5PX/pU9Lx5E7jC22+CDHGN2jSm//fmgMwq8vQr5fuRIbcXBvs9xMtm93+IVVv3zhy
         puHJayIXcxXPLM8NpWfva0R5qdOUMRu5mtdmAomYkPwDPofj3XDMXbLSeLktnMottG6A
         kxfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TkkxPZX6;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a552a76si97195671cf.654.2025.06.16.02.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TkkxPZX6;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHfZ9ofMdgRilPHZZl02/jVopyJ56c9/oI7r/tTJRfg=;
	b=TkkxPZX69UPUP1gVcL22PwL95Xihx2swq1IROphnpu69sQuDiRr/nGQbFVx+qkJutiIF24
	15VGifeddm32O8pnL8VWjx5YvAnrQYtP5fLngLiOVZBwyQlOkGsY0v/i2WaCy+iKZ5eQqF
	8+DzAWhzXkI0dGyiS9NU/SA2W5j5vOo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-IQE7p7V5OtC3bMC8agepKw-1; Mon,
 16 Jun 2025 05:50:10 -0400
X-MC-Unique: IQE7p7V5OtC3bMC8agepKw-1
X-Mimecast-MFC-AGG-ID: IQE7p7V5OtC3bMC8agepKw_1750067408
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C9B58195608F;
	Mon, 16 Jun 2025 09:50:08 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 001B019560A3;
	Mon, 16 Jun 2025 09:50:03 +0000 (UTC)
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
Subject: [PATCH v3 10/29] tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change
Date: Mon, 16 Jun 2025 11:46:39 +0200
Message-ID: <20250616094903.885753-11-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: cF16c8Y50l0K

Update the reference DSDT blobs after GPEX _OSC change. The _OSC change
affects the aarch64 'virt' and the x86 'microvm' machines.

DSDT diff is the same for all the machines/tests:
@@ -1798,6 +1798,8 @@
                     0x0000008000000000, // Length
                     ,, , AddressRangeMemory, TypeStatic)
             })
+            Name (SUPP, Zero)
+            Name (CTRL, Zero)
             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
             {
                 CreateDWordField (Arg3, Zero, CDW1)
@@ -1805,26 +1807,27 @@
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
-                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    Local0 &= 0x1F
+                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
+                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
+                    CTRL &= 0x1F
                     If ((Arg1 != One))
                     {
                         CDW1 |= 0x08
                     }

-                    If ((CDW3 != Local0))
+                    If ((CDW3 != CTRL))
                     {
                         CDW1 |= 0x10
                     }

-                    CDW3 = Local0
+                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
+                    Return (Arg3)
                 }
                 Else
                 {
                     CDW1 |= 0x04
+                    Return (Arg3)
                 }
-
-                Return (Arg3)
             }

             Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |   6 ------
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5158 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5244 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6519 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7603 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5360 bytes
 tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
 7 files changed, 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 75f057767e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,7 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/DSDT",
-"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
-"tests/data/acpi/aarch64/virt/DSDT.memhp",
-"tests/data/acpi/aarch64/virt/DSDT.pxb",
-"tests/data/acpi/aarch64/virt/DSDT.topology",
-"tests/data/acpi/x86/microvm/DSDT.pcie",
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
