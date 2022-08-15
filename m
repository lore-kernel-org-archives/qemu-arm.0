Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1255676ejf;
        Mon, 15 Aug 2022 08:26:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR71HIstQHbtIG+4FdazlnUrACUzgE2PhzFxuhPT2WMAVEes8ZZda3aB29Noe+oQEmW0Cgn5
X-Received: by 2002:a05:620a:2721:b0:6ba:c74f:1e04 with SMTP id b33-20020a05620a272100b006bac74f1e04mr11101559qkp.605.1660577180787;
        Mon, 15 Aug 2022 08:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660577180; cv=none;
        d=google.com; s=arc-20160816;
        b=OrirGB+yR6Td4XcAFnBBKe8GxmAh6f0Ir3lJKPhLzmR/q8WqPQgEGi2ZNS/Hu6S8D0
         jynPHs7ouUw9ic8PBnDDxkRwwI0PMhmp9S4q0iD7vh6h9iRV5flqXSM5rnEW5wUVnzA+
         ys0RM4iZKg08rUCc3hRF9GJqzz4HPDNV5Unk1+R3Ycg8aRfC/PZXpQ6/S1oNi85vh6MP
         o3kh+Dd/FvFe4sCW1Rx6A2I5vROAjP6TN9wX9te4pD+E0wZ+ZEr1Mmfr+7iRZtUUpJ/3
         bXwRuSuazC4l5eKGv7DJyQl9YN+7knbMc2+Mfhz5BtM9yzfAMQCRhK1E8A6+BbWND/Nw
         VFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mM70xAC34StC6VrsmzyNOrhqrwX7UMnpS2OVpQpQ2Po=;
        b=w4o1bchYqOEkjqkzryfhJVerraujt/6nPop6EZc+A7noq41UrGiPGBco016C+S73eZ
         8F+DP/MHrja37AdNraiZaaJ83b6ZNoBzn5aaFmz5j1/4H5EEJR+FVch9zg0HTGIhnT0k
         6IylR2YZ+LxUqMXuKQE8Z+icZzuSDogZ7LUsud3YVm6DGVn9OrOcaHYbobTs1rfCPtTQ
         BmQGrWR0NOY3LO152B4Kq2N3iyOlQvDPQXRy6aVdyiRGsv2l4R5WfN6+EQ76qAfumy1a
         VvcF8u3vx3DnfWjMsikk4Iwy7CC8nk9F4wkXPKU4BvF2j2r9Mc014OPn+3Uq7fl4szEq
         yqLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=I01Abgbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020ac81194000000b003446c6e015bsi428949qtj.407.2022.08.15.08.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Aug 2022 08:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=I01Abgbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNbyu-0005k9-84
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 11:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oNbyV-0005jj-NV; Mon, 15 Aug 2022 11:25:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shinysaana@gmail.com>)
 id 1oNbyR-0005tF-BD; Mon, 15 Aug 2022 11:25:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso14770026pjo.1; 
 Mon, 15 Aug 2022 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=mM70xAC34StC6VrsmzyNOrhqrwX7UMnpS2OVpQpQ2Po=;
 b=I01AbgbmGdeEO9oQEIMoq2zULcu8LSKamDqqGw0R6Z4w9jocTYFEMFnnMecMACblhz
 SnS8nRCPNlcd0dHdJuQcVuP8vLXD7Hj/GYO2B5QaTyuxdzRVQmxkfQ7dyiP1F7vFREwz
 bviVBcCnhWh5AYszLjRmz9maWPqhc9BaWXq002QMO4k+Vt2ITMaosyXPi1E5z53XJ/au
 OYSmVHZy62EodXJdPHRPL5LD/K6u98eTVK1TgL9hLlkMYrylwg2OkkcRTL37EABYzIwu
 MjKFf+lohnuBx+WgzlC2x62mh63agk7oZJW2ul13jSpqiK7ntGBxWKvY/HeNWyVJEF7B
 sK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=mM70xAC34StC6VrsmzyNOrhqrwX7UMnpS2OVpQpQ2Po=;
 b=eWS8AkAyy/bOgjU4kE83x4E/tgbTKYS3mEypeHFiyBMhC0s4qf89DUQqjq+BxGSbpX
 cEy2hfp3GYK50qczzmXs9wZ1lSivcVm3M1/xFqJXp25Wf7uKJjMn8ItriFhZVJWgr+hL
 sAaOzbgnrF+uCW7e2/jHnjgNHrbqpnxoPRYNoRZstbv+5O0Rjc4kjQhoe5LdWG9j7ICA
 u9ZuxzdVI4aavrh47dyRRY9WklartTmy6UpF6H3XY/Ancmz+z/f8ZQyGNA7l4h0L4gfQ
 b3KTDRHSZttp08z5Wc9v7UsJGZEKRVAWv8WZympHjURqGheHRKfyB9XyEfGQKtOsnBz2
 RbWA==
