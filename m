Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2608304njc;
        Tue, 17 Jun 2025 08:51:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdoMEvPqbdU0TyK0XCJr043elkbS+jx020zHL3/AnQti7hCUJFQdRkWn3ZuXgNGh/vEvDEkfesnk1s7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFGhAvGXTKZptqfCyc70MmT1Vg43SDDyQAHOX5yq9uKDDsu6l8+lT1MbOmdRzZinPLtCSpC
X-Received: by 2002:a05:620a:2990:b0:7d3:9109:4472 with SMTP id af79cd13be357-7d3c6cda074mr2394086985a.37.1750175473171;
        Tue, 17 Jun 2025 08:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750175473; cv=none;
        d=google.com; s=arc-20240605;
        b=iJs49xc43n3yMpNr9w+MCW49tRz6ZTEzLqR8IrMMZUy8TKK4AuBmPqi25oBeaf1+q+
         mc8hW26uKPWEqdwDZX9mUoF4C/1Ne8Z0GIKdney/RGYY+gIfL66YXPfXQAuqLLDlbzBa
         TrR+77UEGpvnNx04BC9fvAxpZpZHJnGIDtNZJKi/rL+ZUOi0xPCUks0l7pjf9d+rODqH
         jnlihs2FwI6udgTLj6mhMzsPFQG3x510q6TnpOEQULjIG8rmJrTFMuLCGJL60FDgw87x
         LwsOwjH8sD5kA8lBqIJXAqelc/zjk3egriEEw1fEvGJrnDcCu+6yjRY+/B/KzrNTKv/2
         H2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=VS9urkfSFWt7AAn5yxzZ6Nil/NSfyk3gPz8NMoBeooM=;
        fh=YDFsfe/SzENKv7VKES6dUHtW9LvS/GmQ/xWw3oT+eo4=;
        b=WIgFPfRywngxLXA20lG34BSkvRWsjvtFbHGz2VcDBxyps3VlfZqX6LCDp1nkNTNscJ
         nyf5NYi5IMpP333h2AwHabi2+hUJcHPWq+Y6serl2VGO9vrOsa3H30UGV4gRn9lXIuLX
         1MNinG8ndXNJnHxypIUdl7lAgQsUzXqkYUOemF3oD82TwFVgeXZEu7sNC06rDz0YYbY6
         qqzIdkVB+rtfjKNDJlqpjBkWzWhSu03mhcgCc6x4KiyQELFXbfN3pIrMNd/gbmUtG56e
         yd0SQpAvHZ4pnzH15Y1Uqly/bdJT9JxXXxOTEDlZ6iETdtjBEMBAVD7OmLajauwjPf2/
         f8WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Roj/+PNb";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ece5a8si1310829785a.330.2025.06.17.08.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Roj/+PNb";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175472;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VS9urkfSFWt7AAn5yxzZ6Nil/NSfyk3gPz8NMoBeooM=;
	b=Roj/+PNbQ3fln41MIyOdyV2OOFA6q+aesMUesny7PIgWq1e4BDdEjWwvPljtc6AJ0ZPVGm
	0lrr8g7JDgFFoISzTIVM3isKS8/xURbcVzrfLfvkNwyr++HbIuqZheKV8SD8SbgXBfCzJp
	16uAL2isOUSJdy+feilBEE/e9QMK3yU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-0Xrwen4LOWilL7FZtMXPAQ-1; Tue, 17 Jun 2025 11:51:11 -0400
X-MC-Unique: 0Xrwen4LOWilL7FZtMXPAQ-1
X-Mimecast-MFC-AGG-ID: 0Xrwen4LOWilL7FZtMXPAQ_1750175470
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532514dee8so50896725e9.0
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 08:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175469; x=1750780269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VS9urkfSFWt7AAn5yxzZ6Nil/NSfyk3gPz8NMoBeooM=;
        b=S/dYJO2llcX+tQqKYZrTagX33qKbZyRYpA8kldwqrqciZGxoTQV0pmNvFhFm1/QILt
         2OLkwF2zRbWH8RNw5vo4LD0J2sJCrDC0K8J//vsa7u6hBvaf+wxSgRog+Jc4nJxPpINO
         vg0lv41vf57VV9cok7hqM/uu/59mMs/tWYSNBFHYAvcbHSorz7Gygg1V3vzPWSofwx/w
         pzK1o5UeZ3JOAuWHaUH2drGVQFvDK4zVh/gAcM6M9LDCeR7C6+ClMx6lJb3nMbQW12Oc
         a2TP92EjnHOfsdgWuONy6PoePYsB1m0V3q80Q+7vvp8HVahXu4W+/iIR/dgPNMFo7Mmy
         XW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9+0sk79X8tyyV81iyJ04ABFB6G5cRotV8nwyn79iCanuZI0X8mb8MJ67VqwSsbdSVSNfPKblznCCv8A==@linaro.org
