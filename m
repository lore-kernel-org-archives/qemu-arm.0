Received: by 10.25.27.66 with SMTP id b63csp736129lfb;
        Sat, 4 Jun 2016 07:51:06 -0700 (PDT)
X-Received: by 10.36.141.197 with SMTP id w188mr6042992itd.65.1465051866182;
        Sat, 04 Jun 2016 07:51:06 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com. [2607:f8b0:4001:c06::242])
        by mx.google.com with ESMTPS id c77si3010246iod.42.2016.06.04.07.51.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jun 2016 07:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4001:c06::242 as permitted sender) client-ip=2607:f8b0:4001:c06::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4001:c06::242 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-io0-x242.google.com with SMTP id f128so3236376iof.3;
        Sat, 04 Jun 2016 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Y/MEJdGSm1yxUwOeSZ7oxPr8hTVjvNxlOsN06Inl5X0=;
        b=aSUkBmLweyxFGfx39WIowXzQgilSawDJIj2Cjegt1iitinJDuJillxvfI0hIwLGKU7
         OIOOKZdsiaKlB+lj4aIvVB06Y5R6R3f8Aoe/cWd57WU54NNOUv4oPxPly/0humwOKlLA
         8efMXQfUSOkOSFPPnRBgdQADOymkxTL30JtsIW66GEA2PD7nlB2w7QvoVAnNZ9NTgnsb
         UC/JV+8Czl2rDPHcwNbt6kv51XF8hKrjI+AUmaw2hXvvdedknScLG/U/4JLBA0UUHZY4
         TgaJFmz4SakO6tihmnQgwDIL1cQRZl6LHOtbfqOACyS8ofLOm8z/oJg3w9JlM1zQp8bW
         Woxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Y/MEJdGSm1yxUwOeSZ7oxPr8hTVjvNxlOsN06Inl5X0=;
        b=QH95KzffafnoV3OxKt46Ag1Kxuzd6R408jbpepjvHrzX5YLQQ1qRSUMz64b8Z4Nv1T
         DxRAm/r0JnSaNlzjI7eAAv4ZLtduTluFE/JcbEtMU9qePF+xxggv9J4CFYrmAktjdB1Z
         33ypbNt3j3ngwPf1cyTmUl2H4zQ0TrnadnTDz/xxMfIR2gCbIQD2LPBSgZFDBPhPCd6e
         yObTBGqeRcRKX4hEc6O6NtGnoaapMBcsCEBaNsBTRpsraGANaI+scfbnqv5qBDbEV1cs
         5pY2Ulij81QXU9DPTMav03p6pBaiwdtNUD8JI/lekPmqC8DKC7ij55mL7cn6UU1VooMl
         3lqw==
X-Gm-Message-State: ALyK8tLkP2wJDcdYSnoDXgUC4nIjX0WL8rDooMx3JZHNEq6hj/aIn1FWjhhe1eS6KzZMHVXCGTY9yN9wqrcBBw==
X-Received: by 10.107.191.7 with SMTP id p7mr13208595iof.115.1465051865798;
 Sat, 04 Jun 2016 07:51:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.62.4 with HTTP; Sat, 4 Jun 2016 07:50:36 -0700 (PDT)
In-Reply-To: <57508AEE.70706@gmail.com>
References: <20160531183928.29406-1-bobby.prani@gmail.com> <20160531183928.29406-12-bobby.prani@gmail.com>
 <57508AEE.70706@gmail.com>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Sat, 4 Jun 2016 10:50:36 -0400
Message-ID: <CAJhHMCA7zhPLvmyRoFTW0=E=n5JeO3rrnvuR12aDnAuGYQWJ3Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC v2 PATCH 11/13] target-arm: Generate fences in
 ARMv7 frontend
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-TUID: OpW7BzU92F4d

On Thu, Jun 2, 2016 at 3:37 PM, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 31/05/16 21:39, Pranith Kumar wrote:
>> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
>> Signed-off-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  target-arm/translate.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/target-arm/translate.c b/target-arm/translate.c
>> index c946c0e..e1b16c0 100644
>> --- a/target-arm/translate.c
>> +++ b/target-arm/translate.c
>> @@ -7980,9 +7980,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>>                  gen_clrex(s);
>>                  return;
>>              case 4: /* dsb */
>> +                ARCH(7);
>
> ARMv7 ARM says: "A DSB behaves as a DMB with the same arguments, and
> also has the additional properties...".
>

OK. I was just focusing on dmb for now. I will add translation for all
other barriers too in the next version.

Thanks!
-- 
Pranith
