Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4220409njc;
        Mon, 26 May 2025 07:00:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJjuThozleQQbbqz1hc3lRNmYiP/iT1BvUvczKpk3PDXS3KZU9KDD1hNDc7GuArM3rB+Is7rtkiX/yCA==@linaro.org
X-Received: by 2002:a05:620a:2411:b0:7ca:efa5:a056 with SMTP id af79cd13be357-7ceecbd2ee3mr1554748085a.13.1748268016063;
        Mon, 26 May 2025 07:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748268016; cv=none;
        d=google.com; s=arc-20240605;
        b=CxbDz1MXam78dqSQoSDE8yO5vBpKin3s/iP1DEjnWD0+Gw/cdmtlsINKKD8pdRqXRS
         MWRCBcF/Bn+2a7f60pON0u6MQmAnzk5hYq1/XN6DdvIAnwZBcPb15HOQLrKtQOLLIrFO
         Yftxue8uH5Q5ZGwhdPdTfYpKkPiHBwzOiSveob1hQsyfrDb8gfbrvXs25kb8I1Bue37C
         kqOGMQ/6E8arhQaxv/WRjKEsDRJVzNPD6j0BDjZvEfBsi2fSbSxnWft+62KeKPITBs/j
         1KmTRscfDX5x3NcG18smjN1k40fMBu735LE8KsUpUKK/Ql1LJ2WXs+ZmGp211psCmeWJ
         T0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QtycBmsJOYuV0RBLwoITZm/+Gwc2xNO2MdRwzOgSg+o=;
        fh=YYWo5mtRNKXNVQMguP8un5JkzdLvHY1lFYkkqMULbC4=;
        b=CJ1C3JAb2MSnMzzSQ79K2coAH9j673woMUyBjB5KbmwZWM8It5wtrn5DLtAqVymHl+
         L+Dd8bysFfh54cB7koIfKH/OhBpjSSYd2W4FHcFvwqLjg792oL7cAD0hGBSiFcKYzBx9
         8LLL30rFgWOh8Kn6mRHsfR2borc8jgDxFxGaQn/PksA7W29qeZHG2RqmjIDQ9fBxfVUc
         aMGqimijNDnRnO2LvVMCyo7MoZS2EH7MKjiUnvNg/LTHH3f6IpWTb1hlXP4PQlitPFVh
         gaIEmepRkhkMv5B4GEeKQ/o34+8UmSQ+PG/JGHXv038yyiruDYgmXaFINFMdSVfqgZNg
         5gRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6855H9o;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7cd467f39a3sor1821664285a.6.2025.05.26.07.00.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 May 2025 07:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6855H9o;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748268015; x=1748872815; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QtycBmsJOYuV0RBLwoITZm/+Gwc2xNO2MdRwzOgSg+o=;
        b=f6855H9ooe16RXA4QQJzxm97oy5N84JmrbHBtPyQuuoLjhtSKFKAvU1J0Jx90iy1Dp
         Fwv08ilCq/rflpSedhI2kKoR/oElIlm/OYJzj/9zPDtxvMf/gxrezEuhTfN2m97ZizxY
         lqzT9hIaAavAFnEB/D6UdI+/Hi98pJR15/MZnuvWccQhnKtMjPbLy4zAUyRpqNfC3O2g
         y1IVaFY/au36KZ7mqdMxYptZUyfRZqpRnh/m6VrFPjUa4oPQ697hLT1guNomNnNO0KIs
         Que2enkeE6Q3BgUA2Gi8cm7PzgmaWiPmlan3C1wsDqqJU+nslePhSSPsSYuQxUcC5bww
         9EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268015; x=1748872815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtycBmsJOYuV0RBLwoITZm/+Gwc2xNO2MdRwzOgSg+o=;
        b=hvPSKPSgdDiU0/0adL+epxNvFLyiMvrR7/wJADlFQ7nhA72tJrld2UE+RwslUez1Yo
         vB8WBRtpuXzWtkIjd2VfYEJ2wwfcOLhGzrELl5p//bAbdE+N9FoQwhF9vhuQNMp/GSGV
         EzEs8tTEmXi4pWdt6MMK5BHklwz6TOd/AAFlsxxhprexL2K2IjF0BcsT+ODPm5u9by3l
         ieiJTbOLWOR/5Ep1TZOGwBO8IE+TFP3lxJh3f7L3txOEz/ekktnvvlXvdAzGc2pUqTHj
         d8qD9CQZNPxVrYz6BONMKe8yExwWUOrozqbUCzfeyy9ZrtVYEcup+8cWjmUC1T3iuq4+
         eGDg==
