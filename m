Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2487453njb;
        Sun, 7 Jul 2024 22:21:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy96RyfzjJZqahyfyOhmA8T+Y3Da4e/s2DjaPhgQ0ecyDRmzv9pnYesz3KmLKxsEwgNT2sfrznpS/9vIBYY6i4ebv8CsSr
X-Received: by 2002:a19:9106:0:b0:52c:8024:1db with SMTP id 2adb3069b0e04-52ea06d307fmr6904092e87.63.1720416069071;
        Sun, 07 Jul 2024 22:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720416069; cv=none;
        d=google.com; s=arc-20160816;
        b=WL69r885hVYpsu0Te6LeuhXuyEJVFAVLhSAaf/yShWmn+1gfxJJCFCWwlSzPTg0rze
         r65OZCRB+0G9Ojsahn6Svd7giflr3W6DwRhtc1PQ+M2/PNspkwP+l4hJnepzLrxbt0YR
         6HqQExmO14mwA0WFBbDb7CizfhkzwUKnkbZflOIj4gAtXCxpajRQ9MzqT973L5BAywR1
         E8btz2NyxB7yEj+a3eLddpzDWArwuRMGn/RJYKSO95gurk2QpWzXASHX/HoulH2OUB0O
         wBtTvI2l4o7XhjGv/SzUgEv3XvsXGrh7s377mDLPv1ybU3+NQN2UnodBpaC+163BL3eg
         GErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7fMvhV7ZPunSsonAYx4gHRlHd0ReqWNpiBKeLTJyNUM=;
        fh=ljd2ScmwAYHlV6QIcuKU7m1bKXv7YDnv9B13f+yjMoY=;
        b=uXyJsJLp7T1LUPNfBY2dhpt3PcZIfBdm5y/VsCLlPZfmvyPwu3eyzJPSHuV/t9R6ei
         V45dmniXr0/u0h80xZviV3vV5JstJnQyAy9iJ9y+p4rj1HU9aUbJ5hRC9QU88yO0fn//
         56yLM85ktHci4dhe68L4bxSxMMIKIlXbHp9FFRESIxALw+oFYS4Ag2/pyT9c+WYWllSk
         g7mNw7xPe0ceweigFSWG+HoL6crctAuqYZCb5J03dWm64uS38EyFh92TQsxkfEh5EGrI
         67/lgZ+Q2JgSJqExxEB+niAsCDx9iKbeHZmWJFL036YySFl6stEfqlCfrbrPnt9UWyiM
         dSbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=XFb78Bms;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52e9bebbe57sor2304761e87.30.2024.07.07.22.21.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=XFb78Bms;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720416068; x=1721020868; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fMvhV7ZPunSsonAYx4gHRlHd0ReqWNpiBKeLTJyNUM=;
        b=XFb78BmsbIs6aAQ8W1wdiZZVh/K203hRj3gh4KGzGWWxRzdJw3CrFR3FjVurzspCro
         9slPJOuN5v9MT9JBuEYgL03oORkhXSr9pqrik3ktY4Mj9jM0qqUOWZIKVNEoSPuf3YJn
         F3wv/K2Eoz9DBE8G8cIK33pTsU0x52vlUbXFHGJgGKaMKlnd5FnTJouuTfWXs5xkd8qT
         Drdx+MW89OR1uuJLXxiFMcGpGg7sLCD4S1oMjYJaaHvvMPxoAPTmwXxqZ+GDYO6kY4D8
         +S58gQn9Q699ABjPeGbGmDxNEk4N7iqY+ilWqKNCB9entHk9hwwVijH9jooFca6JytaV
         wNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720416068; x=1721020868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fMvhV7ZPunSsonAYx4gHRlHd0ReqWNpiBKeLTJyNUM=;
        b=JxRID7mXlkqTEDPfUvYS8PoIbkeTDJZphK9OXBmV7cOAr++7whdMW40qfYk0XPM0aZ
         IKw4ECcwck0YVr2VZqLUGddnY5BK7d3BCqKgLxWQCOPhpEoeAio28PjC1xHLA0cirBl5
         NtpJ2Rxv2R4kAGT4e5Zz3U0Yl1AB/Glxp2BdIvM5PH0hRrsNCVdPkk/TStr8wcgnGfCF
         NtV5ssgikfmp1hFImp0h/kXn/B7MVdJ+SCjzrNZhqN7cNX7uvKFOFn6O4pveJliTVzbA
         A8RYgijakVwwEDf17+z/KRmdJ/qgH5Ic7+pGfTKzDNv9W0cjAftjc/Fcwf+PvsySBL1r
         rbWg==
X-Forwarded-Encrypted: i=1; AJvYcCUnmc3MV/UBMyzdzJGCnCFfbfHP/vcneQOvVQEXJBgt06eABFCrvuu4DUJhkVsBeX4JtFlk0d+r5o+AD98eIc1EXN4bwVRk
X-Gm-Message-State: AOJu0YzvyquuICpIFMypMKOlab67JFeG5fwQpeW75ADPWn46pq4t/ZW2
	utM2guj5W0EKN7lnqPqWK01hKkoVxIaUQRX0uq1j09Zpwcow697LZOOwnzX1G3Y=
