Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp415785njb;
        Thu, 27 Feb 2025 10:13:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXgdi/y2+vY83YsIK7n49A4wt+UoAzaUAH35QYgHql6gthoWUHCDxLP3IVSA1i6zQpPL0upCEUN/pX2A==@linaro.org
X-Google-Smtp-Source: AGHT+IH/nsHvbmx7h65dncQlGd/O/rfyssMK6r31QS20vlpxxJ66p2QyaRNtMY7wumRRs7d2VhLp
X-Received: by 2002:a05:622a:a19:b0:471:fb5f:4393 with SMTP id d75a77b69052e-472228c8d61mr339245311cf.22.1740680003402;
        Thu, 27 Feb 2025 10:13:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740680003; cv=none;
        d=google.com; s=arc-20240605;
        b=ISV078hZjwKJ/M+37ini67v+k4skSo4dcrCKNFHFVvO2ZPiYXVM/ClpHRSSPxoeIzj
         YjJ3o4wQY704KkgM8pOK0UWx5WsQ8TS/LGer4yDB6Xche0aV3bi5m0ectt/v8fEiwdSA
         OcnMdeXvcZUuwjqRpgQcVJG+HC+wKWB1dA+dllMpd1hu+84BrQdrj9PlZYizEysfO/Ha
         fPL1piptW22vS3xnEH13cTvNmzbfBBOWeJl0IVn6DktnB46OT7GBqbt3uQfKoylO5BHA
         fuhb8Jh1owo2S8wKK0lKerpKjd48UsuAdLWslLYYzRJPd0IMjMg99yDvsT63JO15pERB
         Fkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2MLgPcoWN1rjM+lw/xMIBwTa10ujDuMKXxMFFUlvkoE=;
        fh=11AwYAEVMx9yJbh19Alu46J8NF0mU50oAWZIRlp1N0g=;
        b=ZWkqK/bfO/LUPqmDJ8KP93Va8/ISGjUck5vdUYIqQNytW4So2d1TmAr+NsplBWzLzd
         W6QHv1wej67lUkkrrZ6EsgftwIbcmqgvCS1v8etecX/tonvB9EaVKNNbjg3SR1OhzB7q
         NKkEu38zixVIhB8NJeiMiY6bqSZEm+ud1XnW/HVjrbCtQMkv+B1oWYWHtki174xhN7/0
         mEkr+9Ul5ufu7uoXO2rHjg5Kj1TPN1GNhSDI+WT1jzO6ftDaFOO7x0AlLwYT176Zcttk
         TSN2AKiKUzQ+OX304w71e1MT83LtfDDtQHd/Byx4ewuESfiTEjwpVL15W/KKGbmXJGXA
         GLzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pNfQ9l5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240dda6si16623971cf.452.2025.02.27.10.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 10:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pNfQ9l5a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tniNc-00015b-Ih; Thu, 27 Feb 2025 13:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tniNH-00013m-6L
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 13:12:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1tniND-0006p9-4M
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 13:12:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38f378498b0so999751f8f.0
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 10:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740679955; x=1741284755; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2MLgPcoWN1rjM+lw/xMIBwTa10ujDuMKXxMFFUlvkoE=;
 b=pNfQ9l5as9G0OmDmC3YRhbAmYbCsmQFtyxWL5DC0KZDhXlxp9FcIJDqRKQG14Ea2D1
 kaRb8MeknKKhyW61nYjR+hVKyykCQwD+xbYoOILxAM9T5U5NMtrlXc/krH4ZMxM4VRNi
 NB0I45nGjFoOGTYeWHMnSXAiW99lRo977N1MFxo6LP/TFJJm9538KJLBvzmX/8zIp4pr
 Mu2l5CGHdN6Kus2XBlKBOqPEbke0jKldOy87JCGGWTdEyKRoDIY93SNMU7Bz9CHBtDaL
 lXh1crpolpJZo+aYSi8pCgezjyaSROQ58Af4fS+9Kcw4JYY/OwDb2261rndQMlKG2i9x
 WtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740679955; x=1741284755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2MLgPcoWN1rjM+lw/xMIBwTa10ujDuMKXxMFFUlvkoE=;
 b=w3/BWErmfydBIzWkjmZF8nvTce2DesS4iqoPxf6N/8M1Na9VAJd6OL7uJvMn7y3uQx
 9QyFszYMZBmbHmJcAh1rI2eJlQFwiJhkS5FJ+67+Fqbgh7Z9Gx3GD82yseftYBD1nqCp
 Vqd7qgOY1d1azOqeGboOpsnOtngUmE3FtOSWTStYLDW6HcPcjIdav9uchIY03pgOgOCG
 a3+ksyBNccJzfCyPQV+fJ8/0QUNS/kaS+zdC4WKPuiqSGdnJPY2SiASdvbPFfbOEpjx0
 yKpYjHRi4QLLMALPwto6dTfOzAkjZ1Z0tuINF5O4YEe255A4xvN75m/C1FMZhrmFqqQs
 6Jpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgm0y5OVJ6rgZKvhPg9PTvXqvihFMBnP9cGZ+NjLtHUSoM3Y2Emqkyw7ymo0tuVN4eGXsVFDyeXw==@nongnu.org
