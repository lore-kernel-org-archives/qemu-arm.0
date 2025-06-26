Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp136164dye;
        Thu, 26 Jun 2025 03:04:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXNO4pWM1l2qKP/lGgaVT3PdkJADcfRbo+rr3ntRtR/OCdCYgPSeY1KkNr10M2ktZgVhRtWwSxx3/BMA==@linaro.org
X-Google-Smtp-Source: AGHT+IG9xTfDQi3hDnR4WcJRwvPQIDIA/T4D9e5/V0KKTrThEMa7blnTUBIHoU3y8ocqE9t1R8Hf
X-Received: by 2002:a05:622a:205:b0:48a:e2ec:a3b4 with SMTP id d75a77b69052e-4a7c0670c5bmr102426111cf.17.1750932251443;
        Thu, 26 Jun 2025 03:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750932251; cv=none;
        d=google.com; s=arc-20240605;
        b=NodHJ5osMWHCTsBMPxPJR/CPjPR2dT71R8RDzuCUbjGAzfRlVUDfW8RCW/Wis5gxGJ
         RAILNOf7mpbZyqIugpmHbP6Dc08uqNIc6DfGl9AP5kFMWPUvZlChSRXA3T0tRPVhhYjc
         xQCvj+shKoXPNr1TuPrz7zCymiEkLkMp7tAICICjU6JvGTNt6IC8PClrgJLgVjcSDq/C
         fCORP/ZQCQF0uEh0AeC5oXuBOJ6k6qNj6b4H1lUMlK5kcksqqInYor4crGjp/I6CIplX
         NOvGUc/9PsFFInYuiv196Jk6ftSh3mg+EBwynHjJhQq1bdpmGOmvguvpOWEu/k1UHLgj
         pUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=CqIMLUpLTvuoDk139361pTQIme9E1ERhTOI3fzvNR/s=;
        fh=qw/wWFjfUF10y0uZYQdNNc/ZIWkhohZVvE5dauLwdgA=;
        b=e3rQxBydtLndSj+6yUTHCdn9qvi5JD5jY5Tqw4ZcxtOMsEg/Mq/Yju5t87BT2LqFrQ
         qxoa61HSZ+VRM/HaxqMk7y0ZQnH6ShYg0abwn33URbfPAME8fPO9ZtJVMpW/jAY2CqqB
         1/R7CjQ45N9QCYOEMzDIeXMbZroqCHvjHHjBTR8eX9Mmbx7AanH0bFinvdOS44Uy3NAX
         n4dYXZywp24jNn8cWnV1rIkMWxPnChZ6GTFh8N2dRsku86+bu1XjFDTIy/TY7bs9nbhq
         22EEdRzFMWVVUCatTToGV1mVWEVMiVAIbBR9xUZRAiTOpfBYI0WcVaZCjF4P46z0k3p/
         6mBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bMlmZZdI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d29d5si149536151cf.448.2025.06.26.03.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bMlmZZdI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750932251;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CqIMLUpLTvuoDk139361pTQIme9E1ERhTOI3fzvNR/s=;
	b=bMlmZZdI04NmhFQeq5QeQ+Knsy+Q2N1Zli91CKLwQWilHSQJt33XE+br+J4iTk2QY/8oF9
	ihtvYUKFQHfKsVGu6uVXUHiNIzsP0H3CO03MLZR3bjDlhKrC/z0MMTViIBGgaImrDbfc0L
	GYRAGvP8q/H5dxIuZdUz6LOfq3RXrfE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-L5z3aKSmOJ-CT5HpMGV88g-1; Thu, 26 Jun 2025 06:04:09 -0400
X-MC-Unique: L5z3aKSmOJ-CT5HpMGV88g-1
X-Mimecast-MFC-AGG-ID: L5z3aKSmOJ-CT5HpMGV88g_1750932249
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so469802f8f.0
        for <alex.bennee@linaro.org>; Thu, 26 Jun 2025 03:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932248; x=1751537048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqIMLUpLTvuoDk139361pTQIme9E1ERhTOI3fzvNR/s=;
        b=j69ZHj6F261UvGb57yr20dv1Mxb9ftf/iNTVPabDsq4jBP6jIPfIGHvi2nSsMZeE5z
         zn4DouQkPzPrsauXcecH1LRt0B8XmhWpdjPShg5wsbCpZMvMohU500y19Vgq6oM4JsW1
         7qM4KL1Vs2Io9kNGHUPjTQKC65TMb/dx6xAnomW9zlC1GATCnCUuvUkeKFox36Cuzbhr
         0nlf7WJ+s3+rPFaz8OR8+fIU6k5KyuHJ/sbTmaMp99F7HHkunu0l2VuG3pFrwe4yAtnO
         VG5bQAPIfqeX8k948L69uZPi3KFUMN4eiIrw7954rtOqx2s2BA1UEcWS+oHEOpVqwVTK
         tFGw==
X-Forwarded-Encrypted: i=1; AJvYcCWt6lIm7Fq/JKPixYgi90FY8uD6iSs/xQbE09Xlz4OBFFw9dOpW5JNbpRoutwkp2cb9hnje9fXP5p74RA==@linaro.org
X-Gm-Message-State: AOJu0Yw4RDMDQQ/hhFNaSL08SK36oXiQeJi+4pas8LfN6LVCiUMS9Y5w
	PMgO2lRtF/6kvE4Clh8kSh4wTtSmPmReP8rGynX5A7XibMkofUeRaJH1VWvuG5OND/hte3XDl1u
	sctzGw+FWlJzp5u667EYUa8H1RM8AfcqxEaAlPbAV6JSpHJ4HfnyUOJcOfA==
