Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2614999njc;
        Tue, 17 Jun 2025 09:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzDo9NImKcl96QTjxRVCQOiWXf0mJL7dUysHY9mT+Frwf9l0YSHh1T/BFofNVTel0XwU+DGodry7HU2w==@linaro.org
X-Received: by 2002:a05:6a00:178e:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7489ce45893mr22863175b3a.8.1750176135373;
        Tue, 17 Jun 2025 09:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750176135; cv=none;
        d=google.com; s=arc-20240605;
        b=DLC/eCdEijXlUVuv2DA9Z4KQiWDpTNlXQvuZNk37ZGZri0mBHr5SmBVMgxa7X0CA4k
         66m86So26mlH9pFhBtUJOtnBc9pQ9dfK3wBa7PMuw+8wW/LcGld5JlWg0nWjxAzFZ4wN
         +Rx8se7wV1g9rapCqRu3B6y9j53ax/NrieWf8ILOZ0fDhWgfmueTkTArLuu7b2N6kQcs
         GtQg4TXu9meISwOzX8wRhr2TXoJZEg/l9IRbCMXZuH0Hp5fpQe9bEQaB4avIF9aZgwno
         KVTeG9jh8+rcGVcgapICrYyoJSHKGHTfEs/lyBVQMnP+fyrHivBP8KH/YugtQc1YXrpK
         yCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o6n9QnxZQEp3aVXoKzmKc1ufO76DC8Dyqg4znXD0ODE=;
        fh=z3av2fFldwZvIiwxylgLZjuwXp4nZxz9wwJDUjRTeG4=;
        b=ANIoET5eWjbPccoXDL/U5AcjcySSYBva+BuGdcFMCk3oZEMOBLOaY/jQ8bUKokVUQ8
         TmbLvi3Wtd+q6aYiI+X2/F5kSmLTZJFrcY5PpdceGAuFdwAE3M/nbv0CikUIxwNv4mVs
         3rihdJ+uNBDL+DVY34Qft0uyxHOAvKsuOCqUYG/0a5N4hmst7ltCjMyhtGqfmPpnt6yh
         bX4jq9ViFKVjFj61OB+Jz0hBbPmo7nBp/IHpl9hg96kzc7mUwo1WOIc4Cdptk4I62yNx
         +kxA+s5W7fFPUNFv9S8yjiUBjkWOxlpW06j1SK0via85LNSDpt5QHp50P0ZayrHGnksh
         +69A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCkvH01I;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7488093e977sor6680232b3a.8.2025.06.17.09.02.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jun 2025 09:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCkvH01I;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750176135; x=1750780935; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6n9QnxZQEp3aVXoKzmKc1ufO76DC8Dyqg4znXD0ODE=;
        b=bCkvH01IOVkQLAOXO378Md1yq8YFtoPlBWzayzr8UEWuQp3VYy51o40Z2IfFgwrqQi
         /9p1y+Qwf1RKKxLmj3evKo/6SiVLd4ghg+R4qdfrNWoibADsEzFLY8I8PGjbYGUtJCVz
         rLwOOzlS93fdk204zK9E38QXlxzQ9oXS+7YdplKuAA/yuiP8w5l/1AxFO15KhNcU1EsM
         ewSme1oIlJRQDGjNJ5Lkj9AltPI4NSZwcPjb8T6+x0scgVTFdEg+4rxMzd7VLGOE7ByO
         sAY9uMVQOtIBni3WhtcKKyNNSy9N3wfqoZihsJV+BsjumNY52+1KOcuhL3bAZy61WQPM
         F7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176135; x=1750780935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6n9QnxZQEp3aVXoKzmKc1ufO76DC8Dyqg4znXD0ODE=;
        b=W8vFMnJTaD5WGMssDRyLLcKUFZ5lO5sc2SECgcE0fH/Uo7q0+8etYqL3sZ2vuq9O9X
         jHQ2PHGy2b0HjXEe4mtXAjYDAgKnY/X4QUVNYRPLhTa6uY5Cw5XgK9Q7apdmW4bRuPWZ
         N3PXnKaCnCjcAwc5U+JxB1szsln7kv1xn1YVoj4SAuFXvLN9o525BM6VStYq7dtcQHk6
         U3k9JlEJKzVdYXvyd/zyZYkE7vpe4clRQ5rWyrnYUJr7gI9EdynUGpwqwwy/AY7ZTdbu
         tI4wI3i7N1Up/Rl6v9BMx2A2f62eG90uxmSy4oP+a9fd541QgqsB5HMOKS7tZQRyEAqI
         m8wg==
X-Forwarded-Encrypted: i=1; AJvYcCU0uUwLmJbpX1M1RI6O3h2PZjoIirIKdOJmUl1/NylUCsZ6RIwzbV4Ib7pHvqj9c10Y0/rxWWUBHCBiNQ==@linaro.org
X-Gm-Message-State: AOJu0YyUVmiymEn7T4RWRqWvkXLJNhMPv74RTtmmDPlrq5Ls7LWK6h6w
	MZFGNNWviMUyw1t7izOBEX4dLAPzPrwM2QYhZCKYzVKBSkjrCOURaVyC1RpqCplklZwh2i4qCFU
	Zp28vGBQ=
