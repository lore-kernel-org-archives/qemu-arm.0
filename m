Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1911583njc;
        Wed, 11 Jun 2025 06:15:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAhM1/7BUW4Z2FFMOAMrqp5wcekbPg9Pq79aFHLuS3f6yhSm6MsZjZY4eBTCc4/EoG2MvGdy1Y35KsZQ==@linaro.org
X-Received: by 2002:a17:902:fc84:b0:235:eb71:a386 with SMTP id d9443c01a7336-23641b2620emr44220565ad.50.1749647707898;
        Wed, 11 Jun 2025 06:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749647707; cv=none;
        d=google.com; s=arc-20240605;
        b=OrU3k46QrCC9YqX/3KDfWRhLZOxn2b8ckltEv7/6V7lsTGa+aWxMhtCAEQdF7oo+U5
         adewjxa/JKS8WlIXwzOOJP9hiJfTCF0hJsAwDsDLdypWnJqSpOvi/FOtw8c+0wO4hLHU
         8RtuTfl/VHrZTcHSoPYvboN0Y8ziqC+V4/ycMu/1Tmg6d67ospP/gRc/+RnYMj3pGkVX
         GDbXRQMaHgG/B70nVSHNoWbZWZaXY4b1JRh0j8DcEW1ouhlVdr2sjkaNa1OXJNBbLN9F
         Ak2h6qpREitVqRVi8qiw6tHGp4Ix6w8eH9rs9wLXouguL+aOCc+XKGTKRi/3C6ON53wB
         pS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VqIGEOcDV2NrDDIyGDNi4yC42x12EluOFJPa5dLjvUw=;
        fh=0R6J8zuAIBDZgqPu7NUEgJR9LynA4k6FUbLpqKD8ADk=;
        b=XfkoSYpapI4GmrXajiBYIBQTmbLymFxWMVHpezFGO2exRo9D5mEw2o8tMibY1sSosH
         dEO2+3KiNiXK7H1CkNMYbym4ldLUPDmqozEl/P+GmIDmEbPjK8/Q+wQ2aGqOZp1XiuGi
         8SIRunF5lvfAS+3S5oJCw885/P8JmoRLBMXJh1tYuRBVdv7dgZNJrJrt/xsQMmG25j72
         uthR45bXpf4yDfmffna+bWoSoHK/eSsz/RgK7YMKAmJcawetZdqlzK9TZ9UdcsG6+qPe
         AiXJS6f7SMZg4e1AnnMJ5DEqT+JKIh7ik7/r5/P8tvGmkt0CR+AOO6dvY6RW3BRE/Vne
         N+eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SFGcLVII;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23603079f93sor69566375ad.2.2025.06.11.06.15.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Jun 2025 06:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SFGcLVII;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647707; x=1750252507; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VqIGEOcDV2NrDDIyGDNi4yC42x12EluOFJPa5dLjvUw=;
        b=SFGcLVIIb2/AIFp63MTTodqIzK+0vTUXOz7k4mpE62niK0f82H8ib4yXhHokq54rKo
         9n3+mTo+tH3aThaWLrPhEaBIaQuDzJAvLeFU/u3ArtBWGPQho4yzfveiOxvvJcfcEByF
         IpLbVUHaFvUm+wSLNMGgWCOgPniwP1OUw6rYsuX37yCtONJPQXo55ictU/gQacxRtGvh
         3kK9ph7VDdTrx22XGuhET7JAkd6Vzbd61lxg+Te6T4LG54R/J6BrY4zhi27HcTmsdO79
         ish2fwq9bjbWnhys5GvlDBsw5IcL/JUJtp+0ko7JpkLQ3Q1qLhrJnt+FAWPDccOQ9hKv
         94eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647707; x=1750252507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VqIGEOcDV2NrDDIyGDNi4yC42x12EluOFJPa5dLjvUw=;
        b=DWrM8KO3G3xc8k7IL1eWVHJ9QsYcm+QDlCLD8+PKvG0hdxBzsrDAF1P8qGpVf6WV3Z
         yh3AbgSxUnnP5qsamCJFX//MezxKFovAENPVrRN8l0m1TovxZiNDH2lO62Iu6T+W8WBD
         V+j+ANxwxagZzvo4QSqELPkI15Qe6LuIZzhtNETJwhkB1+iZSxQdpUCXRrQK+s3yDY8e
         e4+GNu0aSaXLglKFHlARw2X2cX8ykenkAKr5Qjus46ZAFjLebWfE/6aR0OgGjmxhp0Ol
         /eM40NdlvNPxG+OE1Exe8SQ0v5t5oJC73c35GZWbaP7OeUARlGfdkvh6G4bz5oWNMgcl
         s5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWoRktnewqSbAoJ8FL46H67BdbncHaW44YZiIWUYwcv8z1NKrH1NRA/YxDym51sFCY5gxkKVywcqd35Ig==@linaro.org
