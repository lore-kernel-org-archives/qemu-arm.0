Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp93451lfb;
        Wed, 4 Nov 2020 09:02:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfv9O9ezqvbI64/23CUgo7euJVwLU6MoSmes7H3y+VWtEDyNC6O5rx3pybRkPumEnSdZrx
X-Received: by 2002:a17:90a:bb18:: with SMTP id u24mr5371952pjr.85.1604509338518;
        Wed, 04 Nov 2020 09:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604509338; cv=none;
        d=google.com; s=arc-20160816;
        b=v0vrBa+wzRHnWBv2AiZepKdcwo4CZuWDB8ZU6xR52JiZG+vHQ6MQERufeVk01tv7GE
         iRznoZXUhc2dvVPfnqxeAnNpYF5xW6d2lhmUmfLRNqW9DpeHCCPrE8qbI0fBJqNW7/QL
         jlaU/hZNSWm9Vohr0n+C+fOMw/T6kx2U61lQ6ot4bY0h+cVHlULSnzxbrnk9WWRBdS8w
         XL3vfwS0S+b7D+vwC96mbMCRov9Ef3HvJi5dZOuLedgF5vpBBx7hc/QMQtMeZpz7BoD9
         aezZwy3M22Y03Uc4CqVi4YzssMLlnSz/W1TqQmR8Q6o7RrESDlT1MS11lNu8KUKKtUB4
         giqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VDOYZnaVlQFefi/KZhyX2zqfBJl/jnTzxzPuTzKTobI=;
        b=z1K4roHwjmNkgg/zhscSWdf/8WzK0SfCpL54Syxa6mRNzysQJ7eiA9JFR8fTOcwsbQ
         kviI3GvunMazi+QhT9TqK9NFER9/SFdG4lD/advpvNvGYLU6INotZ0gXWxUiDiLPJS90
         qt05p96xZDY6koxXO8OVREHg98wzdZLOirHGIqs4OhdPGMt9L9h1gnIUjldcijCD9aS1
         a4kbFUNllabN+960ffCHZTR45qnmnpBggGtuOgZlmkGbQx1Yl/p6UpTPmiKAHFNis50e
         NcfD1ejYonHPy0cUw4zf3N2Hh5vI43FsdQWSzOq1HxL2uRbI11T21FAgTdSeqHYOYT+y
         s1/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=gWhrrMYy;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id r13si2522580pjp.21.2020.11.04.09.02.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 09:02:18 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=gWhrrMYy;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B4C6720732;
	Wed,  4 Nov 2020 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604509337;
	bh=MmC2lgfNqJ0Zqr1G6buaIftmwYhjHlqbZ2JVzwQEmxY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gWhrrMYyo5zOihM4TEuU/8RM+qmaatuiMg//o6+6f/tqZpO5QnEhtDmbRwF0oU6BB
	 ETXOdl3YLngBJwdLnuEXefcxdu7jpGgeN90JjiRNTubnqaH7fYFvXfxs0chWnRGpI+
	 LJIvnfgKOu60cAgyv+y4+tO/Mog96UCVQhQwx9Zg=
Received: by mail-oi1-f182.google.com with SMTP id t16so5512104oie.11;
        Wed, 04 Nov 2020 09:02:17 -0800 (PST)
X-Gm-Message-State: AOAM5337UvTAauvKlPZXsWnW4umOGbKkuqxwnw3p6K18D+WfCwu1xNAj
	nTixlfj1KI5XZVG0LGnHry5k5Yj0CZDMMUsW/kI=
X-Received: by 2002:aca:2310:: with SMTP id e16mr2910251oie.47.1604509336927;
 Wed, 04 Nov 2020 09:02:16 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org>
In-Reply-To: <87v9elax60.fsf@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 4 Nov 2020 18:02:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
Message-ID: <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
Subject: Re: regression in TCG emulation of VTBL neon instruction
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cMFE26AWJKVP

On Wed, 4 Nov 2020 at 17:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > Hello all,
> >
> > I spotted an issue with the TCG emulation of VTBL instructions in 32-bi=
t mode.
> >
> > It seems that when using the 4 register version, indexes in the range
> > [0x10 .. 0x1f] are not handled correctly, and I end up with all zero
> > vectors in the output.
> >
> > For example, I am optimizing Linux's NEON ChaCha20 implementation to
> > use overlapping loads and stores, and this requires the final cipher
> > stream block to be shifted accordingly, using a sequence such as
> >
> > vtbl.8 d4, {q4-q5}, d4
> > vtbl.8 d5, {q4-q5}, d5
> > vtbl.8 d6, {q4-q5}, d6
> > vtbl.8 d7, {q4-q5}, d7
> >
> > where q4-q5 contain 32 bytes of cipher stream, and d4-d7 contain a set
> > of permutation vectors, where each value is in the range [0x0, 0x1f].
> >
> > The above works fine with older QEMU and KVM, but with recent QEMU,
> > this fails, seemingly because d6 and d7 always turn up as all zeros.
> >
> > This can be reproduced by running the zImage I prepared [0] as follows:
> >
> > qemu-system-aarch64 -M virt -cpu cortex-a15 -m 2048 -net none
> > -nographic -kernel arch/arm/boot/zImage
> >
> > and it will print the following (somewhere halfway down the kernel
> > log) on the affected builds of QEMU:
> >
> > alg: skcipher: chacha20-neon encryption test failed (wrong result) on
> > test vector 1, cfg=3D"in-place"
> > alg: skcipher: xchacha20-neon encryption test failed (wrong result) on
> > test vector 1, cfg=3D"in-place"
> > alg: skcipher: xchacha12-neon encryption test failed (wrong result) on
> > test vector 1, cfg=3D"in-place"
>
> I get:
>
> [    8.974879] testing speed of sync chacha20 (chacha20-neon) encryption
> [    8.975230] tcrypt: test 0 (256 bit key, 16 byte blocks): 351309 opera=
tions in 1 seconds (5620944 bytes)
> [    9.967242] tcrypt: test 1 (256 bit key, 64 byte blocks): 383886 opera=
tions in 1 seconds (24568704 bytes)
> [   10.967103] tcrypt: test 2 (256 bit key, 256 byte blocks): 109213 oper=
ations in 1 seconds (27958528 bytes)
> [   11.967164] tcrypt: test 3 (256 bit key, 1024 byte blocks): 29061 oper=
ations in 1 seconds (29758464 bytes)
> [   12.967165] tcrypt: test 4 (256 bit key, 1420 byte blocks): 19577 oper=
ations in 1 seconds (27799340 bytes)
> [   13.967147] tcrypt: test 5 (256 bit key, 4096 byte blocks): 7217 opera=
tions in 1 seconds (29560832 bytes)
> [   14.972354] input: gpio-keys as /devices/platform/gpio-keys/input/inpu=
t0
> [   14.977272] uart-pl011 9000000.pl011: no DMA platform data
> [   14.980208] VFS: Cannot open root device "(null)" or unknown-block(0,0=
): error -6
> [   14.980431] Please append a correct "root=3D" boot option; here are th=
e available partitions:
>
> I wonder if it was a transient bug when stuff was converted to
> decodetree and got fixed up later? Tested on HEAD @ 4c5b97bfd and @
> e46912b66.
>

I am seeing the issue on 700d20b49e303549 *and* on e46912b66f50b2d8,
after a clean rebuild.

Weird.
