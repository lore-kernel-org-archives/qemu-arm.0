Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp318441njb;
        Thu, 27 Feb 2025 07:55:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzi4Rof3uQhRbzq5Azo68mIy4RASTbvNAYOao0SujZNHGMB6qImP4tGY1qkyyOL5Fx0xqyRDJ0tt4chQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHCPrOtj1gkoG9zgWARcnmHnIlsXl0MiKf4BOhnTFDQ/KbdfqDH/dFr/bp1Vy2EvRPFhPye
X-Received: by 2002:a05:6214:c88:b0:6e6:68d6:3932 with SMTP id 6a1803df08f44-6e88690405amr80086116d6.40.1740671729818;
        Thu, 27 Feb 2025 07:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740671729; cv=none;
        d=google.com; s=arc-20240605;
        b=QGoBlhBaE6zI1JMNmRPTFNduuaY8h+OntLwsv5xz93LXlRm5+cdrh7MKvjA/QFbFrq
         9ho8aJ/xxqpFXeNlPGT/dtIbKUPbNXXMODRZ6J+0rHBYz3sytAeawpatQyzRAgGkybdw
         VDcl4vZOfTle1j0/EadyxFbDNpCoMLW+3PpxYEjQU8tP1vhPDRLf+mmKiraa9WtLvR+o
         eflL5+TjXHtsWsg9NwhjPWzPTvw6dPmpuUbVmxF6LR8B1RERiXG+BdfX7cYs82zDfMtQ
         Ywre8oQZ4Kau1Quk07/9H91qo8VWBZqabr1MWwFxpuTPupU1Kt9Wquzjqpytzv5AhAiI
         ThAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8EBKKc+NGmz+nxKhwxS+ad/54Ly1TceVJMjVayrPz9o=;
        fh=ZTvHbZR2iCke5Bb+4wgDMz6YqFILjX0ysIq95AyJGJ8=;
        b=ao45g3FZRVS8/b6BpC1U83+w2RIQ8Br5TtFF0faAKQnFaCTdPPzSygipvHdI/pcHsl
         Q+92KSj4apnp8WgRGoYQ5dUUqLA1cbgnjjMszoSpP7JZkKjz/qaGqvCzhE+xJij4+nGt
         HHMw2gQcBcwjue7J5MZPqLZYora3ROHIRAWVcrerarPFMHP5rqctgSUzC0zr9Ed1GTfG
         GZtcDYGZtAHfvglN7trWkTS9rrA35XfttZ49OKFXoAaHr3J7ugRA16AN0+0CWDIGjr6v
         J+pDR3BSr4hs25vVfnAUPe+zIExMicIzT+A7mHRtLm4XzFlHodTLsBRa11zNt6oJDgKT
         gMVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bd8T2aue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976cf9c3si14272526d6.301.2025.02.27.07.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 07:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bd8T2aue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngEQ-00016P-Jq; Thu, 27 Feb 2025 10:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tngEO-00011k-Sl
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 10:55:24 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tngEM-0006E2-Qs
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 10:55:24 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-86b31db3c3bso445173241.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 07:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740671721; x=1741276521; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8EBKKc+NGmz+nxKhwxS+ad/54Ly1TceVJMjVayrPz9o=;
 b=bd8T2aueR6H4GjllreJGq2kFUqQAjVlkkMNxu0d7U9sIq2SR1A7jPjitRDfJL8Og/a
 MJhDgQJjERIDgyCwWskGnP6FHbF8Rf0F7l9QxoFt3JqwUksJ9kaNgtBDRx1oiUq21k4n
 aJGnFQ0wyWOpw76iTkHlH8mJcT6AkeD86T8xPhsEgzmNvHcfzqDLt5jhrJ2eEC/wFLNl
 XBTWcXdob4phrJS5GZVC2gicfjhvyaGiiIdD2jjv5G1A94eA9jC+pRmU4OOEMadosDu0
 nghkZhunnItN2K1zusgLofxLLqeUA2G9s+nWT5r0ckSl1xjSKpufdtOZdgZ3vBBuw2Av
 CICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740671721; x=1741276521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8EBKKc+NGmz+nxKhwxS+ad/54Ly1TceVJMjVayrPz9o=;
 b=kczFMMHhYD7JyFn+W+AU4gTBm/jGk/yc2jbnEBrMEqPsgQ+u4XgRIfeDbcP5GSGXTH
 y0oYVmNflNfn7YzthI3OQ6jrJkhd/SJ+SzspPhZCttNdgoIEZrBHYXSSjOtUfzeHnLlW
 FLTF0E4KeCeZTXAZLIM0zDBaBKyzhM8oLZ7HVt5UKM3KsH4hhfLsIw/ARXRqyIsbKD7l
 wewG4dLlGyI6k7SgajWQbp4DH0thjg+nycETlK+Y0/DxJEM8ZI/QbpHc89AXWywEXo9C
 iO4mkl33dI/cHlWVyONob+qIl2mhPaJShN6P71FTjREjWGTxN8rcvMm+CI/JyT9l7ASj
 vvKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCN5wlAByGUwB2q4oUqYBaNDFTtwRWAsM4O9qSUnlg51FAID+WGRc7moeXjutFRfGknE44dPBOaA==@nongnu.org
