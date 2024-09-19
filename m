Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1134949njg;
        Wed, 18 Sep 2024 20:01:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGyi0yjLUuEVHsasWG/h5adrHCr5bbj4LQabOiAvyqPJxwt3EbYzN8hqgNaz8QrYicRRfKdUOzMo5n5A==@linaro.org
X-Received: by 2002:a17:902:da92:b0:207:1696:6ee1 with SMTP id d9443c01a7336-2076e31f057mr363601345ad.10.1726714908035;
        Wed, 18 Sep 2024 20:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726714908; cv=none;
        d=google.com; s=arc-20160816;
        b=oA2UVzVSCAE197G1Sts3a7zaFrpS32hP3IE1U6uz171A2sOtxC8JHAcP/2msDBkRHU
         7kALZP7Ma8Rw5MrTRjTEdXfNa1/bi8WBk32sQ6rogUcxXCaswQByoNwisrt3VARkqEjM
         nWl0QufH0GBJXITrxAc1wbjZOotluqux1DgxxxMBCj3O9j9VuCbFvOQWSg0bNaEgx6Wg
         EozfhU75mWk3MsBWNDH7Gvnac1bLfA3PzyalWKQeAXXu6d1FjnhP/OLfQbGeYGX8ufVx
         b8uOq5XvOiGsOovJjXucjDm6hlklEOt28/ISdd4PJp7Oi7bx0NJN/rrJ5dq+thNVRweM
         QJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xqBtv4OXp3A6obzu34wGIKdBspJWbTUiWxm7rhVlyOo=;
        fh=vHrm21Jju0hbzqAC0J+qMDTMJgpNkvd6QdIUcdrP+Sg=;
        b=0aQA6OvcBhaja0FeWfpbFpdA2xLnUf3qcA9KCvgxurIY0AZGA3A5UqkYnMfBIEkUpX
         ltVe4XF37GOBGw6xESI4d3atsY+g/lbayxkc52fQwOFrBU11tkCvWKpaKT4y+LKPWeRa
         98yBp9JPrnNrDIRFTK12GiDEG0KTyA2AFfoyxS+vdapVFFTubPOf/cxogM7D4kizYX3K
         gSc2W/L1CNX/fPPr6HfnXcCsgIxo55vUCzfmRHb6QMAb9YZa2S6a7dAcqX46BWkq7uZy
         6xE6AMasz05VevibcNjWHAxCauZnZyqIxBIQ42gtFFkK78kjLD+7pwcPRyqdoLDU9Ofz
         MbxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dvd1Xxum;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20794725f14sor77271815ad.18.2024.09.18.20.01.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 20:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dvd1Xxum;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726714907; x=1727319707; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqBtv4OXp3A6obzu34wGIKdBspJWbTUiWxm7rhVlyOo=;
        b=Dvd1Xxum7MZmWWrhQXaipAObR9WinGxvkdcBXDG6JhyuNJYbaUFs7/DP+XAhiDzapd
         NCatH6dkedM1XOfD3Zhc18x4YfyHOZRChT6c5EQvDemDdbrdX3syrcQJuPJHuoBNFJJb
         a5J27Fqz14x03uK6YER0g8uPrtGxG+ckYOlQ3CXFiUlKxCFUgfrx93XKN8FO8DbMOzos
         rX6nNPf7/Hq0MOC49D03l+3XJolIrcPrJEa0HE3AhGrQlY17BT8wgZpfbGpfMWYb8Gz/
         4x+jtaZxZ+KDRCoBkwDYfvcLt1Z//OCHGQX6hBtkjwREd9uy2hcGhXj5czOuViGaMzRF
         rz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714907; x=1727319707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqBtv4OXp3A6obzu34wGIKdBspJWbTUiWxm7rhVlyOo=;
        b=Gp9qgTsf8Pb2gHDrQ3PGPFrHF7of+kg48OeowP14c00i4i5iaKVsg9uuK9LSMgdySp
         34IS+U039gnRzkUgbTBD9OUlI4xC31rvugkW23Hg5PvSzqYQk5ym9LbqoqkFBTlzq2dv
         yHpqzo+mBmlazrbyMs0UmMx1DgVAOsmFaMa5krc19OdNkmfPLP7uxXoXDJw1dhfPMvuN
         sIYeaTDIu8Jz4pvVNEX4Rc/A7LgQzZ2w8QwsVMyILtQGGR3H61pzedoigRY+6xQKEt4a
         k2KTwdO7eAbWHLvxMpwKCNQGbWXMQueciW9B6Jz7/FYnvJjZXSLLHJ+TbaKnmYFuJTCz
         a4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAX06JJloDnnDC3ZzJnnsycZk9fZWbpoyyVx7XHFz5i8s3oBt4+31DV1ygEKbVzrr1avroFexNjfTgWg==@linaro.org
