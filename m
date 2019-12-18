Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp435054lff;
        Wed, 18 Dec 2019 00:01:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyi/XOOHEDMIxPl2uMjq/sRG35wZpxF/dJ/wNg2vsjzlGFSmpDRKMon1i7KoGk5O+Tg+68u
X-Received: by 2002:a05:6830:20cf:: with SMTP id z15mr1254632otq.277.1576656105427;
        Wed, 18 Dec 2019 00:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576656105; cv=none;
        d=google.com; s=arc-20160816;
        b=NbhDmj0+uYw+y02jAjhNNGm/M6SGfNiqQ01+8OS6g1z+4zpQMUQ/uDc0gYbszKQxFF
         9QDOloiRJNNgObVjQ+vnK9pzYzY9zWoNaTNMILfPRsy00ccYdCJiX6c01MYgdpeMvjtf
         wnkJTQl32uQpoE/AMHV1FjCteUBcJXN9ZbONlOn1ye53oah+vBYeqJvpLdwLBaoY2cHy
         QA5CjmDeqmbVLLxgoTOELTmN4HmDmWPBX/XlA97ohn8BN2swjDG9IH3f4p7M3482rk0L
         GUyFpazD1dJIYLmIscuDnyrySp4mV9Rm8sHhfT1wn6g/onEte9VooinGRvXenUwaYerK
         NxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=JVg5swbti9AOC9j2cReONmB/j54YHwCcla5puT1Fw9k=;
        b=J+VwUzLw4q03R2I8GMRvUhj4a+imiISnDFa3L3ObvMWI0+uZnzng0aLrgZBMTbp0tU
         3qxPM058RDdNv+xQ+nuqrHfgB2yCxm9RbNSh+eltXiin3K33jexD9SY1TUlUCHdf6HqR
         2U5WB/IPeJHDoqmlA5Hs/HyaT5gCe7VC1ieto7wI3gECpNTjXzrNRlTK/28vcCDjZZWf
         l/MLUK4r5Pw36ab0NuaWVxTV6hDsl4ct0e2a83ChiqRitwhh5XCjw/bFfQR5kd8vmGPk
         C5sKaQWqCH4W0wdL7hMlRtWiiwm+c4wkpXxFVGJiEqos/RNJqQTO42MY3BiQ9JFOVJPZ
         vR/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JMpkN3LD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i140si1063474oib.90.2019.12.18.00.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 00:01:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JMpkN3LD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihUHA-0006hL-Bk
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 03:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihUFt-0005m5-Ot
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:00:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihUFo-0006It-EQ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:00:25 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ihUFn-0006HM-Re; Wed, 18 Dec 2019 03:00:20 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so1365501otc.8;
 Wed, 18 Dec 2019 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JVg5swbti9AOC9j2cReONmB/j54YHwCcla5puT1Fw9k=;
 b=JMpkN3LDA9P1R3Nz6bjWK0wdn/gYJ9F8Hc2kiNbWI9z8zdVx85D3oF4/Y9jRE7+hvn
 pg5GU3qnqfU0pVZE8DA47f1s8F10/Vi8H3qPu7SMs+7jOUNmqdgkZ8V/6OVrkavbO6Pc
 FdvasuscH4/449gcawLtsHO8AEal0gQmwh81OZnLvKC4QIMllxkd0sCBn3CKmGHZQev2
 UlC1gk5P/9WkHpo2AhfLReQhsuIw2ppe+gvCcLWF8EsmR+nCazf3RnhL90OHUK4LctcV
 QVlilYx6cgDpSeK/TlGCsHq5I8kpr7wCYncPlWTWJLreU3DNuHyavQo+bKmDVRRwZBO7
 osqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JVg5swbti9AOC9j2cReONmB/j54YHwCcla5puT1Fw9k=;
 b=AJdNZgQEwD9E5CiALp/9VHGTmyAdocF3AjuAlfvAuOGLWm35uBEf6RA3VGcYeEBzCB
 5ZWpfwxbEqef4Hw0KaBJ/6jTukFwMZ1RHSsgVEApJcJTfYuCew9Mgrhvciiw+cEw5I6q
 7JrNeDw98Yo8BzYUDMgWLcHjeBF8L+BUKo6LRyimACjtdXnbnJf3IXGSbpw9th7Veq/I
 SaBgtN6OokT81n9JuoKmXdlmlGUcerI+OrGK9hxNUMdu8cQhsjbR4c9jtTH3BzoIFInC
 yLq2HX4EmIKRs0OoyuCVww3OCMokg3+G+Mnh6Iu/5ZgHqnKwazwqF6FlQD/5khWTvvxh
 tVfQ==
X-Gm-Message-State: APjAAAWOwzeCIkTknxWaHDmfYuHV8dKg5M363zNcdZOG9uYCDIdDi9Tg
 lhg/S1D6Cko/wR6znvuYNY9t2r0vg65UhMMvsZo=
X-Received: by 2002:a9d:7305:: with SMTP id e5mr1251528otk.64.1576656018700;
 Wed, 18 Dec 2019 00:00:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Wed, 18 Dec 2019 00:00:18 -0800 (PST)
