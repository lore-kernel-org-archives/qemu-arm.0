Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF74BC83F1A
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 17:58:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueHG6-0004LH-21; Tue, 22 Jul 2025 13:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueGwR-0000sh-2A
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 13:38:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueGwN-0000D9-MM
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 13:38:14 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MF9J5I013299
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 17:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fWiNpI4sQ9CEWLe68Mec0P4x
 7LZOJJJIxJQ/jJX/Eb8=; b=inRcUpKeU10RjLfn2CIhdINmBrm/ORDdazZlU1yc
 6Rw1B04BxYhglc39Q3D0ND6a+3DXf/TdbGwrHGasrTWBk+xO5vH+ewkPjtYVMJt4
 rc34e8FNoHYwGxzXLYP/sa9tn/a6gFkODoVtNjI2qv3ZR8vCYdaU4R2VPYN8nOCy
 oLMGN15GgLF1H5fe8vlLklGGyfz5qCuW70TffTq+8JWsstnuoxcBQmW1fiIrnyu5
 JLcJx7M8+G5l5ka3ENh875C7cExiaPwgsHhLOVaro68Tv9+T7tmUtfRHNsGNV5Hv
 WSQgJySoCsw3ilrT2HfZwGTYb9G/45lSwnk6H5CV10xBIw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3en5sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 17:38:09 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7183fd8c3cfso92200167b3.0
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 10:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753205888; x=1753810688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fWiNpI4sQ9CEWLe68Mec0P4x7LZOJJJIxJQ/jJX/Eb8=;
 b=NGguLBBGudwOGVAx1XiUH2TDj+1L/hV9Kh1FR3G8vCO2W87/bMbJpqn2A1XPjDjBMk
 XGqZ86IMUo7V6WASW/I4gFF+hVhwjr1BzRt+rMhyCcrbt4EIwHj1uByyF/wa08D82A+Y
 ceMfKtxt+4yRG2ueL90m1/DODTkCs/wlJqYKI39sYvXiLd21i308AXqMqOIBw/yHO3BO
 61G5FXDhvFXiCjpY58JPUGfGTjLc1UKbqvQIvfy4Z5cw6PVR9ioyFj/OGsHbgU2awta/
 kCYiQ6CaC+flGORRs9EveBpzJW6AHJ7BXpjiNmVwTXSut16b1cW6OMRaaL6kTWBA7iNS
 4cHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR4jsqttKiM5hyLdUNJRF8iI3pXVh2WcI0sxSs8MnqB9ni0cL72GY82LUcFjLqNoPk7pN/qfZUtg==@nongnu.org
X-Gm-Message-State: AOJu0YyySsIV9v/2RkeHfAZQFXeMA9RJiz82w+GX8ThEzSjIU6tYN2kw
 nPfoaM715cjW3VQBW99rr9zfGGAVAMZdkl58Unu4a6DLq3emP59K2AJ/RnnuMZe5be8Wjrzx1Nq
 FxlO2ewUNcBr7qmdbeB4qeoer0wrsJGpL9DGd5aTWsweOlgJtWEbCm2/U9SK2MA/bUzLjns7FtS
 LzFEzkTrY/Xr+sdX1Pnh6hmcS8nEGp6A==
X-Gm-Gg: ASbGncssqK01LO4rD9uv+48zfEVZF+Jym5U6ixC6hR931UuH9yMJhglG2NXnuD4gHZB
 hCms8psgovPW560CGyYopUQU+oba+F5pPcTiNYV24rTihAFuGB/EK1Rl03fZQfQp2jqktUXjRUj
 lrRJnVsKJQfflwW2i+KipJBA==
X-Received: by 2002:a05:6902:200d:b0:e8b:bece:b4c5 with SMTP id
 3f1490d57ef6-e8dc594c716mr178282276.20.1753205888092; 
 Tue, 22 Jul 2025 10:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr1T3FG7yfXPc2hnG4rIvPII63tndvYhJZAVvN8Bq83na/KVspVrNaKPVcbVQpesWQNK0/uZ6eST5dqrlqRH0=
X-Received: by 2002:a05:6902:200d:b0:e8b:bece:b4c5 with SMTP id
 3f1490d57ef6-e8dc594c716mr178254276.20.1753205887546; Tue, 22 Jul 2025
 10:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250721211952.2239714-1-vacha.bhavsar@oss.qualcomm.com>
 <20250721211952.2239714-2-vacha.bhavsar@oss.qualcomm.com>
 <9eeee985-0df8-4e88-8ebc-00e20399fe95@linaro.org>
In-Reply-To: <9eeee985-0df8-4e88-8ebc-00e20399fe95@linaro.org>
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 13:37:56 -0400
X-Gm-Features: Ac12FXxH0ESnt3iQzTvPpDTAcad2G5Si_vyDaIPxXz6PvLF01GTcYg6M63-9I0c
Message-ID: <CAEWVDmsJPq47pZgwXRZzhwQYgkuUQn4ZHWk8X36S0Fzk-tz=yQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Fix big-endian handling of NEON gdb
 remote debugging
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000025505c063a880e1f"
X-Proofpoint-ORIG-GUID: NEtDT9xLWUgKK13jI5O97rHSFxxweAG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE0OSBTYWx0ZWRfXxDZqnIT/hrry
 O9owZSmWJX1PMqEbMrAaLrD7efBSfKI5D5jqo7YGHryslyMIodRj+nm6UTwEgjIcP3Woe5Mp08j
 KIfOwQeZlah9oO4QMUfVNWVZjSfMkgCJQfFh3f+z42QXSp14ilAlIpOQ1KYTmnET99PFkb+Hx5/
 B7PiJui+UePDjbxFW8wNhluyOh2YniMfoDlMnUljfsP656ZWnnJcriEgFyPLGrnKdCjDHFby5Mu
 oymxeokdhQALLFqM8fUHCrTJIDS9MysqqfTGqKZaeAxIQgjzsgxfZpMeCXr9T1huqOOvmE06fUO
 v+0J4GZfTpriqY+fPTuVJKM+Sm0tDbn4k4e8xY78JuulL957qAQyCjiV/IeBHPudoDmxGRcJbv8
 Mm9JynYOvIwieT1xQDpu26KZ/LSrxS/G5YL7jTGxhpY4JGse5Q1PoBLZAZVuV/T5PEeYHbBW
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687fcc81 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=W__LxpSxGxo44iX2rtMA:9 a=QEXdDO2ut3YA:10
 a=FL2y2Ow5dUcLyCVka2oA:9 a=x0wGDgfKR-FBRejI:21 a=lqcHg5cX4UMA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NEtDT9xLWUgKK13jI5O97rHSFxxweAG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=856 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220149
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000025505c063a880e1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

