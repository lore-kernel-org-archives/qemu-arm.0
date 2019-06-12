Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5115867wrg;
        Tue, 11 Jun 2019 21:28:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYfN+pZLusTKRTFythzQ6QhuyErqvEzueqtRJD9FcCa8MEj3xmK7p+ETsFtlBfrveWEqt/
X-Received: by 2002:aed:2dc7:: with SMTP id i65mr68168314qtd.365.1560313710843;
        Tue, 11 Jun 2019 21:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560313710; cv=none;
        d=google.com; s=arc-20160816;
        b=SIG68Wh5VIzqsgQ3yd4HElSG9/TfiAVmQ88xykZsvDKAtTGDAdMiqoBZnBGJ1YQkXR
         hWVn2v/G2NjmMwqLZhDVK/wmads2bp3Dm2dxdSfLT+Mu4So4tPOcmI+kM7BbmGDDn6Fb
         /EZWEUowwG97A+X4evxKTpV1Nh+rUGhmQjaaKrV0yWfTRuNGp2zJYnbXlfKQBZstGk4l
         rDKlC6cx0jFG15TzoxY1vtycnD/5jvVzreixHM0PMf6inJopJ4v6/33Br1bE8AzxT+mR
         ZmOQ/IHAsIKxz59crwxSNK1rHpfmVlEdX18DkAYcD4f5qf/7A56PrdPXtp9Q3/7AQmVJ
         O9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6UxwC0ymJP8ogQd9UCjvoNCmzs0LP9ZM8oQ4bYoDNg4=;
        b=g1a5Vv97+SLYoouYysqN8ovj8zeFNLXsILScX73Z1xdpi6mSPPBhi/dGz2jz0pFvK+
         xEu79RLID8nIGt7i65rKMvkLMgqaOzorbErCBUPDv/OKDdguGxYmNbdeB0cvwXPvRNYc
         /i/QXHmiKysM4I6anUjMY/W6CbivT6NWSZKHjdNG4fMLnql417NvyJXlq7CSwzYXS6tV
         TUBI3c+X9GfstGomeSUdqiQRbQHScig+1Jt6riEoRYSt9+hKUqBvoFaLtbT/mTOTe9mT
         uHxFitSFmi+j+AwujdZL8yM8sgD2daWu7yoIMzXlwqXJdMxWKwGzQ78ZlWBwnO90E9TQ
         PzmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=adurxUCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si5446366qta.152.2019.06.11.21.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 21:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=adurxUCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hausA-0000KR-EE
	for alex.bennee@linaro.org; Wed, 12 Jun 2019 00:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47671)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1haurH-0000F4-SZ
 for qemu-arm@nongnu.org; Wed, 12 Jun 2019 00:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1haurG-0000O5-Kk
 for qemu-arm@nongnu.org; Wed, 12 Jun 2019 00:27:35 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1haur2-0000BU-P1; Wed, 12 Jun 2019 00:27:21 -0400
Received: by mail-wm1-x343.google.com with SMTP id c6so5005291wml.0;
 Tue, 11 Jun 2019 21:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UxwC0ymJP8ogQd9UCjvoNCmzs0LP9ZM8oQ4bYoDNg4=;
 b=adurxUCRImfJjgzh5IJtAqnsOOXkGqEDkPKNAJWiCOoTXattqHnMZivN//bQ0lRW4X
 o5qjY79iNjMEoMD+0fBYvAt2FKvVyDo5jCDVSnQIuqK2Sc09oNigwjjuwOYwdc0ddraL
 h0zviyWRiTn+maRB54nohp9UKMQgclbnCzKSmBKxVByUM0lQ66SLbM6cVW1aCLDp8SZX
 otBIGNdGMOP/VUdqfj1McLtUVOUWzFa6GtHzzdZu1qdyUHtpmodGVudNKXUiiAoBwfm8
 dCEizCZCkK/iUNOdJDVm4hziky6SWMEAFY4dR0kPdJ9e/qz2ubk1Kb6pH6wW8X+8UWMH
 te6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UxwC0ymJP8ogQd9UCjvoNCmzs0LP9ZM8oQ4bYoDNg4=;
 b=RUp59wlaIuqwrRysBf0FkGOaH9TWn71pf2DuM9iazj632feuXhwQVbG62JxeLXrRNv
 IDG7VP+Sy+NgmNn66XJExn3zSzvTWGpi18m7J1c6tl/G4UowDRptTDsPun8B7rB5d2B6
 p+SGk/ALQHyh6njDShwnF3wrQC3r6ofwxH1FWryZUMjFb2fJTzlf42mFvgsl4VdqC5L3
 aHuD594CKQozZbXwe/PSy1hvzhX7c5rC2rrl6k1uDrEI49Yyxstkvq1UbX9kXPDH+O7n
 /phIpxqsEZSQyeiWHF070etU+oHH5TFBwpagXw5cR40TgsgviLv5T7melkoWhsU/S5J8
 t1XA==
