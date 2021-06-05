Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2235680lfa;
        Sat, 5 Jun 2021 12:52:03 -0700 (PDT)
X-Received: by 2002:aa7:8b0d:0:b029:2e9:857e:c1d1 with SMTP id f13-20020aa78b0d0000b02902e9857ec1d1mr10270143pfd.33.1622922723075;
        Sat, 05 Jun 2021 12:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622922723; cv=none;
        d=google.com; s=arc-20160816;
        b=NQ7fCcKu7CvJjKUh7G4Irn7+R7ZySES94AHb5/IAm/qtpW49n7EIDAqIWndWCBPqtK
         S3oUNNKmKM9ivHgkUMs1rwRvoZzO7ISiRnB4CG+514bCmiw3HUFqSOtd0E6BykoMVk0R
         LhEBppJxXBp/UNEOiXwRA2eapAR7wfhWOfGns4gy3lHP2RchprFqhM24/Nl5TC4fLyz4
         0nzXyKAYwoS9bVTJ5BtoFSu8vpmhxkazcrOKsO0b0yL5yih1YOn8Xp1E75LuawCs21Zs
         9xzABGlhueqSa3J+Po32jbx5udgCKPjlqSFirHBNEhboJMyhkXgVaETm05qnqalO5Qea
         7Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=c/z8EV3TKaWiozZRLB6mGcdwniHbBM/6raYQIT7TJhk=;
        b=rdNKc6V78dOMdM0StKODK9JgSq3lmYGCeXl/mH70/CWfzqORUj8dvYLB0sgqaOBnE5
         BkM55is4JRXue3/7x7/yzkd35IJid4ObFjWJi0IAQmXpVa6NXYzk0V+fvtds0DWqZRo4
         rKKTCe5TJbfoBTlzC1mF7DuYi9SKjvB+foJSoh0LCy+Ju2XhOiUolUU8Sb8C+7PVyILL
         AiUKPQIQbAab2kFvH9jM1hmRwD7EX0B8ewm+VSGQroWs+tTToVFhNi+gCvrWtO52TUy2
         GdVf02bTX7iVufDzRiWxO8xjrhRSjYRfvW+DQZ13Tr7m1XndRKJ8bSDvFZTNrklUbjky
         diqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCeijRih;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q19sor2821880pfs.99.2021.06.05.12.52.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 12:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCeijRih;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c/z8EV3TKaWiozZRLB6mGcdwniHbBM/6raYQIT7TJhk=;
        b=vCeijRihD7U3VAPsUZOQXlYFgkybBUVjvx0BrDnMKkuRRbfcPkJAjzZ04zaxuS6fDf
         d5hySfoLFdcZ2Cq1PxWVMSAzzdwI7UkgcVPE/GFBZjRuGc2YBN1Lb89UnZhiLLIa5dqC
         57qvRZE8K9otMG9Qo+p0duTuVaEwyQJ5d6FkVrWkNz18lLSSksLNCUqfd4wF19CNGd/C
         TNH44iPDecgV206ln25OD+egK+qWRXsfM3v8DsA2zNyDppbSyVwEvmwMzrcWpok4ZLAy
         ttJ0kYtDSjeqs/NTNsGiElGmvCOAahMhxdlf0hCNxJgmjVKzoMpH42WDIiBJTC5grlnZ
         yOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/z8EV3TKaWiozZRLB6mGcdwniHbBM/6raYQIT7TJhk=;
        b=jNwI201rDLYYw6qO7DR1Rev0iexg25FUIYX4qcJzXrcyhn0g91EJtm9ypW3RNZ93jW
         UDKZK8DI/S3IsIMMDVHA9WovrqvJAhsjekMDYyuH1esrvKxlrYdW6sa6/zLZ9phUWBqe
         676A2c3QI4mJJUbAvldUARauuKu4cJLklZfApnG4JC0LHVQckC0dMZaqFROtafFD2SR5
         z8EGX+MZaDqhG+IBqFksrAbt0WJxOORhtEfylIFMKWVIXO5SHRxF6lMrxLfotq3Ks9Em
         k5KNw3Dn9LCIjy1dJKWIKFbgqSHYiXjAmtb7ZcFOxJ7agdTUav14OwJEqmqTcA3weP3u
         nHWw==
X-Gm-Message-State: AOAM5306ikEAGn+Pgx2+YjHnXWwFsxz+hz4G9s3q4AxZXW2ZE5OWOsks
	oHFmAGiHcdfcesX5UmocqVDbVwy3
