Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5361274njc;
        Wed, 28 May 2025 02:48:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXloxwRK1jDgT7DQhwx9tq+x1n6g+nZUetQWCizaoaHw128wK2gDjvcIyc3HoQGG09wo2g+p4+GtZzqeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGlZMbGKHDO7/SPIFG8GSS2EIhKW1H46ARAI8eUnZ7Plk1C+xK5zdzlqv8TDrotyeZy1v2j
X-Received: by 2002:a05:620a:4001:b0:7ca:d4f2:a059 with SMTP id af79cd13be357-7ceecc3519amr2705488185a.53.1748425707385;
        Wed, 28 May 2025 02:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748425707; cv=none;
        d=google.com; s=arc-20240605;
        b=i4+8shlgYHxJxtPpjxm9ds/xVTtpCitBbZnlJgu5M8pUpfEVpaTcKWB0yUMHNAN4fo
         wRm/NFPHPmk4lFRoL24zN5/3Wb6yE1SrrHsz3G1PVb9DYcpx6TAGMP73MwrCVp/296eU
         8+SjrY7RCIKkLbgtBMvqyPB33bKBgTniLX6lKHOTSllovPhUr+fa8AJle8GGNUOqAfVZ
         pBiGofl0jL2ID67eS7H3NrGfIf3Np9VHSgA/sYELuIOPx5oRZs9loVwlNxDyE+WiR2g8
         x5fLkeATvPJZnQAyr1fLA0+meBl4qzXsmTD0zhxt1XImZa/t2erK26m4zUCgFRZFRTbd
         pNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=fvV46O2v4fYzg5f8Hik7aieLH3aHVglYDkm52B/rBtQ=;
        fh=qOvdPbN8Ww41l+CEMjNh/NGMCGkJmoFuv5cx+4SSDuU=;
        b=WYu06PNEaKK8RmS/wzVCtokEINGQW9xgaxCed5FlgfmDYKhR8YDN2uyh6Sa34Fb/Kt
         DGjMLH5OAa9F4NLtZ+2jkqof+lrPNGw7bRsEnTzcrPIU9fl1j//eirvhmyvKausT+sdu
         Ah+pozv9EWdy7vr9QOfQNTWLIEjg3AB9M/P/6Mc81RE/T43qdKG4IoHGRoWNWo939p50
         7xashmMw5UWJazkfFu4UJ4xAMbE3Idma7s6LjF/9y2ckZAL9EoTVK8UzQjsbg5u555Q3
         vtJcP7q/aWAEI813kE8K1TXEec8be5LUxa8zA0HSYnLv2sodjUs5l1IiTqufI6syiclk
         pctQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1aQjJqD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cfb81f504dsi96912385a.12.2025.05.28.02.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1aQjJqD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748425707;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fvV46O2v4fYzg5f8Hik7aieLH3aHVglYDkm52B/rBtQ=;
	b=C1aQjJqD4X0G2AjeqJ+LVOUnHRx8wKXE1A6siAg3ksHfssqrPKFYgObDpzXJNcXtVv1Eat
	6+vPcVnURPngw7xMZjPxuHbZ2pkAaYfd8siVw3HvKpX6OxGewdLTu1qjSj+4StThfy7od8
	/rzjJQnHWQ3Y08xTvUAckJUbdf6uhVA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-zfYoeu1pN_iV-KAgekirGw-1; Wed, 28 May 2025 05:48:24 -0400
X-MC-Unique: zfYoeu1pN_iV-KAgekirGw-1
X-Mimecast-MFC-AGG-ID: zfYoeu1pN_iV-KAgekirGw_1748425704
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso32627155e9.3
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748425703; x=1749030503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvV46O2v4fYzg5f8Hik7aieLH3aHVglYDkm52B/rBtQ=;
        b=ukjamcplD+7bkQpBt8ROCtuYC3ksl9CLtasCCMN41JA9Anci81GbfSYdpAKysGhZHy
         UQHVFktHlJkoUYke25dhALw3kW8S1+BWY4rbKM3Hv6WDAmOiw9hJSOO3LbHvsmG2hENM
         DXDtQnC3w5OJ1I37CgU5MuoTmnbyD9swJ9bJlUyeNimwp/QtrWjXXRGxvTd5dgeQ95Rq
         QSf50tzCf9YQn3p25dz/kvvfxK7uP/yQlOnaJdsBfMFU2K1zogrwcO3OlXIF1QsKUKXO
         +O3k3ihvxfJE/CJl81hc1h7W6LFNYBXjipFlxY9AtKM+ULmTN2zFNWQGAdaf8as/T4np
         4w0A==
