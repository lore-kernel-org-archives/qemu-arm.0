Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5544458njc;
        Wed, 28 May 2025 08:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdLlP8vQNF7LW/uADt2GaKURpqDStucsSQVrO9+VYvWcw9V15WM73xBxR0ZkQ2tgcnnXsxLPzEXwrDFQ==@linaro.org
X-Received: by 2002:a05:6830:4890:b0:72c:3235:557d with SMTP id 46e09a7af769-7355d069e74mr11148243a34.13.1748444684915;
        Wed, 28 May 2025 08:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748444684; cv=none;
        d=google.com; s=arc-20240605;
        b=HwQbsgSA/6ie3leJgIYWNK9pxaApGauThkizcxwDzuCjEA5OeCX8nXSdEF/bcLoyL6
         UqErd2p3hfb4onDyJ7LKRQ1rqKGCsc3Jz5Sx9GhI6eZScHAP963+Yt83j9Gj7MKzvgaj
         XSHdUBpjaFmoaNZB8rUxu1p8EdOB8dgW9Q/RADx6dTTPaWqJIq4lRQS40QPwXnEk9bxn
         rvFJKWqCZLDgIkKJWq6/mCDGzOFbNPJlWPdv0RzROfHGIG0yHORDtOjl62AL8gp5t1GE
         Xbcy8agJ1RXLOg59CXeWjEGwT+dtLiPwhBICS7kHHyXas2gloJl0JTAFg6nWcTffyBnK
         ADGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tSPH3X0vf+RTEfgVAMQBy9/4Ydp7t2pTvizUr5Yr/nw=;
        fh=ZWA85sE1HIOthsWb5C+H6+62Pi+PTQ0QV0gK42aIPL4=;
        b=f1bNX8zJn1zDjMyEBX7foJdRjMbm2I4i7/XcboJSPp+FTOzqD9f0TM9tFyzBy0WmEl
         RgauD9rtSo4j2zj9ccUBQUdWm+4yCCTaHKQWwQ9mVXwmLdnU/q0OFT7U74Q1aN9Dmcdf
         HXgZlCRI1YQjUq6XSgH75FbnT45ucbkxIwoE1VkcundHN8/fUF0nPuff4EihCqUUO1IY
         te/U6rPunQ9NY2QDrURV/6VP2W+rPsXd2Iyzhyx85o3Amf2rTWAB2qyR/oJa2jJ9RJis
         vgE4JqoeJNV5J/glaydI3vzkdR7iGTRRSofq+YHPeknAnAeycXFXYQ6mvlUwnrMOSZsr
         5RpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znvGp3PE;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-734f6b2b25csor9538085a34.11.2025.05.28.08.04.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 May 2025 08:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znvGp3PE;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748444684; x=1749049484; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSPH3X0vf+RTEfgVAMQBy9/4Ydp7t2pTvizUr5Yr/nw=;
        b=znvGp3PEp5XZeKbxso4jrLkOgcQSr8kCgrMvIv9dzSe5KDiYpedctXeWvKeqZsO3x+
         TpsZJEipPrgiHaC0amsTPmhh2oR9Qb/h2ktQ3Q9SW/xedRTLdC3YaHvzDwnbaZUpEKit
         E7A9USCAZNGo4NWWqI3z7HPOAHVE38PcBI1uM6akitF1KM695RWjCnheM7ku3VPLjP7Z
         Sr6SjookRNXng0c59hNTEyF04y2MVVjE32LffhsXAP3auJtXOTjHC9nNZM0t3s/vcEQ0
         dnDrVvt1uabbuc/MTlFP5Hc8PvQq2qQm4qaEI9ba2+3D4vGeYuKAO6Y0/S+bQ8BID3UT
         1+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444684; x=1749049484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSPH3X0vf+RTEfgVAMQBy9/4Ydp7t2pTvizUr5Yr/nw=;
        b=ZzIFbyOv6CEjRgzuURXgO1u9ToqredEtJQH0Bbsr/e77270ca6MQ87D4qlJ45IzIh6
         S4Mgr/cP3YDCL59wD/WQHejFVD8JIKJCNBXwJl1pqPBNv7qTlTpOx9YN2ZgxBdwyrnNE
         1hGk02oU1HMapq0wV55QakwPMWdgCeEBXOYIQ1UiAaslrNT3+TlSs6JjF7oat7Rka1h/
         IMc2vB+0RtD2ap6rEvE10HaW4DoXuK7vfkj3XvmHqIKUv3o2Vck/85K+cQiM1l9MfdDr
         jF7AxzHLxfLdDRlmp2xwfwLs2DIiLfmIeiogilW9XU/YLiyNdoou+5O8dW8yTeBPgv95
         wBRw==
