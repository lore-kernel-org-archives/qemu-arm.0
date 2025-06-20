Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp747443njc;
        Fri, 20 Jun 2025 01:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFnH7mFd0meNszwI5mHnnTFK4ACf/0+lhXNiI0l19Gy/hr6Lt3h6M+s8rR57m7fvE0xAjjPLPkuA5UDg==@linaro.org
X-Google-Smtp-Source: AGHT+IHK97N0sz7fqpHGNa/sSu2muVvKpwGmlUMKHSoIpWzPmRssri9TFaAnNSyN3vzXQw31RKS7
X-Received: by 2002:a05:6000:2d05:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a6d1317833mr1288330f8f.35.1750409976019;
        Fri, 20 Jun 2025 01:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409976; cv=none;
        d=google.com; s=arc-20240605;
        b=LTqBhObuU4+4dFYMzmfTfFMfIwdRQ0AjmXNDpcv/VB6cO3O++qFbrlDAfrSGsZUArF
         HCjKFfK821yDUej7TQ6KsYsQy5H6nmGCxhMdegYXuIKGlvOj2o6RW7F3PCS+M8hCt4kl
         S00fljxyplOUtFf39fyqQ/ocJazHZlckcssJk6avdBfxBJXWapublMBZFfq1v+OT9HYP
         1iAbbmrWst5KltvCvfr9N1PeHm7Gxuf2biJ35GY4cxSSkt0I+EEAtZKqdMH7FamQr/oZ
         29xj3Dwn1hKOnOD3gNouFRCL1TiyY390biBikSF+j0GGAgBSutzzwQE2REdyir5nn71e
         jmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=8T0HIjvCw2zCVapCAnV1dET6Zrk07OtCFXBXvWD4Z5o=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=Ueew37dAHkIvJt2AGg2Geebxi2i1eqF+ioCu9RFsCzESvKXfYAK+f1QddsyDNQ205g
         gzK4QeI/Y/OoZHgZVLf69uqOZcJa8kx5zXZ94FeyeWTNPeUOWK9H24z+9Zyxo2baJrZZ
         /DlBHm+S9epX/TF6NCAamlonClNBvzQSTAbFj/rTz2Qb6xo7A4InDVaGAt2PZDwSQQ5q
         2JBLV/J3XqbVNQyix31WNgeyy0/Bn6JfOayM24d1YFwfrZaVYQPfVuf3/r3eFp57IC4H
         DuT8O6u5L0TWas7DdVZV6urm7vzy9hYJhqDJgLltsNL5QzMrOqUV0R1yDekYM3tdEp1L
         GPgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d117ea8bsi966134f8f.329.2025.06.20.01.59.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrxY2nHfz6M60G;
	Fri, 20 Jun 2025 16:58:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 41A9E14033C;
	Fri, 20 Jun 2025 16:59:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:59:34 +0200
Date: Fri, 20 Jun 2025 09:59:33 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 10/29] tests/qtest/bios-tables-test: Update DSDT
 blobs after GPEX _OSC change
Message-ID: <20250620095933.00006eae@huawei.com>
In-Reply-To: <20250616094903.885753-11-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-11-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: nsTs/S89mAJa

On Mon, 16 Jun 2025 11:46:39 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Update the reference DSDT blobs after GPEX _OSC change. The _OSC change
> affects the aarch64 'virt' and the x86 'microvm' machines.
> 
> DSDT diff is the same for all the machines/tests:

Is this diff backwards?  It's the opposite of the one in patch 9.