X-Gm-Message-State: ACgBeo3Fk6mF1fhBYP361Ix/BwS3D5tFRU5sMRBpYHjaSof8kkh0iukS
 Wj3oTKAUT94JDjcJZHATiYyeNB8ozYIX24uWXsE=
X-Received: by 2002:a17:90b:180f:b0:1f4:e294:d322 with SMTP id
 lw15-20020a17090b180f00b001f4e294d322mr28894529pjb.163.1660577149032; Mon, 15
 Aug 2022 08:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
In-Reply-To: <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
From: Shiny Saana <shinysaana@gmail.com>
Date: Mon, 15 Aug 2022 17:25:38 +0200
Message-ID: <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000171b6805e6493fb9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=shinysaana@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbQm+G2/FMZg

--000000000000171b6805e6493fb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much for your answer!

Apologies if I mess up the process of communicating via mailing lists, it's
my first time communicating via this channel.

The project that requires me to implement this board in QEMU currently
would require full USB interface and flash storage at the end of the day,
and I feel on the same page that implementing UART via USB would indeed be
a good place to start.
I personally don't need any of the GPIO interfaces, but if needed by
someone else, that could be a good second step to work on once that part of
the board is implemented.

I have jotted down a few lines based on the MPS2 implementation, which made
me get a feel of how a board is implemented. I'll look at the board you
recommended too, thanks a lot for the recommendation!

As for upstreaming, once (if?) I get a working "MVP", and if I cannot
figure out the best way to submit the patches, I'll keep in touch to figure
it out, if that's alright!

Again, thanks a bunch!

//Saana

Le lun. 15 ao=C3=BBt 2022 =C3=A0 16:58, Peter Maydell <peter.maydell@linaro=
.org> a
=C3=A9crit :

> On Sat, 13 Aug 2022 at 18:54, Shiny Saana <shinysaana@gmail.com> wrote:
> > I'd like to implement support for emulating the teensy 4.1 board (
> > https://www.pjrc.com/store/teensy41.html) to QEMU.
> >
> > I'm honestly quite lost as to where to start at the moment, since
> > I can't really find any emulated Cortex-M7 that would be close to
> > that board already implemented.
>
> Hi! Yes, implementing a new board and SoC model is quite a bit of
> work, and unfortunately the process isn't really documented, so
> the best thing is to look for some other existing SoC model and
> do something similar. In this case, we implement the Cortex-M7
> CPU itself, but we don't implement the IMXRT1062 SoC that it uses,
> or any similar SoC in that family. (We do have some of the older
> A-profile IMX boards, so it's possible some device models are
> reusable -- but equally they might be very different.)
>
> As a pattern, I would look at the stm32vldiscovery machine.
> This is a Cortex-M3 system based on the stm32f100 SoC, where
> we have implemented a few of the SoC devices and have stub
> implementations of most of the rest. That's a fairly recently
> added M-profile SoC and it's written in the "modern" style we'd
> recommend for new code, so it's a good pattern to copy, and
> because it only has a few 'real' devices it's hopefully not an
> overwhelmingly large amount of code.
>
> An initial simple implementation would get a level of
> functionality capable of basic "can run code and it will
> be able to do serial port (UART) input and output".
> (If you're hoping for/would need more than that, do say so,
> so we can check how much effort what you're aiming for would be.
> Some things QEMU doesn't really support very well, like
> emulation of GPIO input/output line hardware lines being
> connected to LEDs and switches... In any case "just a UART"
> is a good first step.)
>
> You'll need detailed documentation of both the board and the
> SoC. Handily a lot of that is collected here:
> https://www.pjrc.com/teensy/datasheets.html
>
> If you're hoping to submit a new board model upstream you
> should give some consideration to git commit structure
> as you work on it -- for code review we need big changes like
> a new board type to be broken up into smaller self-contained
> pieces. It is possible to just write all the code first and
> then split it into digestible pieces later, but personally
> I find it much easier to try to keep the changes at least
> roughly in a series of separate patches as I go along.
>
> Our "submitting a patch" page has some general advice
> and information on our patch processes:
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>
> thanks
> -- PMM
>

