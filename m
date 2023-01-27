Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1428067ejc;
        Fri, 27 Jan 2023 12:37:18 -0800 (PST)
X-Received: by 2002:a17:90b:1d90:b0:22b:ef1c:6d0e with SMTP id pf16-20020a17090b1d9000b0022bef1c6d0emr15223485pjb.3.1674851837906;
        Fri, 27 Jan 2023 12:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674851837; cv=none;
        d=google.com; s=arc-20160816;
        b=R3HrCDEkTfO6Hb8T0fvjw4n819Dh3J/aAipOvkWJhH16fdRdUQ2vG6I3wAe8GHaPYL
         OMT5lxL2OCDdm1xdn4pEi7mamzVTchLmT0eCuHScwa8Z1AgahDDyX25g4lcL6M7tur5t
         4x3Q6nLnjkn2oaxGqBwjSqfJ7YfC1h+vKjWjd9ejDFpC0pIFJyNYptCOqBOsqqII/QgO
         dY1xAYjso/t0UXIsxZC4wdyrluMGZAFIF/LgcJjYd7drJgc5EjMpzsMoabKyanTt1Gwr
         BVp/Y3EBu4sNi5YxEkc6X7q8we+1Ih94e+EeK2cuw0croeBddY8rYxdt5T0dWaJ7lwe/
         HRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BHuUJUqMqN/xTSu6EyeYUzPZT3vrZ7VptQ4cKrpisEY=;
        b=CBPfWzcbrs5mQEQYtjv9W2si23ZXpisRZGEfvKJ3ohpt/Am4Ipmwx2L0Cm6wzFUAXB
         td9LuhrQcqX9PmPg5iscwbhXPW8xogOiLnJA2tNP0OrYdHm/ltD8ve6n68IkEBTPFyPQ
         YHLWbcPaWAf2LR2fd7A9wZ6Zv3JVYL5ZzwxENXGfMZURbWpzERFUABbJyP0Xf7MYiCmE
         MQpA6RNsLm1YN3rD6G6rfSlqB8sf6k/y/LOa7kMZyR/JXanGDqBvPBhXwOFQn3cJutTD
         SzubyJfgXVuHPrabb/AUwCLW/jp/YOFXpHkpEytvW8t2csrxT3Dcu40f80eCxsb77k3s
         MwFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+yyDaWw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f15-20020a17090a9b0f00b002270390ea2fsor918070pjp.1.2023.01.27.12.37.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 12:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+yyDaWw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHuUJUqMqN/xTSu6EyeYUzPZT3vrZ7VptQ4cKrpisEY=;
        b=w+yyDaWwYA8m/76Vx5m3XqfUnpZq/mFzE6SOYhx2CIniWJKbKV0GH+cZWI6I8GdOOM
         ki6tqDysRuMg9pOMu9sm+dn4HTjSt4lKHhSrQZjrwoVrUBt2PZe6cgfIs07xYsAr9s9d
         RJwwFbeYD7Nu1OeobzxZLYFNQAVk+lbaTQ9WztQQk0uWrd3HcsCKzZNBO9FRuLwCFgiF
         RqdWrzgo4+P6V5HzB+TuU7Y/w4RSA+BmJR0QzaxB4i1RKfD5JiPNV+yR44r63Ag0QLPM
         xbPWuogYqlztKaBk7jvSewok94tLj6+KVa7FBvhpXX+Unk34H5Exs5+uBfBKumOp0kzf
         aNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHuUJUqMqN/xTSu6EyeYUzPZT3vrZ7VptQ4cKrpisEY=;
        b=DwGe8EJbOzFiLPIvOGX4arEso4dFDyQflBK2yvG6QhmiZwkMc5XYbZG1h2/eH4z7cJ
         vzAv0V8RqSMCc67/d9UziNVzWdVcpDbPq7QxaTethZe/WAmts0+xf/HVdD0Sgc561cKd
         CQGy3L/n2m0alVr2Hslm8LWHeudh0XBbG+u8IYrBp7AIOlFMmeCCkqPsTmvZqtMNA69M
         H+mHgcLFBXsI5pG3wuwzii7+0YYT6pGKh2YK68NZ1+Ny0z6bFw9p+VHe6Yvkqt7BYjhj
         bSJ8UR9NRzCi5FSy1Qc+AHsOd3s6bZp7GIS6H96JYBqQX7nsbwrgiF9G7j2Dz1XFso4S
         eStg==