> @@ -1798,6 +1798,8 @@
>                      0x0000008000000000, // Length
>                      ,, , AddressRangeMemory, TypeStatic)
>              })
> +            Name (SUPP, Zero)
> +            Name (CTRL, Zero)
>              Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>              {
>                  CreateDWordField (Arg3, Zero, CDW1)
> @@ -1805,26 +1807,27 @@
>                  {
>                      CreateDWordField (Arg3, 0x04, CDW2)
>                      CreateDWordField (Arg3, 0x08, CDW3)
> -                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> -                    Local0 &= 0x1F
> +                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
> +                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> +                    CTRL &= 0x1F
>                      If ((Arg1 != One))
>                      {
>                          CDW1 |= 0x08
>                      }
> 
> -                    If ((CDW3 != Local0))
> +                    If ((CDW3 != CTRL))
>                      {
>                          CDW1 |= 0x10
>                      }
> 
> -                    CDW3 = Local0
> +                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
> +                    Return (Arg3)
>                  }
>                  Else
>                  {
>                      CDW1 |= 0x04
> +                    Return (Arg3)
>                  }
> -
> -                Return (Arg3)
>              }
> 
>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h   |   6 ------
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5158 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5244 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6519 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7603 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5360 bytes
>  tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
>  7 files changed, 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 75f057767e..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,7 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/aarch64/virt/DSDT",
> -"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> -"tests/data/acpi/aarch64/virt/DSDT.memhp",
> -"tests/data/acpi/aarch64/virt/DSDT.pxb",
> -"tests/data/acpi/aarch64/virt/DSDT.topology",
> -"tests/data/acpi/x86/microvm/DSDT.pcie",
> diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
> index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..acab6e65febbc210158d4c39be0680bbb90250f5 100644
> GIT binary patch
> delta 114
> zcmX@3u}p)@CD<iIO@x7g>C8kfX{JVpjp}Y(OkR^V=X2?C2#NTx$NL96vvg%MIJ<-!
> zF7RWWyjw`i#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;W@BMV  
> FMgSUfAKd@|
> 
> delta 152
> zcmZ3caYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SSgm<T!#u0|FR0oI`?q7)0DS
> z<Nbr3S-P?roL#~V7kIEwUN5BOX9QAG;Or7^3{q7MBDmy1<N|?7lQS7>L29`;z&gYx
> bO@^t12n&FO3qXoN;!Cm@@@?i7mSh9~5Tq&5
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..54c27e7d95b4956ed1b5dee0d299ccb08dc2a73e 100644
> GIT binary patch
> delta 114
> zcmZ3a`A37xCD<jTMudTZsdFNiG*i3lM)f&dOkR^VALY{H5EAiWkM|FDX6ediaCQkd
> zT;Rt#Sx{KZ#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;=1yTr  
> FMgUJNAb|h?
> 
> delta 152
> zcmeyPu}G84CD<iokq83=(~XH-(oDVX8`bA<F*!`#e3VO%LyjXjG$4S1!#O0#he5=R
> zGu}VgnWZb6!PzC;aDfN=WL9A<KO>Nm0%w<SW00z95Wyu6A{Piunw-g43sTF)0oEZl
> bX);V5L|6bMTmVuG5?_+NkZ*Icup}b@<J&8B
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..4330bc97cba0950191c45ac833533db7a190db81 100644
> GIT binary patch
> delta 114
> zcmbPh{N0GlCD<jTT#|u->Fq==X{M&B8`a&on7k%!&gatO5EAiWkM|FDX6ediaCQkd
> zT;Rt#dAE?3iE%=80+)Qk0)a`BGZ||^GF%*BdErTuon69>6Ch#&AhCi3kjO%w&Bnr6  
> FYyg6XAvXX3
> 
> delta 152
> zcmexvG}oBRCD<iot|S8klg&gfX{L_p8`a&om>i~V&gatOkmCpr4G3W1a1IIbVGwcS
> zjQ0<AX6ediaCQkdT;RbzdA*R9pAkq&fwN1vF-TQ4h~Sb3kqZPSP0nPj1*zrY0P7H&
> bG#RE2A}jzBE&wS8i7&}s$hVnSIExJcpiV0*
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..7fdbc03e2bf9fb7d35704779253de36e362f0bf9 100644
> GIT binary patch
> delta 207
> zcmexwz1f<}CD<iovn&Gx)9r~|(oB6fHmbXEG5NM`&ga^|E+pc^9`7IQ%+i(3;Or7^
> zxWJEfa-NKqiE%=80+)Qk0)a`BGZ||^GF%*BdErTuon69>6Ch#&AhCi3kjO%w$<JhL
> aH-8e+V`TE0v{^|+kAs?qZ+<2t$p`>t?mg51
> 
> delta 282
> zcmdmN{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=W}gfm*WTy4G3W1a1IIbVGwcS
> zjQ0<AX6ediaCQkdT;Rbz*-%K!&j_TXz}Y3-7^JEiL~zN2$OQtECTB9%g4A+xfOUvX
> unhaA15f%Um7l0Il#Fu0*<lEdYl+DQGFm>}EVLcA|TR*v9$aeB|nL7Yd7E^Zs
> 
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> index 029d03eecc4efddc001e5377e85ac8e831294362..969b4f6560d3ae39f5b7e0064b7122905476fce8 100644
> GIT binary patch
> delta 114
> zcmbQH^+A)%CD<k8g9rly)24}B(oEex8`TB4nY<=#w&d315EAiWkM|FDX6ediaCQkd
> zT;Rt#xm8%p#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;=D)&{  
> Fi~vUbAmso6
> 
> delta 152
> zcmeyMIZcbpCD<iIOq79viGL!OG*hGhMs)#hCWon;ExGkL<T!#u0|FR0oI`?q7)0DS
> z<Nbr3S-P?roL#~V7kIEwt`yetGXg0oaCQkd2C1qB5nS>ha)H34$(f9`Ahlc^U>#zU
> bCd1T0gatst1t7&B@g>;{`8Hn{mSh9~yBaCk  
> 
> diff --git a/tests/data/acpi/x86/microvm/DSDT.pcie b/tests/data/acpi/x86/microvm/DSDT.pcie
> index 8eacd21d6ecdf9a3cd3e4f03cf1b40748dcbf53e..ba258f454dc0e59ef2fd67e0ce37e270e7c122e8 100644
> GIT binary patch
> delta 113
> zcmX>vzEYgaCD<ioB{u^D)Axy7(oD|VH>#&HG5Ji`+{YxqAtd6%9`7IQ%+i(3;Or7^  
> zxWJEf@*XZN6XS&H1TMLR1p<>MXEN4;WVkrM^1_oQJG+D%CqTpmKw<?6Ad!VUlTEm1
> F0{}^9AprmY
> 
> delta 151
> zcmZ1}eqNl*CD<k8JU0Ualj}q-X(rE|8`V>pn4BhW?qd?*kmCpr4G3W1a1IIbVGwcS
> zjQ0<AX6ediaCQkdT;Rbzc>|Z0pAkq&fwN1vF-TQ4h~Sb3kqZPSP0nPj1*zrY0P7H&
> aG#RE2A}jzBE&wS8i7&}s$Tyjfdo}=5#47aw
> 
