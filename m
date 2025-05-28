Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5449068njc;
        Wed, 28 May 2025 05:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRn1IOi5QdVjleTHdzMFb2cOW9YA7zwDD/+VwzqOoMPcoWlduHE2QdxsfVv1eW5P+5CmyLK3RPln1rqA==@linaro.org
X-Received: by 2002:a05:6102:510d:b0:4e5:9e92:a267 with SMTP id ada2fe7eead31-4e59e92a960mr1009007137.4.1748436082023;
        Wed, 28 May 2025 05:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748436082; cv=none;
        d=google.com; s=arc-20240605;
        b=fEtbhw8AYikUsSB6hiUa73E2sN2c6MSEfstv7Ww+PP3ebv//lkHcLlzM8LZTQKzIEf
         QeOILXiWGElHlIQMnlm+0Q31bonlwMSdsWFATSeE+tW5ZSvtt4/EZAXnMLbnMoFs2UCi
         rQbunPnBfh95dh9jAOpIeWwO33pLgDGaxqNvMIOBIuEC0r64hAOadCaFD2tG4vTF5K+O
         ASHzOfumUgbwZawCXISLwe96WKXkGfM3QRjB4Wkg3El81nosbAtX1vmbqScND90RpRPI
         TKUN3ThAEifD+FG5ip8vBQNXVIuVQ6+cXfH5imbskTRolP96msdOlUbAprJR7jIDqmRd
         O1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qV2ty7xeuAzjkeJYG9BdgdDp/4wFSsxmItOkHU0K0M8=;
        fh=mVwYyORZWKHBj0nuY3BGJDlMCJGxMrlnKjh4V2MDRR0=;
        b=dYhrjfCiZ1qxOwUS8jVYBm7pgJ0aqwEiNPjeQLGYmmmbYFO4IyI0sycweV+ChR9KP0
         KbUWv5k7oclqwWl04H4c4sRu8IMRaNeLyiW/emrTRH48BWuHjLzo+mK+nDMApoht5qdm
         SHFnqJir+ksMf8Vbse0FfCFKqiMoE8bzwfv9FUJ2cgOTmbnrPEDZ5ynExrb07AXnv07o
         zFfEl/NHw4ipRn5PkmuVW4JUngH94iCo9lq9Bwqz3ewSKlFeJBVFstezVN9boHj4UHhr
         eFrBXK1AuSZG8Uz72Vo5Rxpg0NR9KPCd3Af17lqDAgXZhiUFy8+Mfzx1huE88WuGrQ1g
         9Fmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xx+uhUET;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1e0cc1a2514c-87dfb3ed61asor828996241.2.2025.05.28.05.41.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 May 2025 05:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xx+uhUET;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748436081; x=1749040881; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qV2ty7xeuAzjkeJYG9BdgdDp/4wFSsxmItOkHU0K0M8=;
        b=xx+uhUET2IxY+nRgKozJTOxuo96plEJStsvFteGVRQkMpO/hJPnsmzh6eyJEe466Ue
         iqbOdeWzA0jvKS3VzqRsx/G2J+hMyjb1FZlWLrQSICnmo8otxCx8wS+YMIySuveTny2I
         qQnp4YpSsPj2VbH2KTairb0T90hOkrQqFpfu8Zqr0DZ1/X0l5OL1ZMi6zjFSpEIplbHz
         0dqrDTWE/0RuAwlQmVI7ZklM3tp0ka3K7kuwFmcJF9shiJ1qt4vUZfHgiZ7AQD9NRVQj
         mUg6+h+c4b+7bWjXUmhn92CGT9fOK2MTicsL8xyhm0O3+Uxd07rbgL+OsppMPKVofTNp
         a+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436081; x=1749040881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qV2ty7xeuAzjkeJYG9BdgdDp/4wFSsxmItOkHU0K0M8=;
        b=XK7bMQdtaxYAyxkZFOrVxWc4irPSmbCdpoqhCLdWPhpz2gy1+se5MvPvdwBtPIaE/W
         fEKRMtMfl8GFTPxPWHgySvhGPEgbvJwlxYVPMvWI7JqipUhNqB9YAAVwhZzuT6+sXV2D
         Qkn/yLp0ENA+7b+mmiO7aTLtPcHYgoYrA8gwNRJDjtvSLG+a1d+RLawLlN8v9JygWpQs
         /G3KuUo8BOSIOP3X1QyMm+aY9gOQEtMtKblWSaTFLw2Yq420t62h7w2+kq0RM66+3hvO
         CvdbL1cqIBnZ6V3+FVhJOYZqkVmoAmidGMydPyLMCVwrnjvoOUUVcOqvRr2c/7JVdIU+
         n5yg==
