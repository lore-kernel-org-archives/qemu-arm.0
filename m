Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1972621lfg;
        Mon, 23 Aug 2021 08:30:52 -0700 (PDT)
X-Received: by 2002:a17:906:a0c:: with SMTP id w12mr4509765ejf.376.1629732652662;
        Mon, 23 Aug 2021 08:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629732652; cv=none;
        d=google.com; s=arc-20160816;
        b=RWz1EdhIPtydFYQeq1XKMdxbDldci1Z5qRSz16sm7E3CGxOUpRwVTNaJ57YyU9WfA+
         wR/CBd4AgcEaKVnPpQQjwUS1qILsFYTf/n0Ox/BGP5a72mJhkc25kSv+c4auYC4p7Prq
         ya2XKzOi9KL9+se0DN83bSJrcGg9ti2bQJsVE2aIGs/f+mSQdG2zdN02Ud/uYMoTLCJR
         WW9HrkmhM58p5540OJCihHEWNtrGGIyE6S40ZWbtPqsqPU9jVnjj1Iv8XevcjiKoe98C
         JsWk+93/1DhUioYjVlY+pgdFOgsPFKDZI52FKDEed6ZFyp23ERSpkcukDVQZorcckXot
         IWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsrGlXDOfd0pynyCIWZllLQLAD+dgM+8uPis0CdO/9w=;
        b=sWsOoVnzkHBKO8sw+dUNc2HTSXxXckZkpqVG7nthuD2Fllpcg2SuUUVOhWUq0/bDJv
         Ar9v8GMpkhL1m/95RBguyQmI3vwIOAJgcYahqEkySPaFiB7oA12Trm+BRxn4m+GfMwgq
         vIAkAupUE5fFqB0XACKhjdhO2OUvzz2jyWUvps5o7w9wg+lnEuPac4ugEgxGWBS2JOAZ
         cl1Z//L1Gxc086UkgX2NpsTzpYf4Sc91JCzsfM8jFFMhwU1QNinBJS3RaX6IaFo+yW03
         chfg6Q7SsPZ+D3YtivwakXJjc5MQkKFQizhMeeSl/l3HBe7Z/RBqOPippeRPmFUPofzz
         uGlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sCOULLI/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id se21sor8825255ejb.30.2021.08.23.08.30.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Aug 2021 08:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sCOULLI/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FsrGlXDOfd0pynyCIWZllLQLAD+dgM+8uPis0CdO/9w=;
        b=sCOULLI/MqDWibbVJQn/dw3JTlHST4qHnsmHRD3o/G3OHHX4vQUEhovHLIt4Q/lT71
         BPcYKK31aLtdjKe8jpcF8WgjtIkk/iDbgUOCl6SfEdKA3b2FqYTVDk8PztblME2TbNs8
         WBtTZIjzpAZXQTd7cA7grFhUqy1kh6Ha/zAdyaSIykUyc67bvFw98KVUaeYitzCexI6P
         d/kboOrNixafO6QCqMClzFihHaEJefZtMtuuLRmsZJJiylJcUrXFlIzCN65dOMWf8ysJ
         QJ9UoK7AqtMG/SM4O5Nuur7wAYAInzVVzcaZYjUYVlv8Pb2qWYoE8ZL7aUqXbJu2BSZY
         eN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FsrGlXDOfd0pynyCIWZllLQLAD+dgM+8uPis0CdO/9w=;
        b=RSM+ElYJ8p44VLrbJfx7cJ6Lnc/PV0DmQSOPpoKF35OjdXThqEU24TwO03hSFwQx5E
         DODKCtGqEQUig0rKhhzDZ9gilYBbJ5tEwpCJqRdRa9p/rD8bqcUgjvRHo0FmWwjUUj7d
         OxscnFX0eaB3awbr0aY3Nxld2CoFJTyK/xHIWHMAZj/gQmu5idoqYqfU8Xt9i6IuSFbz
         OtP7nGmeQeh5Z5K1vKkbRGe6dzrwUklg5fsM66hSf81WgIhuxuU9oTyOHuYadoGoTsKa
         VxwCV7fJJVMgC7heeqzzO90JgI+3+FWRmADZrs61/msL331bFLD4w0ObSK3Ta3SOAKy8
         os7w==
X-Gm-Message-State: AOAM532xEjFBCigQ1VGxeUTo1BeMe19mPl+EZ/EGcULb+f1YjeFdZKXh
	2xiYbX0Bq6EDyyW6xR9x56XggdLhkCjW3KLKmmkbIoBC
X-Google-Smtp-Source: ABdhPJy4fE0w2akwHovhabUXVnQsDNiSUkBZLjzsETvVHmF0/6F+aCYPvUmqVW6JAkg3b2+Cxyyw1m78xfuwh/XBIQA=
X-Received: by 2002:a17:906:c085:: with SMTP id f5mr36756872ejz.250.1629732652335;
 Mon, 23 Aug 2021 08:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com> <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
In-Reply-To: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 16:30:05 +0100
Message-ID: <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Changbin Du <changbin.du@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5gUmUDJpqjQ+

On Mon, 23 Aug 2021 at 16:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/23/21 4:20 PM, Changbin Du wrote:
> > To resolve the issue to debug switchable targets, this serias introduce=
s
> > basic infrastructure for gdbstub and enable support for ARM and RISC-V
> > targets.
> >
> > For example, now there is no problem to debug an big-enadian aarch64 ta=
rget
> > on x86 host.
> >
> >   $ qemu-system-aarch64 -gdb tcp::1234,endianness=3Dbig ...
>
> I don't understand why you need all that.
> Maybe you aren't using gdb-multiarch?
>
> You can install it or start it via QEMU Debian Docker image:
>
> $ docker run -it --rm -v /tmp:/tmp -u $UID --network=3Dhost \
>   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
>   gdb-multiarch -q \
>     --ex 'set architecture aarch64' \
>     --ex 'set endian big'
> The target architecture is assumed to be aarch64
> The target is assumed to be big endian
> (gdb) target remote 172.17.0.1:1234

I don't think that will help, because an AArch64 CPU (at least
in the boards we model) will always start up in little-endian,
and our gdbstub will always transfer register data etc in
little-endian order, because gdb cannot cope with a target that
isn't always the same endianness. Fixing this requires gdb
changes to be more capable of handling dynamic target changes
(this would also help with eg debugging across 32<->64 bit switches);
as I understand it that gdb work would be pretty significant,
and at least for aarch64 pretty much nobody cares about
big-endian, so nobody's got round to doing it yet.

Our target/ppc/gdbstub.c code takes a different tack: it
always sends register data in the same order the CPU is
currently in, which has a different set of cases when it
goes wrong.

thanks
-- PMM