X-Gm-Message-State: AOJu0YzduUUMf78HvdxDO/bA/pM5TQrNeDXw9wa+l3P0ZyYsNuC2DrE+
	bBKRcRfWaD7yBVh1dqEle26XDTM7XiZrwnsdx2eFvZNMQBZlg8xoCfpXAVs3s43ijSNcrr5fm7x
	ZDus3S1c=
X-Gm-Gg: ASbGncvW2JlMyHntk+CBYqCHazgUT9QdqX39A3kpG9lu040hBl+Yva/RHz9rwDlIdeR
	apzofnaWrQVdYWzZPqFs0oabgKdtfDPaIqMn08QnPvrhhsYdhXYCE8i5Fcx7SFfN7psJpkxXm05
	ma1llSrFaZRx3fEMEVeyjPwXkhy25DIlBWozkjT3BtUph1C1Nx+rv3t+Bmz1GYfNSn7B4lDz6bY
	8Dgfi2vug3jwaCSP30sJ5BIKGmN9nxOQQf/llq4ssA++5KYyH8iWCRjD9wreXWXWBPPvTNMDNiu
	tGxJBPMnFTNEQCPmAumnJVSexvDabhjeCMmSgmPf7mYJwVb4vEA2WZoZmmt0X9f70+9Idb4bHEa
	Yd+H0LBhkVMbUK/bxD7PNtxIxChTnnPvvvbmiNS0tfsde9g==
