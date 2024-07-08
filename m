Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2728186njb;
        Mon, 8 Jul 2024 07:32:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3YPussvS+bOU37lYAxn52m6spXKGuq6h2HlEoWBvpLkdAtTo7QPtkeSDnbX/HhmgZMemBiNOgPj78QPYg1uMMPMdxtTAv
X-Google-Smtp-Source: AGHT+IFuyTadoCiwEISITVJqtwStIao6TnYjX9k1RNMXIjjat4+ePhIQ6Tr4e746vdv08UpYCEQl
X-Received: by 2002:a05:6102:58ce:b0:48f:5a6b:190 with SMTP id ada2fe7eead31-48fee7f49acmr11267483137.34.1720449121371;
        Mon, 08 Jul 2024 07:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720449121; cv=none;
        d=google.com; s=arc-20160816;
        b=IDZomQ75Gu34M9ND6xKMBe5Hip7OLzvRI4pw/BW6KZKxxDI7CbTVF9uVQAwJNG1X/x
         irj3f/vfqmNLxd370HsLLV3dpElRBZJyBIxfjvnST7UgCVFHJvDMiD/8P8STWkdfzhEH
         opKryU50ZDkUFtX6+ckfVFlXorYhrFsxKHreiMEi+RqBh+nG1hG2oHjZmcum+ZCciabt
         j0ufM9jh61adLulb3ixAkoQejpfpdhaPTgpyBTU5WnnPo/ZtApXF4yYVGnDex2DjlqTx
         vcNriDZQwtwfJ865rG5O9s3kgtiEgm6JzgRIus2cjOc4vZkb0PZ7Fg0K5+7XagwbvwpD
         DNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1OKlewebdRdEbxTmajT78KBQ6FSBdR09yAPN/qa7eUc=;
        fh=MZs7aA3qKbGRD8mmhxa1ytd/ZTkPxUGuePMYI7dBcdo=;
        b=CNmmaVYfniWq4KKSDOxoeklEWSxuX2WXMpzGYkoyUVaY0iKo2O6AblbA0w9zx0zqye
         Mo+Pcr2Tx845KrfH0Xey+yE/29c8yFNUqxOF79n8EZo31zl10BzJm5WXLK1d7ueVKdd8
         59WiDeGDwVVQ/EhdyaqR4ihSgjlPqpTkk9gAID6hw7A7uKq15RP8WgF8Qen3OPUhe+R2
         ZtGnNPyCm5vah/2ymeAQxZ1XoN/WJoHH/CMoPl8SWR5Cnljuiz4dvdV8QAL1X7qa7/L+
         MtTBqVGx6YSmE7GZ/Tw6rsx2xb/KWErop9xT9rstOEutchgaa32aXaxLqzAToSCU3KxN
         4bjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIchKu0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48ff3dcbef8si1249481137.414.2024.07.08.07.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 07:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIchKu0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQpOp-0008UG-9e; Mon, 08 Jul 2024 10:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sQpOe-0008F2-LU
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 10:31:25 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sQpOc-0001sx-Fk
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 10:31:16 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so6545204a12.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720449071; x=1721053871; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1OKlewebdRdEbxTmajT78KBQ6FSBdR09yAPN/qa7eUc=;
 b=YIchKu0VayJqdHgYwlaA7n5faG2+tBNXQp/qC3xObLYOgI1Jd3JS/LWCYro5RK1d1s
 ySUqFPkG5eBiuZSQ0XvQ+X42OgaEVzbDu4YH5wu6yLTbPb5SenNgsSmkYC1WFljWPln7
 JVk/HuGLjEHiulwIlOf6ST+JZAgQNYdRawEQEDGkvk8OT101O7DJ4LMh2pBaZWCNOcAu
 OFZFHIUPjmNMVuR0kFWO6npm6AK+HuIuHuS+DIEfZDu2pQ5xpDDdALzVKjtbOIp7kBUY
 7LT10p97hVJuLNXl2WjsrZoOG9zRC6M382976m2DmW7Ysu2uAJaTj7GBdrFG1I2r1LLW
 ignA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720449071; x=1721053871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OKlewebdRdEbxTmajT78KBQ6FSBdR09yAPN/qa7eUc=;
 b=O6RpSUBjg4MgkRJySHY4C9xjRlV1uzRJEp6qK2gLPoOavwlgSMD/zryn8l8B5/6zdd
 9KKj6RU+F5qCZP9/ekblB2pe20NqOfqj03K5sLXaGdMnmSHDOo09MKS2s8dy6wROlQLD
 8f1ROatCDfqo5xMce9JZGlZW9JBTv3ujBH1tPnZNa8CkNaLYczin7MfVYBqHKr7hSW4E
 8Y/9Z4x9QYmQ9S9YiphH2IvYinNMlmDS3x5z0va2Si56kqP6PjlyM0SocDPgvKL3Xs2x
 zlQuiHE6MVe8dSVwhpOzMjMOKLCuF350hzdlRmExFtXc93tutV6M89sLq9sPucEPKUNV
 MFAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWnth5gbhzt4mL1/QQr8GFvRgLHwR7753kQR3RIvX7I3TVkAA6O5bCJgys1MEYmXCclYVHEXn78BoKLCsX78ESkyau