X-Forwarded-Encrypted: i=1; AJvYcCXD5mOyhJcoJjYBTrtTQN0wLl42Xo24/gYlB5AU65xgTCp2p97fMWT/aBkiFGeVnlL3cYBjG1bZm0IzAQ==@linaro.org
X-Gm-Message-State: AOJu0YxpKSm7nd07gbDe7mm8rDvR5Mx4Mg00J6o1bCAQDkpfjarxhnHn
	U3JO8PL78RTHlmdwjNJNfEcAyQSXgzEutIx1BhBcae06f36GzK2jpNQxlknbXhg221zD2SbwptL
	9Mm9Yqlk=
X-Gm-Gg: ASbGncso+5Tf6P8NypSL8CkDr4L61L9z8bDENfaK9M4JrtE0vtXcQ/PHWEl5D903MQ6
	x4bxigK+oQ96dOi0wkhuFslMGtVRFGEz66/HzazHhZKgfRlDlfsYY5cob2RpFfBx+wHGro2HPG2
	r/fO8Vl0q47y8bPoRGoksg9uzCDnRyl6ZtP11MjYtfRMpQ3XZpPzdygZCEUFsbgzF9/QPHM45cY
	/5+zZRSv0X+ut3xzH1vWpjMeyBlXwUsVw8xRM7KbveNMtZYWq/iqBb439n24+IkZFJW37HIQ3pC
	Tl+7whudX9WCkHoRUilARGswyzjitc3/+vj6B8MYgtsU5JvPenyxOs4b1csGjMoJB4zX2vsh3DE
	bBlWu1lVIK0vkCh5iGDGDECammSbSYA==
X-Google-Smtp-Source: AGHT+IEB5FH9tG+PeTsf6ApJKcqIhzRGl03jk0Fxn6jR3QM1XYWKe4Khms9TW7eiat9qsaUbHUu3lA==
X-Received: by 2002:a05:6870:8dc9:b0:2c1:ac88:4a8d with SMTP id 586e51a60fabf-2e8620d0871mr8874628fac.30.1748444673333;
        Wed, 28 May 2025 08:04:33 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:c792:c8df:e54f:dec7? ([2804:7f0:b402:6ba2:c792:c8df:e54f:dec7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e1f03f933sm962585241.15.2025.05.28.08.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:04:32 -0700 (PDT)
Message-ID: <6a5776b4-73ef-427b-b4e4-b25031b0ce53@linaro.org>
Date: Wed, 28 May 2025 12:04:26 -0300
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
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250528150239.5f6b63d0@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RAiD5W1Hz2C5

Hi Igor,

On 5/28/25 10:02, Igor Mammedov wrote:
> On Wed, 28 May 2025 09:41:15 -0300
> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> 
>> Hi Igor,
>>
>> On 5/28/25 06:38, Igor Mammedov wrote:
>>> On Tue, 27 May 2025 09:40:26 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>    
>>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>>
>>>> ACPI PCI hotplug is now turned on by default so we need to change the
>>>> existing tests to keep it off. However, even setting the ACPI PCI
>>>> hotplug off in the existing tests, there will be changes in the ACPI
>>>> tables because the _OSC method was modified, hence in the next patch of
>>>> this series the blobs are updated accordingly.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> it would be better to test whatever default we end up with.
>>> (like x86)
>>
>> hmm maybe there is a confusion here, Igor. We are actually planning what you
> 
> perhaps, see my reply to Eric about my expectations wrt tests.

Yip, I read it before my reply here.


> (i.e. default tests shouldn't have any explicit CLI options,
> instead it should follow whitelist blobs/set new default patch/update blobs pattern)

I see. I agree with that. But this patch is not about the new test. The new test is
_not_ in this series. Patches 8/25, 10/25, and 24/25 are _not_ about the new test but
about adapting the _legacy tests_ (native acpi) to the situation when ACPI HP becomes
the default, because this series makes acpi-pcihp=on the default, hence the CLI option
"acpi-pcihp=off" added to them. An update to the blobs are also necessary because of the
change in _OSC method, even when acpi-pcihp=off.


>> said. This patch and the other two in this series related to the bios-tables-test
>> (i.e., patches 8/25 and 10/25) are for actually making the current (legacy) test pass,
>> since the new default as per this series will be acpi-pcihp=on. That's why here we're
>> adapting the current test here to have acpi-pcihp=off.
>>
>> The new test that will test for acpi-pcihp=on (the new default) is not in this series
>> and we decided to merge it separate. It's in the patch 4/5 and 5/5 of the follow series:

We're doing the "blobs/set new default patch/update blobs pattern" in the new test, which
we can merge later, once this series is merged, no? The step "set new default" then will
not be necessary because the new test will be merged separate, after this series, so when
acpi-pcihp=on is already the default.

Please note that although we're using acpi-pcihp=on in the new test, it's not necessary,
we can dropped this option, making it implicit as you say, and it will work. This is the
new test:

>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5


Thus, there are to "acts" of modifying the bios-tables-test:

1) Adapt the current tests to when acpi-pcihp=on becomes the default (hence the addition
    to them of "acpi-pcihp=off". There is also the need to update the blobs, but it's because
    of the _OSC method change in DSDT table, which will change anyways, even with "acpi-pcihp=off¨,
    hence the need for patch 10/25 in this series. This is _done is this series_.


2) Add a new test for testing the default (i.e. acpi-pcihp-on). It follows what you're
    saying above: "follow whitelist blobs/set new default patch/update blobs pattern",
    because we can drop the acpi-pcihp-on option from the CLI in this test without any
    prejudice to test. While the step "set new default patch" was actually done in 1).


