Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp331494njb;
        Thu, 27 Feb 2025 08:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrjPamzmCKgdI1V0JMt7mFVZX52WWKkDQP4Q+QvHnXCgzAMyDUTVkDBdp0GumdCOqIxz/pgeQI4rJ7UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEOoeC9lfx/CnpNewNGoeToTQRoMmBL60/l7QHn6HmyanTulylUA+yqaYowh9r8d3apv/cP
X-Received: by 2002:a5d:6d08:0:b0:38f:4fa6:68df with SMTP id ffacd0b85a97d-390d4fa3b5emr7278291f8f.51.1740672613636;
        Thu, 27 Feb 2025 08:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672613; cv=none;
        d=google.com; s=arc-20240605;
        b=OGOu/3Ez6KORLKOYMOzqxPxbNaoYEMWKf5sKkAQzNAVkHjaXlrJBP2+sMhsT02urVN
         1fuXjRNWbKGnf24F5xb/h6uuvFl6f/qrXzYeF8w6FYgpZztztdB5+SMM8Obi+cu82NVc
         UvRtb2i1qFG66G7dkwkwetVa1v+EiM/188zDpaQNtE74Q9gwfAqe7df4e6sE+wX9j1Pd
         V2Iui/bFFTZE9Xjijo9/0UjmBVjK7REFSOAC47IwSdORY0viNAtJfBeNoEgJyg5PY5+m
         ucK7AP3vGRDtu3/uODFhgbwK++SCft8yJffGfZ3ULxvKAKBOc3lK/HJn8/f90kNmIFlP
         Zicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LucYlR7wGBOJBB79VNJsJIy+ebAKyb8vWkC9gTxKADU=;
        fh=gwxZSgUmUmAUGxw5Vsc0kMHlMkqhhjIlDeimk4jVuIo=;
        b=E+MR7D8Y4qsFczN67FXqzFmCjhhS9eLYULGnO1BDVlNU5Tf5GwNIhHfLimubCVObN4
         j6ujQEJytWU+D39bU0y6treMxypF9HgKMTDueF01z1FBwqDwnLZ3w+1Uv36FzI+Puv6r
         lf7BEN55VUJTsuLUy5wustrMhUHl49M4iyeN3FDuf4co9ACcL0b8iYa+25P2zfNslx5o
         0cw4Jl//Eq5LLHkSWZdWGfDjFc8iYfI4IXqj+7ljUVqmHuSV8JbGq30yYOgXvThJj3lO
         tgliJQzcz4mGwBRvd9UEdogA/GPHjX52ZDzgmqKIoi7FdK02g6BksbO//H/8pQMmZgnr
         Rupw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="tQEG/9Wd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-390e47f8197si1275292f8f.403.2025.02.27.08.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:10:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="tQEG/9Wd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngRL-0000NN-SL; Thu, 27 Feb 2025 11:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tngQv-0008RC-L5
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 11:08:23 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tngQs-0000Dc-IK
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 11:08:21 -0500
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7c08b14baa9so97945085a.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 08:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740672493; x=1741277293; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LucYlR7wGBOJBB79VNJsJIy+ebAKyb8vWkC9gTxKADU=;
 b=tQEG/9WdqJN5JGmqEvs0/V3I8Do6TffAUkSPKpem6PnvEf9mU8/8iQIDdTaJp+FkEg
 LlZ0OqSNzA7ZKsnSRPU8EPA29tzmiulwutswNC/ASwQCNyjsVbmHGKEEnucwLDspUWBp
 A3GgWSgpKeOdrMsmmGp5GgjtYUrS9Z7vkX71b9G8G2G71/g0eM9nuK5qYabxxZNZgWGQ
 Wf+XGXuR5uUKrzwRFTAjZiiLW3E34saYXY8U3l989bqCS0zMKXomUtRUr5o4FY8xgYlD
 fY4r/IHGzO+9XOv6UWWdOJOGyReQsn8WuVymVMmrQ9FZy9BWB8E8uWdQ6GxrY80fxqpi
 /8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740672493; x=1741277293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LucYlR7wGBOJBB79VNJsJIy+ebAKyb8vWkC9gTxKADU=;
 b=rJc/BYVLlWcJXDVR7rPv6QD9gfRfJ4NuuNCiitzEBSYVQqwbHtpmwoCzGratw1hvmy
 42rkXSQ/AhR3xGi062lxDgbycM6mQRUa+Y5K8gOuRE2qM2vzX8W3PPEJoAchCE/ceesw
 kcIa0iBlHRdJdptjB1Z4IpqoqDa+XxaC2AxMtNZgN4tnC1hzsg8l1pbJkrxG7Aiq0tC5
 dau5VBd9ga81Kis0TCZYP6o/Bxp+t1pf57UJPiEf6rAHa0LiqdRnHU0tB2NUALnoZnHI
 j6PZW5mRgTxymuJ1t0xdNV/z/ulpNdF9ydJTIjsPF3R9rWOwS4Ruq8LNX6SDSpAJwvIR
 Fodg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbFxCk9rekaiMIiz3y9WK9TfdJrcHGiBWignLJmsaT5D/K0tRjdBUnNJploUPiQZUAhQnscc/LMw==@nongnu.org
