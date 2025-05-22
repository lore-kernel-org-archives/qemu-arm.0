Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1630027njc;
        Wed, 21 May 2025 22:11:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d88:b0:216:1476:f6c with SMTP id adf61e73a8af0-216218c530cmr36652423637.13.1747890659808;
        Wed, 21 May 2025 22:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747890659; cv=none;
        d=google.com; s=arc-20240605;
        b=C0h2EBOvXZePwv/AyOiA6m1Gj1maknEizLyDh48ctL53Owp2xlKgEwRDvd8CIANbyx
         je6Ze6N8Ju4kQuVm8H++guPWg5Wfbciq9IVlZNtlwvXqYZ2dlh4MFL5lEkR9SLbEcT6x
         dVwflHWGwib0r136mRZy9Dumw3DsSVhIhlWdTDfFCG2sw4QgaGkww4EtNMtTpnym2I48
         zwok6RLu5ikWZzEAM68efNxsqmzAXWS7SsFUnVO2N5Rn7fkpR35hthx4OY46x/uBddH4
         GCG3COopC4OtlZ4ldsRKJd8YZvkMG2Z32ayJgl2GRu/0lN8z0UVxIUcWo3QCoBDGhvTq
         AY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aBE+gmB0wIIuuVY+QPTGxfpJaOc5JyIquMbbFNf8+x4=;
        fh=MvpUlZ2doX+SfmfLosP8c7ZgGPQ5G4m6d/iWOQUn3cQ=;
        b=bTa/lhZJGRG308oFCsSMIZEEFWRbzTTUyipGAkx4HJh0wvkSKeVojF3KQ06ntF7doK
         IYt/9dRaUGL3YTnCDoWjjULbuOeiMQjBpk6kO0TeDv+misVWdez4vNJhTE44E0uXtDW5
         IMd6IpXPgaOsYLOdFu+Yx7cY0m+JCVpRMZiJ8q+QoiGCGMaTUwh3wqL8Bws2XK7+53cj
         Qe1K3+aEJR5n7OjDIzZBWmfvntus7UzulNSyMtq5feKAwYHlGHxmN6tShA3XKDpCoy6K
         lx7hrcslpExh4NEF+DXdNKucPUmA5xjpXTJ4MddIeTRA/+AT7kHO13sLiziNMhNvgMqk
         Zz6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ky4SZZVf;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a97f3c96sor10900993b3a.5.2025.05.21.22.10.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ky4SZZVf;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747890659; x=1748495459; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBE+gmB0wIIuuVY+QPTGxfpJaOc5JyIquMbbFNf8+x4=;
        b=Ky4SZZVf/y3+52DvoD5VYQWcEwci5UZpmdWh8JzzwM4x+Y/s293Ut+se8ATQKPUB+j
         A6ezbH3BYpjxmqbkjZLydX5GgEf2sUjCAKeiOfIzO9knJj1aFFOziA9/d85qOh45WjBp
         M1AQLPTgwt/X7GswWpStFXc01elyONyxF/0DZu98IxtZ7YV3S3Zs3z6xvxdvjm6zO4c7
         bm4k7nZ3KsGY6lnPi19xFKgYsjnR4/waf1LHHfk8HMHc1P4N2841A6yXI18+psL1JUHE
         nHBKzq+sy4JmCO5G9a5XiuVVY/ObKvqMBk3pkr3kJIkYLRl1bhdQqPPOgDMWVTjLJ70z
         6W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890659; x=1748495459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBE+gmB0wIIuuVY+QPTGxfpJaOc5JyIquMbbFNf8+x4=;
        b=qUDs8LOqnAHYyI1wSaJX6aQ7kIWSg6nOsXl8dtyCr8X6TJxS26eVYRCXDpSoPigi8z
         niZpmh+tm1uJtX8PQvNNG+xS5gTBAGBnQsyx6y+xkkFmoz1GOEyGtq3hroOA2k+AZu7W
         Qr5UmbUxFPAH4yFnipWlrJ9A4vdpTGEWIZf69rOHF3gnNV+lYw+7SpGQrZsxFyP0OWSu
         OSH2iHYRhO7xf8pr2MEf5lA4kI0EoRrFzQ92lhlG9yAmnfHEB0h+ZH9bL1tI6kpYM3ko
         7wAbkmI2NlSxGaAHuqiGZsVsRd43YHgN0UkM79wYI4zslFoALBKAelWMJ32Zt6K3vkra
         s6Zw==
