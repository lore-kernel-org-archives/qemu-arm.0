Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp678910ejb;
        Fri, 7 Apr 2023 21:28:49 -0700 (PDT)
X-Received: by 2002:a17:903:22c1:b0:19c:dd49:9bf8 with SMTP id y1-20020a17090322c100b0019cdd499bf8mr12590092plg.28.1680928128883;
        Fri, 07 Apr 2023 21:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680928128; cv=none;
        d=google.com; s=arc-20160816;
        b=Vs4ZGgwhAb5cNd79UuRnPVdjHakcBy6KbSjgGuhFU6wpiPUEYsdPzGCou75vwn2TCO
         gxr4HKgx9rHNwvaixojlrZMc2aGYsMV8vH0Z7LbRX02sn1AlfuZLQa1b3U2Z8NHNxpD/
         /K4XXBcG2c8GOUMh1DSREGaLhVV1B/xSGCjmvfzWhb7R5vSpyylhqR5WI0thczQ/YVRj
         E6s4U1RbLVBdNYk/S/DNM84VgWjeNSXbOV488KHFNRTNBYRn/VXzZrQky6cM2FySUC91
         buEIVbq6DnXG/eahBtDNS/zsmdqo7x/tchYi0ahCdIY1jOTZMPcGfZu6T0l5ybKkex3W
         H6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
        b=ra67Psk97F0+AXOdXvBEQk7qTJmfXus1UB1NombwAKNOVFk70CHM4++N/0rezEVXd4
         zuMNzIo6820F0Jf3Yq3wtKKC1IsAvCiWyGA7QGjRxVonVxeIQehRtmrVpQQg2kXwAvvV
         zVEeyqfKoFrKmZ6x0e9sF0ILM300zTFQQIloE2mhzpqA3hadhzOgthxVbuuw3t85CUKF
         lj8vKqj9Ex1KgC2rnKjMpzFjpKWT95PbdbVZLaNJuvULYmc44LbO8o2uO6XUY9j8kdeC
         hLLd0Ckdb+H32+fzvz+Fyou9QTVKpVa6KJuuZmFbTkl7mn8FU5v8UOOoX8THI4nZI/np
         T58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdRZm8Ro;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v2-20020a170903238200b001a0694e0430sor2282526plh.114.2023.04.07.21.28.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdRZm8Ro;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680928128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
        b=MdRZm8Ro/NBK+ZlaFLYbQrUYN2G7NnUNCrSk6j3pIm6L3C9s8B9o+imxGmSGFO1rzP
         d0pypolwEj738cVK0dj/1jXeZovZByoSbF65Z8A1frLqrKBbvElXtXUO7UfpZcDEggnu
         Zj780LkQ6RFUEe06TUknN0z7I5YfStsmtefdpa4kylquOHBOyqQeAcnC5sdxXuxfzQfn
         NJ8fbdVCvkTfNgSjuv1y5Q5e2Jee5wZZK4zRajG36MHRr/ISn6kdjjqxtj7avpV06FuJ
         iEhbplpqT2ppeP+DGNa1BTj/fCHzGdZkc24DOYiRoEG45lApg3iyZ+by2C6hsI5BaGk1
         yiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680928128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
        b=bKX7evSG/0CpBASODV/kXC0SPMH5KKbHFZRXtxNBVtW/6kZq6v69oN3OjNGdg8vAdY
         0p+ErayMUQV6BO0KF2DUJm20XF2y47vA/jF+gQWZdrvxmx7woO2xIjlwrzaLAnB1Fyeo
         bVNc1f6cYAinIY0x1gIinCzls4YGzMacf00m8xs4kHE/gzY4ZT1kaHDaiP4AsEnsb0S0
         M2wfnPgz6EpA8ykGZg+lnA/unNYmirrOTxnuM9VMNkRP9N2FBgYjqxSED4GH+2w2gA1u
         fSa3KkE5UXZd9INMfrTWAQZbpujMuvWYfvtgt/vT2jXIuUWzYcDbpq9usR6grrm1AaDz
         0KTA==
X-Gm-Message-State: AAQBX9ewZzh9BaU4fFBGqXIxQw777+0beX3puvTtEMMDphDZo5Hr2KzK
	/CbE8OXTqQ3vaKccq6/K/1og5zkd/K/q3L4mAkV3ww==
X-Google-Smtp-Source: AKy350Y373tHXEam4gJ7xdNJNam89DOSgLnH6QSib2qEnCN3lWhcYsVBGDQfhPVQZwXOZVmZepfL4g==
X-Received: by 2002:a05:6a20:6055:b0:dd:ff4f:b856 with SMTP id s21-20020a056a20605500b000ddff4fb856mr4347826pza.26.1680928128276;
        Fri, 07 Apr 2023 21:28:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id n7-20020a654cc7000000b0050c08fcff4asm3446234pgt.8.2023.04.07.21.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:28:47 -0700 (PDT)
Message-ID: <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
Date: Fri, 7 Apr 2023 21:28:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Du5rHYWxxzwi

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> RFC: The migration part is likely invalid...
> 
> kvmtimer_needed() is defined in target/riscv/machine.c as
> 
>    static bool kvmtimer_needed(void *opaque)
>    {
>        return kvm_enabled();
>    }
> 
> which depends on a host feature.
> ---
>   target/riscv/cpu.h     | 2 ++
>   target/riscv/machine.c | 4 ++++
>   2 files changed, 6 insertions(+)

Yeah, the kvm parts need to be extracted to their own subsection.


r~