X-Gm-Message-State: AOJu0YxSYqwcSg+Swnaf/+aTfco/h/nV4WgnsUzSFR4z+EkcrgOACLLn
 6uATabJsv99VwJjJzrnvWzwQiPWzZLixobaecDfQbe2Um3Ml1KxAVdLG1wwb49jdtORuy/2C0gB
 rz2KleQucKFH9jDxUR3px9X+9YWSdCgKE0m4y
X-Gm-Gg: ASbGncuSRpnfNLlHGF5+NvNHiEpAciLGJZIlLstaF7JynaL2n89yddyoa5qWdOODhZX
 IgC41ovKLjRNfZsiikA6wSafuT45bisxRpK0fMNvVAMgQ5dCvuzX43lS9klrfNC6rsS1HXJyCZq
 quXweVJmk/qW7UcBX1Mzd4glXwcPssKkHHEiURJw==
X-Received: by 2002:a05:620a:450a:b0:7c0:9df3:a0d7 with SMTP id
 af79cd13be357-7c23c039803mr1779508485a.41.1740672493256; Thu, 27 Feb 2025
 08:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20250227154003.1646017-1-venture@google.com>
 <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
 <CAO=noty89OsH=vGmemL7eLcR2wV6n4XG9a2HfT7Uzo8EPRy4PQ@mail.gmail.com>
 <CAFEAcA-gyMTz-KpmamyXcKX9QOL=yYHDMPRF2Xji_uJbG02WpA@mail.gmail.com>
In-Reply-To: <CAFEAcA-gyMTz-KpmamyXcKX9QOL=yYHDMPRF2Xji_uJbG02WpA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 27 Feb 2025 08:08:01 -0800
X-Gm-Features: AQ5f1JrEwx0ajtKdC1OwMVLACziYm9s_oiSxA8Tkx4sf6DvrX9OLlG1rT-OXiU4
Message-ID: <CAO=notwcXTU9v4c_Hz=Si=QLrM5HNymYEO0ry4Td30GYUZqBwg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a26448062f21e571"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=venture@google.com; helo=mail-qk1-x72d.google.com
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
X-TUID: FZcgwYl5gn/C

