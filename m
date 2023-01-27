Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1485594ejc;
        Fri, 27 Jan 2023 14:39:22 -0800 (PST)
X-Received: by 2002:a17:902:cece:b0:195:e480:acec with SMTP id d14-20020a170902cece00b00195e480acecmr8166356plg.5.1674859161981;
        Fri, 27 Jan 2023 14:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674859161; cv=none;
        d=google.com; s=arc-20160816;
        b=ab9+YU1xU/s/QKUSOyze9LRImPn7wyFEvBIqwbHnQAufBdlqiXmcZWrXJ7q4JPjbVA
         Kt4BF/35opgAzBaQCjVDMnE5xXTH8n9tBROqpsZwCN5VkkZ//x4ptO5Pl9z3kT2IMOTK
         2MYPwM1HRjw2bbqS7qpbAmtKGYfMphnplbL6nr8kLeckfu9P9UqXRYZL05UJrmhgBv50
         2n3OwodKyvpGGpmV2QLgqIJGERouw/EJL9V2/3N/3b5vX+WMqrRl7zXK6Llu4xqNL2oL
         KnoVlmoS2zDffIMu/54Ker3K/E2m/fe8MVUuYpaI6ceataFL6WWxVc3e4iEPQ1OmGFId
         Bisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oJfjOCBR2weiobZbRi8a9pBWI2ZeDbdPtKO5bPq8dK8=;
        b=zSOiQHI5DUO+2stPQOXre6rDg1byqmlWZlmMjxvjDhpX4z7UQa8UgcvJcMAZPIe0aR
         HhVFeypmHHgz1I6BjY0Z+fdu05rYpL0KnUUYQm/RhVGlj/gdiln3ku3WCcsUU/5kEqPj
         7XkJHLmlCeNJ8H+4SmlFNiXhkrOYfkQo2iyL4BN3VDMsB/1b9HeR62IN7BHPTOi4nfQo
         oR/fJobvrO6eEq9bY5Qezrnp3eRdRnPZUvXDVq5tj/Z9BkMIRy8jCEJn+y9wH0axhZOm
         Ac+ikovoCs7WT861lHozqnq+zKV7dWBMMOgnulPXmchHOBKf0q12oKAG283Vs8BFuU7f
         gI9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKGEkf3h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k3-20020a170902c40300b001962ba6c640sor2521918plk.36.2023.01.27.14.39.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 14:39:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qKGEkf3h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJfjOCBR2weiobZbRi8a9pBWI2ZeDbdPtKO5bPq8dK8=;
        b=qKGEkf3hOEAElN3qU0edKmd5IB1CpRxPvrQAI4Vj4t+KQW5vuWxySeflKrJCWkRhvR
         aluvZTwwlQiUhQxFAVplxbxSqlE5u+HzJOleGdJjwTqxUa6WVdG6qaYM0KNiJxXrPjvK
         Nh2DzKSCpNax3inpJSy/KWHY1zLlIYyQFKdafDrzlx+c3XIIf66Ki9F83ej1t0Cw5aYF
         yF6Pw9dVgYtesnlxAsl5+LgNpJQLIJdK8Mykf7auQ8bAiUtm/olmxdcpKdC5tw3rLxtP
         PlyBOH9H3TLgC3RzptMsub859c0HVuJs2H0ESGiK+w0gUnrCyXIuusaH7p4VTP2viRK3
         KV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJfjOCBR2weiobZbRi8a9pBWI2ZeDbdPtKO5bPq8dK8=;
        b=WTA5Bk68MM3+501jfprprgr6HcE+Wo6wyVGCh6IC1RH415Jflw00UrXTuidh8orNSU
         0p3gwtGfcmdzNAVLXwYke1zqG3s3N5qvn0PefPR4VRforaUfbtheOH6RWQsoDOY5RJzq
         /QAPrcVCkLkw5+Y7/DBAgGti7rluAT9MAtGn///0ec6S8637sMr92RNaZACnsc2Ddj2s
         Y09gFTB4L8jGrLtnE1xPRJOdzwoREtY18bAVRgxeOXqhRXQaL6BU4y2WpD3FbSnOYnFT
         QqpDooaGsfP1fa9nmYGydDBO5YKmahXv0DOc0Eb/E22IJ5O8Znv/aIAivRDdZxsM4pox
         MUDw==
X-Gm-Message-State: AO0yUKWz+WVJis9WAu4g8PZA6jHaOJ/4dufehAEy6uiqsEFsDsZC7mh7
	jcEMMKJWQ7IoCW1oMR/5nhbrkoVX
X-Google-Smtp-Source: AK7set9q/T36n9+gHxR+9ej97Fach3pTHYSu+Gik6JNpI4JZvUmWxEobULEjA4nprLLZ40QlL8rSGA==
X-Received: by 2002:a17:902:e0d1:b0:196:450f:d89e with SMTP id e17-20020a170902e0d100b00196450fd89emr4784881pla.18.1674859161519;
        Fri, 27 Jan 2023 14:39:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id bf6-20020a170902b90600b00176b84eb29asm3305267plb.301.2023.01.27.14.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:39:20 -0800 (PST)
Message-ID: <e772258e-1493-734f-f8c8-0ea5fe4d65c4@linaro.org>
Date: Fri, 27 Jan 2023 12:39:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 07/16] target/arm/kvm: Select RME VM type for the
 scratch VM
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-8-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-8-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: F2AZRUAuCFNZ

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Although the VM type does not affect values probed from the scratch vCPU
> at the moment, it could later. Ensure we specify the right type when
> creating the temporary VM.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Does the PA size need changing as well?
> ---
>   target/arm/kvm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index fcddead4fe..d8655d9041 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -70,6 +70,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>   {
>       int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
>       int max_vm_pa_size;
> +    int vm_type;
>   
>       kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
>       if (kvmfd < 0) {
> @@ -79,8 +80,10 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>       if (max_vm_pa_size < 0) {
>           max_vm_pa_size = 0;
>       }
> +
> +    vm_type = kvm_arm_rme_vm_type(MACHINE(qdev_get_machine()));
>       do {
> -        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, vm_type | max_vm_pa_size);

Given the restrictions on register transfer for RME guests, this seems incorrect.  We 
won't be able to probe what we wanted at all.


r~
