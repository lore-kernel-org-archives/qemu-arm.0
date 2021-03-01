Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3755810lfg;
        Mon, 1 Mar 2021 09:16:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIsd1Tt23k1wC9AaX7wO8puQlwq4W7XSZd2AYCcHarKkB8IardQGWFmmAA7uobnp85ZmXW
X-Received: by 2002:a92:2c0e:: with SMTP id t14mr4910370ile.104.1614619018186;
        Mon, 01 Mar 2021 09:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614619018; cv=none;
        d=google.com; s=arc-20160816;
        b=s2Rq1JtyUFMfNlHPG9fNvxrqQ7x1BXqVizmDvDsy0NSmC/7PVBhu+LAil85687JRYY
         q0qeShEB7fT50MNtpPYxNqZQuG05EMMSUHN1vxYkfSgU35b0BfwH3kBknVaBZjke/vbq
         W+5GdFz8ILUUzTDsyVMwEBlVkT5VbfVcd6JzvKspRNkkpiSed7gYm/2cZvPkce20VopW
         XjzReKkWq7IHHjFAslWjTinku8ppJiDm1PDTQHQ9Ddu5B5Jzcf4wiv+Hc8pJfUD9++Uw
         VxHhklyPQSf9lI9DmAMPeBRRgSFK2HYtW88G+RfVZ/e/g3RVtSQ0j4lzG6mlM4KSzcN2
         S4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xME7qSSR084Nxx8fzJ5zbfWNXFdKf1Fmd8aMrFFczkI=;
        b=Jb0dlhZwETAkiiaH1bFo0luvj6bsfPtYF7vPEbRiNAtCHwN1ZhygjTwKRkqFSjwrS2
         0lzHxzJGIkHG5zdt4UmUFp9oBdrIeBT+eEiKAtAZQt8DqXPZAOidpjIkARNibfPN6ATZ
         QiMlHcknfx8ofeEGmgTFWIjcKq5ynYHVXb+0Q+K2J8Gm5wsoRNlXSGw0H1LPI9mxRI9E
         IOcDZ6xDfE7gBAADz92xfgGW3xLFmLmazJxH6NbPJKnyCCPXHTkEU7d87mEvlj41OA/M
         4S9+E4KaSKyO5m/6Lc+7YNml+zlY5f1yCYhTGMkTiGrihJLyReHD9ka8mHEeh712983I
         vCeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=p1kFFNwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si3019581iow.42.2021.03.01.09.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 09:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=p1kFFNwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGmAD-0007wh-7L
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 12:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1lGm9b-0007vm-7D
 for qemu-arm@nongnu.org; Mon, 01 Mar 2021 12:16:20 -0500
