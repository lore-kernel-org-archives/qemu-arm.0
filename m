Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2542118njh;
        Sun, 1 Jun 2025 22:35:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHu03svXj+37lB7LqkAVZZDKgWDeJGcxEY4Knz7MDvP2OqukO6SLdXnC/w70ldBWYwjJJuQtznrrLe5Q==@linaro.org
X-Received: by 2002:a05:6122:3c93:b0:52a:ee1a:4249 with SMTP id 71dfb90a1353d-530810a4c4dmr9673658e0c.7.1748842554275;
        Sun, 01 Jun 2025 22:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748842554; cv=none;
        d=google.com; s=arc-20240605;
        b=O9K8MCbPghJ1otFZzdVQCcueQV+IuPHkDqzS/FbbPCoe9/JY83GYH+NNgP7izRuVj6
         qlYj8mWRa1qnwJcl6rzLEesfbCwGF08eLRl/muAYvnojgwA6Ypo8AQ6XiW9fDtye9KBt
         RsT4a+lD+zV9wLF9BAgr74/Xp0EajMXrnCELxZZcmULsHbfee0otLRydYSIKJbF7loWm
         kksrLw+zmQAeGxHEXyGk4BE8JMXyewTFSuwopw0Dil65N13LP8epGBDtfpGLR4YwPiXQ
         3/3Dw1tcBdU51XenNNw8nFPUOKjb1PoTbPDSwW8tBusFu1PS5AP4PWJwmItJWLvlokMi
         4sfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C1S/0fOd3Ua61BjaNhpLqiG5aY32cQFtFDl5eGP+t9A=;
        fh=ErS193q2rckfdAuDclYt1AVLLBZ3uLTZqmwzpdgYQzQ=;
        b=FEwZJLLcEYyMGJ1qHts32n+9Iz4wnwwNpYMrvwg6KoXh/IYRjRFSJ7B1IJHrtUWzaZ
         3V5Qmxhwd1yB6s9Sg66pZ3uKBaAMBSceXEjk+ASI3++/o1szRU7UGSDu4lqmt42ySmAw
         oplgqfLtm7BKTXtPgBa7YZlgawW3zoBR4KMoyiYruNnmTLtXfyzHf0OhZnhJIPoToZJf
         esMqF8wikvpmUQnZpZBrBdvg3qYeiym662r57h8isQKT65vwKUXvhsh+Ypq2juCHAue3
         NQCB9sBi1+LETHoXiCK+MfPn7mQkEuJUcmiu4tef1FvOyspNkFrVdUmY0hXjRAyAJbxx
         wv3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O0wfvcsI;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-53076042fa3sor903026e0c.1.2025.06.01.22.35.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Jun 2025 22:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O0wfvcsI;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748842554; x=1749447354; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1S/0fOd3Ua61BjaNhpLqiG5aY32cQFtFDl5eGP+t9A=;
        b=O0wfvcsI+PrVX5Bli9liVcNjuOyFRUZMxoFopYK3PF5pmLDojMSaVgWb+jyDPxlaB0
         6eArDNqOTaDZovBdVu0b9Pl7p82mC4LaNAZWAXl37QCKAyOYXzu7UCoAhQ2sJDY4/Kiu
         idiUonpULmEOYaTECvqyL32vwjh3Prb/BvFSX1nMXMP5oRwCYbyTSD+DuA0Sv3HaG5C6
         cpXxbTcPNGobEQdfpO2nDEld0a9mJo7UEcVNyFAeGED/HVsDBDXfHzQhNVZWV4jBLRsu
         9W68S1XI4FT7ez7b1FACeTy7sSugsa5YFB43VjQ0LMI1Tw6zqNI99qmlIQND6QqbQ7Bh
         QBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842554; x=1749447354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1S/0fOd3Ua61BjaNhpLqiG5aY32cQFtFDl5eGP+t9A=;
        b=UUSWHnaM+bHlEwdLX+2/+l9aZQvOHSNJrC/D7CGAIZfxvVqJ9OwtNraSApOAYqkt8Y
         3eXT/VOc01c4HAfNn/tJPGJfGCpxI856uXYV6bx43Hr7HyUfavrOM3dwUWVqsGInEmSE
         l6CSnybw89RjyPclsBEc37k26x9KW/BvBC7eNQl1sfGGq2WOXeFdimVsvB9MSc3H7sZh
         XOt+aJ8ShEXWk9ZVdz7a65GucT5TrwWXEe8L2W3dm+KYWDavvHuCPTcu8rZYk6DVpsKx
         P+9yQiIKtVi9W3DXf4pAJkhZaY8yxLGBYSXXZIn9KPgokhOrV10jWFYgUkdiFOLjUmA0
         J9jA==
X-Forwarded-Encrypted: i=1; AJvYcCVWRybB3RWZBKGO09Wlxk2k6/Y6hOHTSH3bX78djuctungGqybqIttfroOC6mEjl/dWH5k14GprvTcjbA==@linaro.org
X-Gm-Message-State: AOJu0YwOh7MnR2+4HABMr/T1pYPGLcenSSxTSQHZ54+ctUEkp8TBiHkK
	ctKY4MMVDcS5Z9z4I4sy+UtZWH86dpBYMfXvKvkt3Pw0Q0a3Y9t1JCqUTwkJ+k/ioWuyqg==
X-Gm-Gg: ASbGnct9C7G9JHgQ38y40LWynV0X9435waAoo3CVsk7NggwrIESzuY38Eyhudsc8ZTM
	MJDeM1XQBT3lYese5J9I4txK0sCm67QwrZDT3xUBsN8MeqtuDZu3MalTDyjpZvIAvZzLuatflDC
	boXGnuRHtjix9vh97eOdQwpQJN+DCCu7dZH0HpdBRaSKp9m84t5DOnumx7+U4Zvlr/0ub0dWB5U
	q9TOi8Q9nI20HU3XYrF/FNOqcQW39lvK+gt0MlC8g2gUAlw/Q9UCVoIiI92ZzRNRCZlMRvUgh/t
	hoJNF8Pg4L9h724lt/ULWRWCGQ5ss3uXSxLsDOdo5wFYqBATsyjcQcnSnMbfkOftMA==
X-Google-Smtp-Source: AGHT+IHgrMZYqPtdotygkP0NHs7OLI1mMRROu42ciHffjOiejGaqv5UflpVp3mNFK2xImt6XPBJreQ==
X-Received: by 2002:a05:6122:790:b0:52a:7787:53d7 with SMTP id 71dfb90a1353d-5308109f849mr9736745e0c.6.1748842553629;
        Sun, 01 Jun 2025 22:35:53 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([179.180.194.137])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074c31c38sm6942465e0c.40.2025.06.01.22.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:35:52 -0700 (PDT)
Message-ID: <a60b8909-1519-4de7-9aa1-3802065f5bb5@linaro.org>
Date: Mon, 2 Jun 2025 02:35:52 -0300
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
X-TUID: 2k++xPxksgqn

Hi Igor and Eric,

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

Got it now, hopefully... :)

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
