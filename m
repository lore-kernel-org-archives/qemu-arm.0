Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp594905lfc;
        Wed, 26 Aug 2020 02:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaaWtNBN+9IoFh97SYScaFw7BG8f4xJ+G8ir4t3lnsgAQcU+bpQigB20SXdJz7LEXUoZ7Y
X-Received: by 2002:a25:2489:: with SMTP id k131mr21307659ybk.221.1598434580904;
        Wed, 26 Aug 2020 02:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598434580; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfD/OdTMyXylagD2lVlKCRL3GzrhpMBtKsE/vVjYPLqmfQpTcnhr0j8m8ncBj8yG2L
         maff5yHgpqwPwaGCHWs2ofnbcm0MrnBqWfyo7Or63Q/3O0Gied+OnTp7N6y9ovNu1Wik
         svCvNayggGuAZNF8fBRJoWuSh44ija8ovh/pYjWRUXaQIg4WJCF+eOTRSVyE5ILXr0dV
         lejM0t8msNGUylhKQMIlDul9LujzgdEtSJSou1lF799k5y1ebRJNWdt63MnxYHSu24iL
         NYDCborAylIipJO6CvHw1XU64HperbT5xuVT4sVhYLE2gPQ2AUqHq6aqmaxZAXfPDa0J
         Dcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=2/q5de0KwxEsVLf+vB5ZV1S2o31SGrIX59NRPZ6CivY=;
        b=eMUTUmTqUq4gjoihKqka1fLMn/wrqI7MjFPUiEvl8uZWmowuLKkmnYIF5HqUEvmb6F
         dCxq+aS9azVKbo4Oe9ROTUJ2o7PqzY7rufs5HpQe1LGWT6zsBsNkQHwqPNahNPMAjHdU
         uqsDL1tbM/8BWFqMBmWvV5PvoMWt1wb/cUlGjrMHeDUTiwryKEFW4O/s8W9M97ELsMX1
         PqyflY3tp9PhaH4OMwZ4XqUu29V0oG7TVNF/vh7ff3ycPexjEXGCFGwJdPFe/Phv/G9/
         kDcESRUa51J+PNnhIfWe6QOYa/YXdRnjsWCFuQ2Jn2Z9CbqXJpf32paClG/3FVtIv9D1
         2DGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o128si1880643ybg.8.2020.08.26.02.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 02:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kArqu-0001Rp-90
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 05:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kArqn-0001Re-As; Wed, 26 Aug 2020 05:36:13 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:36839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kArql-0007zu-CR; Wed, 26 Aug 2020 05:36:12 -0400
Received: by mail-ej1-f65.google.com with SMTP id l2so1935395eji.3;
 Wed, 26 Aug 2020 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/q5de0KwxEsVLf+vB5ZV1S2o31SGrIX59NRPZ6CivY=;
 b=HQ/hm8MxZz6Uz2xhma4D5Ax46nRMJUWzBoTSG0dG40AvRXtyC0DGu3oCLIcjG5lpzC
 SCJqAbSb8ddb5LLEkaj+1Wlq/tR0iq3MV8mVTbs40IGYuQ00GvdLBAGi5GiMoO/asWTm
 gZASVPjPAiwopL/gRZLw8A+NvqHa7eSw0qwZ+G1aCMR4ivreYOyw1LaRy617Sct3DTfC
 10QgQIXqfH/NyJUP6/c5U/z0xFd0OfLokMC79zDoOztZ+/MaXB/aPtX+jhDbNQ4UC2OX
 5QrnJJQBGOfZQUQ0KSoZa7O+Jfg4jHl+jCl6KWvLt+82iiQMh0nk9AVTeEVvTdN6ucFM
 lQ6A==
X-Gm-Message-State: AOAM531s23ZlBqE8lWG0xYLzC6Mg1+pyGdSgUpv2FFnDmTgRLUtph2U5
 N/cFPkoJPLUizuPqvg1T/O0/3wYsbt2HXYNH1fs=
X-Received: by 2002:a17:906:640c:: with SMTP id
 d12mr14598157ejm.388.1598434569310; 
 Wed, 26 Aug 2020 02:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200825160847.18091-1-peter.maydell@linaro.org>
