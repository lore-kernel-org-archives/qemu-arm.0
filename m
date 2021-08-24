Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2624874lfg;
        Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
X-Received: by 2002:a17:906:ecfc:: with SMTP id qt28mr38949919ejb.70.1629796321405;
        Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629796321; cv=none;
        d=google.com; s=arc-20160816;
        b=tUek8xPxpmyg8V5jUdeJmpd/L69UBFnUtiI8sEVg8GYzuP6ZkcGmo3tSD/CwTd5hCP
         g8xkAO6egdSffZ6ERSxHwxKePvfINWn0yQnhLP2/JcGoGi8P9c2zhNGIq0lmFwNFeYUD
         Ktk2oy+qmvx+jgZqPnhw/Dww2oTsW0GPD6t/K0hSxyxkpucZl069blFR3lX7MomVSJx4
         v97uKIT++fG8MaGOIA6W5mDuG3FNmQQkLhTOW1iuN19ttw/ZofPTOD6+zQS5q7U0p7Jc
         sEPSqmiM5zPodbWy5jY6XjF8DfUlPeEGHSUEM/k34TqLxe685M3m93Mi1HqiEnA0GKCl
         UFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
        b=fAjf3XGV8YRDiwbcOBnvVsJ/pXlKADUTl63dVs77Mh3DLAU2bcuFIbNYq6cG9DurRx
         Ap49SH5LgNwaaSUf7AngL0VVDCZ3CJGnzAPA3VmJjDvQhpSIA1W1D+XvVhuDyxzkbwR4
         dQ2vsSd0PppUmhbNgGTfvyQsFe4dQUIaCVYn+SDVHGOO6H0ymcOZGz9gKONcDzX6NRIz
         m3xxTQ2DhWryVePifYg66S7Exj+nLHSFpdyP0XOX6mkiEINwcNFg5ec/qHpym+QSJLsX
         jGs1ioUYV9C9MMIl5XmcODRVL9KRpxcY+yc+43kgF5Tc0+2/lOYGsp9GwAb4PPOPLuwP
         8Ofw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/r/px+4";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b2sor17966075eds.5.2021.08.24.02.12.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/r/px+4";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
        b=m/r/px+4zOS3DleHfBI4QcKuIGYWEqBnd0tPYMBxz8CjmCafbVbuotus+w1YJzUaHI
         waY/yYOwIdIoRkTuC5sZD6limfHfvfOnLN89otaEj9rtDt6s4HvJgUPeuyPqs5DViW7l
         m9DSjrWBVow9BYu/WDncw1Y73RFgKe7s5oDKE+j1rusBjsWt5OBUH99S4q+8QRbWhteh
         /5Pj2XgHn45cjKflOda0utabE7kr6XQXBmi5Ma4U5NIRvvshodN3wzlGowq06iBFp0pJ
         DmXVRAg32FwCG2UW+HiLdYRIL01E9cHsL9QrJnpSmRfmHzClR3zWqONvBZIS8NwEwJnn
         2JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
        b=lxOXb59KrK14MQda7EtRd+lIYmfnzrreWGSGsYYdP9Z72pd6xxAcAciJAb9tgyGjgd
         Ex4gD2bBKvRG6vH9xe4da1LBBEGh6yAy0qISFW0cSsh34vcwT+68z+k5DUde54JoK4Z7
         +vX8HsrAJ/vWPxz9iN4yyTB+tompg+hxwL83tc7WrJZH+Hem2eVjbeq7VlxPsqPt4kYy
         JB91mvudOJbZkHK83kT3H9oxCTGu0dx8jsOWB5mCWDyqE98mKUsQtUeE+hs7MazfWxZc
         MJDyEfjMuEFqDY8eL8PDglu8SLwQ8DUJ/Nu4YOoSyn+M3kdQ5RBfMt4oC3Q3aipxnCWW
         +MMA==
X-Gm-Message-State: AOAM532XsRvqXyUB/iXFJFwo48NfJM4BM8YmJwiOVplVSyTRUI7o+5RA
	n3ptaKYpUGX+kHVRKiReVmQQSNFwvSNT6pp/FgFLi5l6ZXK6qg==
X-Google-Smtp-Source: ABdhPJwxyAMPMI9YmggIloFbTje0kuMe9QeWGteNoECe62Bv+V4cEg6Gl4BqSICH0RwGBoMPelpWUXkWjO9mn0fiJok=
X-Received: by 2002:a05:6402:4387:: with SMTP id o7mr41930472edc.204.1629796321088;
 Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com> <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com> <20210823230535.js3gymomh2chmznc@mail.google.com>
In-Reply-To: <20210823230535.js3gymomh2chmznc@mail.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:11:14 +0100
Message-ID: <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6pVGY938nwwC

On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > changes to be more capable of handling dynamic target changes
> > (this would also help with eg debugging across 32<->64 bit switches);
> > as I understand it that gdb work would be pretty significant,
> > and at least for aarch64 pretty much nobody cares about
> > big-endian, so nobody's got round to doing it yet.
> >
> Mostly we do not care dynamic target changes because nearly all OS will setup
> endianness mode by its first instruction. And dynamic changes for gdb is hard
> since the byte order of debugging info in elf is fixed. And currently the GDB
> remote protocol does not support querying endianness info from remote.
>
> So usually we needn't change byte order during a debug session, but we just want
> the qemu gdbstub can send data in and handle data it received in right byte order.
> This patch does this work with the help of users via the option 'endianness='.

I'm not a huge fan of putting in workarounds that deal with the
problem for specific cases and require users to tweak options settings,
rather than solving the problem in a more general way that would
let it all Just Work for all cases.

-- PMM