X-Gm-Message-State: AOJu0YzFJD/F9+JC2U0HSOfQUSjM5Nq6c0YkGLTdKdAZ6Puls9yAFFfM
	TOI+I39YIGKAtCwDbgLiPhSgshAtRWPu8HoNGEJudZ2js0LWeKCcbT944aAPszsN01di0ukYJp+
	tRabv
X-Gm-Gg: ASbGnctvi/DpjToJB77aINivnhP0NQNrhxMSNA6MwNYrhjI/tUMEtU5JWD4dggiwTxb
	AciDCkWs8SlK/cqbID86CDMTRdq2c781xl4YfO3pKLAVZjrYIy5OAbXFcC0PUNvGLLnWdwEjzMe
	x+N3z3YcHMDJwsExZOCo4ds2ebGSEQe/x0ehxsIhhQ6eLg2tOqbdAE2sJLJT9JIhMHHTv5o3t4i
	T+n6M1tMW24vG+39Obs0fpXnjZtCBv18W+MYGRE8wOK8nUy136V/2c86RU9w2VQUin9RPV+AgAv
	OP4UxVD8EFKGhNYe82KwoQn/c7V64Y3nf9R1IiiJwCsiwfq94RXUpHVW3H+j2A==
X-Google-Smtp-Source: AGHT+IGLQId5d3lmhJlTNd/LKsI9RLP1Xu7ZyxKwOYcuz2XpYztfNuIondhh0Mwh9XHsCLY0CR29cw==
X-Received: by 2002:aa7:9ddd:0:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-742b3a6dbc0mr23729734b3a.20.1747890658973;
        Wed, 21 May 2025 22:10:58 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829bb3sm10752070b3a.100.2025.05.21.22.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:10:58 -0700 (PDT)
Message-ID: <7a76e746-9022-48cf-8216-775071e6d631@daynix.com>
Date: Thu, 22 May 2025 14:10:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] tests/tcg: make aarch64 boot.S handle different
 starting modes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Julian Armistead <julian.armistead@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-4-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6orq7aLhmp18

On 2025/05/22 1:42, Alex Bennée wrote:
> Currently the boot.S code assumes everything starts at EL1. This will
> break things like the memory test which will barf on unaligned memory
> access when run at a higher level.
> 
> Adapt the boot code to do some basic verification of the starting mode
> and the minimal configuration to move to the lower exception levels.
> With this we can run the memory test with:
> 
>    -M virt,secure=on
>    -M virt,secure=on,virtualization=on
>    -M virt,virtualisation=on
> 
> If a test needs to be at a particular EL it can use the semihosting
> command line to indicate the level we should execute in.
> 
> Cc: Julian Armistead <julian.armistead@linaro.org>
> Cc: Jim MacArthur <jim.macarthur@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - create system stack so we _exit cleanly
>    - normalise EL string before compares
>    - catch when we start in a lower EL than we asked for
>    - default to EL1 when arg unclear
> v2
>    - allow tests to control the final EL we end up at
>    - use tabs consistently
>    - validate command line arg is between 1 and 3
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
>   tests/tcg/aarch64/system/boot.S           | 171 +++++++++++++++++++++-
>   2 files changed, 168 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
> index 9c52475b7a..f7a7d2b800 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -68,7 +68,8 @@ run-plugin-semiconsole-with-%: semiconsole
>   
>   # vtimer test needs EL2
>   QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -smp 4
> -run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel
> +QEMU_EL2_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output,arg="2"
> +run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_EL2_BASE_ARGS) -kernel
>   
>   # Simple Record/Replay Test
>   .PHONY: memory-record
> diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
> index a5df9c173d..78380a6f75 100644
> --- a/tests/tcg/aarch64/system/boot.S
> +++ b/tests/tcg/aarch64/system/boot.S
> @@ -16,6 +16,7 @@
>   #define semihosting_call hlt 0xf000
>   #define SYS_WRITEC	0x03	/* character to debug channel */
>   #define SYS_WRITE0	0x04	/* string to debug channel */
> +#define SYS_GET_CMDLINE 0x15	/* get command line */
>   #define SYS_EXIT	0x18
>   
>   	.align	12
> @@ -70,21 +71,171 @@ lower_a32_sync:
>   lower_a32_irq:
>   lower_a32_fiq:
>   lower_a32_serror:
> +	adr	x1, .unexp_excp
> +exit_msg:
>   	mov	x0, SYS_WRITE0
> -	adr	x1, .error
>   	semihosting_call
>   	mov	x0, 1 /* EXIT_FAILURE */
>   	bl 	_exit
>   	/* never returns */
>   
>   	.section .rodata
> -.error:
> -	.string "Terminated by exception.\n"
> +.unexp_excp:
> +	.string "Unexpected exception.\n"
> +.high_el_msg:
> +	.string "Started in lower EL than requested.\n"
> +
> +	.align 8

