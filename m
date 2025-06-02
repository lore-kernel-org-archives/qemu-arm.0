Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2551180njh;
        Sun, 1 Jun 2025 23:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoXBqBRv/N5RFdV7e18Zez6/W7YY+s4Jbvxj9+T43rDhzS00uT9NmBwzncDw6xL5ANj2LNQLUK8sXWIw==@linaro.org
X-Received: by 2002:a17:902:e849:b0:234:b123:b4ff with SMTP id d9443c01a7336-2355f7832e1mr111087365ad.21.1748844405628;
        Sun, 01 Jun 2025 23:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748844405; cv=none;
        d=google.com; s=arc-20240605;
        b=bSu99I5YJ7h+qnWSyDgXW9c/GrAzeB1ksT9YK1lEDTV5Yttn8FRplSW235aOQq0mX8
         ckxoBx3aWXQE+EhubXQMmcWvquaf736xS3/K3NBMzFKb4k9tkV7XADEaI+tmPU4MINNx
         2bCF9k1dsKTAYolUVgGAFcqC+4WfvF59BqnPbtS9+R1XBpR5nR3xF3VVSU+yyUsYg1By
         b0p+j1lPfdaWWDjsl+A6unT5T176831777X4+WmgoMPzRNBScz21hjaXDZQcUC96xuo4
         Pp6InYUTOp/ruWmSSRHHnZCgU1NRmPCkm+iTw1nBd1o0EvP7IGbkZEqRv/lWokZZPRzJ
         CAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aHTXPgGA2wdX75p9zmNZ2DjomHcJ6l/Odzw5Xjzr2XE=;
        fh=8rk9nsXnNpnKqm2ECWXa6mmW3VCRHDOZvHLL1gVWq4Y=;
        b=kikZK06+W1WAtnX4Sp+QOmghOetYJKkcNzu9mXNZC9QJYDAvFFmTUy3uhOYE9hWvab
         zfCM7QUA3RdqfPBKuUctP9WxzVulXwgl6AbG1+mVvLwGhTQAyP6vLBGHPkaMGyGt0f9M
         2J61Z34xinGwIRCa0rt9fGK9ziFuDSKJqgjZrWl4My9b4uAvVDuN8Z+JsEDx26tsSQv+
         zowlShYkOqTROiLh9MUUyXfTSVItLtj7oWM8HvFLmsO5m/T7+tYot+qVPiimthMGlSlS
         1gpq5RNvTRNCW0a4YTAvlwzo5XuPols8C34vWlE4uf1FO40M6wLnqbmTFnVA7cKMBvoB
         5eUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VxtGJxli;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23506c031a6sor65553055ad.10.2025.06.01.23.06.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Jun 2025 23:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VxtGJxli;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844405; x=1749449205; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHTXPgGA2wdX75p9zmNZ2DjomHcJ6l/Odzw5Xjzr2XE=;
        b=VxtGJxlivUW23bZPuVFR/KxuQKZkQo4rFJyZei/HMj4jxvOTDKnKCg4LllurM24ALq
         qMBVP5UOBZVhW4/ZLzR0U2PbWZdW0wxiAQsSQRGEKF8xodohWmDlaxnVyfGtqR7J7mCI
         HxigSPZ7w66udDqGDrzS53g4URcIME1USvBQ4bHNxWL5I4B4iTDmx3Adb2zfcoGGEx2k
         JOxEWpnvKU8dekaUo42ttghPd/0Wo/MUnWNchf+olzm+Zh3ruQgCXtwYP69actoPDCbH
         Xp0IATrXoG5vWh58205fn8ME7bHPFZ8oZz9HEYvYgcT5ersHSaU4OzHvY/Mmwml6BEJl
         qwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844405; x=1749449205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHTXPgGA2wdX75p9zmNZ2DjomHcJ6l/Odzw5Xjzr2XE=;
        b=DRGjotEX7QcmSgOBdjAtI+gTp23gw4DUMpwVz3fYnWF3z+73vyQZOsDNYDA51XoB+O
         HE25lm09HhZfA1mDW1fJo0sljQQkUa0124nsssqTbtrfF+MDNsqh80m0axDgPsssBavt
         9Yn5QKe68YA6vDGzBKxXadCDgY9hn8BuC1CiCHL92I3wZ43ky+TUVFOT0UGaH1L0bqRG
         CnyCNEPZl6M7MSX4dd7R/wqaRu8i5JSaMCawYUc9RxRO47xfkmmcFd7rN8B01FpnNbns
         OENe07oYy8rnRXo/+M/2Xao42H+8EwI2v1CkrolonjanLA3XwAbhF81VulL2Wnw6Cc+V
         peQw==
