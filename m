Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B6C43458
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Jul 2026 19:54:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1widmN-0000L6-Pf; Sat, 11 Jul 2026 15:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harsh.prateek.bora@gmail.com>)
 id 1wiba1-00024C-0a
 for qemu-arm@nongnu.org; Sat, 11 Jul 2026 13:33:33 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <harsh.prateek.bora@gmail.com>)
 id 1wibZz-0006q9-8h
 for qemu-arm@nongnu.org; Sat, 11 Jul 2026 13:33:32 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c15e0c3f395so227930666b.3
 for <qemu-arm@nongnu.org>; Sat, 11 Jul 2026 10:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783791209; cv=none;
 d=google.com; s=arc-20260327;
 b=Q3sWyrOTNWMdh5ZJngtn7tN89uQRfRgt7pH2J8Hx2Xk+RclJfdDNHNtTPIB7O7cctj
 kZ71xTOPBcQKzu1uLMgeyByqusum5tAEWuZhoynyzAqUv4g8SZwhtUUpQ2AZkLyNE4iY
 A4DzWZ8XsBQ9BiZrhK4Y65vYP7ivvxBlSuJ3uz88xYOXT9DhF1uOFQPnx200rQNRMaNq
 1uOHPnc+nwynl539K9N/Ig1p7VoBW5r6rkanM+dJmylv5mjf0XZg0PfBhQfp8eJU6mC8
 0d7+L6U95bj5ih5kWGDswD6rEnrB6dmrHoze4OjjAhVwRmrH9y9OEx9nBe3Vnfr37Wpy
 R68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JS3CKX8TG+RSRMmVQSeQiQae+JhkZskL580Opidbw14=;
 fh=72dMuQ1ZSCmzC4eTmwF8HwOyP82zFXNKFWpX7qYL0lg=;
 b=hU4OzjaGhxFhQyXIT1JnhhpGDqevchLmS+B5C1CyWtWuZ3uo5NnZnlG2IE1+b+MIJC
 I6ItpGr5ovB0njkkaDrVfNZmrPbfry0BQyGIATQ6Py1ZvBldZqlwILn2kJghSYvh/2UT
 /c6ZvimS2hMYfBCVhCsUcBR+9KhkMiIKya8aXO74ordQjMDsZTQK4rXWINe06iCoBFfK
 P6xpVez/jMgqFEKLwNBCyhYYgkINJOlRDl1P7RSqaFjqHVK3ypnfmet1CfQ61T1ZDlsp
 xvd2sTU9vE0xLlKfNZsoP0a9bvP3fwXNSDa/9EZaygtAtCpFWoju++tJiNqwv5I2lME5
 dI0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783791209; x=1784396009; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JS3CKX8TG+RSRMmVQSeQiQae+JhkZskL580Opidbw14=;
 b=PfyttqIZZu4uE8H32/oQG0aGMYPw5ciICHh2CEtbNUD+jNihu80AyZ8r3Fr3ZZDU3y
 Z4Y3c3Aqp8/4AZdjadoPwHL7Xr3ZllwK1NR9ujrez+9ZQfDVbiF9FWGsHcktOiATkyss
 bvoOmydoT1uAKxiMNFYZ6vtmt6X6w5WRmZjzs+NA1LOC7v/RAnY5OcJ4yinh3c9Fogc5
 l3+xuHgEDBQadL5vSbFEVQiTKZDrpjubR58bVdiVaq6geycGq6szY2XqT2eXiRCqvaO0
 yAEccZki10A5cowQR8Sble4VEwHhSacyaxxFbwXr/k7s872G62/h+NHPj0P9+AkwwpIk
 jnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783791209; x=1784396009;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JS3CKX8TG+RSRMmVQSeQiQae+JhkZskL580Opidbw14=;
 b=EL1I/ImmAzmXOBxxroLw0PModxhZh97h4Yloq7bSuEqfuanVognaXbMS0QGIp43LcR
 FeKyhvnKwf0ei5JSwyiGFoVYeDCRqjpD4ByVoZoyK9xajiBcEVviNIWZJacZYCogyX+t
 /p/kcdsqVtYcNXZDxtf6eNmNrtQdV7H77n4GgkXKD8OsP7TOGo1ok+Do0spilmcZrpP5
 PpoWdKopIkqY3nWgu3kLn5GFC/NyELjDs8NlyO0n8oDeUpoBa/trsalxjWO78peWOEkx
 wUMTb7DMwsr4fHGk2e9jGjN1X3VdBUT40tXla0uLjcbHxxmT3GvtyC1ycvIgJGjhbq09
 GAww==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHRaGGx2qGKh1hxtKFjQ9yfsTBvmD1GIQCTeBq3ES8BWFGd5wE81nSkmmIscSzoJGYdTJxx1fmsg==@nongnu.org
