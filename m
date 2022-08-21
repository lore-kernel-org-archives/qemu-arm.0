Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp169885ejc;
        Sat, 20 Aug 2022 17:05:35 -0700 (PDT)
X-Received: by 2002:a65:6854:0:b0:41c:feab:e17c with SMTP id q20-20020a656854000000b0041cfeabe17cmr11713591pgt.256.1661040334876;
        Sat, 20 Aug 2022 17:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661040334; cv=none;
        d=google.com; s=arc-20160816;
        b=nBKo8jeuOcNkynPkfAd6fZgNcZAHl4b7kcbW0EqwPOagt6dq7OUFb+69Wv/W2DYKeT
         5MwIKRUrAGXWxrmXVzPHgFTShRSeK/CFNdhrI9Lt6P8KKt402L4dGxpv10Atf/oImdEm
         zVnRGjKSOUN5AKIvb8T4e9pF9kZ5i8GVYHArOBhv6d9DFVb6Uh4+q888LdVBqlidFUFU
         hlDD/4/nWZ0eSqejJqGKb7Xf872mOLGzGtPo9K4Gp2nLD855znWUV0LdHSaLpd9ROguE
         7c5UIapu5ZmMvo/AidRRMmcPTL+SrhFLzuV09w0joehCw7x+RdX8x+CRVVPrKzG9E7xJ
         8Dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhdD+8huK/AI0ib7AI2ZisCth7sYg+srtwh5O8IUBBo=;
        b=wrxxSTrFzzWukhUAU0xtA1pSb9S4qBmeQsfGGnnxjUzf+0+OP1XhA9YjVBG0YtNiiB
         zn7oY+baN1/ZbWUBWBziCZ6lZzh7vWy+33UhJ7eBiA2N48Hg9SR+Fb+rwBMglj+Y6i6C
         bhV2bdR8eqHQ0D9+IZoA/bewrrL4FOAlkF3IXuYY/vTT04UdVHY7qjqkUwgNc+vsZq8O
         MAjiu6uEyA1TpUwnzhVcK0d7PvomeOny8i7X6MiBnxSnt5V3ALnhmoh69sfDixvn30wd
         SaaNH6XF5Hi+Oens93WZHijq7ekV1PVtDGioCMRnknjQXWjI6Msm55xdc+UiVb5ltpaJ
         FBYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=N19b0Z3r;
       spf=pass (google.com: domain of shinysaana@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=shinysaana@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <shinysaana@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bi4-20020a170902bf0400b0016d2c16aac2sor3403079plb.166.2022.08.20.17.05.34
        (Google Transport Security);
        Sat, 20 Aug 2022 17:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of shinysaana@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=N19b0Z3r;
       spf=pass (google.com: domain of shinysaana@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=shinysaana@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fhdD+8huK/AI0ib7AI2ZisCth7sYg+srtwh5O8IUBBo=;
        b=N19b0Z3rzJp7pKE+UeV5dtlYPMTNxqPJBKoFaQHI7G0FHXc7RqGiWgsP3N8wM5PGj0
         o5LexKiGrAlXMv8n0pHUxfYRMK+D/tQhZ4qSUbwNEYV1brncn4hWT3xujBH4mv78rk23
         bOL/oC5pb1yJwmlKEtbuPfMyEk8zyZYIpV6MprHVnJ4IQZK8GuSQO5a/YQaOXG8ZiCTQ
         b3m1nYQH7/5VarfsTTRqg7KaUF2PR6ogRkk7cKIoSmO2I3A+8hxzk3jNk66xwPZKv2K+
         CWJz4Z4z3yyHRPh7/fbp8XqbGSHrRReC+r0xZ8LkkGoQN/4pQHpTROcuIVZVetVE037f
         TQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fhdD+8huK/AI0ib7AI2ZisCth7sYg+srtwh5O8IUBBo=;
        b=MPLoq+tLHN2k4yfIEcr65HYzx1Q0O+gDwngPswRI1By3k24YLshNjGM3lTU2IwKqvr
         zFCtM61EDgUe8ODZV4Iwf7Ysf3gC2jGt4WA345qh+GKvdhC0YQh16ACGDkLz7FOgppWZ
         oowQMxQim+nSnYXJ3NwTYnVQ+B0sOg6z9xSVukEXUszoS8J2E/MYTIo3Br+C5HinxLbj
         aIrrH4cbcMuHX7TrNfkSLfUV/Gu7a+W9U3CFPVhH56cFGpmlIRrNmX85pRP4km6GKMMc
         QLujxHH4hUuv3IigcNM2Rg+Fx72o94VSvQJhRp/kfd0Wo1x+UUHfLbMyfaozrpKTUIs4
         /7eg==
X-Gm-Message-State: ACgBeo3VWtQXhxZYwXPPjSNi2sqxf4/ww9SxgR+xGddpM7+VNREiUd7b
	uoZK83tEJgOaggYFT75/+tzisKchm7owHgkZc+uHHhSp
X-Google-Smtp-Source: AA6agR5IRhVuTPXdSTDVWGRFpb5GMXO2dk/g8MPHf1lHo79KkW8W9Lndz3KnXXgDoyhw9SYnFRZTtigzk2JUHhvW4kE=
X-Received: by 2002:a17:902:f54a:b0:16f:16bb:778e with SMTP id
 h10-20020a170902f54a00b0016f16bb778emr13560824plf.37.1661040333759; Sat, 20
 Aug 2022 17:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org> <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
In-Reply-To: <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
From: Shiny Saana <shinysaana@gmail.com>
Date: Sun, 21 Aug 2022 02:05:22 +0200
Message-ID: <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000d289805e6b517e1"
X-TUID: 0uZgXpXa49/X

--0000000000000d289805e6b517e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Thank you all again for your initial guidance.

I've been able to write an initial Teensy 4.1 machine, for now with only
the few important memory regions initialized, and successfully ran some
hand-written ARM code on it.

I was wondering what your opinions might be for implementing the next step,
which in my opinion should be bootstrapping a "kernel" in the format the
board actually expects. This is however the current roadblock I am hitting.

The documentation ( https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf ), in
section 9.7.1, gives some informations on how, in the actual Teensy board,
the ROM, executed at boot, initialize the board peripherals, and also reads
from a data structure included in the Flash memory (the user-provided
program) where the CPU should jump to after the ROM has done its work
(somewhere in that same Flash memory, usually).

I was able to successfully dump the ROM of the real board and confirm this
behavior. Given that the current plan is not to emulate every peripherals,
I am of the opinion that writing a very simple ROM that merely reads this
Flash provided data structure and jumps to the provided address sounds like
a good starting point, so that I can keep iterating on writing more and
more complex code through the provided Teensy toolchain, and implementing
needed peripherals.

As such, I have several questions:

1/ To replicate this behaviour, is this considered the correct approach by
the current QEMU maintainers?

2/ If so, I have not been able to find any function that would be able to
load data into a memory region "statically". Does one exist? Is there an
alternative to this process?

3/ Regarding loading the "kernel" of the board, as part of the init
process, I am calling the usual "armv7m_load_kernel" function with its
usual parameters. However, it seems to load it as the very start of the
address space, which is not where the flash memory is, and so is not where
the kernel should be loaded. I wasn't able to find a workaround. Is there
something I'm missing?

Sorry to bother you with so many questions.
Thanks again,
Saana

Le mar. 16 ao=C3=BBt 2022 =C3=A0 12:06, Peter Maydell <peter.maydell@linaro=
.org> a
=C3=A9crit :

> On Tue, 16 Aug 2022 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> > Shiny Saana <shinysaana@gmail.com> writes:
> > > I personally don't need any of the GPIO interfaces, but if needed
> > > by someone else, that could be a good second step to
> > > work on once that part of the board is implemented.
> >
> > Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio_=
*
> > functions to handle them). The problem is usually what to do with the
> > actual general purpose pins which aren't wired to something we emulate
> > in the board. Some boards expose their values via QMP properties but I
> > suspect whats really needed is a generic mechanism for exposing GPIO to
> > external scripts rather than have every board define it's own thing.
>
> Yes. However one key thing for trying to get a new board model
> in is not to get tangled up in trying to improve/extend
> the core QEMU facilities for something. That's much harder
> than "my board model supports GPIO output lines to the same
> extent as the other existing board models" :-)
>
> thanks
> -- PMM
>

--0000000000000d289805e6b517e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello!</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thank you all again for your initial guidance.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I&#39;ve been able to write an initial Teensy 4.1 m=
achine, for now with only the few important memory regions initialized, and=
 successfully ran some hand-written ARM code on it.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">I was wondering what your opinions might =
be for implementing the next step, which in my opinion should be bootstrapp=
ing a &quot;kernel&quot; in the format the board actually expects. This is =
however the current roadblock I am hitting.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">The documentation ( <a href=3D"https://www.pjrc.com/tee=
nsy/IMXRT1060RM_rev3.pdf">https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf<=
/a> ), in section 9.7.1, gives some informations on how, in the actual Teen=
sy board, the ROM, executed at boot, initialize the board peripherals, and =
also reads from a data structure included in the Flash memory (the user-pro=
vided program) where the CPU should jump to after the ROM has done its work=
 (somewhere in that same Flash memory, usually).</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I was able to successfully dump the ROM of the rea=
