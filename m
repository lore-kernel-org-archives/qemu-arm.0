Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4304796njc;
        Mon, 26 May 2025 09:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7TSSy9WFiT3gml5DX/qdtCIdlsA3WkE6z93VHrxjp3hnFNY0mAOMZ2+bNe6JuJJGACAP8llLC4tm5qw==@linaro.org
X-Received: by 2002:a05:620a:414c:b0:7c5:53ab:a74f with SMTP id af79cd13be357-7ceecc2978fmr1160048285a.39.1748275828776;
        Mon, 26 May 2025 09:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748275828; cv=none;
        d=google.com; s=arc-20240605;
        b=R9jOTvaY4Cu1UxSTZkP5V8Kd7M6GPwycfpA0pmLz1WCUjdb8p+4WBZJkb/RVoZ6KEB
         Lt3PyxdsYz+HXYZbySidLeDcaGgdsTWKH41Zs+zyUhdGhLMRl9rzzBW1Hz8dZ9szoDj4
         ZoemZSTZEsUrY2UHrQB71MyWopMzZg8xD0zSrXHoOV/Do6QFUZsV0/yGVdDPRBgZgkDx
         /hmJEDsra5BpJYx/hFQ/87/qjgVqrJmA7DEHTAFX3gbaPrzN2lTBbSvMMHLn16zzI3KG
         n12VvPoN1V2be+lMjAJNEfCutcNW6DdwmIzkibUG11eZQ3s2SsfN0cvU+kJEqoqxwu79
         j2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jt3YNwKEM9Sbv9IbtQzDPNU9JuVIKLs8sclnWnA9QaA=;
        fh=nfFjbQalV90xZFhyOKP30p7qcQlgFdkw8WOA2oydMRw=;
        b=kyMVdH/Utuaw6o3XiBMfGHS8x7f8GUMuyXVfGMcfBNUSuH6Mc0jyEZ1kF/YKsVNFpo
         kcEhUAxkUuoXB9IvAcueP+gdKMiOO6dOYKbuoF6YqaSvBl9Aoa+hNFfVqgkJkfXvIm0a
         ClOqRbLYIrgh5go0KcywRjK8TOoNoHFATGPDZnNfekg5iXlYfLhR5TcU/ZoGUmERp3SY
         OnaFs4D3PmAfAomoKwrzBytLwJqyLyNaq64lMkAD30r8DmUiRel4+ePZ40h3ACVFUehG
         yT954Qt3/PKNEpScd/noNIVUaUEmlh4iTlMnv8cvDw/8Ddo0TmcEk91/jRckCePvlJqI
         hs1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EqW/bpBw";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4dfa67c5749sor9492262137.8.2025.05.26.09.10.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 May 2025 09:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EqW/bpBw";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748275828; x=1748880628; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jt3YNwKEM9Sbv9IbtQzDPNU9JuVIKLs8sclnWnA9QaA=;
        b=EqW/bpBwvL5zGBp3dxI9fKqoBJG5N/BVYoEgnlF5zU5Igg/S7LH01JaCiJdUnZ4ABG
         UXemaJ/cQzFjjUbHzlZ3+OTMcf7lBGNotLoe4EZeTYgT8l3onodf8EMbKBa+s7JYktnq
         61bi/qx7EboXoSSKrE91LjqAuWIGFVW3yydPyAM34dSEoIbjfOxVC35axXThrv85eaM8
         tfImVJ4AmyRGSUl2RMpXRtDBje5smIjlTfb+LuhxeVtawx0GkIDmwmm29IckGE9LEBIH
         T6RQNC6SuJGJK2VV+rOuQEJSXLJUFS5ziOT7hl4TSuqhUtEk0ytgcLwqXlQUbi8JFUQi
         AzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748275828; x=1748880628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jt3YNwKEM9Sbv9IbtQzDPNU9JuVIKLs8sclnWnA9QaA=;
        b=EM8Nvw7z9wXExUtBFuSjXZ+UKve7NDUI44FP5rrFpY4kSq+JZRkxh5NgqzzOkOB9O/
         g9m6utJk1/hIrk1WS3xXyVRaPORnpeNjAPsrh1XRMvhpNzuHkkTGZ4UVCnvYhMMa5iJY
         BkXewH8NHg+lofjubloLUjkDBtpsonGBRMz/rXzgCNspzbNxHuTbrTTVL+/hqnFJxf6K
         sd8QZsfgZUijcJfpNv3hudopCRFLQmHAjSHuxbl80wUwWzsk2UZhWO58PN8EE+5k5RV4
         contUrrlHQGlumMcC4nm7lTbNHcLe0lelbIrN5FBAoj60KTSPCxwMzDmyF4/61nTlHld
         vf4g==
