Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp694998njj;
        Fri, 2 May 2025 01:28:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz7+3V/GCNfamKwK5ND8AHO+lso5agKdshpQgcJWTNLrZZR+gXs1bwjP4OvllrYSdW94WgFobYNbr09Q==@linaro.org
X-Received: by 2002:a05:6000:2a6:b0:3a0:89e9:bb4 with SMTP id ffacd0b85a97d-3a099aea7f7mr1386413f8f.47.1746174522836;
        Fri, 02 May 2025 01:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746174522; cv=none;
        d=google.com; s=arc-20240605;
        b=MCPKBUhEuLizx20gm8M+/iBU6oFt84oflfS6niflgkQ2UQagd237v9zG0H05EDQPTk
         Feo2EPm9uQg2k8LCUKhJJ0r0z3OymcMRArxwAhmHw2IzejnncEEsU5MEtqb9PEOUk9Lw
         bDl47WmQFZHgTtS9NDGFQmTdv2B5sf48Cnf2PPrEuEm6oeEldLRWVCJXKjTBaMmBT/Q6
         Q0p9cS6DamlPN4jOuvsxa7jSxqD743oYR31kfobQkQUzmgvTSG2XaM5RZtllH4MUwO7t
         glTc9Fh+QVSWEBh17ezJ3Ru259psahMr/pCwlKnvfWZdCFXFmPssNM5R9e9uJfPOfFl0
         DT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=X3dwH3ri7jWkmtpB6vmUtFtMZzeYOWWAci9OZKMkGyw=;
        fh=XM8wj+pkqgMj1abdCAIvQRbubWKxGJptWprIJnPbO5o=;
        b=T+/77uGXmj6opIal5u6nMy5c+qfNoaAC86Yt+3aAVHkLjV/jLpW5g8nvt+u5I3tlDm
         bfdKDlmzExqgy4w3njthZd5BTAtzOrTWmIcg2/R1zyu65/0F7ngVvWmOVgiyc9LmoOZS
         oAEPK3d1V+ZZWKi133NU1Ac+hn5DW6ek+lfaGeNmZOGz0qP454DLzAd/TOOMG4cRNofm
         uFF1w6pxCOtNlb4AY6l/pn0eIeeI/zLg15Qnwbkwon/csSBQFp3aZYoJUmJBijEJWRw8
         LPiym/uDDTsYKMk5uQnYKsH1Xn7Nl7ZbHkCjFAll5xDUBh8f8tF+fJcV/OQ/R+WuYITR
         4QDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Yr/hARmn";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a095a873ffsor1058805f8f.7.2025.05.02.01.28.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 May 2025 01:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Yr/hARmn";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746174522; x=1746779322; darn=linaro.org;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3dwH3ri7jWkmtpB6vmUtFtMZzeYOWWAci9OZKMkGyw=;
        b=Yr/hARmn+NWql0nOvS443i3TN5vh56g+NQWxsyWfb0FzC5yv/VGguW86aqPb5asE4k
         yBSzkoa2HvuFc30D0djexaIpCV1PNOIaMoyUksDOsl/10p4tvX0gJGsK9Z9X86sPBPIM
         Gi7+/7m+UPJUtEG+gY8Opnk8wD5ejXjdHTgw7w+62N/hxmQUSTfOjIt/kPz4vyzDE26E
         iCxqWBlIUh6Jsj26i8q4LBmnQc4eH0VXI+3OoP80gDFvUA+8CQlZIwBT1nEJDV0R8yNN
         nWltY1pSpiK3jDjFx14KgrNtEQBp53g8me0K7pv1EzZbndpos3ZV7Wq/7UWsmQsrsVKy
         TkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746174522; x=1746779322;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3dwH3ri7jWkmtpB6vmUtFtMZzeYOWWAci9OZKMkGyw=;
        b=Pgh3yMvIr8r+I+6CPtDkrPsVRYCffjm5TR6yGc3lnsR3X3G0ITb3j3kS8WTdyLpCVL
         2htO/1S0hlDcfGTYJWKGgn29FCSadP61lqlwH6Be+hsqZoHFTj0huxIqyAA92vqV3mRW
         ttpvLi38ScNbRGTnnPo0tRSLlbs0RBeyIkjyC02+J//kQEblSbNwZy0ZB0iBg6gjRnaT
         9O8fg3a/U9RSiZe2sdGDApPOpNqL2AAWR8IBTrx1TQMscuyg2JTeN+Du5WMaxXrN9Zug
         T7oH5P6rf+yaE/t1OEnXbxlwJvYftoRHQUyJuEVYgWOjecRcQ6SzzZ+qabxUJxir2BY9
         58vw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ury33Atoojn02Q1x54Zjdn3MK5/x+1adhWnKrO5RGR8QsPtUPxPP16uaY45mEDdeGa6EiofLBnOU+w==@linaro.org
X-Gm-Message-State: AOJu0Yw2vgxogqnh3dbHIl0Rv2ofh7lsFxfm8QlQcZKCUoO8v5SjSb2b
	VT3l59iHSfIPpkYa0m51CCWfUxuH658p3LOe5h2PcrGpIJtqi22u5/Ss1QxtAh3DwIDw2iald/x
	QaEwgtg==
