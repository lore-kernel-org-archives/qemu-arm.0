Received: by 10.223.188.70 with SMTP id a6csp5037899wrh;
        Mon, 28 Aug 2017 14:42:00 -0700 (PDT)
X-Received: by 10.107.19.69 with SMTP id b66mr2226399ioj.25.1503956520595;
        Mon, 28 Aug 2017 14:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503956520; cv=none;
        d=google.com; s=arc-20160816;
        b=XSN1yGIpA4De1BD/UWG0iEiFGsdhdErLLVGdCsz5vecrSbjvhqhF6AqrJ5yqy5PfmK
         U/qXUjb41zbAG2PuuLG70er1lAuqanBhJE3yqjqLK+NgivreOQoOcBgq7bw1ooFHhdV6
         tCqGCI2HReFJZv4bW64XBLtYicXhCxNyTiefDSaFuQ7agY7I3CSpPob+/5aRwpkL1DNV
         zgNnQJOoauBZiN0Pc34cea4aijm7GJW9q3/6gw2oTbQr59IqEWbrVrd9t333K0RzKCgW
         FbXi8Iz0GrzIFD5E2SqsdBACGEpIFVpjCJ3H3fhf226zK14RWnH4Cod3V30owtZ5xpqV
         sYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=KpqDEs4yddDa+0pSUfedxZ0ZC3zqn+E22PLNFI1qOcs=;
        b=OTyb3CkXuzPfC89SIQ8+TgTZeMvdv7QXjWdRvqwiWx3pCE+CeHtQlv7jTaDjLctsuq
         2Yd09nJ0xmr2DZe7AQrNBsUZSPYfZ55eN5kfCbYa7ldGXtW4BWyB/4PJtGtuB2m9FcTM
         3C/8TshznmEtlziQsB5VbvKF6+g4TM0wj3EOeswl/WuMZxK3h4gze8At1/6430uZWuVg
         98YjlQKg54Cofz89FmQlSjtAXHvB3FsJiOwHW2HUNpA8/Ro79Wpi68xg5/F/DH+b03Fc
         mzw2YsnkMUs0s28DqD/SMAyk4InUTA6urEcTClCqRjKs1JtvSHz/jdFfeNk2FTCR+l82
         T2gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkA07d68;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 89sor696217ioi.0.2017.08.28.14.42.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Aug 2017 14:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkA07d68;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=KpqDEs4yddDa+0pSUfedxZ0ZC3zqn+E22PLNFI1qOcs=;
        b=OkA07d68CyfvvibofnL0zR0ZbarLoK6NPRfLwOQMqEc+5wLPCt5GO5vYK/p/JlNXgJ
         m6xR1vu0tSP1y9joSxLWZSxqvB+a4WRfZXderifkYeNX2C7nLUWpq4OLZYCyUoVTIRA4
         GuwojR6DqwW5pHznX8I4Il9clZj7vbpJMCH0qBkm3vhPa3XP39Y1OJs0lcdcDRFcw3XT
         OgV5J59TOsiV3vlYhs18NBQtVus/attVWJF2WOvwOBS54RUuGgaUI6PpzDgfhu248Aiy
         EQLX6M9xknM7ULGiq5+MYmUVpS2w+4dZ7EUg32rTzO8Ij6KP3las01sHDpQgu9o5L2y+
         WwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=KpqDEs4yddDa+0pSUfedxZ0ZC3zqn+E22PLNFI1qOcs=;
        b=UHM4y23iGbA+g38Xs36tGlZ3Ao3yDHkCxhwKs3MQ5bcvdtAztQ9c8ePETzSjkNhHZB
         p5bebGgKSPxWstPyVvP6TfMuR+hM+p7M0t4yMNY20/bhvQIz8doZor2IXNxV8QDXPNXr
         /CSfKhieAW1ZgEG2CJ3wAz3H1wvGnWpvL/HFMXHJl3qRAjJD9sMOTz9vW8qVI8guA6vV
         lwi2Hp8cdFHKEb38WfcjOxXyXWI0HtvdtqDh0+2b4onOIwGc49XGO+c3ZMre5e8Fx4ao
         RikYoru9aa32QGlSyVpSOKhtrvhs3tYG6clp4bcpqTuJtRXHqw5N8s+0UqFcqHP20s2O
         WTCw==
