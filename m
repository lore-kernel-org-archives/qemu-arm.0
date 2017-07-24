Received: by 10.25.44.15 with SMTP id s15csp4355699lfs;
        Mon, 24 Jul 2017 15:02:57 -0700 (PDT)
X-Received: by 10.55.8.140 with SMTP id 134mr20938805qki.198.1500933777139;
        Mon, 24 Jul 2017 15:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500933777; cv=none;
        d=google.com; s=arc-20160816;
        b=b0EiiGFTjb16Z34Se49mk3FzQ+IiD5sxe3vUnZ4+g1rRGuvhtW3pk1fIYo3ikAxDDn
         s+5Vi4xB4yKafsq0j7QrTR/fqz47gm5S1TLpL+/doxboPg7XgiFQKAXpyKGyuhayhZZK
         AE0u/SV9Uk78TKeIp42j1eWSp1m34QkElbgvOF5MdAbszu60sTcJZEvdGGrAohgd1O5q
         YmhaqOfILZScbyXPvP5WTaoXkmL+MnXriHGratgvCC+L4BPIpzdwRnxd8pGZNRqLWsQE
         j84hjKoN4Gq6mpxkCwgUSftb5VSPKTTyxVfY4ujsNPBMPxgKPJFYfeck0x0WZEx9Q1vi
         BFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=YcXWmPARyoQJDtXu2sSEZMaQ3yC9pjWdbtyi/GS/2Vw=;
        b=MBZHLZd2R+M0+/cRSvWxXczQJsnxftvijoBIGFa15fmd41/2KkAr3p9zJ1uU14BiHu
         rr5zLvqAjK3gig0R9uS/dsRAEUNF7iy/HylQ6VWYc8AXKhpbRN3RYNNWJy/UuB7QFEIP
         bYX2DuparS7Ii/3v51NdzhRgR3+O6v0Mmb5h/tcecq+rMj/ZrPhpNgMIfr/FVDj2nFyG
         p8g1cB56zu5fwBh/g8k4cNTAOvMTg6/iw2X2zoA4rZd31+AKHriUR9W5mSaANgZ+4Ftz
         a72Y+ouWcF0jzI3FFJdNraSvlzyijnTSXDhBBlisFNobicPF3ys/WKbJuZwSPseTiCzn
         eAPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=YapHL9Sg;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id t65si2809145qka.445.2017.07.24.15.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jul 2017 15:02:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=YapHL9Sg;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id t2so11170480qkc.5
        for <alex.bennee@linaro.org>; Mon, 24 Jul 2017 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YcXWmPARyoQJDtXu2sSEZMaQ3yC9pjWdbtyi/GS/2Vw=;
        b=YapHL9Sg6dGFFFdIEMPIdeYpHrixZ9D+ZXs6qnxlHmxIWUtmtPMiuIT29OFrzuFVno
         BdkeviBOWAxTJFR+Va6MCneHCzrXWOC5lBi32cpnSDzfrNMyipT0HjrqfdSSXcDphS4L
         VJEhIS+oAva3mG7D0l6kblkRxnZBhI9hY+HXfTIx+886rH4VbQVFlAKXihZkxmtt1MkW
         OhFOw7VfE8TuEfBvgCkNXdsRqW3/XyZWLlij0IfC15dLtKg0agu7w6STJMaPTW9J1q18
         Mhcm5hr7OrFUVOsbjuM9jExzlZDh8uT3QoLayjy+xp6tafvIa+PM+Te0tKo0LyzXcyHy
         gSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YcXWmPARyoQJDtXu2sSEZMaQ3yC9pjWdbtyi/GS/2Vw=;
        b=tCH1ycMEhHIp6GJMcbO6w4EG6nPUQ0wj4VuVEeyl0sN6LhlA/PPh9WC3smYS7MfpXq
         A81vHlwbUfHddjto61Bwi7C7uo7zY6f2FXqrRYSgOGC5MzDPe0gelDiGYDEDhlCnH9lo
         xGflp8LsTlO1rz5KL7QZF73RfHKilENYMMt7xNDswkX4GuqVefryWcq9W87NoCKMbTDb
         t13hrMn4noaj7d2i6/p+EOEMfruxCUTiXrINHvuVky9oQcblIwa+KeUQmq2k9FR6c2ZK
         3l0zS8a/mBr/PuJV4GaWTQrnrXnfb9BdEOLNplJd8n+k/TnYpKqf/vml55VFXHwKCRaq
         /E8A==
