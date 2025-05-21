Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1296584njc;
        Wed, 21 May 2025 09:12:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdSjYBfp+hlaueikY+JQSnQeuYO4ut8RfjexFtnE2uEAK6DbI9LpUOoPmoWP+rjacQlQxQiUzwOk3yoA==@linaro.org
X-Google-Smtp-Source: AGHT+IF0vH4rG/PTJILhV/KguNeT/AB5Hm4TXOCKDT73NDDXDAN0tphx2oVdXmpx+9frTriJpwMU
X-Received: by 2002:a05:6e02:1745:b0:3d9:36a8:3d98 with SMTP id e9e14a558f8ab-3db84296deemr256724795ab.2.1747843973656;
        Wed, 21 May 2025 09:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747843973; cv=none;
        d=google.com; s=arc-20240605;
        b=dPYu7ydmusEbubDL98+rICXckDFIvsh/UeuOFpjLEClh+58rfDUyHs/UI2LYOqq91Q
         1inbFzMD7dRmp1CO1w0XlrDlnulLfSyN3AFy6zfORLVEqtg3PDVNJkWXoA3oKhhVKmK8
         Os47DWrhe548aRA5GeaLqPBVnZRSLZV7SpAP74wvYjRDh+k6yBcjJGRKUdfIFJBIu8sR
         Av9oNgl98hCjZSImt3593bb2bfh+NJ0MVtIHPIpFb1YzFPYvCYZR2/MT1ot/m4MYnZr1
         CKd56cO/lzeZTZIIPy//yz5OGRae8HCOcqzhJgGuIYTywrq7ea8gSqfOA83Qch8GPH0t
         bJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XLF/+N32Jite/7MDBsWdP7VLLcDPcqAq9wogQc5MyqU=;
        fh=OORrTSDfVyAfCCaXAUFxPXvHRgfqPTP/oDdmNaxnUBI=;
        b=U9954qfotTFxO/bB1jPMKPkWpdycZ8YMW7dBYxJ67bc+R+ZtCsoBZgnKCwKIXPbyOO
         sMVdFocQf4nwrKVfclkzvKJo6ZTVX3/QoOGAv1YwqV8uUSK5SdFfdKK34+bv53fTCgqP
         mTXMssWVWV6gyBxH+5o+FOFWDQjsz0/fllZ78BdzsdmptqRvL4J6IVxWkcpQ4WElJaey
         i5OqdIl/3eMFjTtU7sb8tD+tvxourUeCu/nJYt1WwMLhUI5ySvtIRY8+LRqlJMpexoHD
         z1/26WgtvI1NQDJJuU/bcTtDJBQGUcl93DT0K09tdjK70Jk77ljJQglqAq+UvOAr2PJH
         HAyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fe6ctA9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcfac9c77si9103156173.61.2025.05.21.09.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 09:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fe6ctA9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHm3i-0007d3-BB; Wed, 21 May 2025 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uHm3h-0007ct-BY
 for qemu-arm@nongnu.org; Wed, 21 May 2025 12:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uHm3f-00023c-2f
 for qemu-arm@nongnu.org; Wed, 21 May 2025 12:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747843960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLF/+N32Jite/7MDBsWdP7VLLcDPcqAq9wogQc5MyqU=;
 b=fe6ctA9zgpbIjpjvdiuZ1xym4KQdAj4GKv1FYRwmTnt3Wpvj9INlATOCaVGBpjJ+TQjpOu
 LsBm5pUb58G9aHV2xZuLWPVxX5lm56VZ6ANiicX7HWrfFQ1Pc8GsADO9Rxv0w4wF6YtRXv
 aVsQtxOjowXcTrujYQFHxx5v/J6RKC0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-ZKMX0wkCP9OHqIFc39gBRg-1; Wed, 21 May 2025 12:12:39 -0400