X-Forwarded-Encrypted: i=1; AJvYcCUF4AXGJc42VfTgffpJ4JJmBF7yvMP5e76Jzdq6faxXp/H7XC+EaSnxZe1rIh07u/6G7qbWZip7eajJHA==@linaro.org
X-Gm-Message-State: AOJu0YyyC9OdoYLn2dlgRAiT0I4thg0ZSy7PQfFGj/8jkBxX2TKSHno6
	/s7xmkT+/cG+e2oXqmvXTdo/2PF+SISJnq6TZTXP2F/sS3750VR+3BYNBr93NEd+ii0cJg==
X-Gm-Gg: ASbGncuf/5arfwBmtW9TcAWS29F4L/HrNq7fvHGa0OKYWflQy+RCMU+kp6HZ5YKmkWB
	Wqg4L2lIueTmVA4Zoa8+Hd86lLt1/xIu/VoV1zEcob62vxF/wh4Dm1FPMPnEYYxKpgMs/UymwZ1
	rrCOoL7HgjHPhen2ajpGNPhFBHQyo/CpOVNE+fko0xO+B4lyxFUTuG/yAvwh5gWlBWqO65XSY1G
	vXNrT44iNGJWfZlsOHgXGt8eCSBphSTzkD6zvsfSbMU3vRCm37J8gyMsTyN7HsAvj9qYin6G1Dq
	T7q9tpN7pxCY1XCY3jBqEkNklVIOhUiX2wsdXYKzjNPQb6+r4illa+wtPza0HU8D1g==