l board and confirm this behavior. Given that the current plan is not to em=
ulate every peripherals, I am of the opinion that writing a very simple ROM=
 that merely reads this Flash provided data structure and jumps to the prov=
ided address sounds like a good starting point, so that I can keep iteratin=
g on writing more and more complex code through the provided Teensy toolcha=
in, and implementing needed peripherals.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">As such, I have several questions:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">1/ To replicate this behaviour, is this conside=
red the correct approach by the current QEMU maintainers?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">2/ If so, I have not been able to find an=
y function that would be able to load data into a memory region &quot;stati=
cally&quot;. Does one exist? Is there an alternative to this process?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">3/ Regarding loading the &quo=
t;kernel&quot; of the board, as part of the init process, I am calling the =
usual &quot;armv7m_load_kernel&quot; function with its usual parameters. Ho=
wever, it seems to load it as the very start of the address space, which is=
 not where the flash memory is, and so is not where the kernel should be lo=
aded. I wasn&#39;t able to find a workaround. Is there something I&#39;m mi=
ssing?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry to bother y=
ou with so many questions.</div><div dir=3D"auto">Thanks again,</div><div d=
ir=3D"auto">Saana</div><div dir=3D"auto"><br></div><div dir=3D"auto">Le=C2=
=A0mar. 16 ao=C3=BBt 2022 =C3=A0 12:06, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=
=A0:</div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Tue, 16 Aug 2=
022 at 10:59, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org=
" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br>
&gt; Shiny Saana &lt;<a href=3D"mailto:shinysaana@gmail.com" target=3D"_bla=
nk">shinysaana@gmail.com</a>&gt; writes:<br>
&gt; &gt; I personally don&#39;t need any of the GPIO interfaces, but if ne=
eded<br>
&gt; &gt; by someone else, that could be a good second step to<br>
&gt; &gt; work on once that part of the board is implemented.<br>
&gt;<br>
&gt; Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio=
_*<br>
&gt; functions to handle them). The problem is usually what to do with the<=
br>
&gt; actual general purpose pins which aren&#39;t wired to something we emu=
late<br>
&gt; in the board. Some boards expose their values via QMP properties but I=
<br>
&gt; suspect whats really needed is a generic mechanism for exposing GPIO t=
o<br>
&gt; external scripts rather than have every board define it&#39;s own thin=
g.<br>
<br>
Yes. However one key thing for trying to get a new board model<br>
in is not to get tangled up in trying to improve/extend<br>
the core QEMU facilities for something. That&#39;s much harder<br>
than &quot;my board model supports GPIO output lines to the same<br>
extent as the other existing board models&quot; :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000000d289805e6b517e1--
