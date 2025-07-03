Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp311813dyc;
        Wed, 2 Jul 2025 22:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAfezKSxNgdeLUb+eIR5I7nnopvWQEdc9TVH+EyjeBMhoH9tXrwnNya4CrCGx3QOpKh10BDSweTCjqhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG61NNfDY/VoAPt5U4UyBiJVWcMecrPwOt4H/RKKebaQMzsG9e46xdJjggXIlMLSbghm3uz
X-Received: by 2002:a05:620a:2712:b0:7d4:635f:3e3a with SMTP id af79cd13be357-7d5d13e0381mr319639385a.19.1751519535337;
        Wed, 02 Jul 2025 22:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751519535; cv=none;
        d=google.com; s=arc-20240605;
        b=e0J8wKnxGkWg0fZEN/gPLXzrhwXOMlyeI0uWe+svLsZiLOvGeaFrsAQwfcb5bWmJEe
         +/RjPvBN3iIw2bTxpLQkmxXcHlP6FJ0IcLZAm8i4qqUppd+pb8KeNy2gjtt3tY/j05iF
         I9QaE2cspYYiZvQF1noTlgaWza4NiRrTMaKsDMVyb88mteKJaMtMFhUs9cRt5MI+wcw6
         7C8kpwwSuSruinvTW+OnhV630xqRKANmM2/YnVNx1DajgPi5LucQzJAaHT2BuNUZ67ml
         RiFNmHBcT7aTG9kqbg9tCq3/BqCh267A09N1z30kTucoQEtJacHlQF9lUSgAWH2DxJFM
         nmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=e409tKlSOQls0qfKIfh9Uq3MEqXSt50BS9oiWdfTBA4=;
        fh=SzcnLup+XrgRB/Buxb8Au2Pb/W2LCJgT0rteLi80Cmk=;
        b=Q76vokd1EXHZ1QMoeq6h4hHPmAsJkfjF4lEnx5k/C93LmIZbV7EICmXdfX5LHYZsXi
         p4Bx9JO8ahUI5HG5yz0F/RMLMr5brvVWpJjen/USPlS7SZ0cl1ScYHGMRXp1stP7ZOmO
         8f9++Aqstnwz19xDbKWQHlypt2UPuUknHpShXidDzOLJq1Pu8qD1d0dA/SrkrhIPnIXw
         sxP6XXplyji16/A25qdpCFg/dE+vQx1TAPFdZ8jOnBMv1UC0Mpi8mpe8eT9M05yrFTGk
         1WWOHvNEeKSbuH06h1BkiSBn1o8fz4aoIFiPdjPYCBoC8VwJFxv6yh85DpE2a64AtnLH
         2fYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jCv8smGM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44ff55e41si1084404585a.313.2025.07.02.22.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 22:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jCv8smGM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751519534;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e409tKlSOQls0qfKIfh9Uq3MEqXSt50BS9oiWdfTBA4=;
	b=jCv8smGMyplaD7iJzi6FoHJFeHhrooU7Gtfy+fUE8EmatzjjMiWF2p/aqtL2xrotfUO3z4
	+NuwWWsRgsHHpQWQr520FTjy36QTf7n3G/SdwSnGdfzFt/DxO5+ZDnark1habfvoI3bLo3
	ZFrPe9fukmI0XKk08Sh0JwbTcfxFZbo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-4cvsYXO9O3iv8j9VWBqxTg-1; Thu, 03 Jul 2025 01:12:13 -0400
X-MC-Unique: 4cvsYXO9O3iv8j9VWBqxTg-1
X-Mimecast-MFC-AGG-ID: 4cvsYXO9O3iv8j9VWBqxTg_1751519532
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so4967367f8f.3
        for <alex.bennee@linaro.org>; Wed, 02 Jul 2025 22:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751519531; x=1752124331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e409tKlSOQls0qfKIfh9Uq3MEqXSt50BS9oiWdfTBA4=;
        b=jEMMTPveY4SPqpJQO8W2OmkzyZW/+GEEUqeSJymvJwixvJEehNOsXbA2WdMbkrADB/
         dEVMBWEBm5jtdNlzxzdYFPP++a94w9zU3KlteIlOkLSmUx2oS4SlSpVHP27NPaP849Dg
         UAsr2xz4uUNfWMEgPo3SuqlTNm0iJLBzAelvPUfa5IrmKGB7Dn/Ghxzy2g7sp6d+ODgJ
         OmKJD5RQ6xnWVr/OdVCUA79lxOnwrQriixcBZHcPdMf62pgggo9LPQycxd4pDqM9ZJhw
         t6AYONMkwz619bkaexP72CvEK5roMaCrKRvYu8FHxybZeKU7aUi7RtfV/WMm28Bc3T16
         Qyow==