X-Google-Smtp-Source: AGHT+IHWUk0o0pKbZyfVxstlnev21S1gv4U7dOIdpKLtQp67t5byhlEL6GTnvsGaJO9+Ek2FpIuDrQ==
X-Received: by 2002:a17:903:41d0:b0:234:d292:be83 with SMTP id d9443c01a7336-2355f766d59mr113903425ad.10.1748844405057;
        Sun, 01 Jun 2025 23:06:45 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([179.180.194.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5411sm63730525ad.188.2025.06.01.23.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 23:06:44 -0700 (PDT)
Message-ID: <bcc200fb-fa45-44ac-9e36-4c829becbf1c@linaro.org>
Date: Mon, 2 Jun 2025 03:06:45 -0300
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
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250530135103.09030cf0@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bl6HE/wlF69T

Hi Igor and Eric,

I'm sending again this to the mailing list since it seems the first one
got lost... I can't find it either in qemu-devel@ or in qemu-arm@ :(

On 5/30/25 08:51, Igor Mammedov wrote:
> On Wed, 28 May 2025 12:04:26 -0300
> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> 
>> Hi Igor,
>>
>> On 5/28/25 10:02, Igor Mammedov wrote:
>>> On Wed, 28 May 2025 09:41:15 -0300
>>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>>    
>>>> Hi Igor,
>>>>
>>>> On 5/28/25 06:38, Igor Mammedov wrote:
>>>>> On Tue, 27 May 2025 09:40:26 +0200
>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>       
>>>>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>>
>>>>>> ACPI PCI hotplug is now turned on by default so we need to change the
>>>>>> existing tests to keep it off. However, even setting the ACPI PCI
>>>>>> hotplug off in the existing tests, there will be changes in the ACPI
>>>>>> tables because the _OSC method was modified, hence in the next patch of
>>>>>> this series the blobs are updated accordingly.
>>>>>>
>>>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>
>>>>> it would be better to test whatever default we end up with.
>>>>> (like x86)
>>>>
>>>> hmm maybe there is a confusion here, Igor. We are actually planning what you
>>>
>>> perhaps, see my reply to Eric about my expectations wrt tests.
>>
>> Yip, I read it before my reply here.
>>
>>
>>> (i.e. default tests shouldn't have any explicit CLI options,
>>> instead it should follow whitelist blobs/set new default patch/update blobs pattern)
>>
>> I see. I agree with that. But this patch is not about the new test. The new test is
>> _not_ in this series. Patches 8/25, 10/25, and 24/25 are _not_ about the new test but
>> about adapting the _legacy tests_ (native acpi) to the situation when ACPI HP becomes
>> the default, because this series makes acpi-pcihp=on the default, hence the CLI option
>> "acpi-pcihp=off" added to them. An update to the blobs are also necessary because of the
>> change in _OSC method, even when acpi-pcihp=off.
>>
>>
>>>> said. This patch and the other two in this series related to the bios-tables-test
>>>> (i.e., patches 8/25 and 10/25) are for actually making the current (legacy) test pass,
>>>> since the new default as per this series will be acpi-pcihp=on. That's why here we're
>>>> adapting the current test here to have acpi-pcihp=off.
>>>>
>>>> The new test that will test for acpi-pcihp=on (the new default) is not in this series
>>>> and we decided to merge it separate. It's in the patch 4/5 and 5/5 of the follow series:
>>
>> We're doing the "blobs/set new default patch/update blobs pattern" in the new test, which
>> we can merge later, once this series is merged, no? The step "set new default" then will
>> not be necessary because the new test will be merged separate, after this series, so when
>> acpi-pcihp=on is already the default.
>>
>> Please note that although we're using acpi-pcihp=on in the new test, it's not necessary,
>> we can dropped this option, making it implicit as you say, and it will work. This is the
>> new test:
>>
>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
>>
>>
>> Thus, there are to "acts" of modifying the bios-tables-test:
>>
>> 1) Adapt the current tests to when acpi-pcihp=on becomes the default (hence the addition
>>      to them of "acpi-pcihp=off".
> 
> 
> that's what I disagree with.
> 
> 1) Instead adapting majority of tests to legacy before switching defaults,
> just do whitelist/modify default/update so all of tests run with new default.
> 
> and then
> 
>> There is also the need to update the blobs, but it's because
>>      of the _OSC method change in DSDT table, which will change anyways, even with "acpi-pcihp=off¨,
>>      hence the need for patch 10/25 in this series. This is _done is this series_.
> 
> 
>   
>> 2) Add a new test for testing the default (i.e. acpi-pcihp-on). It follows what you're
>>      saying above: "follow whitelist blobs/set new default patch/update blobs pattern",
>>      because we can drop the acpi-pcihp-on option from the CLI in this test without any
>>      prejudice to test. While the step "set new default patch" was actually done in 1).
> 
> 2) add a separate test case for native pcie hoplug (preferably within this series)
> 
> 3) even better would be to add #2 before #1 (right after 10/25),
> this way will guarantee that old native hotplug tables stay
> the same regardless of followup patches that add ACPI pcihp aml.

Got it now, hopefully... 🙂

OK, I'm trying to follow what you recommended in 3). I've pushed a series to:

https://github.com/gromero/qemu/commits/v2_20250527_eric_auger_redhat_com/

So, I understand we will need to add/update the blobs at three times,
2 times because of the changes in the DSDT generation (_OSC changes and when
acpi-pci=on) and an additional one because of the new PCIe native hotplug test.

I dropped this patch (Patch 24/25) from the series.

So the overview of the organization would be the following:


3c302f7222 tests/qtest/bios-tables-test: Update DSDT blobs                                   #1c (update blob)    \
671f15f470 hw/arm/virt: Use ACPI PCI hotplug by default                                      #1b (modify default) |--- acpi-pcihp=on
9468f730e1 tests/qtest/bios-tables-test: Prepare for changes in the DSDT table               #1a (whitelist)      /
c9ec0e0226 hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
dc44749a34 hw/arm/virt: Let virt support pci hotplug/unplug GED event
f667079260 hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
46731e563b hw/acpi/ged: Support migration of AcpiPciHpState
4fa7b0e0f6 hw/acpi/ged: Call pcihp plug callbacks in hotplug handler implementation
587b001876 hw/acpi/ged: Prepare the device to react to PCI hotplug events
b55183d128 hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI hotplug
fe4c96b384 hw/i386/acpi-build: Move aml_pci_edsm to a generic place
010c50dbc7 hw/i386/acpi-build: Introduce and use acpi_get_pci_host
5a1be727e6 hw/i386/acpi-build: Move build_append_pci_bus_devices/pcihp_slots to pcihp
14a172e192 hw/i386/acpi-build: Move build_append_notification_callback to pcihp
5110ae8874 hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
82c2aef672 hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
6372fe7eef qtest/bios-tables-test: Update DSDT 'noacpipcihp' variant blob                    #2 (blob update for test), part 2 of 2 (update blob)  ]--- New PCIe native test
6fb29ba18d tests/qtest/bios-tables-test: Add aarch64 PCIe native hotplug test                #2 (pcie native hp test), part 1 of 2 (whitelist)     /
12c63a505e tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change            Patch 10/25 in this series (update blob)    \
779bd47749 hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method                       Patch  9/25 in this series (modify default) |--- _OSC change
f260fd59c1 tests/qtest/bios-tables-test: Prepare for changes in the DSDT table               Patch  8/25 in this series (whitelist)      /
b000677fd9 hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
a72f87b634 hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine downto gpex
77a87b6ba3 hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
67e4dc2e7b hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
b89e69da54 hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
74f1080a74 hw/arm/virt: Introduce machine state acpi pcihp flags and props
1048082f33 hw/i386/acpi-build: Make aml_pci_device_dsm() static

