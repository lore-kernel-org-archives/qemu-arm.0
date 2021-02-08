Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1506239lfc;
        Mon, 8 Feb 2021 13:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBZ7n381xbvoPci8JlqRdoSy2gSUJDecuknGbDE927mIGWyF6P0Bl+unLQ6YXS3iDf1XmR
X-Received: by 2002:a5b:5c1:: with SMTP id w1mr27516478ybp.177.1612819110342;
        Mon, 08 Feb 2021 13:18:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612819110; cv=none;
        d=google.com; s=arc-20160816;
        b=eh5U+JpBAwpA0xsC0lpdG9Sd06pmX67ZF95t8ofAJ6XD5ieRmtJYuj565AILa+I4Cj
         7xZ/7hYeFwxjXIHWoq+tHTriArrbPbSEMymEiViDbEf5YdCEmgCPlE4cqBz3pLCKneld
         IXixLiB4oboYrplJ/sVI38sQgxJCveFQe+of/b5OSNSZEqpVODPM2BVWgW544+lv5ZY2
         u/7uxUlWXcNKO1dAyX0aS8yY0tEJ6Ko1FIVwBmXmfe3h9VqAD8+dttW2sIpf/K0N1td7
         FLLEn0bPe5BNjvEqP9a299RCRMZWNp8LVTZm72OJG5iitX6uSFkJuWWND19bedH7S5LI
         y39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=s0p3lU4YngWXBzgBUcMi56jFuxfK5HmfSMe0Vp+usus=;
        b=wS7xr8iq3S8MorVdIeDrJZfazsINGrLJoQ9JIVst58OWdp2NUORGlG6CyfWgLrK8pP
         v8JF1SRPHl9qG7Y/OAOMAFzHarywKG05RG9dCRjMep7wL/FhO0b08I+vNCptIa+4S+t1
         5ZdAgS7Qgo40b/SsufQW4wYXRqtoLCdVyuTQun8gh0J7SdxbOSYvRRajmB89x8+rjCjS
         kxBP1Hl0Uv9dQ6gOeZKbhT0ZkleqgFJ34rW2zJuY1fSVEoqC0CTk1sEFya+SHPy7aL9o
         ge47nUlA/If+hLaU82mcYPDK2+AJnGQfLlkq2QxqYf7zETCSAPn5H9O8h+6Gw34dhwYp
         k88g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfkZYYAi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l195si19713531ybf.109.2021.02.08.13.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 13:18:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfkZYYAi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9DvR-0006TB-No
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 16:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99Yf-0004xt-OV
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:38:42 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99Ya-0003oP-3R
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:38:39 -0500
Received: by mail-ed1-x532.google.com with SMTP id s3so19046355edi.7
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s0p3lU4YngWXBzgBUcMi56jFuxfK5HmfSMe0Vp+usus=;
 b=IfkZYYAiJ1CYCwyovmWj4UkKTnVONIWagHUAZ9b5LRXemMlQ4gYCDYJHPG8n44y+ji
 wcmGXLDITZjzXXzm0jwTzXLEiQIhvnldM5lLTdG4Xx48CzndRvZUFMGmawCbBgJcwS1D
 LPHsyvXJdUby5lqDGymRZ2h8Ka4wGKecCPWmt9QgrISI4YZ1D+25QuDboaG+Iih1Hde2
 W667aktJYPxh/3rIFsalmMdAlEB7xe600EezDP2GityToqruQsTcK/+lTcbvQnrgBwet
 J9Vfv8izZOFY1R0tClkbV3AsYuPflyOgCZHksvvWjjZmARqUFb2qY6/oiqyFcTiqSwoP
 5bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s0p3lU4YngWXBzgBUcMi56jFuxfK5HmfSMe0Vp+usus=;
 b=jV0PznVP2ZZaMRbn/J4WPTl4osrtHUTD567wNCZqXxTGz0nuxzaPImNJopZzwYrXVo
 U7BjY2SveOAJrCBeLJyNaq8HRp3671Cdp7/4JLOdwVcel2KEb2C9s+GoNj1WjSndxGqQ
 wviPNBbBx6KQFSdDGIQHi6WwFl5ag5mpYMmxdrIu9qRQLv4r5XJW+DAhQE+hg6fhOZBZ
 iOvNG0lzgFO7mXb2LWpCCxZuXorcDljsPN9S9ieJS0bzVLjlbZwMIZG4TQAeycjlWH0+
 ioz0gLMJfY57nUCSijOV72aTCmj3o3I/O4XCr1oP4ZZ4PFulXVzXbva2MQSzXAgfQ3y/
 /Rrg==
X-Gm-Message-State: AOAM53382F3LJMFB6tk9opQjEiILxWMF5FfF0gBZtk5ra9Nus6jkmeuG
 fHbKoStSGKiCQhpTnTz+SAj7xo7O3dAI3nzrvG42lA==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr17848913edd.52.1612802314645; 
 Mon, 08 Feb 2021 08:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
 <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
 <5639019.LFGEF57sxV@basile.remlab.net>
In-Reply-To: <5639019.LFGEF57sxV@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:38:23 +0000
Message-ID: <CAFEAcA_aV=dvrDnxN1hxHkP+eoXSZXJcrW-hOsPtDK5esbx+9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lUNdwlbB/bVH

On Wed, 3 Feb 2021 at 18:12, R=C3=A9mi Denis-Courmont <remi@remlab.net> wro=
te:
>
> Le keskiviikkona 3. helmikuuta 2021, 18.55.52 EET michael. nawrocki--- vi=
a a
> =C3=A9crit :
> > The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force the=
m
> > to 1 only when there is no support for AArch32 at EL1 or above.
> >
> > The reset value will be 0x30 only if the CPU is AArch64-only; if there
> > is support for AArch32 at EL1 or above, it will be reset to 0.
> >
> > Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch3=
2
> > is supported at EL1 or above.
> >
> > Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>

> > @@ -2024,7 +2024,10 @@ static void scr_write(CPUARMState *env, const
> > ARMCPRegInfo *ri, uint64_t value) ARMCPU *cpu =3D env_archcpu(env);
> >
> >      if (ri->state =3D=3D ARM_CP_STATE_AA64) {
> > -        value |=3D SCR_FW | SCR_AW;   /* these two bits are RES1.  */
> > +        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
>
> AFAICT, this is a tautology in this context.

Normally, yes, but:

> > +            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
> > +                value |=3D SCR_FW | SCR_AW;   /* these two bits are RE=
S1.  */
> > +        }
> >          valid_mask &=3D ~SCR_NET;
> >
> >          if (cpu_isar_feature(aa64_lor, cpu)) {
> > @@ -2063,6 +2066,15 @@ static void scr_write(CPUARMState *env, const
> > ARMCPRegInfo *ri, uint64_t value) raw_write(env, ri, value);
> >  }
> >
> > +static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    /*
> > +     * scr_write will set the RES1 bits on an AArch64-only CPU.
> > +     * The reset value will be 0x30 on an AArch64-only CPU and 0 other=
wise.
> > +     */
> > +    scr_write(env, ri, 0);
> > +}

...the new scr_reset() function introduces a code path where
scr_write() will be called on the STATE_AA64 reginfo even on
a 32-bit only CPU. (The AArch32 SCR reginfo is an alias, so it
relies on the AA64 reginfo being present-but-not-guest-accessible
for the reset value.)

thanks
-- PMM
j
