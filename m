Received: by 10.25.227.6 with SMTP id a6csp496042lfh;
        Sat, 1 Jul 2017 18:34:22 -0700 (PDT)
X-Received: by 10.200.8.29 with SMTP id u29mr35720238qth.233.1498959261987;
        Sat, 01 Jul 2017 18:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498959261; cv=none;
        d=google.com; s=arc-20160816;
        b=BVUcjn8dmSr/E9E235aQihJ31OG9+jq1Xmeq+JKFAultbZ46igE3mvzbVVlgwH7I7i
         OjPqRa3uErB4Nbjt9bymRfNg5/8nLBdIDg6S+07EMdViNw0s9oHWfrC6JfCk7FvFLmIB
         tYhxA34Unvk96MBj9/bzPNUQd4lL1G+cV4fI4qiVT7XFijGRn6dKxr1gJ5IxgO7nQMBK
         d1+kS1HH4ZvgbSN7eVH+db3BpzOB8bEwf6aD/AeLBG+Rqir8EibJMcBgxT3Dd6i3PfDw
         lb1x5gj12jd8JmTY89vj5hlY98Ux3baLGJtGhUv4NVwVKBuJtC3n2QrlL/UXvvEExlfr
         qLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=OQIY9teiv+DO52NGyGDZ62WRGPPwTmhR3Xvs0tkhd2U=;
        b=E5jgJcPjeHWQvsvM9he1l0B++aQ2lBbfpfGnheS8Fv89bQdNj7MkkolyKdNx+0j6Nu
         CXi1LbqFx6Zrh/GcWD3O9tbodi5YIfhDdKS3/+FQpFrXzznTHtd0OgcM7CI7z4giJArr
         QvSMN7uzFRDDxZqp1ekrv7uhFOMRNe1BwD6AktKtDJhNikT0NTUiyfBRKqErL5CVW50T
         3x5xyRRxPRHk6heeh59yjE0EqCW7fpy+U0eOoFLogfdfb9JLv5DPSO6gDhS6PkSukq1m
         VVgPt0eSZzMcNZYBU/PhZ7Z2zlSP0hOYuY7vjcYBIvJuR1fvmbuApu9L3KEhYyILusmC
         6f1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=QU1dFvXr;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com. [2607:f8b0:400d:c09::22c])
        by mx.google.com with ESMTPS id q186si10727639qkf.59.2017.07.01.18.34.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) client-ip=2607:f8b0:400d:c09::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=QU1dFvXr;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22c as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22c.google.com with SMTP id p21so125295465qke.3;
        Sat, 01 Jul 2017 18:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OQIY9teiv+DO52NGyGDZ62WRGPPwTmhR3Xvs0tkhd2U=;
        b=QU1dFvXra0YJrMkRbdttQ3HY3G6J3FATCH/iWMhl5LW1mgDNtR32/bDL+hyOccfTqf
         V9kxE+Q6sxq5bhco9nzdbB/1duTAHA3OQugYeACHml91yMc5iCC0/FHxrCqoQbfNVRDV
         VtRSXiCQOc4uQ0Ahqsodcm/ikQUWawpixu/IrqfaXdF5aFKdIRfX1nk/uS20yYq0Tjnc
         xWF7pfTU8999wYGWf5GpNEcq4ax8u0WC0UNGk59FBYP5YAE/URvVjtauVPvxkEx+mqWj
         Cbk3it3PUfXTLwff9g/FxdMMvHO7lBPe8btm3nuJQUJnUw5nrfAs1lhwjv/5IsisNPI0
         SYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OQIY9teiv+DO52NGyGDZ62WRGPPwTmhR3Xvs0tkhd2U=;
        b=pAavxLiLEXCUkOsP6JFNDnm8eNEGssv7FnnUAIy2+5nTNQT8eZTq7n4u8xNbzLPmk9
         1zQszCPr+akVrY0jENag1N9I2LLuA+y3F4QANFkpc2W3h0pIFB2ezlp5gIBLjfWE3uXL
         sGpyMWcD4b+1bEHEEEt2cwYPHZ/8lvi0b6Lea1vsIJPt1hJWmID9hTdYG8l2FVVgjTW0
         6fofJPn+HJoemk69SJHJCN8Fg4xv4+8Iscn+M975KYpQ/0wAOSNQk93000jo10oTo4mM
         HtYXlkr6kyZBy8y1drNmuqFg1Z4wRIeeonBRH/uzOkYvKSktCN+sr+fmbm0K553KNGgu
         /jng==
X-Gm-Message-State: AKS2vOy7sUhqPFhzsFa27Iyf8cVQz5IHsRcT+/9gAolTRD+KS/K9qG7k
	7/dMcqwjyulZyLYVgRU=
X-Received: by 10.55.106.7 with SMTP id f7mr35022275qkc.189.1498959261247;
        Sat, 01 Jul 2017 18:34:21 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id e15sm10598143qte.3.2017.07.01.18.34.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:34:20 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 23/29] target/arm: [tcg] Port to
 translate_insn
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865776960.17063.4875279139522061160.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <2bfdb883-f19b-7fcf-c28b-7ce39115937e@twiddle.net>
Date: Sat, 1 Jul 2017 18:34:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865776960.17063.4875279139522061160.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CNIeeiBd7Y9o

On 06/28/2017 06:49 AM, Lluís Vilanova wrote:
> +        /* We want to stop the TB if the next insn starts in a new page,
> +         * or if it spans between this page and the next. This means that
> +         * if we're looking at the last halfword in the page we need to
> +         * see if it's a 16-bit Thumb insn (which will fit in this TB)
> +         * or a 32-bit Thumb insn (which won't).
> +         * This is to avoid generating a silly TB with a single 16-bit insn
> +         * in it at the end of this page (which would execute correctly
> +         * but isn't very efficient).
> +         */
> +        return DISAS_PAGE_CROSS;

Any reason to introduce a new name as opposed to TOO_MANY?  As far as I can 
tell they're the same....


> +    if (dc->ss_active && !dc->pstate_ss) {
> +        /* Singlestep state is Active-pending.
> +         * If we're in this state at the start of a TB then either
> +         *  a) we just took an exception to an EL which is being debugged
> +         *     and this is the first insn in the exception handler
> +         *  b) debug exceptions were masked and we just unmasked them
> +         *     without changing EL (eg by clearing PSTATE.D)
> +         * In either case we're going to take a swstep exception in the
> +         * "did not step an insn" case, and so the syndrome ISV and EX
> +         * bits should be zero.
> +         */
> +        assert(dc->base.num_insns == 1);
> +        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
> +                      default_exception_el(dc));
> +        dc->base.is_jmp = DISAS_SKIP;

This is surely DISAS_EXC -- see gen_step_complete_exception.
Why introduce a new name?


r~
