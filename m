Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2554611njh;
        Sun, 1 Jun 2025 23:16:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaibBFs63wWmXQKXlfhSn0dHYHa0/TDhQgkw9mEtJzjf4MMGxgWZ4d6Ei9z84kZkQD3BQ8mS5mfM0Ztw==@linaro.org
X-Received: by 2002:a05:6102:e0c:b0:4e5:ab65:6bf3 with SMTP id ada2fe7eead31-4e6e40f6e39mr10328803137.9.1748844997082;
        Sun, 01 Jun 2025 23:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748844997; cv=none;
        d=google.com; s=arc-20240605;
        b=amKFsH/fg9qZQdmlo1wbNu8lNXUlZ2J7WWHZA/OP8WeBtFN7hZ/PTuJ/twvcg1mF8e
         7xji2Krr8rTE5gL29S+6H/noocpgEJKrQ7RAo/mKXOecff4DU1Wqn0jtLwLdnUJC+oTC
         0oyaV76aZ/5CcnPwrNRLywxwps3PP9u4e0RTbyVHgZIshWCAtygQJpKP25aNQytuuLA+
         6Rqyy8At+CmcvDuLNlUjU3of67F0Pfz336DF2Tix2vqq+NxfP+eymcnuCZF1ov/alsmV
         HMO52b7knHxfRu8revH9k0TqE7znmAoV07FV6KSezrmJacfKiyznQwcYH9gWM0MlRGzB
         JF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jPdsnRY5+Vx+B0EseW1kn4hEuKxtA+cyMPZCTOqyPyA=;
        fh=psWFmbDq+a7H/0z/vDTC1oKWh3ZYuo2k5eAP4DiXXlw=;
        b=X3rHqye8D6LWaVGJzFC+3qELugDD6ltQButZDXN7RBZ+3UxF1ZHJJSiylXoVP+f9Ts
         fWjBE85g5sqaRHi9v9sxFWtFslKDpsgTX1QOU3JyB6L2OJUCQJk4h7g9o8AL5FmUOXEg
         cDCR4V9le8FpZ9hHzG6kBWt73xhLmM7Ji0gaXlGmByaHCxlz0MBBf532Nrp9Nj//CAxh
         1sqqCsTXp6ACnlnDnD2CU/hHHMeck9PQkEfOfczrpKPHcfB/uUiTP9Q26DN4WGoDKWH1
         IgIi7jGIgWdjblAhMIDjkoppWo+gbWoWkuMs+6adzkHacnvdvsvYKR7qXHPOaRKgSozz
         5E7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ME243QIZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4e6a3335ad9sor3785446137.10.2025.06.01.23.16.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Jun 2025 23:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ME243QIZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844996; x=1749449796; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPdsnRY5+Vx+B0EseW1kn4hEuKxtA+cyMPZCTOqyPyA=;
        b=ME243QIZ2Rsv8q/SCQejTdqufuvAd/hZym52HMS+Dnj2IDBrGFc8R27H+DEtBYMPzp
         NoSAQf9JIJ8LV+/Gl+nDQ22uez2VrsvHMUtbAKwYOleC6buH4+f7rHJ2lmwws1wPWqq4
         b6jRdFNlcwK+7xht1JUR+ojIcgpvMkE0314ccHg7KEaCdRfx862VhL8SpgJYNmVzpmqm
         7adWQReIalXG1ztM78NjCrH0gQU4+sBZxooCyih0oqdaLWcJyP8c5MXhCSuNztvWj86H
         A6ODMpiDy1bwEIQ9CrRqCFl3omgoWbsBPdFXAa1/KRJ7lTXqT8/O9Fej4xKFC4BX6oXM
         6P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844996; x=1749449796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPdsnRY5+Vx+B0EseW1kn4hEuKxtA+cyMPZCTOqyPyA=;
        b=fO22h/a4rp2p9fdE/FUUKeKyBkXXaeDHbw1IZpMO/KUx42Iwses943K3xKUvzuAvbA
         Ijd6pLxzu0vfJCTblGBhtUy1oeMOfDxIyAfoMVru2ZvrW2m2NVg+gVG6kbVE02IO+Qpm
         wL/KZ2ejpFMsSoUdlUHMFsWzOenwNQnieMo3sHjF77uEG8bEvg2ahtbCGfapkDWerq8g
         wg6U08cFmrB7SxYFXiS8sv8H7BenpuGGKTg+GVDnJDIhCnhWlngafG8+Kx+C4pzwvphA
         iiRBzFPY9IKFYlKtQLvaVV7zUfc8WmDV2/QKgV1P1xW3D/ZB6r1h+gEDQ4ks+j6iItE0
         uhPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmIy/0hpse9xEuu1yBVlJITT9UXX3S/r+4Dn52RnkP6E8ynbda/5Gs4IY9/Sm9vFXU1Pla4GxjweIObQ==@linaro.org
