Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2916626lfc;
        Mon, 16 Mar 2020 05:05:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv5nSNEyZPmmHtGBaWZbPz4l7mH6QZRhP1LWhVYDBLPU9gz8HwniulBvaLaoC0G/5Z9kNr1
X-Received: by 2002:ac8:310b:: with SMTP id g11mr14897838qtb.128.1584360349725;
        Mon, 16 Mar 2020 05:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584360349; cv=none;
        d=google.com; s=arc-20160816;
        b=Ev3zsT5iT5lY0ZnjKSXqTDdFr6kKZFDlAhC+JRh84A1vzBKcuhrw5R5tXoG4E08oRa
         u6PIy+MTr0m/AhChaZLLGUF8hoIuJQjMgd/KTM5VJzzN1zyBarTAjnVFdzI6/oUgoItY
         SDmPpJ5CHF7pEeULJ76SD8A3bvobi4Z98R34w7xL6FV7cFrjOIZFbVGS+5WdbO247ts0
         u++doJgrKKc4VRsorSQRsGgqcRLtVd+FMg4nloWaAZINnI2QFpW3XgLty2+J55+MehIa
         r17qNnJPBSFof6X0PDpuJBYYxQY7EcEc0VQkc2qLTBJrmw0DrmSew0v2npIv1XS+3O8C
         IiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mPzrWw8yhfRBO1pTAkB77hmTKZ8BG+Zp78ow1XnKWdk=;
        b=EQYmhdechR1UZNYiH5wney/Pel4OPbgFG6DvoZFoApbq62fFY3xyWYpuJIbjq6ztVT
         v5jQQTiepbPE7V6pv9ko/s6ZMfc5bahVjWcAYsEGg8irRF4V/kJGA4apjkWzJu9eIvtM
         RA3n6MoqkW4uXcxjoYlK24fc04iEWvVY6O479urrcd4N7mWuIez6FGbm/mdT/r+1ql4a
         kExRtR0qX4jMFpVEUtusw/nEIrpXfhX16KXO7gH3kUlkGcU7a7AUpcZMh4XHxssGOVGP
         +Xu40YYFjj+ikMWGVWK/Ck/qhu29hIzeqt5Qite3zVptI0HPp62qYX7C4GGkkQ3hToT3
         Daxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IWsGix97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn11si3120988qvb.164.2020.03.16.05.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 05:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IWsGix97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDoVA-0005ld-LN
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 08:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDnb7-0001qC-Ex
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 07:07:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDnb6-0005Z6-3L
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 07:07:53 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:38033)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDnb5-0005H6-O9
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 07:07:51 -0400
Received: by mail-ot1-x32a.google.com with SMTP id t28so14727745ott.5
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPzrWw8yhfRBO1pTAkB77hmTKZ8BG+Zp78ow1XnKWdk=;
 b=IWsGix97OPxkLEEYhfLe9biOSXtnse5AeZBdBTw+zgPZTEPN08krRdzyGe1zxowpQo
 8R/TFjfk3A+6P4aUxO1OLGSU6FawH1FMyYtF/W1dgNoYt0vClGZG44Jzr1cy1Z7xve0R
 bR/oUJtAhXnOnB5SAAzXmPquieEaVpSuQCR+/rR8tpRoAauiQnNeBw8cZmimkGd2yljb
 WkjIGaRbBhbzfdy6uG1Dtm1iv/dgJKC+j/FdRveazJvLPyBlNh4PBFfLTOONnZGKlh+9
 8S5PpUCjfl8DQUbzdnYUOt+bfYqNpV8RKwz9olS0tF2ioZ1unzBEZ0gywnD1ZYOTJcwX
 jwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPzrWw8yhfRBO1pTAkB77hmTKZ8BG+Zp78ow1XnKWdk=;
 b=i7D03iwdzPf9cv1UWSVn5VvYsom7Yb+L+igNZ1mvIObjEg2AeWP18hcFzXo8BVOY0u
 JfMvnE06QB8BGNb+6ZKcbIjxHe0RpiRFaiShZGJ+EjGFjvLyqY6vexlk9IEqp7WeIr6V
 kEkS0RVIXqCz73TtrjRmKLaaOYpltn3232BhbW+XpR4HKW1R5QgrBjU5SRt+mFUwpIR9
 iheFXRsdsiCsy63sqbI8uEOMnv0Iu5TPZolVlxuHRvqx+n40FZT7UsU12WOuBeRKe3de
 kQJUqPd+YA2isvjCZ6EU1o52kaJmc/Drsoo0Q+/sxsUuNG/YZ3AvaHpfHOMqhHXiUZmc
 kGUA==
X-Gm-Message-State: ANhLgQ3SadZadOgHnSP8r7I4XCr4YNX8Of3+1sbce75TTmwYMePWVndI
 BYzeWasu2ThJfGrRI1DhIo4YjAb+231OzMmuPFmJzw==
X-Received: by 2002:a9d:6c05:: with SMTP id f5mr22236378otq.232.1584356869975; 
 Mon, 16 Mar 2020 04:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
 <CAFEAcA8cvbevCQRY2NxqsBAuR+dhjNyfg2Z14CgYCAtQEqT4=w@mail.gmail.com>
 <CALUW38tX6uQLrgRbgB2jrALouAhyxVgvOkyUskKyUkJqos3Arw@mail.gmail.com>
 <CAFEAcA9dErKNP-fw9fytp0pOp=HrgKvjb4RjuPXVk09g1VCHAQ@mail.gmail.com>
 <CALUW38sMOQzvH3XrkiwqvqjsZrUJUyvCXRg7hr9b5pzDzOPkjg@mail.gmail.com>
In-Reply-To: <CALUW38sMOQzvH3XrkiwqvqjsZrUJUyvCXRg7hr9b5pzDzOPkjg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 11:07:38 +0000
Message-ID: <CAFEAcA-KVMrc770tNFJZMtnsYDmO6eDmFcoHrN1rJxN-DEfb-Q@mail.gmail.com>
Subject: Re: Custom ARM Board: Setting BE32 endianness
To: Tanay Gupta <tanaygupta0x00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KjCdpm6wMi0t

On Mon, 16 Mar 2020 at 10:34, Tanay Gupta <tanaygupta0x00@gmail.com> wrote:
> I used the loader device to set the pc, and it works.
>
> I also set the breakpoint in gdb on arm_cpu_realizefn, and the function is setting the SCTLR_B flag like it should.
>
> After that, I used "-d in_asm" to log target disassembly, as you suggested. The output in that log still shows the little endian interpretation of the code. Is there anything else that I need to change? What can I do to debug this?

Hmm. Is the emulation also behaving as if it's reading the
instructions wrongly, or is it just the disassembler that's
getting it wrong? (All these loads are different code paths,
so you can't assume that because one of them is one way around
the others are all correct.)

> Also, I've tried to change the endianness from the inside, by running a "correction" program, and then jumping to the actual start point. "setend be" and setting the CP15 register, both don't work. Are these methods not supported?

I think you're confused here. "SETEND BE" is for BE8 big-endian
(which is the byte-invariant endianness handling for ARMv6 and
later), not BE32 (which is the word-invariant endianness handling
for ARMv6 and earlier).

Anyway, I think you're now in "need to debug QEMU" territory.
Nobody really uses this BE32 support, so I'm not surprised that
it's broken. As I said, my guess is that the issue is in how
the code is loaded into memory -- because BE32 is word-invariant,
you can't just load a binary file in byte-by-byte, because the
order of bytes in the underlying RAM has to be 32107654...

thanks
-- PMM