X-Gm-Message-State: AOJu0YyIyE79Qld+I0w0bNmPvIJRF6Dp+13Tn73RJobflr2Y/YS5MgZr
 WUACyRbqO/VveGGjSfOlcnm6/8frc+Ki1kPNi1g8k12I5K1zeN03K7rhhhvGnNnhRilCEHWsetT
 Ny4hr5EPeLmCzDkpZWKIp4LBfD3r0a1NOak5U
X-Gm-Gg: ASbGncth5p/xEavAinjlGGnrDtUhsued/jAo8wuj7W8Ix4C01GN+hpVLlTJS0RTyJbk
 14gHWlsk249718BvNI+JYWuk7ZF/1iCwomdkwLioM6WFLyskdhOfuhQjl2gulpA256JPb+NP5DN
 nslslAyk2qKFmrb3njy7bgslK9+zAGEVqliH/Yvw==
X-Received: by 2002:a05:6102:c51:b0:4af:c519:4e7f with SMTP id
 ada2fe7eead31-4c01e2cdcc0mr4665692137.18.1740671721447; Thu, 27 Feb 2025
 07:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20250227154003.1646017-1-venture@google.com>
 <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 27 Feb 2025 07:55:09 -0800
X-Gm-Features: AQ5f1JoyLXPKEQiUJVQtJnblaKFmD_s1AoD4Ggsw3T6bH-90WX3XiDL1Kb3Bh9k
Message-ID: <CAO=noty89OsH=vGmemL7eLcR2wV6n4XG9a2HfT7Uzo8EPRy4PQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a12b71062f21b7c6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=venture@google.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: XypGTaQBNfVN

--000000000000a12b71062f21b7c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 7:52=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Thu, 27 Feb 2025 at 15:40, Patrick Venture <venture@google.com> wrote:
> >
> > 'const struct eth_header', which requires 2 byte alignment
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  hw/net/npcm7xx_emc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> > index e06f652629..11ed4a9e6a 100644
> > --- a/hw/net/npcm7xx_emc.c
> > +++ b/hw/net/npcm7xx_emc.c
> > @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc)
> >  static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t
> *buf,
> >                                  size_t len, const char **fail_reason)
> >  {
> > -    eth_pkt_types_e pkt_type =3D
> get_eth_packet_type(PKT_GET_ETH_HDR(buf));
> > +    struct eth_header eth_hdr =3D {};
> > +    eth_pkt_types_e pkt_type;
> > +
> > +    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
> > +           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
> > +    pkt_type =3D get_eth_packet_type(&eth_hdr);
>
> Maybe better to mark struct eth_header as QEMU_PACKED?
> Compare commit f8b94b4c5201 ("net: mark struct ip_header as
> QEMU_PACKED"). The handling of these header structs in eth.h
> is in general pretty suspect IMHO. We do the same
> "get_eth_packet_type(PKT_GET_ETH_HDR(buf))" in other devices,
> so this isn't just this device's bug.
>
> thanks
>

Roger that. We saw this in the two NICs we happened to be testing that day,
and yeah, I grepped and just figured that those other NICs were doing
something with their buffer allocations that we didn't. I'll give
QEMU_PACKED  whirl.


> -- PMM
>

--000000000000a12b71062f21b7c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27,=
 2025 at 7:52=E2=80=AFAM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, 27 Feb 2025 at 15:40, Patrick V=
enture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@=
google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &#39;const struct eth_header&#39;, which requires 2 byte alignment<br>
&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/net/npcm7xx_emc.c | 7 ++++++-<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c<br>
&gt; index e06f652629..11ed4a9e6a 100644<br>
&gt; --- a/hw/net/npcm7xx_emc.c<br>
&gt; +++ b/hw/net/npcm7xx_emc.c<br>
&gt; @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc)<b=
r>
&gt;=C2=A0 static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint=
8_t *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, const char **f=
ail_reason)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 eth_pkt_types_e pkt_type =3D get_eth_packet_type(PKT_GE=
T_ETH_HDR(buf));<br>
&gt; +=C2=A0 =C2=A0 struct eth_header eth_hdr =3D {};<br>
&gt; +=C2=A0 =C2=A0 eth_pkt_types_e pkt_type;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memcpy(&amp;eth_hdr, PKT_GET_ETH_HDR(buf),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(sizeof(eth_hdr) &gt; len) ?=
 len : sizeof(eth_hdr));<br>
&gt; +=C2=A0 =C2=A0 pkt_type =3D get_eth_packet_type(&amp;eth_hdr);<br>
<br>
Maybe better to mark struct eth_header as QEMU_PACKED?<br>
Compare commit f8b94b4c5201 (&quot;net: mark struct ip_header as<br>
QEMU_PACKED&quot;). The handling of these header structs in eth.h<br>
is in general pretty suspect IMHO. We do the same<br>
&quot;get_eth_packet_type(PKT_GET_ETH_HDR(buf))&quot; in other devices,<br>
so this isn&#39;t just this device&#39;s bug.<br>
<br>
thanks<br></blockquote><div><br></div><div>Roger that. We saw this in the t=
wo NICs we happened to be testing that day, and yeah, I grepped and just fi=
gured that those other NICs were doing something with their buffer allocati=
ons that we didn&#39;t. I&#39;ll give QEMU_PACKED=C2=A0 whirl.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- PMM<br>
</blockquote></div></div>

--000000000000a12b71062f21b7c6--