X-Forwarded-Encrypted: i=1; AJvYcCVvHIWYJ9W0SEq0oEy+qY5KFOD8aimVq/aK+cg2x4kRmmFQ0jxxXg0R8995ynubfisJpu4sL6LSuj/mrA==@linaro.org
X-Gm-Message-State: AOJu0Yxtk08yrupR29+4c+DhmT/sTXZjWkfyqfxQwUUSX5TbVlwdoX3l
	69cnYYEGoNGPQWHW6aNJm43vn50u7Z1e39+rDwLQUxMGIDLQhY3XvX2I7wJs7qALXdQq6A==
X-Gm-Gg: ASbGncvwPr7q+znf5yhsLngcabajd+GudXsXtNZBMTynnfD29oqBOuVbhsxseFCXPrh
	kV+jhTULNz/jseeEHsIW6GvrriyPTzrL4id49GdRIB8DNmB4KZD5NRjSwXkrX1jupMO1aiPXYtY
	ZsfK0lU+9NDXcQwa+29ZGA0/DWwi5oUgxvuFGdrwllSC6ZMtTAiTkQyXxTP4DTCiJYoKutmXmgU
	irO2sD0IpXIw8ouqQB/C4WE4jTqFcKQbMFUoYu8VnVjk0ZiVGW0/OkB9XjV4u267Z9ZyQgPZZFz
	rHAs3T9gKsSvhjyfVMLjF1QJ8tx36TcHYZ0FwpP0/0NJo7E0Pd+xbxIjo/qyGFl0hr+NnbE0GCz
	ucwbDwrJjUGCovlCGc58V8S7ddJzv1w==
X-Google-Smtp-Source: AGHT+IH6XUj9DClPMfpVzSs/2eJ4sQC0Oz/YvRsC9nib8fAkxK9DpOvU+mWlaNISE+I8Ku8qlOtaaw==
X-Received: by 2002:a05:6102:510d:b0:4e5:9e92:a267 with SMTP id ada2fe7eead31-4e59e92a960mr1008995137.4.1748436081509;
        Wed, 28 May 2025 05:41:21 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586? ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e1f0db868sm738539241.26.2025.05.28.05.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:41:20 -0700 (PDT)
Message-ID: <375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
Date: Wed, 28 May 2025 09:41:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
To: Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-25-eric.auger@redhat.com>
 <20250528113813.47086516@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250528113813.47086516@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QtK+8R5lsnK6

Hi Igor,

On 5/28/25 06:38, Igor Mammedov wrote:
> On Tue, 27 May 2025 09:40:26 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>
>> ACPI PCI hotplug is now turned on by default so we need to change the
>> existing tests to keep it off. However, even setting the ACPI PCI
>> hotplug off in the existing tests, there will be changes in the ACPI
>> tables because the _OSC method was modified, hence in the next patch of
>> this series the blobs are updated accordingly.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> it would be better to test whatever default we end up with.
> (like x86)

hmm maybe there is a confusion here, Igor. We are actually planning what you
said. This patch and the other two in this series related to the bios-tables-test
(i.e., patches 8/25 and 10/25) are for actually making the current (legacy) test pass,
since the new default as per this series will be acpi-pcihp=on. That's why here we're
adapting the current test here to have acpi-pcihp=off.

The new test that will test for acpi-pcihp=on (the new default) is not in this series
and we decided to merge it separate. It's in the patch 4/5 and 5/5 of the follow series:

https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5


Cheers,
Gustavo

>>
>> ---
>>
>> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
>> ---
>>   tests/qtest/bios-tables-test.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 0a333ec435..6379dba714 100644
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
>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>>       };
>>   
>>       data.variant = ".numamem";
>> -    test_acpi_one(" -cpu cortex-a57"
>> +    test_acpi_one(" -machine acpi-pcihp=off"
>> +                  " -cpu cortex-a57"
>>                     " -object memory-backend-ram,id=ram0,size=128M"
>>                     " -numa node,memdev=ram0",
>>                     &data);
>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>        * to solve the conflicts.
>>        */
>>       data.variant = ".pxb";
>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>> +    test_acpi_one(" -machine acpi-pcihp=off"
>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>                     " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>                     " -drive file="
>>                     "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>   
>>       data.variant = ".acpihmatvirt";
>>   
>> -    test_acpi_one(" -machine hmat=on"
>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>                     " -cpu cortex-a57"
>>                     " -smp 4,sockets=2"
>>                     " -m 384M"
>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>       data.smbios_cpu_max_speed = 2900;
>>       data.smbios_cpu_curr_speed = 2700;
>>       test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                     "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>       free_test_data(&data);
>>   }
>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>       };
>>   
>>       test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                     "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>       free_test_data(&data);
>>   }
>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>       };
>>   
>>       test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                     "-device virtio-iommu-pci", &data);
>>       free_test_data(&data);
>>   }
> 
