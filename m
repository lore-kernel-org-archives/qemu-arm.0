Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86368CDB46F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 22:16:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbmwL-0001Jc-Mn; Mon, 22 Jun 2026 18:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imaginos32@gmail.com>)
 id 1wbmw6-0001Ik-EG
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 18:16:14 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imaginos32@gmail.com>)
 id 1wbmw2-0000Ae-VY
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 18:16:09 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c0be5e548a4so429702966b.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 15:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782166563; cv=none;
 d=google.com; s=arc-20240605;
 b=iD0x6imDzlEe1zIGq36aLW+idG5agaTwvkQl3fou8XgyfyLHGuWiCcJC12cQ4anQsa
 VneMte6lRIQBz5ZjOylNNRubhsUaBUMFX463QlNqnv9zqzIXbnfvIZVAqUxgcyzWBZD3
 sL/NxMEfT3AZZlzAh3S2XtCXSPPIX/b4447hFsspgFdWz0wMMETL9OSLX+dpYd7m34NJ
 JnwQTLBkqo/ZNzl1DxiHljJXftwivhNrZLueMC6fXSppxHotjIJaZNHIPUVlBlCZI1eH
 Nyo/azVXccZbeU7LnwT8HUJNs4lwlKghYCYdKdUBKZfTh94PMUIfiSU15UF9o71i71i2
 0NHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OQXbCbpfsYPqXGbCWEVREiTQC3eFwyHDe4DLtDdCi4s=;
 fh=Y0e+zEoJWFixHp26KYezDr0HAwPIKh/2vIxfc9Nk0gE=;
 b=eoP5PopX68fXWJix6oQ+BSodOCNA0gsIIZlc7VnCwtgs1myjfq4lNV8jAa+fCldLT3
 JgwJ5R8dC8DjK4A1mo1DzwH9yiu1GjT6q3jC7xhAO1IKuY/8r/eYySzBjxAgj8wlyqmW
 PHDd29o+EbNSqfzWHLuxW7n4l95gppk4tz2i+MeP18mj/ZnYxMDMdblvptA9Ljk3BIz6
 FWMvTKyHZajdA88NdzKd8jFxNUNrgYMuJQPJbdlrJz45RVqBwter5qvWXQqYcsYtUpeW
 tTzQRak164aESyHZGqmv+iOsRRymcbnFvo1sGcZ9T09y69hAwivcpa4K0gSx2xi9GXta
 sddw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782166563; x=1782771363; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OQXbCbpfsYPqXGbCWEVREiTQC3eFwyHDe4DLtDdCi4s=;
 b=Uj86YpBAPwW2jxo6XPLeTWDXe+pAr5xwWYQesUi8Ha409xhQ2/6Hz/xphHK0bcMFRV
 OSrfhVGJcr3gtjQSFtysgjGocKTdHC9EG+iqk+YqHenjU1+nI+diy2k7zQ6dSoMoSetF
 caToXCqnQPOY0J834/kI/zqKNKAyT6+GZCxfADX3HrXoPwDecxyRa0tFWbO90qSypph+
 7wk1Ab4eqF3uoe77BSddyCiRJuW2GvcSbeGXeZOrrMtIYnvJ2ublmZzRdLipLZpjpw9A
 Jzb4N3ShfXqVcU3tcrDi8J8YMMisiFxpJdfJKbKJjMm/rzNUU7VyfJHTex/d4QzLDhWQ
 /fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782166563; x=1782771363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQXbCbpfsYPqXGbCWEVREiTQC3eFwyHDe4DLtDdCi4s=;
 b=sHmMky+UV7dndZR6ae7aPD4x90VyDDCS9MQIuP9HAsJfVEwoQlE4fdhJR4jjJJQG/B
 r2lkcYwAGobCfzGtzz9bXCJAhYkpQqBf+4RCT4P9+TzAm1jX0B1F9dEK6gqxbb2ufph8
 5Ptfm5cTWYqU7VzIJ2Ay9TZ1uZAqOvxcL+cqdVSfwiXbaBTUWa8NH++dqaxvbtz3O8JB
 cIZAh8pc+GXOAOILFw0sjA2aAaUH7+d4KmcjSgS1bRKq24WH3HLD5AWA9aMRp/BF/BrY
 iMDXOC3UF2XOAlFit8VxBiZPzy0WCKmlEGT0RYMTGzo5vnB3TjcPH2xXV0yqN2rMlyG5
 1Ofw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Jjdbc3s8pQsmDoWKEyr5bC17C/DNwKL0QYkNOuccsFVyPiys8S/lBcQ34+UxX0OzPo7fcQKCUrg==@nongnu.org
X-Gm-Message-State: AOJu0Yx9C/iAc17rSjc+b+EyVbIFmAuK93JS5nm4RzlJb2iRr8mmxbGy
 hn5Af6X9uJnVg9WkcUjUQdI8UHb8RYkqHlDBEjx4Sz7GAXmb1WCfaaKAnVqiA+QEaZK/ym73WFt
 RccahEiBVj7QKNFa3WxaxAmnO5qe/f3o=
X-Gm-Gg: AfdE7cnQX+WNFUVbHrha6NOoi0cKitZMAx7HmyLNFjaahpjK7vB0yFABbDQAGx2By85
 Z2/a+Ul0yuZDvZZVGm5fDHpmVQDYKEuJ+YwvzeSF9jameO1FbRamcsXhxn7s94pFiPRI3St704h
 CYoz+EIWxfFPV5VyTv1ZT4zJi05aBi4QmdY/Yab+/x7G870pYpfTqhmtVX51askn1mJpS1BGCBp
 itHbDhYpmeLrlsTQI30F2mCVLOCq3u31woN9gjAoOWeg3vbAE7ErQUgcMC8XV3xML9/ZiotBg==
