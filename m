Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3981716ejn;
        Tue, 25 Oct 2022 03:30:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tg3OCalBZS1kBhL4X7vcJ+wmuXJcTID26rjUnhI8RgEj9GklMLhXopgDdEYfFokI7E12r
X-Received: by 2002:a05:622a:206:b0:39c:f2cf:f9fa with SMTP id b6-20020a05622a020600b0039cf2cff9famr31636649qtx.669.1666693800085;
        Tue, 25 Oct 2022 03:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666693800; cv=none;
        d=google.com; s=arc-20160816;
        b=WwfhpOb+oo1fOMC8AEq6KJne4XfQ4llWlR4D+gJ9jddXELztkJrPKpdJzH+X1KVB/O
         H+AVE7/l//pbCp58r1RHJ8f4+YBNhoevyLrw9T33JYNXuRiwWyE575pVWAaF7CnGRT0E
         1C6N3tQLkIED0AMLio51fRiczsRp5K/pRhQvF0WswTf9JONQTwNdEHyUEOZGka/xrRZ3
         nrCGrkuu12PqDdsUg8zQ4Pn+NjoWan5fQMIoJafWsy2Wuym407syhZ7FI7HxkpOZyG9n
         K44S+cXHBbRRFrLMtUNN//aKZxoEgZ3oBZqkRFHcLCRfphFH6yZ80eEPiFt/dKGBr3X9
         aKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rUCbCT4XRms0l7y45nvWQTmRC97wvHYmzTjlaZhNU6A=;
        b=R1bYIdOO4IuBuFancyih0RK9NbTX3bAKrIa457X5r1SBcmiwM/hpYoKRbTIB7nQdHM
         VWHNGJDaljhqt0k4oxsWEJCUgPPIsDA63l2VMJoor08g/lCTX/9LG+6kAjc10iDl81nt
         Hh9BtbsLeWtoc1HbH213FT5BN4EqJfnujskUBZmEaaQZdMeDVuH5qT5E/gqvgcxS0zi4
         aPgVYK/sSW7I89xFR6jS4U6dqM0fLTTpQ5v1WyaJM04kbjpLByZnBuyWWtr6eVdpYVJD
         lGTj3szrAbeu5FGclX3ruHOJZuc0B78ZRLVjEaOJ1lIVLRIZpv8n3wzr1RDE12iyX/JH
         Wurw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=hxSmyU2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc14-20020a05622a59ce00b0038e85fb6757si685674qtb.25.2022.10.25.03.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 03:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=hxSmyU2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onHAY-0006WH-2y; Tue, 25 Oct 2022 06:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1onHAS-0005Uz-3N
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 06:28:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1onHAP-0000Yn-2s
 for qemu-arm@nongnu.org; Tue, 25 Oct 2022 06:28:19 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t15so803231edd.4
 for <qemu-arm@nongnu.org>; Tue, 25 Oct 2022 03:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rUCbCT4XRms0l7y45nvWQTmRC97wvHYmzTjlaZhNU6A=;
 b=hxSmyU2uxFMntPtQIUr0u9bfmRmA+PD2I+OFnsCEkdZApJFGNU5X1GI/5b8KQjR3VR
 /Pe97MzomWbz4/1A6dr0e3MZZ9qJnfJA0PpZwWqVwGJW/+bklschdcAdzAo4MNmJjNVV
 SE7TT7sTlJN89zbNsDZ7nshA84HAu6rgOLoSr6QiHSX6vXNBrGW1+ssVonuzkN98EGPf
 OGMRZqLX6Dw28fkYol2+JsLWuNnNjNQHhYDhFdtD6ShH9pWcFpvQmjPwlMoQdf+ecMic
 BrWdXlyjHsbsEKIuVrEbJ4vTVkqfERdjydJJdP5sAu7TSzKc4/KWWP4x8+MljlICK0eE
 PfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUCbCT4XRms0l7y45nvWQTmRC97wvHYmzTjlaZhNU6A=;
 b=fhBwljpw/J3mXosmbYAwXHhYP2OEDSJKpZWkSJNnPbluZ1eoPi1CkPAN5/3Z1F1BmJ
 wqRcewi1+l8x8gatOJ6VaSAB5Dt6eHD3uXBRUxEt/3B7NxbS59erfF2Db+f77PnlShS+
 TcAzo8ZRFv9Iz+2mPAm++MwNzmUOYJHDMuJqi785W9xUxBpk2NKKrdTuYMucvEmX37ik
 MUtAGo4TN38F++RgXMoKn7ReGmetHOqVOu0kxdS6r1yxbggqhJ8zXP+10T7A9nhAyagn
 8ZNyYpJZgPN8Mr+Sb9wPakavsCupqSohWUCqwVMYeNVBmEMEDgXohNgOH5gBaaCVU00J
 Ro5w==
