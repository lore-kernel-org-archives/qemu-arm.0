Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4626045njc;
        Mon, 26 May 2025 23:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkzNMqSP1XjyKUTUkaYGoqn4gTLlEbFzJUtDeFf6IlnbYZKR3dAt2u+oMIUThYRyJ5BO7Bh7uKArAv6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHj2nMXlIlQmK0Mfhj0g2ScR3JXTGqSWJS+J8sMA+L0p1MSHwR3pYp8dVKZdF4aOapimSjQ
X-Received: by 2002:a05:620a:2892:b0:7ce:bb07:9de2 with SMTP id af79cd13be357-7ceecaaa3admr1356891785a.0.1748328413315;
        Mon, 26 May 2025 23:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748328413; cv=none;
        d=google.com; s=arc-20240605;
        b=goJPatieSwYYH6u2RH2TXnU3zvvCht2bUmWIN3agt+PQ6oHX/1yGFUhuI6ZbpH7+xR
         eE/R49/esFrhy40S7efVxTxd6cOLrWnvhV0lE4xUruz7S4e6Ho4THnQ1xwM3WK0stDkn
         dUQoalWyWnwHZLe5LvbU9mUPXBk2lnMOAnAwTN/0GxU+ullHlnPxMa/BddfQ8eT04ec0
         Hu5ntLqg60wdmJ2MICVyhR+rPEEiCDUpciYrHgoBgcU/IgwQgVLuduaMTgRwLyMN9R+I
         WBjTFs32uzmUbWbxO5OSiEljTUP8a9PG6zW/yNzocfiP1hzbkCUbtiqm2Gk95G7PcNzE
         Hr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ZKcUKj/LlKENAraKAjOyxIlLxLJFH0ua2ybc/69QUec=;
        fh=IwWCiAWxT+ro7OfIDM6U+AsRcOJuT9+kWSfV903DrG0=;
        b=DsfHs2wGu5yKqqdrWdPhdwkQ6LTg9bQ58kn+JYtnL8C9fw6UXTsPeujj9pXYZ6tWpC
         /fO50ptRipAztJVGngSRA7PJP0Z+2JUx904AC9CJD00AL6CkMQBUpTtxENcSA6tP/sST
         l9KWGOIWdvrEtFCw5Ed/cwI1lhLClJJbWnPGuLwwAr4rhAp9gNlZMzozDwAaTjC0vZRt
         tvPvdAdVXMFigrVBV48IpT7to/WQ8lRjBRozpUw25g2GyZ5ngFNxqFKi5z73Vbkfz9Mb
         fgXb6cci8D3YrUZihDmH49buINUgSLqH3CcgRZsyCGRKeUuGtBR2vMYlU02051GzTymG
         to4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d0T3xGPM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7ced964528csi1235071685a.552.2025.05.26.23.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d0T3xGPM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748328413;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKcUKj/LlKENAraKAjOyxIlLxLJFH0ua2ybc/69QUec=;
	b=d0T3xGPMX7FWrV0Ei2C1Iqu5/ftBc91Vb5GlsyH20jXqGugjwv3SGSvosVh1ySFdl6Rpmo
	oUZoY8atSsU3Ysk4nZKSESvzpzS7N6GAysG70E8dJToSR7TD8w+wA4MdXkeNy2PsurmF8u
	dNMLTwA8CQwwIsf20SDiqAMnnoALKnI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-JHyiFoU4O_6zsAMMywmPBw-1; Tue, 27 May 2025 02:46:49 -0400
