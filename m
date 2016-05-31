Received: by 10.25.27.66 with SMTP id b63csp2234446lfb;
        Tue, 31 May 2016 11:59:35 -0700 (PDT)
X-Received: by 10.159.36.200 with SMTP id 66mr18570509uar.134.1464721175609;
        Tue, 31 May 2016 11:59:35 -0700 (PDT)
Return-Path: <claudio.fontana@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com. [2607:f8b0:400c:c05::242])
        by mx.google.com with ESMTPS id 20si24055898vkp.150.2016.05.31.11.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 May 2016 11:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of claudio.fontana@gmail.com designates 2607:f8b0:400c:c05::242 as permitted sender) client-ip=2607:f8b0:400c:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of claudio.fontana@gmail.com designates 2607:f8b0:400c:c05::242 as permitted sender) smtp.mailfrom=claudio.fontana@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-vk0-x242.google.com with SMTP id a6so8842441vkg.1;
        Tue, 31 May 2016 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=oyzNwhuvM+XUO4V6jOMXquAQlHUdH9jXK+ggtcn9Z68=;
        b=RcFP4CPkezczYtDWi3mg2VtsubAo/JfuhTeoAd8IzXJ8e7kmQQZhvvDsXzPDcK+8SL
         LZKUd8/28861JRa5REBgNSbmmOTINzs6YCxT0c9O+KpE8I6LosS1YES8+2d3bP2IwNoJ
         ODn+acMbAJD6Qxfaa4NEDvxXR52cW4lHNAwou/gZqWPkSMwN/ci+9kr/kJ1cDNzE6Ztg
         nhSJkYFRjUnYJiUXijLNcvSfl8sHBrZNVfuwrfLbAZGGE1CetgVYT8swvXLtJSkE0wuA
         UqZwhlrRMBP8U7gmOebVit/DeHEuJJriQAVLIRTOJWqfdNqK8qwKk7UVLj8nhKoheVB2
         7qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc;
        bh=oyzNwhuvM+XUO4V6jOMXquAQlHUdH9jXK+ggtcn9Z68=;
        b=eSE8IRSZ9VyHDXdzWAtaF4WzWlG9nIkVZS5TX6cCGmILa8q+gRUjPJ997BOsSOLOfn
         IG+do8VjYLUtdZ/wRCs/3K5hUTS1t4NvBc2tBPU9HTpNZI4QxeW6L0TA1ra5iIZUsBx6
         +BQj3uacHtiIQz8b/cyddkhBEZ3StW/ZpSwEipmbPL/+U4O3dD1Uvp2mzIvurU7gO9LU
         5vJt97GkER1ilTcH9C8P5qgdPgRvQsDe8UG3t+0fWdK7ywv7TJF5Z8uirXR0EXyIlV5o
         CMgYjQukB7xH8YP/RiHKlxI8al+wFXdLDiGP20NSnTiEtUMuneCE8F69h7bHIoHb+w+j
         c8rw==
X-Gm-Message-State: ALyK8tKpeyoOCIsvdQCa7fRBwgy8R5kB7hTg6yQEX4zjloUx5y7nrt7ETPF0MpAceH1lya8xGIYQ+u+JlFfbfw==
MIME-Version: 1.0
X-Received: by 10.176.69.66 with SMTP id r60mr18614035uar.120.1464721175244;
 Tue, 31 May 2016 11:59:35 -0700 (PDT)
Received: by 10.103.102.2 with HTTP; Tue, 31 May 2016 11:59:35 -0700 (PDT)
In-Reply-To: <20160531183928.29406-4-bobby.prani@gmail.com>
References: <20160531183928.29406-1-bobby.prani@gmail.com>
	<20160531183928.29406-4-bobby.prani@gmail.com>
Date: Tue, 31 May 2016 20:59:35 +0200
Message-ID: <CAJuRt+r8OmrOyR5RO_nHpuGGA1UxJcA-7ji-SpP2qEVH1DomhQ@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 03/13] tcg/aarch64: Add support for fence
From: Claudio Fontana <claudio.fontana@gmail.com>
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: Claudio Fontana <claudio.fontana@huawei.com>, Richard Henderson <rth@twiddle.net>, 
	"open list:AArch64 target" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
	"serge.fdrv@linaro.org" <serge.fdrv@linaro.org>
Content-Type: multipart/alternative; boundary=001a114d5e32587a27053427f9c5
X-TUID: o6aj7WhyQK4Y

--001a114d5e32587a27053427f9c5
Content-Type: text/plain; charset=UTF-8

Acked-by: Claudio Fontana <claudio.fontana@huawei.com>