X-Google-Smtp-Source: AGHT+IEbyrepJ4ZWPpnVOLunUAT2Aytke5b/7mZTcD2XaPyeb9MvZL7PS6mRI5LoLBd6/7lnsbg0DA==
X-Received: by 2002:a17:90b:2245:b0:311:b0ec:134b with SMTP id 98e67ed59e1d1-313af266ac9mr3770974a91.32.1749647707084;
        Wed, 11 Jun 2025 06:15:07 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (200-162-224-156.static-corp.ajato.com.br. [200.162.224.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056f8sm87134895ad.161.2025.06.11.06.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:15:06 -0700 (PDT)
Message-ID: <848ad5cf-7e83-49bd-8547-ac757c918fdf@linaro.org>
Date: Wed, 11 Jun 2025 10:14:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
To: Igor Mammedov <imammedo@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-25-eric.auger@redhat.com>
 <20250528113813.47086516@imammedo.users.ipa.redhat.com>
 <375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
 <20250528150239.5f6b63d0@imammedo.users.ipa.redhat.com>
 <6a5776b4-73ef-427b-b4e4-b25031b0ce53@linaro.org>
 <20250530135103.09030cf0@imammedo.users.ipa.redhat.com>
 <bcc200fb-fa45-44ac-9e36-4c829becbf1c@linaro.org>
 <e3bc87d8-5016-455e-933d-6cefae993c25@linaro.org>
 <20250611105437.5ecda7c9@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250611105437.5ecda7c9@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8jlulaC77poH

Hi Igor,

On 6/11/25 05:54, Igor Mammedov wrote:
> On Tue, 10 Jun 2025 11:29:02 -0300
> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> 
>> Hi Igor,
>>
>> On 6/2/25 03:06, Gustavo Romero wrote:
>>> Hi Igor and Eric,
>>>
>>> I'm sending again this to the mailing list since it seems the first one
>>> got lost... I can't find it either in qemu-devel@ or in qemu-arm@ :(
>>>
>>> On 5/30/25 08:51, Igor Mammedov wrote:
>>>> On Wed, 28 May 2025 12:04:26 -0300
>>>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>>>   
>>>>> Hi Igor,
>>>>>
>>>>> On 5/28/25 10:02, Igor Mammedov wrote:
>>>>>> On Wed, 28 May 2025 09:41:15 -0300
>>>>>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>>>>>> Hi Igor,
>>>>>>>
>>>>>>> On 5/28/25 06:38, Igor Mammedov wrote:
>>>>>>>> On Tue, 27 May 2025 09:40:26 +0200
>>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>>>>>
>>>>>>>>> ACPI PCI hotplug is now turned on by default so we need to change the
>>>>>>>>> existing tests to keep it off. However, even setting the ACPI PCI
>>>>>>>>> hotplug off in the existing tests, there will be changes in the ACPI
>>>>>>>>> tables because the _OSC method was modified, hence in the next patch of
>>>>>>>>> this series the blobs are updated accordingly.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>>
>>>>>>>> it would be better to test whatever default we end up with.
>>>>>>>> (like x86)
>>>>>>>
>>>>>>> hmm maybe there is a confusion here, Igor. We are actually planning what you
>>>>>>
>>>>>> perhaps, see my reply to Eric about my expectations wrt tests.
>>>>>
>>>>> Yip, I read it before my reply here.
>>>>>
>>>>>   
>>>>>> (i.e. default tests shouldn't have any explicit CLI options,
>>>>>> instead it should follow whitelist blobs/set new default patch/update blobs pattern)
>>>>>
>>>>> I see. I agree with that. But this patch is not about the new test. The new test is
>>>>> _not_ in this series. Patches 8/25, 10/25, and 24/25 are _not_ about the new test but
>>>>> about adapting the _legacy tests_ (native acpi) to the situation when ACPI HP becomes
>>>>> the default, because this series makes acpi-pcihp=on the default, hence the CLI option
>>>>> "acpi-pcihp=off" added to them. An update to the blobs are also necessary because of the
>>>>> change in _OSC method, even when acpi-pcihp=off.
>>>>>
>>>>>   
>>>>>>> said. This patch and the other two in this series related to the bios-tables-test
>>>>>>> (i.e., patches 8/25 and 10/25) are for actually making the current (legacy) test pass,
>>>>>>> since the new default as per this series will be acpi-pcihp=on. That's why here we're
>>>>>>> adapting the current test here to have acpi-pcihp=off.
>>>>>>>
>>>>>>> The new test that will test for acpi-pcihp=on (the new default) is not in this series
>>>>>>> and we decided to merge it separate. It's in the patch 4/5 and 5/5 of the follow series:
>>>>>
>>>>> We're doing the "blobs/set new default patch/update blobs pattern" in the new test, which
>>>>> we can merge later, once this series is merged, no? The step "set new default" then will
>>>>> not be necessary because the new test will be merged separate, after this series, so when
>>>>> acpi-pcihp=on is already the default.
>>>>>
>>>>> Please note that although we're using acpi-pcihp=on in the new test, it's not necessary,
>>>>> we can dropped this option, making it implicit as you say, and it will work. This is the
>>>>> new test:
>>>>>   
>>>>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
>>>>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
>>>>>
>>>>>
>>>>> Thus, there are to "acts" of modifying the bios-tables-test:
>>>>>
>>>>> 1) Adapt the current tests to when acpi-pcihp=on becomes the default (hence the addition
>>>>>       to them of "acpi-pcihp=off".
>>>>
>>>>
>>>> that's what I disagree with.
>>>>
>>>> 1) Instead adapting majority of tests to legacy before switching defaults,
>>>> just do whitelist/modify default/update so all of tests run with new default.
>>>>
>>>> and then
>>>>   
>>>>> There is also the need to update the blobs, but it's because
>>>>>       of the _OSC method change in DSDT table, which will change anyways, even with "acpi-pcihp=off¨,
>>>>>       hence the need for patch 10/25 in this series. This is _done is this series_.
>>>>
>>>>   
>>>>> 2) Add a new test for testing the default (i.e. acpi-pcihp-on). It follows what you're
>>>>>       saying above: "follow whitelist blobs/set new default patch/update blobs pattern",
>>>>>       because we can drop the acpi-pcihp-on option from the CLI in this test without any
>>>>>       prejudice to test. While the step "set new default patch" was actually done in 1).
>>>>
>>>> 2) add a separate test case for native pcie hoplug (preferably within this series)
>>>>
>>>> 3) even better would be to add #2 before #1 (right after 10/25),
>>>> this way will guarantee that old native hotplug tables stay
>>>> the same regardless of followup patches that add ACPI pcihp aml.
>>>
>>> Got it now, hopefully... 🙂
>>>
>>> OK, I'm trying to follow what you recommended in 3). I've pushed a series to:
>>>
>>> https://github.com/gromero/qemu/commits/v2_20250527_eric_auger_redhat_com/
>>>
>>> So, I understand we will need to add/update the blobs at three times,
>>> 2 times because of the changes in the DSDT generation (_OSC changes and when
>>> acpi-pci=on) and an additional one because of the new PCIe native hotplug test.
>>>
>>> I dropped this patch (Patch 24/25) from the series.
>>>
>>> So the overview of the organization would be the following:
>>>
>>>
>>> 3c302f7222 tests/qtest/bios-tables-test: Update DSDT blobs                                   #1c (update blob)    \
>>> 671f15f470 hw/arm/virt: Use ACPI PCI hotplug by default                                      #1b (modify default) |--- acpi-pcihp=on
>>> 9468f730e1 tests/qtest/bios-tables-test: Prepare for changes in the DSDT table               #1a (whitelist)      /
>>> c9ec0e0226 hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
>>> dc44749a34 hw/arm/virt: Let virt support pci hotplug/unplug GED event
>>> f667079260 hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
>>> 46731e563b hw/acpi/ged: Support migration of AcpiPciHpState
>>> 4fa7b0e0f6 hw/acpi/ged: Call pcihp plug callbacks in hotplug handler implementation
>>> 587b001876 hw/acpi/ged: Prepare the device to react to PCI hotplug events
>>> b55183d128 hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI hotplug
>>> fe4c96b384 hw/i386/acpi-build: Move aml_pci_edsm to a generic place
>>> 010c50dbc7 hw/i386/acpi-build: Introduce and use acpi_get_pci_host
>>> 5a1be727e6 hw/i386/acpi-build: Move build_append_pci_bus_devices/pcihp_slots to pcihp
>>> 14a172e192 hw/i386/acpi-build: Move build_append_notification_callback to pcihp
>>> 5110ae8874 hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
>>> 82c2aef672 hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
>>> 6372fe7eef qtest/bios-tables-test: Update DSDT 'noacpipcihp' variant blob                    #2 (blob update for test), part 2 of 2 (update blob)  ]--- New PCIe native test
>>> 6fb29ba18d tests/qtest/bios-tables-test: Add aarch64 PCIe native hotplug test                #2 (pcie native hp test), part 1 of 2 (whitelist)     /
>>> 12c63a505e tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change            Patch 10/25 in this series (update blob)    \
>>> 779bd47749 hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method                       Patch  9/25 in this series (modify default) |--- _OSC change
>>> f260fd59c1 tests/qtest/bios-tables-test: Prepare for changes in the DSDT table               Patch  8/25 in this series (whitelist)      /
>>> b000677fd9 hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
>>> a72f87b634 hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine downto gpex
>>> 77a87b6ba3 hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
>>> 67e4dc2e7b hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
>>> b89e69da54 hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
>>> 74f1080a74 hw/arm/virt: Introduce machine state acpi pcihp flags and props
>>> 1048082f33 hw/i386/acpi-build: Make aml_pci_device_dsm() static
>>>
>>> See notes on the right for when the blobs are updated or added in the
>>> series. The new test for PCIe native hotplug (I prefer not calling it legacy,
>>> since it's not really legacy; it's just an alternative better in some scenarios,
>>> specially in virtualization) is now in the series (#2), "right after 10/25".
>>>
>>> Is something like that that you want?
>>
>> Igor, just a friendly ping on it. It would be quite helpful for us if you could
>> confirm I'm following what you recommended regarding the tests for this series.
> 
> spirit of above looks fine,

Thanks for confirming it.


> as for actual patches, it would depend on chosen default.
> Lets' see what submitted v3 would look like.

Agreed. Yep, I can adapt the tests the other way, depending on
the final chosen default. Let's way v3 ;)


BTW, why did we ultimately choose to commit blobs instead of the actual ACPI
code (as generated by iasl)? I'm just wondering if we could avoid committing
the blobs to 1) avoid committing binaries and 2) have the changes in the
ACPI code in the same commit that changes the ACPI itself.

