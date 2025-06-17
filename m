Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2583966njc;
        Tue, 17 Jun 2025 08:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBy4vuGC6561urmQB0KgtZLH/5d48omCtHU3cVARD2SpN6ULO9L2ulaV9LFYf6hlQsG6L5qIkA0/CZcA==@linaro.org
X-Received: by 2002:a17:90a:58f:b0:311:e9ac:f5ce with SMTP id 98e67ed59e1d1-313f1db8063mr13648049a91.21.1750173138861;
        Tue, 17 Jun 2025 08:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750173138; cv=none;
        d=google.com; s=arc-20240605;
        b=jhPBAKHsusA0ngufMKCTAzTeaZ7O2Zk06uBknXJ0FY6gZacP2uM1ji74Sh/npeGDBo
         W/tuAVqdG+uNmD775EV0IArCStjjum9JGBjrpigrULn6QGOfcVoUg9p0eEThQZEF0raH
         qlsYTtvLnCXTvGtX8AaHrN51Oe6/XmKJcjiSuwj1n3KQrOKxsJfHH47gUOVFsHifbxss
         IEmXL/9wvZOnDSLmY4JpjjMoiCVUSVEPiddN/+uIupbmITrR3sBbNUKuxeN+tX8r0gF3
         qe5Khb/0LFXr28kOpgwhKsdLiGXwUvAsQRBEXAUnkhRrZGIQ3NUrIijRB41vQpPM45nI
         7Gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fciHMrb1RhdWgU8CF2UM/JCC3ifa5+TdQJwKl7tzpSA=;
        fh=490uC9o3Gt9peTr/Fk2njmipR3RMxDzIjs/4GuPvdwU=;
        b=PtrqenIAI78b2QXWmkde/Ha1oOIbUbykyCumHMfjF5Vp/FqFZXifTPOfmwncZqgpog
         iwZjjZhCeMN0N6ed3F0jBAA3CUaG9/Q6pG3CDFjsIK15SllSytrRAAi7ryGbMQQQveZ5
         NZ2I/ckWzoa2bF3Z3QouBx/lQtX0nCcreq8GI5dazK+GGZ61XVZdMYAGKSeKOCnpJD9i
         +8eB408nmSwxPImFW4wRbN+lCwpNgRkULR0NCRm5FxZF6QEfgcQ2Gkf8KV0LcgdyJfsp
         /3wDcGOPEDOmQ7AdUgb9kEZwZruEiqkNKvvQvVV0VnAJGw1jFXNLBOiEPFCmwRolDZjJ
         vIdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BB+WA8uA;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e62498dsor94446815ad.1.2025.06.17.08.12.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jun 2025 08:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BB+WA8uA;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750173138; x=1750777938; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fciHMrb1RhdWgU8CF2UM/JCC3ifa5+TdQJwKl7tzpSA=;
        b=BB+WA8uAEIAaGLIuxbnpB6CM8k+bxyjYIb12ewmYG7JHFC4he15DXnE9wy2Yz3Rssw
         YQKTDjeb+PKaw+sJaWuWPXnx7b52XK8TdtQ1wC4q7uQ0U5J7UbB54GKQqSQFy69aW1+N
         TcN4gQWszhIgDYmp2lz2Ca3JI4nVbJ5MGYI8Ho2NEtzDaqvGw6P3vNCAQ9SUZNmBaond
         8jextxR3cuBiNIvE37RF2YtkBAu57UsV0rManOSChFKZSMOgBMvrsXR0oriEhcrRn05E
         ItbuvNJqSVfgeWuXcFpOUp7uWHuj+LUtCkST+GnPdfSQ9+lP528dkCfEtDCpdHwBctM5
         N/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750173138; x=1750777938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fciHMrb1RhdWgU8CF2UM/JCC3ifa5+TdQJwKl7tzpSA=;
        b=Vl2ZjdrKzSAPFA2cZCSPgsYA1CfERMObIfDx3UAGSblUiYgD1N/I1K3ZTyx/3T6U7h
         kafoZbWUf6YzIXTe0AACn+vVfbp+/aYVEs27fE0v1sV9zdp9/AB+IdXdKUakzqVaB8am
         cnt58dRA3UNHZQzqocqWKBaBWyVK3B6CJRAnI6MfDe8w5r3Je9MkMHVa+Z5EuEoTYHJg
         zWpBZK3kKridYiDBjP69yj38ri9SHrvNIhQueC2XuwSVTHVJwuWWAK9cpAi4vu4e/QpH
         b5y93db9w1eHM/8y4rE8tHl6r/LwRkKuyFKEtX8yFK7flZd4lKNpXFNIT4z0Wlts1xVb
         FHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoPhIMIRJdNjXDCbhbdB0Cf9iN5QV85abZzRu72i1bnoJMoTLZkymjVwfgmosYNbGMFWIySnlNrsqMhw==@linaro.org