X-Forwarded-Encrypted: i=1; AJvYcCXk/Wd/84WyuI4n2Wxma9hKItgGAvWyrCLlEVCeJ6iS7l1nVqngZrYtc1Fb+bPYtzLi8edGpq05wmgQtQ==@linaro.org
X-Gm-Message-State: AOJu0YwGWwOG9A5hGZvc6HEfvmv5lvfF50u4KoD4/ckrXYOsDn0JQ9qF
	d3sAp0fTr436Uw6JJCfjtRJxH7+uA7NskfSMcfq5REOcDXkm8nZCEVJyY/2aPeIBbI2Nbw==
X-Gm-Gg: ASbGncsSiYjkedpxFnWTC67SfP+AULfnnMqHmFgEb0naKbb1H9j4mndB/DpwtoB4v+A
	geJjgs2xD+Mcw2QYh3qzx8pdz8qfj2dl9Ja/FrQqo2sgsHfZVLAXHIId9XshDMPYgwX2gMVbq3l
	lantx6T1HsNEBhAa083K0qVpRsgI1+TdxceL+ITN9d1I6uoAU99b+V9uB7ek+IK5JNKmEmrmkZV
	61dAa9J6HGhyoQ+Wt+Rg3r9ABj5Ay91tZMTqaJcrVQEoVCPcKuH9xzsDPZ5w6OwsCofMKrYyF4o
	DhFEhM8f3Ko771oYrwXrz6jAphutVlt04I4zzG/MapUmawuIW6raCtf37hh6v1bzY45CXHB2AHn
	sRAhV4YpEBuYRpRaWWEBaZ5mWcLFpsA==
X-Google-Smtp-Source: AGHT+IG0Y3a/E82axJJ2arNy3Qk0+JYep8W1DncjnaOQhgGLyUqIPBW5k0I+otyo28c4yh61AiCa+w==
X-Received: by 2002:a05:6102:3ecf:b0:4bb:e80b:473d with SMTP id ada2fe7eead31-4e42409ba65mr6889352137.6.1748275828296;
        Mon, 26 May 2025 09:10:28 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:d081:510e:25da:56a5? ([2804:7f0:b402:6ba2:d081:510e:25da:56a5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e2b21b4a80sm9367677137.8.2025.05.26.09.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 09:10:27 -0700 (PDT)
Message-ID: <d86cd26f-c43d-4a99-bd9e-573d3d7cf8bd@linaro.org>
Date: Mon, 26 May 2025 13:09:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tests/qtest/bios-tables-test: Keep ACPI PCI hotplug
 off
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-3-gustavo.romero@linaro.org>
 <a9a8d55f-7409-4dd6-97f6-a373de9870df@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <a9a8d55f-7409-4dd6-97f6-a373de9870df@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TJUuDmM4nKcn

Hi Eric,

On 5/26/25 12:28, Eric Auger wrote:
> Hi Gustavo,
> 
> On 5/26/25 7:31 AM, Gustavo Romero wrote:
>> ACPI PCI hotplug is now turned on by default so we need to change the
>> existing tests to keep it off. However, even setting the ACPI PCI
>> hotplug off in the existing tests, there will be changes in the ACPI
>> tables because the _OSC method was modified, hence in the next patch of
>> this series the blobs are updated accordingly.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 0a333ec435..216941dbb5 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>       };
>>   
>>       data.variant = ".memhp";
>> -    test_acpi_one(" -machine nvdimm=on"
>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>                     " -cpu cortex-a57"
>>                     " -m 256M,slots=3,maxmem=1G"
>>                     " -object memory-backend-ram,id=ram0,size=128M"
>> @@ -1775,7 +1775,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>        * to solve the conflicts.
>>        */
>>       data.variant = ".pxb";
>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>> +    test_acpi_one(" -machine acpi-pcihp=off"
>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>                     " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>                     " -drive file="
>>                     "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>> @@ -1846,7 +1847,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>   
>>       data.variant = ".acpihmatvirt";
>>   
>> -    test_acpi_one(" -machine hmat=on"
>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>                     " -cpu cortex-a57"
>>                     " -smp 4,sockets=2"
>>                     " -m 384M"
>> @@ -2123,6 +2124,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>       data.smbios_cpu_max_speed = 2900;
>>       data.smbios_cpu_curr_speed = 2700;
>>       test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                     "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>       free_test_data(&data);
> On my end I also need to add -machine acpi-pcihp=off in
> test_acpi_aarch64_virt_tcg_numamem

Yeah, by reading the code I'm pretty sure this is required by the numamem variant
as well but I don't see a failure here :( I have _no clue_ why the failure doesn't
happen on my env. Are you running simply "make check V=2"? arm64 host?


> with that fixed,
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks for the review! I'm sending a v2 with numamem variant fixed.

BTW, I'm sending soon also a functional test variant for acpi-pcihp=off.


Cheers,
Gustavo
  
> 
> Thanks
> 
> Eric
>>   }
>> @@ -2142,6 +2144,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>       };
>>   
>>       test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                     "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>       free_test_data(&data);
>>   }
>> @@ -2227,6 +2230,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>       };
>>   
>>       test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                     "-device virtio-iommu-pci", &data);
>>       free_test_data(&data);
>>   }
> 