X-Forwarded-Encrypted: i=1; AJvYcCWSluffjojmvt7Z1SSer4pnnCcKQDUE6Ye4TuXqDgd7vytSl/7YOphlOQ6JsycBLe/IdvaOmqpPqiOOaA==@linaro.org
X-Gm-Message-State: AOJu0YyVA1XG9M2dwpX+xE+s2coQad3/uzZetvm+s4jMoEncDID53oiH
	b6YHzzlFOgDhtjjUmqlL/U6nWf46NqvJA2psQJX3IL90NaHOPzGvxsAZz5zuv8YFXWFJeZv8gcR
	MA5fHk7SRr11cd+WEVhqbRl4pFS/4SqVkHTH2kw18jKx867YYvwTefGqQsA==
X-Gm-Gg: ASbGncsh6wnKz9veIioJ8ITIrDif/2PX346XeVDmTR98xD9K0NqBhrh9HcBTigy/SU2
	QgF2RdSazMdDmPgx52sT9BpfNwpT+bPEpfL6Gghrzf6K+ZdoTQhzslzduzGV82rI+MESK80i3dl
	qD/GWIWU1ISdGiMSVMB3RSgrbLrYU8ikSX+tdTYl/sZ4g2lKFipk49L+o6FShPvG7DQ6ohe3wLK
	oe7tabtMNnkI4RUQR4YXyHGkycTOQFqKGhQ3rK+YXl3oFbuHC04J/QpajOTUcHiOdM7cktjtVyP
	TR8UfrJ4kiRvGVIEorYwOxT1611lC5/t9gwqAKzvvXrn+wd3HsSjBTNsw9xawosd8zJvPA==
X-Received: by 2002:a05:6000:42c8:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3b200d3393bmr2709500f8f.50.1751519530924;
        Wed, 02 Jul 2025 22:12:10 -0700 (PDT)
X-Received: by 2002:a05:6000:42c8:b0:3a5:1241:c1a3 with SMTP id ffacd0b85a97d-3b200d3393bmr2709489f8f.50.1751519530439;
        Wed, 02 Jul 2025 22:12:10 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm17752357f8f.58.2025.07.02.22.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 22:12:09 -0700 (PDT)
Message-ID: <5d84a15c-5b1e-465d-84c8-321a49ab6d4f@redhat.com>
Date: Thu, 3 Jul 2025 07:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 19/32] tests/qtest/bios-tables-test: Update ARM DSDT
 reference blobs
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250627095620.3300028-1-eric.auger@redhat.com>
 <20250627095620.3300028-20-eric.auger@redhat.com>
 <f502c91e-ffea-4b39-bedf-9503fc45e568@redhat.com>
 <20250630133105.00002f43@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250630133105.00002f43@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OJFHL-bD_3Ds9KkOzIctxZLE0Ot0-Us0ZgkfFN1D0ak_1751519532
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: akHpF3L8euZt

Hi,

On 6/30/25 2:31 PM, Jonathan Cameron wrote:
> On Fri, 27 Jun 2025 12:00:51 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi,
>>
>> On 6/27/25 11:55 AM, Eric Auger wrote:
>>> Changes relate to the introduction of pieces related to
>>> acpi-index static support along with root ports with no hotplug.
>>>
>>> +
>>> +    Scope (\_SB.PCI0)
>>> +    {
>>> +        Method (EDSM, 5, Serialized)
>>> +        {
>>> +            If ((Arg2 == Zero))
>>> +            {
>>> +                Local0 = Buffer (One)
>>> +                    {
>>> +                         0x00                                             // .
>>> +                    }
>>> +                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>>> +                {
>>> +                    Return (Local0)
>>> +                }
>>> +
>>> +                If ((Arg1 < 0x02))
>>> +                {
>>> +                    Return (Local0)
>>> +                }
>>> +
>>> +                Local0 [Zero] = 0x81
>>> +                Return (Local0)
>>> +            }
>>> +
>>> +            If ((Arg2 == 0x07))
>>> +            {
>>> +                Local0 = Package (0x02)
>>> +                    {
>>> +                        Zero,
>>> +                        ""
>>> +                    }
>>> +                Local1 = DerefOf (Arg4 [Zero])
>>> +                Local0 [Zero] = Local1
>>> +                Return (Local0)
>>> +            }
>>> +        }
>>> +
>>> +        Device (S00)
>>> +        {
>>> +            Name (_ADR, Zero)  // _ADR: Address
>>> +        }
>>> +
>>> +        Device (S08)
>>> +        {
>>> +            Name (_ADR, 0x00010000)  // _ADR: Address
>>> +        }
>>> +
>>> +        Device (S10)
>>> +        {
>>> +            Name (_ADR, 0x00020000)  // _ADR: Address
>>> +        }
>>> +    }  
>> after regenerating the blobs using
>>
>> ../tests/data/acpi/rebuild-expected-aml.sh
>>
>> I still get an error :
>> Using expected file 'tests/data/acpi/aarch64/virt/DSDT'
>> acpi-test: Warning! DSDT binary file mismatch. Actual
>> [aml:/tmp/aml-2YB972], Expected [aml:tests/data/acpi/aarch64/virt/DSDT].
>> See source file tests/qtest/bios-tables-test.c for instructions on how
>> to update expected files.
>> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-O0B972.dsl,
>> aml:/tmp/aml-2YB972], Expected [asl:/tmp/asl-NO6872.dsl,
>> aml:tests/data/acpi/aarch64/virt/DSDT].
>>
>> ../..
>>
>> -
>> -        Device (S10)
>> -        {
>> -            Name (_ADR, 0x00020000)  // _ADR: Address
>> -        }
>>      }
>>  }
>>  
>> **
>> ERROR:../tests/qtest/bios-tables-test.c:554:test_acpi_asl: assertion
>> failed: (all_tables_match)
>>
>> (test program exited with status code -6)
>>
>>
>> I don't get what is wrong.
>>
>> Thoughts?
> I've hit so many problems over time with regenerating these I tend
> to just blow away the build directory whenever this sort of
> issue happens to make sure it's building a clean set.
>
> Otherwise, no idea!

