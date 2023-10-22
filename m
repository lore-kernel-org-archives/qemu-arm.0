Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp724465ejb;
        Sun, 22 Oct 2023 03:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL0Lduw7J6qiI+/GdNIAVqgtst3/3/blWmPjylQjERRx9CBwJvXL+r7lroaN6PN8RMAx91
X-Received: by 2002:a05:622a:1316:b0:410:9af1:f9b2 with SMTP id v22-20020a05622a131600b004109af1f9b2mr9320823qtk.3.1697970170880;
        Sun, 22 Oct 2023 03:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697970170; cv=none;
        d=google.com; s=arc-20160816;
        b=kZLRtFZHTCaTHt9j01yRGXxi8LmsDrBFNn3LM7y2ZtOb+R+dn4cnEkWvwTW/aPkxWE
         xtHBZSeEq2kjLKOtbqGYynVi7jKoHwyBRvhJ7tZyQlEMbJjw0ROvW6EcUwwlsm6ZbwP0
         MZv0maTVa+vj9PkgjCVmfBKWorKFk5fNwHF5eWyqHpY9tDGl1YQfR6huUcPzzyvCPywq
         ejnGyUS5FaAyyRfaadtT6YAdNpVhuCs4Sx2/0Fg0+3u+dKCyNP8wUNEuPrqMujRzk2v7
         qz2ZwTGSe6k0aoHQMEeKMdNtQ5jRKVTyqCYLrvZyzsOFfs7yML/OvM3/bGnZUsqpf/3J
         820w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=D7zvgOly6LMBYYcc1BiE4ZrjS+b/8TNyHgDNDFtUNKk=;
        fh=1eceVEDffC7x4kDR9CKThxsUAxenKt1uXjAgenmwri8=;
        b=wyz4xHQHlu7SaF8soA4GGJlVEPKjVXpblECe5/XaYgOh5fhuswzEblyBP33iZkktT6
         5XNWlhbIetzJEf2bqRXMM8X1jPHbTacH9odNJzD3Y7/PtEeBie02qoY/D6cSE5Gdz0A6
         QUWt4wKPv64IiqE9zp166NNk+oTz0yGtLiG5uoqSBGxBoXszE6aX2hYmGPaOvGUFq3qk
         dZ78PfsfNVavO04cPBj8/toNh6YUebG4lPepJnHj2mFmYI9kqglWqVzejgnU4/Ne/a6N
         1wN1bLo2FmSRiUcmgEKPZkZhcp5qNBKjWyDC6h/U4iilm8Y6FstrXqkizzPqZosvFonB
         VBUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByX1rw7j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05622a1a8b00b0041805eb9513si3928553qtc.31.2023.10.22.03.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 03:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ByX1rw7j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quVbL-0002Zb-Jg; Sun, 22 Oct 2023 06:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1quVbH-0002Wx-2e
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 06:22:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1quVbE-00016q-Rt
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 06:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697970142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D7zvgOly6LMBYYcc1BiE4ZrjS+b/8TNyHgDNDFtUNKk=;
 b=ByX1rw7j8kFQdQ++soSoglYnoArcAGAZewxaQ1aTxQjaRVKxuh/2pDaOiAUabux4nmDlkF
 vSIhcba+NEkAu4sMbkrEVFILwEyQ+YPTq0ddK38JDKaoz8cbHgj1Ra/il5lVnoop3AYgJd
 3UefTMHL+druNOmxByL/jFpMp2s+0hY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-VC390rw-P6esaER29bRBbw-1; Sun, 22 Oct 2023 06:22:18 -0400
X-MC-Unique: VC390rw-P6esaER29bRBbw-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-7a80738ec28so1653452241.0
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 03:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697970138; x=1698574938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7zvgOly6LMBYYcc1BiE4ZrjS+b/8TNyHgDNDFtUNKk=;
 b=oBv4nWXDpQerpr9w/1JMHSs/+i67qeHdjwK6Fp37QX3eUcm9KBdByDsiKriX3DFJb0
 j2huWmVfwDryQR9EijlZRd6MbUMD8bEKiy6XrbWEMIIwRO0a6lpANH/0CfRqkjucYFvL
 NLSPotcBGqktVWfwq0wR0Vd840kw1C6kQsZeaBaQhD6ze/A2EVCBhCbZfoSLkNtrT5RG
 DmGM92s+KPP3cM3njQvt88W2RvDCsaXiyPdJiCqZ3FJCfmAOCg34nTVUKPt7rVhasFjs
 uUH/kCsCm1lpkm7q/GYHJKbVTY71553YVitT3fW28n8mlr7e0b6rtioKpGuvFV4tbPnC
 QGXg==