X-Gm-Gg: ASbGnctEblGeBo/w3xq+06ClraN0YCqqpkjk6lxaY+LjaKH8Ghgoe/8p39jke9G6xor
	IJIsBRgGoDvZiGFtdGCAeQwSGeNnUXJWNANOa465JygHegIJp4t1UzaGot/denBouA7z8/pcZ3E
	tHM3z9VTmPPEvrcJIfJRBY3nq7ie7ZkxS4cyRQv+xWU9pOkVJP3MPDlOydCj+0/XWgXU9rkhnAA
	GWRA0k5g4mpdRYHCc+G4Cr7ydH4DTab/gSzG3FhAGZX7/Hh5CP17V1uciFHZ3dpXUTjwytxn23d
	G5KbC7lNFeDXCvQ5/sJP0m8DsdzxhDk9f9deqY4J5oLz5U/ci+LUOs2ZQYKAceIsEzriV7YGiw=
	=
X-Google-Smtp-Source: AGHT+IG7ORcj7hGyKP+K1856xWSJPgMTHtIdaYK3iwTAMrhn3+7Xef4Xwk08qX2sE5VKyVHzwCuMWA==
X-Received: by 2002:a05:6a00:4f82:b0:748:2ebf:7418 with SMTP id d2e1a72fcca58-7489d00e68bmr21133244b3a.24.1750176134470;
        Tue, 17 Jun 2025 09:02:14 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890005f47sm9406061b3a.51.2025.06.17.09.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:02:14 -0700 (PDT)
Message-ID: <e1c05a4c-ead6-437e-9287-84b77fcc9df4@linaro.org>
Date: Tue, 17 Jun 2025 13:01:58 -0300
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
 <3881403f-c618-47d1-afec-27592bd7be99@linaro.org>
 <74c1948a-3c90-431b-805f-b5a4238beecb@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <74c1948a-3c90-431b-805f-b5a4238beecb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: a3KAXPM9rhOO

Hi Eric,

On 6/17/25 12:51, Eric Auger wrote:
> 
> 
> On 6/17/25 5:12 PM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> On 6/17/25 10:34, Eric Auger wrote:
>>> Hi Gustavo,
>>>
>>> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>>>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>
>>>> Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
>>>> hardware introduced in GICv3 and, being optional, it can be disabled
>>>> in QEMU aarch64 VMs that support it using machine option "its=off",
>>>> like, for instance: "-M virt,its=off".
>>>>
>>>> In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
>>>> table and the remappings from the Root Complex (RC) and from the SMMU
>>> I would rephrase "and the remappings" by "while the RID mappings from
>>> ..."
>>
>> hmm true. Do you think it would be even better to say something like:
>>
>> "while the RID and StreamID mappings from the RC and from the SMMU nodes
>> to the ITS Group nodes are described in the IORT table."?
>>
>> I'm saying that because I understand the map from RC to ITS is from
>> a RID to a DeviceID, while map from the SMMU to ITS is from a StreamID to
>> a DeviceID, hence say "while the RID and StreamID". Does it make sense?
> I think I won't bother and would simply talk about "ID mappings" which
> is the generic term used in the IORT spec.

But I just dove into it because you suggested to use "RID" (aka ReqID, aka
Requestor ID, ah, I "love" these variations in specs), so I thought, well
RIDs are related to RC and StreamIDs related to SMMU, so, actually, you meant
"while the ID mappings from" instead of "while the RID mappings"?


Cheers,
Gustavo