See notes on the right for when the blobs are updated or added in the
series. The new test for PCIe native hotplug (I prefer not calling it legacy,
since it's not really legacy; it's just an alternative better in some scenarios,
specially in virtualization) is now in the series (#2), "right after 10/25".

Is something like that that you want?


Cheers,
Gustavo

> 
>> Cheers,
>> Gustavo
>>
>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
>>>>
>>>>
>>>> Cheers,
>>>> Gustavo
>>>>   
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
>>>>>> ---
>>>>>>     tests/qtest/bios-tables-test.c | 13 +++++++++----
>>>>>>     1 file changed, 9 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>>>>> index 0a333ec435..6379dba714 100644
>>>>>> --- a/tests/qtest/bios-tables-test.c
>>>>>> +++ b/tests/qtest/bios-tables-test.c
>>>>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>>>>>         };
>>>>>>     
>>>>>>         data.variant = ".memhp";
>>>>>> -    test_acpi_one(" -machine nvdimm=on"
>>>>>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>>>>>                       " -cpu cortex-a57"
>>>>>>                       " -m 256M,slots=3,maxmem=1G"
>>>>>>                       " -object memory-backend-ram,id=ram0,size=128M"
>>>>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>>>>>>         };
>>>>>>     
>>>>>>         data.variant = ".numamem";
>>>>>> -    test_acpi_one(" -cpu cortex-a57"
>>>>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>>>>> +                  " -cpu cortex-a57"
>>>>>>                       " -object memory-backend-ram,id=ram0,size=128M"
>>>>>>                       " -numa node,memdev=ram0",
>>>>>>                       &data);
>>>>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>>>>>          * to solve the conflicts.
>>>>>>          */
>>>>>>         data.variant = ".pxb";
>>>>>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>>>>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>>>>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>>>>>                       " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>>>>>                       " -drive file="
>>>>>>                       "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>>>>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>>>>>     
>>>>>>         data.variant = ".acpihmatvirt";
>>>>>>     
>>>>>> -    test_acpi_one(" -machine hmat=on"
>>>>>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>>>>>                       " -cpu cortex-a57"
>>>>>>                       " -smp 4,sockets=2"
>>>>>>                       " -m 384M"
>>>>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>>>>>         data.smbios_cpu_max_speed = 2900;
>>>>>>         data.smbios_cpu_curr_speed = 2700;
>>>>>>         test_acpi_one("-cpu cortex-a57 "
>>>>>> +                  "-machine acpi-pcihp=off "
>>>>>>                       "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>>>>>         free_test_data(&data);
>>>>>>     }
>>>>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>>>>>         };
>>>>>>     
>>>>>>         test_acpi_one("-cpu cortex-a57 "
>>>>>> +                  "-machine acpi-pcihp=off "
>>>>>>                       "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>>>>>         free_test_data(&data);
>>>>>>     }
>>>>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>>>>>         };
>>>>>>     
>>>>>>         test_acpi_one("-cpu cortex-a57 "
>>>>>> +                  "-machine acpi-pcihp=off "
>>>>>>                       "-device virtio-iommu-pci", &data);
>>>>>>         free_test_data(&data);
>>>>>>     }
>>>>>       
>>>>   
>>>    
>>
> 
