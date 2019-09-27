Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3985012wrp;
        Fri, 27 Sep 2019 13:52:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQ+G0RaFI+PSe5owVOCCzOSCU7ARlH3Brzf68QRg6TXj/hfHe4LAou9PwP/dzthuSWW2sm
X-Received: by 2002:a37:7086:: with SMTP id l128mr6646211qkc.433.1569617563646;
        Fri, 27 Sep 2019 13:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569617563; cv=none;
        d=google.com; s=arc-20160816;
        b=UCIVFq30IFo1p6NKh4PCu/6uUcWh7jJ2ZEmied7HyzurSTCvFCN5Qvme2tvinob4ZY
         jTnQOC0EFepJynMR/tsycWaO7VEZysr8pEBJ/qUCULvsrKlP745w9vuK6TjdQuGukBWk
         5hzymckEGK3tsF+z0S0oq2M0gR1+weTyRSrGDxyQcmAU7iTwVVCWOm9rYNliTycW8mnk
         eNiWs5tMPb5EBj+KCmYMiRWd7jrbbU3EP0XP7e84QGzfa02Xuq9uJdsF3CiEPfagmqct
         9L9u3qaNFfAaT/9Q+KDboiHvAn8FHFV6JDr7ZmEtD6PMwyCSyXyMs4gMCJrj0/b/810G
         ozJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+nDA86jMH4Pq7MzS8/vEaBEc7PBFlKlGTqXWHL8JeE=;
        b=Pdtk4XMeDm3u88LsjX4lWkm6VMIXs2o9y0wGGNrXOPntXluWsO3AHDuhsv78rDmVXl
         O9ZZ9BEM1Pg8IkKPSw/BPMDkxFJ3IbAAWjEizyWXVZ3CMJXUfYCM+2sjiPK3NHztgx5+
         etBdQMu6+XOntD14TQ7htFit+aNJ6ScMwaeOqGGM7bMV7YK/FrBdI1axXoZg4MYpzazf
         D6pM9CBiostPdpNRSTPIrJom0z5u7AcY0Ey4vfZlMY++L7f8+mqjhAHXBLZV0kFN8Ihz
         kbtbRuHjkUJC8kyGWqwU+WX8K4G9z1W7Fk6oq3uoHg3Yc1ipRsfN+dteC7lbGLkJxG4C
         Wlrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIqLeI6l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si3285227qka.222.2019.09.27.13.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 13:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIqLeI6l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDxEJ-0007sP-03
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 16:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iDxDJ-0007Hv-PW
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 16:51:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iDxDI-0006c4-CG
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 16:51:41 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:36741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iDxDI-0006bT-3W; Fri, 27 Sep 2019 16:51:40 -0400
Received: by mail-ed1-x541.google.com with SMTP id h2so3498894edn.3;
 Fri, 27 Sep 2019 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+nDA86jMH4Pq7MzS8/vEaBEc7PBFlKlGTqXWHL8JeE=;
 b=jIqLeI6lIwmqbhiuWlMlLdpLKkrDTt+F8TF+IwhJFm0Z7YSUtJiUMMHYYF9dhRySAG
 MC7EyuLY1Ce08/LkfvNecX49gy04w/PweKE5YIXKhhPRb/Op6oprLjAacKzzBgSYM+NQ
 GPFX9qH3Nciy4cY+T64us0ZBNRQs+i3m5/OocaV6besBuM0Z/8X22aylmraT8MztbviR
 a9RB9kydlfF9aF8rPEqn9nCoiPEBwfThwcSpA59+t8ORgIl1VDKZ6EaGjsawA4DTZJVV
 g6kbYcjfeMQvLWDaD/pIvXFguTIsXnZJ2f/vPmds6Ax96EZedtYbGuqg1UwyLcxN54OA
 z8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+nDA86jMH4Pq7MzS8/vEaBEc7PBFlKlGTqXWHL8JeE=;
 b=BTXj6FW8wAQVOACD1Mc4k2j84VjhUqlTep3rN4LAG/LeoZoU2b0bs4eF2GLrNjv3vU
 771c85C20f4Jz8Nq+im27M2SUeNuKPZXUMdhc4Yxzbkp8vuU2435j89XOyTuqWW8L81f
 19ctseSbY5wRgZsKv+JRcH8sycORiVRjlGlRhs+T0+x7A+NKBHNL5L1a8IKKCV36QTjW
 dmkMiBXF7qVGNabt0zqZgyI/3OH3tOy3FaaBE/UmNCXSslmm5CSEz6kxd32Dujj9dFgq
 19GXI/YfvQwYLZHVdfA1RlrMm8arbLz0gM1i4mQwkmxedALVbovu/ND97QZj5QdDA/d/
 LsrQ==