X-Gm-Gg: ASbGncvPrDXNXKEmWoKXPO8VekK+912AumUcWVhJ6L59VGU/tcWllGyUfoEA7Usuqip
	xg2hs8YcaSGOZykukNcbbJGH3eWNXTCWh4/Orr/N1Fls1r87/vgM9bMR6LVTifBCMrGOpe/2FY5
	mD4gLIYy6D7RTRVbIAX+9DGhxTHuWHzOsh3G/Y7qtMDPOo7gsVTbWHUMT61YbW998qgLDfH09dA
	2Edozd0FhmnOSKfZpTABZtW5bVH1Vm8fhTiTuljcHzvo86rw+HUr28urWOPQsI5c5Qh0tYHrJaw
	+1MoEIIG/4gAo7hZ3LSWyVuBCq764yWaHpPorn6sa/fRjfgk9I9k+TBJZgn+89TBDQPFPSeRVSq
	IeTq60sPdgRCzeA==
X-Google-Smtp-Source: AGHT+IFSQWXEYhV+a9Znm66QhWbnMrZV8ZHjGcxy9c2i9Go2kWusrXqGvoZw4gMDgts4O/S6LmujTA==
X-Received: by 2002:a5d:47a6:0:b0:391:3049:d58d with SMTP id ffacd0b85a97d-3a099a862cdmr1179981f8f.0.1746174522286;
        Fri, 02 May 2025 01:28:42 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli-email.org (adsl-194.109.242.94.tellas.gr. [109.242.94.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d15dasm36546275e9.16.2025.05.02.01.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:28:41 -0700 (PDT)
Date: Fri, 02 May 2025 10:54:15 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, Michael S. Tsirkin <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>, David Hildenbrand <david@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>, Julian Armistead <julian.armistead@linaro.org>, Jim MacArthur <jim.macarthur@linaro.org>
Bcc: 
Subject: Re: [PATCH 3/9] tests/tcg: make aarch64 boot.S handle different starting modes
User-Agent: meli/0.8.12
References: <20250428125918.449346-1-alex.bennee@linaro.org> <20250428125918.449346-4-alex.bennee@linaro.org>
In-Reply-To: <20250428125918.449346-4-alex.bennee@linaro.org>
Message-ID: <svmkvs.2mf5q4qhsfz83@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-TUID: Mm2K6N//t7yI

On Mon, 28 Apr 2025 15:59, Alex Bennée <alex.bennee@linaro.org> wrote:
>Currently the boot.S code assumes everything starts at EL1. This will
>break things like the memory test which will barf on unaligned memory
>access when run at a higher level.
>
>Adapt the boot code to do some basic verification of the starting mode
>and the minimal configuration to move to the lower exception levels.
>With this we can run the memory test with:
>
>  -M virt,secure=on
>  -M virt,secure=on,virtualization=on
>  -M virt,virtualisation=on
>
>If a test needs to be at a particular EL it can use the semihosting
>command line to indicate the level we should execute in.
>
>Cc: Julian Armistead <julian.armistead@linaro.org>
>Cc: Jim MacArthur <jim.macarthur@linaro.org>
>Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
>---
>v2
>  - allow tests to control the final EL we end up at
>---
> tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
> tests/tcg/aarch64/system/boot.S           | 127 +++++++++++++++++++++-
> 2 files changed, 128 insertions(+), 2 deletions(-)
>
>diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
>index 9c52475b7a..f7a7d2b800 100644
>--- a/tests/tcg/aarch64/Makefile.softmmu-target
>+++ b/tests/tcg/aarch64/Makefile.softmmu-target
>@@ -68,7 +68,8 @@ run-plugin-semiconsole-with-%: semiconsole
> 
> # vtimer test needs EL2
> QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -smp 4
>-run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel
>+QEMU_EL2_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output,arg="2"
>+run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_EL2_BASE_ARGS) -kernel
> 
> # Simple Record/Replay Test
> .PHONY: memory-record


The insertions in boot.S have mixed spaces/tabs


>diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
>index a5df9c173d..19b18bdeec 100644
>--- a/tests/tcg/aarch64/system/boot.S
>+++ b/tests/tcg/aarch64/system/boot.S
>@@ -16,6 +16,7 @@
> #define semihosting_call hlt 0xf000
> #define SYS_WRITEC	0x03	/* character to debug channel */
> #define SYS_WRITE0	0x04	/* string to debug channel */
>+#define SYS_GET_CMDLINE 0x15	/* get command line */
> #define SYS_EXIT	0x18
> 
> 	.align	12
>@@ -81,10 +82,129 @@ lower_a32_serror:
> .error:
> 	.string "Terminated by exception.\n"
> 
>+	.align 8
>+.get_cmd:
>+	.quad	cmdline
>+	.quad	128
>+
> 	.text
> 	.align 4
> 	.global __start
> __start:
>+	/*
>+	 * The test can set the semihosting command line to the target
>+	 * EL needed for the test. Keep that in w11.
>+	 */
>+	mov	x0, SYS_GET_CMDLINE
>+	adr	x1, .get_cmd
>+	semihosting_call
>+	adrp	x10, cmdline
>+	add	x10, x10, :lo12:cmdline
>+	ldrb	w11, [x10]
>+	cbz	w11, 1f

Suggested sanity check:

cmp w11, #'0'
b.lt curr_sp0_sync
cmp w11, #'4'
b.ge curr_sp0_sync

>+	sub 	w11, w11, #'0'
>+1:
>+
>+	/* Determine current Exception Level */
>+	mrs     x0, CurrentEL
>+	lsr     x0, x0, #2        /* CurrentEL[3:2] contains the current EL */
>+
>+	/* Branch based on current EL */
>+	cmp     x0, #3
>+	b.eq    setup_el3
>+	cmp     x0, #2
>+	b.eq    setup_el2
>+	cmp     x0, #1
>+	b.eq    at_testel            /* Already at EL1, skip transition */
>+	/* Should not be at EL0 - error out */
>+	b       curr_sp0_sync
>+
>+setup_el3:
>+	/* Ensure we trap if we get anything wrong */
>+	adr	x0, vector_table
>+	msr	vbar_el3, x0
>+
>+	/* Does the test want to be at EL3? */
>+	cmp	w11, #3
>+	beq	at_testel
>+
>+	/* Configure EL3 to for lower states (EL2 or EL1) */
>+	mrs     x0, scr_el3
>+	orr     x0, x0, #(1 << 10)    /* RW = 1: EL2/EL1 execution state is AArch64 */
>+	orr     x0, x0, #(1 << 0)     /* NS = 1: Non-secure state */
>+	msr     scr_el3, x0
>+
>+	/*
>+	 * We need to check if EL2 is actually enabled via ID_AA64PFR0_EL1,
>+	 * otherwise we should just jump straight to EL1.
>+	 */
>+	mrs     x0, id_aa64pfr0_el1
>+	ubfx    x0, x0, #8, #4        /* Extract EL2 field (bits 11:8) */
>+	cbz     x0, el2_not_present   /* If field is 0 no EL2 */
>+
>+
>+	/* Prepare SPSR for exception return to EL2 */
>+	mov	x0, #0x3c9            /* DAIF bits and EL2h mode (9) */
>+	msr     spsr_el3, x0
>+
>+	/* Set EL2 entry point */
>+	adr     x0, setup_el2
>+	msr     elr_el3, x0
>+
>+	/* Return to EL2 */
>+	eret
>+	nop
>+
>+el2_not_present:
>+	/* Initialize SCTLR_EL1 with reset value */
>+	msr     sctlr_el1, xzr
>+
>+	/* Set EL1 entry point */
>+	adr     x0, at_testel
>+	msr     elr_el3, x0
>+
>+	/* Prepare SPSR for exception return to EL1h with interrupts masked */
>+	mov     x0, #0x3c5            /* DAIF bits and EL1h mode (5) */
>+	msr     spsr_el3, x0
>+
>+	isb                           /* Synchronization barrier */
>+	eret                          /* Jump to EL1 */
>+
>+setup_el2:
>+	/* Ensure we trap if we get anything wrong */
>+	adr	x0, vector_table
>+	msr	vbar_el2, x0
>+
>+	/* Does the test want to be at EL2? */
>+	cmp	w11, #2
>+	beq	at_testel
>+
>+	/* Configure EL2 to allow transition to EL1 */
>+	mrs     x0, hcr_el2
>+	orr     x0, x0, #(1 << 31)    /* RW = 1: EL1 execution state is AArch64 */
>+	msr     hcr_el2, x0
>+
>+	/* Initialize SCTLR_EL1 with reset value */
>+	msr     sctlr_el1, xzr
>+
>+	/* Set EL1 entry point */
>+	adr     x0, at_testel
>+	msr     elr_el2, x0
>+
>+	/* Prepare SPSR for exception return to EL1 */
>+	mov     x0, #(0x5 << 0)       /* EL1h (SPx), with interrupts disabled */
>+	msr     spsr_el2, x0
>+
>+	/* Return to EL1 */
>+	eret
>+
>+	nop
>+
>+	/*
>+	 * At the target EL for the test, usually EL1. Note we still
>+	 * set everything up as if we were at EL1.
>+	 */
>+at_testel:
> 	/* Installs a table of exception vectors to catch and handle all
> 	   exceptions by terminating the process with a diagnostic.  */
> 	adr	x0, vector_table
>@@ -100,7 +220,7 @@ __start:
> 	 * maps RAM to the first Gb. The stage2 tables have two 2mb
> 	 * translation block entries covering a series of adjacent
> 	 * 4k pages.
>-	*/
>+ 	 */

Accidental space

> 
> 	/* Stage 1 entry: indexed by IA[38:30] */
> 	adr	x1, .				/* phys address */
>@@ -233,6 +353,11 @@ __sys_outc:
> 	ret
> 
> 	.data
>+
>+	.align 8
>+cmdline:
>+	.space 128, 0
>+
> 	.align	12
> 
> 	/* Translation table
>-- 
>2.39.5

Otherwise,

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
