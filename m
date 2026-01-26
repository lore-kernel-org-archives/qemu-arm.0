Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2C7D1951B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 21:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkTuR-0007rM-Ai; Mon, 26 Jan 2026 16:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saadelhrj@gmail.com>)
 id 1vkREU-0005Qh-Og
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 13:22:38 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <saadelhrj@gmail.com>)
 id 1vkRES-0008A8-Tv
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 13:22:38 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7d148db5fdcso1637938a34.3
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 10:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769451755; cv=none;
 d=google.com; s=arc-20240605;
 b=TlMp/Mmnr6lcf/WWP8T7jl9Fqs5V0RumMXxg+ZpSsIN98/IQnwqz7q7E8SfUnRdi02
 /cNuQmBKpE+0+FM2OGtOfISvdXb39n4hCTJd8xBlktlOW1bGLKVMy4CLtwHnurWR+sZx
 S0L0X/WzU8g2bcoAuRWFKw8GpzQ6rWpH/+UlnHRKxmA2Fjto5IT9bKGuAVbRXJNbGCK8
 3qO/YNG/FBKchW8UBBVnjttVWc0++W4IibKq+pKzjN/jkzfCEaBwn21c8SEx7zGOljHr
 en3ZAHFU4dlj4I0TuPCQqy/M72AiQlNIQkXpRQ9MDcTzAYLrXxqbpEKX+Hd8pWTb4RL8
 hufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fswWPBsFWO3y9n1YM1dD4iY9Ks7jeVptAMymTmFkGvA=;
 fh=yYbd8+1gQc7CyNNKcRT5llUJ0QtGzAdARXOYAswdxQ8=;
 b=d2XkAYqkrygDAApfmm3FHHMcZoe+Xps/twPCTvYd8LEztr1qIE34+x33NYCijOg/ZU
 qa0P45CaKSbq/ZHG9lCT0CyVYkVjIIRXcMNm6ZwfQsHSQuVxmorpaE2HneNOjs3BpasD
 9b4iy1r7d2iZWXYp4aqW+A7OayUoPowNDiNDHoPtI7xbOx6qmF+FBA7MbrlTJmvHqi9Z
 00ACChg8YD1B/BlDiWHGdcErBlqz3dWza93TaxZ7JTgoSocltN+ua6u6RnlmixSuRf2Y
 h3rUd5pA+iOAATj3QZeZD2acTccaULfHDXAQGn99FOO3lAQzQWmwlQB/nbPvir6hQjA4
 ZZFw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769451755; x=1770056555; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fswWPBsFWO3y9n1YM1dD4iY9Ks7jeVptAMymTmFkGvA=;
 b=AENrjtn9oRWuMvvrV3Vuk+p3wakHv3w56tQ0mldZXB2aCZMT+xo60JYl+cFOhhCbsD
 dBjaDRPCXPCTdxITtzfKleu0TSW20CfGvPVl933hufrLuIgdHNFkpPHPIGBpG50HMJrh
 uLhQsypRtrvy4J5IdvR5pVs9gkovtbJa57vFLuGLCwUs3mJ6rX2GDG3qg7Wl/saUqU/x
 D602Scv1GYI5LaUwdd1DxW2WkMhSLEVW0gHxMlejIEE2pjn36HGGuMwURC3DuZhgIHBS
 tSCFRqr4kVAEJzGwd+NTNDG3/PnqHQFJyJxVz0Y5s6BrLmzl+to1Z8sE11972qD7FRVE
 etqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769451755; x=1770056555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fswWPBsFWO3y9n1YM1dD4iY9Ks7jeVptAMymTmFkGvA=;
 b=epVCHYRlbKdT5gtUF67trfKd5MUDE/pMzBwNgB5+NFElcvYIFePqf/Hxg9Iy/zwSKW
 eSZR+9VEihA7IsQikGSSLLMBhpzbQI8rWtndfHAlPq/O52PuqdHCROpA7H9Kk+Fbq7kd
 84dxCPbUXw712waNsmSAyFV5BTN/bdMnMqzecQwCWUIB7dQQntWHjCRhlqk5ZvbLdAbm
 L3akMBZINjOLLix1k3Y+uuTZwvT5A3Y+JePT9087Lq+cQ8NTMDN9M2S0KTuVxikLVvnV
 joT1St1wtTaUjOMUBN+7mqwpYBXVjpbNLbQpG9uXW1mHBRTLSvbJ6SNRYvXCq7EW3q/V
 9r4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnqaEFOEzRdpbyd0o6j8MrM2AL47FhF7jX3RPTPIVT4Sj7H5aZlf4e4IiC7KYqG5f2iVNDwsH+PA==@nongnu.org
X-Gm-Message-State: AOJu0YymQOcfSwi2TOVj2vyXDvd6tccFLuz/sSpwmZDq3Onc41AGREb+
 wDpyBGHgxWXQwUS7vXXfbo/uhsvcHhcDUNOTQvVzCSxKQZCK77uisSvPP93TdGYIkqUVuU41VFx
 BucKBtVaVw4rYPOaC+kGBzLBZiG7LtvA=
X-Gm-Gg: AZuq6aKQbwwO9ddb9WHd83vT3fPTA4NCYhsrhSWAN4DiH0GEHurQQo3YALf7BSU3fMh
 dDG/Oo+/SqeP2ZSPLNC6Q6n13BEKKJbSqdAuSwKzmVM3XokIK+aaVu9F2mM3XW8AobOb/tuC9yG
 hKmNLwXpfGfP1k4mSJ6f/ftElzgVSwhaRmNZOyg8u5F+mKOhfEcin4c+OZZPcMWrTkHd6NWPShu
 LFnTRdSuI+JdoKvagfp42oU6fi0Gh+KayxhsDuvWIAS7cVwSEWOoSKT+AIKFZsR/ulWIfZb