I actually found the reason of this failure. The viot test for aarch64
is missing a "variant" and this causes the DSDT ref blob to be overriden.

Fixing that asap

Cheers

Eric
>
> Jonathan
>
>> Eric
>>>  }
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>>
>>> above changes are reported after running make check V=2
>>> then I launched ../tests/data/acpi/rebuild-expected-aml.sh from the
>>> build directory and it putput those reference blobs.
>>>
>>> But I run make check V=2 after committing those changes I get and error
>>> which looks totally unexpected to me:
>>>
>>> acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-LZSL82], Expected [aml:tests/data/acpi/aarch64/virt/DSDT].
>>> See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
>>> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-FTSL82.dsl, aml:/tmp/aml-LZSL82], Expected [asl:/tmp/asl-ZAWL82.dsl, aml:tests/data/acpi/aarch64/virt/DSDT].
>>> --- /tmp/asl-ZAWL82.dsl	2025-06-27 03:34:45.518848387 -0400
>>> +++ /tmp/asl-FTSL82.dsl	2025-06-27 03:34:45.514848036 -0400
>>> @@ -1,30 +1,30 @@
>>>  /*
>>>   * Intel ACPI Component Architecture
>>>   * AML/ASL+ Disassembler version 20210604 (64-bit version)
>>>   * Copyright (c) 2000 - 2021 Intel Corporation
>>>   *
>>>   * Disassembling to symbolic ASL+ operators
>>>   *
>>> - * Disassembly of tests/data/acpi/aarch64/virt/DSDT, Fri Jun 27 03:34:45 2025
>>> + * Disassembly of /tmp/aml-LZSL82, Fri Jun 27 03:34:45 2025
>>>   *
>>>   * Original Table Header:
>>>   *     Signature        "DSDT"
>>> - *     Length           0x000014BE (5310)
>>> + *     Length           0x000014AD (5293)
>>>   *     Revision         0x02
>>> - *     Checksum         0x8C
>>> + *     Checksum         0xEA
>>>   *     OEM ID           "BOCHS "
>>>   *     OEM Table ID     "BXPC    "
>>>   *     OEM Revision     0x00000001 (1)
>>>   *     Compiler ID      "BXPC"
>>>   *     Compiler Version 0x00000001 (1)
>>>   */
>>>  DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>>>  {
>>>      Scope (\_SB)
>>>      {
>>>          Device (C000)
>>>          {
>>>              Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
>>>              Name (_UID, Zero)  // _UID: Unique ID
>>>          }
>>>
>>> @@ -1929,24 +1929,19 @@
>>>                      }
>>>                  Local1 = DerefOf (Arg4 [Zero])
>>>                  Local0 [Zero] = Local1
>>>                  Return (Local0)
>>>              }
>>>          }
>>>
>>>          Device (S00)
>>>          {
>>>              Name (_ADR, Zero)  // _ADR: Address
>>>          }
>>>
>>>          Device (S08)
>>>          {
>>>              Name (_ADR, 0x00010000)  // _ADR: Address
>>>          }
>>> -
>>> -        Device (S10)
>>> -        {
>>> -            Name (_ADR, 0x00020000)  // _ADR: Address
>>> -        }
>>>      }
>>>  }
>>> ---
>>>  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
>>>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5158 -> 5310 bytes
>>>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5244 -> 5379 bytes
>>>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6519 -> 6654 bytes
>>>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7603 -> 7768 bytes
>>>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5360 -> 5495 bytes
>>>  6 files changed, 5 deletions(-)
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index abe00ad4ee..dfb8523c8b 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1,6 +1 @@
>>>  /* List of comma-separated changed AML files to ignore */
>>> -"tests/data/acpi/aarch64/virt/DSDT",
>>> -"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>>> -"tests/data/acpi/aarch64/virt/DSDT.memhp",
>>> -"tests/data/acpi/aarch64/virt/DSDT.pxb",
>>> -"tests/data/acpi/aarch64/virt/DSDT.topology",
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
>>> index acab6e65febbc210158d4c39be0680bbb90250f5..b897d667971500da4732000091a6f0828d05d89e 100644
>>> GIT binary patch
>>> delta 173
>>> zcmZ3cu}_oBCD<iop9lj3Q_n^&8IgJccg`5S_+Y2_0B27F5pPykmtbGs1!j}87zzZL
>>> z85t55NKKlYAt=lxaKZfK(_qso--+U{d?gP%`z}dXz&<sTi)l$h0as&30t3U6gatB_
>>> zv$)s`gjksvco`B3nmckB7!nH-A(GKe+`$G0@f`7vE<p^@P5i+I7V#YMl8!DxJPZts
>>> OU=c&8G!Fv<69WJ)j4yfs
>>>
>>> delta 19
>>> acmdm|xlDu0CD<iIO@x7g>C8qh84&<COa$Tp
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
>>> index 54c27e7d95b4956ed1b5dee0d299ccb08dc2a73e..2cef095bcc1bb404f8cd9ec77a879ed81c191875 100644
>>> GIT binary patch
>>> delta 156
>>> zcmeyP(X7Sg66_MfEXu&Zv}_|+kx0FO8%K;@e6Uk|fU~E8h&QXNORz8R0<+0k3<ZMB
>>> zj0_12q$W+y5ESMTxL|(rX|QRP??mxezLJNXeU~IGV4s@F#k3@$fUB`1fq`L3!UCDe
>>> zSzPP|Laa;-ybK8i%^f)m42cDa5XtB!?qCChc#e2Smmr4dCjMXpi+GNB4o8<D9tH+R
>>> F1_1j$EA9XQ
>>>
>>> delta 19
>>> acmZqH`lG?+66_LEBf`MI)VYzXNCW^oYz1ck
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
>>> index 4330bc97cba0950191c45ac833533db7a190db81..372ca3d7fb1e2927c7c12f97eec406d597f294ab 100644
>>> GIT binary patch
>>> delta 156
>>> zcmexv^v{^fCD<k8pCkhV6Zb~0T*-O?H;x#+_+Y2_0B27F5pPykmtbGs1!j}87zzZL
>>> z85t55NKKlYAt=lxaKZfK(_qso--+U{d?gP%`z}dXz&<sTi)l$h0as&30t3U6gatB_
>>> zv$)s`gjksvco`B3nmckB7!nH-A(GKe+`$G0@f`7vE<p^@P5i+I7V#YM9F8tQJPZts  
>>> F3;>E4EZYD8  
>>>
>>> delta 19
>>> acmexo{N0GlCD<jTT#|u->Fq|YTuA^&WCm0K
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
>>> index 7fdbc03e2bf9fb7d35704779253de36e362f0bf9..c2779882494e16920787b8ab7b4cb3c3b70f224b 100644
>>> GIT binary patch
>>> delta 168
>>> zcmdmNeZz*!CD<h-LXLrf$!jCmN?BzA7p@q+_+Y2_0B27F5pPykmtbGs1!j}87zzZL
>>> z85t55NKKl&K}IZRNx}m5shM0%OA-pW8aomg7?va~keQst#a<x9%EZ9SkWkRvk;A}{
>>> uSda*jjBer%HZX|ih<9`eVu)^%2{y2RaCjIP7#YxH`GXCiN_iL<m>2+L6)WZd
>>>
>>> delta 19
>>> acmca%v)P)<CD<iovn&Gx)9sC1D`f#g-Uey_
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
>>> index 969b4f6560d3ae39f5b7e0064b7122905476fce8..ebbeedc1ed30d811315c350f4cb42f8aa265af73 100644
>>> GIT binary patch
>>> delta 156
>>> zcmeyM`CW_4CD<jTT$F)<>HJ2nXCn0iZX7Xs@xe~<0nVNVBHpa7F2TOM3(O{GF%$?g
>>> zGcqJBkeW0(Lr|DY;DY(dr@^LGz7xe?`AQyk_Fa;&fPHEv7t@l20<Ol61O|pB2@7N<  
>>> zXK}F?2(dCT@G>M6G<W1MFeDZvLL{S`xPuK0;yL0SU4j^*oA`qbEaExhIUHSrco-NM  
>>> F8359@EocA$
>>>
>>> delta 19
>>> acmeya^+A)%CD<k8g9rly)25AF&qM%8i3Z^S
>>>  
>>