X-Forwarded-Encrypted: i=1; AJvYcCUvbP7LlFuL57lkZwVIN1k1Ti0IRdiftMRgXiJa3NnJYNAi+zbn6b7e4LeKiiPcHBKPR5f5wl0YslHo9Q==@linaro.org
X-Gm-Message-State: AOJu0YzHUOrqlv68zQevfA6b3CFVNVnLHOdkgt4t/GqGuWvN7s9Yv9QL
	QsM9p0Nmafc0qejvOefmYPOSMAfzL7DrHVFsD8yR4ti7JstRH/2BHD+GqlAoELrlrOzKFbakF6y
	IxUzYqFCoJQ==
X-Gm-Gg: ASbGncs9aLzW4yajNdxxuaQHI7FnTMqGphgcgjzp2BdsiTHSALrvwHHLviVj/z539cQ
	0Q4jNBE42cYcpjTvExrno/i0jnCTSAKcK5UlRRivJBpdKtvIO8XmSaheyh4flQcX3VuEvvcyd+O
	w7D6qb1OwMcjOiC9h5ijUiWlIvoeD5ZBdn5YK+S6GJUKqOGiK6hohHiAftb3THw8WmUXaxloysg
	YbRTzqTF9ngFnRo5+AJ/XZJQddAyHLcsYLBIt++/72+HnW2DmaDm+DDKuHFo1NmGfDpf2TsSKGq
	ReaY6W/97X3HJY9rdhbWN89WGGDLdLp2pvmEMgoX+H1dMoYl1/k1sGI7oPipREXKT5UfOrm+XKJ
	7egocLHk6LbJG4RJdvMAVmMU1JCXQYw==
X-Google-Smtp-Source: AGHT+IHPNY4hTF4/LjnIvibVihVMLlpvLkdcdlx/CRR5/dbzBkfJps9YVgLiZb9F44eLhWny/kucOA==
X-Received: by 2002:a05:6102:cd1:b0:4e2:91ce:8cad with SMTP id ada2fe7eead31-4e4241911f0mr7356501137.24.1748268004133;
        Mon, 26 May 2025 07:00:04 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:d081:510e:25da:56a5? ([2804:7f0:b402:6ba2:d081:510e:25da:56a5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e459aa1ca7sm1015278137.24.2025.05.26.07.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:00:03 -0700 (PDT)
Message-ID: <6e26d345-e78f-4643-9d3d-772dc06f3e97@linaro.org>
Date: Mon, 26 May 2025 10:59:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tests/qtest/bios-tables-test: Keep ACPI PCI hotplug
 off
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-3-gustavo.romero@linaro.org>
 <a6cbf985-4bea-40ff-b12c-8f459249f570@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <a6cbf985-4bea-40ff-b12c-8f459249f570@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: q1KtjItW8VRe

Hi Eric,

On 5/26/25 10:23, Eric Auger wrote:
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
> I think this is also meaningful that this gets inserted in the ACPI PCI
> hotplug series before it acpi pci hp becomes the new default (of course
> if you agree on that)

Yeah! I've indeed just mentioned it when replying to you in 3/5 :)


Cheers,
Gustavo

> Cheers
> 
> Eric
>>   }
> 