X-Gm-Message-State: ACrzQf1MNBPy1Oh2JVtmuUet9IYCLhlla2Xu/aqGwxYVEkoYe8Wq7HMj
 aQGghDrJn4Nt3ZpjqK7l5Kc9L4RWv5IlZwUif1kyhw==
X-Received: by 2002:a05:6402:2707:b0:45c:d8a3:6cfc with SMTP id
 y7-20020a056402270700b0045cd8a36cfcmr35263267edd.269.1666693692425; Tue, 25
 Oct 2022 03:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221017092432.546881-1-ake@igel.co.jp>
 <CAFEAcA9sQ-QJCw_P3OAp5O9o7pHcpz1kwmSi+=Dg4qqMfYt1iQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9sQ-QJCw_P3OAp5O9o7pHcpz1kwmSi+=Dg4qqMfYt1iQ@mail.gmail.com>
From: Ake Koomsin <ake@igel.co.jp>
Date: Tue, 25 Oct 2022 19:28:01 +0900
Message-ID: <CADd_P+kQaaLkbV5vve79TTy-r+wvxqr03f=RJqjQYJVKq-EBrA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honor HCR_E2H and HCR_TGE in
 arm_excp_unmasked()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007cc06a05ebd95d2a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=ake@igel.co.jp; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QHHFXs5Fdh0p

