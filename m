Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm19568750f8f.89.2025.05.14.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:51:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CE1945F8AE;
	Wed, 14 May 2025 14:51:11 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  David Hildenbrand <david@redhat.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Laurent Vivier <lvivier@redhat.com>,
  qemu-arm@nongnu.org,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Markus
 Armbruster <armbru@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
  Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Peter Xu <peterx@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  John Snow
 <jsnow@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Fabiano
 Rosas <farosas@suse.de>,  Peter Maydell <peter.maydell@linaro.org>,
  Alexandre Iooss <erdnaxe@crans.org>,  Julian Armistead
 <julian.armistead@linaro.org>,  Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [PATCH v2 03/14] tests/tcg: make aarch64 boot.S handle
 different starting modes
In-Reply-To: <d2429cfd-d1b1-435c-b202-7f90f7365bf2@daynix.com> (Akihiko
	Odaki's message of "Sat, 10 May 2025 13:21:47 +0900")
References: <20250506125715.232872-1-alex.bennee@linaro.org>
	<20250506125715.232872-4-alex.bennee@linaro.org>
	<d2429cfd-d1b1-435c-b202-7f90f7365bf2@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 14 May 2025 14:51:11 +0100
Message-ID: <87r00rxpv4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /hlnHmofe7Qe

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/06 21:57, Alex Benn=C3=A9e wrote:
>> Currently the boot.S code assumes everything starts at EL1. This will
>> break things like the memory test which will barf on unaligned memory
>> access when run at a higher level.
>> Adapt the boot code to do some basic verification of the starting
>> mode
>> and the minimal configuration to move to the lower exception levels.
>> With this we can run the memory test with:
>>    -M virt,secure=3Don
>>    -M virt,secure=3Don,virtualization=3Don
>>    -M virt,virtualisation=3Don
>> If a test needs to be at a particular EL it can use the semihosting
>> command line to indicate the level we should execute in.
>> Cc: Julian Armistead <julian.armistead@linaro.org>
>> Cc: Jim MacArthur <jim.macarthur@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>
>> +
>> +	/* sanity check, clamp to 1 if invalid */
>> +	cmp w11, #'0'
>> +	b.lt 1f
>> +	cmp w11, #'4'
>> +	b.ge 1f
>> +	sub	w11, w11, #'0'
>> +	b 2f
>> +1:	mov w11, #1
>> +
>> +2:
>
> This "sanity check" made me wonder what it is for. This code is simply
> unnecessary if any unknown values are to be ignored and is a bit
> misleading to have this code as it looks like it adds an additional
> behavior. "sub w11, w11, #'0'" is also unnecessary; we can compare w11
> with '2' and '3' later instead.
>
> The patch message says this sanity check was added with v2 so I looked
> for a previous review and found this:
> https://lore.kernel.org/qemu-devel/svmkvs.2mf5q4qhsfz83@linaro.org/
>
>> cmp w11, #'0'
>> b.lt curr_sp0_sync
>> cmp w11, #'4'
>> b.ge curr_sp0_sync
>
> Now I get the original intent; it was to raise an error instead of
> simply ignoring unknown values. However I also see a few problems with
> this original code:
> - It still ignores unknown strings that are longer than one character.

I'm not intending to handle longer strings in assembly - I think we can
live with accepting "1junk" to "3foo".

> - curr_sp0_sync leads to the code that writes a message saying
>   "Terminated by exception.", which is incorrect.
> - "cmp w11, #'0'" is unnecessary if you check the value after "sub
>   w11, w11, #'0'".

I'll clean that up.

>
>> +	/* Determine current Exception Level */
>> +	mrs	x0, CurrentEL
>> +	lsr	x0, x0, #2	  /* CurrentEL[3:2] contains the current EL */
>> +
>> +	/* Branch based on current EL */
>> +	cmp	x0, #3
>> +	b.eq	setup_el3
>> +	cmp	x0, #2
>> +	b.eq	setup_el2
>> +	cmp	x0, #1
>> +	b.eq	at_testel	     /* Already at EL1, skip transition */
>> +	/* Should not be at EL0 - error out */
>> +	b	curr_sp0_sync
>> +
>> +setup_el3:
>> +	/* Ensure we trap if we get anything wrong */
>> +	adr	x0, vector_table
>> +	msr	vbar_el3, x0
>> +
>> +	/* Does the test want to be at EL3? */
>> +	cmp	w11, #3
>> +	beq	at_testel
>> +
>> +	/* Configure EL3 to for lower states (EL2 or EL1) */
>> +	mrs	x0, scr_el3
>> +	orr	x0, x0, #(1 << 10)    /* RW =3D 1: EL2/EL1 execution state is AArc=
h64 */
>> +	orr	x0, x0, #(1 << 0)     /* NS =3D 1: Non-secure state */
>> +	msr	scr_el3, x0
>> +
>> +	/*
>> +	 * We need to check if EL2 is actually enabled via ID_AA64PFR0_EL1,
>> +	 * otherwise we should just jump straight to EL1.
>> +	 */
>> +	mrs	x0, id_aa64pfr0_el1
>> +	ubfx	x0, x0, #8, #4	      /* Extract EL2 field (bits 11:8) */
>> +	cbz	x0, el2_not_present   /* If field is 0 no EL2 */
>> +
>> +
>> +	/* Prepare SPSR for exception return to EL2 */
>> +	mov	x0, #0x3c9	      /* DAIF bits and EL2h mode (9) */
>> +	msr	spsr_el3, x0
>> +
>> +	/* Set EL2 entry point */
>> +	adr	x0, setup_el2
>> +	msr	elr_el3, x0
>> +
>> +	/* Return to EL2 */
>> +	eret
>> +	nop
>
> Why is a nop placed here?

Left over debug. I'll drop it.
>
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