X-Gm-Message-State: APjAAAUisQOyrx77UOBSMPc1Yzq8V+CQ688GeSUiuYMtivZZxPeFDiBQ
 SAi3pHErSRu6fdXJlURmGsSAgFZ/O57ChyIc0Ms=
X-Received: by 2002:a17:906:19d3:: with SMTP id
 h19mr9729195ejd.121.1569617498537; 
 Fri, 27 Sep 2019 13:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-4-f4bug@amsat.org>
In-Reply-To: <20190904171315.8354-4-f4bug@amsat.org>
From: Esteban Bosse <estebanbosse@gmail.com>
Date: Fri, 27 Sep 2019 22:51:27 +0200
Message-ID: <CAGbAg_AcaPU4w175KgDU5Nm9FC=9OBLEL+3cM01EqtMpD3YNfg@mail.gmail.com>
Subject: Re: [RFC PATCH 03/14] hw/misc/bcm2835_property: Handle the 'domain
 state' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006f03d805938f0d19"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
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
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5kXCtqYeHSZ

--0000000000006f03d805938f0d19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Searching this property in the kernel, I found a lot of properties not
implemented.
https://github.com/raspberrypi/linux/blob/rpi-4.19.y/include/soc/bcm2835/ra=
spberrypi-firmware.h#L41
Are the properties only added when they are necessaries for the standard
kernel use?

Reviewed-by: EstebanB

El mi=C3=A9., 4 sept. 2019 a las 19:13, Philippe Mathieu-Daud=C3=A9 (<f4bug=
@amsat.org>)
escribi=C3=B3:

> The kernel is happy with this change, so we don't need
> to do anything more sophisticated.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/misc/bcm2835_property.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 399f0d9dd5..d8eb28f267 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -127,6 +127,14 @@ static void
> bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              resplen =3D 8;
>              break;
>
> +        case 0x00030030: /* Get domain state */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: 0x%08x get domain state
> NYI\n",
> +                          tag);
> +            /* FIXME returning uninitialized memory */
> +            resplen =3D 8;
> +            break;
> +
>          case 0x00038002: /* Set clock rate */
>          case 0x00038004: /* Set max clock rate */
>          case 0x00038007: /* Set min clock rate */
> --
> 2.20.1
>
>

--0000000000006f03d805938f0d19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Searching this property in the kernel, I found a lot of pr=
operties=C2=A0not implemented.=C2=A0<a href=3D"https://github.com/raspberry=
pi/linux/blob/rpi-4.19.y/include/soc/bcm2835/raspberrypi-firmware.h#L41">ht=
tps://github.com/raspberrypi/linux/blob/rpi-4.19.y/include/soc/bcm2835/rasp=
berrypi-firmware.h#L41</a><br>Are the properties only added when they are n=
ecessaries for the standard kernel use?<br><br>Reviewed-by: EstebanB<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El =
mi=C3=A9., 4 sept. 2019 a las 19:13, Philippe Mathieu-Daud=C3=A9 (&lt;<a hr=
ef=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;) escribi=C3=B3:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">The kernel is happy w=
ith this change, so we don&#39;t need<br>
to do anything more sophisticated.<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/misc/bcm2835_property.c | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c<br>
index 399f0d9dd5..d8eb28f267 100644<br>
--- a/hw/misc/bcm2835_property.c<br>
+++ b/hw/misc/bcm2835_property.c<br>
@@ -127,6 +127,14 @@ static void bcm2835_property_mbox_push(BCM2835Property=
State *s, uint32_t value)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resplen =3D 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x00030030: /* Get domain state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;bcm2835_property: 0x%08x get domain state NYI\n&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tag);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME returning uninitialized=
 memory */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resplen =3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x00038002: /* Set clock rate */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x00038004: /* Set max clock rate */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x00038007: /* Set min clock rate */=
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000006f03d805938f0d19--