Cheers,
Gustavo

>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
>>
>>
>> Cheers,
>> Gustavo
>>
>>>>
>>>> ---
>>>>
>>>> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
>>>> ---
>>>>    tests/qtest/bios-tables-test.c | 13 +++++++++----
>>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>>> index 0a333ec435..6379dba714 100644
>>>> --- a/tests/qtest/bios-tables-test.c
>>>> +++ b/tests/qtest/bios-tables-test.c
>>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>>>        };
>>>>    
>>>>        data.variant = ".memhp";
>>>> -    test_acpi_one(" -machine nvdimm=on"
>>>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>>>                      " -cpu cortex-a57"
>>>>                      " -m 256M,slots=3,maxmem=1G"
>>>>                      " -object memory-backend-ram,id=ram0,size=128M"
>>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>>>>        };
>>>>    
>>>>        data.variant = ".numamem";
>>>> -    test_acpi_one(" -cpu cortex-a57"
>>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>>> +                  " -cpu cortex-a57"
>>>>                      " -object memory-backend-ram,id=ram0,size=128M"
>>>>                      " -numa node,memdev=ram0",
>>>>                      &data);
>>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>>>         * to solve the conflicts.
>>>>         */
>>>>        data.variant = ".pxb";
>>>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>>>                      " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>>>                      " -drive file="
>>>>                      "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>>>    
>>>>        data.variant = ".acpihmatvirt";
>>>>    
>>>> -    test_acpi_one(" -machine hmat=on"
>>>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>>>                      " -cpu cortex-a57"
>>>>                      " -smp 4,sockets=2"
>>>>                      " -m 384M"
>>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>>>        data.smbios_cpu_max_speed = 2900;
>>>>        data.smbios_cpu_curr_speed = 2700;
>>>>        test_acpi_one("-cpu cortex-a57 "
>>>> +                  "-machine acpi-pcihp=off "
>>>>                      "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>>>        free_test_data(&data);
>>>>    }
>>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>>>        };
>>>>    
>>>>        test_acpi_one("-cpu cortex-a57 "
>>>> +                  "-machine acpi-pcihp=off "
>>>>                      "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>>>        free_test_data(&data);
>>>>    }
>>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>>>        };
>>>>    
>>>>        test_acpi_one("-cpu cortex-a57 "
>>>> +                  "-machine acpi-pcihp=off "
>>>>                      "-device virtio-iommu-pci", &data);
>>>>        free_test_data(&data);
>>>>    }
>>>    
>>
> 
