Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp821642njc;
        Fri, 20 Jun 2025 04:33:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBepF4Cs7c6xoFmCZaqn3uzLTKezsp6+Oa3dfZEjcueV+JhCxJfIcjwX/sWUc77TSrTrnuiOr0clkM0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHktHff1sk+7bCajskPGYnki7bscPmYKU1T350nZrKb1WnrOt7VIC8XziO6PBF0vvVsihTh
X-Received: by 2002:a05:622a:15c9:b0:4a4:3963:1e04 with SMTP id d75a77b69052e-4a77a20ee47mr37359121cf.22.1750419229724;
        Fri, 20 Jun 2025 04:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750419229; cv=none;
        d=google.com; s=arc-20240605;
        b=Lt1amFCUtoChEWUW+DyEkgovM9I4zykQ6sDzRiSoKjmGX2Ti39iX+fl7bwX/XJG1Ud
         pUwGf4mItulHi2O0i4/foiqP0bzt5zsDe6tnGmp8Z66cpm4roqyq3eC25pKSKYFdzSis
         XXcrnKADglE+l3KCqu9FllaHfFuihJ7XP/XmhkG01yMq44WnkWbfNtKEBx7wzg/KKaYk
         VmBOalsJN1jCfKGCDdIK1CZy9V05e3yCWRlIta/0HBiB3AUkb2KCzQByzjLSeKN5GT0m
         WACkmvetA+raFmR4J3pUfIwuJ3LDtqmga5Op8pCzxbFzCclzOysSk/F1YVT9tc9uGszf
         0VmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=S4EM4PgoTHmx01ljO5geUpXFgDqfHPO1/nf+GfUWqjQ=;
        fh=zhLX5Gbh+1TZu9t3i8RgtXvsLAZL7+eF6bOF/Pb61ZQ=;
        b=FG6zHVwZJaxyoSU4SRfz3FrSaM1kAfZNJdk/vTPVEJGlu5dWgXw51q4al0BKXR+8KZ
         yho7Qtz03oMUFoAjlqJj6TDz8H5qaokJycVDsVytcmzKwr4YmLScJ6kfDoYetSt3nxUZ
         ojfgnpj35nnDh1TV/YnPar2diZhsqtCnDeoGCQy9aUrqGO8fNbu+oilYX0ub2bgvu26J
         aYADfwmXZcWMkgUGMsJmkEi45hS7zST33yPDoAwoqOtRSNtJZF/dOt68kykb19zzLp2I
         KPo9UbaO8eZfgDYx/QXCdmXV5fhdoBecCFEXS8kaZdTZltqNSpHMPcM6PhEn/Y8HV987
         Lt5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V5EHSkdh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d52bcsi16406461cf.489.2025.06.20.04.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V5EHSkdh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750419229;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4EM4PgoTHmx01ljO5geUpXFgDqfHPO1/nf+GfUWqjQ=;
	b=V5EHSkdhZW8KnQ49izUlVKNwavcDzD71WDUfhvVNkN1QVIYAppwdtPoe4GUhmUAq5T/quy
	9KTErcdcyYNWUJHYpdvgmim5CfLP2qELWNbiQzL1GpiDLZdc5N3BqoBOgTYtI9X5ZB3Dsn
	hI2xlEsaVSP79rJiUrXmTDgZaDQsaCE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-p9LJHzabOBeBpG788DtDoA-1; Fri, 20 Jun 2025 07:33:48 -0400