.get_cmd may be put before strings to avoid unnecessary padding for 
alignment.

> +.get_cmd:

I pointed out a style problem with this label in the last review:

 > This label is prefixed with a dot, which is inconsistent with the other
 > labels except ".error".
 >
 > I guess ".error" is prefixed with a dot to make it local, but a local
 > symbol needs to be prefixed with ".L" instead according to:
 > https://sourceware.org/binutils/docs-2.41/as/Symbol-Names.html#Local-
 > Symbol-Names
 >
 >  > A local symbol is any symbol beginning with certain local label
 >  > prefixes. By default, the local label prefix is ‘.L’ for ELF systems
 >  > or ‘L’ for traditional a.out systems, but each target may have its own
 >  > set of local label prefixes. On the HPPA local symbols begin with
 >  > ‘L$’.

> +	.quad	cmdline
> +	.quad	128
>   
>   	.text
>   	.align 4
>   	.global __start
>   __start:
> +	/*
> +         * Initialise the stack for whatever EL we are in before
> +	 * anything else, we need it to be able to _exit cleanly.
> +	 * It's smaller than the stack we pass to the C code but we
> +	 * don't need much.
> +	 */
> +	adrp	x0, system_stack_end
> +	add	x0, x0, :lo12:system_stack_end
> +	mov	sp, x0
> +
> +	/*
> +	 * The test can set the semihosting command line to the target
> +	 * EL needed for the test. However if no semihosting args are set we will
> +	 * end up with -kernel/-append data (see semihosting_arg_fallback).
> +	 * Keep the normalised target in w11.
> +	 */
> +	mov	x0, SYS_GET_CMDLINE
> +	adr	x1, .get_cmd
> +	semihosting_call
> +	adrp	x10, cmdline
> +	add	x10, x10, :lo12:cmdline
> +	ldrb	w11, [x10]
> +
> +	/* sanity check, normalise char to EL, clamp to 1 if outside range */
> +	subs w11, w11, #'0'
> +	b.lt el_default
> +	cmp  w11, #3
> +	b.gt el_default
> +	b 1f
> +
> +el_high:
> +	adr	x1, .high_el_msg
> +	b	exit_msg
> +
> +el_default:
> +	mov	w11, #1
> +
> +1:
> +	/* Determine current Exception Level */
> +	mrs	x0, CurrentEL
> +	lsr	x0, x0, #2	  /* CurrentEL[3:2] contains the current EL */
> +
> +	/* Are we already in a lower EL than we want? */
> +	cmp	w11, w0
> +	bgt	el_high

Shorter:

	/* sanity check, normalise char to EL, clamp to 1 if outside range */
	subs	w11, w11, #'0'
	mov	w0, #1
	cmp	w11, #3
	csel	w11, w11, w0, GT

	/* Determine current Exception Level */
	mrs	x0, CurrentEL
	lsr	x0, x0, #2

	cmp	w11, w0
	ble	el_correct
	adr	x1, high_el_msg
	b	exit_msg

el_correct:

> +
> +	/* Branch based on current EL */
> +	cmp	x0, #3
> +	b.eq	setup_el3
> +	cmp	x0, #2
> +	b.eq	setup_el2
> +	cmp	x0, #1
> +	b.eq	at_testel	     /* Already at EL1, skip transition */
> +	/* Should not be at EL0 - error out */
> +	b	curr_sp0_sync

This still says "Unexpected exception."