If that's only for historical reasons maybe I can improve the bios-tables-test.c
to handle the ACPI code/struct in text format, avoiding the blobs, so I ask.

Thanks!


Cheers,
Gustavo

>>
>>
>> Thanks,
>> Gustavo
>>    
>>>
>>> Cheers,
>>> Gustavo
>>>    
>>>>   
>>>>> Cheers,
>>>>> Gustavo
>>>>>   
>>>>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
>>>>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
>>>>>>>
>>>>>>>
>>>>>>> Cheers,
>>>>>>> Gustavo
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
>>>>>>>>> ---
>>>>>>>>>      tests/qtest/bios-tables-test.c | 13 +++++++++----
>>>>>>>>>      1 file changed, 9 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>>>>>>>> index 0a333ec435..6379dba714 100644
>>>>>>>>> --- a/tests/qtest/bios-tables-test.c
>>>>>>>>> +++ b/tests/qtest/bios-tables-test.c
>>>>>>>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>>>>>>>>          };
>>>>>>>>>          data.variant = ".memhp";
>>>>>>>>> -    test_acpi_one(" -machine nvdimm=on"
>>>>>>>>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>>>>>>>>                        " -cpu cortex-a57"
>>>>>>>>>                        " -m 256M,slots=3,maxmem=1G"
>>>>>>>>>                        " -object memory-backend-ram,id=ram0,size=128M"
>>>>>>>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>>>>>>>>>          };
>>>>>>>>>          data.variant = ".numamem";
>>>>>>>>> -    test_acpi_one(" -cpu cortex-a57"
>>>>>>>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>>>>>>>> +                  " -cpu cortex-a57"
>>>>>>>>>                        " -object memory-backend-ram,id=ram0,size=128M"
>>>>>>>>>                        " -numa node,memdev=ram0",
>>>>>>>>>                        &data);
>>>>>>>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>>>>>>>>           * to solve the conflicts.
>>>>>>>>>           */
>>>>>>>>>          data.variant = ".pxb";
>>>>>>>>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>>>>>>>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>>>>>>>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>>>>>>>>                        " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>>>>>>>>                        " -drive file="
>>>>>>>>>                        "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>>>>>>>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>>>>>>>>          data.variant = ".acpihmatvirt";
>>>>>>>>> -    test_acpi_one(" -machine hmat=on"
>>>>>>>>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>>>>>>>>                        " -cpu cortex-a57"
>>>>>>>>>                        " -smp 4,sockets=2"
>>>>>>>>>                        " -m 384M"
>>>>>>>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>>>>>>>>          data.smbios_cpu_max_speed = 2900;
>>>>>>>>>          data.smbios_cpu_curr_speed = 2700;
>>>>>>>>>          test_acpi_one("-cpu cortex-a57 "
>>>>>>>>> +                  "-machine acpi-pcihp=off "
>>>>>>>>>                        "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>>>>>>>>          free_test_data(&data);
>>>>>>>>>      }
>>>>>>>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>>>>>>>>          };
>>>>>>>>>          test_acpi_one("-cpu cortex-a57 "
>>>>>>>>> +                  "-machine acpi-pcihp=off "
>>>>>>>>>                        "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>>>>>>>>          free_test_data(&data);
>>>>>>>>>      }
>>>>>>>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>>>>>>>>          };
>>>>>>>>>          test_acpi_one("-cpu cortex-a57 "
>>>>>>>>> +                  "-machine acpi-pcihp=off "
>>>>>>>>>                        "-device virtio-iommu-pci", &data);
>>>>>>>>>          free_test_data(&data);
>>>>>>>>>      }
>>>>>   
>>>>   
>>>    
>>
> 