X-MC-Unique: p9LJHzabOBeBpG788DtDoA-1
X-Mimecast-MFC-AGG-ID: p9LJHzabOBeBpG788DtDoA_1750419227
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450eaae2934so14190415e9.2
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 04:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750419224; x=1751024024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4EM4PgoTHmx01ljO5geUpXFgDqfHPO1/nf+GfUWqjQ=;
        b=xQPq4rMwPu0Xbu+Fyya6pH4SN+4cYGGQX7DiVxLtf0uYGEVjgbQNJTqKpJPasMNG5e
         uquqULtKvyRCwFWIQvSQRumF4DEghIcwys3/odrlH86PSm2Qh8GFdwO8lDgtzAuHxhYK
         B2AAfI0E9tUf9AdOK34MHvF0WktVSiqIFFHayOAZBFuqjzddEHtGYhE9m6MO/LBrFfj0
         Nsd1ReBPaY+rVzuTxOCKri25ZiLPdASGAwfzF8IQMbmH8GOgRnw604Nod7SELPFwm/Wn
         l+IHTgPTnC+5GSKmnMxgzhSvpnY3BSU6GoqAh8mdaftuWyOcFCW4zZ4CDhX44rlR+eoZ
         vGRA==
X-Forwarded-Encrypted: i=1; AJvYcCVCgrcTSaJWJmQBjDLxIgWxi5loGS/nAJnBU38g6p4CqtkfRfH+qCzHWCasNogpSwkCOwSB08l85eqiUQ==@linaro.org
X-Gm-Message-State: AOJu0YyRJafVrV2t8jOrlKoi4tZwBR5wdxtpjfdAWoPAOswKkzZVhNli
	WKGtCsyZTSv+vVUa92gXf8qGtg9IBr0qhfpzIShzGt20CLWs+fZTmcto7fZgWbtNWLY7hcTRNxF
	7NI8NZAA3/SS3E8mEq63JVrNJKXyY1RsCN3NMi19pbIsEhOitaP1UXBlbMg==
X-Gm-Gg: ASbGncuVrtytpNjfZ65yC/T2EjWbWq/QboWV5oI3qWhjRtCimZt5l8cKh045J7cuMb0
	9GwUZOTA+nOsFNKw+rWbroG8FS4uXd4IfScx6U14PuDwD8uwWYrjC8Tz5OdjWPDxduQ6V+V+GLR
	8Z69ak/sTOmlkVIsRt4i1cfFyeT2scfNoHMZgLQWBVDrFvWwk9LYLABnZ1D+WTTQa0RGw+ouOuV
	9VG2k6Qs2pqRbrnvzgvkZQVTKQCrx1QsqyvVyfw7SOlSf84kjZkACHeXIgscq4ZBAT9qGDnCDZk
	t9Y4h34taSwosmVOgONISYRwW67NInZcXlgLhjI9RBKuHYl6tMkdhWZ/YmlCXcL4coZB3w==
X-Received: by 2002:a05:600c:1f94:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45365a05192mr23351555e9.30.1750419224146;
        Fri, 20 Jun 2025 04:33:44 -0700 (PDT)
X-Received: by 2002:a05:600c:1f94:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45365a05192mr23351275e9.30.1750419223688;
        Fri, 20 Jun 2025 04:33:43 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470371csm22300085e9.30.2025.06.20.04.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:33:42 -0700 (PDT)
Message-ID: <36766b91-b09e-43e3-922f-396da9e395ed@redhat.com>
Date: Fri, 20 Jun 2025 13:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 10/29] tests/qtest/bios-tables-test: Update DSDT blobs
 after GPEX _OSC change
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-11-eric.auger@redhat.com>
 <20250620095933.00006eae@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620095933.00006eae@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qh1vC0mUB17M9RV1pBndBFUm6V_JLTJ9bMHXsAincHo_1750419227
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: wv0c2McUL7PY

Hi Jonathan,

On 6/20/25 10:59 AM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 11:46:39 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Update the reference DSDT blobs after GPEX _OSC change. The _OSC change
>> affects the aarch64 'virt' and the x86 'microvm' machines.
>>
>> DSDT diff is the same for all the machines/tests:
> Is this diff backwards?  It's the opposite of the one in patch 9.