X-Gm-Message-State: AOJu0YwvFdS7KvNHRONMSW4PvGpEjOnbHiYcEpjExV7+sy2JRWDu1Phy
 D7+6YI65kPnUNDKzEgXrlidhyKa8wg686TGxK7ZKn8MduWl47F1ICk9+7jIy/ZrD1mSQ0nnw6fr
 7DI3E0TQnIgPmhhBsyxrlJWZGSk6F
X-Received: by 2002:a67:b006:0:b0:457:ba55:b913 with SMTP id
 z6-20020a67b006000000b00457ba55b913mr5502769vse.34.1697970138046; 
 Sun, 22 Oct 2023 03:22:18 -0700 (PDT)
X-Received: by 2002:a67:b006:0:b0:457:ba55:b913 with SMTP id
 z6-20020a67b006000000b00457ba55b913mr5502755vse.34.1697970137728; Sun, 22 Oct
 2023 03:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-4-richard.henderson@linaro.org>
 <5f54e3e1-1c90-0249-04f4-df522e292abe@linaro.org>
 <03ba02fd-fade-4409-be16-2f81a5690b4c@redhat.com>
 <4339bf9e-ad25-41b7-91cd-1da8c65d782d@linaro.org>
In-Reply-To: <4339bf9e-ad25-41b7-91cd-1da8c65d782d@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 22 Oct 2023 12:22:07 +0200
Message-ID: <CABgObfaZgav6tGbuykNqtxMezCa7f2Gtzx_ER30upgGUCX7W=Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] target/i386: Use tcg_gen_ext_tl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e629b106084b7a9f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6KZpj3UNwH9K

--000000000000e629b106084b7a9f
Content-Type: text/plain; charset="UTF-8"

Il dom 22 ott 2023, 03:29 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> >   static TCGv gen_ext_tl(TCGv dst, TCGv src, MemOp size, bool sign)
> >   {
> > -    if (memop_size(size) == TARGET_LONG_BITS) {
> > +    if (size == MO_TL) {
>
> Yep.
>
> > I can add it in my x86 series if desirable ...
>
> That's probably fine; you may well get your PR in before my next.
>

I will probably keep only SHA instructions for 8.2 (plus the VEX todos and
the reorganized checks) and delay the rest.

There are a bunch of things I would do in a slightly different manner now,
so it's better to clean up the generic x86 decoder code before implementing
the less orthogonal instruction formats from the one-byte. I should have
time to finish opcodes 0xC0 to 0xFF over the Christmas break in time for
9.0. :)

Paolo



> >>> +    tcg_gen_ext_tl(dst, src, size | (sign ? MO_SIGN : 0));
> >>> +    return dst;
> >>>   }
> >>
> >> While here, I'd rename 'size' -> 'mop'. Regardless,
> >
> > Not sure about that, because "size" should be just the low bits of MemOp
> (the MO_SIGN bit
> > is passed separately).
>
> Agreed.
>
>
> r~
>
>

--000000000000e629b106084b7a9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il dom 22 ott 2023, 03:29 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=C2=A0 =C2=A0st=
atic TCGv gen_ext_tl(TCGv dst, TCGv src, MemOp size, bool sign)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0=C2=A0=C2=A0 if (memop_size(size) =3D=3D TARGET_LONG_BITS) {<br=
>
&gt; +=C2=A0=C2=A0=C2=A0 if (size =3D=3D MO_TL) {<br>
<br>
Yep.<br>
<br>
&gt; I can add it in my x86 series if desirable ...<br>
<br>
That&#39;s probably fine; you may well get your PR in before my next.<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I will=
 probably keep only SHA instructions for 8.2 (plus the VEX todos and the re=
organized checks) and delay the rest.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">There are a bunch of things I would do in a slightly differen=
t manner now, so it&#39;s better to clean up the generic x86 decoder code b=
efore implementing the less orthogonal instruction formats from the one-byt=
e. I should have time to finish opcodes 0xC0 to 0xFF over the Christmas bre=
ak in time for 9.0. :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">P=
aolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 tcg_gen_ext_tl(dst, src, size | (sign ? MO=
_SIGN : 0));<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 return dst;<br>
&gt;&gt;&gt; =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; While here, I&#39;d rename &#39;size&#39; -&gt; &#39;mop&#39;. Reg=
ardless,<br>
&gt; <br>
&gt; Not sure about that, because &quot;size&quot; should be just the low b=
its of MemOp (the MO_SIGN bit <br>
&gt; is passed separately).<br>
<br>
Agreed.<br>
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--000000000000e629b106084b7a9f--

