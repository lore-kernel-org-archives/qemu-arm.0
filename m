Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp536815ejs;
        Tue, 9 Jan 2024 09:42:36 -0800 (PST)
X-Received: by 2002:a05:6870:4413:b0:204:32a:7b96 with SMTP id u19-20020a056870441300b00204032a7b96mr7112054oah.95.1704822155822;
        Tue, 09 Jan 2024 09:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704822155; cv=none;
        d=google.com; s=arc-20160816;
        b=LRjRcs75lObWXUoI93VLpYZhQ6mPq/Udkj92fNiBhX4aTWsgQ01HZwSd5EBGwWU7XU
         g6Z1rquREFkpqETS++Ys9D8GGWdUMXRCX1n3MmJFGPKwX+ceMPEVOwFDKEoJruGBy13L
         baAKoDEGAw00CYKHc/KxtLxQfEC+9hEh/Bf3E/ZVeQf8LWAO0BniJ+wbreAs7GA2EIH2
         +jJJ14VM90tnrdXbLmNdlfWvAdkjy+OJ0/GD6FgyQQo9V0QDrd6QUuwuA4LlPMWiUHKc
         3OgZQFGSgjh31Es+uk/Iho0hVA2RLUw34sjZHfG+4Epb9g5R0QMPzg5FB+PuU9EhVwIG
         gDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=53lziAUMWxraWZMqgeq7a80JdQqfRhcqMRb3/zt6Asw=;
        fh=W84aVyQshfm+IQnNVHPtZJa4aBqwTfwNS9QthDGemZ4=;
        b=sNvtPTxPe9z7xgAVEyPecvDgz4iF/GWn/Z5jGvQVn48rMW66+lfxuu5AXClIWQEgL/
         ivsfgtp+09r0NTM0thulYmkRkn9DJNKSTmdnQ4ISnqVmpLVj5+YCAFZmlVvzYhJNmJ74
         yduATlZLERik8JaV7Jl1BryRWfZxi3blyh4d3YTdsdELDK47RC4aA1Z1eNqkq1h5mETq
         LRtUZ9GiD4clBdzzfhTGZ+I+mVxd1LeNnugQLS+mqpvmNC70O5uRHM9J1yvzONl90j1b
         E0Z1Pajuecuvbw3sN8hZArSo+JA7LQvTeGJEJ5d3ToTId1ymOVBtdTqpm7XO2bE8+lCi
         +rng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2zBokZN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id od4-20020a05687176c400b001fb358806f5sor1131488oac.10.2024.01.09.09.42.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 09:42:35 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2zBokZN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704822155; x=1705426955; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53lziAUMWxraWZMqgeq7a80JdQqfRhcqMRb3/zt6Asw=;
        b=Z2zBokZN7IFELaHWKJfBgo0yrZKN30dJP6u48qBAH2osnMADfZpmo2GHC7yk+zvzcI
         mBwIGlZkCPR2lvNid9AhdMsCLAA6oeWfVn2vl6MZdtsgxsENAjV9rtcnLfMWr18syD0N
         AnZEWex76EdjbjbsoRwaRKiOVahN1nLjfZ5O0Ooy3tZqc/KvZIHLewcDwDvutl4upDMC
         ifehtIFPuU7/+uQW2g8VY963XsEDINeOQa4PJmj66kgAd6GtfD/EVHninFbvflMFxjwi
         F2CETxh/gC+m24WP1K4ov1IzmcFnykQOY0lh6gDIQiC5CaXQX/PKA1jREJxBd3xVaqQw
         lgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704822155; x=1705426955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53lziAUMWxraWZMqgeq7a80JdQqfRhcqMRb3/zt6Asw=;
        b=wPCgYOFjk05lerYYVe7CZmZ+eY0Ho582kmGd2tVwx3UDsvcGWXUFgCSfbC+7w0XPvX
         12TMcSltaePaYohEo3y0Gxt7OqSqb+sY5UaevZm6EbfWIZEYaFVVuLhWp+fadfXUMYVc
         P3YoWvLLDa9+uPaSsJGwbkbKeOKTpe5aeLnuBYpVw3cn65cR+5gNYDMg0vpM9orV6JFL
         Bk3iqMkLh6vnlSEJJ+o4IcQmjMZqaXsldE0QTLpA/E7X+FoSJvUhOPq/9V6qPjQTP8ij
         fTa954NzTtBTtOn5nsE400MIiq6FWIDjOxSvW2M0E9S7VIuF1AL738UFvBSHpZZSeAAm
         6M5A==
X-Gm-Message-State: AOJu0YzW6/u16miadjd5nVz3rNXRVEjoqt+xvk7uZMGHztHpsn4jA5vY
	KDxDjI8dwb3jxEfMmLlS3D4WefS3Bi+75dZ3