X-Google-Smtp-Source: ABdhPJy4/TU0u0LMfJ11lhT21hcLWpUYJGOwRpGSG7STkzxqq6rzVBr5SOqazTVaakrdVkhmCtPH/g==
X-Received: by 2002:a63:616:: with SMTP id 22mr10955420pgg.291.1622922722404;
        Sat, 05 Jun 2021 12:52:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id ls13sm7625543pjb.23.2021.06.05.12.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 12:52:02 -0700 (PDT)
Subject: Re: [PATCH v16 73/99] target/arm: cpu-sve: split TCG and KVM
 functionality
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-74-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33be111f-9e47-0b1d-f4e0-2f02bd73da76@linaro.org>
Date: Sat, 5 Jun 2021 12:52:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-74-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: PIncq/RDDYge

On 6/4/21 8:52 AM, Alex Bennée wrote:
> +void kvm_sve_get_supported_lens(ARMCPU *cpu, unsigned long *kvm_supported)
> +{
> +    /* Collect the set of vector lengths supported by KVM. */
> +    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> +
> +    if (kvm_arm_sve_supported()) {
> +        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> +    } else {
> +        assert(!cpu_isar_feature(aa64_sve, cpu));
> +    }
> +}
> +
> +void kvm_sve_enable_lens(unsigned long *sve_vq_map,
> +                         unsigned long *sve_vq_init, uint32_t max_vq,
> +                         unsigned long *kvm_supported)
> +{
> +    /*
> +     * For KVM we have to automatically enable all supported unitialized
> +     * lengths, even when the smaller lengths are not all powers-of-two.
> +     */
> +    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> +
> +    bitmap_andnot(tmp, kvm_supported, sve_vq_init, max_vq);
> +    bitmap_or(sve_vq_map, sve_vq_map, tmp, max_vq);
> +}
> +
> +uint32_t kvm_sve_disable_lens(unsigned long *sve_vq_map,
> +                              unsigned long *sve_vq_init,
> +                              unsigned long *kvm_supported, Error **errp)
> +{
> +    uint32_t max_vq, vq;
> +
> +    /* Disabling a supported length disables all larger lengths. */
> +    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
> +        if (test_bit(vq - 1, sve_vq_init) &&
> +            test_bit(vq - 1, kvm_supported)) {
> +            break;
> +        }
> +    }
> +
> +    max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
> +    bitmap_andnot(sve_vq_map, kvm_supported, sve_vq_init, max_vq);
> +
> +    if (max_vq == 0 || bitmap_empty(sve_vq_map, max_vq)) {
> +        error_setg(errp, "cannot disable sve%d", vq * 128);
> +        error_append_hint(errp, "Disabling sve%d results in all "
> +                          "vector lengths being disabled.\n",
> +                          vq * 128);
> +        error_append_hint(errp, "With SVE enabled, at least one "
> +                          "vector length must be enabled.\n");
> +        return 0;
> +    }
> +
> +    return max_vq;
> +}
> +
> +bool kvm_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
> +                           unsigned long *kvm_supported, Error **errp,
> +                           uint32_t sve_max_vq)
> +{
> +    /* Ensure the set of lengths matches what KVM supports. */
> +    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> +    uint32_t vq;
> +
> +    bitmap_xor(tmp, sve_vq_map, kvm_supported, max_vq);
> +    if (bitmap_empty(tmp, max_vq)) {
> +        return true;
> +    }
> +
> +    vq = find_last_bit(tmp, max_vq) + 1;
> +    if (test_bit(vq - 1, sve_vq_map)) {
> +        if (sve_max_vq) {
> +            error_setg(errp, "cannot set sve-max-vq=%d", sve_max_vq);
> +            error_append_hint(errp, "This KVM host does not support "
> +                              "the vector length %d-bits.\n", vq * 128);
> +            error_append_hint(errp, "It may not be possible to use "
> +                              "sve-max-vq with this KVM host. Try "
> +                              "using only sve<N> properties.\n");
> +        } else {
> +            error_setg(errp, "cannot enable sve%d", vq * 128);
> +            error_append_hint(errp, "This KVM host does not support "
> +                              "the vector length %d-bits.\n", vq * 128);
> +        }
> +    } else {
> +        error_setg(errp, "cannot disable sve%d", vq * 128);
> +        error_append_hint(errp, "The KVM host requires all "
> +                          "supported vector lengths smaller "
> +                          "than %d bits to also be enabled.\n", max_vq * 128);
> +    }
> +    return false;
> +}

Also, I think I mentioned this before in review of a previous version, I 
strongly suspect that aside from kvm_sve_get_supported_lens, the other 
functions will be used without change by all other hw virt systems.

So I think we'll do best, short term, to keep all of this in cpu-sve.c for now. 
  The tcg_enabled() test should elide all of the code that's not needed when 
!CONFIG_TCG.


r~
