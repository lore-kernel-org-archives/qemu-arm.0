Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5632BCD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 16:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ9qC-0000F1-U9; Mon, 15 Jun 2026 12:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wZ9qA-0000E8-NO
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:07:10 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wZ9q7-0002YF-D7
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:07:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-68b90fc6a1dso6918109a12.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 09:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781539619; cv=none;
 d=google.com; s=arc-20240605;
 b=UerUVoI8Tnjky5R3B0Belq4SOZlvvb8xdYedT1AYrRX81nFLf+P6RDPUAp3F/jSwKu
 cDSBovgZAxwsAGNxKIMuk30iNBzSExdmcQ543b1uEbcuzJlERy1iHIeU4sOJeMBOeeu2
 qjKORK7z0KFt0MVsAPhjK/OBsWGcJpS7fQdc8+lFjPXsf/XFmowoKVzltDVJMJuzJWY9
 rDdz7HpXpDMao3RMaCsnMK6Uea3UP5MORYi1gNtM/ZX2VG8Vk87udaLlmcTHL2a09eU0
 LA7RqpMMdzsP1l3gIY+IMF0IukCSvdfHGgn7XKiOZH2i+JOUh4f4lNda9d9XUGiq/XoG
 wMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=v/aLiSpOIgRbsoG4t+R1WSLW/n+T/PPMj19sdMGx/BY=;
 fh=o/HV4MQAaIfn2WVN2goL6fnEFkn/PIl7WQ1+9WU/3w8=;
 b=DgnWHTlxDNUNTKSpHk5hGdJwFKovn2nkMx9m/PyB08nhSCGAtqld88jKmxvfXGYtKS
 ufovv8ifimPHLevqHVqhkD13qas2d3JX6DpMy7b16J+8ZiULWl/YjvHIvL1hn2lWMNsm
 eLYZ8UkcgWR5drtdf0uZoQQWZeDsgzn41QDU1NP9bRMBCiOajX7YZSjtpMWy+6vlyCiw
 XVdTg0u5emxJu622tmT7Asf3FdKiq1Sw83j6Jr+1Kv23o53GwrDjC1Ms7FrySVPzQAGi
 Sibalgo2dqDhOPlufzVfC5KREn0H7HJjF3R5sRMZw2viDCOlo7SGE/gsTvhUmTVuGH9r
 FE+w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1781539619; x=1782144419; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v/aLiSpOIgRbsoG4t+R1WSLW/n+T/PPMj19sdMGx/BY=;
 b=LrctmDzEsUD4whiHSVyQXW9LEPrAyWwTeZhH83O2w/AJctNAC3pMx05K5/TgqDqBnc
 PvBT6z6wz56q9u4bNx5RvfY3dwJu1ZWk0Qinwc7F19OfWfQUHFPPCk0uTnPR6W9OWKvn
 YdaqrXl14rq8zw53Q/CASajwslZFFltwjg5oPohExfL0MEd+6B8nVvWf4hSekqw8aWiH
 Kq1JO1TN1pNLMLwASivIWCaXnZEYmpM9gB0budGLl0Xw/OWRGfBS8JWxMrZXo6FktHYW
 Ci/HfknNsHswQgHwLeRMwiZGL62TN8AV77zM7Zjz4wyoKeOslbISjoPYUKYCjkRCG6j0
 hE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781539619; x=1782144419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/aLiSpOIgRbsoG4t+R1WSLW/n+T/PPMj19sdMGx/BY=;
 b=VCm5OG9ol28EHQe/J7J80Y7HSLw9aLBklwtXC4xE05icGuVNq4/xED82rh0VV48Upm
 zdBh+9P4Yk1qFhHX01NSLt+IOAr4/Pu//MALjShf9VcBuFZnk6Ny5Xgv89APTGAAfc64
 LH88AseO+lXPYy5iKf9ROHgb/+e29sKEzJ4XpwueV5ow4AsTmhkP3PRVDs8gez4NIZ/9
 Ek8M7hHJrIBHQmDHb1me4sG4YFU5zpJfF5Gy/ACCz8kBOlPn6Nx8AsMs2wXoIfnXObNG
 JSXSQu/6P0blV1Xp3iDQs/gIF1Y5bbSKHfhBtoZt7TzrU/dcpOvtL3Ez0jFLZm3dVovE
 cmEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wH6b4nf+bobQtWvs1LyJOMddKjt0gAtql68/RFPgjdOqomRk9FzyO2/OAA/KR+y7H0nRb5tdNNA==@nongnu.org