X-Gm-Message-State: AOJu0Yw25vN+CA9uHjiyS75mFWkA7o6X+tJrv7YoSEaJq0+yrXaLTqzU
	VozyK9znq9Q1HaB6P6TUiSica6Pi8s7IvfGCLmRpc+4X/RgQLHTYJGtrIQKoGYrb4g==
X-Google-Smtp-Source: AGHT+IGj2pG61vee5ELpRccYNXfgwLhAaXzT3LY/aHNdcsy53Pb21EigopcEGi67b8JzNzrFQQKwJw==
X-Received: by 2002:a17:902:e88a:b0:205:8a25:904b with SMTP id d9443c01a7336-2076e45c40emr367783485ad.57.1726714907476;
        Wed, 18 Sep 2024 20:01:47 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.101] ([187.75.38.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d1837sm71318755ad.173.2024.09.18.20.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 20:01:40 -0700 (PDT)
Message-ID: <5a2696fe-7f11-4b4d-89cc-5763dc95a677@linaro.org>
Date: Thu, 19 Sep 2024 00:01:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
References: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
 <87bk0mtljv.fsf@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <87bk0mtljv.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: nqAD7eZFzg7R

Hi Cornelia and Ganapatrao,

On 9/17/24 11:13, Cornelia Huck wrote:
> On Thu, Sep 12 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
>
>> Extend the 'mte' property for the virt machine to cover KVM as
>> well. For KVM, we don't allocate tag memory, but instead enable
>> the capability.
>>
>> If MTE has been enabled, we need to disable migration, as we do not
>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>> off with KVM unless requested explicitly.
>>
>> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
>> which broke TCG since it made the TCG -cpu max
>> report the presence of MTE to the guest even if the board hadn't
>> enabled MTE by wiring up the tag RAM. This meant that if the guest
>> then tried to use MTE QEMU would segfault accessing the
>> non-existent tag RAM.
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
>> ---
>> Changes since V1:
>> 	Added code to enable MTE before reading register
>> id_aa64pfr1 (unmasked MTE bits).
>>
>> This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
>> and default case(i.e, no mte).
>>
>>   hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>>   target/arm/cpu.c     |  7 +++--
>>   target/arm/cpu.h     |  2 ++
>>   target/arm/kvm.c     | 59 ++++++++++++++++++++++++++++++++++++
>>   target/arm/kvm_arm.h | 19 ++++++++++++
>>   5 files changed, 126 insertions(+), 33 deletions(-)
>>
> (...)
>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 849e2e21b3..29865609fb 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -39,6 +39,7 @@
>>   #include "hw/acpi/acpi.h"
>>   #include "hw/acpi/ghes.h"
>>   #include "target/arm/gtimer.h"
>> +#include "migration/blocker.h"
>>   
>>   const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>       KVM_CAP_LAST_INFO
>> @@ -119,6 +120,21 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>>       if (vmfd < 0) {
>>           goto err;
>>       }
>> +
>> +    /*
>> +     * MTE bits of register id_aa64pfr1 are masked if MTE is
>> +     * not enabled and required to enable before VCPU
>> +     * is created. Hence enable MTE(if supported) before VCPU
>> +     * is created to read unmasked MTE bits.
>> +     */
> Maybe
>
> "KVM will mask the MTE bits in id_aa64pfr1 unless the VMM has enabled
> the MTE KVM capability, so do it here for probing."
>
> ?

KVM_CAP_ARM_MTE must be set before creating the VCPUs, as

stated in the KVM API docs, so enabling this cap. here for later

probing the MTE bits correctly feels more like a consequence. So

I prefer the the original comment, which mentions that

requirement. But I think something shorter like the following

would work too:

"MTE capability must be enabled by the VMM before creating

any VCPUs. The MTE bits of the ID_AA64PFR1 register are masked

if MTE is not enabled, allowing them to be probed correctly."


Cheers,

Gustavo


>> +    if (kvm_arm_mte_supported()) {
>> +        KVMState kvm_state;
>> +
>> +        kvm_state.fd = kvmfd;
>> +        kvm_state.vmfd = vmfd;
>> +        kvm_vm_enable_cap(&kvm_state, KVM_CAP_ARM_MTE, 0);
>> +    }
>> +
>>       cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>>       if (cpufd < 0) {
>>           goto err;