X-Gm-Message-State: AOJu0YzYjV7EpiKpweVTbuqtRFsIigmFSksNxcZhxINaKVMZH2hZ7TAs
 KdtW/Fj4HcHkXuaszjz2TuBC7LZQ6pwWlLlcPHp6rIiTmn2PD+dLvC5Lj0cNEfZLzn2CRiey7+i
 vJVr/cLdEWcMQn3OvokNorblvxPfr/YuUJ8qUQQ==
X-Received: by 2002:aa7:d149:0:b0:57d:40e3:2a71 with SMTP id
 4fb4d7f45d1cf-58e7a94b244mr8128547a12.6.1720449070910; Mon, 08 Jul 2024
 07:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
 <20240702234155.2106399-2-richard.henderson@linaro.org>
In-Reply-To: <20240702234155.2106399-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jul 2024 15:31:00 +0100
Message-ID: <CAFEAcA_3Ayf-Eo4OHisewA+qgCWSF1S0Tn5aLrYy_3rF0ytStA@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Introduce memset_ra, memmove_ra
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 iii@linux.ibm.com, david@redhat.com, balaton@eik.bme.hu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zp8Z9mFiNSlQ

On Wed, 3 Jul 2024 at 00:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add wrappers that set and clear helper_retaddr around the
> host memory operation.  This cannot fail for system mode,
> but might raise SIGSEGV for user mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 40 ++++++++++++++++++++++++++++++++++++++++
>  accel/tcg/user-exec.c   | 22 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 71009f84f5..baf4f9367d 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -379,4 +379,44 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
>                          MMUAccessType access_type, int mmu_idx);
>  #endif
>
> +/**
> + * memset_ra:
> + * @p: host pointer
> + * @c: data
> + * @n: length
> + * @ra: unwind return address
> + *
> + * Like system memset(p,c,n), except manages @ra for the calling
> + * helper in the event of a signal.  To be used with the result
> + * of tlb_vaddr_to_host to resolve the host pointer.
> + */
> +#ifdef CONFIG_USER_ONLY
> +void *memset_ra(void *p, int c, size_t n, uintptr_t ra);
> +#else
> +static inline void *memset_ra(void *p, int c, size_t n, uintptr_t ra)
> +{
> +    return memset(p, c, n);
> +}
> +#endif
> +
> +/**
> + * memmove_ra:
> + * @d: host destination pointer
> + * @s: host source pointer
> + * @n: length
> + * @ra: unwind return address
> + *
> + * Like system memmove(d,s,n), except manages @ra for the calling
> + * helper in the event of a signal.  To be used with the result of
> + * tlb_vaddr_to_host to resolve the host pointer.
> + */
> +#ifdef CONFIG_USER_ONLY
> +void *memmove_ra(void *d, const void *s, size_t n, uintptr_t ra);
> +#else
> +static inline void *memmove_ra(void *d, const void *s, size_t n, uintptr_t ra)
> +{
> +    return memmove(d, s, n);
> +}
> +#endif

I guess these make sense. I feel like they're a function where
the caller needs to be quite careful about what they're doing
(e.g. not to use them in a way that the memmove or memset
would cross a page boundary if other guest register state needs
to be kept in sync with the reported fault address), but I
can't think of a useful non-architecture-specific warning that
would be worth putting in the doc comments.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
