Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2387959lfb;
        Sat, 28 Aug 2021 03:51:28 -0700 (PDT)
X-Received: by 2002:a17:906:f15:: with SMTP id z21mr14931343eji.177.1630147888040;
        Sat, 28 Aug 2021 03:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630147888; cv=none;
        d=google.com; s=arc-20160816;
        b=uYW82caEIWWjqV7cxELZ8ghia7euVrjD+7tIvOZkkY8k0wVMhXoa4kKttfKOl1jENg
         Pp36XwvGtPpUf4uzEMqXH99eN9FJVLZPK9xcEeqCFCdx+qo5QArqujOF/hiMaKPUJLcL
         8uf966yBeezMmGObleOjI/Ahi4EiRWURkRYBJTvfTTuR0tjhLuCUR4NzawCTNkod2aMs
         /gIGR6zEI+lLOxiW75SxQExh1sCeTcgdFRNik4o/9gUA0lf0h/ImRVRwWCWPQm2hdi96
         X0fPVhCci02xnxgkYHS3t5+Nzxlqh8WKs0KeSiXNhHB3QZ94qWtjZoCEIBI0cyRmkaTf
         aKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O7aAkV1CGb7+IShcjFyAVU7OvhH5fkDA+TbkiNj4vyQ=;
        b=0vbYMNQX9NrvOLrxb4TW00HYkvBttroPQoaw42OGfIGcanRCDUq4DyXI9y1ZDwIytO
         Q9YoYRd1NbbU2rtua7BFN9z5AnYwtamsgvztDNCgAaNTK8lU0HPrj6CIK3YDbcwaVIyN
         2CZZhd2PdElpqkp25slKturVvyecP5ykK8eUD5JqMijA491sk7pSCsbBZgu34RB3Bawp
         zQ/c3as2sxfpIRwtsvhdIQASAKzrFHSwmL+Ldj8ItQxn/O16/GUBsYySnr9N4JG0IdYU
         Jti2XvIY7MyQvqNO4Q4Se1hk++4EYuVVMXkrzZ/t3db0b8qCb7KEBbIQ29L3tkKHHrwf
         vsmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T21fC0tj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hq1sor5874438ejc.53.2021.08.28.03.51.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Aug 2021 03:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T21fC0tj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7aAkV1CGb7+IShcjFyAVU7OvhH5fkDA+TbkiNj4vyQ=;
        b=T21fC0tj19k57Ytp8jEoKAA1mzfZduoBl02mXYsKjDNXVSGEaaCmKrh+Qe/gq2JbeW
         cLV7QjwQ0qD1tMjX8eIITSabNdogVe21mRcbqMEF8zJTVbXJCVr22KC2zjVRw1QTVU0P
         o9BD1EsrjWge7RASmSEuSIl515n+HKIm2+1Ek6jZ1swED+de+9ZAn5H3XDiA4scp+eMa
         U8ZMNVSjerMQ4uHby9KtY8345YqwPSX5tNusSfy8+MX2qaKFrzQwCEK2qgh270lLZC33
         DFK+z1OJ9LqtqAVJ5cFcV/a/HcZYiBEhqOO0KI3tzs/ElVMax3gUwZj8nJ+A5Y6I3KY1
         ZYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7aAkV1CGb7+IShcjFyAVU7OvhH5fkDA+TbkiNj4vyQ=;
        b=p6nGwOoLUXpRwfgR4gZMGiZHkKqySviboK4KQk6VoKUUfLniYO/Wdv6Kr24ltK1Ppm
         RSRdjvpU0muHFvMfDW/kuhMkHYjs2JQ8zBn0bXmIA0A9VurHHXEyWMqjUksdH0U82b3a
         Q0hgBVrc/UBYdm9qAhoMaEdqxyuwsFQZljD+q+lDm/tAn5/EiqoIhFGbV+4rxyAO2UIH
         gqbq21RzWu6ZPZSCgH6ihNriWDK9vf+Uc5Jah9H9Ve+6EvcGtUexrnRwXQVyIgdcbIkO
         Kd5vPUm+76AUnqum1+uVpzvGYOGPJG7xHVy2528AlYfUYJVGvuRC/FrW97oVGf5n+plY
         LVMA==
X-Gm-Message-State: AOAM53084SiRBZKYMYC0MjiFUmRum1me+O6GMuWTy5gxc7Xl0AmYdTIb
	Js/ijXumY/l6dpfEqFXO37jFiyvqyrzR8n6h9zM6MbBy
X-Google-Smtp-Source: ABdhPJyg51Dcp53SpeLwj2MIm/3eKQa83C1CY4aeFoTUy7eBXZLHlCNKPF2BRmD3jKAUtsCW3kgC2TnAVNDSC0dJFFU=
X-Received: by 2002:a17:907:923:: with SMTP id au3mr12630803ejc.482.1630147887472;
 Sat, 28 Aug 2021 03:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com> <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
 <20210823230535.js3gymomh2chmznc@mail.google.com> <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
 <20210827144938.72astzvxxy3igpn4@mail.google.com>
In-Reply-To: <20210827144938.72astzvxxy3igpn4@mail.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Aug 2021 11:51:16 +0100
Message-ID: <CAFEAcA_78m1jXENFEBRbMcZ4gY+o9BAk01rPHYtXXR1p+rXuFA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: wLbFObSCCmcO

On Fri, 27 Aug 2021 at 15:49, Changbin Du <changbin.du@gmail.com> wrote:
>
> On Tue, Aug 24, 2021 at 10:11:14AM +0100, Peter Maydell wrote:
> > On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
> > >
> > > On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > > > changes to be more capable of handling dynamic target changes
> > > > (this would also help with eg debugging across 32<->64 bit switches);
> > > > as I understand it that gdb work would be pretty significant,
> > > > and at least for aarch64 pretty much nobody cares about
> > > > big-endian, so nobody's got round to doing it yet.
> > > >
> > > Mostly we do not care dynamic target changes because nearly all OS will setup
> > > endianness mode by its first instruction. And dynamic changes for gdb is hard
> > > since the byte order of debugging info in elf is fixed. And currently the GDB
> > > remote protocol does not support querying endianness info from remote.
> > >
> > > So usually we needn't change byte order during a debug session, but we just want
> > > the qemu gdbstub can send data in and handle data it received in right byte order.
> > > This patch does this work with the help of users via the option 'endianness='.
> >
> > I'm not a huge fan of putting in workarounds that deal with the
> > problem for specific cases and require users to tweak options settings,
> > rather than solving the problem in a more general way that would
> > let it all Just Work for all cases.
> >
> Probably we can add a new callback 'gdb_get_endianness' for CPUClass, and use
> this callback to determine if bswap is needed every time we read/write cpu
> registers. What's your thought?

I think that you need to start by talking to the gdb folks about
how debugging a dynamic endianness target should work. Fixing
this probably goes something like:
 * agree on design for how dynamic endianness, 32-64 mode changes,
   etc, should be handled by gdb
 * make gdb changes
 * document required gdbstub protocol enhancements (ie how the stub
   tells gdb about endianness changes, whether this changes how we
   send register information, memory data, etc)
 * implement those changes in QEMU

You seem to be trying to start with the final step, not the first one :-)

-- PMM