X-Gm-Gg: ASbGnct/IZtzp5O7JD/RfaLarTsriiDJlkR2j6CLmvWc2zxzOooPpu/MbP16k1q9Ofx
	wejNqzozOcoJ41J6MYaa5bRJBnFD/ZcdSJX7vG8Tg3hZ5j6DB+8zUZnIanzCs1PdLDNDM9jmK8b
	wTh4vpP+vU3iqkK5i82AgIbsjAbjZ8MOcxq269PkgaJwCDR2lMS24SuE+2vy/PHTpvw60FvoQ1P
	IY9FATTQ5wFnvz1qx1kWuXGO0FaPh3ORL9FvQJes5NSY2bhTwRrraI0QrH6k1igQ5QemN5hzcqP
	pJ/jkpKsy6SNF5eCkOzKvtXf0wcC+12EHKfP25Tsj592yaRcsVGqnw4C7XDF/XsbRyWOqA==
X-Received: by 2002:a05:6000:1acd:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3a6ed664462mr5585656f8f.58.1750932248446;
        Thu, 26 Jun 2025 03:04:08 -0700 (PDT)
X-Received: by 2002:a05:6000:1acd:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3a6ed664462mr5585615f8f.58.1750932247906;
        Thu, 26 Jun 2025 03:04:07 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff8d9sm6998132f8f.70.2025.06.26.03.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:04:07 -0700 (PDT)
Message-ID: <cebadc10-2525-4646-8810-6c6cc1656b69@redhat.com>
Date: Thu, 26 Jun 2025 12:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 28/29] tests/qtest/bios-tables-test: Add aarch64 ACPI
 PCI hotplug test
To: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-29-eric.auger@redhat.com>
 <20250620114029.00005a94@huawei.com> <20250620152232.36683ffc@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620152232.36683ffc@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RcHJKuG8qYnsYdMgyVXX__j5NPjHBVox5FZHBDJQMMo_1750932249
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: lTdIDp5nslDK



On 6/20/25 3:22 PM, Igor Mammedov wrote:
> On Fri, 20 Jun 2025 11:40:29 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>
>> On Mon, 16 Jun 2025 11:46:57 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>
>>> The test uses -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
>>> to force the usage of ACPI PCI hotplug.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>  
>> Could we add the necessary (I'm not quite sure what) to trigger the _DSM
>> creation so EDSM gets used?  I'm not keen on that being dead code
>> wrt to tests on ARM.
> relevant x86 example:
>
>         " -device pcie-root-port,id=nohprp,port=0x0,chassis=2,hotplug=off,"    
argh. I did not see hotplug=off.

So then static acpi-index also works on ARM. So I will make edsm
independent on acpi pcihp

Sorry for the noise

Eric
>   
>                                  "addr=7.0"                                      
>         " -device pci-testdev,bus=nohprp,acpi-index=501"  
>> Jonathan
>>
>>
>>
>>> ---
>>>  tests/qtest/bios-tables-test.c | 34 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 34 insertions(+)
>>>
>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>> index 0b2bdf9d0d..4b9e391eaf 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -1643,6 +1643,38 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>>  
>>>  }
>>>  
>>> +static void test_acpi_aarch64_virt_acpi_pci_hotplug(void)
>>> +{
>>> +    test_data data = {
>>> +        .machine = "virt",
>>> +        .arch = "aarch64",
>>> +        .tcg_only = true,
>>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>>> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>>> +        .ram_start = 0x40000000ULL,
>>> +        .scan_len = 256ULL * MiB,
>>> +        .variant = ".acpipcihp",
>>> +    };
>>> +
>>> +   /* Use ACPI PCI Hotplug */
>>> +   test_acpi_one(" -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on"
>>> +                 " -cpu cortex-a57"
>>> +                 /*
>>> +                  * We just pick address=0x04 for the root port to avoid
>>> +                  * collisions with other PCI devices on the root bus (pcie.0).
>>> +                  * It could be any other value that doesn't collide.
>>> +                  *
>>> +                  * The 'chassis' and 'slot' options equal to 1 have no special
>>> +                  * meaning here, could be any integer, but we set them to known
>>> +                  * values to keep the test consistent.
>>> +                  */
>>> +                 " -device pcie-root-port,bus=pcie.0,chassis=1,slot=1,addr=0x04.0x00",
>>> +                 &data);
>>> +
>>> +    free_test_data(&data);
>>> +}
>>> +
>>>  static void test_acpi_microvm_prepare(test_data *data)
>>>  {
>>>      data->machine = "microvm";
>>> @@ -2580,6 +2612,8 @@ int main(int argc, char *argv[])
>>>              qtest_add_func("acpi/virt/numamem",
>>>                             test_acpi_aarch64_virt_tcg_numamem);
>>>              qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
>>> +            qtest_add_func("acpi/virt/acpipcihp",
>>> +                           test_acpi_aarch64_virt_acpi_pci_hotplug);
>>>              qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
>>>              qtest_add_func("acpi/virt/oem-fields",
>>>                             test_acpi_aarch64_virt_oem_fields);  