Received: from mail-lf1-f48.google.com ([209.85.167.48]:41092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1lGm9X-0007kx-O8
 for qemu-arm@nongnu.org; Mon, 01 Mar 2021 12:16:18 -0500
Received: by mail-lf1-f48.google.com with SMTP id q25so6461160lfc.8
 for <qemu-arm@nongnu.org>; Mon, 01 Mar 2021 09:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xME7qSSR084Nxx8fzJ5zbfWNXFdKf1Fmd8aMrFFczkI=;
 b=p1kFFNwo3ufNyN0+JuAg1Cgn9Z0OKOV3ULTtsu/FKPva9fbNW7ZiUkGjpOwvCw8n6F
 9XMUf76l2bRrr+xXdOf+cne1MNn1rn3zODX2PO44hBIHJwkXb+/p0eF3H2KOg3F4QMn+
 8LROnN7YInuz/OcPTAzafw6Nvr7wbjXRiIMZsohRnhfKaFp8Ufu7JdpXRQWjGG07WXTx
 +aatzOUtAI+yi+13uCUWX6jLuWpThnle8XI7B3zujoYSqKoOgN/E1/0cCQnp9FAZLjS7
 YWNKWAKRsnatlD6Ka4C3EyjOCL3sUAKT9ekEq++aQHogWN9EESLEN/nDBVz6Lqi1ib2e
 sZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xME7qSSR084Nxx8fzJ5zbfWNXFdKf1Fmd8aMrFFczkI=;
 b=lKqoGvc7j39GNyNyBbC5c6VNKrhcSKLmHFbzbu8EHfPMzReeQhACbDALNdDY+Ey0Sg
 UygbWrehWUXt56pGdqj66fZGZ7vspLzTCFrBQLOMwrr3nNWExLu1e162Q/nVvBO1l8Vq
 cym8eFjpROFG/bhRWByM+CKdBpnkrQGRSswi0fEK5AyYUnuQKjDnI6T9KyQvyZj/K48O
 O5nj0PhvWk/Kwcx9YxlB7pDOFSSx9jAUf4FNuvrTfbpOdV3n4gp7MeNkwTMBMcOzJ+CG
 VsB6Amk7gukYKvL/Yl1kJZj4RZpSTcbiEFRfriVqtvkwU2oXRYsqNzKkHoXqvZLJjvLR
 AtZw==
X-Gm-Message-State: AOAM533pEGiRgykWVI+CemUcSc9ySq9Lu6pTCMqUXyg5fcjT9KcQmdbD
 vtsM0HQ1mAR6UtAjpJhMVWqOsvGt1NCW+YPfSONm1A==
X-Received: by 2002:a05:6512:1284:: with SMTP id
 u4mr10374853lfs.175.1614618671428; 
 Mon, 01 Mar 2021 09:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20210228224813.312532-1-f4bug@amsat.org>
In-Reply-To: <20210228224813.312532-1-f4bug@amsat.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 1 Mar 2021 09:10:59 -0800
Message-ID: <CAGcCb12NR=bheKp2iGKrKRp1M_A2b_xG_Fc5NhissLRKW86U3w@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/npcm7xx_smbus: Simplify npcm7xx_smbus_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="0000000000005c115c05bc7cb42a"
Received-SPF: pass client-ip=209.85.167.48; envelope-from=wuhaotsh@google.com;
 helo=mail-lf1-f48.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1/07QIdYGLEn

--0000000000005c115c05bc7cb42a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2021 at 2:50 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> The STATUS register will be reset to IDLE in
> cnpcm7xx_smbus_enter_reset(), no need to preset
> it in instance_init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  hw/i2c/npcm7xx_smbus.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index 6b2f9e1aaad..e7e0ba66fe7 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -1040,7 +1040,6 @@ static void npcm7xx_smbus_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>
>      s->bus =3D i2c_init_bus(DEVICE(s), "i2c-bus");
> -    s->status =3D NPCM7XX_SMBUS_STATUS_IDLE;
>  }
>
>  static const VMStateDescription vmstate_npcm7xx_smbus =3D {
> --
> 2.26.2
>
>
>

--0000000000005c115c05bc7cb42a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 28, 2021 at 2:50 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The STATUS register will be reset to IDLE in<br>
cnpcm7xx_smbus_enter_reset(), no need to preset<br>
it in instance_init().<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div>Revie=
wed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.c=
om</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/i2c/npcm7xx_smbus.c | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c<br>
index 6b2f9e1aaad..e7e0ba66fe7 100644<br>
--- a/hw/i2c/npcm7xx_smbus.c<br>
+++ b/hw/i2c/npcm7xx_smbus.c<br>
@@ -1040,7 +1040,6 @@ static void npcm7xx_smbus_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;bus =3D i2c_init_bus(DEVICE(s), &quot;i2c-bus&quo=
t;);<br>
-=C2=A0 =C2=A0 s-&gt;status =3D NPCM7XX_SMBUS_STATUS_IDLE;<br>
=C2=A0}<br>
<br>
=C2=A0static const VMStateDescription vmstate_npcm7xx_smbus =3D {<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000005c115c05bc7cb42a--