>>
>>>> nodes to the ITS Group nodes are described in the IORT table.
>>>>
>>>> This new test verifies that when the "its=off" option is passed to the
>>>> machine the ITS-related data is correctly pruned from the ACPI tables.
>>>>
>>>> The new blobs for this test will be added in a following commit.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>>>>    tests/qtest/bios-tables-test.c              | 21
>>>> +++++++++++++++++++++
>>>>    2 files changed, 23 insertions(+)
>>>>
>>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
>>>> b/tests/qtest/bios-tables-test-allowed-diff.h
>>>> index dfb8523c8b..a88198d5c2 100644
>>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> I still fail to understand whether empty tables + update if the
>>>
>>> bios-tables-test-allowed-diff.h need to be done prior to adding the
>>> new test.
>>>
>>>    * How to add or update the tests or commit changes that affect ACPI
>>> tables:
>>>    * Contributor:
>>>    * 1. add empty files for new tables, if any, under tests/data/acpi
>>>    * 2. list any changed files in
>>> tests/qtest/bios-tables-test-allowed-diff.h
>>>    * 3. commit the above *before* making changes that affect the tables
>>
>> I think the best reference I have to it is the reply from Igor to me
>> here:
>>
>> https://lore.kernel.org/qemu-devel/20250506173640.5ed03a16@imammedo.users.ipa.redhat.com/
>>
>>
>> I understand there are two possibilities when adding a new test:
>>
>> 1) Like in the steps above, 1., 2., and 3., which are taken from the
>> bios-tables-test.c.
>>
>> That gives option A:
>>
>> A Patch 1: New empty files uuder tests/data/acpi + list of them in
>> tests/qtest/bios-tables-test-allowed-diff.h
>> A Patch 2: New test (since the blobs are wrong but we added them in
>> Patch 1 to allow list, there is no fail in test
>> A Patch 3: Update blobs (actually you are adding the real blobs, or
>> updating from empty to real one)
>>
>> or (what I'm doing here), option B:
>>
>> B Patch 1: (A Patch 1) + (A Patch 2)
>> B Patch 2: Like (A Patch 3), i.e., just update the blobs (add the real
>> ones)
>>
>> This is the sequence Igor confirmed it's ok:
>>
>>> - Patch 1     : Add the new test, add the empty blobs *.suffix files,
>>> whitelist such a blobs
>>> - Patch 2     : Update the blobs in Patch 1 with the ones that make
>>> the new test pass and remove them from the whitelist
>>
>> Also, Igor says it's ok to add to the allow list the blobs that change
>> at the same time
>> we add test that changes the very same blobs even when updating an
>> existing test (not adding a
>> new one, which is slight variation):
>>
>>> - Patch 3     : Add the APIC.suffix blob to the whitelist (the table
>>> that changes due to the fix)
>>> - Patch 4 - n : Fix(es)
>>
>> "3 is not binary so it can be folded into 4 or be a separate patch
>> (either way works for me)"
>>   
>> The important thingy is to follow the rules:
>>
>> 1) Don't make a commit which fails the tests
>> 2) Don't fold a blob with the commit that changes the blob
>>
>> That's my current understanding about it.
>>
>> Let me know if that makes sense to you. We need to reach a consensus
>> on this, confusing as
>> these acrobatics may be! :)
> 
> Actually I checked your patch and effectively it does not produce any
> checkpatch error related to bios-tables-test rules so your patch is OK
> (yesterday I discovered with the ACPI PCI HP series that checkpatch
> points out infractions to bios-tables-test.c rules!). Since it results
> in less patches I think it is better. May be worth to clarify that
> directly in bios-tables-test.c though.
> 
> Cheers
> 
> Eric
>>
>>
>> Cheers,
>> Gustavo
>>
>>>> @@ -1 +1,3 @@
>>>>    /* List of comma-separated changed AML files to ignore */
>>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>>>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
>>>> diff --git a/tests/qtest/bios-tables-test.c
>>>> b/tests/qtest/bios-tables-test.c
>>>> index 0b2bdf9d0d..4201ec1131 100644
>>>> --- a/tests/qtest/bios-tables-test.c
>>>> +++ b/tests/qtest/bios-tables-test.c
>>>> @@ -2146,6 +2146,25 @@ static void
>>>> test_acpi_aarch64_virt_tcg_topology(void)
>>>>        free_test_data(&data);
>>>>    }
>>>>    +static void test_acpi_aarch64_virt_tcg_its_off(void)
>>>> +{
>>>> +    test_data data = {
>>>> +        .machine = "virt",
>>>> +        .arch = "aarch64",
>>>> +        .variant =".its_off",
>>> you have a checkpatch error here.
>>
>> ouch, thanks, will fix in v5.
>>
>>
>> Cheers,
>> Gustavo
>>
>>>> +        .tcg_only = true,
>>>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>>>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>>>> +        .cd =
>>>> "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>>>> +        .ram_start = 0x40000000ULL,
>>>> +        .scan_len = 128ULL * 1024 * 1024,
>>>> +    };
>>>> +
>>>> +    test_acpi_one("-cpu cortex-a57 "
>>>> +                  "-M gic-version=3,iommu=smmuv3,its=off", &data);
>>>> +    free_test_data(&data);
>>>> +}
>>>> +
>>>>    static void test_acpi_q35_viot(void)
>>>>    {
>>>>        test_data data = {
>>>> @@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
>>>>                               test_acpi_aarch64_virt_tcg_acpi_hmat);
>>>>                qtest_add_func("acpi/virt/topology",
>>>>                               test_acpi_aarch64_virt_tcg_topology);
>>>> +            qtest_add_func("acpi/virt/its_off",
>>>> +                           test_acpi_aarch64_virt_tcg_its_off);
>>>>                qtest_add_func("acpi/virt/numamem",
>>>>                               test_acpi_aarch64_virt_tcg_numamem);
>>>>                qtest_add_func("acpi/virt/memhp",
>>>> test_acpi_aarch64_virt_tcg_memhp);
>>> Thanks
>>>
>>> Eric
>>>
>>
> 