X-Gm-Message-State: AOJu0Yw11iUVDIB5e+JLpchvq8t6I8hNMIqcJ/jVWyV829/CRNIlSfdD
 kViqmPN1aMBZO6h1CpV0cGfST+1SZWEbiD12kTnWgyRLJhDSSKK0XtTSsW+2tPFhH1hLcX50D1T
 J92Huw/s4K98UTKot/nCqGqSa9fasTfdR7p+UpMQutQ==
X-Gm-Gg: Acq92OH9jbgI5+Uxk4gq/r8vTnnF1ICK//Jq5DSmkkFQBLm0+AAKxl1l+bmZ926yJJe
 EujyvxDZ19omVFwpM2odanq/brlnHWwvuYC/RtV5VJK7+e16FVADSnBDjaBkS2jsLE81or22iju
 dMI4ms1IcN2nSURSswNRV3KjhwdUV3EzESx5gcS4E/9tNw7CRdEZBzNkfivLnol8vITpFwPVzxU
 VlQTPRcpcsOG6eJn1Z8Jr9cp9koVeFCIKBtKG/SUlu3npLZlqcvkBJDGM9mHQUz7jaWt4enFBF5
 n32U0BSrZzf0y8qT1g==
X-Received: by 2002:aa7:c6d6:0:b0:67b:7e7a:45ed with SMTP id
 4fb4d7f45d1cf-695081b7dc1mr56819a12.6.1781539618710; Mon, 15 Jun 2026
 09:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260612-i2c-adc128d818-anacapa-v1-0-9e4640cd164b@meta.com>
 <cce4022e-70dc-4da4-9a9f-b234f1cc0484@kaod.org>
In-Reply-To: <cce4022e-70dc-4da4-9a9f-b234f1cc0484@kaod.org>
From: Alexander Hansen <alexander.hansen@9elements.com>
Date: Mon, 15 Jun 2026 18:06:46 +0200
X-Gm-Features: AVVi8CeeWJRaDvhNgeK21meEGMYj3RquxyhsNWBCqHDd2NclPeMAL9oTsFJLNOw
Message-ID: <CAEr1sMs=D=5navFJbMzhd9Av5OZ9qtBTy1b=jcRzS=-r777K4g@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/sensor: Add new device emulation for TI ADC128D818
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Emmanuel Blot <eblot@meta.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, William de Abreu Pinho <williampinho@meta.com>,
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000207b0f06544d0426"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alexander.hansen@9elements.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000207b0f06544d0426
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cedric,

I would agree that Emmanuel has the better version for ADC128D818 and we
should go ahead with that one.
Will not push my version anymore so it should not appear in the next
patchset..

I did find some time to test his version on anacapa qemu today and also
tested it from the hmp side to modify the properties.
Overall I could not find any functional gaps and the tests are looking
quite good too.

Alexander

Am Sa., 13. Juni 2026 um 19:07 Uhr schrieb C=C3=A9dric Le Goater <clg@kaod.=
org>:

> On 6/12/26 18:46, Emmanuel Blot wrote:
> > This is a 12-bit, 8-channel ADC I2C device, which is used on several
> > OpenBMC platforms.
> >
> > QOM properties can be used to change input ADC values and external VREF
> at
> > run time.
> >
> > Add it to AST2600-based Anacapa machine, along with some functional tes=
ts
> > that use QOM properties to inject voltage values into analog inputs.
> >
> > Datasheet: https://www.ti.com/lit/gpn/ADC128D818
> >
> > Signed-off-by: Emmanuel Blot <eblot@meta.com>
> > ---
> > Emmanuel Blot (4):
> >        hw/sensor: adc128d818: add 12-bit 8-channel ADC device
> >        tests/qtest: adc128d818: add test suite
> >        hw/arm: anacapa: add ADC128D818 devices
> >        test/functional: anacapa: test ADC128D818
> >
> >   hw/arm/Kconfig                              |   1 +
> >   hw/arm/aspeed_ast2600_anacapa.c             |  19 +-
> >   hw/sensor/Kconfig                           |   4 +
> >   hw/sensor/adc128d818.c                      | 703
> +++++++++++++++++++++++
> >   hw/sensor/meson.build                       |   1 +
> >   hw/sensor/trace-events                      |   8 +
> >   include/hw/sensor/adc128d818.h              |  12 +
> >   tests/functional/arm/test_aspeed_anacapa.py |  92 ++-
> >   tests/qtest/adc128d818-test.c               | 855
> ++++++++++++++++++++++++++++
> >   tests/qtest/meson.build                     |   1 +
> >   10 files changed, 1688 insertions(+), 8 deletions(-)
> > ---
> > base-commit: 193963218accbcf65f28ab1efa773ac6d1cc634c
> > change-id: 20260612-i2c-adc128d818-anacapa-13c63e97fbd0
> >
> > Best regards,
> > --
> > Emmanuel Blot <eblot@meta.com>
> Alexander,
>
> This proposal offers significant advantages over your v6.
>
>   - instead of adc128d818_init_with_values, it uses QOM properties for
>     run time values.
>   - reset is better
>   - unit tests
>
> This implementation seems a better foundation. If you agree, could
> you please take some time to review it ? Given your expertise, you
> seem to be the best person for it.
>
>
> Thanks,
>
> C.
>
>