In-Reply-To: <20200825160847.18091-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 26 Aug 2020 11:35:57 +0200
Message-ID: <CAAdtpL709BVOXDbhDRVqgueveVeT0c0dv=weZDaLf84xGkz6dQ@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/armv7m_systick: assert that board code set
 system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b3568805adc48cff"
Received-SPF: pass client-ip=209.85.218.65;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-f65.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 05:36:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChDHSQt9QPvy

--000000000000b3568805adc48cff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 ao=C3=BBt 2020 18:09, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> It is the responsibility of board code for an armv7m system to set
> system_clock_scale appropriately for the CPU speed of the core.
> If it forgets to do this, then QEMU will hang if the guest tries
> to use the systick timer in the "tick at the CPU clock frequency" mode.
>
> We forgot that in a couple of our boards (see commits ce4f70e81ed23c93f,
> e7e5a9595ab1136). Add an assertion in the systick reset method so
> we don't let any new boards in with the same bug.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>


Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

---
> In the longer term we should make this a clocktree input and
> plumb it through the armv7m container and so on, but for the
> moment this assert() improves the current situation.
> ---
>  hw/timer/armv7m_systick.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index 74c58bcf245..a8cec7eb56b 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -202,6 +202,14 @@ static void systick_reset(DeviceState *dev)
>  {
>      SysTickState *s =3D SYSTICK(dev);
>
> +    /*
> +     * Forgetting to set system_clock_scale is always a board code
> +     * bug. We can't check this earlier because for some boards
> +     * (like stellaris) it is not yet configured at the point where
> +     * the systick device is realized.
> +     */
> +    assert(system_clock_scale !=3D 0);
> +
>      s->control =3D 0;
>      s->reload =3D 0;
>      s->tick =3D 0;
> --
> 2.20.1
>
>
>

--000000000000b3568805adc48cff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le mar. 25 ao=C3=BBt 2020 18:09, Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">It is the responsibility=
 of board code for an armv7m system to set<br>
system_clock_scale appropriately for the CPU speed of the core.<br>
If it forgets to do this, then QEMU will hang if the guest tries<br>
to use the systick timer in the &quot;tick at the CPU clock frequency&quot;=
 mode.<br>
<br>
We forgot that in a couple of our boards (see commits ce4f70e81ed23c93f,<br=
>
e7e5a9595ab1136). Add an assertion in the systick reset method so<br>
we don&#39;t let any new boards in with the same bug.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br =
style=3D"font-family:sans-serif;font-size:13.696px"><span style=3D"font-fam=
ily:sans-serif;font-size:13.696px">Reviewed-by: Philippe Mathieu-Daud=C3=A9=
 &lt;</span><a href=3D"mailto:f4bug@amsat.org" style=3D"text-decoration:non=
e;color:rgb(66,133,244);font-family:sans-serif;font-size:13.696px">f4bug@am=
sat.org</a><span style=3D"font-family:sans-serif;font-size:13.696px">&gt;</=
span><br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif;font=
-size:13.696px"><br></span></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
---<br>
In the longer term we should make this a clocktree input and<br>
plumb it through the armv7m container and so on, but for the<br>
moment this assert() improves the current situation.<br>
---<br>
=C2=A0hw/timer/armv7m_systick.c | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c<br>
index 74c58bcf245..a8cec7eb56b 100644<br>
--- a/hw/timer/armv7m_systick.c<br>
+++ b/hw/timer/armv7m_systick.c<br>
@@ -202,6 +202,14 @@ static void systick_reset(DeviceState *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SysTickState *s =3D SYSTICK(dev);<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Forgetting to set system_clock_scale is always a boa=
rd code<br>
+=C2=A0 =C2=A0 =C2=A0* bug. We can&#39;t check this earlier because for som=
e boards<br>
+=C2=A0 =C2=A0 =C2=A0* (like stellaris) it is not yet configured at the poi=
nt where<br>
+=C2=A0 =C2=A0 =C2=A0* the systick device is realized.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 assert(system_clock_scale !=3D 0);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;control =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;reload =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;tick =3D 0;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000b3568805adc48cff--