--0000000000007cc06a05ebd95d2a
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 1:37 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 17 Oct 2022 at 10:29, Ake Koomsin <ake@igel.co.jp> wrote:
> >
> > An exception targeting EL2 from lower EL is actually maskable when
> > HCR_E2H and HCR_TGE are both set. This applies to both secure and
> > non-secure Security state.
> >
> > Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> > ---
> >  target/arm/cpu.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 94ca6f163f..86d3377d3f 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *cs,
> unsigned int excp_idx,
> >      if ((target_el > cur_el) && (target_el != 1)) {
> >          /* Exceptions targeting a higher EL may not be maskable */
> >          if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> > -            /*
> > -             * 64-bit masking rules are simple: exceptions to EL3
> > -             * can't be masked, and exceptions to EL2 can only be
> > -             * masked from Secure state. The HCR and SCR settings
> > -             * don't affect the masking logic, only the interrupt
> routing.
> > -             */
> > -            if (target_el == 3 || !secure || (env->cp15.scr_el3 &
> SCR_EEL2)) {
> > +            switch (target_el) {
> > +            case 2:
> > +                /*
> > +                 * According to ARM DDI 0487H.a, an interrupt can be
> masked
> > +                 * when HCR_E2H and HCR_TGE are both set regardless of
> the
> > +                 * current Security state. Note that We need to revisit
> this
> > +                 * part again once we need to support NMI.
> > +                 */
> > +                if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H |
> HCR_TGE)) {
> > +                        unmasked = true;
> > +                }
> > +                break;
> > +            case 3:
> > +                /* Interrupt cannot be masked when the target EL is 3 */
> >                  unmasked = true;
> > +                break;
> > +            default:
> > +                g_assert_not_reached();
>
> Hi; thanks for this patch. You're correct that there is a bug here, but
> it took me a while to work out why it's OK to remove the "don't allow
> masking if we're in Secure EL0/EL1 and the exception is going to NS EL2"
> check. The answer to that turns out to be "the target_el could never be
> 2 anyway in that case": because arm_phys_excp_target_el() uses
> arm_hcr_el2_eff(),
> if we're Secure and SEL2 isn't enabled then the effective HCR_EL2 bits
> will all be zero, which forces us into the "targets EL1" or "targets EL3"
> cases.
>
> So I think that's worth mentioning in the commit message:
>
> "We can remove the conditions that try to suppress masking of
> interrupts when we are Secure and the exception targets EL2 and
> Secure EL2 is disabled, because in that case arm_phys_excp_target_el()
> will never return 2 as the target EL. The 'not if secure' check
> in this function was originally written before arm_hcr_el2_eff(), and
> back then the target EL could be 2 even if we were in Secure EL0/EL1;
> it is no longer needed."
>
> I'll apply this to target-arm.next, with the commit message
> updated to include that.
>
> thanks
> -- PMM
>
Thank you very much for the review and additional commit
commit message for clarity.

---
Ake Koomsin

--0000000000007cc06a05ebd95d2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 25, 2022 at 1:37 AM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, 17 Oct 2022 at 10:29, Ake Koomsin &lt;=
<a href=3D"mailto:ake@igel.co.jp" target=3D"_blank">ake@igel.co.jp</a>&gt; =
wrote:<br>
&gt;<br>
&gt; An exception targeting EL2 from lower EL is actually maskable when<br>
&gt; HCR_E2H and HCR_TGE are both set. This applies to both secure and<br>
&gt; non-secure Security state.<br>
&gt;<br>
&gt; Signed-off-by: Ake Koomsin &lt;<a href=3D"mailto:ake@igel.co.jp" targe=
t=3D"_blank">ake@igel.co.jp</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/arm/cpu.c | 24 +++++++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 17 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/arm/cpu.c b/target/arm/cpu.c<br>
&gt; index 94ca6f163f..86d3377d3f 100644<br>
&gt; --- a/target/arm/cpu.c<br>
&gt; +++ b/target/arm/cpu.c<br>
&gt; @@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *c=
s, unsigned int excp_idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((target_el &gt; cur_el) &amp;&amp; (target_el =
!=3D 1)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Exceptions targeting a higher EL =
may not be maskable */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_feature(env, ARM_FEATURE_AAR=
CH64)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 64-bit masking rule=
s are simple: exceptions to EL3<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* can&#39;t be masked=
, and exceptions to EL2 can only be<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* masked from Secure =
state. The HCR and SCR settings<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* don&#39;t affect th=
e masking logic, only the interrupt routing.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (target_el =3D=3D 3 || !=
secure || (env-&gt;cp15.scr_el3 &amp; SCR_EEL2)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (target_el) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Accor=
ding to ARM DDI 0487H.a, an interrupt can be masked<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* when =
HCR_E2H and HCR_TGE are both set regardless of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* curre=
nt Security state. Note that We need to revisit this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* part =
again once we need to support NMI.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((hcr_el2 =
&amp; (HCR_E2H | HCR_TGE)) !=3D (HCR_E2H | HCR_TGE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 unmasked =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt =
cannot be masked when the target EL is 3 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unmasked=
 =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_=
reached();<br>
<br>
Hi; thanks for this patch. You&#39;re correct that there is a bug here, but=
<br>
it took me a while to work out why it&#39;s OK to remove the &quot;don&#39;=
t allow<br>
masking if we&#39;re in Secure EL0/EL1 and the exception is going to NS EL2=
&quot;<br>
check. The answer to that turns out to be &quot;the target_el could never b=
e<br>
2 anyway in that case&quot;: because arm_phys_excp_target_el() uses<br>
arm_hcr_el2_eff(),<br>
if we&#39;re Secure and SEL2 isn&#39;t enabled then the effective HCR_EL2 b=
its<br>
will all be zero, which forces us into the &quot;targets EL1&quot; or &quot=
;targets EL3&quot;<br>
cases.<br>
<br>
So I think that&#39;s worth mentioning in the commit message:<br>
<br>
&quot;We can remove the conditions that try to suppress masking of<br>
interrupts when we are Secure and the exception targets EL2 and<br>
Secure EL2 is disabled, because in that case arm_phys_excp_target_el()<br>
will never return 2 as the target EL. The &#39;not if secure&#39; check<br>
in this function was originally written before arm_hcr_el2_eff(), and<br>
back then the target EL could be 2 even if we were in Secure EL0/EL1;<br>
it is no longer needed.&quot;<br>
<br>
I&#39;ll apply this to target-arm.next, with the commit message<br>
updated to include that.<br>
<br>
thanks<br>
-- PMM<br></blockquote><div style=3D"font-family:monospace,monospace" class=
=3D"gmail_default"><div class=3D"gmail_default" style=3D"font-family:monosp=
ace,monospace">Thank you very much for the review and additional commit</di=
v><div class=3D"gmail_default" style=3D"font-family:monospace,monospace">co=
mmit message for clarity.</div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"=
font-family:monospace,monospace">---</div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace">Ake Koomsin<br></div></div></div></di=
v>

--0000000000007cc06a05ebd95d2a--