X-Google-Smtp-Source: AGHT+IHxUMMYJ/vAbIQlNFckjGkIgPJs+GLjgPsKFbCHiyvDz5gA/hBhrn4ZU0Ho1Nznt8vVdOJHEA==
X-Received: by 2002:a05:6870:b613:b0:206:2550:d22d with SMTP id cm19-20020a056870b61300b002062550d22dmr4904922oab.46.1704822155304;
        Tue, 09 Jan 2024 09:42:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.47.227] ([172.58.111.136])
        by smtp.gmail.com with ESMTPSA id pt7-20020a0568709e4700b002064e3ae6e7sm535893oab.0.2024.01.09.09.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 09:42:34 -0800 (PST)
Message-ID: <0195c274-0d5c-484b-9475-84a4d16bfae8@linaro.org>
Date: Wed, 10 Jan 2024 04:42:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] linux-user: Allow gdbstub to ignore page protection
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20240108233821.201325-1-iii@linux.ibm.com>
 <20240108233821.201325-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240108233821.201325-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +2jajK5/hpRw

On 1/9/24 10:34, Ilya Leoshkevich wrote:
> gdbserver ignores page protection by virtue of using /proc/$pid/mem.
> Teach qemu gdbstub to do this too. This will not work if /proc is not
> mounted; accept this limitation.
> 
> One alternative is to temporarily grant the missing PROT_* bit, but
> this is inherently racy. Another alternative is self-debugging with
> ptrace(POKE), which will break if QEMU itself is being debugged - a
> much more severe limitation.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   cpu-target.c | 55 ++++++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 5eecd7ea2d7..69e97f78980 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -406,6 +406,15 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>       vaddr l, page;
>       void * p;
>       uint8_t *buf = ptr;
> +    int ret = -1;
> +    int mem_fd;
> +
> +    /*
> +     * Try ptrace first. If /proc is not mounted or if there is a different
> +     * problem, fall back to the manual page access. Note that, unlike ptrace,
> +     * it will not be able to ignore the protection bits.
> +     */
> +    mem_fd = open("/proc/self/mem", is_write ? O_WRONLY : O_RDONLY);

Surely this is the unlikely fallback, and you don't need to open unless the page is 
otherwise inaccessible.

I see no handling for writes to pages that contain TranslationBlocks.


r~

>   
>       while (len > 0) {
>           page = addr & TARGET_PAGE_MASK;
> @@ -413,22 +422,33 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>           if (l > len)
>               l = len;
>           flags = page_get_flags(page);
> -        if (!(flags & PAGE_VALID))
> -            return -1;
> +        if (!(flags & PAGE_VALID)) {
> +            goto out_close;
> +        }
>           if (is_write) {
> -            if (!(flags & PAGE_WRITE))
> -                return -1;
> +            if (mem_fd == -1 ||
> +                pwrite(mem_fd, ptr, len, (off_t)g2h_untagged(addr)) != len) {
> +                if (!(flags & PAGE_WRITE)) {
> +                    goto out_close;
> +                }
> +                /* XXX: this code should not depend on lock_user */
> +                p = lock_user(VERIFY_WRITE, addr, l, 0);
> +                if (!p) {
> +                    goto out_close;
> +                }
> +                memcpy(p, buf, l);
> +                unlock_user(p, addr, l);
> +            }
> +        } else if (mem_fd == -1 ||
> +                   pread(mem_fd, ptr, len, (off_t)g2h_untagged(addr)) != len) {
> +            if (!(flags & PAGE_READ)) {
> +                goto out_close;
> +            }
>               /* XXX: this code should not depend on lock_user */
> -            if (!(p = lock_user(VERIFY_WRITE, addr, l, 0)))
> -                return -1;
> -            memcpy(p, buf, l);
> -            unlock_user(p, addr, l);
> -        } else {
> -            if (!(flags & PAGE_READ))
> -                return -1;
> -            /* XXX: this code should not depend on lock_user */
> -            if (!(p = lock_user(VERIFY_READ, addr, l, 1)))
> -                return -1;
> +            p = lock_user(VERIFY_READ, addr, l, 1);
> +            if (!p) {
> +                goto out_close;
> +            }
>               memcpy(buf, p, l);
>               unlock_user(p, addr, 0);
>           }
> @@ -436,7 +456,12 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>           buf += l;
>           addr += l;
>       }
> -    return 0;
> +    ret = 0;
> +out_close:
> +    if (mem_fd != -1) {
> +        close(mem_fd);
> +    }
> +    return ret;
>   }
>   #endif
>   