X-MC-Unique: ZKMX0wkCP9OHqIFc39gBRg-1
X-Mimecast-MFC-AGG-ID: ZKMX0wkCP9OHqIFc39gBRg_1747843958
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so37996015e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 May 2025 09:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747843958; x=1748448758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XLF/+N32Jite/7MDBsWdP7VLLcDPcqAq9wogQc5MyqU=;
 b=dQo8OKJCAn3Pld3otprfpYGxCsH0IUfQ//vVee4SOKJcIXhwOlJY1J2nkYmRFWqUSR
 HLdbb3FKdFuOlY+JmFs+oIKeRhuTVSI2CZKk+urym3+OFNMWieOuVCcIKs9lsM/lke6p
 ocUt92SBZvUElAvz88/SpzzuMqOMhJm34SDZtKAH3z8TP9p7WfdMO2yWA+L5/aC6IghQ
 BVQqMZUrz/DGjSMv514TcxX7VoKtKh4ACV9sqpQOD/nM2HazcAmIR9r0CwmJynNkY17x
 f9thKU+xcADDKATo6ARk9NZI8nPzaCm8l7GCPbjKnpTJoOE7hZoacF4FpjsS1w8iDV7q
 8Gqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcfBI0LxeBL3cLK6gZR+YpzNdgWidbGEGeIo4nVGGGKMyk+vmJjkeqqzM3EBVVs/vTLnfsMo9lAQ==@nongnu.org
X-Gm-Message-State: AOJu0YxwTD+AloGZu/w7D1OVOe8tZCNVftHvlhvqi8RnBeR/uu20yPJs
 I0AJ96X/TQSRNydIa1q55j6HB1sJgHh93Lg5QKZ+JMxqVM31ScTFuprFbUYoDtdgFMBoFGhq/eV
 MRiQiZbCGOApuOidnNCTZ9Da6nwMEL4byjyXGDvyfTj2uT2RVIPgTzw==
X-Gm-Gg: ASbGnctZg5hNuJTzYKeyjId3KQS0SQ7k0dAtlM4U83kZUrSd26X+806JGAj5JcEVM0j
 GY8cnPel/27eHlcaYO0UHLaYs77s5Mgn/bGH/yqJoNNGmT0ldrhV4j0bN0RTK6Mv3t2vWgrziRT
 ViFZshbQf1uoGbdlGjclpyNiaNeO50q62zbjDQt6YPyl418Ibv0ZKKeLqXHlP2sFIzh5pBLOgVL
 SztKQt9UaGZ6yhdkz8F+E9AQ8Ox1YIK0anIARCadu4SqAm/Aep9MSyg4/POUpkaa9EPBYGJXjq7
 lYg1VbySuULjhKvE0XtzdBLd0pPz7QzFcc/t3F/Umd52fXoBn6qLMODsI2E=
X-Received: by 2002:a05:600c:3507:b0:43c:f509:2bbf with SMTP id
 5b1f17b1804b1-442f8524653mr270263555e9.15.1747843958011; 
 Wed, 21 May 2025 09:12:38 -0700 (PDT)
X-Received: by 2002:a05:600c:3507:b0:43c:f509:2bbf with SMTP id
 5b1f17b1804b1-442f8524653mr270263045e9.15.1747843957574; 
 Wed, 21 May 2025 09:12:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442eb85a3b1sm189915935e9.0.2025.05.21.09.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 09:12:35 -0700 (PDT)
Message-ID: <ed823ddc-6faa-42dc-bae5-c765d21c3cca@redhat.com>
Date: Wed, 21 May 2025 18:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-9-eric.auger@redhat.com>
 <e1ec0e15-ad26-456b-a8d7-16f683290651@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <e1ec0e15-ad26-456b-a8d7-16f683290651@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cd3-a8QrK3bCNZB8sAF0wX3K2oRE3jlExnJ_7-0hcvw_1747843958
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.184,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v0cqUlkO9Pzn

Hi Gustavo,