X-Received: by 2002:a05:6830:270c:b0:7ca:c723:6f42 with SMTP id
 46e09a7af769-7d17021d855mr2179910a34.10.1769451755010; Mon, 26 Jan 2026
 10:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20260126141820.719492-1-clg@redhat.com>
 <CAFEAcA8xQmUa7DyR7+Nw255e_DW=uzZ-gQT5G6cd-uuWgQBaUg@mail.gmail.com>
 <e8a6032d-cf06-46e5-a7d5-c2e9b8d248ef@redhat.com>
In-Reply-To: <e8a6032d-cf06-46e5-a7d5-c2e9b8d248ef@redhat.com>
From: Elhrj Saad <saadelhrj@gmail.com>
Date: Mon, 26 Jan 2026 19:22:23 +0100
X-Gm-Features: AZwV_QhI0Afqqax5fCh11L7zMDvn9tUSDcLBowLyYFTZkpaqhcQ8gA5Ws_4w0qM
Message-ID: <CAEEWBQPci_=gDhJS8m7erJeYu7C4-eioD0ks=_WReFQiOVDNiw@mail.gmail.com>
Subject: Re: [PATCH] hw/adc: Fix out-of-bounds write in Aspeed ADC model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: multipart/alternative; boundary="0000000000004dfcc106494e971c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=saadelhrj@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Jan 2026 16:14:06 -0500
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

--0000000000004dfcc106494e971c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, gentlemen,

Is there any possibility of making an exception and assigning a CVE for the
issue ?? (It's my first ever found vulnerability :)

Thank you in advance.


On Mon, Jan 26, 2026 at 4:12=E2=80=AFPM C=C3=A9dric Le Goater <clg@redhat.c=
om> wrote:

> On 1/26/26 15:30, Peter Maydell wrote:
> > On Mon, 26 Jan 2026 at 14:18, C=C3=A9dric Le Goater <clg@redhat.com> wr=
ote:
> >>
> >> The 'regs' array has ASPEED_ADC_NR_REGS (52) elements, while the
> >> memory region covers offsets 0x00-0xFC. The aspeed_adc_engine_write()
> >> function has an out-of-bounds write vulnerability when accessing
> >> unimplemented registers.
> >>
> >> Fix this by using 'return' instead of 'break' in the default case,
> >> which prevents execution from reaching the s->regs[reg] assignment for
> >> unimplemented registers.
> >>
> >> Reported-by: Elhrj Saad <saadelhrj@gmail.com>
> >> Fixes: 5857974d5d11 ("hw/adc: Add basic Aspeed ADC model")
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> >
> > Seems like a good candidate for Cc: qemu-stable@nongnu.org ?
> Yes.
>
> Cc: qemu-stable@nongnu.org
>
> Thanks,
>
> C.
>
>

--=20
*Saad ELHARAJ*
Cybersecurity Specialist
=F0=9F=93=9E +212 6 80 51 11 85
=E2=9C=89=EF=B8=8F saadelhrj@gmail.com
=F0=9F=94=97 LinkedIn <https://www.linkedin.com/in/saad-elharaj-1891371a0/>

--0000000000004dfcc106494e971c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, gentlemen,</div><div><br></div><div><div dir=
=3D"auto">Is there any possibility of making an exception and assigning a C=
VE for the issue ?? (It&#39;s my first ever found vulnerability :)</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thank you in=C2=A0advance.</div>=
<br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 26, 2026 at 4:12=E2=80=AFPM C=
=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@redhat.com">clg@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 1/26/26 15:30, Peter Maydell wrote:<br>
&gt; On Mon, 26 Jan 2026 at 14:18, C=C3=A9dric Le Goater &lt;<a href=3D"mai=
lto:clg@redhat.com" target=3D"_blank">clg@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; The &#39;regs&#39; array has ASPEED_ADC_NR_REGS (52) elements, whi=
le the<br>
&gt;&gt; memory region covers offsets 0x00-0xFC. The aspeed_adc_engine_writ=
e()<br>
&gt;&gt; function has an out-of-bounds write vulnerability when accessing<b=
r>
&gt;&gt; unimplemented registers.<br>
&gt;&gt;<br>
&gt;&gt; Fix this by using &#39;return&#39; instead of &#39;break&#39; in t=
he default case,<br>
&gt;&gt; which prevents execution from reaching the s-&gt;regs[reg] assignm=
ent for<br>
&gt;&gt; unimplemented registers.<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Elhrj Saad &lt;<a href=3D"mailto:saadelhrj@gmail.com"=
 target=3D"_blank">saadelhrj@gmail.com</a>&gt;<br>
&gt;&gt; Fixes: 5857974d5d11 (&quot;hw/adc: Add basic Aspeed ADC model&quot=
;)<br>
&gt;&gt; Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@red=
hat.com" target=3D"_blank">clg@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Seems like a good candidate for Cc: <a href=3D"mailto:qemu-stable@nong=
nu.org" target=3D"_blank">qemu-stable@nongnu.org</a> ?<br>
Yes.<br>
<br>
Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stable=
@nongnu.org</a><br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><strong>Saad ELHARAJ</strong><br>
Cybersecurity Specialist<br>
=F0=9F=93=9E +212 6 80 51 11 85<br>
=E2=9C=89=EF=B8=8F <a href=3D"mailto:saadelhrj@gmail.com" target=3D"_blank"=
>saadelhrj@gmail.com</a><br>
=F0=9F=94=97 <a rel=3D"noopener" href=3D"https://www.linkedin.com/in/saad-e=
lharaj-1891371a0/" target=3D"_blank">LinkedIn</a> <br></div></div>

--0000000000004dfcc106494e971c--