On Tuesday, 31 May 2016, Pranith Kumar <bobby.prani@gmail.com> wrote:

> Cc: Claudio Fontana <claudio.fontana@gmail.com <javascript:;>>
> Signed-off-by: Richard Henderson <rth@twiddle.net <javascript:;>>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com <javascript:;>>
> ---
>  tcg/aarch64/tcg-target.inc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index 08efdf4..c361a5c 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -360,6 +360,9 @@ typedef enum {
>      I3510_EOR       = 0x4a000000,
>      I3510_EON       = 0x4a200000,
>      I3510_ANDS      = 0x6a000000,
> +
> +    /* System instructions.  */
> +    DMB_ISH         = 0xd5033bbf,
>  } AArch64Insn;
>
>  static inline uint32_t tcg_in32(TCGContext *s)
> @@ -1625,6 +1628,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64, a0, a1, a2);
>          break;
>
> +    case INDEX_op_mb:
> +        tcg_out32(s, DMB_ISH);
> +        break;
>      case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
>      case INDEX_op_mov_i64:
>      case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
> @@ -1749,6 +1755,7 @@ static const TCGTargetOpDef aarch64_op_defs[] = {
>      { INDEX_op_muluh_i64, { "r", "r", "r" } },
>      { INDEX_op_mulsh_i64, { "r", "r", "r" } },
>
> +    { INDEX_op_mb, { "r" } },
>      { -1 },
>  };
>
> --
> 2.8.3
>
>

--

--001a114d5e32587a27053427f9c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Claudio Fontana &lt;<a href=3D"mailto:claudio.fontana@huawei.com"=
>claudio.fontana@huawei.com</a>&gt;<br><br>On Tuesday, 31 May 2016, Pranith=
 Kumar &lt;<a href=3D"mailto:bobby.prani@gmail.com">bobby.prani@gmail.com</=
a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Cc: Claudio Fontana &lt;<a =
href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;claudio.fon=
tana@gmail.com&#39;)">claudio.fontana@gmail.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"javascript:;" onclick=3D"_e=
(event, &#39;cvml&#39;, &#39;rth@twiddle.net&#39;)">rth@twiddle.net</a>&gt;=
<br>
Signed-off-by: Pranith Kumar &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;bobby.prani@gmail.com&#39;)">bobby.prani@gmail.com=
</a>&gt;<br>
---<br>
=C2=A0tcg/aarch64/tcg-target.inc.c | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c<br=
>
index 08efdf4..c361a5c 100644<br>
--- a/tcg/aarch64/tcg-target.inc.c<br>
+++ b/tcg/aarch64/tcg-target.inc.c<br>
@@ -360,6 +360,9 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0I3510_EOR=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x4a000000,<br>
=C2=A0 =C2=A0 =C2=A0I3510_EON=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x4a200000,<br>
=C2=A0 =C2=A0 =C2=A0I3510_ANDS=C2=A0 =C2=A0 =C2=A0 =3D 0x6a000000,<br>
+<br>
+=C2=A0 =C2=A0 /* System instructions.=C2=A0 */<br>
+=C2=A0 =C2=A0 DMB_ISH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xd5033bbf,<br>
=C2=A0} AArch64Insn;<br>
<br>
=C2=A0static inline uint32_t tcg_in32(TCGContext *s)<br>
@@ -1625,6 +1628,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64=
, a0, a1, a2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
+=C2=A0 =C2=A0 case INDEX_op_mb:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_out32(s, DMB_ISH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0case INDEX_op_mov_i32:=C2=A0 /* Always emitted via tcg_=
out_mov.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0case INDEX_op_mov_i64:<br>
=C2=A0 =C2=A0 =C2=A0case INDEX_op_movi_i32: /* Always emitted via tcg_out_m=
ovi.=C2=A0 */<br>
@@ -1749,6 +1755,7 @@ static const TCGTargetOpDef aarch64_op_defs[] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0{ INDEX_op_muluh_i64, { &quot;r&quot;, &quot;r&quot;, &=
quot;r&quot; } },<br>
=C2=A0 =C2=A0 =C2=A0{ INDEX_op_mulsh_i64, { &quot;r&quot;, &quot;r&quot;, &=
quot;r&quot; } },<br>
<br>
+=C2=A0 =C2=A0 { INDEX_op_mb, { &quot;r&quot; } },<br>
=C2=A0 =C2=A0 =C2=A0{ -1 },<br>
=C2=A0};<br>
<br>
--<br>
2.8.3<br>
<br>
</blockquote><br><br>-- <br><br>

--001a114d5e32587a27053427f9c5--
