Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1513135njb;
        Fri, 9 May 2025 21:21:54 -0700 (PDT)
X-Received: by 2002:a17:903:32ca:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22fc8b41541mr86667715ad.14.1746850914455;
        Fri, 09 May 2025 21:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746850914; cv=none;
        d=google.com; s=arc-20240605;
        b=BP8O7SKFh/ngLv3O2Tm7ooi1t91MzPz69SXdY5SUYlqoySLLcwB6RXmfR4oR1ogriZ
         vxpohZ0HL8R3LlMtivKtyhDioY8Iz4kxaGMB/hozHkkbyEBTCqqyE4G6Y3dzHms6+N+F
         dTeemD+g82v8BiXYkz0jxvUtVZeZuMvlu2YX1iuasvrRnezWh8zGjbvbpLdtdLNdtMBu
         yvy+Sb7xhhjpfa0AovI9+ifbWC1/XhgH0tNxr0tU3Phur7+iyLmNf+/KW/2rkkgbek/M
         3F6eAjByK8UZA6WIEylPLsu/aClKjOyGs7RX7URmy1CU42Jq9PhXzi+HkwHzo89JqjFB
         lziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qPsDrHE/DgFgkvsM6mufkD2WR4T0NAe42f/Qx3S1T8s=;
        fh=844MzXBlPUgvB9rTPJs8WMQKM8K3siMtcVyOpAhfjZg=;
        b=LYEHx4IuyDNeUcHyK5gpYq//e+a4rgb9GfUXUnTRykX+3eXs08oKqaFnX4l3S0XIpi
         HeG0wY0E5VgYvcKhCTXOmZ3me9kieUePzEaKKTcN7wf0mzJmhyk/1oRM0zh8gCW/rEsU
         f7C87nJVEiSimp5wV4+IMLH/X9grsubfX9f6bnPpwWLHgx6ivRBUgrn25N5nUnEDNtMa
         F6DylaknmrnWlAhGQDdMXHjzF9m4PtEYmeVtuUVjdUQ6dGCSzvufbZjW1g83gPAoarzo
         351ZMU9AVFDvxw7O43MPvObrRRZ3AAFVROO1eIp3JhzhqFUXgbjFu8lHwA55D4MRelqv
         gcUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="HmMeZ3/5";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f2215asor28669245ad.12.2025.05.09.21.21.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 May 2025 21:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="HmMeZ3/5";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746850914; x=1747455714; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPsDrHE/DgFgkvsM6mufkD2WR4T0NAe42f/Qx3S1T8s=;
        b=HmMeZ3/5l6A32WiXUgsGPksB6hJh8SVs+RgtffadF8sBkeh1U4t7Q1jWswzlAoPYgS
         202oC83TAXUgN1w5yNS34mG/lq+jpwjTD8XhqRwDuedYTsDbRp4Hcat+y8k4G429zrkR
         T0M+8nmngCPLMESx1w6JV/2GmGKtU6Y31wfbI+8RownyEhtR1JqgNHFBjqgZbWHkw45P
         2qqrnIlE1CN22jCTUyxX2x3wTv0C6AaPgOGb9xfolmRDzacTnz5F4hxlo3TttFW73iQv
         fra8G56AuyalJN5Dn6Sy8zyjP/iYXaAHXq9Ekk+kY/l54Af74lHnBltdldJ5McHGXadv
         h5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746850914; x=1747455714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPsDrHE/DgFgkvsM6mufkD2WR4T0NAe42f/Qx3S1T8s=;
        b=Vou9vOgrePnxfUiZcyl8MJ2b+5Wa3z8yV7JTKYqmQMM0x28oPyO8W8/qAkjf5HdUbm
         f1RDPLYz4pzqak6FvUASuyDAFaRmjb6uI64Ze592hg6RLqglXTXCgoM2o4ZSwOvlff2s
         saJVx7Bc2uBbfOfLuojXRdqgXZtTibXh5r/Rw7ZfhXdrCwYkxcC0z5KsQr5uMXbgjS/e
         2IO1IcqmgzwnlsKLYV2zC6wMNDXV8jB4H1WhzCd6PlnaiYxXynPazLtx0cY6e5HyDd8x
         CcVs9Wz7r/P4iy1Lsy+xOxtapEA9RItJw0BJ9zwvyYqNjorhox5jkQRsgPD3YZCHWIvz
         W5Ww==
X-Gm-Message-State: AOJu0YyaBW1wDkai3DROcuPZTtW5/4CIRGfoqLlndzTQEMocsxkc4ZLc
	ubQKG7MqL0boB1FCfXpOEnc5PkoX/3m1eZSgU6YEjTVAMmhpUDdB8WDi5jAcGFW+Or7XEtRw753
	+