X-Gm-Message-State: AOJu0YzOa/aptTGkooBrx76qdj84pPLezGrUjy3yf6tDNkb6bmbzzPnD
	2JfAh/9Nm46hsMkMkinCNjcfe4H6o0ZoMn131NzaWcoBHAR8X+3fZF/7sGsG+TqEcr12YvpnVAH
	8nRSPumo=
X-Gm-Gg: ASbGncsXsJpG5mrXt/EiIUZm7xStMEAx8iok22RovgYQiqumYDnz5q2XM+95Z00Kun4
	nJJ8TRML8+9Q0mQGPThHJjKgPLpjOPwpBqShxjPIE2GrcsHbO6FInbWC1/IThMEofeaGP1YQz1T
	vMk6sdKMK89s0yCSUQPgOrChi1VJ3Iw0zKTXWucDgdYQO/xkwc7+5heSjA6X3LO0JpzGp+WxWOg
	u9DEYDR8Dn9iV5ZA/Yy7c04CMGK0fB7847iUCspQVCiHaX4XYGcHlTh93V23N5DVusN5xB/HToM
	uyWm1dduzTNDzAOz+u5VQKceyq2SdoPEyURLIfrLRcQrgB7i2HC3c4JPhXtZYrzwudDncIszRg=
	=
X-Google-Smtp-Source: AGHT+IHusw4gYE9nMye5TSbsypo9tu93hhO9fZl83ExCWixixzusf5g9aHAKzKOYwgTUWwE4M8n7fg==
X-Received: by 2002:a17:903:110f:b0:235:129a:175f with SMTP id d9443c01a7336-2366b3ac2d5mr210834775ad.34.1750173138305;
        Tue, 17 Jun 2025 08:12:18 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782f1sm81148105ad.134.2025.06.17.08.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:12:17 -0700 (PDT)
Message-ID: <3881403f-c618-47d1-afec-27592bd7be99@linaro.org>
Date: Tue, 17 Jun 2025 12:12:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] qtest/bios-tables-test: Add test for when ITS is
 off on aarch64
To: eric.auger@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org,
 mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-6-gustavo.romero@linaro.org>
 <fe166574-9e53-4e27-9c12-c91f3fc774c7@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <fe166574-9e53-4e27-9c12-c91f3fc774c7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FJrrfKR8Dvs5

Hi Eric,

On 6/17/25 10:34, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
>> hardware introduced in GICv3 and, being optional, it can be disabled
>> in QEMU aarch64 VMs that support it using machine option "its=off",
>> like, for instance: "-M virt,its=off".
>>
>> In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
>> table and the remappings from the Root Complex (RC) and from the SMMU
> I would rephrase "and the remappings" by "while the RID mappings from ..."

hmm true. Do you think it would be even better to say something like:

"while the RID and StreamID mappings from the RC and from the SMMU nodes
to the ITS Group nodes are described in the IORT table."?

I'm saying that because I understand the map from RC to ITS is from
a RID to a DeviceID, while map from the SMMU to ITS is from a StreamID to
a DeviceID, hence say "while the RID and StreamID". Does it make sense?