X-Received: by 2002:a17:907:c445:b0:c07:6950:4490 with SMTP id
 a640c23a62f3a-c097caca21amr761497366b.42.1782166563117; Mon, 22 Jun 2026
 15:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260614222131.5795-1-imaginos32@gmail.com>
 <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
In-Reply-To: <CAFEAcA-GGP6aALn4Az5By31q1R3d75Mm+p_YXN0y=tO3GxDYrg@mail.gmail.com>
From: Imaginos <imaginos32@gmail.com>
Date: Tue, 23 Jun 2026 00:15:51 +0200
X-Gm-Features: AVVi8CeSouwMjmSuFc9S2hvR2Vz7Z8NRL9AV9-5KAy1BtimiO21yR_S64c1T5xs
Message-ID: <CAFxqGk98dEmAhebozRPMhZGwv9RRC7Yt4=rOeKPq2R95bXtDXg@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: pmbus: NUL-terminate strings received via block
 write
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ecdd9c0654defcdf"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=imaginos32@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000ecdd9c0654defcdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for catching that. I went through the repro myself and arrived at
the same root cause,
but I missed that the original report's description of it was inaccurate
and should have flagged that.
Thanks for the review, I appreciate you taking the time to look into it.

=D0=BF=D0=BE=D0=BD, 22. =D1=98=D1=83=D0=BD 2026. =D1=83 12:18 Peter Maydell=
 <peter.maydell@linaro.org> =D1=98=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:

> On Sun, 14 Jun 2026 at 23:22, imaginos <imaginos32@gmail.com> wrote:
> >
> > The PMBus string registers (e.g. MFR_MODEL on the ADM1266) are writable
> > by the guest. pmbus_receive_block() can fill the destination field
> > completely, leaving no NUL terminator. When the value is later read bac=
k,
> > pmbus_send_string() calls strlen() on it, which reads past the end of t=
he
> > array and returns a length that trips
> >
> >     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> >
> > aborting QEMU. This is guest-triggerable.
> >
> > Add pmbus_receive_string(), the write-side mirror of pmbus_send_string(=
),
> > which reserves the last byte of the destination so the stored value is
> > always NUL-terminated, and use it for the ADM1266 MFR string registers.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3388
> > Signed-off-by: imaginos <imaginos32@gmail.com>
>
> Thanks for looking at this. Notably, the bug report in #3388 makes
> a completely incorrect claim about what its repro case is actually
> doing. The repro case does the "write 32 bytes to trash the NUL
> terminator, then try to read back", which is what this patch addresses.
>
> I'll let the pmbus maintainers review the patch from a technical
> point of view.
>
> -- PMM
>

--000000000000ecdd9c0654defcdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for catching that.=C2=A0<span style=3D"background-c=
olor:transparent">I went through the repro myself and arrived at the same r=
oot cause</span><span style=3D"background-color:transparent">,=C2=A0</span>=
<div><span style=3D"background-color:transparent">but I missed that the ori=
ginal report&#39;s description of it was inaccurate and should have flagged=
 that.=C2=A0</span></div><div><span style=3D"background-color:transparent">=
Thanks for the review, I appreciate you taking the time to look into it.</s=
pan></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BE=D0=BD, 22. =D1=98=D1=83=D0=BD =
2026. =D1=83 12:18 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro=
.org">peter.maydell@linaro.org</a>&gt; =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Sun, 14 Jun 2026 at 23:22, imaginos &lt;<a href=3D"m=
ailto:imaginos32@gmail.com" target=3D"_blank">imaginos32@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; The PMBus string registers (e.g. MFR_MODEL on the ADM1266) are writabl=
e<br>
&gt; by the guest. pmbus_receive_block() can fill the destination field<br>
&gt; completely, leaving no NUL terminator. When the value is later read ba=
ck,<br>
&gt; pmbus_send_string() calls strlen() on it, which reads past the end of =
the<br>
&gt; array and returns a length that trips<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_assert(len + pmdev-&gt;out_buf_len &lt; SMBUS_DAT=
A_MAX_LEN);<br>
&gt;<br>
&gt; aborting QEMU. This is guest-triggerable.<br>
&gt;<br>
&gt; Add pmbus_receive_string(), the write-side mirror of pmbus_send_string=
(),<br>
&gt; which reserves the last byte of the destination so the stored value is=
<br>
&gt; always NUL-terminated, and use it for the ADM1266 MFR string registers=
.<br>
&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/338=
8" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/3388</a><br>
&gt; Signed-off-by: imaginos &lt;<a href=3D"mailto:imaginos32@gmail.com" ta=
rget=3D"_blank">imaginos32@gmail.com</a>&gt;<br>
<br>
Thanks for looking at this. Notably, the bug report in #3388 makes<br>
a completely incorrect claim about what its repro case is actually<br>
doing. The repro case does the &quot;write 32 bytes to trash the NUL<br>
terminator, then try to read back&quot;, which is what this patch addresses=
.<br>
<br>
I&#39;ll let the pmbus maintainers review the patch from a technical<br>
point of view.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000ecdd9c0654defcdf--

