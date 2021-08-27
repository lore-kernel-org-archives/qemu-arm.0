Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1654851lfb;
        Fri, 27 Aug 2021 07:49:51 -0700 (PDT)
X-Received: by 2002:a17:90a:db42:: with SMTP id u2mr11245583pjx.39.1630075791694;
        Fri, 27 Aug 2021 07:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630075791; cv=none;
        d=google.com; s=arc-20160816;
        b=EUAJ6CkDrSLc2PHqd1IspwaudlIUhtTcjTPOQOV9Gn7Kp1ACDubWZT9oj26N6Bx9Vk
         Q5A1Rb9Fjp7NxeKangc66mF7kJxxTYAMf44DlKD1EZ3ngcJRmClp7m6zdx5HRK6v5ciX
         3eQUou/s4NQ4D7leNg9Od7BYNKmtCsyuyjciUZ9P/GEX5khEhR/+SrkTy0BNmqBfR2h5
         YTV2CdtOJlswdTVjSUZleSJn6Xvp63G58XJxMoNxGsKyOLCfbWcTklu6dqHL3wF1DR+8
         0f0pBGMZg6hfQcFqDbVxPlQ0/KTs5U/pF0bfIFM3yUHonYmA7cB1i/JlhNhXuS14b4D6
         8S2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=24N70ZjeXbgKAd1zuT2PuFCWvpgHs1+vlOADzxre9+U=;
        b=TSSScp/D52VfknQKBUkGrdm8IsVRTc7rjx88TClcvOUS/Xe+ngtqlKypSGHaPrFdfm
         p/j80Jq9J/eHKh50xUA8H8H0PZwHdfYMLCsc1cdsH2LeDz7atDhj5yNF5DTjHlZGZqUu
         pGctzm3S6HSTZ6mS+IVVYjvsB66fe1dBc0Difr82bfvjY1ca0GQoVA7wUj0Mvr8S66nL
         G27cnPA9DYcAi3CGytoxD5JNRbaGwMFCN5nQkLHpmgkT5cjzzu8l9Ah3PkkS9pCjMU53
         PkZlql3NczgsOh/BqYQwqkhwOebyG8q/za8e8LNgTLRYrOuz5ajLGesgFXzMDxjIKPug
         CXxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TafBRGC5;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <changbin.du@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id rm11sor3775218pjb.23.2021.08.27.07.49.51
        (Google Transport Security);
        Fri, 27 Aug 2021 07:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TafBRGC5;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=24N70ZjeXbgKAd1zuT2PuFCWvpgHs1+vlOADzxre9+U=;
        b=TafBRGC5NI/z6jWDRRSgCsBEPBCfDQ4UXDkUypkF6ceEHWx3Cw/wowc3PB7nFz8rmW
         rZKjOOl8BFKPz6dXbPOs8t+B3FF4u9DEuavuThTDxMPMwzdsqFKFHA9UP8DT2c/C56Wv
         GDV1nlMZ7ldi0wmjnR0wbbZvwny6/aMPiSIZiHc7sclSQBNbJoax+RPtmaOqsgR/gel9
         SZ7S0iKYm0DNZR8tfOlnleCB2jKPpfsRsycszMtnWF5/j+97aRww3GKx5ypEWjjjfKIW
         TOrkcQov2wZCOfQCqRtk1oSFJ0DZ2JZ9s4wKCo251PIp1rLRqLWgMdFPpAH74ME6k1nx
         EzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=24N70ZjeXbgKAd1zuT2PuFCWvpgHs1+vlOADzxre9+U=;
        b=gox+phNrJj+zKfvCSFKCTOxVdGmSUpNg+WDyNzE5mue7s3wSE4FvKqEb2WbYWX88VC
         i1JR1o3AuS8dB/mYipkkgxc1iUVkYocVLDKBiz/AoqpEiGiOYIH7K2eifeWw6EhgOL+Y
         Idl8q7mM3AmCT0XKqb7uJh8BJ2zijkZtJDv8/RssOtr+Gal2t9KHCgrnfEN3YbkXTHDi
         vynFCUzQlIagTsJuQ6fWFLgaLsPt2WR+q6obye7KHpv1pkRoHtQDa/Gigs7OfnK4m7Sm
         /vZ/G12O5UnsesEGXlAqMOugCCLHuQYA/BuWSthy6SBZYE4f7g71PWkvzwJKoiA+g+dP
         NOJg==
X-Gm-Message-State: AOAM530+uZT/iAnZoFJwkEYd1YDh7C9COWvHVMsfg6EOriqiTDGIIkl7
	pP6irRWvCiJ2Hh73lAagolfESZC1gRbLWch5
X-Google-Smtp-Source: ABdhPJzyS2gveH4W+88AdNbbDi9Pi5ymyA9oh0Wq1VsS+GBL6f8tS5WWWoR5tlQC7LZMkoWEUSHC8A==
X-Received: by 2002:a17:90a:a087:: with SMTP id r7mr23577863pjp.84.1630075790976;
        Fri, 27 Aug 2021 07:49:50 -0700 (PDT)
Return-Path: <changbin.du@gmail.com>
Received: from mail.google.com ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id c133sm6780054pfb.39.2021.08.27.07.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 07:49:50 -0700 (PDT)
Date: Fri, 27 Aug 2021 22:49:38 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Changbin Du <changbin.du@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
Message-ID: <20210827144938.72astzvxxy3igpn4@mail.google.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
 <20210823230535.js3gymomh2chmznc@mail.google.com>
 <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
X-TUID: WgVsfdyBIdJ1

On Tue, Aug 24, 2021 at 10:11:14AM +0100, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > > changes to be more capable of handling dynamic target changes
> > > (this would also help with eg debugging across 32<->64 bit switches);
> > > as I understand it that gdb work would be pretty significant,
> > > and at least for aarch64 pretty much nobody cares about
> > > big-endian, so nobody's got round to doing it yet.
> > >
> > Mostly we do not care dynamic target changes because nearly all OS will setup
> > endianness mode by its first instruction. And dynamic changes for gdb is hard
> > since the byte order of debugging info in elf is fixed. And currently the GDB
> > remote protocol does not support querying endianness info from remote.
> >
> > So usually we needn't change byte order during a debug session, but we just want
> > the qemu gdbstub can send data in and handle data it received in right byte order.
> > This patch does this work with the help of users via the option 'endianness='.
> 
> I'm not a huge fan of putting in workarounds that deal with the
> problem for specific cases and require users to tweak options settings,
> rather than solving the problem in a more general way that would
> let it all Just Work for all cases.
>
Probably we can add a new callback 'gdb_get_endianness' for CPUClass, and use
this callback to determine if bswap is needed every time we read/write cpu
registers. What's your thought?

> -- PMM

-- 
Cheers,
Changbin Du
