Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp129858ejb;
        Wed, 8 Feb 2023 15:49:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/RGH+1cuElgL0YL3S33VX3lBMy4FlFYPiF7pMWd+Ciyb0qtoJJpEiRzrFfsdj7L5L8NSQd
X-Received: by 2002:a05:6214:1d24:b0:56b:f308:caab with SMTP id f4-20020a0562141d2400b0056bf308caabmr16724413qvd.13.1675900197160;
        Wed, 08 Feb 2023 15:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675900197; cv=none;
        d=google.com; s=arc-20160816;
        b=OvIXLOhMSIwAIxbYNEcxt5Rw7Fy/tmalFrtyuOWYQG8AqY1UQEC8viFumYhPjy3v5H
         QpE6yrRaJTz7Dhy+z71RNcJxf/tDaeGaQbr4MzfXNc2VIxp+qWXDPXc882Jj0cjKN6TT
         wGVR/E+6yVSwQ1rzuiKjjUfiscGNXso2MLpk9GhhFWqFSQ7AtGYh+bgrVyhrszpC0676
         3bHL59HSfP06ub52Xm6MtSigwUJ/YhGVyETv4t1D/UJp/E3hok94jhALWFSeGWnFpJe2
         L1/rmxFCPakoX4UrGVe77IixqcZxXty/lOsWWjE3HZFoDy5lfKS/x4LckZTH4hxzYmPu
         da4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w0hQq1ySmzPc8UBWIB1gi+7WRd42sqo+KtTWeK4Fxfk=;
        b=DfJnLWQiDoWelSAH7hwXbV7AfgVI71dgDl8w8i9gep9pVqCh3PPTmvk3t7R9WEYYjF
         9uS2cw6UsuuRtj4eOm0l3R1ta/YHnZRoJW3iqq4mwUtyTYQkhj7hn9KTzi10Pg49RTnd
         Tq9rq/U5gFDGuMLX1sNH3vZy47ZddygE6URKKzKvgNwVaNVjccp+pMpRjy8nEato7hY1
         UZ7RhnESsLpH4tV1bbJEASxj9oE0Qo/19eUvWC/H6p+J5E46q1lz8ps8u5nl5jS1ZvU7
         IAXcdvpu9h95r2orxO1uqZdreJosLehAxh2+TObV/eoEIVtueOimbbgIF2y3s4kwwrxB
         B00w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TSUodEpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a27-20020a0cb35b000000b0056bf0a34009si94432qvf.142.2023.02.08.15.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 15:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TSUodEpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPuC6-0001MG-9U; Wed, 08 Feb 2023 18:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pPuC5-0001Lb-C7
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 18:49:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pPuC3-0001rn-Eo
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 18:49:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d14so159089wrr.9
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 15:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w0hQq1ySmzPc8UBWIB1gi+7WRd42sqo+KtTWeK4Fxfk=;
 b=TSUodEpXRKylu/j+boTTg445LVEt1Ms6wg9DJFF0S6Ap/bZz1m08RtznNwxA+Epn+A
 dkC0N8bskz0bZNknh0qR4DWhYAYgn0UIoSW/xx1P7GD6jXtJgcsc3gGvVwIFWjXjlbVN
 lmPivKYYxc1w1N/OrSM3zDhj7Fnb6aD3CW460YEfSWMhE3T2EjRjfpJAFOLXVXuki1+w
 FM5LnmQsNvhhMweLfwAFVDnoYSvRsxBI0zQt1S7Vf50dbXER7if7V4JcvLk0yiKVip49
 bG8ceMKMHr2t+Wgtdt7H7nwetjB+n3JL7BIkuCyDoA0cKv0ORqGIIFiVFi7PX8qE2rWQ
 tpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0hQq1ySmzPc8UBWIB1gi+7WRd42sqo+KtTWeK4Fxfk=;
 b=5/H70hu/rk3kbHVFzIJllU+vp73EnFExC2OhsuoSgaIujJOEbIHXQcwJCQWarFJZay
 dDEhfYVbCq8I2ou3z/ktJ/qZjQpt7jA9RoMPGuXSHQZspGX9zdXxa0wHjTQRvhRCI4BB
 DCZ3tMBPPSyCuvgJFyaHGKV7nhCAewHKMPggok7P4gcILTv1eePfdQ8iFoT0Y7Pg9bCO
 /DDEyQFS6x7Ien294eDYQviz8p2WZyyCGdCyl2eMc9ECfEo7CghMDbQlz7AMWt7g4cS1
 H6DGOamkmqRxppbVyZnvpgPsl/K84yVVAet+I5eIeukzz/np59bnGxK8CgeZSPfEuPpb
 mGww==