X-Gm-Message-State: AOJu0YyJMmylDpfkG0TmUlE/aGt+/LbgNVEO7TlHRlgKns+CSY4Scey+
 4Bpodvb6+9X32vKjVmFKMlFeKw//ow/oZX88czU2VsoiWk3MWyEEJ2gN4X0xbfDF00gx8WhIyup
 fMajNQMm5ziUYQsSSKqHN8dOYiv6VXbKTGbgf
X-Gm-Gg: ASbGncsF0bcsSD8mr4fB9SK3p2nYf/fnVY728ZKd2TJV64mMBmChsjck9rNvXP2J/U6
 +BmUwyakCIFDdIWwYZHUQUwccYdfA7WBYfBIsJPKQbLLvCQZQoPWgpkg6vR1MiBfDeRwRNjxH4X
 6AZOG+xx0ggOgZJ5l0BfzJki+ppEg+WM9Z6FIBEg==
X-Received: by 2002:a5d:47cd:0:b0:38d:e481:c680 with SMTP id
 ffacd0b85a97d-390ec9bb569mr160835f8f.18.1740679955448; Thu, 27 Feb 2025
 10:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20250227154003.1646017-1-venture@google.com>
 <CAFEAcA_wR-M3+BhZY0MFjv3OfoyL2gvukduvKZ6ksKwUKmdB6Q@mail.gmail.com>
 <CAO=noty89OsH=vGmemL7eLcR2wV6n4XG9a2HfT7Uzo8EPRy4PQ@mail.gmail.com>
 <CAFEAcA-gyMTz-KpmamyXcKX9QOL=yYHDMPRF2Xji_uJbG02WpA@mail.gmail.com>
 <CAO=notwcXTU9v4c_Hz=Si=QLrM5HNymYEO0ry4Td30GYUZqBwg@mail.gmail.com>
In-Reply-To: <CAO=notwcXTU9v4c_Hz=Si=QLrM5HNymYEO0ry4Td30GYUZqBwg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 27 Feb 2025 10:12:21 -0800
X-Gm-Features: AQ5f1JpSRxJEd2_mP2Yj6ogaXvr7U2RsJigm3QDaHwaF3Ll7AJu6RDsk-6BUC3s
Message-ID: <CAO=notxXT3m26=GxryTwJSqLQBfxrCCXV9ffdBGdYokxxnHz=A@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000069fe6f062f23a29e"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=venture@google.com; helo=mail-wr1-x42a.google.com
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
X-TUID: Wfi799gF1Cb+

--00000000000069fe6f062f23a29e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:08=E2=80=AFAM Patrick Venture <venture@google.com=
> wrote:

>
>
> On Thu, Feb 27, 2025 at 8:01=E2=80=AFAM Peter Maydell <peter.maydell@lina=
ro.org>
> wrote:
>
>> On Thu, 27 Feb 2025 at 15:55, Patrick Venture <venture@google.com> wrote=
:
>> >
>> >
>> >
>> > On Thu, Feb 27, 2025 at 7:52=E2=80=AFAM Peter Maydell <peter.maydell@l=
inaro.org>
>> wrote:
>> >>
>> >> On Thu, 27 Feb 2025 at 15:40, Patrick Venture <venture@google.com>
>> wrote:
>> >> >
>> >> > 'const struct eth_header', which requires 2 byte alignment
>> >> >
>> >> > Signed-off-by: Patrick Venture <venture@google.com>
>> >> > ---
>> >> >  hw/net/npcm7xx_emc.c | 7 ++++++-
>> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
>> >> > index e06f652629..11ed4a9e6a 100644
>> >> > --- a/hw/net/npcm7xx_emc.c
>> >> > +++ b/hw/net/npcm7xx_emc.c
>> >> > @@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc=
)
>> >> >  static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_=
t
>> *buf,
>> >> >                                  size_t len, const char
>> **fail_reason)
>> >> >  {
>> >> > -    eth_pkt_types_e pkt_type =3D
>> get_eth_packet_type(PKT_GET_ETH_HDR(buf));
>> >> > +    struct eth_header eth_hdr =3D {};
>> >> > +    eth_pkt_types_e pkt_type;
>> >> > +
>> >> > +    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
>> >> > +           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
>> >> > +    pkt_type =3D get_eth_packet_type(&eth_hdr);
>> >>
>> >> Maybe better to mark struct eth_header as QEMU_PACKED?
>> >> Compare commit f8b94b4c5201 ("net: mark struct ip_header as
>> >> QEMU_PACKED"). The handling of these header structs in eth.h
>> >> is in general pretty suspect IMHO. We do the same
>> >> "get_eth_packet_type(PKT_GET_ETH_HDR(buf))" in other devices,
>> >> so this isn't just this device's bug.
>>
>> > Roger that. We saw this in the two NICs we happened to be testing that
>> day, and yeah, I grepped and just figured that those other NICs were doi=
ng
>> something with their buffer allocations that we didn't. I'll give
>> QEMU_PACKED  whirl.
>>
>> You might find you need to make some fixes to other
>> devices to get the QEMU_PACKED change to compile (do an
>> all-targets build to test that). For instance for the
>> ip_header change I had to first fix virtio-net.c in commit
>> 5814c0846793715. The kind of thing that will need fixing is
>> if there are places where code takes the address of the
>> h_proto field and puts it into a uint16_t* : the compiler
>> will complain about that. A quick grep suggests that the
>> rocker_of_dpa.c code might be doing something like this, but
>> hopefully that's it.
>>
>
Ok, so digging, and I see that vlanhdr is used similarly in the
rocker_of_dpa.c code, so, without trying to bit off the yak shave of fixing
all ethernet headers, but in reality ethernet packets are packed
structures, should we just make them all packed and bite that bullet?


>
> Thanks for the head's up.
>
>>
>> thanks
>> -- PMM
>>
>

--00000000000069fe6f062f23a29e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27,=
 2025 at 8:08=E2=80=AFAM Patrick Venture &lt;<a href=3D"mailto:venture@goog=
le.com">venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb=
 27, 2025 at 8:01=E2=80=AFAM Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 27 Feb 20=
25 at 15:55, Patrick Venture &lt;<a href=3D"mailto:venture@google.com" targ=
et=3D"_blank">venture@google.com</a>&gt; wrote:<br>
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
hopefully that&#39;s it.<br></blockquote></div></div></blockquote><div><br>=
</div><div>Ok, so digging, and I see that vlanhdr is used similarly in the =
rocker_of_dpa.c code, so, without trying to bit off the yak shave of fixing=
 all ethernet headers, but in reality ethernet packets are packed structure=
s, should we just make them all packed and bite that bullet?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"></blockquote><div><br></div><div>Thanks for the head&#39;s up.=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000069fe6f062f23a29e--
