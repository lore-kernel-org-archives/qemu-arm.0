Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp440863lfo;
        Thu, 28 Jan 2021 10:05:53 -0800 (PST)
X-Received: by 2002:a17:906:2f09:: with SMTP id v9mr595885eji.151.1611857153089;
        Thu, 28 Jan 2021 10:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611857153; cv=none;
        d=google.com; s=arc-20160816;
        b=WeNUOs8I3NxcvwiFExNINDUDs6NzTMN5XjZRlzKPFVjaZ3fiTWOycubaO8hSxgiNEK
         n0HrwvA9qJExpTphWbOinzfVF+t49UxLJ3ykZlmV0KjJmebbfdocCb0KWLflddL3zzvO
         djbEL5Hi/BrYr3HsCC2Q6bwvJNCH0q4bZ0SVhTpWmlCy2tktL1ilV7oY8ECUgpVjqwhm
         Lhy8tLdks5jhj3pDZ+QaF2i2lTyNgwE8Yhwml5th97sx24E4/F2LjUF22vyJRjIjAtSG
         nOb3NyBtCx9Ci7SRaeBSMGhj9qdqmzmzNCWm5Pnm+2N9uvTw+xy/66L77Dgz/8ubVBJq
         5moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Re1RwwGUNB5sg+yEG415P4GxdiDQT4tR/tMFlPyz+vE=;
        b=kzMaNqvtUnVOc4t2sR4Mw2wrOFCZtCWr7Ny4YPZXRSMODDwd/51X4bNZuU15fPqtr+
         yukRTG/68d3m2rAAqHpB5CFzkOFTvELxdUqmoGGbOBkUCVg7yJTPcDt+K9D5PQ5oJTXA
         Q9zQaNrVbh3mSQg2YOF43LYItZ6lAyTPgPrvOhxW/A9QuDHobrG+x6wEXymqOx3lTJmV
         jNKDyGuguQJDK75TOe3Dk1EzRZIuydQRlzE/QjL66ZuokaRkWLPJicX69EFRWx4hp+BL
         ZbCToMII+Ze4TyuE+OG/rbejwMNAzqwJtZlZ/9m/W52UyvxhhEVYsLHa/JWO3wgblfhZ
         jbjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1mvluxV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i28sor6837952edb.12.2021.01.28.10.05.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jan 2021 10:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1mvluxV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Re1RwwGUNB5sg+yEG415P4GxdiDQT4tR/tMFlPyz+vE=;
        b=Y1mvluxVx6smKiNIA8DguWYEPvuHNmTuQ/61ZyeJH2wuucsfccF+9JI4aKKzzXQLki
         Im+/JgUYGrgapTljYUmpC1zXbDFW6tRfXFbzTZyHgB70AD1/CrEmCHiaQTPZBVa8pod9
         b96oc1YtU9YCcZeoTioSTKQ2VSPweuU9frytlZa70FcYEhXw/yxu9gQoHSwDXqs3vU8p
         /W+gOePp5YTx0d0EP6655RRNCOB2tvjUuOt7e/qp3qc5xX7DtQ9J+IuNEgC5kNTD8kT0
         RlYWZv6abf/H91G+9RzT7QhqWfJfLgb4thahG6/pCj3dT0/Q2Ox6bG1SVxq20byMwaSz
         vmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Re1RwwGUNB5sg+yEG415P4GxdiDQT4tR/tMFlPyz+vE=;
        b=r70YtC3b8oYKbyCuZesz/dgiLqimfByQ3qb9/CPvY9EPYh4SfihlvlxTNJySdtcIAN
         zVhMRZoD7pobRvIhQqTs2JNvSiR2wVy1ZrXfMTbCf9jqjR8NI/XuLQoYJ+MHiQ+mX/ch
         TNGV0Jev/0vSDsQYCdNcfHT3JiZtlOcM26K6Oo6dwRffQtGEAbg0H2Xtj6eNeUAVCnxc
         14nIbo6HMIfaLuKJzvpE2KpbatVmchIbaBlO4OCgbiOD44Xur3YcAj2aaAUby4nu4+Kl
         Kz2fIZ7ZJrIN/qIHIo3M8NN8xdB2s9dTs3HSF71ot9uxtuy9hc2NMnDvlAxiHYoF3klb
         Lz4Q==