X-Gm-Message-State: AHYfb5juLBXxEEqUsqDMCk8MUfqIPH4+5hZSbNvUxN+4r9HC0ziILy6n
	/0DWXjadtUJi5Azbs93ekDs/aj627EmI
X-Received: by 10.107.205.194 with SMTP id d185mr2015929iog.8.1503956520172;
 Mon, 28 Aug 2017 14:42:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.166.2 with HTTP; Mon, 28 Aug 2017 14:41:29 -0700 (PDT)
In-Reply-To: <03c05a60-d697-500b-c2fc-d99b24f3f64c@twiddle.net>
References: <20170828035327.17146-1-bobby.prani@gmail.com> <20170828035327.17146-3-bobby.prani@gmail.com>
 <03c05a60-d697-500b-c2fc-d99b24f3f64c@twiddle.net>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Mon, 28 Aug 2017 17:41:29 -0400
Message-ID: <CAJhHMCC4Y0Zos+g4M6Rms+vO8cdZ+AOupciRFWTfnbFgpRs9jw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] mttcg: Implement implicit ordering semantics
To: Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:AArch64 target" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: P0VPO3ve9sRe

On Mon, Aug 28, 2017 at 1:57 PM, Richard Henderson <rth@twiddle.net> wrote:
> On 08/27/2017 08:53 PM, Pranith Kumar wrote:
>> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
>> index 55a46ac825..b41a248bee 100644
>> --- a/tcg/aarch64/tcg-target.h
>> +++ b/tcg/aarch64/tcg-target.h
>> @@ -117,4 +117,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
>>      __builtin___clear_cache((char *)start, (char *)stop);
>>  }
>>
>> +#define TCG_TARGET_DEFAULT_MO (0)
>> +
>>  #endif /* AARCH64_TCG_TARGET_H */
>
> Please add all of these in one patch, separate from the tcg-op.c changes.
> We should also just make this mandatory and remove any related #ifdefs.

I tried looking up ordering semantics for architectures like ia64 and
s390. It is not really clear. I think every arch but for x86 can be
defined as weak, even though archs like sparc can also be configured
as TSO. Is this right?

>
>> +void tcg_gen_req_mo(TCGBar type)
>
> static, until we find that we need it somewhere else.
>

Will fix.

>> +#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
>> +    TCGBar order_mismatch = type & (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO);
>> +    if (order_mismatch) {
>> +        tcg_gen_mb(order_mismatch | TCG_BAR_SC);
>> +    }
>> +#else
>> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>> +#endif
>
> Hmm.  How about
>
> static void tcg_gen_reg_mo(TCGBar type)
> {
> #ifdef TCG_GUEST_DEFAULT_MO
>     type &= TCG_GUEST_DEFAULT_MO;
> #endif
> #ifdef TCG_TARGET_DEFAULT_MO
>     type &= ~TCG_TARGET_DEFAULT_MO;
> #endif
>     if (type) {
>         tcg_gen_mb(type | TCG_BAR_SC);
>     }
> }

Yes, this looks better and until we can get all the possible
definitions of TCG_GUEST_DEFAULT_MO and TCG_TARGET_DEFAULT_MO figured
out I would like to keep the #ifdefs.

>
> Just because one of those is undefined doesn't mean we can't infer tighter
> barriers from the others, including the initial value of TYPE.
>
>>  void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp memop)
>>  {
>> +    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_LD_ST);
>>      memop = tcg_canonicalize_memop(memop, 0, 0);
>
> You're putting the barrier before the load, so that should be
>
>   TCG_MO_LD_LD | TCG_MO_ST_LD
>
> i.e.  TCG_MO_<any>_<current op>
>
> If you were putting the barrier afterward (an equally reasonable option), you'd
> reverse that and use what you have above.

OK, will fix this. Thanks for the review.

-- 
Pranith
