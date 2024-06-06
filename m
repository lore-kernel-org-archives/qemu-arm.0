Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp248598ejf;
        Thu, 6 Jun 2024 04:55:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5YhWql6FhEGYgHkhmvdR01owg8dCJHsiKvij47Uoote6tGFxjyObu04lLMnjSz0PCUTN6UUHurM1YgIDfpm43vb1TwRiJ
X-Google-Smtp-Source: AGHT+IEThgj+r0lZoV0HfPJLs5sjlPAfi8H3zSDl78aAEFYYRl/piq/ssmG6cqE409bT1N8k7cnj
X-Received: by 2002:a05:6214:3f8d:b0:6ad:650a:855d with SMTP id 6a1803df08f44-6b02bf489c4mr66002106d6.23.1717674930935;
        Thu, 06 Jun 2024 04:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717674930; cv=none;
        d=google.com; s=arc-20160816;
        b=V8B50jgSeVytFtCBeqVj3RQOG4axMkiUDgVvEIdXsby7TRxXVGIvu2heIpz6MhqyR5
         yTTWBKnGo1mHTiWZBsD3/hDCs+vJ9nRwxtDN6EkCvoq23jBylGQhfIA5qTOIPUc7YIy8
         bhRNEp0ScjeAoiUE6GrIx/huYgDerQMr7TFSVcOt+ucuu2HW8VShyfmOMfTmIuPvP5q6
         s6o4TrgwTqNHX51ZqNnZgy/PaM2KvfSw9pYThgN3xKTmACMTG8Bz6eoJLUcPVdXx64KC
         JCjepxxX51ir4oAjOcIJm255/LAFMe79qaGRl88JqCXwOPbpxzKoqASiGgD5CltUbujL
         qF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uUyVEA+7cIwx1t4l1tSgE7Q2u94h3Kf2O4BRSqa4jDo=;
        fh=VpWnUUZzlz47fY6zQKbqC6DJva/ego0qKwA0ab3x490=;
        b=rtHqsBpfyFAlPyKevFp0oqO6uM6ftBPOR5bKfTrUFrfuZ+WLURQNa9xhlG3qMY/S3o
         Zqv6LuhlD8vjX36YEFbh20PSgpFBCfwRADKw0jVGW3YOq5zgXIWySKuno2j3BJ+2OecI
         70RDdvoAToA53wT6wRuTFMYD0z2LS44WqCJV1nKtnlYX6RwF7gA/zmUR01AIysvZdrwH
         qmnR5fVDFIft0njNh6x3j+x0T/gvTFoffzE7vervK/58x+q/IbX8Smuu07RW/HgvaMcR
         g6td5brKEXExpvHzGl4LGr2I+2GF1GD9qIxLE39dEZ6tBtY9RCGZGn17TfkJjn5x1/yT
         wnUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bA2rQxM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b04f686909si13521466d6.179.2024.06.06.04.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2024 04:55:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bA2rQxM4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFBiG-0007pN-BE; Thu, 06 Jun 2024 07:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sFBiE-0007oq-K6; Thu, 06 Jun 2024 07:55:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sFBiC-0001ez-DB; Thu, 06 Jun 2024 07:55:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57a5bcfb2d3so463318a12.3; 
 Thu, 06 Jun 2024 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717674918; x=1718279718; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uUyVEA+7cIwx1t4l1tSgE7Q2u94h3Kf2O4BRSqa4jDo=;
 b=bA2rQxM4xMwluyYsdMViQGyk9+l6WnNDcMjMbsYskAV1YLOi/FTQXrY2LcZkU16CGP
 DNSReDVBPVrVfN9P0Zf/hpiRDXSl/0eGvv1XL/0p8oPv6bZD2rM5cAwPEyF0m+5U8IFY
 3n0D3l7lvxBPXxUx+B7mbBbrpC2WYQUU9gKsHo3GgUmfBmtc5tLYXnCorU8Tl87bTaFd
 LjMAbptA3ZJZyyWzRGS3Vu+R3UejYFcWjREqYwPMyyKPR3fgdEo8DleqhbvZarlHS4vI
 RNNb57gnWQifcVMJO45Oe0Ll1SvnlXA/fIG+p9QWLAfCSzPSvllx6VO2JtDq9xtDUgb4
 mB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717674918; x=1718279718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUyVEA+7cIwx1t4l1tSgE7Q2u94h3Kf2O4BRSqa4jDo=;
 b=eVTHO8PQmoK0iJtQcdTJ8NGpeWDm8H0Eguqkv9KeS4IqupmNBPzdVvwp6x5bUu2Lby
 bOX9aL60WazyjWWNs8d7CPfyflFmJ6u3Up3BefIC+xDevpmN5KK4c912JRW8jks3V3s0
 CpS2Nw3GVNQwXYjsnU/75mtUN+hX40Otl5qe5d0UnQyxgeG8Ke/PayffdRF0V6TcSJI1
 tAKY6LsZ7ecyELAPsi0uJt0eB+B22tSWx4/AnCWP29H6gvnqsStLDkEAesd5dPvSAQbl
 2GQhwuJDk/nodZ6p3JqqSdmejxUJzwsNoucGVy+O5X9XSFhNQ0ax7oKD2nr3i7R13YJ9
 EAig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm174RKyx48SovtIpqPHDHb8hPlsjl2SDGJC4vMOqNh/21AJoWbpVeXao8jFRuo/Gh/yaFpvkUf7ExpHCSFPvzXFCs