In-Reply-To: <20191217173425.5082-4-philmd@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-4-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 18 Dec 2019 09:00:18 +0100
Message-ID: <CAL1e-=ixaEP6o6=OfPuYsj=b-wuuUsk6Y7bMwosLhRsPqfw7yQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/net/imx_fec: Rewrite fall through comments
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ed7c3f0599f5d58f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJkwAPuxueqO

--000000000000ed7c3f0599f5d58f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 17, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=3D2:
>
>   hw/net/imx_fec.c: In function =E2=80=98imx_eth_write=E2=80=99:
>   hw/net/imx_fec.c:906:12: error: this statement may fall through
> [-Werror=3Dimplicit-fallthrough=3D]
>     906 |         if (unlikely(single_tx_ring)) {
>         |            ^
>   hw/net/imx_fec.c:912:5: note: here
>     912 |     case ENET_TDAR:     /* FALLTHROUGH */
>         |     ^~~~
>   cc1: all warnings being treated as errors
>
> Rewrite the comments in the correct place,  using 'fall through'
> which is recognized by GCC and static analyzers.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
>
Here we can truly say that gcc is confused (as opposed to another patch
from this series).

The new positions of comments/annotations are good.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index bd99236864..30cc07753d 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -901,15 +901,17 @@ static void imx_eth_write(void *opaque, hwaddr
> offset, uint64_t value,
>              s->regs[index] =3D 0;
>          }
>          break;
> -    case ENET_TDAR1:    /* FALLTHROUGH */
> -    case ENET_TDAR2:    /* FALLTHROUGH */
> +        /* fall through */
> +    case ENET_TDAR1:
> +    case ENET_TDAR2:
>          if (unlikely(single_tx_ring)) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "[%s]%s: trying to access TDAR2 or TDAR1\n",
>                            TYPE_IMX_FEC, __func__);
>              return;
>          }
> -    case ENET_TDAR:     /* FALLTHROUGH */
> +        /* fall through */
> +    case ENET_TDAR:
>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>              s->regs[index] =3D ENET_TDAR_TDAR;
>              imx_eth_do_tx(s, index);
> --
> 2.21.0
>
>
>

--000000000000ed7c3f0599f5d58f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, December 17, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">GCC9 is confused by this comment when building wit=
h CFLAG<br>
-Wimplicit-fallthrough=3D2:<br>
<br>
=C2=A0 hw/net/imx_fec.c: In function =E2=80=98imx_eth_write=E2=80=99:<br>
=C2=A0 hw/net/imx_fec.c:906:12: error: this statement may fall through [-We=
rror=3Dimplicit-fallthrough=3D<wbr>]<br>
=C2=A0 =C2=A0 906 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(single_tx=
_ring)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
=C2=A0 hw/net/imx_fec.c:912:5: note: here<br>
=C2=A0 =C2=A0 912 |=C2=A0 =C2=A0 =C2=A0case ENET_TDAR:=C2=A0 =C2=A0 =C2=A0/=
* FALLTHROUGH */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~<br>
=C2=A0 cc1: all warnings being treated as errors<br>
<br>
Rewrite the comments in the correct place,=C2=A0 using &#39;fall through&#3=
9;<br>
which is recognized by GCC and static analyzers.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
Cc: Peter Chubb &lt;<a href=3D"mailto:peter.chubb@nicta.com.au">peter.chubb=
@nicta.com.au</a>&gt;<br>
Cc: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.may=
dell@linaro.org</a>&gt;<br>
Cc: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.c=
om</a>&gt;<br>
Cc: <a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm@nongnu.org</a><br>
---<br>
=C2=A0hw/net/imx_fec.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br></blockquote><div><br></div><div>Here we can truly say that gcc is conf=
used (as opposed to another patch from this series).</div><div><br></div><d=
iv>The new positions of comments/annotations are good.</div><div><br></div>=
<div>Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavec=
omp.com">amarkovic@wavecomp.com</a>&gt;</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c<br>
index bd99236864..30cc07753d 100644<br>
--- a/hw/net/imx_fec.c<br>
+++ b/hw/net/imx_fec.c<br>
@@ -901,15 +901,17 @@ static void imx_eth_write(void *opaque, hwaddr offset=
, uint64_t value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[index] =3D 0;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 case ENET_TDAR1:=C2=A0 =C2=A0 /* FALLTHROUGH */<br>
-=C2=A0 =C2=A0 case ENET_TDAR2:=C2=A0 =C2=A0 /* FALLTHROUGH */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
+=C2=A0 =C2=A0 case ENET_TDAR1:<br>
+=C2=A0 =C2=A0 case ENET_TDAR2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(single_tx_ring)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;[%s]%s: trying to access TDAR2 or TDAR1\n&quo=
t;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_IMX_FEC, __func__);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 case ENET_TDAR:=C2=A0 =C2=A0 =C2=A0/* FALLTHROUGH */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
+=C2=A0 =C2=A0 case ENET_TDAR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;regs[ENET_ECR] &amp; ENET_ECR_E=
THEREN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[index] =3D ENET_=
TDAR_TDAR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imx_eth_do_tx(s, index);<br=
>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000ed7c3f0599f5d58f--