>> nodes to the ITS Group nodes are described in the IORT table.
>>
>> This new test verifies that when the "its=off" option is passed to the
>> machine the ITS-related data is correctly pruned from the ACPI tables.
>>
>> The new blobs for this test will be added in a following commit.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>>   tests/qtest/bios-tables-test.c              | 21 +++++++++++++++++++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8b..a88198d5c2 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> I still fail to understand whether empty tables + update if the
> 
> bios-tables-test-allowed-diff.h need to be done prior to adding the new test.
> 
>   * How to add or update the tests or commit changes that affect ACPI tables:
>   * Contributor:
>   * 1. add empty files for new tables, if any, under tests/data/acpi
>   * 2. list any changed files in tests/qtest/bios-tables-test-allowed-diff.h
>   * 3. commit the above *before* making changes that affect the tables

I think the best reference I have to it is the reply from Igor to me here:

https://lore.kernel.org/qemu-devel/20250506173640.5ed03a16@imammedo.users.ipa.redhat.com/

I understand there are two possibilities when adding a new test:

1) Like in the steps above, 1., 2., and 3., which are taken from the bios-tables-test.c.

That gives option A:

A Patch 1: New empty files uuder tests/data/acpi + list of them in tests/qtest/bios-tables-test-allowed-diff.h
A Patch 2: New test (since the blobs are wrong but we added them in Patch 1 to allow list, there is no fail in test
A Patch 3: Update blobs (actually you are adding the real blobs, or updating from empty to real one)

or (what I'm doing here), option B:

B Patch 1: (A Patch 1) + (A Patch 2)
B Patch 2: Like (A Patch 3), i.e., just update the blobs (add the real ones)

This is the sequence Igor confirmed it's ok:

> - Patch 1     : Add the new test, add the empty blobs *.suffix files, whitelist such a blobs
> - Patch 2     : Update the blobs in Patch 1 with the ones that make the new test pass and remove them from the whitelist

Also, Igor says it's ok to add to the allow list the blobs that change at the same time
we add test that changes the very same blobs even when updating an existing test (not adding a
new one, which is slight variation):

> - Patch 3     : Add the APIC.suffix blob to the whitelist (the table that changes due to the fix)
> - Patch 4 - n : Fix(es)

"3 is not binary so it can be folded into 4 or be a separate patch (either way works for me)"
  
The important thingy is to follow the rules:

1) Don't make a commit which fails the tests
2) Don't fold a blob with the commit that changes the blob

That's my current understanding about it.

Let me know if that makes sense to you. We need to reach a consensus on this, confusing as
these acrobatics may be! :)


Cheers,
Gustavo

>> @@ -1 +1,3 @@
>>   /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 0b2bdf9d0d..4201ec1131 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -2146,6 +2146,25 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>       free_test_data(&data);
>>   }
>>   
>> +static void test_acpi_aarch64_virt_tcg_its_off(void)
>> +{
>> +    test_data data = {
>> +        .machine = "virt",
>> +        .arch = "aarch64",
>> +        .variant =".its_off",
> you have a checkpatch error here.

ouch, thanks, will fix in v5.


Cheers,
Gustavo

>> +        .tcg_only = true,
>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>> +        .ram_start = 0x40000000ULL,
>> +        .scan_len = 128ULL * 1024 * 1024,
>> +    };
>> +
>> +    test_acpi_one("-cpu cortex-a57 "
>> +                  "-M gic-version=3,iommu=smmuv3,its=off", &data);
>> +    free_test_data(&data);
>> +}
>> +
>>   static void test_acpi_q35_viot(void)
>>   {
>>       test_data data = {
>> @@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
>>                              test_acpi_aarch64_virt_tcg_acpi_hmat);
>>               qtest_add_func("acpi/virt/topology",
>>                              test_acpi_aarch64_virt_tcg_topology);
>> +            qtest_add_func("acpi/virt/its_off",
>> +                           test_acpi_aarch64_virt_tcg_its_off);
>>               qtest_add_func("acpi/virt/numamem",
>>                              test_acpi_aarch64_virt_tcg_numamem);
>>               qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
> Thanks
> 
> Eric
> 