--000000000000171b6805e6493fb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you very much for your answer!</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Apologies if I mess up the process of commun=
icating via mailing lists, it&#39;s my first time communicating via this ch=
annel.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The project that =
requires me to implement this board in QEMU currently would require full US=
B interface and flash storage at the end of the day, and I feel on the same=
 page that implementing UART via USB would indeed be a good place to start.=
=C2=A0</div><div dir=3D"auto">I personally don&#39;t need any of the GPIO i=
nterfaces, but if needed by someone else, that could be a good second step =
to work on once that part of the board is implemented.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I have jotted down a few lines based on the =
MPS2 implementation, which made me get a feel of how a board is implemented=
. I&#39;ll look at the board you recommended too, thanks a lot for the reco=
mmendation!</div><div dir=3D"auto"><br></div><div dir=3D"auto">As for upstr=
eaming, once (if?) I get a working &quot;MVP&quot;, and if I cannot figure =
out the best way to submit the patches, I&#39;ll keep in touch to figure it=
 out, if that&#39;s alright!</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Again, thanks a bunch!</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">//Saana</div><div dir=3D"auto"><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 15 ao=C3=BBt 2022 =C3=A0 16:58, =
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell=
@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sat, 1=
3 Aug 2022 at 18:54, Shiny Saana &lt;<a href=3D"mailto:shinysaana@gmail.com=
" target=3D"_blank">shinysaana@gmail.com</a>&gt; wrote:<br>
&gt; I&#39;d like to implement support for emulating the teensy 4.1 board (=
<br>
&gt; <a href=3D"https://www.pjrc.com/store/teensy41.html" rel=3D"noreferrer=
" target=3D"_blank">https://www.pjrc.com/store/teensy41.html</a>) to QEMU.<=
br>
&gt;<br>
&gt; I&#39;m honestly quite lost as to where to start at the moment, since<=
br>
&gt; I can&#39;t really find any emulated Cortex-M7 that would be close to<=
br>
&gt; that board already implemented.<br>
<br>
Hi! Yes, implementing a new board and SoC model is quite a bit of<br>
work, and unfortunately the process isn&#39;t really documented, so<br>
the best thing is to look for some other existing SoC model and<br>
do something similar. In this case, we implement the Cortex-M7<br>
CPU itself, but we don&#39;t implement the IMXRT1062 SoC that it uses,<br>
or any similar SoC in that family. (We do have some of the older<br>
A-profile IMX boards, so it&#39;s possible some device models are<br>
reusable -- but equally they might be very different.)<br>
<br>
As a pattern, I would look at the stm32vldiscovery machine.<br>
This is a Cortex-M3 system based on the stm32f100 SoC, where<br>
we have implemented a few of the SoC devices and have stub<br>
implementations of most of the rest. That&#39;s a fairly recently<br>
added M-profile SoC and it&#39;s written in the &quot;modern&quot; style we=
&#39;d<br>
recommend for new code, so it&#39;s a good pattern to copy, and<br>
because it only has a few &#39;real&#39; devices it&#39;s hopefully not an<=
br>
overwhelmingly large amount of code.<br>
<br>
An initial simple implementation would get a level of<br>
functionality capable of basic &quot;can run code and it will<br>
be able to do serial port (UART) input and output&quot;.<br>
(If you&#39;re hoping for/would need more than that, do say so,<br>
so we can check how much effort what you&#39;re aiming for would be.<br>
Some things QEMU doesn&#39;t really support very well, like<br>
emulation of GPIO input/output line hardware lines being<br>
connected to LEDs and switches... In any case &quot;just a UART&quot;<br>
is a good first step.)<br>
<br>
You&#39;ll need detailed documentation of both the board and the<br>
SoC. Handily a lot of that is collected here:<br>
<a href=3D"https://www.pjrc.com/teensy/datasheets.html" rel=3D"noreferrer" =
target=3D"_blank">https://www.pjrc.com/teensy/datasheets.html</a><br>
<br>
If you&#39;re hoping to submit a new board model upstream you<br>
should give some consideration to git commit structure<br>
as you work on it -- for code review we need big changes like<br>
a new board type to be broken up into smaller self-contained<br>
pieces. It is possible to just write all the code first and<br>
then split it into digestible pieces later, but personally<br>
I find it much easier to try to keep the changes at least<br>
roughly in a series of separate patches as I go along.<br>
<br>
Our &quot;submitting a patch&quot; page has some general advice<br>
and information on our patch processes:<br>
<a href=3D"https://www.qemu.org/docs/master/devel/submitting-a-patch.html" =
rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/devel=
/submitting-a-patch.html</a><br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000171b6805e6493fb9--
