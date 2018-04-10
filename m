Received: by 10.28.71.155 with SMTP id m27csp3474390wmi;
        Tue, 10 Apr 2018 01:16:29 -0700 (PDT)
X-Received: by 2002:a19:e1c5:: with SMTP id l66-v6mr1447555lfk.125.1523348189277;
        Tue, 10 Apr 2018 01:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523348189; cv=none;
        d=google.com; s=arc-20160816;
        b=eEJxuypwaB9eDS5GZFHIvjbEjhXi0IzabMhbJXxilynbLVtPj4JJxiZ6N1mGYB4NI9
         vWL12xq2wpDiWpgYeo2Jo6jfF7b83WI3tfa2bfFpDtcR63278tfCh9TGcK9BDOfhLc/A
         jeOluxhmKCeIGMDhhc5vHE/q+gZSLdy7nC0kNeZ0GchOnjCDvNFU6SMrTlYW3M9vjV7t
         Iw7C+uat51drVnTwESRkwCm6Ni+44+lhYe2FaEHIRj2OXwKP+QXFSS7sKkOT4l8cOJr+
         Wg7Eaqj0zBsKgILLiAbx3L44E+9Nj3523QYnFiIMrLDTsNppbrL0zadZ41gOXDfFr0/r
         mSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=yj/OmzzT1x5c7zvzUBofuSqsVajEwIhrPvcm2jxfcEU=;
        b=A5GMsUWYJRPrVjZfndbTEnagcdKSsjIjKchRdrEYEg9iTFlLnwBvMjk6WT0UOCZFwG
         1MIpe0GhXdxjQXP9hYO5MlyAAih6BIQx/iVXGeXpGYQ2Yn6cmIrYqInHFWunbFwiuCDF
         YHYI43L/YeivjoYxezD0/ahvg/vfRLrRBxyNp/wEH4ej4DBHPZ2BajrrvhsMZHSBU7Eb
         JYz8t8MRBQgtCCIOC03hA1ADA051OKhJWXPWkPUHJGaCk4/bBk3+JtyqLMC+3KWpCoOn
         UsENVuloKYrbrY8AyqaKmnY1aRcUXhkDMhFbaQqWozboLiyZeFuFpZ+OIyBRK8OnpCTH
         g/Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DW6VE6AH;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <ajaygargnsit@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h15sor576524ljj.43.2018.04.10.01.16.29
        (Google Transport Security);
        Tue, 10 Apr 2018 01:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DW6VE6AH;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=yj/OmzzT1x5c7zvzUBofuSqsVajEwIhrPvcm2jxfcEU=;
        b=DW6VE6AHDUSUTtGn9E60WNAAoqjwSmTApLY3btXvMzDfyo4XsDcglwSkT8QsWRg7+g
         tVp5czKq/o3u9oQK8ygAnY33xX3REl/D4yOM/dfdeuIuavviWCtR6cMPw3fuZxI0mtu6
         wHlRW9aGBhbG9aPZz7MAkFlJsl863F5A5CnlaGFcvUImCYOzC+V52vggFnjNJFtcmCae
         Jwbp5M8WBUZcxKn+bBbzEAgJxmHoJ15j3Rhr5XhO9e3fLVE+IQJzkT1gGGkABzR1DP7m
         1P6QGCatxwKn8P6GLi28f4nSZNGzK4tZNZUfO1sBcu1zjhRbvyUzOXokvIjEO8ZH3tMc
         Uo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=yj/OmzzT1x5c7zvzUBofuSqsVajEwIhrPvcm2jxfcEU=;
        b=jW1aIMIpzL07nyUdY6gAd4TROUTv7HsuZOAClW7MIBGzZCwk3NLblXX9G9FQpGeUUk
         q1cefGf9GmcO/1pCHsfUnZZ+mdw6PWT8rFEkEohPxRiPJLrP5L9pgst2ToC3IneEsHNo
         IRNEcKANL0TPM71Q7gksVlkbFy/ktHNwn0rBQ1rXhmlBm/2dZC6wqLYlPww8wH272r7J
         Ax80LlMuevdh9St2M7nrbM2SsIwX+UfzJ73bNGXqfZvJFk/DCqHm6j8t8zHGoI0VUtGn
         eoOhXNhGegQvvDjQ5kgzqA0aiO603rLtpSUev/BVvCl0aoeArClkf0k8Loke4ad0U5U4
         8VdQ==
X-Gm-Message-State: ALQs6tCQHR47bOcP8R3O/RKs8zT5RZhDqDofFoVrzGA8XNZ/4Ji7adWH
	/HLWalkoxKhXu4Y1vyEQ3Cu8gr8+TPpYyHJaBclL2Q==
X-Google-Smtp-Source: AIpwx49DQ1foiIiJ19l/lqTuqwysLzPeieUNNbPlCtzQ1+eao73+lPDtpFiWwX2FS5nvLY+cit9qyierkVs+dvXrMBk=
X-Received: by 10.46.85.196 with SMTP id g65mr24192315lje.10.1523348188661;
 Tue, 10 Apr 2018 01:16:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 01:16:28
 -0700 (PDT)
In-Reply-To: <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org> <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
 <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Tue, 10 Apr 2018 13:46:28 +0530
Message-ID: <CAHP4M8ViS=O4R+sMmR=CmkbgQtwd8RHGxLwNb5m_aMS_M++f6A@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] Crash when running hello-world unikernel
 for ARM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	rumpkernel-users@freelists.org, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: StItrhkpXYHP

Hi Peter.

Thanks for the reply.

On Tue, Apr 10, 2018 at 1:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 10 April 2018 at 05:14, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>> Thanks Alex for the reply ..
>>
>>>
>>> Can you run under -s -S and gdb step the *guest* and see where it ends
>>> up. The above error is usually indicative of the guest going off into
>>> the weeds somewhere because the hardware isn't what it expects.
>>>
>>
>> So, after your reply that it might be because of the
>> hardware-mismatch, I kinda took a detour, and installed a arm32 "virt"
>> machine on qemu on a x86_64 host, as per the steps at
>> https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/
>>
>> All went fine, and then I compiled rumprun on this "virt" guest.
>
> The host system hardware doesn't matter (except that if you're
> running suitable matching host and guest hardware you might be
> able to use hardware acceleration with KVM, but for the moment
> I would recommend concentrating on getting it working). What
> matters is that the guest software you run must match the
> hardware that you are asking QEMU to emulate. (I guess if
> rumprun automatically configures itself based on the system
> you're compiling it on then you're running a different binary,
> but surely it has a setup for manually configuring it when you're
> cross-compiling it?)
>
> What hardware (what CPU, board, etc) is this "rumprun" software
> expecting to run on?

Yep, just to ensure that there are no cross-compiling issues, I am
building rumprun on the pseudo-real hardware itself.
In our case, the pseudo-real hardware are :

a)
An ARM32 "virt" hardware/machine in a qemu environment
(https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/)

Once I start  this machine, all environment is arm32, and I compile
rumprun within this environemnt without any cross-compiling.

b)
A beaglebone-green-wireless.
This is a arm32 machine bottoms-up, so no question of cross-compiling
whatsoever here :)

In both cases, I then use qemu-system-arm (on the "virt" machine, and
beaglebone-green-wireless itself).


One query : It is apparent that there is nested qemu-virtualization in
step a), could that be an issue?


>
> (The "Trying to execute code outside RAM or ROM at 0x00100000"
> symptoms very frequently mean "guest binary was not built
> to run on this emulated hardware".)
>
> thanks
> -- PMM



-- 
Regards,
Ajay
