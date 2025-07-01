Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3022120dye;
        Tue, 1 Jul 2025 02:22:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfkjSW6zYN8MwcwxjwyCE5m636fN7ZEwdbpYvqHHzD2lGyoJBQkZBPeKLIfwHQOn+kt1eZfz5uhRYgDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9j2G6Pbwej49MwKienpj3tXW3E+wd2rqdgayvogn6lBMi53HvSJW+LtqhqCjfIMFJ6aZV
X-Received: by 2002:a05:6214:620c:b0:700:c717:493b with SMTP id 6a1803df08f44-700c71749f1mr117880346d6.25.1751361756819;
        Tue, 01 Jul 2025 02:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751361756; cv=none;
        d=google.com; s=arc-20240605;
        b=D3tSHBuNPllPN64v7jp8+sT7korWKHUVR0YXskzX36n0cDdRryyYE7N8FW85szYoP3
         8YaPECTsmxCdeTBtCc3764G+tDonpvafDTdvXvLjza1m3T3wm/qFE2pHzNd9by1hXi2N
         VtaX13+Zhl+cNcoEeWObZ1RTxqo5SENR2rbMPSSet8gUTDAJi17kmseeknk0awcQxEIp
         bAmqs0axJTCcM2AZoNRQwXCpY2oFUqGKx+cVfuka4K6vEiImjKzV3vxB9mS+SAChphO8
         z1zGa1ouceYS71QvE8xeC37Kr8qF8TjSa+3dVeApOz26RNBjgU+r5mlCFWF53NeuAja1
         hGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=3c82TwcmL6p/OmbHJu7kTaEncL6FZUKhOU6c1vF317k=;
        fh=5qZZua05mhaV7R4urAzwC5BhRoQlbB/oGxAYTeQiyfA=;
        b=Sn1ouG5Y2n+gOX9UkEKmflAbr/hLJ90w5mf7J+Efll+Qo7ib2LmASboGYZGu7qnGYi
         oQrS/kj6+hy5c8DEcTmnlxdMiOKWA05S49SHLV5uQeGHRe0FG0kP7Js4i1W4rsP+FVmX
         VDgrnUVt8DdzHxkl8oWaOESfR2Abfa41Y2Yin4VAzPcLw4kh2uqHvEUtST9iO2FC3aoG
         +Rhrs9EzigFTu1BW5r96R2Q4AnTKUGoH2UxY3AkfLx1mCte7yZkHQWbPXRYsDg3oM0To
         AOrbUiLMs2jblcm2uEMgVqZnfHgNU89vHC4LCzKxvYzbkoUHymcOOXnPgCPNdC3fb5Zx
         XSRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRTRzexH;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773aea2asi118951636d6.509.2025.07.01.02.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:22:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YRTRzexH;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751361756;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3c82TwcmL6p/OmbHJu7kTaEncL6FZUKhOU6c1vF317k=;
	b=YRTRzexHkoUdFoBdtpKyWsBTepAY8deHFd9sDA0qDtob5+2otfWmdGGxbqPc7t/BjrJ/hC
	lCq2p+JQzzYB2qh+OEb8kZjFM9RoJDMiJy8KPHbfny4HX23l1Quj4E2PKB0jh0+HBlVMt1
	L292sHf4CGmJQGcSpq5huiR2hFuiT2c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-erWMHvAeNJWmQtDupV7tIw-1; Tue, 01 Jul 2025 05:22:35 -0400
