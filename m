Received: by 10.25.44.15 with SMTP id s15csp1210175lfs;
        Fri, 14 Jul 2017 10:26:08 -0700 (PDT)
X-Received: by 10.200.41.172 with SMTP id 41mr12742192qts.85.1500053167959;
        Fri, 14 Jul 2017 10:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500053167; cv=none;
        d=google.com; s=arc-20160816;
        b=HoxaVzEsKP8Wzvzx294YeHRYM05gTLp7XVQ/DOAwfXvvC1Rvpqdn2cwf9uPlv7hUkL
         YySeBKGlId9CsJh85kntHcNxlEa6HhTJDgmxzM1/ql4zRxE9COjHm31o1Ro6VGUjFnub
         gAvAYvE8kOpcEu93CnS4gmP0OtFFdRUI4sLI4FRLGlGtHmlPuDTX4baf1L4VXwwh7I8Z
         Lw+jeIb+XvR7V+VlzaeVWTTGBJfLQPW2fFIRsixWpLg9KN38XUPPnWhOlxd75e4WsO34
         75iibH9ado/7ErDuJB9QZcsiNgPQBqFfpwo3dlB3ziEX/cqWhUs1aEe2y5VlNCHBiNMG
         Rzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=GaP81OUBkyfc9XRlEdE+hmtABrMqP09cAzxMSf5aDZ0=;
        b=SHSYK6UctI///zd87YSPKdyOe0wl5wmcRFD8+dfGpPjScJor/eb/CdSSVRceHtQGIh
         0KkCBRrZZH2T8cTgmuVPXNr6j1bQtyxDpOSdyvIJ0nikpd78VLciKGSgAxc1wHT3gE/h
         yMqQtHzqkvCg+uxf9TiYkoKL3J0H3sfA2cEcNgu6HEymhvLkQGLnVwrwyFn94S4gK5Iz
         Lsl1yEabbe9U7xa1KrNvYwGG7bo9LvJ7LejPf9hHnz7VG5OvqBe0pc9fosZezbbPWJp/
         3lH+JYKO21LddBsKAN7No6eBPBX9/QcZVejny84S8YtbMp+kuiYWzi5BJo9+cOTfJNso
         nPJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=UXDdWCk0;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id u124si8525846qkb.163.2017.07.14.10.26.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 10:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=UXDdWCk0;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id v17so10592983qka.3;
        Fri, 14 Jul 2017 10:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GaP81OUBkyfc9XRlEdE+hmtABrMqP09cAzxMSf5aDZ0=;
        b=UXDdWCk0NLS7EhsB8bSdyp7cfCJnyHytsKWzJy5s6YUlaJF65OniChac4LS98BICoA
         UDdtDs7fbMzYowzp2FbGk5BfqRdkrTUvbwK+6H0uUOvke3OnoJUSabVUcUQSpE12Ey0c
         rp0zcQ+cAE633ose9ZworbWX3sdXSQ8YXBWpoVbgxGW2uUhIpG7EuaJ+psJ2OrGybp+4
         ACq+I1EOaWMKbP3pVozhbHPX9zuR62yUafxsOD8kwWDQRKQ2wi+uaSm/RxrkxGBZULBk
         5b81rdLCfeEp87unxGBD3bYJMbh1d7pKjZwfSaDGQNpalr/vk3Cn2TYy/Lf5JAiMxgKh
         iGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GaP81OUBkyfc9XRlEdE+hmtABrMqP09cAzxMSf5aDZ0=;
        b=rHAw2luASdyi9Es9rJFFUO4raeNrkVuR0bX91vlDhf25ZxULswk82O0aUEdWViONUU
         F1U7mwxZ/fMHSPdXnTLdSo921FwSVGwuUofVGChNJU9htHxYd6YxcUMn24xRuKftHfVr
         /65aljAOcpoMwSMr4SkijinLmT8chxxs1jOvFVmCCmSL2BLNYv/1Yt07/w3vPOY2B5af
         3ACLPrrlJpkXf7otFhPoM83EhW6GObJqL1Z6/9JnTFiC4IZIilGH3pMFaedpavwt8nXD
         Wt/YZHASgjq+zPjbnONq9cbVzRML+WT4WW6tY7U+Ji0n0k7IahYUaprDEfSTm9hGzXSx
         SPsQ==
X-Gm-Message-State: AIVw112j9anmglM3v0Dkb3p0+Gp4116SMJMJte3WHjT5Y/Y7vUZcfFp4
	/X5dEsmmEL7ZJA==
X-Received: by 10.55.189.132 with SMTP id n126mr11925043qkf.89.1500053167336;
        Fri, 14 Jul 2017 10:26:07 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id c5sm4823497qkd.27.2017.07.14.10.26.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 10:26:06 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v13 18/26] target/arm: [tcg] Port to breakpoint_check
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
 <150002437386.22386.7745855254236101855.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <584dade6-5ce0-4950-c0e3-03128bae119e@twiddle.net>
Date: Fri, 14 Jul 2017 07:26:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <150002437386.22386.7745855254236101855.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: of/AycKbP/Co

On 07/13/2017 11:26 PM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
>   target/arm/translate.c |   53 +++++++++++++++++++++++++++++++-----------------
>   1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index b9183fc511..55bef09739 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11917,6 +11917,33 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>   #endif
>   }
>   
> +static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
> +                                    const CPUBreakpoint *bp)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +
> +    if (bp->flags & BP_CPU) {
> +        gen_set_condexec(dc);
> +        gen_set_pc_im(dc, dc->pc);
> +        gen_helper_check_breakpoints(cpu_env);
> +        /* End the TB early; it's likely not going to be executed */
> +        dc->base.is_jmp = DISAS_UPDATE;
> +    } else {
> +        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
> +        /* The address covered by the breakpoint must be
> +           included in [tb->pc, tb->pc + tb->size) in order
> +           to for it to be properly cleared -- thus we
> +           increment the PC here so that the logic setting
> +           tb->size below does the right thing.  */
> +        /* TODO: Advance PC by correct instruction length to
> +         * avoid disassembler error messages */
> +        dc->pc += 2;
> +        dc->base.is_jmp = DISAS_NORETURN;
> +    }
> +
> +    return true;
> +}
> +
>   /* generate intermediate code for basic block 'tb'.  */
>   void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>   {
> @@ -11965,28 +11992,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>           if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>               CPUBreakpoint *bp;
>               QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> -                if (bp->pc == dc->pc) {
> -                    if (bp->flags & BP_CPU) {
> -                        gen_set_condexec(dc);
> -                        gen_set_pc_im(dc, dc->pc);
> -                        gen_helper_check_breakpoints(cpu_env);
> -                        /* End the TB early; it's likely not going to be executed */
> -                        dc->base.is_jmp = DISAS_UPDATE;

Oh I see what you're doing there in the main loop.
And I see that you're copying existing behaviour.

That said, I do wonder if there's a better way.

Looking back at the original patch (5d98bf8f), there do not
seem to have been any other side effects intended; simply
"single step" any insn for which this bp condition is met.

Another way to handle this would be if we could adjust max_insns = num_insns.
That would cause the loop to exit after the current insn, with DISAS_TOO_MANY 
if nothing else.


r~