Noted! Edits have been made and another version sent over.

Thanks,
Vacha

On Tue, Jul 22, 2025 at 2:05=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi,
>
> On 21/7/25 23:19, Vacha Bhavsar wrote:
> > This patch adds big endian support for NEON GDB remote
> > debugging. It replaces the use of ldq_le_p() with the use of ldq_p() as
> > explained in the first part of this patch series. Additionally, the
> order in
> > which the buffer content is loaded into the CPU struct is switched
> depending
> > on target endianness to ensure the most significant bits are always in
> second
> > element.
>
> This patch description is what will be committed in the git history.
>
> What do you mean by "as explained in the first part of this patch
> series"? This is already the first patch of the series. The "series"
> notion will be lost in the git history, so we don't understand what
> you meant / referred to.
>
> Anyway, maybe the description can be simplified as:
>
> "Check target endianness and always store the most significant bits
>   in the second element."
>
> > Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> > ---
> >   target/arm/gdbstub64.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> > index 64ee9b3b56..8b7f15b920 100644
> > --- a/target/arm/gdbstub64.c
> > +++ b/target/arm/gdbstub64.c
> > @@ -115,8 +115,16 @@ int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t
> *buf, int reg)
> >           /* 128 bit FP register */
> >           {
> >               uint64_t *q =3D aa64_vfp_qreg(env, reg);
> > -            q[0] =3D ldq_le_p(buf);
> > -            q[1] =3D ldq_le_p(buf + 8);
> > +
> > +            if (target_big_endian()){
> > +                q[1] =3D ldq_p(buf);
> > +                q[0] =3D ldq_p(buf + 8);
> > +            }
> > +            else{
>
> Per our docs/devel/style.rst:
>
>                 } else {
>
> > +                q[0] =3D ldq_p(buf);
> > +                q[1] =3D ldq_p(buf + 8);
> > +            }
> > +
> >               return 16;
> >           }
> >       case 32:
>
>

--00000000000025505c063a880e1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Philippe,<div><br></div><div>Noted! Edits have bee=
n made and another version sent over.</div><div><br></div><div>Thanks,</div=
><div>Vacha<br><table cellpadding=3D"0" style=3D"font-family:&quot;Google S=
ans&quot;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:14px;bord=
er-collapse:collapse;table-layout:fixed;width:805.365px"><tbody></tbody></t=
able><table cellpadding=3D"0" style=3D"border-collapse:collapse;margin-top:=
0px;width:auto;font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helve=
tica,Arial,sans-serif;font-size:14px;display:block"></table></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, J=
ul 22, 2025 at 2:05=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"m=
ailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 21/7/25 23:19, Vacha Bhavsar wrote:<br>
&gt; This patch adds big endian support for NEON GDB remote<br>
&gt; debugging. It replaces the use of ldq_le_p() with the use of ldq_p() a=
s<br>
&gt; explained in the first part of this patch series. Additionally, the or=
der in<br>
&gt; which the buffer content is loaded into the CPU struct is switched dep=
ending<br>
&gt; on target endianness to ensure the most significant bits are always in=
 second<br>
&gt; element.<br>
<br>
This patch description is what will be committed in the git history.<br>
<br>
What do you mean by &quot;as explained in the first part of this patch<br>
series&quot;? This is already the first patch of the series. The &quot;seri=
es&quot;<br>
notion will be lost in the git history, so we don&#39;t understand what<br>
you meant / referred to.<br>
<br>
Anyway, maybe the description can be simplified as:<br>
<br>
&quot;Check target endianness and always store the most significant bits<br=
>
=C2=A0 in the second element.&quot;<br>
<br>
&gt; Signed-off-by: Vacha Bhavsar &lt;<a href=3D"mailto:vacha.bhavsar@oss.q=
ualcomm.com" target=3D"_blank">vacha.bhavsar@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/arm/gdbstub64.c | 12 ++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c<br>
&gt; index 64ee9b3b56..8b7f15b920 100644<br>
&gt; --- a/target/arm/gdbstub64.c<br>
&gt; +++ b/target/arm/gdbstub64.c<br>
&gt; @@ -115,8 +115,16 @@ int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t=
 *buf, int reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 128 bit FP register */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *q =3D =
aa64_vfp_qreg(env, reg);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q[0] =3D ldq_le_p(buf);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q[1] =3D ldq_le_p(buf + 8);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (target_big_endian()){<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q[1] =3D ldq_=
p(buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q[0] =3D ldq_=
p(buf + 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else{<br>
<br>
Per our docs/devel/style.rst:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q[0] =3D ldq_=
p(buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q[1] =3D ldq_=
p(buf + 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 16;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case 32:<br>
<br>
</blockquote></div>

--00000000000025505c063a880e1f--

