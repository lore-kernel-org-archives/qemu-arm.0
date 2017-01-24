Received: by 10.25.77.65 with SMTP id a62csp1929194lfb;
        Tue, 24 Jan 2017 11:45:24 -0800 (PST)
X-Received: by 10.31.134.200 with SMTP id i191mr17424057vkd.57.1485287124476;
        Tue, 24 Jan 2017 11:45:24 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com. [2607:f8b0:400c:c08::234])
        by mx.google.com with ESMTPS id q20si5502483uaa.251.2017.01.24.11.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:45:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::234 as permitted sender) client-ip=2607:f8b0:400c:c08::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x234.google.com with SMTP id 35so142277255uak.1
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2017 11:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=2LITcUvMkRXW/wCIL6c0rlwLVET8sjVH+D7ffKl/v+g=;
        b=Y3eq0eR7J0IM91mbb50QgPNclCm7osmLIN9DZcliYKfqobu1CfmmFejd9bP9XlHiiP
         FGpwTm5tj6hA7xhaanpGqAs6X9AcoaFTO8UQQG7KxdRUYl6hSOaibTUBnZeq9+jLJws8
         CX3dkM3q+qcc2ZFKiVrYWVLnBqWPDJyWotTv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=2LITcUvMkRXW/wCIL6c0rlwLVET8sjVH+D7ffKl/v+g=;
        b=OxY6wL94HDJnBEQBIgRXAKvr+mDDII0zT/2OMon6KmpFdp9GbPJ97kvvhgNUoiLpII
         1U4zJzPP4hYOHLSdwDXAe4GnIZk6TeQpcF8cO/qeEY380P+my35DslxRtQ0/aX5EiVRC
         mfF5u6xV0odCdkuBlmXogVqhf1aOX7kZBdv1A6kgTwJ2dvMWsxr80//SMPzxyMtWSCgK
         3H95dLP8WxgYalS5GeNQm5+Hw6E2SCsQNpRp9UR4fqvfyo1oCSNbxKXTCCxyIfShFlCH
         eplRNEl3itHqPaNfToRf7V9+bP2PYZunBVWV99FVOsuZNN5AoP/A7qpH2t3HJuHqqApH
         d0eg==
X-Gm-Message-State: AIkVDXLBUeUjUmZ+hyN2hw3cXW8l/PUO+7P6aUxKvKuRBw2WrnkDy0fADzJNOw6gcsbwqP0mEuk0GU2KctHF9iYQKyU=
X-Received: by 10.159.39.233 with SMTP id b96mr19505445uab.86.1485287124042;
 Tue, 24 Jan 2017 11:45:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 11:45:03 -0800 (PST)
In-Reply-To: <649a4b6e-2c7f-cf2c-5fb2-9213aaffd34a@twiddle.net>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
 <1485285380-10565-6-git-send-email-peter.maydell@linaro.org> <649a4b6e-2c7f-cf2c-5fb2-9213aaffd34a@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 19:45:03 +0000
Message-ID: <CAFEAcA8hZKk429b_sdtQb5bT7ymjBAqbcokpOL-oc2Vi8zUbyQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/10] armv7m: honour CCR.STACKALIGN on
 exception entry
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Liviu Ionescu <ilg@livius.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: 0PIsbMkY4FUS

On 24 January 2017 at 19:33, Richard Henderson <rth@twiddle.net> wrote:
> On 01/24/2017 11:16 AM, Peter Maydell wrote:
>> The CCR.STACKALIGN bit controls whether the CPU is supposed to force
>> 8-alignment of the stack pointer on entry to the exception handler.
>
> 8...
>
>> +    /* Align stack pointer if the guest wants that */
>> +    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
>
> 4...
>
>>          env->regs[13] -= 4;
>
> Not alignment.  "&= -4"?

We know SP is always at least a multiple of 4. If it's already
a multiple of 8 then (sp & 4) will be false and we leave sp alone.
Otherwise it's a multiple of 4 but not 8, and subtracting 4
makes it 8 aligned (and we set the saved-XPSR bit to indicate
that we need to undo that on exception exit).

You could maybe rephrase the code to look a bit closer to the
v7M ARM ARM pseudocode, but the way it's written now isn't wrong,
so since this patch is only trying to say "do this if STKALIGN
is set rather than all the time" just adjusting the if conditional
seemed the best thing to me.

(The pseudocode checks for "do we need to align" with
"SP<2> AND forcealign", and does the alignment by
ANDing with a mask constructed with "NOT(ZeroExtend(forcealign:'00',32))".
So we do the check the same way it does, but use a subtract
rather than an AND-NOT. (Since we know that bit 2 must be set
then subtracting 4 and masking that bit to 0 are the same thing.)

thanks
-- PMM