X-MC-Unique: JHyiFoU4O_6zsAMMywmPBw-1
X-Mimecast-MFC-AGG-ID: JHyiFoU4O_6zsAMMywmPBw_1748328409
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso17359245e9.0
        for <alex.bennee@linaro.org>; Mon, 26 May 2025 23:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328409; x=1748933209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKcUKj/LlKENAraKAjOyxIlLxLJFH0ua2ybc/69QUec=;
        b=Zx6lUwe+ABmCcuTsayAWkCuxCzLwjRaWnMhly5SOHFZgdVGvO2j1gywOVoBpIIDCuw
         EGhSQeCcnXbRJX/E+YmfGQ0EwchzPKTi3n5oX7XvfBkWT5zbbH3lx6LZRyHRNkzmsDTU
         VmKcMvLO2fFGy/yGbDDmYz/igGbczUIIfT5JeV8sTJvNlZgd07jWf9vfiqGSyJ8cxL3r
         8PFe2o4V/aVHCyAiG1hjLhbrpPaX/IYHnrB1dKvCCEoiN2yzb05XOCtBx6JbdDUJmaCj
         qfdCCMDG+bbrBGQXTvE7ezOGFSX5xa2HhfL2xxbyrY3Q2KhRXCPss4LSEOQ4Gj5+524+
         4jGw==
X-Forwarded-Encrypted: i=1; AJvYcCXCjNKjHQvyf3CXRXX+kMDMvzNFacov3V1kTOcuPtYjAePE4GzzsFUTlATxACcCZ1/AMcnAT8rlFnL3rQ==@linaro.org
X-Gm-Message-State: AOJu0YxccuuyRkV3JqUW9D44s0AWz6sl1Z9NiDzHfhw6C0d4o1cJZW8f
	EI/cA2PDT3W00blbJ3NRv2cxOcj2OG/LdOlV0VxXw2zJtby1pHGeliNCAZTzsaK3XD/HVuYtlMg
	KDugh8sAYjpnhPm6H33XtMcz+uxQay0yOYweHSmsCTI9ACBzzZN71ZpYN2A==
X-Gm-Gg: ASbGncvvCAyrK3DsBH5+evg+URZROBBTsk6kiDeprNUb0zK0AnUHCkeT+2MG9THQnhu
	25GX5Vm7vStyi7AwNK0Ov8tVxR5L82Ot5HWux3CF+9hRZSJxs5TqVc8fbXPc0rrlCcw/0yziqZt
	VcAvzAcaVRYiZrALGlaNoOnLoBLKjiycyxYmTPdxRLK/ys1pWAGaPVFXnXWMOY4bk+eXmcxd07R
	qJX/4JkD3701IV5fyBIRws9AZhdV1PtoaqCw8GyMh7WJCRCcPhuyjtTjowTcG8YP+ID63DLS0Sk
	Q9wJ/kxk97/okSU6yQCPkN6nEhMFd/Kag4CeziFXYY9RRPLFHUZRFjyCI4Y=
X-Received: by 2002:a05:600c:4fc9:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-44c91ad70d0mr133060645e9.10.1748328408740;
        Mon, 26 May 2025 23:46:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc9:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-44c91ad70d0mr133060355e9.10.1748328408358;
        Mon, 26 May 2025 23:46:48 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0552esm255876705e9.11.2025.05.26.23.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 23:46:47 -0700 (PDT)
Message-ID: <cdf2bcaa-ca41-4af2-9eaa-408f81f891fd@redhat.com>
Date: Tue, 27 May 2025 08:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 2/5] tests/qtest/bios-tables-test: Keep ACPI PCI hotplug
 off
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com, imammedo@redhat.com
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
 <20250526053123.1434204-3-gustavo.romero@linaro.org>
 <a9a8d55f-7409-4dd6-97f6-a373de9870df@redhat.com>
 <d86cd26f-c43d-4a99-bd9e-573d3d7cf8bd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <d86cd26f-c43d-4a99-bd9e-573d3d7cf8bd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q6rIMhoPyARWU0M8slf5WvjJB5BEQF_bA8DOvDByRNg_1748328409
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: btGGYrHtp86+

Hi Gustavo,