--000000000000a26448062f21e571
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:01=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Thu, 27 Feb 2025 at 15:55, Patrick Venture <venture@google.com> wrote:
> >
> >
> >
> > On Thu, Feb 27, 2025 at 7:52=E2=80=AFAM Peter Maydell <peter.maydell@li=
naro.org>
> wrote:
> >>
> >> On Thu, 27 Feb 2025 at 15:40, Patrick Venture <venture@google.com>
> wrote:
> >> >
> >> > 'const struct eth_header', which requires 2 byte alignment
> >> >
> >> > Signed-off-by: Patrick Venture <venture@google.com>
> >> > ---
> >> >  hw/net/npcm7xx_emc.c | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> >> > index e06f652629..11ed4a9e6a 100644
> >> > --- a/hw/net/npcm7xx_emc.c
> >> > +++ b/hw/net/npcm7xx_emc.c
> >> > @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc)
> >> >  static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t
> *buf,
> >> >                                  size_t len, const char **fail_reaso=
n)
> >> >  {
> >> > -    eth_pkt_types_e pkt_type =3D
> get_eth_packet_type(PKT_GET_ETH_HDR(buf));
> >> > +    struct eth_header eth_hdr =3D {};
> >> > +    eth_pkt_types_e pkt_type;
> >> > +
> >> > +    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
> >> > +           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
> >> > +    pkt_type =3D get_eth_packet_type(&eth_hdr);
> >>
> >> Maybe better to mark struct eth_header as QEMU_PACKED?
> >> Compare commit f8b94b4c5201 ("net: mark struct ip_header as
> >> QEMU_PACKED"). The handling of these header structs in eth.h
> >> is in general pretty suspect IMHO. We do the same
> >> "get_eth_packet_type(PKT_GET_ETH_HDR(buf))" in other devices,
> >> so this isn't just this device's bug.
>
> > Roger that. We saw this in the two NICs we happened to be testing that
> day, and yeah, I grepped and just figured that those other NICs were doin=
g
> something with their buffer allocations that we didn't. I'll give
> QEMU_PACKED  whirl.
>
> You might find you need to make some fixes to other
> devices to get the QEMU_PACKED change to compile (do an
> all-targets build to test that). For instance for the
> ip_header change I had to first fix virtio-net.c in commit
> 5814c0846793715. The kind of thing that will need fixing is
> if there are places where code takes the address of the
> h_proto field and puts it into a uint16_t* : the compiler
> will complain about that. A quick grep suggests that the
> rocker_of_dpa.c code might be doing something like this, but
> hopefully that's it.
>

Thanks for the head's up.

>
> thanks
> -- PMM
>

--000000000000a26448062f21e571
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27,=
 2025 at 8:01=E2=80=AFAM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, 27 Feb 2025 at 15:55, Patrick V=
enture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@=
google.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Feb 27, 2025 at 7:52=E2=80=AFAM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org<=
/a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 27 Feb 2025 at 15:40, Patrick Venture &lt;<a href=3D"mailt=
o:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;const struct eth_header&#39;, which requires 2 byte alig=
nment<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@=
google.com" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 hw/net/npcm7xx_emc.c | 7 ++++++-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c<br>
&gt;&gt; &gt; index e06f652629..11ed4a9e6a 100644<br>
&gt;&gt; &gt; --- a/hw/net/npcm7xx_emc.c<br>
&gt;&gt; &gt; +++ b/hw/net/npcm7xx_emc.c<br>
&gt;&gt; &gt; @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientSta=
te *nc)<br>
&gt;&gt; &gt;=C2=A0 static bool emc_receive_filter1(NPCM7xxEMCState *emc, c=
onst uint8_t *buf,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len, const =
char **fail_reason)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 eth_pkt_types_e pkt_type =3D get_eth_packet_ty=
pe(PKT_GET_ETH_HDR(buf));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 struct eth_header eth_hdr =3D {};<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 eth_pkt_types_e pkt_type;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 memcpy(&amp;eth_hdr, PKT_GET_ETH_HDR(buf),<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(sizeof(eth_hdr) &g=
t; len) ? len : sizeof(eth_hdr));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 pkt_type =3D get_eth_packet_type(&amp;eth_hdr)=
;<br>
&gt;&gt;<br>
&gt;&gt; Maybe better to mark struct eth_header as QEMU_PACKED?<br>
&gt;&gt; Compare commit f8b94b4c5201 (&quot;net: mark struct ip_header as<b=
r>
&gt;&gt; QEMU_PACKED&quot;). The handling of these header structs in eth.h<=
br>
&gt;&gt; is in general pretty suspect IMHO. We do the same<br>
&gt;&gt; &quot;get_eth_packet_type(PKT_GET_ETH_HDR(buf))&quot; in other dev=
ices,<br>
&gt;&gt; so this isn&#39;t just this device&#39;s bug.<br>
<br>
&gt; Roger that. We saw this in the two NICs we happened to be testing that=
 day, and yeah, I grepped and just figured that those other NICs were doing=
 something with their buffer allocations that we didn&#39;t. I&#39;ll give =
QEMU_PACKED=C2=A0 whirl.<br>
<br>
You might find you need to make some fixes to other<br>
devices to get the QEMU_PACKED change to compile (do an<br>
all-targets build to test that). For instance for the<br>
ip_header change I had to first fix virtio-net.c in commit<br>
5814c0846793715. The kind of thing that will need fixing is<br>
if there are places where code takes the address of the<br>
h_proto field and puts it into a uint16_t* : the compiler<br>
will complain about that. A quick grep suggests that the<br>
rocker_of_dpa.c code might be doing something like this, but<br>
hopefully that&#39;s it.<br></blockquote><div><br></div><div>Thanks for the=
 head&#39;s up.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000a26448062f21e571--