On 5/20/25 4:09 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/14/25 14:00, Eric Auger wrote:
>> gpex build_host_bridge_osc() and x86 originated
>> build_pci_host_bridge_osc_method() are mostly identical.
>>
>> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
>> is same as Local0.
>>
>> So let gpex code reuse build_pci_host_bridge_osc_method()
>> and remove build_host_bridge_osc().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> The DSDT diff  is given below:
>> diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
>> index 3224a56..fa7558e 100644
>> --- a/dsdt.dsl_before
>> +++ b/dsdt.dsl_after_osc_change
>> @@ -5,13 +5,13 @@
>>    *
>>    * Disassembling to symbolic ASL+ operators
>>    *
>> - * Disassembly of dsdt.dat, Mon Apr  7 05:33:06 2025
>> + * Disassembly of dsdt.dat, Mon Apr  7 05:37:20 2025
>>    *
>>    * Original Table Header:
>>    *     Signature        "DSDT"
>> - *     Length           0x00001A4F (6735)
>> + *     Length           0x00001A35 (6709)
>>    *     Revision         0x02
>> - *     Checksum         0xBF
>> + *     Checksum         0xDD
>>    *     OEM ID           "BOCHS "
>>    *     OEM Table ID     "BXPC    "
>>    *     OEM Revision     0x00000001 (1)
>> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ",
>> "BXPC    ", 0x00000001)
>>                   {
>>                       CreateDWordField (Arg3, 0x04, CDW2)
>>                       CreateDWordField (Arg3, 0x08, CDW3)
>> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
>> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> -                    CTRL &= 0x1F
>> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> +                    Local0 &= 0x1F
>>                       If ((Arg1 != One))
>>                       {
>>                           CDW1 |= 0x08
>>                       }
>>
>> -                    If ((CDW3 != CTRL))
>> +                    If ((CDW3 != Local0))
>>                       {
>>                           CDW1 |= 0x10
>>                       }
>>
>> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
>> -                    Return (Arg3)
>> +                    CDW3 = Local0
>>                   }
>>                   Else
>>                   {
>>                       CDW1 |= 0x04
>> -                    Return (Arg3)
>>                   }
>> +
>> +                Return (Arg3)
>>               }
>>
>>               Method (_DSM, 4, NotSerialized)  // _DSM:
>> Device-Specific Method
>
> The problem I face with diffs in the commit body is that tools like
> b4, which are
> based on git am, get very confused on how to handle it. I'm surprised
> nobody ever
> complained about it. I'm wondering if there is any catch on it,
> because I have to
> edit commits like this manually, removing the diff, to make it finally
> apply to
> the series. Anyways, do you mind at least removing the valid diff
> header, like:
>
>> diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
>> index 3224a56..fa7558e 100644
>> --- a/dsdt.dsl_before
>> +++ b/dsdt.dsl_after_osc_change
>
> from the commit message so it doesn't confuse b4?
Thank you for reporting the issue. in tests/qtest/bios-tables-test.c it
is written at the top that we shall put the diffs in disasembled ACPI
content in the commit msg. I will look for previously landed patches and
see whether the current layout can be fixed.

Cheers

Eric
>
>
>> ---
>>   hw/pci-host/gpex-acpi.c | 60 +++--------------------------------------
>>   1 file changed, 4 insertions(+), 56 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index f1ab30f3d5..98c9868c3f 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -50,60 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml
>> *dev, uint32_t irq,
>>       }
>>   }
>>   -static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
>> -{
>> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
>> -
>> -    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
>> -    aml_append(method,
>> -        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
>> -
>> -    /* PCI Firmware Specification 3.0
>> -     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
>> -     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
>> -     * identified by the Universal Unique IDentifier (UUID)
>> -     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
>> -     */
>> -    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
>> -    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>> -    aml_append(ifctx,
>> -        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
>> -    aml_append(ifctx,
>> -        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>> -    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>> -    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>> -
>> -    /*
>> -     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
>> -     * and PCIeHotplug depending on enable_native_pcie_hotplug
>> -     */
>> -    aml_append(ifctx, aml_and(aml_name("CTRL"),
>> -               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 :
>> 0x0)),
>> -               aml_name("CTRL")));
>> -
>> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>> -                              aml_name("CDW1")));
>> -    aml_append(ifctx, ifctx1);
>> -
>> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"),
>> aml_name("CTRL"))));
>> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
>> -                              aml_name("CDW1")));
>> -    aml_append(ifctx, ifctx1);
>> -
>> -    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
>> -    aml_append(ifctx, aml_return(aml_arg(3)));
>> -    aml_append(method, ifctx);
>> -
>> -    elsectx = aml_else();
>> -    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
>> -                               aml_name("CDW1")));
>> -    aml_append(elsectx, aml_return(aml_arg(3)));
>> -    aml_append(method, elsectx);
>> -    return method;
>> -}
>> -
>> -static Aml *build_host_bridge_dsm(void)
>> +static Aml *build_pci_host_bridge_dsm_method(void)
>>   {
>>       Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>>       Aml *UUID, *ifctx, *ifctx1, *buf;
>> @@ -134,8 +81,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml
>> *dev,
>>       aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>>       aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>>       /* Declare an _OSC (OS Control Handoff) method */
>> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
>> -    aml_append(dev, build_host_bridge_dsm());
>> +    aml_append(dev,
>> +              
>> build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
>> +    aml_append(dev, build_pci_host_bridge_dsm_method());
>>   }
>>     void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>
> Otherwise:
>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>
>
> Cheers,
> Gustavo
>