X-Gm-Message-State: AOJu0YzMbMe3xqIE33eNfcusHHLBFcRfJiP0rzo2XqBo+3Lbvx3WoE0I
	2gM5Vwv9wuKIpBKzYF6TqvRJM8FvJ+36aRRDO870fQ5nHAWntDbyoDgXbrWyMqdmL+Z6cdSL2Yp
	/+7cEbSC2OR79AiYJ+501dXwHTZWVCrG0dhP5MbyFmBycB4Vp66Vz7hPas2yuCQlTCw==
X-Gm-Gg: ASbGnctD/AYFEUK/KaoUEJaGL05HS0shfP9VkMqbBoKsUB4XkCji7gpDiThf6dvb441
	la39Cobm85c+VIu5fvSIi9A26tfPH8MAZdh1E71Klqkm1vqg8N1WGzaF6a9okNGP+6hSnNI+SQV
	zu5jHHshuGL1H5ofUt3iesj+oNqeWFtP7jDdSG80SEj3wAy4M69eKcfDXmfoSlwIWPqr26bDQlz
	tBIHCXCJNJWOxr1s3fNIXfUNvxfgfTYLijDwnpCIBn9Y+mQJdA4NPoNi54xTLOmDgLed7zzlu+Q
	hF4fRBPkG3di/3DZ+GTzqN/lqQLUxgwQHf+EXUSm+1gNDoEfLC8XjXZzJFNsr3Ycm87RZw==
X-Received: by 2002:a05:600c:a00c:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-45353f6c370mr24876215e9.25.1750175469319;
        Tue, 17 Jun 2025 08:51:09 -0700 (PDT)
X-Received: by 2002:a05:600c:a00c:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-45353f6c370mr24875805e9.25.1750175468818;
        Tue, 17 Jun 2025 08:51:08 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm178883935e9.35.2025.06.17.08.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:51:08 -0700 (PDT)
Message-ID: <74c1948a-3c90-431b-805f-b5a4238beecb@redhat.com>
Date: Tue, 17 Jun 2025 17:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 5/8] qtest/bios-tables-test: Add test for when ITS is
 off on aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-6-gustavo.romero@linaro.org>
 <fe166574-9e53-4e27-9c12-c91f3fc774c7@redhat.com>
 <3881403f-c618-47d1-afec-27592bd7be99@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <3881403f-c618-47d1-afec-27592bd7be99@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TmEMIVYMnsaIK1tg7uhCfyMm752ZJ6yvpZE0_s2ZH70_1750175470
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1LJ1ARNz+Dsg