X-Gm-Message-State: AOJu0YxU9wGnL/t5+JN2is+KnmN6utD8tzVMcErHJzYRw4qnuVQQqAXh
	sITF+W2gxcDnfYx4GPdh06xl/rrqWvm4G7+6Vm0C8xbiwfpm7235kgV6s5fIYC3MvSHDBg==
X-Gm-Gg: ASbGncuSZXmUaFSueSUUK5GzGhJnwNk4ttEcDHh5OODEq5WRjpZA/iL3csUz7b+DpQX
	Z8eIBK6PVakvs1D8gh0Qq0aTX0l0Y2/K9KPVR0zP8znF+ys9Ld1FK94bwlCkRoq45fJc8xAxu9m
	faBUEbKeHRKcRvWVWzKoUrnKeHlIkJV1SMACEamG5AGQPn6frWBAH54sN+/xrNroVSqIQCNn8li
	OfwKwRm8ItzxBcZgTUHLyh7E9hhHB5jKNpxaGIItNuzYdKPZyVOaxWgPoKnPbwAvzjryEnQQ0/6
	wKBsrZL3/suxpWesjJT63eJciRNnCzeQUtR2WyMnKpWMw/IK5UZadfKpwzwyn+abiw==
X-Google-Smtp-Source: AGHT+IFdnPEJWTCb5wsXdXvdoOdB501kThHqOiB6OQn7+PTm7RElBHoxTB+v4YKVslukJyWphxK4yA==
X-Received: by 2002:a05:6102:cd3:b0:4e5:fe5e:2be4 with SMTP id ada2fe7eead31-4e6e41d9351mr10517951137.22.1748844996624;
        Sun, 01 Jun 2025 23:16:36 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([179.180.194.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a2a4238sm5715521241.14.2025.06.01.23.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 23:16:36 -0700 (PDT)
Message-ID: <09cc2688-ef7f-4dd6-a4ed-a18adb07d35e@linaro.org>
Date: Mon, 2 Jun 2025 03:16:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
To: eric.auger@redhat.com, Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-25-eric.auger@redhat.com>
 <20250528113813.47086516@imammedo.users.ipa.redhat.com>
 <fd44ef37-ef02-4e60-817d-1362c76433b0@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <fd44ef37-ef02-4e60-817d-1362c76433b0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +f421UqrUmrr

Hi Eric,

On 5/28/25 06:48, Eric Auger wrote:
> Hi Igor,
> 
> On 5/28/25 11:38 AM, Igor Mammedov wrote:
>> On Tue, 27 May 2025 09:40:26 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>
>>> ACPI PCI hotplug is now turned on by default so we need to change the
>>> existing tests to keep it off. However, even setting the ACPI PCI
>>> hotplug off in the existing tests, there will be changes in the ACPI
>>> tables because the _OSC method was modified, hence in the next patch of
>>> this series the blobs are updated accordingly.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> it would be better to test whatever default we end up with.
>> (like x86)
> 
> See my question on patch 2's comment. We intended to have tests for both
> modes (legacy and acpi pcihp). Gustavo added some new tests for the new
> default, namely acpi pcihp. Now I did not really understand your point
> about keeping legacy mode as a default.

I _think_ I understood what Igor is suggesting. In a separate series, that
I've kept in a github branch to not add noise here, I removed the test for
acpi-pcihp=on and just added one for acpi-pcihp=off after we adjust the blobs
for the _OSC change. I added the test before acpi-pcihp=on becomes the default,
since if everything is ok the native test must continue to work after acpi-pcihp=on
becomes the default, as Igor said.

Anyways, please see my last reply to Igor in this thread (for some reason
I can't find the reply either in qemu-devel@ or qemu-arm@)... I'm pasting
below the main part just in case (the branch and the overview for the tests
location in the series):

https://github.com/gromero/qemu/commits/v2_20250527_eric_auger_redhat_com/

3c302f7222 tests/qtest/bios-tables-test: Update DSDT blobs                                   #1c (update blob)    \
671f15f470 hw/arm/virt: Use ACPI PCI hotplug by default                                      #1b (modify default) | acpi-pcihp=on
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
6372fe7eef qtest/bios-tables-test: Update DSDT 'noacpipcihp' variant blob                    #2 (blob update for test), part 2 of 2 (update blob)  ] New PCIe native test
6fb29ba18d tests/qtest/bios-tables-test: Add aarch64 PCIe native hotplug test                #2 (pcie native hp test), part 1 of 2 (whitelist)     /
12c63a505e tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change            Patch 10/25 in this series (update blob)    \
779bd47749 hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method                       Patch  9/25 in this series (modify default) | _OSC change
f260fd59c1 tests/qtest/bios-tables-test: Prepare for changes in the DSDT table               Patch  8/25 in this series (whitelist)      /
b000677fd9 hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
a72f87b634 hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine downto gpex
77a87b6ba3 hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
67e4dc2e7b hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
b89e69da54 hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
74f1080a74 hw/arm/virt: Introduce machine state acpi pcihp flags and props
1048082f33 hw/i386/acpi-build: Make aml_pci_device_dsm() static

Feel free to cherry-pick the tests and adjust them as you did before.

I'll be off this week returning on June 9.


Cheers,
Gustavo

> Thanks
> 
> Eric
>>
>>> ---
>>>
>>> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
>>> ---
>>>   tests/qtest/bios-tables-test.c | 13 +++++++++----
>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>> index 0a333ec435..6379dba714 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>>       };
>>>   
>>>       data.variant = ".memhp";
>>> -    test_acpi_one(" -machine nvdimm=on"
>>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>>                     " -cpu cortex-a57"
>>>                     " -m 256M,slots=3,maxmem=1G"
>>>                     " -object memory-backend-ram,id=ram0,size=128M"
>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>>>       };
>>>   
>>>       data.variant = ".numamem";
>>> -    test_acpi_one(" -cpu cortex-a57"
>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>> +                  " -cpu cortex-a57"
>>>                     " -object memory-backend-ram,id=ram0,size=128M"
>>>                     " -numa node,memdev=ram0",
>>>                     &data);
>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>>        * to solve the conflicts.
>>>        */
>>>       data.variant = ".pxb";
>>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>>                     " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>>                     " -drive file="
>>>                     "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>>   
>>>       data.variant = ".acpihmatvirt";
>>>   
>>> -    test_acpi_one(" -machine hmat=on"
>>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>>                     " -cpu cortex-a57"
>>>                     " -smp 4,sockets=2"
>>>                     " -m 384M"
>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>>       data.smbios_cpu_max_speed = 2900;
>>>       data.smbios_cpu_curr_speed = 2700;
>>>       test_acpi_one("-cpu cortex-a57 "
>>> +                  "-machine acpi-pcihp=off "
>>>                     "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>>       free_test_data(&data);
>>>   }
>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>>       };
>>>   
>>>       test_acpi_one("-cpu cortex-a57 "
>>> +                  "-machine acpi-pcihp=off "
>>>                     "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>>       free_test_data(&data);
>>>   }
>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>>       };
>>>   
>>>       test_acpi_one("-cpu cortex-a57 "
>>> +                  "-machine acpi-pcihp=off "
>>>                     "-device virtio-iommu-pci", &data);
>>>       free_test_data(&data);
>>>   }
> 