X-Gm-Gg: ASbGnctTgUuXds7MRruC3FhxbYVU7GhoRzoiP42y9PfDFKk/VMGraXcTxfI/x+gAmEL
	mKUFylU8uPIPVk/zLwrR+gZM1tvHl+H+pe9NS9lzamLfMabznrThI5hDCrokPf7guTJ+KC4cBlf
	UO9J3jxNrvjwa9DlIuj3tDIAmowu9tVPCpWdILSiWK0wDjmag8yUiY+4ooK3BTDzM+/lsRIZRjh
	1s9NsHvV/VknHqutM9UHZpdrtH1AVFfWCUqcS0CNgE/7u46QzrvajoAEauVdj2/g6hpcvViZ5ot
	CedS/QG71FutR07k5qTH3OBeoHZ57Vle0cRT5/C5uyjw0UZgouFV9PekNISWQg==
X-Google-Smtp-Source: AGHT+IHxphVRFoXmz6jZVf3z8pHT4Ah1U0GfTb39t5YB6PE8f0K2EmkSBGB4+9ONoLjiTwB6HgyhIA==
X-Received: by 2002:a17:902:d487:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-22fc91a84e2mr85355995ad.46.1746850913593;
        Fri, 09 May 2025 21:21:53 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82bfc20sm25262335ad.256.2025.05.09.21.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 21:21:53 -0700 (PDT)
Message-ID: <d2429cfd-d1b1-435c-b202-7f90f7365bf2@daynix.com>
Date: Sat, 10 May 2025 13:21:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] tests/tcg: make aarch64 boot.S handle different
 starting modes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Julian Armistead <julian.armistead@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-4-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250506125715.232872-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8t6LAUxbgtHj

On 2025/05/06 21:57, Alex Bennée wrote:
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
> v2
>    - allow tests to control the final EL we end up at
>    - use tabs consistently
>    - validate command line arg is between 1 and 3
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
>   tests/tcg/aarch64/system/boot.S           | 135 +++++++++++++++++++++-
>   2 files changed, 136 insertions(+), 2 deletions(-)
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
> index a5df9c173d..a52d28c881 100644
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
> @@ -81,10 +82,137 @@ lower_a32_serror:
>   .error:
>   	.string "Terminated by exception.\n"
>   
> +	.align 8
> +.get_cmd:

This label is prefixed with a dot, which is inconsistent with the other 
labels except ".error".

I guess ".error" is prefixed with a dot to make it local, but a local 
symbol needs to be prefixed with ".L" instead according to:
https://sourceware.org/binutils/docs-2.41/as/Symbol-Names.html#Local-Symbol-Names

 > A local symbol is any symbol beginning with certain local label
 > prefixes. By default, the local label prefix is ‘.L’ for ELF systems
 > or ‘L’ for traditional a.out systems, but each target may have its own
 > set of local label prefixes. On the HPPA local symbols begin with
 > ‘L$’.

> +	.quad	cmdline
> +	.quad	128
> +
>   	.text
>   	.align 4
>   	.global __start
>   __start:
> +	/*
> +	 * The test can set the semihosting command line to the target
> +	 * EL needed for the test. Keep that in w11.
> +	 */
> +	mov	x0, SYS_GET_CMDLINE
> +	adr	x1, .get_cmd
> +	semihosting_call
> +	adrp	x10, cmdline
> +	add	x10, x10, :lo12:cmdline
 > +	ldrb	w11, [x10]> +	cbz	w11, 2f
> +
> +	/* sanity check, clamp to 1 if invalid */
> +	cmp w11, #'0'
> +	b.lt 1f
> +	cmp w11, #'4'
> +	b.ge 1f
> +	sub	w11, w11, #'0'
> +	b 2f
> +1:	mov w11, #1
> +
> +2:

This "sanity check" made me wonder what it is for. This code is simply 
unnecessary if any unknown values are to be ignored and is a bit 
misleading to have this code as it looks like it adds an additional 
behavior. "sub w11, w11, #'0'" is also unnecessary; we can compare w11 
with '2' and '3' later instead.

The patch message says this sanity check was added with v2 so I looked 
for a previous review and found this:
https://lore.kernel.org/qemu-devel/svmkvs.2mf5q4qhsfz83@linaro.org/

 > cmp w11, #'0'
 > b.lt curr_sp0_sync
 > cmp w11, #'4'
 > b.ge curr_sp0_sync

Now I get the original intent; it was to raise an error instead of 
simply ignoring unknown values. However I also see a few problems with 
this original code:
- It still ignores unknown strings that are longer than one character.
- curr_sp0_sync leads to the code that writes a message saying 
"Terminated by exception.", which is incorrect.
- "cmp w11, #'0'" is unnecessary if you check the value after "sub	w11, 
w11, #'0'".

> +	/* Determine current Exception Level */
> +	mrs	x0, CurrentEL
> +	lsr	x0, x0, #2	  /* CurrentEL[3:2] contains the current EL */
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

Why is a nop placed here?

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
> @@ -100,7 +228,7 @@ __start:
>   	 * maps RAM to the first Gb. The stage2 tables have two 2mb
>   	 * translation block entries covering a series of adjacent
>   	 * 4k pages.
> -	*/
> +	 */
>   
>   	/* Stage 1 entry: indexed by IA[38:30] */
>   	adr	x1, .				/* phys address */
> @@ -233,6 +361,11 @@ __sys_outc:
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