X-Gm-Message-State: AOJu0YwKi3NbIBAdJ4XtOhxDG9iUmFNIXtFogHt4NTwvNIx8u0n517aN
 repZpQj2+Akd/TYkd3SgmePbU/cABDkhbFEUXw0/JU4FdAqFVNWYLEAkr+pQ4CeJusu4IV7WgpR
 Ea/8T5+OdUcOqZxRIpPZsCcwbhJ8=
X-Received: by 2002:a50:d69d:0:b0:57a:76c1:b155 with SMTP id
 4fb4d7f45d1cf-57a8b6aa220mr4279576a12.13.1717674917819; Thu, 06 Jun 2024
 04:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240604071540.18138-1-fea.wang@sifive.com>
 <20240604071540.18138-2-fea.wang@sifive.com>
In-Reply-To: <20240604071540.18138-2-fea.wang@sifive.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 6 Jun 2024 13:55:06 +0200
Message-ID: <CAJy5ezoMf++a1QqyWMnGsb477U2WM_QO7mYVuSONVC-zzwBcmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/dma: Enhance error handling in loading
 description
To: "Fea.Wang" <fea.wang@sifive.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000510899061a375b00"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x530.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W1kENtmZ006A

--000000000000510899061a375b00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 9:10=E2=80=AFAM Fea.Wang <fea.wang@sifive.com> wrote=
:

> Loading a description from memory may cause a bus-error. In this
> case, the DMA should stop working, set the error flag, and return
> the failure value.
>
> When calling the loading a description function, it should be noticed
> that the function may return a failure value. Breaking the loop in this
> case is one of the possible ways to handle it.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>

Thanks!
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