X-Gm-Message-State: AO0yUKWZmUChUJTlGdwx/okeNkl3myGj3avNJtWOzF0RLv/ZBLZtfDAF
	ClTO8g9skeaTR1QVMrPZ/MZOw4pj
X-Google-Smtp-Source: AK7set/9dDDqYDDf9spm37WRWP8CsLsRGc4wYyFUsReKx1FsUMO3KzJZeaPIsPCimLxoMr1GIi4stQ==
X-Received: by 2002:a17:90b:3b4f:b0:22c:2092:b6d1 with SMTP id ot15-20020a17090b3b4f00b0022c2092b6d1mr8321399pjb.24.1674851837422;
        Fri, 27 Jan 2023 12:37:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id v11-20020a17090a4ecb00b00229f68ba7fbsm5443747pjl.19.2023.01.27.12.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 12:37:16 -0800 (PST)
Message-ID: <5a713862-5bc5-3d2b-e54f-70cf5b484493@linaro.org>
Date: Fri, 27 Jan 2023 10:37:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 03/16] target/arm/kvm-rme: Initialize realm
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-4-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-4-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lnhXEgzcfVM8

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static inline int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
> +{
> +    return 0;
> +}
> +
> +static inline int kvm_arm_rme_vm_type(MachineState *ms)
> +{
> +    return 0;
> +}

Should the stubs really return 0, or g_assert_not_reached()?

> +static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
> +{
> +    if (!cgs) {
> +        return NULL;
> +    }
> +    return (RmeGuest *)object_dynamic_cast(OBJECT(cgs), TYPE_RME_GUEST);
> +}

Direct usage of object_dynamic_cast is usually not correct.

Normally one would use DECLARE_INSTANCE_CHECKER to define the entire function.  But if you 
prefer to type-check the input argument as ConfidentialGuestSupport I can see defining 
your own function.  But in that case I think you probably want to use OBJECT_CHECK, which 
asserts that the cast succeeds.

But then I see that cgs_to_rme is, in all instances so far, also used as a predicate.


> +bool kvm_arm_rme_enabled(void)
> +{
> +    ConfidentialGuestSupport *cgs = MACHINE(qdev_get_machine())->cgs;
> +
> +    return !!cgs_to_rme(cgs);
> +}

Ah, hmm.  Well, probably wouldn't want an assert here.

At present I would expect exactly one object class to be present in the 
qemu-system-aarch64 binary that would pass the machine_check_confidential_guest_support 
test done by core code.  But we are hoping to move toward a heterogeneous model where e.g. 
the TYPE_SEV_GUEST object might be discoverable within the same executable.

Therefore, if cgs_to_rme above uses assert, this might use object_dynamic_cast here 
directly.  It seems like we ought to have a boolean test for this kind of thing, but no.


> +int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
> +{
> +    int ret;
> +    static Error *rme_mig_blocker;
> +    RmeGuest *guest = cgs_to_rme(cgs);
> +
> +    if (!guest) {
> +        /* Either no cgs, or another confidential guest type */
> +        return 0;
> +    }
> +
> +    if (!kvm_enabled()) {
> +        error_setg(errp, "KVM required for RME");
> +        return -ENODEV;
> +    }

I think this null check, and the kvm_enabled check, belong in virt.c.
You'll not get the error with the !CONFIG_KVM version of this function above.


r~