> +
> +setup_el3:
> +	/* Ensure we trap if we get anything wrong */
> +	adr	x0, vector_table
> +	msr	vbar_el3, x0
> +
> +	/* Does the test want to be at EL3? */
> +	cmp	w11, #3
> +	beq	at_testel
> +
> +	/* Configure EL3 to for lower states (EL2 or EL1) */
> +	mrs	x0, scr_el3
> +	orr	x0, x0, #(1 << 10)    /* RW = 1: EL2/EL1 execution state is AArch64 */
> +	orr	x0, x0, #(1 << 0)     /* NS = 1: Non-secure state */
> +	msr	scr_el3, x0
> +
> +	/*
> +	 * We need to check if EL2 is actually enabled via ID_AA64PFR0_EL1,
> +	 * otherwise we should just jump straight to EL1.
> +	 */
> +	mrs	x0, id_aa64pfr0_el1
> +	ubfx	x0, x0, #8, #4	      /* Extract EL2 field (bits 11:8) */
> +	cbz	x0, el2_not_present   /* If field is 0 no EL2 */
> +
> +
> +	/* Prepare SPSR for exception return to EL2 */
> +	mov	x0, #0x3c9	      /* DAIF bits and EL2h mode (9) */
> +	msr	spsr_el3, x0
> +
> +	/* Set EL2 entry point */
> +	adr	x0, setup_el2
> +	msr	elr_el3, x0
> +
> +	/* Return to EL2 */
> +	eret
> +	nop

NOP is still present here.

> +
> +el2_not_present:
> +	/* Initialize SCTLR_EL1 with reset value */
> +	msr	sctlr_el1, xzr
> +
> +	/* Set EL1 entry point */
> +	adr	x0, at_testel
> +	msr	elr_el3, x0
> +
> +	/* Prepare SPSR for exception return to EL1h with interrupts masked */
> +	mov	x0, #0x3c5	      /* DAIF bits and EL1h mode (5) */
> +	msr	spsr_el3, x0
> +
> +	isb			      /* Synchronization barrier */
> +	eret			      /* Jump to EL1 */
> +
> +setup_el2:
> +	/* Ensure we trap if we get anything wrong */
> +	adr	x0, vector_table
> +	msr	vbar_el2, x0
> +
> +	/* Does the test want to be at EL2? */
> +	cmp	w11, #2
> +	beq	at_testel
> +
> +	/* Configure EL2 to allow transition to EL1 */
> +	mrs	x0, hcr_el2
> +	orr	x0, x0, #(1 << 31)    /* RW = 1: EL1 execution state is AArch64 */
> +	msr	hcr_el2, x0
> +
> +	/* Initialize SCTLR_EL1 with reset value */
> +	msr	sctlr_el1, xzr
> +
> +	/* Set EL1 entry point */
> +	adr	x0, at_testel
> +	msr	elr_el2, x0
> +
> +	/* Prepare SPSR for exception return to EL1 */
> +	mov	x0, #(0x5 << 0)	      /* EL1h (SPx), with interrupts disabled */
> +	msr	spsr_el2, x0
> +
> +	/* Return to EL1 */
> +	eret
> +
> +	nop
> +
> +	/*
> +	 * At the target EL for the test, usually EL1. Note we still
> +	 * set everything up as if we were at EL1.
> +	 */
> +at_testel:
>   	/* Installs a table of exception vectors to catch and handle all
>   	   exceptions by terminating the process with a diagnostic.  */
>   	adr	x0, vector_table
> @@ -100,7 +251,7 @@ __start:
>   	 * maps RAM to the first Gb. The stage2 tables have two 2mb
>   	 * translation block entries covering a series of adjacent
>   	 * 4k pages.
> -	*/
> +	 */
>   
>   	/* Stage 1 entry: indexed by IA[38:30] */
>   	adr	x1, .				/* phys address */
> @@ -198,7 +349,8 @@ __start:
>   	orr	x0, x0, #(3 << 16)
>   	msr	cpacr_el1, x0
>   
> -	/* Setup some stack space and enter the test code.
> +	/*
> +	 * Setup some stack space before we enter the test code.
>   	 * Assume everything except the return value is garbage when we
>   	 * return, we won't need it.
>   	 */
> @@ -233,6 +385,11 @@ __sys_outc:
>   	ret
>   
>   	.data
> +
> +	.align 8
> +cmdline:
> +	.space 128, 0
> +
>   	.align	12
>   
>   	/* Translation table
> @@ -246,6 +403,10 @@ ttb_stage2:
>   	.space	4096, 0
>   
>   	.align	12
> +system_stack:
> +	.space 4096, 0
> +system_stack_end:
> +
>   stack:
>   	.space 65536, 0
>   stack_end:
