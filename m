Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3747498lff;
        Fri, 20 Dec 2019 07:23:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMxeoffzOyo8VbPC8la3uj5kJZYLZ3mpvC++J4NSxVAQDcwIrrflO69sLyDka/nr8Jtf26
X-Received: by 2002:adf:f885:: with SMTP id u5mr16205024wrp.359.1576855423187;
        Fri, 20 Dec 2019 07:23:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576855423; cv=pass;
        d=google.com; s=arc-20160816;
        b=WSHnw1/dSVS7h4XwO3fnGyb1BUITDd1yQgU4XMXt58ZE8vI6J7eg/IIHENLEM740j3
         tl65bvraGAYjDYHvuGZUR+aH/Sh3QeLyAidXIybtlFtBL2e3QKTu8ctChp/gpNvcRjS+
         /dOcVFjkTLEmtMcJQ5iJ4bhMvO5PEXJ7I1CoydWzYqo2rvmYVDm5n7CP4G4JSFrJlWIN
         J3XjHSqk3NxT2ya+bx6taTUBuxL+Zv7v9tO6qEEYGjxJpwvqeJPReFHZF7xirPw11l+3
         8rB2VtoqVycEw37X2BIFF8MqkNU7wgGOmZ6tIK8cC1C1R0150d509bclfuOvWNsBrwOA
         8Y6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=v4F/97wPp1VqI7JzGMEVYBc5gcEooO+7EhMvJDjBxpY=;
        b=SSNxVCVfpYb+GTAfD4fMm4FOPWgnobWKL+mtvzWZ8/3VTDUjA+6oHGyAlg90S6Wt6w
         pz6E9jZPKTMRcr4AIJUhH8VnWkbq4IHxhkpIF2b4aU3yZoiDOgzgAJP+6lrkmLrorPoh
         giP0CTG2fUdx+bL+YUbu4jkruvTuMOiP99kvCBbs+bfjFBonvKzEuyvB1Pe6jtOg8/VF
         yPG/GSd0egpnukY+ErCoE8CCcbeNz2AeZfInwRjiEna6+5zO9roRnvlExdqHS+dPtqXq
         09KJDBs6iu2eSwFIsdOHOfCoSn1pRYbeWCnjZ5cK+ONQuP8s4mmY8kDy5DDzyUP37uJs
         vPQA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=tp4vK3hT;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id z145si9625392wmc.33.2019.12.20.07.23.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 07:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=tp4vK3hT;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
	by beetle.greensocs.com (Postfix) with ESMTPSA id CC19996EF0;
	Fri, 20 Dec 2019 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1576855422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4F/97wPp1VqI7JzGMEVYBc5gcEooO+7EhMvJDjBxpY=;
	b=tp4vK3hTSz0UOzuyT7+m4m82B2dOFRNTKMGgkeYXk09X/ya9S05UxUgK3IqNR2oQLoiMzV
	vHSHs8FLjNzBS1uWOiRfjkh/0hA1aeThIfNcyeYHsPn86CPf6Xj4GekkxR7rDzKLARB59K
	8teXt1e3ohoha2EFqHmCqT2uqym05do=
Subject: Re: [PATCH v4 08/21] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20191220120438.16114-1-alex.bennee@linaro.org>
 <20191220120438.16114-9-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <2ea7692c-02a8-8267-de6d-529731958a8f@greensocs.com>
Date: Fri, 20 Dec 2019 16:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191220120438.16114-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1576855422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4F/97wPp1VqI7JzGMEVYBc5gcEooO+7EhMvJDjBxpY=;
	b=LQ37Df4kzJ1p6Aek/NpUqOfH2I0cAHJblZ9fj1U7jfagEBqACto/8A6jALVy4cJCtW+xAA
	nFoR4IatTn6hP+LYwj7dV/tlRqh6GQq46oKRs48maP5+NBDNhu/POs//n0l1QLw0c/L7VQ
	VtmNckOBac9HoGXiS7gNGSrS4DFU9Q0=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576855422; a=rsa-sha256;
	cv=none;
	b=aBgcSmy4GQ7c0C6bwBXvdFx9JiRCTgJCYKDOm2HnQ29tjrMWKVsxrs1i0ytlkiIz1nZ7iL
	2vu2VDds16sh+0fbNVbh17laRC4XLQoBuzVMcrF292WDpHa+PrM/28pQkAUQOpQxhnOAub
	eDRu/NcCJFkOaE0YfZ2K02nMuweXO0g=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: EzCkO8IoJ29i



On 12/20/19 1:04 PM, Alex Bennée wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - fix mem_buf calculation for ppc_maybe_bswap_register
> ---

Hi Alex,

You missed the ppc_maybe_bswap_register() calls in ppc/translate_init.inc.c

> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
> index d33d65dff70..ca241d7f5e6 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -9845,7 +9845,7 @@ static int gdb_find_spr_idx(CPUPPCState *env, int n)
>      return -1;
>  }
>  
> -static int gdb_get_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      int reg;
>      int len;
> @@ -9856,8 +9856,8 @@ static int gdb_get_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      }
>  
>      len = TARGET_LONG_SIZE;
> -    stn_p(mem_buf, len, env->spr[reg]);
> -    ppc_maybe_bswap_register(env, mem_buf, len);
> +    gdb_get_regl(buf, env->spr[reg]);
> +    ppc_maybe_bswap_register(env, buf->data - len, len);

ppc_maybe_bswap_register(env, buf->data + buf->len - len, len);

>      return len;
>  }
>  
> @@ -9879,15 +9879,18 @@ static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>  }
>  #endif
>  
> -static int gdb_get_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
> +    uint8_t *mem_buf;
>      if (n < 32) {
> -        stfq_p(mem_buf, *cpu_fpr_ptr(env, n));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
> +        mem_buf = buf->data - 8;

mem_buf = buf->data + buf->len - 8;

>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          return 8;
>      }
>      if (n == 32) {
> -        stl_p(mem_buf, env->fpscr);
> +        gdb_get_reg32(buf, env->fpscr);
> +        mem_buf = buf->data - 4;

mem_buf = buf->data + buf->len - 4;

>          ppc_maybe_bswap_register(env, mem_buf, 4);>          return 4;
>      }
> @@ -9909,28 +9912,31 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>  
> -static int gdb_get_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
> +    uint8_t *mem_buf;
> +
>      if (n < 32) {
>          ppc_avr_t *avr = cpu_avr_ptr(env, n);
>          if (!avr_need_swap(env)) {
> -            stq_p(mem_buf, avr->u64[0]);
> -            stq_p(mem_buf + 8, avr->u64[1]);
> +            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
>          } else {
> -            stq_p(mem_buf, avr->u64[1]);
> -            stq_p(mem_buf + 8, avr->u64[0]);
> +            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
>          }
> +        mem_buf = buf->data - 16;

mem_buf = buf->data + buf->len - 16;

>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          ppc_maybe_bswap_register(env, mem_buf + 8, 8);
>          return 16;
>      }
>      if (n == 32) {
> -        stl_p(mem_buf, helper_mfvscr(env));
> +        gdb_get_reg32(buf, helper_mfvscr(env));
> +        mem_buf = buf->data - 4;

mem_buf = buf->data + buf->len - 4;

>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
>      }
>      if (n == 33) {
> -        stl_p(mem_buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        mem_buf = buf->data - 4;

mem_buf = buf->data + buf->len - 4;

>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
>      }
> @@ -9965,25 +9971,25 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>  
> -static int gdb_get_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      if (n < 32) {
>  #if defined(TARGET_PPC64)
> -        stl_p(mem_buf, env->gpr[n] >> 32);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        gdb_get_reg32(buf, env->gpr[n] >> 32);
> +        ppc_maybe_bswap_register(env, buf->data - 4, 4);

ppc_maybe_bswap_register(env, buf->data + buf->len - 4, 4);

>  #else
> -        stl_p(mem_buf, env->gprh[n]);
> +        gdb_get_reg32(buf, env->gprh[n]);
>  #endif
>          return 4;
>      }
>      if (n == 32) {
> -        stq_p(mem_buf, env->spe_acc);
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        gdb_get_reg64(buf, env->spe_acc);
> +        ppc_maybe_bswap_register(env, buf->data - 8, 8);

ppc_maybe_bswap_register(env, buf->data + buf->len - 8, 8);

>          return 8;
>      }
>      if (n == 33) {
> -        stl_p(mem_buf, env->spe_fscr);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        gdb_get_reg32(buf, env->spe_fscr);
> +        ppc_maybe_bswap_register(env, buf->data - 4, 4);

ppc_maybe_bswap_register(env, buf->data + buf->len - 4, 4);

>          return 4;
>      }
>      return 0;
> @@ -10018,11 +10024,11 @@ static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
>      return 0;
>  }
>  
> -static int gdb_get_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      if (n < 32) {
> -        stq_p(mem_buf, *cpu_vsrl_ptr(env, n));
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
> +        ppc_maybe_bswap_register(env, buf->data - 8, 8);

ppc_maybe_bswap_register(env, buf->data + buf->len - 8, 8);

>          return 8;
>      }
>      return 0;

With these fixes,
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Damien