---
>  hw/dma/xilinx_axidma.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 0ae056ed06..ad307994c2 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -71,8 +71,11 @@ enum {
>  enum {
>      DMASR_HALTED =3D 1,
>      DMASR_IDLE  =3D 2,
> +    DMASR_SLVERR =3D 1 << 5,
> +    DMASR_DECERR =3D 1 << 6,
>      DMASR_IOC_IRQ  =3D 1 << 12,
>      DMASR_DLY_IRQ  =3D 1 << 13,
> +    DMASR_ERR_IRQ  =3D 1 << 14,
>
>      DMASR_IRQ_MASK =3D 7 << 12
>  };
> @@ -190,17 +193,32 @@ static inline int streamid_from_addr(hwaddr addr)
>      return sid;
>  }
>
> -static void stream_desc_load(struct Stream *s, hwaddr addr)
> +static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
>  {
>      struct SDesc *d =3D &s->desc;
>
> -    address_space_read(&s->dma->as, addr, MEMTXATTRS_UNSPECIFIED, d,
> sizeof *d);
> +    MemTxResult result =3D address_space_read(&s->dma->as,
> +                                            addr, MEMTXATTRS_UNSPECIFIED=
,
> +                                            d, sizeof *d);
> +    if (result !=3D MEMTX_OK) {
> +        if (result =3D=3D MEMTX_DECODE_ERROR) {
> +            s->regs[R_DMASR] |=3D DMASR_DECERR;
> +        } else {
> +            s->regs[R_DMASR] |=3D DMASR_SLVERR;
> +        }
> +
> +        s->regs[R_DMACR] &=3D ~DMACR_RUNSTOP;
> +        s->regs[R_DMASR] |=3D DMASR_HALTED;
> +        s->regs[R_DMASR] |=3D DMASR_ERR_IRQ;
> +        return result;
> +    }
>
>      /* Convert from LE into host endianness.  */
>      d->buffer_address =3D le64_to_cpu(d->buffer_address);
>      d->nxtdesc =3D le64_to_cpu(d->nxtdesc);
>      d->control =3D le32_to_cpu(d->control);
>      d->status =3D le32_to_cpu(d->status);
> +    return result;
>  }
>
>  static void stream_desc_store(struct Stream *s, hwaddr addr)
> @@ -279,7 +297,9 @@ static void stream_process_mem2s(struct Stream *s,
> StreamSink *tx_data_dev,
>      }
>
>      while (1) {
> -        stream_desc_load(s, s->regs[R_CURDESC]);
> +        if (MEMTX_OK !=3D stream_desc_load(s, s->regs[R_CURDESC])) {
> +            break;
> +        }
>
>          if (s->desc.status & SDESC_STATUS_COMPLETE) {
>              s->regs[R_DMASR] |=3D DMASR_HALTED;
> @@ -336,7 +356,9 @@ static size_t stream_process_s2mem(struct Stream *s,
> unsigned char *buf,
>      }
>
>      while (len) {
> -        stream_desc_load(s, s->regs[R_CURDESC]);
> +        if (MEMTX_OK !=3D stream_desc_load(s, s->regs[R_CURDESC])) {
> +            break;
> +        }
>
>          if (s->desc.status & SDESC_STATUS_COMPLETE) {
>              s->regs[R_DMASR] |=3D DMASR_HALTED;
> --
> 2.34.1
>
>

--000000000000510899061a375b00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jun 4, 2024 at 9:10=E2=80=AFAM Fe=
a.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com">fea.wang@sifive.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Loading a description from memory may cause a bus-erro=
r. In this<br>
case, the DMA should stop working, set the error flag, and return<br>
the failure value.<br>
<br>
When calling the loading a description function, it should be noticed<br>
that the function may return a failure value. Breaking the loop in this<br>
case is one of the possible ways to handle it.<br>
<br>
Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" target=
=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" targ=
et=3D"_blank">frank.chang@sifive.com</a>&gt;<br></blockquote><div><br></div=
><div>Thanks!</div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailt=
o:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></div><div>=C2=
=A0</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0hw/dma/xilinx_axidma.c | 30 ++++++++++++++++++++++++++----<br>
=C2=A01 file changed, 26 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c<br>
index 0ae056ed06..ad307994c2 100644<br>
--- a/hw/dma/xilinx_axidma.c<br>
+++ b/hw/dma/xilinx_axidma.c<br>
@@ -71,8 +71,11 @@ enum {<br>
=C2=A0enum {<br>
=C2=A0 =C2=A0 =C2=A0DMASR_HALTED =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0DMASR_IDLE=C2=A0 =3D 2,<br>
+=C2=A0 =C2=A0 DMASR_SLVERR =3D 1 &lt;&lt; 5,<br>
+=C2=A0 =C2=A0 DMASR_DECERR =3D 1 &lt;&lt; 6,<br>
=C2=A0 =C2=A0 =C2=A0DMASR_IOC_IRQ=C2=A0 =3D 1 &lt;&lt; 12,<br>
=C2=A0 =C2=A0 =C2=A0DMASR_DLY_IRQ=C2=A0 =3D 1 &lt;&lt; 13,<br>
+=C2=A0 =C2=A0 DMASR_ERR_IRQ=C2=A0 =3D 1 &lt;&lt; 14,<br>
<br>
=C2=A0 =C2=A0 =C2=A0DMASR_IRQ_MASK =3D 7 &lt;&lt; 12<br>
=C2=A0};<br>
@@ -190,17 +193,32 @@ static inline int streamid_from_addr(hwaddr addr)<br>
=C2=A0 =C2=A0 =C2=A0return sid;<br>
=C2=A0}<br>
<br>
-static void stream_desc_load(struct Stream *s, hwaddr addr)<br>
+static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct SDesc *d =3D &amp;s-&gt;desc;<br>
<br>
-=C2=A0 =C2=A0 address_space_read(&amp;s-&gt;dma-&gt;as, addr, MEMTXATTRS_U=
NSPECIFIED, d, sizeof *d);<br>
+=C2=A0 =C2=A0 MemTxResult result =3D address_space_read(&amp;s-&gt;dma-&gt=
;as,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 addr, MEMTXATTRS_UNSPECIFIED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 d, sizeof *d);<br>
+=C2=A0 =C2=A0 if (result !=3D MEMTX_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D MEMTX_DECODE_ERROR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_DMASR] |=3D DMASR_D=
ECERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_DMASR] |=3D DMASR_S=
LVERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_DMACR] &amp;=3D ~DMACR_RUNSTOP;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_DMASR] |=3D DMASR_HALTED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_DMASR] |=3D DMASR_ERR_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return result;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Convert from LE into host endianness.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0d-&gt;buffer_address =3D le64_to_cpu(d-&gt;buffer_addre=
ss);<br>
=C2=A0 =C2=A0 =C2=A0d-&gt;nxtdesc =3D le64_to_cpu(d-&gt;nxtdesc);<br>
=C2=A0 =C2=A0 =C2=A0d-&gt;control =3D le32_to_cpu(d-&gt;control);<br>
=C2=A0 =C2=A0 =C2=A0d-&gt;status =3D le32_to_cpu(d-&gt;status);<br>
+=C2=A0 =C2=A0 return result;<br>
=C2=A0}<br>
<br>
=C2=A0static void stream_desc_store(struct Stream *s, hwaddr addr)<br>
@@ -279,7 +297,9 @@ static void stream_process_mem2s(struct Stream *s, Stre=
amSink *tx_data_dev,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_desc_load(s, s-&gt;regs[R_CURDESC]);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MEMTX_OK !=3D stream_desc_load(s, s-&gt;re=
gs[R_CURDESC])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;desc.status &amp; SDESC_STATUS_=
COMPLETE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[R_DMASR] |=3D DM=
ASR_HALTED;<br>
@@ -336,7 +356,9 @@ static size_t stream_process_s2mem(struct Stream *s, un=
signed char *buf,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (len) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream_desc_load(s, s-&gt;regs[R_CURDESC]);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MEMTX_OK !=3D stream_desc_load(s, s-&gt;re=
gs[R_CURDESC])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;desc.status &amp; SDESC_STATUS_=
COMPLETE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;regs[R_DMASR] |=3D DM=
ASR_HALTED;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000510899061a375b00--