X-Gm-Message-State: AIVw112VyM3yAWQhg/KOjw2gBQDGTJoB8TcCMRs02+ibBUM9YhCLFA2B
	hmr0VoEUoznXyg==
X-Received: by 10.55.130.66 with SMTP id e63mr22547047qkd.253.1500933776613;
        Mon, 24 Jul 2017 15:02:56 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([71.217.194.233])
        by smtp.googlemail.com with ESMTPSA id r65sm5769619qkb.20.2017.07.24.15.02.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jul 2017 15:02:55 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] Torn read/write possible on aarch64/x86-64 MTTCG?
To: "Emilio G. Cota" <cota@braap.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Andrey Shedel <ashedel@microsoft.com>, =?UTF-8?Q?Alex_Benn=ef=bf=bde?=
 <alex.bennee@linaro.org>, Pranith Kumar <bobby.prani@gmail.com>
References: <DM2PR21MB0060EFC1F6B9F0883A1792369EBB0@DM2PR21MB0060.namprd21.prod.outlook.com>
 <20170724212327.GA24963@flamenco>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <fda73f35-098f-c190-4d15-4363e28872f1@twiddle.net>
Date: Mon, 24 Jul 2017 15:02:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724212327.GA24963@flamenco>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: SReWWYRqn/p3

On 07/24/2017 02:23 PM, Emilio G. Cota wrote:
> (Adding some Cc's)
> 
> On Mon, Jul 24, 2017 at 19:05:33 +0000, Andrew Baumann via Qemu-devel wrote:
>> Hi all,
>>
>> I'm trying to track down what appears to be a translation bug in either
>> the aarch64 target or x86_64 TCG (in multithreaded mode). The symptoms

I assume this is really x86_64 and not i686 as host.

>> are entirely consistent with a torn read/write -- that is, a 64-bit
>> load or store that was translated to two 32-bit loads and stores --
>> but that's obviously not what happens in the common path through the
>> translation for this code, so I'm wondering: are there any cases in
>> which qemu will split a 64-bit memory access into two 32-bit accesses?
> 
> That would be a bug in MTTCG.
> 
>> The code: Guest CPU A writes a 64-bit value to an aligned memory
>> location that was previously 0, using a regular store; e.g.:
>> 	f9000034 str	     x20,[x1]
>>
>> Guest CPU B (who is busy-waiting) reads a value from the same location:
>> 	f9400280 ldr	     x0,[x20]
>>
>> The symptom: CPU B loads a value that is neither NULL nor the value
>> written. Instead, x0 gets only the low 32-bits of the value written
>> (high bits are all zero). By the time this value is dereferenced (a
>> few instructions later) and the exception handlers run, the memory
>> location from which it was loaded has the correct 64-bit value with
>> a non-zero upper half.
>>
>> Obviously on a real ARM memory barriers are critical, and indeed
>> the code has such barriers in it, but I'm assuming that any possible
>> mistranslation of the barriers is irrelevant because for a 64-bit load
>> and a 64-bit store you should get all or nothing. Other clues that may
>> be relevant: the code is _near_ a LDREX/STREX pair (the busy-waiting
>> is used to resolve a race when updating another variable), and the
>> busy-wait loop has a yield instruction in it (although those appear
>> to be no-ops with MTTCG).
> 
> This might have to do with how ldrex/strex is emulated; are you relying
> on the exclusive pair detecting ABA? If so, your code won't work in
> QEMU since it uses cmpxchg to emulate ldrex/strex.

ABA problem is nothing to do with tearing.  And cmpxchg will definitely not 
create tearing problems.

I don't know how we would manage 64-bit tearing on a 64-bit host, at least for 
the aarch64 guest, for which I believe we have a good emulation.

> - Pin the QEMU-MTTCG process to a single CPU. Can you repro then?

A good suggestion.

> - Force the emulation of cmpxchg via EXCP_ATOMIC with:
> 
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 87f673e..771effe5 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2856,7 +2856,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
>           }
>           tcg_temp_free_i64(t1);
>       } else if ((memop & MO_SIZE) == MO_64) {
> -#ifdef CONFIG_ATOMIC64
> +#if 0

I suspect this will simply alter the timing.  However, give it a go by all means.

If there's a test case that you can share, that would be awesome.

Especially if you can prod it to happen with a standalone minimal binary.  With 
luck you can reproduce via aarch64-linux-user too, and simply signal an error 
via branch to __builtin_trap.


r~
