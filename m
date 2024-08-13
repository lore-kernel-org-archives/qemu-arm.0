Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp209049njf;
        Tue, 13 Aug 2024 10:20:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZG/kZ2amPOzDU+dUapfgnMrzs7sOjf/ybL6NGV55SMq6Lm6lJcL9m5dcnL1gcqxEfhjsfytTZjPiF29CoCduTXqBgRtpu
X-Received: by 2002:a05:6000:2112:b0:371:6fb8:8fe3 with SMTP id ffacd0b85a97d-3716fb890e9mr3503300f8f.12.1723569609695;
        Tue, 13 Aug 2024 10:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723569609; cv=none;
        d=google.com; s=arc-20160816;
        b=mFHndaXXIPSRqKX2T1hmAfwnUvtbVsKVIwK3E51ewHS0UUxf4BDXgiZXhajjzXPrG2
         QcoZE15Pyd70AgBCnMMJZw0VR+xc/Hvmn2UcirtnHYatmexlwqQj0TcN12+avhnP7zdm
         JRSCvlrpTDvAnxTXe0mfHXRj+Ebs6dJDaULXDQWC7WhRoQY9dfF3OLhNNH3k+GyLncoV
         NE+GjiypgaFs7p9Ggm8JRZCrSc5kVoLcv6tdqKZwpKbDMI8c6TC8x1Uw+dkGTJxPEf1y
         uJ3Uvf92bHLgdTIhZWJCyQFh6y//WtBkPpmynFWHk+QTcvaxudJG/BlW0MboispSiC1a
         SNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=84sx66JI+FulYoVmyiqu6uT4YzhJNSXXhPlav9Qus3U=;
        fh=Zv5DfkxM4yOH8PcXwRvlDE+zBSXHXdm69ZEWL1uKgO8=;
        b=LTykv0dgdSh8FprtdSOKjFz6W2Vsd55Pr+wQiaTrrQTZLFM2Baq/rWwATIOePLK+RN
         vrNZMNTwwmBYfZYXUj39zthexpEYC472ySMxy5lXsGmGB7nn+d9+E7/+XgVQpZZyH45F
         WvtwTuDa7Gj/nJGGQaUpFFLt3UoT1imLpay3w/EuK7HSz+BJ2y9JlmE9Ge2T2DTp2+JH
         q88bD5RbDdqfjSmLngsldwDKBOQLUAjzmfe3EeInWoh/QAF1HRUHfz6FfBB12M6il35K
         qfHNPxaVrEot3tbWqhcABZaJGD0IlFWYC8FHjvhM/Z4H3bEc387QMfv1cWkOQUJiZF9N
         uCiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@citrix.com header.s=google header.b=wRtIVKds;
       spf=pass (google.com: domain of andrew.cooper@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=andrew.cooper@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=citrix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <andrew.cooper@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429d7177a7csor6293865e9.1.2024.08.13.10.20.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Aug 2024 10:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@citrix.com header.s=google header.b=wRtIVKds;
       spf=pass (google.com: domain of andrew.cooper@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=andrew.cooper@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=citrix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723569609; x=1724174409; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=84sx66JI+FulYoVmyiqu6uT4YzhJNSXXhPlav9Qus3U=;
        b=wRtIVKdshWcJHfDmiNs/zAqzPvNrWMayxu3kUVAaP2c+bVSPK2lBhR1jnEI2u2xukV
         OkZ8pbKxKqhiIE4PaTg8rbY7sfFtk3h942sy5fSzLw28NWJSMZQ4RxLnDtgKhf9W91zZ
         pDV18qrJVd9cx9TtFAolsWit2qHsJoo3KTBJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723569609; x=1724174409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84sx66JI+FulYoVmyiqu6uT4YzhJNSXXhPlav9Qus3U=;
        b=BzKvOL5vBshsfHf3MobbQJ9zRDg3oAsq2GZmOnKwEYcLTLZXxh/mjdlhqEsmEJ8DG1
         RfR+VlQjTPrp6nGd9vN/eG6PxJI/FJepCYjJjASyWK+/t1h5KxhlPvfboylp4TSn0T+N
         8j/J6xaN9j4rAd06FPdlp3w5RGYyKNycQbnphJ+DX8bT7F28rIe2OmkdqTR0qdi78ahq
         Vmk40WG6SjgxBagStCANuFq3ewBJMQ/gSqV3Zlbd2IzOmxbUBYgS0sLIqmRe9/EbyDWC
         ImmKlh5KX3ZWp55wHYw9s8f117GQKGGIfinAi0gCrv7R2EQQK0T2D4OjWNpu67DJxy/V
         puAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEhpb0imnL6emKsZZETYI4FFO8pefiAoKyQ0Mkq9jRcIsGOuZVeJnAHGnGqJVwXClkogDLmQLYNm7TeV/C6tZgHiztjdw0
X-Gm-Message-State: AOJu0YycXiEYRB80tO06RX/crlkL05ycguIk8uRv+CCo9DW5ObkxsM3N
	CKIRYn8AsRnQv/mPuvB7Qd5f8sqqajOj6m0VLJlTdj2t+jKzSXrEfxyc/rBl65I=
X-Google-Smtp-Source: AGHT+IFTGC62jSGYkGCBeBoI9MiD8GQfXOo+KENKk3RMxfPXu/2PblHRt3RsejLkmmxd/OqMpwzjUw==
X-Received: by 2002:adf:ebca:0:b0:362:ad01:5435 with SMTP id ffacd0b85a97d-371775c6b2bmr355964f8f.29.1723569608962;
        Tue, 13 Aug 2024 10:20:08 -0700 (PDT)
Return-Path: <andrew.cooper@cloud.com>
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51e876sm10981474f8f.73.2024.08.13.10.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 10:20:08 -0700 (PDT)
Message-ID: <a93b9398-9cc3-48ed-9570-47204ab80d5f@citrix.com>
Date: Tue, 13 Aug 2024 18:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
 peter.maydell@linaro.org, alex.bennee@linaro.org, xenia.ragiadakou@amd.com,
 jason.andryuk@amd.com, edgar.iglesias@amd.com,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
 <20240812130606.90410-5-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2408121650590.298534@ubuntu-linux-20-04-desktop>
 <ZruRm34zIMtUm7oH@zapote>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZruRm34zIMtUm7oH@zapote>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8z3cnIwK6B1t

On 13/08/2024 6:02 pm, Edgar E. Iglesias wrote:
> On Mon, Aug 12, 2024 at 06:47:17PM -0700, Stefano Stabellini wrote:
>> On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>
>>> Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
>>> servers to handle hotplug.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>  hw/arm/xen_arm.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>>> index 5f75cc3779..ef8315969c 100644
>>> --- a/hw/arm/xen_arm.c
>>> +++ b/hw/arm/xen_arm.c
>>> @@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
>>>  
>>>      xen_init_ram(machine);
>>>  
>>> -    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
>>> +    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
>>>  
>>>      xen_create_virtio_mmio_devices(xam);
>>>  
>>> @@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>>>      MachineClass *mc = MACHINE_CLASS(oc);
>>>      mc->desc = "Xen PVH ARM machine";
>>>      mc->init = xen_arm_init;
>>> -    mc->max_cpus = 1;
>>> +    /* MAX number of vcpus supported by Xen.  */
>>> +    mc->max_cpus = GUEST_MAX_VCPUS;

The only suitable number here is the one you get back from XEN_DMOP_nr_vcpus

GUEST_MAX_VCPUS is and has always been bogus as a compile time constant
in the Xen public headers (yes, ARM inherited it from x86, but it should
have never been copied to start with).  Please do not introduce any
further uses of it.

~Andrew