argh. Most probably. I must have messed with the diff :-(

Eric
>
>
>
>> @@ -1798,6 +1798,8 @@
>>                      0x0000008000000000, // Length
>>                      ,, , AddressRangeMemory, TypeStatic)
>>              })
>> +            Name (SUPP, Zero)
>> +            Name (CTRL, Zero)
>>              Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>>              {
>>                  CreateDWordField (Arg3, Zero, CDW1)
>> @@ -1805,26 +1807,27 @@
>>                  {
>>                      CreateDWordField (Arg3, 0x04, CDW2)
>>                      CreateDWordField (Arg3, 0x08, CDW3)
>> -                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> -                    Local0 &= 0x1F
>> +                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
>> +                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> +                    CTRL &= 0x1F
>>                      If ((Arg1 != One))
>>                      {
>>                          CDW1 |= 0x08
>>                      }
>>
>> -                    If ((CDW3 != Local0))
>> +                    If ((CDW3 != CTRL))
>>                      {
>>                          CDW1 |= 0x10
>>                      }
>>
>> -                    CDW3 = Local0
>> +                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
>> +                    Return (Arg3)
>>                  }
>>                  Else
>>                  {
>>                      CDW1 |= 0x04
>> +                    Return (Arg3)
>>                  }
>> -
>> -                Return (Arg3)
>>              }
>>
>>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>  tests/qtest/bios-tables-test-allowed-diff.h   |   6 ------
>>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5158 bytes
>>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5244 bytes
>>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6519 bytes
>>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7603 bytes
>>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5360 bytes
>>  tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
>>  7 files changed, 6 deletions(-)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index 75f057767e..dfb8523c8b 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,7 +1 @@
>>  /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/aarch64/virt/DSDT",
>> -"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>> -"tests/data/acpi/aarch64/virt/DSDT.memhp",
>> -"tests/data/acpi/aarch64/virt/DSDT.pxb",
>> -"tests/data/acpi/aarch64/virt/DSDT.topology",
>> -"tests/data/acpi/x86/microvm/DSDT.pcie",
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
>> index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..acab6e65febbc210158d4c39be0680bbb90250f5 100644
>> GIT binary patch
>> delta 114
>> zcmX@3u}p)@CD<iIO@x7g>C8kfX{JVpjp}Y(OkR^V=X2?C2#NTx$NL96vvg%MIJ<-!
>> zF7RWWyjw`i#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;W@BMV  
>> FMgSUfAKd@|
>>
>> delta 152
>> zcmZ3caYlp7CD<jzM}&caNqQoeG*i3NMs+tXCWon;^SSgm<T!#u0|FR0oI`?q7)0DS
>> z<Nbr3S-P?roL#~V7kIEwUN5BOX9QAG;Or7^3{q7MBDmy1<N|?7lQS7>L29`;z&gYx
>> bO@^t12n&FO3qXoN;!Cm@@@?i7mSh9~5Tq&5
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
>> index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..54c27e7d95b4956ed1b5dee0d299ccb08dc2a73e 100644
>> GIT binary patch
>> delta 114
>> zcmZ3a`A37xCD<jTMudTZsdFNiG*i3lM)f&dOkR^VALY{H5EAiWkM|FDX6ediaCQkd
>> zT;Rt#Sx{KZ#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;=1yTr  
>> FMgUJNAb|h?
>>
>> delta 152
>> zcmeyPu}G84CD<iokq83=(~XH-(oDVX8`bA<F*!`#e3VO%LyjXjG$4S1!#O0#he5=R
>> zGu}VgnWZb6!PzC;aDfN=WL9A<KO>Nm0%w<SW00z95Wyu6A{Piunw-g43sTF)0oEZl
>> bX);V5L|6bMTmVuG5?_+NkZ*Icup}b@<J&8B
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
>> index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..4330bc97cba0950191c45ac833533db7a190db81 100644
>> GIT binary patch
>> delta 114
>> zcmbPh{N0GlCD<jTT#|u->Fq==X{M&B8`a&on7k%!&gatO5EAiWkM|FDX6ediaCQkd
>> zT;Rt#dAE?3iE%=80+)Qk0)a`BGZ||^GF%*BdErTuon69>6Ch#&AhCi3kjO%w&Bnr6  
>> FYyg6XAvXX3
>>
>> delta 152
>> zcmexvG}oBRCD<iot|S8klg&gfX{L_p8`a&om>i~V&gatOkmCpr4G3W1a1IIbVGwcS
>> zjQ0<AX6ediaCQkdT;RbzdA*R9pAkq&fwN1vF-TQ4h~Sb3kqZPSP0nPj1*zrY0P7H&
>> bG#RE2A}jzBE&wS8i7&}s$hVnSIExJcpiV0*
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
>> index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..7fdbc03e2bf9fb7d35704779253de36e362f0bf9 100644
>> GIT binary patch
>> delta 207
>> zcmexwz1f<}CD<iovn&Gx)9r~|(oB6fHmbXEG5NM`&ga^|E+pc^9`7IQ%+i(3;Or7^
>> zxWJEfa-NKqiE%=80+)Qk0)a`BGZ||^GF%*BdErTuon69>6Ch#&AhCi3kjO%w$<JhL
>> aH-8e+V`TE0v{^|+kAs?qZ+<2t$p`>t?mg51
>>
>> delta 282
>> zcmdmN{ok6)CD<k8zbpd-Q^!OuX{N5b8`a&on4CK{=W}gfm*WTy4G3W1a1IIbVGwcS
>> zjQ0<AX6ediaCQkdT;Rbz*-%K!&j_TXz}Y3-7^JEiL~zN2$OQtECTB9%g4A+xfOUvX
>> unhaA15f%Um7l0Il#Fu0*<lEdYl+DQGFm>}EVLcA|TR*v9$aeB|nL7Yd7E^Zs
>>
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
>> index 029d03eecc4efddc001e5377e85ac8e831294362..969b4f6560d3ae39f5b7e0064b7122905476fce8 100644
>> GIT binary patch
>> delta 114
>> zcmbQH^+A)%CD<k8g9rly)24}B(oEex8`TB4nY<=#w&d315EAiWkM|FDX6ediaCQkd
>> zT;Rt#xm8%p#5kckflEGNfxx86nT)j{87>a6yzr#S&Mx7`2@o*>kXS(iNMs?;=D)&{  
>> Fi~vUbAmso6
>>
>> delta 152
>> zcmeyMIZcbpCD<iIOq79viGL!OG*hGhMs)#hCWon;ExGkL<T!#u0|FR0oI`?q7)0DS
>> z<Nbr3S-P?roL#~V7kIEwt`yetGXg0oaCQkd2C1qB5nS>ha)H34$(f9`Ahlc^U>#zU
>> bCd1T0gatst1t7&B@g>;{`8Hn{mSh9~yBaCk  
>>
>> diff --git a/tests/data/acpi/x86/microvm/DSDT.pcie b/tests/data/acpi/x86/microvm/DSDT.pcie
>> index 8eacd21d6ecdf9a3cd3e4f03cf1b40748dcbf53e..ba258f454dc0e59ef2fd67e0ce37e270e7c122e8 100644
>> GIT binary patch
>> delta 113
>> zcmX>vzEYgaCD<ioB{u^D)Axy7(oD|VH>#&HG5Ji`+{YxqAtd6%9`7IQ%+i(3;Or7^  
>> zxWJEf@*XZN6XS&H1TMLR1p<>MXEN4;WVkrM^1_oQJG+D%CqTpmKw<?6Ad!VUlTEm1
>> F0{}^9AprmY
>>
>> delta 151
>> zcmZ1}eqNl*CD<k8JU0Ualj}q-X(rE|8`V>pn4BhW?qd?*kmCpr4G3W1a1IIbVGwcS
>> zjQ0<AX6ediaCQkdT;Rbzc>|Z0pAkq&fwN1vF-TQ4h~Sb3kqZPSP0nPj1*zrY0P7H&
>> aG#RE2A}jzBE&wS8i7&}s$Tyjfdo}=5#47aw
>>
