Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp225095ejn;
        Wed, 19 Oct 2022 03:53:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4e05:b0:3c6:f0bb:3175 with SMTP id b5-20020a05600c4e0500b003c6f0bb3175mr13975460wmq.135.1666176814354;
        Wed, 19 Oct 2022 03:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666176814; cv=none;
        d=google.com; s=arc-20160816;
        b=es7C27cPP8YtKxELhSZsJA7P7cwPYYjd0AX6r+hPXlb87OTJ8V7PL/w2H4aQXgXlma
         ijy3hWcwBN9D/9nGC/aXwChujWDTlrhOkSXjpn39FeTuPVAsK7vveeXnACo+zjPuzQ7K
         l99N1BFhguuRJgOPuwS+C4i9rjMMCKmECC/OlXZDdWXJMZ5tPHXCgRzvBNV00Ahii1Lg
         h5NE8oj2JhXxEm+vqFp+JbhGhADrx3ydaMzn1mp5BDzFbBoKl8YVnTnpQ89xvnsKT88+
         YEufipQ0Ss8U9PNw/1R0VJErtNfdF50o8NeyKuYGMvj1Fww33rV0fjtOmBfYYC2mmWbD
         riHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qtER+pnoU+/7ikP3NPM81Ooz5nTRUPZQTbvTnPDFZPw=;
        b=BGg4t6IdgqQEIqrvKzy9E5lIcALVUZkSudfurMZV97TUF6EdCxmt2UjIXa6V/XnAvr
         wqFJFI44/4dST9xBSbzpjc2lIxY85lcduB1I7huoM9o2b55/JXdkjmMfvFWNJr6sKHWo
         kGJrWUntFiadYCJPd6J/ylS7B31/Dy3RRiz99WqUZzL0fomDpnzNDwCvcVSdjVHloJfg
         4l6RLxIO930uhR8pjdvWOcBT1DasxPM3hzE6UjaT6tqmdnwb4tkAeGPtakicELq2U9h0
         i58CrKr63jLIFSJROqNB34xnuWkW2sxIzcy3MfURNHyANmPlhcgvKhe8R7SKvcFmGTVu
         NYIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXWL5wvT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bp26-20020a5d5a9a000000b0022511050e2fsor8286888wrb.27.2022.10.19.03.53.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Oct 2022 03:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXWL5wvT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtER+pnoU+/7ikP3NPM81Ooz5nTRUPZQTbvTnPDFZPw=;
        b=QXWL5wvTyP3hG88xdRQ6Wyo91av8GmdemxaD/Hjr1dxF5RAgTtgF4vGEMtsiFohP2R
         aRQaQ6DqwO5+vKAf9PFg5Rd65bZP1J9D0FrFjq9Zag6B8SwzcyoD6Mzw00vjL/SnxT6N
         cOaVpGzj6mKC5C3drkwUcQRkbGQUO4FZlUn0ggBWz3ACef32Y8z1V+Y1lxuwLaAOX27G
         /+XYiU4/tURALKOZgT7scugKx3OTC+9aBSqB7EG2SCi8JV7Rt9h9QXLRGXfBL3joQxC6
         7jhJxbvep3IEblyysDAxpywS4U9tEUo/6EPSu1eUfRu99e7IwzjvGDpRr05mWJmKTmY3
         8qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtER+pnoU+/7ikP3NPM81Ooz5nTRUPZQTbvTnPDFZPw=;
        b=mZTN3/zZGLIVuMiPpbHZFMTp77p7+hOx7pUa5P4095j4fKDvrkOFy/BT/8kbWo882w
         UmWLtxcc8ZgDUS0KBw0Ht9gIEoVdte+xNypADtutvWXs08U6NT7P5j5xS5nAvdAp0WKl
         T2CXiOhJMTCEkb6GTfa3YewT6LUMUn1WCWOUKrbHvkkMYz3hzfVq68H+j6OT1+vjGKTk
         MJLWlpt1hZLXG+5G9lM43pNjQ0AKrx2KMyFqks8yO0kfqWPoIcGYTndl10T7CKykgHnq
         VJuvBk+KQTVCbml3ZgOTLhSGB/jyBxJDmS2k4/2uyT7cHGona5H5pQbCETrg0bcWCuGL
         u89g==
X-Gm-Message-State: ACrzQf0TWaVjyxGhRiRJ5hQdLMbANooMgny8v8JgPCn0HQaoj6G0H5k6
	ETu7EonLmtR5VTbaEgiO1xESKBSIY/+LyAHN6EY=
X-Google-Smtp-Source: AMsMyM7nW9AuFTrgsViYtc3kz/pbS3FgqQ0/o3Ypjmb+rLWeBTdIExy76JlOpM8/JodCAG+NGZBmDA==
X-Received: by 2002:a5d:43ce:0:b0:22e:4acd:2153 with SMTP id v14-20020a5d43ce000000b0022e4acd2153mr4392713wrr.189.1666176813753;
        Wed, 19 Oct 2022 03:53:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id c25-20020a7bc019000000b003c6b874a0dfsm19715175wmb.14.2022.10.19.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 03:53:33 -0700 (PDT)
Message-ID: <2b2eb94f-c534-464d-0f60-bc8a88e41af7@linaro.org>
Date: Wed, 19 Oct 2022 12:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 15/15] accel/kvm: move kvm_update_guest_debug to inline
 stub
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8O657FH+ew17

On 27/9/22 16:15, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/sysemu/kvm.h   | 16 ++++++++++++++++
>   accel/kvm/kvm-all.c    |  6 ------
>   accel/stubs/kvm-stub.c |  5 -----
>   3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 6e1bd01725..790d35ef78 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -247,7 +247,23 @@ int kvm_on_sigbus(int code, void *addr);
>   
>   void kvm_flush_coalesced_mmio_buffer(void);
>   
> +/**
> + * kvm_update_guest_debug(): ensure KVM debug structures updated
> + * @cs: the CPUState for this cpu
> + * @reinject_trap: KVM trap injection control
> + *
> + * There are usually per-arch specifics which will be handled by
> + * calling down to kvm_arch_update_guest_debug after the generic
> + * fields have been set.
> + */
> +#ifdef KVM_CAP_SET_GUEST_DEBUG
>   int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
> +#else
> +static inline int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> +{
> +    return -EINVAL;

Wouldn't -ENOSYS make more sense in this case?

> +}
> +#endif
>   
>   /* internal API */
>   
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 6ebff6e5a6..423fb1936f 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3395,12 +3395,6 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
>       }
>   }
>   
> -#else /* !KVM_CAP_SET_GUEST_DEBUG */
> -
> -static int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> -{
> -    return -EINVAL;
> -}
>   #endif /* !KVM_CAP_SET_GUEST_DEBUG */
>   
>   static int kvm_set_signal_mask(CPUState *cpu, const sigset_t *sigset)
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 2d79333143..5d2dd8f351 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -46,11 +46,6 @@ int kvm_has_many_ioeventfds(void)
>       return 0;
>   }
>   
> -int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> -{
> -    return -ENOSYS;
> -}
> -
>   int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
>   {
>       return 1;