X-Forwarded-Encrypted: i=1; AJvYcCW0t3LMrk6dJEOXg+emZxi+xCWqXgoYMbzGgVXDvRuwnbdJ/3ubRsVFsSuzc1nhQrjn2/Mtqc0y30zOyA==@linaro.org
X-Gm-Message-State: AOJu0YxLOwa4V5Nnjm7yPwMuOTMaLTZTK1nCJDLOU4LatBdVgxzqLJ/8
	DRRNFvj+8pPLe7cRm+kfTLHzRvoIctHEXZpgsc/WpwfBjk7G845o6LLqdrtpOsF0lNRPH023MXQ
	IcWiKnb0GWiUPFe1ecNPFbP1GfcrN1hMRgK2M/f6KiOSvrRzACU8Iz6u4GA==
X-Gm-Gg: ASbGnctCCWYVTtlSenUf2U8o2cJOvEVnyF9Es8EjC2a46mRjCVQnjawhPK1uUUqu9Sk
	4QE9CezsG/ILUQJqJENvVVtYgDav3y6FMTGBmYTe93NwbnavL96rVlMKWnp94zSnfXzjgUfLJf0
	t3E2WIsk6IKRUBCyeDW1qqe000/CL0ujHSuBirueqUmDpMeVP635us3VJRz2Srud6f1Q+m+3E6V
	9M5klR3KMacqPRSCMVlOSEqUDosHXu82cfHj+uJqTJsiO4Ek6HJM81TxxG9isZa4e9UjmIs9x5n
	/D4FD0OS6mbF4YnIVl27gWKG9jzIXa4+OJtfWnVFEFXfFhUW0NvEnqKJ5SE=
X-Received: by 2002:a05:600c:3c96:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44c91cc5586mr187075325e9.10.1748425703502;
        Wed, 28 May 2025 02:48:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3c96:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44c91cc5586mr187074965e9.10.1748425703030;
        Wed, 28 May 2025 02:48:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064aeb6csm16135615e9.24.2025.05.28.02.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 02:48:22 -0700 (PDT)
Message-ID: <fd44ef37-ef02-4e60-817d-1362c76433b0@redhat.com>
Date: Wed, 28 May 2025 11:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-25-eric.auger@redhat.com>
 <20250528113813.47086516@imammedo.users.ipa.redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250528113813.47086516@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1z-_F4tI1j90zJl_NAvLWO7DcGAKlHnozZLuVRsp1CI_1748425704
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: kr/NvnXx02CH

Hi Igor,

On 5/28/25 11:38 AM, Igor Mammedov wrote:
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
> it would be better to test whatever default we end up with.
> (like x86)

See my question on patch 2's comment. We intended to have tests for both
modes (legacy and acpi pcihp). Gustavo added some new tests for the new
default, namely acpi pcihp. Now I did not really understand your point
about keeping legacy mode as a default.

Thanks

Eric
>
>> ---
>>
>> [Eric] also added acpi-pcihp=off to test_acpi_aarch64_virt_tcg_numamem
>> ---
>>  tests/qtest/bios-tables-test.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 0a333ec435..6379dba714 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>      };
>>  
>>      data.variant = ".memhp";
>> -    test_acpi_one(" -machine nvdimm=on"
>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>                    " -cpu cortex-a57"
>>                    " -m 256M,slots=3,maxmem=1G"
>>                    " -object memory-backend-ram,id=ram0,size=128M"
>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
>>      };
>>  
>>      data.variant = ".numamem";
>> -    test_acpi_one(" -cpu cortex-a57"
>> +    test_acpi_one(" -machine acpi-pcihp=off"
>> +                  " -cpu cortex-a57"
>>                    " -object memory-backend-ram,id=ram0,size=128M"
>>                    " -numa node,memdev=ram0",
>>                    &data);
>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>       * to solve the conflicts.
>>       */
>>      data.variant = ".pxb";
>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>> +    test_acpi_one(" -machine acpi-pcihp=off"
>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>                    " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>                    " -drive file="
>>                    "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>  
>>      data.variant = ".acpihmatvirt";
>>  
>> -    test_acpi_one(" -machine hmat=on"
>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>                    " -cpu cortex-a57"
>>                    " -smp 4,sockets=2"
>>                    " -m 384M"
>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>      data.smbios_cpu_max_speed = 2900;
>>      data.smbios_cpu_curr_speed = 2700;
>>      test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                    "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>>      free_test_data(&data);
>>  }
>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>      };
>>  
>>      test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                    "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>>      free_test_data(&data);
>>  }
>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>      };
>>  
>>      test_acpi_one("-cpu cortex-a57 "
>> +                  "-machine acpi-pcihp=off "
>>                    "-device virtio-iommu-pci", &data);
>>      free_test_data(&data);
>>  }