X-Gm-Message-State: AOJu0YzDa4ku2yQ009TOFDi0whEIl3aWm/Yt55g55Slq3Gd72HBKkoTQ
 GkoAWR9M9hljUbVUIiiijlVKTvF1XzsTG9CSdvNfQwV+Ka7WyC6cndUFPcqbV6G9F392Dc38NiC
 G7d1toS0+9WJjbl9emafN4J+CGxnZKz0=
X-Gm-Gg: AfdE7cnlg6LhDVwzQHFwBGVCH0AIO1GLY/npW24ktD/M2aBm1Gr965GtHQVe9clVxFO
 xAJfdkeSKVYM6g1XF7/UayJuwstBnfnso0iZGQu8aHaQI2nGCZLXuR3jJmXwbojx+0a9oQqyOFP
 YuZyDeRoNDkgnFUrwJ4UYL/0lzZJVyRVBxXhNCRYyQ3ag0TRDImXLcRIrQpWvpIINiY7nd/vXHG
 GOSHGeIrNBVQEOQCNaVqSawROlhRqBpmKWr9Ao6Wc+IZ9uqrACGEoHcGGahBr4/9u0SpcjL
X-Received: by 2002:a17:907:9d1a:b0:c16:2d90:68d9 with SMTP id
 a640c23a62f3a-c162d9081fcmr73653366b.56.1783791209022; Sat, 11 Jul 2026
 10:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-34-richard.henderson@linaro.org>
 <bf1b73da-919c-4b02-8b46-78b939077610@linux.ibm.com>
 <8e9907db-68b6-4644-9c16-6fbbbcd52b0b@linaro.org>
In-Reply-To: <8e9907db-68b6-4644-9c16-6fbbbcd52b0b@linaro.org>
From: Harsh Prateek Bora <harsh.prateek.bora@gmail.com>
Date: Sat, 11 Jul 2026 23:03:15 +0530
X-Gm-Features: AVVi8CeoQLoGHON4QB-S6VQPELhcoguijpSA5B6ecc8ZnZl6xcpSNSKFTTO4taY
Message-ID: <CAEuJdmptUafKhzTaRu1j07cyh5eD_vxbMrqyHO7GwWQ=ZRNT8Q@mail.gmail.com>
Subject: Re: [PATCH v3 33/51] target/ppc: Simplify
 ppc_cpu_debug_check_watchpoint
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-devel@nongnu.org, 
 Shivaprasad G Bhat <sbhat@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="0000000000005e089b065659418e"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=harsh.prateek.bora@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Jul 2026 15:54:27 -0400
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

--0000000000005e089b065659418e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Jul, 2026, 10:22=E2=80=AFpm Richard Henderson, <
richard.henderson@linaro.org> wrote:

> On 7/11/26 03:54, Harsh Prateek Bora wrote:
> > + Cedric, Shiva
> >
> > On 11/07/26 2:23 am, Richard Henderson wrote:
> >> We don't need to check either ISA bit, because that's already
> >> done starting with SPR registration.  Replace target_ulong with
> >> uint64_t, as we're under TARGET_PPC64.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/ppc/tcg-excp_helper.c | 30 +++++++++---------------------
> >>   1 file changed, 9 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper=
.c
> >> index 99ffe4a820..4065440949 100644
> >> --- a/target/ppc/tcg-excp_helper.c
> >> +++ b/target/ppc/tcg-excp_helper.c
> >> @@ -353,35 +353,23 @@ bool ppc_cpu_debug_check_watchpoint(CPUState *cs=
,
> CPUBreakpoint *wp)
> >>   {
> >>   #if defined(TARGET_PPC64)
> >>       CPUPPCState *env =3D cpu_env(cs);
> >> -    bool wt, wti, hv, sv, pr;
> >> -    uint32_t dawrx;
> >> +    uint32_t dawrx =3D env->spr[wp->id ? SPR_DAWRX1 : SPR_DAWRX0];
> >> +    bool wt =3D extract32(dawrx, PPC_BIT_NR(59), 1);
> >> +    bool wti =3D extract32(dawrx, PPC_BIT_NR(60), 1);
> >> +    bool hv =3D extract32(dawrx, PPC_BIT_NR(61), 1);
> >> +    bool sv =3D extract32(dawrx, PPC_BIT_NR(62), 1);
> >> +    bool pr =3D extract32(dawrx, PPC_BIT_NR(62), 1);
> >> -    if ((env->insns_flags2 & PPC2_ISA207S) &&
> >> -        (wp =3D=3D env->dawr_watchpoint[0])) {
> >> -        dawrx =3D env->spr[SPR_DAWRX0];
> >> -    } else if ((env->insns_flags2 & PPC2_ISA310) &&
> >> -               (wp =3D=3D env->dawr_watchpoint[1])) {
> >> -        dawrx =3D env->spr[SPR_DAWRX1];
> >> -    } else {
> >
> > Previously, there were different ISA version checks resulting in
> different behaviour, now
> > with this change we are allowing for both ISA versions. Not sure if thi=
s
> would be an
> > expected behaviour?
>
> Per the commit comment, the ISA version checks are done when registering
> the system
> register.  One cannot write to DAWRX1 unless ISA310, and therefore
> dawr_watchpoint[1] will
> not be set nor wp->id be 1.
>

Thanks for confirming, Richard!

Regards
Harsh

>
>
> r~
>
>

--0000000000005e089b065659418e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 11 Jul, 2026, 10:22=E2=
=80=AFpm Richard Henderson, &lt;<a href=3D"mailto:richard.henderson@linaro.=
org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 7/11/26 03:54, Harsh Prateek Bora wrote:<br>
&gt; + Cedric, Shiva<br>
&gt; <br>
&gt; On 11/07/26 2:23 am, Richard Henderson wrote:<br>
&gt;&gt; We don&#39;t need to check either ISA bit, because that&#39;s alre=
ady<br>
&gt;&gt; done starting with SPR registration.=C2=A0 Replace target_ulong wi=
th<br>
&gt;&gt; uint64_t, as we&#39;re under TARGET_PPC64.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.hen=
derson@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@l=
inaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 target/ppc/tcg-excp_helper.c | 30 +++++++++----------------=
-----<br>
&gt;&gt; =C2=A0 1 file changed, 9 insertions(+), 21 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_he=
lper.c<br>
&gt;&gt; index 99ffe4a820..4065440949 100644<br>
&gt;&gt; --- a/target/ppc/tcg-excp_helper.c<br>
&gt;&gt; +++ b/target/ppc/tcg-excp_helper.c<br>
&gt;&gt; @@ -353,35 +353,23 @@ bool ppc_cpu_debug_check_watchpoint(CPUState=
 *cs, CPUBreakpoint *wp)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0 #if defined(TARGET_PPC64)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUPPCState *env =3D cpu_env(cs);<b=
r>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 bool wt, wti, hv, sv, pr;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t dawrx;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t dawrx =3D env-&gt;spr[wp-&gt;id ? SPR=
_DAWRX1 : SPR_DAWRX0];<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool wt =3D extract32(dawrx, PPC_BIT_NR(59), 1=
);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool wti =3D extract32(dawrx, PPC_BIT_NR(60), =
1);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool hv =3D extract32(dawrx, PPC_BIT_NR(61), 1=
);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool sv =3D extract32(dawrx, PPC_BIT_NR(62), 1=
);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool pr =3D extract32(dawrx, PPC_BIT_NR(62), 1=
);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 if ((env-&gt;insns_flags2 &amp; PPC2_ISA207S) =
&amp;&amp;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (wp =3D=3D env-&gt;daw=
r_watchpoint[0])) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dawrx =3D env-&gt;spr[=
SPR_DAWRX0];<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 } else if ((env-&gt;insns_flags2 &amp; PPC2_IS=
A310) &amp;&amp;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (wp =3D=3D env-&gt;dawr_watchpoint[1])) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dawrx =3D env-&gt;spr[=
SPR_DAWRX1];<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 } else {<br>
&gt; <br>
&gt; Previously, there were different ISA version checks resulting in diffe=
rent behaviour, now <br>
&gt; with this change we are allowing for both ISA versions. Not sure if th=
is would be an <br>
&gt; expected behaviour?<br>
<br>
Per the commit comment, the ISA version checks are done when registering th=
e system <br>
register.=C2=A0 One cannot write to DAWRX1 unless ISA310, and therefore daw=
r_watchpoint[1] will <br>
not be set nor wp-&gt;id be 1.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks for confirming, Richard!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Regards=C2=A0</div><div dir=3D"auto">=
Harsh=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--0000000000005e089b065659418e--

