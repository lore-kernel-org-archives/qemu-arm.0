Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp179004ejx;
        Tue, 15 Nov 2022 22:11:51 -0800 (PST)
X-Received: by 2002:a17:902:d642:b0:188:d552:fb02 with SMTP id y2-20020a170902d64200b00188d552fb02mr6064500plh.76.1668579111235;
        Tue, 15 Nov 2022 22:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668579111; cv=none;
        d=google.com; s=arc-20160816;
        b=McWxxIaFv9APBdIotI1wTiCOMKxStugF274JHsK2iaW149ClrQ0Fi5PGXRWMSs/7CB
         FrYrLdbkmWYfg/Tch5Dos9eAm2EgDJ5sW+iHnhfLhoDD1tfhnN/x4okBtlJvgLKfNQdx
         od0rgUFLu2djS7H77kEnWACkQTLQllylKk9/8Au8h8uWVETbnaFgvLdkOfbgVHdDU6EM
         oioD12HI2wlQPgdGoBmbF+dagaGv/jvUv+CXcNU1mJStk+pRl08lmMJmKq7f4LstjwXt
         PaCUfc5WCTjurCt8VW/ejb53HgoK2gl0RRTOgx09i7bdjrJaKbut0Flmq/YcxF1ar+KG
         mkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:dkim-signature;
        bh=JcHF3ORUXXQR3tJAYqImwRBo08c29Cshwc+UtkgxMLE=;
        b=GwjuVwzFZWyVOuGCvvQ2JyPRV6/pU53SUdJ2r6Tttqc6L1CXRykF7sPhdjZuEQfkRj
         a1CcLqSd7yVdvH4zX0ijtBeOb9Inj/hEb7roduKo2fx2HrxGvOIH6gTox6dLzqHxwbqP
         Vd7QwNkm3pcO+dZQzOKhS4CTKIoK5uJBwH4HCxLnBlG3LKtZdaouC+FFDtuMFCOmfcvw
         LwEvXvOKehjrel7hz+VUgB1Ym4zHcWsxn9UylnU1YxqKrFB6QyiH9bEJGHRfEcg9OnDf
         Dh3Yu2tgyc2Td7fvl4n+uTaunQ4M3lUs3DNhVwV/zNcs8udj46IQ7ZkBParfA6yO1UuU
         jNGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=oRaSgzM0;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <schspa@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cu2-20020a056a00448200b00572723d7aa1sor2265397pfb.90.2022.11.15.22.11.50
        (Google Transport Security);
        Tue, 15 Nov 2022 22:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=oRaSgzM0;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=JcHF3ORUXXQR3tJAYqImwRBo08c29Cshwc+UtkgxMLE=;
        b=oRaSgzM09s0+yI/0c1yffJbAKyLBlDcOgvi990XrQrRffwWaS9/yAwnzxFT+kMP9tF
         7AG/U3KQf75rRidTRMx8MAfnUXyaMFCSxzHAfaCgFLoaur7kAMeYsesL8O+UQYn9moc0
         SFIb3r8/k0ePjLKJqFjWHUDGuGOY4Az052rZYq7/wy9CRApfd4ItzdMZucFaWGWqs95y
         AF7/TBbksmztdNBaWKgVU76RUtbh/60Bj3qVpplcP1qsX/Y2nvYU0JTDnjIcXLh0WxI1
         lrhzdZ/TeMq3/FP6ZrB+U4mA11t6/REaQTuZhdlm1hCX361UlrBjzfCTwGnyh4tw55Y9
         eqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcHF3ORUXXQR3tJAYqImwRBo08c29Cshwc+UtkgxMLE=;
        b=bsEzvJXM1hmp7dkBBPSsMmNYQCs19eneWlRzBOggMtN1YNqt+X/dgRFLb/X6lRClcb
         Wpp1/bDxIkAjEg6DJcUau4Nsa6AF0XaWVa8hhk+hYawnWzimmHnWsjPSL9G74FDBGMEn
         UPhkyKJi1rM/PLIdokkra/uTw4lwtsL6GvPj896A+f2xPv5mIu0lC8DoGRe9lM6wNNwQ
         kxJ25n+3GsXtj54QdTLknwMN/WRaiLWZyFIseTkSfsrBzI4bFFyDKUO9I2ti7iS8RKo7
         2aKVnJ8vd1YJudLuqu1Y89ipKQYj5LbFfcJc00N0XeBNRttECmhYwOe/z0vBUv6UM47x
         qVJQ==
X-Gm-Message-State: ANoB5pmOkQukI5H3Wsefw3HjgxLwrMEuVABNpt52vxSsAZfC0yO01dSY
	eBlr/EZV0TLHIjvYagSBpPAPVs+OrTMHzQ==
X-Google-Smtp-Source: AA0mqf6up6WIrQhCSVQgWR1+8nVA7kd+BwF9VOtVHKYQ/EbPd5qE2TgDi7x/lZ+NkAKZ94yKF5uFVw==
X-Received: by 2002:a63:d94b:0:b0:43c:6412:994f with SMTP id e11-20020a63d94b000000b0043c6412994fmr18829540pgj.421.1668579110167;
        Tue, 15 Nov 2022 22:11:50 -0800 (PST)
Return-Path: <schspa@gmail.com>
Received: from MBP ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902680d00b00179e1f08634sm11115827plk.222.2022.11.15.22.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 22:11:49 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
 <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Wed, 16 Nov 2022 14:07:46 +0800
In-reply-to: <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
Message-ID: <m2edu3ig2s.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: uJbPrbEWVtT8


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >>
>> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
>> >> > I think this lowmem does not mean below 4GB. and it is to make sure
>> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
>> >>
>> >> The wording of this comment pre-dates 64-bit CPU support: it
>> >> is talking about the requirement in the 32-bit booting doc
>> >> https://www.kernel.org/doc/Documentation/arm/Booting
>> >> that says
>> >> "If an initramfs is in use then, as with the dtb, it must be placed in
>> >> a region of memory where the kernel decompressor will not overwrite it
>> >> while also with the region which will be covered by the kernel's
>> >> low-memory mapping."
>> >>
>> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
>> >> if you don't put the kernel, initrd, etc below 4GB.
>> >
>> > A kernel person corrects me on the meaning of "lowmem" here -- the
>> > kernel means by it "within the first 768MB of RAM". There is also
>> > an implicit requirement that everything be within the bottom 32-bits
>> > of the physical address space.
>> >
>>
>> Thanks for your comment.
>>
>> In this view, initrd shouldn't be placed higher than 4GB ? But it
>> seems the Linux kernel can boot when there is no memory below 4GB.
>
> A *32 bit* kernel cannot -- it is completely unable to access
> anything above the 4GB mark when the MMU is off, as it is on
> initial boot. This QEMU code handles both 32 bit and 64 bit
> kernel boot. These days of course there is 64-bit only hardware,
> and that might choose to put its RAM above the 4GB mark,
> because it isn't ever going to boot a 32-bit kernel anyway.
>

Yes, I think we should accept this patch, because it will not affect
32-bit devices, and provides support for 64-bit devices to put initrd
above 4GB.

> thanks
> -- PMM


-- 
BRs
Schspa Shi
