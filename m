Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2619580njc;
        Tue, 17 Jun 2025 09:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViCaoe85YPCLUfEB0wrhpzsJUq7JKBW4A9aRhTSRFK77PlOTQNf7PxR+cCz48vyWibBgk3yDIQbjkGwg==@linaro.org
X-Received: by 2002:a17:90a:d605:b0:313:f83a:e473 with SMTP id 98e67ed59e1d1-313f83ae5abmr21230762a91.15.1750176429596;
        Tue, 17 Jun 2025 09:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750176429; cv=none;
        d=google.com; s=arc-20240605;
        b=YYbP6gGyU8NaQMS20UAbrXB2BWBqo7VREFrZtfNmSwGODqBI+G6rNHkG1zI60PPu36
         jrfp7qsQcvhfS2jdwRh72ajgvYOgeVX8lWZfMb684lrr30MnrQqpiuGBr9trcFGIikXP
         s5WCgQImN0Zu+v8o/fB4cNknNfehZZxoSvMtxWZADkkwmUXStllX+sSfM8eLvWAOAq/u
         W0jzuEQc69Vjr1PaG691Q3dUvmPyIIc+ch3TSrgt1oJGDaYkZ4rrUd5UJK/2xCc0pnIX
         9mhNzdCueeKkr3hPO3tQIvo23oVnIbj/xkWeKr1wsDvUYZdPXFWNfCEFtf5B4j/wTklV
         ippA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dPooGodvHOd25Hd926Qo9oypTPkB595thoSSxi84ong=;
        fh=tazL26JcMj/ORkkBll4R4v6AVmtW6fAvw3E+DKm74YE=;
        b=ECP8IXShvvypy0GDG6oeXTwzY3jCE6okze2JifieQTZkWsq9XVE64oee1wrUJN1v5V
         Bm/RFX7bl+lcpyRyn9/Q8iOU7i/ByBO1sGXpJieS5Q63TQetTD9z/HU7s22nXyS2IB1d
         BTV0+GInlxrMkDf9KmK8nQcNkA8WsU0tLU3VOHt+LxTwzkDftW8lRbtSzXByEACxZaDk
         XHFPWWTtb4KwR72zObjh9kc/XC3GSHYNHjudYwJpsPMjdxfMgMPef/2CPOjShQTh8L8i
         ObGPILU/ahLc4sxieJ24HXlvCwjT3x7mdq0siCKP5uW0Jh5aYvfNeucE9/LwUwz6zO7f
         S3Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSBztPty;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-313c0eb348esor9561298a91.0.2025.06.17.09.07.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jun 2025 09:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSBztPty;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750176429; x=1750781229; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPooGodvHOd25Hd926Qo9oypTPkB595thoSSxi84ong=;
        b=PSBztPty/slRrGZCc+FU/muRE1YaI7EiZBfhP7d3t9pLOW0VhcBKZ4wk7R0UxbPxA4
         xYMT6SYXHylC+M3Z5P46k4/c/svDw2N4bFYJ+bUae61IfGNJythUuEkQ6aaucVWeLiFS
         lD40XvLf1HR8dBCccw+HklZe7dtcgah8pveUwX9FexA1VCBu0agTMMF1hrPtY/9k79wW
         AtCy5y/fDkTuRUJPAc3fyV3SonYKH1nO9anFqu2BFzYliv+99vtGEUbe4qJ979rwgq+T
         DSnG3bK2nShlaZJhTcxerhw/RQYy7XcdobJ6b+afZdq4CTdbqniK0w7EodfSQB5zVsnn
         hDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176429; x=1750781229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPooGodvHOd25Hd926Qo9oypTPkB595thoSSxi84ong=;
        b=M7bEeK/uoJ5WPEwvn6FjxpQpLSuPbM1u0Tk0IAKCvBP3i3ge07eN6GitjNeq01JJkE
         bXGp742pv6nyR7rjQLJ42Xhwt8zfsedoNihEcAZLNdQhWXVPgrrSFmtf07qRzc11e1Lk
         tsiWHrGYA4HCOBQltFJoagNfFWR8D3Qw0YgF/lvwew9fJHwhUoe4BN8vvaJUFt0esGJC
         qv3Xh7odp1/ZZA4WtU6JjQjQMe6rCd8awiW9gCTYCOqd/QIJrlhp8qKrCVJLj3j6cYuw
         NT5OO8a3Pl++Q8CrOv5Z1dRGNma7F+8bHftzrxXeJfWH5a0VuQqP9KAYWAH47CsZ6B3O
         /wZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2rJy1j3nhNtWBdYqClXLeYtXiLdAfX7rhI0w1FQdC9YP3mqwkPXvZPYNgbuMbjueEAZBNYBRF2Ora4g==@linaro.org
X-Gm-Message-State: AOJu0YxD6HXH9S7ve4F/8GPRzWp/OrAvBxlpIEcO29VlbWp65oAH8LcF
	+5UQIRUZa7RmyqTde29OfDe9IrcLfos3pn3JRsRWichepO0kKIVBgVvhSPiaAPCnOncyUQ==
X-Gm-Gg: ASbGncswUW55A095lI0ad68XIU2Q8kIpPN6x0884LXjYjjdaiKXF5OPyOPO94gn5088
	0LD1vDV+mIWofizS/3GNgpo8dWrUZ4D+12YRvrLQVylBNlPTBQBj7Anr4mNsY0gO2y80RYJDt/L
	pwn+M4knBar/mSIKzreW5FCZ/JKSt5Iugx5bsH8CiW8vxmLeorAH7m+GuxXyjvhe0/ao5HYlTrw
	SwvfmANw/pXkK7C96ULJ8Mnxg53kmzBI1sQcDZebvGqT+IaNRc3hOL6ctvFeW964K4EY6lU7s9F
	bf5Mc9t2G9T+fqQG4tD1JAjqrfEmdJ/47taxUkE9XJPKxgvRLddn9WFXcsq2cIgSI9IQGDyJnQ=
	=
X-Google-Smtp-Source: AGHT+IFtFXA0xCexhG7ezEYeGusVFz2h2wR9DiTKZsUvW4VMIi55VULTSoUi9FXA306bINke54IKhg==
X-Received: by 2002:a17:90b:35cc:b0:30e:3718:e9d with SMTP id 98e67ed59e1d1-313f1d5077fmr21766876a91.35.1750176428956;
        Tue, 17 Jun 2025 09:07:08 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b2b545sm10805794a91.0.2025.06.17.09.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:07:08 -0700 (PDT)
Message-ID: <825d1a10-0e47-4a73-a274-a01380785ec4@linaro.org>
Date: Tue, 17 Jun 2025 13:06:53 -0300
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
X-TUID: w+yTmQTlB/91

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
>>
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

oh I didn't know it! wow, glad Option B passes the checkpatch scrutinity heh

Yes I think I can update the doc now I confirmed with Igor the details.

I'll cc Igor and you when submitting the doc improvement.

Thanks.


Cheers,
Gustavo

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