On 6/17/25 5:12 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 6/17/25 10:34, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> Arm64 GIC ITS (Interrupt Translation Service) is an optional piece of
>>> hardware introduced in GICv3 and, being optional, it can be disabled
>>> in QEMU aarch64 VMs that support it using machine option "its=off",
>>> like, for instance: "-M virt,its=off".
>>>
>>> In ACPI, the ITS is advertised, if present, in the MADT (aka APIC)
>>> table and the remappings from the Root Complex (RC) and from the SMMU
>> I would rephrase "and the remappings" by "while the RID mappings from
>> ..."
>
> hmm true. Do you think it would be even better to say something like:
>
> "while the RID and StreamID mappings from the RC and from the SMMU nodes
> to the ITS Group nodes are described in the IORT table."?
>
> I'm saying that because I understand the map from RC to ITS is from
> a RID to a DeviceID, while map from the SMMU to ITS is from a StreamID to
> a DeviceID, hence say "while the RID and StreamID". Does it make sense?
I think I won't bother and would simply talk about "ID mappings" which
is the generic term used in the IORT spec.
>
>
>>> nodes to the ITS Group nodes are described in the IORT table.
>>>
>>> This new test verifies that when the "its=off" option is passed to the
>>> machine the ITS-related data is correctly pruned from the ACPI tables.
>>>
>>> The new blobs for this test will be added in a following commit.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>>>   tests/qtest/bios-tables-test.c              | 21
>>> +++++++++++++++++++++
>>>   2 files changed, 23 insertions(+)
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
>>> b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index dfb8523c8b..a88198d5c2 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> I still fail to understand whether empty tables + update if the
>>
>> bios-tables-test-allowed-diff.h need to be done prior to adding the
>> new test.
>>
>>   * How to add or update the tests or commit changes that affect ACPI
>> tables:
>>   * Contributor:
>>   * 1. add empty files for new tables, if any, under tests/data/acpi
>>   * 2. list any changed files in
>> tests/qtest/bios-tables-test-allowed-diff.h
>>   * 3. commit the above *before* making changes that affect the tables
>
> I think the best reference I have to it is the reply from Igor to me
> here:
>
> https://lore.kernel.org/qemu-devel/20250506173640.5ed03a16@imammedo.users.ipa.redhat.com/
>
>
> I understand there are two possibilities when adding a new test:
>
> 1) Like in the steps above, 1., 2., and 3., which are taken from the
> bios-tables-test.c.
>
> That gives option A:
>
> A Patch 1: New empty files uuder tests/data/acpi + list of them in
> tests/qtest/bios-tables-test-allowed-diff.h
> A Patch 2: New test (since the blobs are wrong but we added them in
> Patch 1 to allow list, there is no fail in test
> A Patch 3: Update blobs (actually you are adding the real blobs, or
> updating from empty to real one)
>
> or (what I'm doing here), option B:
>
> B Patch 1: (A Patch 1) + (A Patch 2)
> B Patch 2: Like (A Patch 3), i.e., just update the blobs (add the real
> ones)
>
> This is the sequence Igor confirmed it's ok:
>
>> - Patch 1     : Add the new test, add the empty blobs *.suffix files,
>> whitelist such a blobs
>> - Patch 2     : Update the blobs in Patch 1 with the ones that make
>> the new test pass and remove them from the whitelist
>
> Also, Igor says it's ok to add to the allow list the blobs that change
> at the same time
> we add test that changes the very same blobs even when updating an
> existing test (not adding a
> new one, which is slight variation):
>
>> - Patch 3     : Add the APIC.suffix blob to the whitelist (the table
>> that changes due to the fix)
>> - Patch 4 - n : Fix(es)
>
> "3 is not binary so it can be folded into 4 or be a separate patch
> (either way works for me)"
>  
> The important thingy is to follow the rules:
>
> 1) Don't make a commit which fails the tests
> 2) Don't fold a blob with the commit that changes the blob
>
> That's my current understanding about it.
>
> Let me know if that makes sense to you. We need to reach a consensus
> on this, confusing as
> these acrobatics may be! :)

Actually I checked your patch and effectively it does not produce any
checkpatch error related to bios-tables-test rules so your patch is OK
(yesterday I discovered with the ACPI PCI HP series that checkpatch
points out infractions to bios-tables-test.c rules!). Since it results
in less patches I think it is better. May be worth to clarify that
directly in bios-tables-test.c though.

Cheers

Eric
>
>
> Cheers,
> Gustavo
>
>>> @@ -1 +1,3 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
>>> diff --git a/tests/qtest/bios-tables-test.c
>>> b/tests/qtest/bios-tables-test.c
>>> index 0b2bdf9d0d..4201ec1131 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -2146,6 +2146,25 @@ static void
>>> test_acpi_aarch64_virt_tcg_topology(void)
>>>       free_test_data(&data);
>>>   }
>>>   +static void test_acpi_aarch64_virt_tcg_its_off(void)
>>> +{
>>> +    test_data data = {
>>> +        .machine = "virt",
>>> +        .arch = "aarch64",
>>> +        .variant =".its_off",
>> you have a checkpatch error here.
>
> ouch, thanks, will fix in v5.
>
>
> Cheers,
> Gustavo
>
>>> +        .tcg_only = true,
>>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>>> +        .cd =
>>> "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>>> +        .ram_start = 0x40000000ULL,
>>> +        .scan_len = 128ULL * 1024 * 1024,
>>> +    };
>>> +
>>> +    test_acpi_one("-cpu cortex-a57 "
>>> +                  "-M gic-version=3,iommu=smmuv3,its=off", &data);
>>> +    free_test_data(&data);
>>> +}
>>> +
>>>   static void test_acpi_q35_viot(void)
>>>   {
>>>       test_data data = {
>>> @@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
>>>                              test_acpi_aarch64_virt_tcg_acpi_hmat);
>>>               qtest_add_func("acpi/virt/topology",
>>>                              test_acpi_aarch64_virt_tcg_topology);
>>> +            qtest_add_func("acpi/virt/its_off",
>>> +                           test_acpi_aarch64_virt_tcg_its_off);
>>>               qtest_add_func("acpi/virt/numamem",
>>>                              test_acpi_aarch64_virt_tcg_numamem);
>>>               qtest_add_func("acpi/virt/memhp",
>>> test_acpi_aarch64_virt_tcg_memhp);
>> Thanks
>>
>> Eric
>>
>