X-Gm-Message-State: APjAAAWqssWuuJxqxcT3X6AS1MGxho/uahHdJzgT2Og5gMON4yDVljaW
 /qNpMQwHoiTxdfNVd2RPoExTGePi9slm3Ae55Jc=
X-Received: by 2002:a1c:b782:: with SMTP id h124mr20102797wmf.20.1560313639025; 
 Tue, 11 Jun 2019 21:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190611145556.12940-1-rfried.dev@gmail.com>
 <f826d073-da60-96f0-9a37-c33761844cc2@vivier.eu>
In-Reply-To: <f826d073-da60-96f0-9a37-c33761844cc2@vivier.eu>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Wed, 12 Jun 2019 07:27:08 +0300
Message-ID: <CAGi-RUL2QThfiYPeZOE6iuryxT7Daj-y-Q=SSgUBRFcDsWP+zw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000031420b058b18d4ff"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] net: cadence_gem: fix
 compilation error when debug is on
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UUYm+ErbRHrs

--00000000000031420b058b18d4ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 7:21 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 11/06/2019 =C3=A0 16:55, Ramon Fried a =C3=A9crit :
> > defining CADENCE_GEM_ERR_DEBUG causes compilation
> > errors, fix that.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> > v2: change %lx to HWADDR_PRIx and %lx to %zdx
>
> HWADDR_PRIx is to use with hwaddr type (packet_desc_addr).
> rx_desc_get_buffer() is uint64_t, you must use PRIx64.
> It may be better to remove also the cast to unsigned.
>
Other places in the code also use HWADDR_PRIx with  rx_desc_get_buffer().
Should I change them also ?

>
> Thanks,
> Laurent
> >
> >  hw/net/cadence_gem.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index 7f63411430..e9b1b1e2eb 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, cons=
t
> uint8_t *buf, size_t size)
> >              return -1;
> >          }
> >
> > -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy,
> rxbufsize),
> > -                rx_desc_get_buffer(s->rx_desc[q]));
> > +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
> MIN(bytes_to_copy, rxbufsize),
> > +                rx_desc_get_buffer(s, s->rx_desc[q]));
> >
> >          /* Copy packet data to emulated DMA buffer */
> >          address_space_write(&s->dma_as, rx_desc_get_buffer(s,
> s->rx_desc[q]) +
> > @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
> >              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
> >                                                 (p - tx_packet)) {
> >                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x
> space " \
> > -                         "0x%x\n", (unsigned)packet_desc_addr,
> > +                         "0x%zdx\n", (unsigned)packet_desc_addr,
> >                           (unsigned)tx_desc_get_length(desc),
> >                           sizeof(tx_packet) - (p - tx_packet));
> >                  break;
> >
>
>

--00000000000031420b058b18d4ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 7:21 PM Laure=
nt Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 11/0=
6/2019 =C3=A0 16:55, Ramon Fried a =C3=A9crit=C2=A0:<br>
&gt; defining CADENCE_GEM_ERR_DEBUG causes compilation<br>
&gt; errors, fix that.<br>
&gt; <br>
&gt; Signed-off-by: Ramon Fried &lt;<a href=3D"mailto:rfried.dev@gmail.com"=
 target=3D"_blank">rfried.dev@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: change %lx to HWADDR_PRIx and %lx to %zdx<br>
<br>
HWADDR_PRIx is to use with hwaddr type (packet_desc_addr).<br>
rx_desc_get_buffer() is uint64_t, you must use PRIx64.<br>
It may be better to remove also the cast to unsigned.<br></blockquote><div>=
Other places in the code also use HWADDR_PRIx with=C2=A0 rx_desc_get_buffer=
().</div><div>Should I change them also ?</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Thanks,<br>
Laurent<br>
&gt; <br>
&gt;=C2=A0 hw/net/cadence_gem.c | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c<br>
&gt; index 7f63411430..e9b1b1e2eb 100644<br>
&gt; --- a/hw/net/cadence_gem.c<br>
&gt; +++ b/hw/net/cadence_gem.c<br>
&gt; @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc, con=
st uint8_t *buf, size_t size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;copy %d bytes to 0x%x\n&qu=
ot;, MIN(bytes_to_copy, rxbufsize),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_desc_get_b=
uffer(s-&gt;rx_desc[q]));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;copy %d bytes to 0x%&quot;=
 HWADDR_PRIx &quot;\n&quot;, MIN(bytes_to_copy, rxbufsize),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rx_desc_get_b=
uffer(s, s-&gt;rx_desc[q]));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Copy packet data to emulated DMA =
buffer */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address_space_write(&amp;s-&gt;dma_a=
s, rx_desc_get_buffer(s, s-&gt;rx_desc[q]) +<br>
&gt; @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tx_desc_get_length=
(desc) &gt; sizeof(tx_packet) -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(p - tx_packet)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT=
(&quot;TX descriptor @ 0x%x too large: size 0x%x space &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;0x%x\n&quot;, (unsigned)packet_desc_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;0x%zdx\n&quot;, (unsigned)packet_desc_addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned)tx_desc_get_length(desc),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(tx_packet) - (p - tx_packet));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000031420b058b18d4ff--