On 5/26/25 6:09 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/26/25 12:28, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 5/26/25 7:31 AM, Gustavo Romero wrote:
>>> ACPI PCI hotplug is now turned on by default so we need to change the
>>> existing tests to keep it off. However, even setting the ACPI PCI
>>> hotplug off in the existing tests, there will be changes in the ACPI
>>> tables because the _OSC method was modified, hence in the next patch of
>>> this series the blobs are updated accordingly.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> ---
>>>   tests/qtest/bios-tables-test.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/qtest/bios-tables-test.c
>>> b/tests/qtest/bios-tables-test.c
>>> index 0a333ec435..216941dbb5 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -1626,7 +1626,7 @@ static void
>>> test_acpi_aarch64_virt_tcg_memhp(void)
>>>       };
>>>         data.variant = ".memhp";
>>> -    test_acpi_one(" -machine nvdimm=on"
>>> +    test_acpi_one(" -machine nvdimm=on,acpi-pcihp=off"
>>>                     " -cpu cortex-a57"
>>>                     " -m 256M,slots=3,maxmem=1G"
>>>                     " -object memory-backend-ram,id=ram0,size=128M"
>>> @@ -1775,7 +1775,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
>>>        * to solve the conflicts.
>>>        */
>>>       data.variant = ".pxb";
>>> -    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
>>> +    test_acpi_one(" -machine acpi-pcihp=off"
>>> +                  " -device pcie-root-port,chassis=1,id=pci.1"
>>>                     " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
>>>                     " -drive file="
>>>                    
>>> "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
>>> @@ -1846,7 +1847,7 @@ static void
>>> test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>>>         data.variant = ".acpihmatvirt";
>>>   -    test_acpi_one(" -machine hmat=on"
>>> +    test_acpi_one(" -machine hmat=on,acpi-pcihp=off"
>>>                     " -cpu cortex-a57"
>>>                     " -smp 4,sockets=2"
>>>                     " -m 384M"
>>> @@ -2123,6 +2124,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>>>       data.smbios_cpu_max_speed = 2900;
>>>       data.smbios_cpu_curr_speed = 2700;
>>>       test_acpi_one("-cpu cortex-a57 "
>>> +                  "-machine acpi-pcihp=off "
>>>                     "-smbios
>>> type=4,max-speed=2900,current-speed=2700", &data);
>>>       free_test_data(&data);
>> On my end I also need to add -machine acpi-pcihp=off in
>> test_acpi_aarch64_virt_tcg_numamem
>
> Yeah, by reading the code I'm pretty sure this is required by the
> numamem variant
> as well but I don't see a failure here :( I have _no clue_ why the
> failure doesn't
> happen on my env. Are you running simply "make check V=2"? arm64 host?
on my end I am running on x86 host with TCG aarch64 configured qemu
make -j 128 tests/qtest/bios-tables-test
cd build
QTEST_QEMU_BINARY=./qemu-system-aarch64 tests/qtest/bios-tables-test
>
>
>> with that fixed,
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>
> Thanks for the review! I'm sending a v2 with numamem variant fixed.
>
> BTW, I'm sending soon also a functional test variant for acpi-pcihp=off.
OK thanks!

Cheers

Eric
>
>
> Cheers,
> Gustavo
>  
>>
>> Thanks
>>
>> Eric
>>>   }
>>> @@ -2142,6 +2144,7 @@ static void
>>> test_acpi_aarch64_virt_tcg_topology(void)
>>>       };
>>>         test_acpi_one("-cpu cortex-a57 "
>>> +                  "-machine acpi-pcihp=off "
>>>                     "-smp sockets=1,clusters=2,cores=2,threads=2",
>>> &data);
>>>       free_test_data(&data);
>>>   }
>>> @@ -2227,6 +2230,7 @@ static void test_acpi_aarch64_virt_viot(void)
>>>       };
>>>         test_acpi_one("-cpu cortex-a57 "
>>> +                  "-machine acpi-pcihp=off "
>>>                     "-device virtio-iommu-pci", &data);
>>>       free_test_data(&data);
>>>   }
>>
>