X-Gm-Message-State: AO0yUKVdXdb/1n69MO2E1NgaKBbI6jICNvNuJnt8JiFV5Op8u+78SifY
 HlvP6hvTLwlrr1pOmNUvXw8y/ll8pMf56Mm/FdZegw==
X-Received: by 2002:a05:6000:50e:b0:2c3:e35a:19cd with SMTP id
 a14-20020a056000050e00b002c3e35a19cdmr213309wrf.364.1675900176386; Wed, 08
 Feb 2023 15:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20230207194556.3262708-1-wuhaotsh@google.com>
 <20230207194556.3262708-3-wuhaotsh@google.com>
 <ce5472bb-253b-5b8b-7a79-dbd6717af16b@linaro.org>
In-Reply-To: <ce5472bb-253b-5b8b-7a79-dbd6717af16b@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 8 Feb 2023 15:49:23 -0800
Message-ID: <CAGcCb13DQS2YQasMDMBj=iiQxnV6=fOgt7YUkff3A9s7fCs-ag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/ssi: Add Nuvoton PSPI Module
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000b1e24405f438ea77"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=wuhaotsh@google.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BnlPWOBZ1n5e

--000000000000b1e24405f438ea77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for pointing that out. I'll send another version to fix that.

On Tue, Feb 7, 2023 at 11:48 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 7/2/23 20:45, Hao Wu wrote:
> > Nuvoton's PSPI is a general purpose SPI module which enables
> > connections to SPI-based peripheral devices.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Chris Rauer <crauer@google.com>
> > Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
> > ---
> >   MAINTAINERS                |   6 +-
> >   hw/ssi/meson.build         |   2 +-
> >   hw/ssi/npcm_pspi.c         | 221 ++++++++++++++++++++++++++++++++++++=
+
> >   hw/ssi/trace-events        |   5 +
> >   include/hw/ssi/npcm_pspi.h |  53 +++++++++
> >   5 files changed, 283 insertions(+), 4 deletions(-)
> >   create mode 100644 hw/ssi/npcm_pspi.c
> >   create mode 100644 include/hw/ssi/npcm_pspi.h
>
>
> > +static const MemoryRegionOps npcm_pspi_ctrl_ops =3D {
> > +    .read =3D npcm_pspi_ctrl_read,
> > +    .write =3D npcm_pspi_ctrl_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
>
> You said in v1 "The datasheet suggests it's either 8-bit or
> 16-bit accesses.", so we want max_access_size =3D 2 here, right?
>
> > +        .unaligned =3D false,
> > +    },
> > +    .impl =3D {
> > +        .min_access_size =3D 2,
> > +        .max_access_size =3D 2,
> > +        .unaligned =3D false,
> > +    },
> > +};
>
>
>

--000000000000b1e24405f438ea77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for pointing that out. I&#39;ll send another versio=
n to fix that.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 7, 2023 at 11:48 PM Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/2/23 20:45,=
 Hao Wu wrote:<br>
&gt; Nuvoton&#39;s PSPI is a general purpose SPI module which enables<br>
&gt; connections to SPI-based peripheral devices.<br>
&gt; <br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daude &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0hw/ssi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0hw/ssi/npcm_pspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 221 =
+++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/ssi/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 +<br>
&gt;=C2=A0 =C2=A0include/hw/ssi/npcm_pspi.h |=C2=A0 53 +++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 283 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/ssi/npcm_pspi.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/ssi/npcm_pspi.h<br>
<br>
<br>
&gt; +static const MemoryRegionOps npcm_pspi_ctrl_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D npcm_pspi_ctrl_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D npcm_pspi_ctrl_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
<br>
You said in v1 &quot;The datasheet suggests it&#39;s either 8-bit or<br>
16-bit accesses.&quot;, so we want max_access_size =3D 2 here, right?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned =3D false,<br>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 .impl =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned =3D false,<br>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +};<br>
<br>
<br>
</blockquote></div>

--000000000000b1e24405f438ea77--