X-MC-Unique: erWMHvAeNJWmQtDupV7tIw-1
X-Mimecast-MFC-AGG-ID: erWMHvAeNJWmQtDupV7tIw_1751361754
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d30992bcso19369415e9.2
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 02:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361749; x=1751966549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c82TwcmL6p/OmbHJu7kTaEncL6FZUKhOU6c1vF317k=;
        b=NFfcno//muPI5EElUVIlg4wYic+VwqaYRPm0z0aE17g0OXcgtnNw31YWBeGa9ZpVj6
         jNmX4KXZzsd1uflK29LaIp4T4e1Of+RtDiVMG1rHQvluK8sz6o4hVuCs0ef1+fFuwcIJ
         Z+uTbXaC/dWyGOqM092Vu1z4+j2Cv0Nok/X4RisfVVviEQa95qw1H3v3wWK9rq02JvZP
         wo+qiwqIrfe2SVJRso7obsC+EcXK0VLRmLPh+QJVzmMmcyxvgVjbXIDVJQ0aojlkyL7V
         1xM8WsPHIE84X5+CtdT+Pknw7m3OG0TD4bim92KJ1uGBx9jBy4Fzl8I0Mg0cdiSeGPdK
         0zEA==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZxLP+03Hc8a6N1Yo+Tp0dG0uaphnHKmAMOPBuGW38+WZl5tasJjIIYp0b2C0RP9zu0e6XTmJ41JhdA==@linaro.org
X-Gm-Message-State: AOJu0Yyq2SemRR5S2zrDQtUi6RrED8kQEb7Pykv21r3QmrX5AHF+j3U6
	TqpJLSVD+bcED4S+c/krNY9WXe7lGbHYcRU9MaCFNthMqzgmbKT7fWIqUpajG+gZrvbEnUhdS5s
	7ThqBIhPtXF6NzFw6xk8/4xIb1mCI5w14uX21B2PErN/V2x3GfITgSj9O3A==
X-Gm-Gg: ASbGncvlnTi3b6tWahwj97wVgaFACFM2VbBrYk9D55g1wxBMpL/RlwBPhmBUvLLgh/V
	gfWap0XrAFU5o5N7IUM/0CwruwIwtu2/RY2hNzDpdbwl0ryJDw6IzpykIyrFxF3Y+lYGbbK+4Ss
	TJpHjwItFJaidEjVeXI3b6Mr3Cg4yixN+YA22XG8wyVSqLcZ0LBFGJVoknMZHWRIWB9K43t8AbH
	zRlgpPbBLpIU6CnganC8sUDdVe/S/5KzGGoMUkNuHXS9W0G8jVgxfs+C3f+XIyhaiDTXO1XzA+B
	qnPjFMLGfXjXBP3XJR2MnjY0ZO3tyUCWEraF41JhiHXKRA4pZR52cExbCcxACe5cmqoXPw==
X-Received: by 2002:a05:600c:4f93:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-453a5dff801mr38194735e9.13.1751361749001;
        Tue, 01 Jul 2025 02:22:29 -0700 (PDT)
X-Received: by 2002:a05:600c:4f93:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-453a5dff801mr38194285e9.13.1751361748409;
        Tue, 01 Jul 2025 02:22:28 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f88efffsm131737455e9.17.2025.07.01.02.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:22:27 -0700 (PDT)
Message-ID: <3e537f1d-a3ad-4651-a4cd-047d585e0e8d@redhat.com>
Date: Tue, 1 Jul 2025 11:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 19/32] tests/qtest/bios-tables-test: Update ARM DSDT
 reference blobs
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20250627095620.3300028-1-eric.auger@redhat.com>
 <20250627095620.3300028-20-eric.auger@redhat.com>
 <f502c91e-ffea-4b39-bedf-9503fc45e568@redhat.com>
 <20250630133105.00002f43@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250630133105.00002f43@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1zvcvvwThmQoEm3h_qE4CxqSDxBLa2m6vTy2LEQJ89I_1751361754
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LpvUsguZnQ9L

Hi Jonathan,

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
thank you for the review again and thanks for trying to help here.

Unfortunately I have make clean distclean and retried
../tests/data/acpi/rebuild-expected-aml.sh
and then
make check V=2
it still reports the above mismatch.

I need to have a look at the scripts

Eric
>
> Otherwise, no idea!
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