--000000000000207b0f06544d0426
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Cedric,<br><br></div>I would a=
gree that Emmanuel has the better version for ADC128D818 and we should go a=
head=C2=A0with that one.<br></div>Will not push my version anymore so it sh=
ould not appear in the next patchset..<br><br></div>I did find some time to=
 test his version on anacapa qemu today and also tested it from the hmp sid=
e to modify the properties.<br></div>Overall I could not find any functiona=
l gaps and the tests are looking quite good too.<br><br></div>Alexander</di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Am Sa., 13. Juni 2026 um 19:07=C2=A0Uhr schrieb C=C3=A9dr=
ic Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/12/26 18:46, Em=
manuel Blot wrote:<br>
&gt; This is a 12-bit, 8-channel ADC I2C device, which is used on several<b=
r>
&gt; OpenBMC platforms.<br>
&gt; <br>
&gt; QOM properties can be used to change input ADC values and external VRE=
F at<br>
&gt; run time.<br>
&gt; <br>
&gt; Add it to AST2600-based Anacapa machine, along with some functional te=
sts<br>
&gt; that use QOM properties to inject voltage values into analog inputs.<b=
r>
&gt; <br>
&gt; Datasheet: <a href=3D"https://www.ti.com/lit/gpn/ADC128D818" rel=3D"no=
referrer" target=3D"_blank">https://www.ti.com/lit/gpn/ADC128D818</a><br>
&gt; <br>
&gt; Signed-off-by: Emmanuel Blot &lt;<a href=3D"mailto:eblot@meta.com" tar=
get=3D"_blank">eblot@meta.com</a>&gt;<br>
&gt; ---<br>
&gt; Emmanuel Blot (4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/sensor: adc128d818: add 12-bit 8-channel=
 ADC device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/qtest: adc128d818: add test suite<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/arm: anacapa: add ADC128D818 devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 test/functional: anacapa: test ADC128D818<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed_ast2600_anacapa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
&gt;=C2=A0 =C2=A0hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<b=
r>
&gt;=C2=A0 =C2=A0hw/sensor/adc128d818.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 703 +++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0hw/sensor/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 =C2=A0include/hw/sensor/adc128d818.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +<br>
&gt;=C2=A0 =C2=A0tests/functional/arm/test_aspeed_anacapa.py |=C2=A0 92 ++-=
<br>
&gt;=C2=A0 =C2=A0tests/qtest/adc128d818-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 855 ++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A010 files changed, 1688 insertions(+), 8 deletions(-)<br>
&gt; ---<br>
&gt; base-commit: 193963218accbcf65f28ab1efa773ac6d1cc634c<br>
&gt; change-id: 20260612-i2c-adc128d818-anacapa-13c63e97fbd0<br>
&gt; <br>
&gt; Best regards,<br>
&gt; --<br>
&gt; Emmanuel Blot &lt;<a href=3D"mailto:eblot@meta.com" target=3D"_blank">=
eblot@meta.com</a>&gt;<br>
Alexander,<br>
<br>
This proposal offers significant advantages over your v6.<br>
<br>
=C2=A0 - instead of adc128d818_init_with_values, it uses QOM properties for=
<br>
=C2=A0 =C2=A0 run time values.<br>
=C2=A0 - reset is better<br>
=C2=A0 - unit tests<br>
<br>
This implementation seems a better foundation. If you agree, could<br>
you please take some time to review it ? Given your expertise, you<br>
seem to be the best person for it.<br>
<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
</blockquote></div>

--000000000000207b0f06544d0426--