X-Gm-Message-State: AOAM53095pWncgJgTuyM9dVsqdg7fcRCvbkL80l9hNMIntszoRuWiK8h
	CU/OGt1+04wwFQcga/+azbJGbewczz5R9ouFbXfxp9gr
X-Google-Smtp-Source: ABdhPJxgf0UpLoEfNPFcp6Uw5+EkWJ03Q6G3dfgQjyiuSmjORfaABwmFZCWKsKXWBI7vMyNzQ0RmzmCJCCGV5v9FSGw=
X-Received: by 2002:a05:6402:5107:: with SMTP id m7mr908986edd.52.1611857152771;
 Thu, 28 Jan 2021 10:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20210128161417.3726358-1-philmd@redhat.com> <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
 <82de6c97-d13b-01b9-e9ad-3b20f00adc5e@redhat.com>
In-Reply-To: <82de6c97-d13b-01b9-e9ad-3b20f00adc5e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 18:05:41 +0000
Message-ID: <CAFEAcA_PDyyH0yRiVWt27LoqhOq9MNysE7D7KWdsJN_8rV0VLg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Luc Michel <luc@lmichel.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
	Darren Kenny <darren.kenny@oracle.com>, Eric Auger <eric.auger@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vHl8b6CqfYA0

On Thu, 28 Jan 2021 at 17:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 1/28/21 6:18 PM, Alexander Bulekov wrote:
> > On 210128 1714, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Alexander reported an issue in gic_get_current_cpu() using the
> >> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
> >> doing:
> >>
> >>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=3Dqte=
st -qtest stdio
> >>   [I 1611849440.651452] OPENED
> >>   [R +0.242498] readb 0xf03ff000
> >>   hw/intc/arm_gic.c:63:29: runtime error: member access within null po=
inter of type 'CPUState' (aka 'struct CPUState')
> >>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_=
gic.c:63:29 in
> >>   AddressSanitizer:DEADLYSIGNAL
> >>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>   =3D=3D3719691=3D=3DERROR: AddressSanitizer: SEGV on unknown address =
0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
> >>   =3D=3D3719691=3D=3DThe signal is caused by a READ memory access.
> >>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
> >>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
> >>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
> >>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor soft=
mmu/memory.c:464:9
> >>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:=
552:18
> >>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory=
.c:1426:16
> >>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.=
c:1449:9
> >>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:28=
22:23
> >>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
> >>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2=
875:18
> >>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2=
489:18
> >>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:=
13
> >>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
> >>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
> >>
> >> current_cpu is NULL because QTest accelerator does not use CPU.
> >>
> >> Fix by skipping the check and returning the first CPU index when
> >> QTest accelerator is used, similarly to commit c781a2cc423
> >> ("hw/i386/vmport: Allow QTest use without crashing").
> >>
> >> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> >
> > Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> >
> > For reference, some older threads about similar issues in the GDB stub
> > and monitor:
> > https://bugs.launchpad.net/qemu/+bug/1602247
>
> This one is different. I thought this issue was fixed by
> the series around commit 7cf48f6752e ("gdbstub: add multiprocess
> support to (f|s)ThreadInfo and ThreadExtraInfo").
>
> When using physical addresses with gdbstub, we should be able to
> select a particular address space.

Yes, but the problem with the GIC device is that it does not
use AddressSpaces to identify which CPU is accessing it.
We would either need to make it do that, or else add
support for using the MemTxAttrs requester_id to identify
which CPU is making a memory access and get the GIC to use
that instead. (This is more or less how the h/w does it.)

> Maybe this fixes pmemsave accessing MMIO here:
> https://bugs.launchpad.net/qemu/+bug/1751674

Nope, because the monitor pmemsave command goes via
cpu_physical_memory_rw(), which does an access to
address_space_memory. So unlike the gdbstub it's not
even trying to say which CPU it cares about. (The monitor
does have a "current CPU" concept, via mon_get_cpu(). But
it's not used in the pmemsave codepath.)

gdbstub direct-physical-memory-access is also via
cpu_physical_memory_rw(), incidentally.

thanks
-- PMM