X-Google-Smtp-Source: AGHT+IFCT/kp92Ghi2iGO1AbdAhriKZnwyak7QRCaFIlb0gdffGLvTSnGZWlRTs3Y9paIw+aQlCJOg==
X-Received: by 2002:ac2:530e:0:b0:52c:dea0:dd55 with SMTP id 2adb3069b0e04-52ea0629e54mr6779491e87.24.1720416068268;
        Sun, 07 Jul 2024 22:21:08 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679976da15sm10451449f8f.94.2024.07.07.22.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:21:07 -0700 (PDT)
Message-ID: <4a092822-099c-4818-a0fc-1b9bb376b3c6@opnsrc.net>
Date: Mon, 8 Jul 2024 05:21:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 4/8] hw/acpi: Update GED _EVT method AML with CPU scan
To: Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-5-salil.mehta@huawei.com>
 <20240706162845.3baf5568@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706162845.3baf5568@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5vyp37FB5xrW

Hi Igor,

On 06/07/2024 14:28, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:45 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
>> results in start of the CPU scan. Scan figures out the CPU and the kind of
>> event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
>> method with the call to \\_SB.CPUS.CSCN
>>
>> Also, macro CPU_SCAN_METHOD might be referred in other places like during GED
>> intialization so it makes sense to have its definition placed in some common
>> header file like cpu_hotplug.h. But doing this can cause compilation break
>> because of the conflicting macro definitions present in cpu.c and cpu_hotplug.c
> one of the reasons is that you reusing legacy hw/acpi/cpu_hotplug.h,
> see below for suggestion.
ok
>
>> and because both these files get compiled due to historic reasons of x86 world
>> i.e. decision to use legacy(GPE.2)/modern(GED) CPU hotplug interface happens
>> during runtime [1]. To mitigate above, for now, declare a new common macro
>> ACPI_CPU_SCAN_METHOD for CPU scan method instead.
>> (This needs a separate discussion later on for clean-up)
>>
>> Reference:
>> [1] https://lore.kernel.org/qemu-devel/1463496205-251412-24-git-send-email-imammedo@redhat.com/
>>
>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>>   hw/acpi/cpu.c                  | 2 +-
>>   hw/acpi/generic_event_device.c | 4 ++++
>>   include/hw/acpi/cpu_hotplug.h  | 2 ++
>>   3 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index 473b37ba88..af2b6655d2 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -327,7 +327,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>>   #define CPUHP_RES_DEVICE  "PRES"
>>   #define CPU_LOCK          "CPLK"
>>   #define CPU_STS_METHOD    "CSTA"
>> -#define CPU_SCAN_METHOD   "CSCN"
>> +#define CPU_SCAN_METHOD   ACPI_CPU_SCAN_METHOD
>>   #define CPU_NOTIFY_METHOD "CTFY"
>>   #define CPU_EJECT_METHOD  "CEJ0"
>>   #define CPU_OST_METHOD    "COST"
>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>> index 54d3b4bf9d..63226b0040 100644
>> --- a/hw/acpi/generic_event_device.c
>> +++ b/hw/acpi/generic_event_device.c
>> @@ -109,6 +109,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>>                   aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>>                                                MEMORY_SLOT_SCAN_METHOD));
>>                   break;
>> +            case ACPI_GED_CPU_HOTPLUG_EVT:
>> +                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
>> +                                             ACPI_CPU_SCAN_METHOD));
> I don't particularly like exposing cpu hotplug internals for outside code
> and then making that code do plumbing hoping that nothing will explode
> in the future.

I understand your point but I've followed what was already existing.

For example,

build_dsdt()

{

        [...]

     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
     virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base, 
memmap[VIRT_MMIO].size,
                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
                          0, NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, 
vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
                       irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, 
AML_SYSTEM_MEMORY,
                       memmap[VIRT_ACPI_GED].base);
     } else {
         acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                            (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     }

       [...]

}

Refactoring all of this code will create a noise in this patch-set.
> build_cpus_aml() takes event_handler_method to create a method that
> can be called by platform. What I suggest is to call that method here
> instead of trying to expose CPU hotplug internals and manually building
> call path here.
> aka:
>    build_cpus_aml(event_handler_method = PATH_TO_GED_DEVICE.CSCN)
> and then call here
>    aml_append(if_ctx, aml_call0(CSCN));
> which will call  CSCN in GED scope, that was be populated by
> build_cpus_aml() to do cpu scan properly without need to expose
> cpu hotplug internal names and then trying to fixup conflicts caused by that.
>
> PS:
> we should do the same for memory hotplug, we see in context above
>
Although. I agree with your suggested change but I think this should be

carried in another patch-set.

Best, Salil.

>
>> +                break;
>>               case ACPI_GED_PWR_DOWN_EVT:
>>                   aml_append(if_ctx,
>>                              aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
>> index 48b291e45e..ef631750b4 100644
>> --- a/include/hw/acpi/cpu_hotplug.h
>> +++ b/include/hw/acpi/cpu_hotplug.h
>> @@ -20,6 +20,8 @@
>>   #include "hw/acpi/cpu.h"
>>   
>>   #define ACPI_CPU_HOTPLUG_REG_LEN 12
>> +#define ACPI_CPU_SCAN_METHOD "CSCN"
>> +#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
>>   
>>   typedef struct AcpiCpuHotplug {
>>       Object *device;
