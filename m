Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp965914lfp;
        Thu, 16 Sep 2021 03:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWFXJ+tcDqwMqqgCI0+iwa5KYM7jNPXUUKA7eMSoaFJ08q00swlgwA4rEUjgz4K39/p0gU
X-Received: by 2002:a67:fb48:: with SMTP id e8mr3085598vsr.27.1631786556719;
        Thu, 16 Sep 2021 03:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631786556; cv=none;
        d=google.com; s=arc-20160816;
        b=ezIj57mPuET8Kd2PhWXpqX0Eqp8//6wXv0RBJhzBJtn/aXAL9fLlICCJuMA5pdv0n3
         +lxT1urkiAcjEcyIILuzwymQc5qmdx3YMCmQ5lAwiAcTtPYa6lv+SDcPa4Bupg8988C7
         hX77ANuBSHXDluXRe83+O/lyCQowR3R4js9NQ7joVm32N5ecOcoaRDR42eOobBr7gHqw
         sBfMvusT47SqV/OSyhCecqUsSRTkDBBltQzKSHcD4VhTGFoqx7bjmSKH5333kS7gvZ9I
         y1K4ymeJP9aiJIDcrc3e/sUDxWz76hpXFTCx6EC2STaMbNFdG87xlrDZvzItHN+SEEmA
         EqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPlnvWwDJmBGYDY064GS1S31c3Nx6YEROSxkxDU+k+w=;
        b=ZJS9/WtggTdRbGxW+9zmlicF1eKBeBmvKW8cwu0U8sdWKbb4NCuBWGH2UrcRM/A/0m
         e9lbLb6MTPa63x2sWkUUr8TDYMQIDO5ftEehqYCJ6nyFb7De9vorE3osTTcEJaibcDtB
         d0XxXHeww/ZiSrMfKqIMzOzgD7QxS6CyHeIBaqbLFyTwANZPPgMuJU00dRqwSUrYMgHN
         926uYGWxvcB3x5kqspWeQDZHh5EbGmrfMtY9PltEmu9B+2jw/OPLAxJL4h3rM7cqyqyN
         NO1fSLxeEwmN/p76CJ3oFgOXMxZIU0wgiflNUAZTqbYCOcR58PXqOImvqSb1NybBzkfW
         LNJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7FQKZHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si1260367vse.132.2021.09.16.03.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 03:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7FQKZHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQoDz-0006tQ-Vi
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 06:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoDa-0006r9-Tv
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 06:02:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQoDV-00075o-Mu
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 06:02:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i23so8558182wrb.2
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPlnvWwDJmBGYDY064GS1S31c3Nx6YEROSxkxDU+k+w=;
 b=A7FQKZHqnh4oMyKLMRlS0c27yw+juxxQ09nwuGURUTvPsUeQfIZmGblvYJH2znkXfa
 TM+GDaGBzzNGLIWB4lJzyljb6fkIKfq1h2FFdiPYpZqwqvfTZ4ZRmGEaBwzpeCeVlhxG
 AFtCRkDe4EYV+IO0C65sxz1dvqwbikuFYHBmzAQhNuau8w4FSoaV/OvOk7vHQFzhs5iV
 rduEXNRJVl1EN4hOOHfrH0T4ehIy8RXjADpDrhiE4FVFScKR8V1QtEy0A3N/n5EJCCvr
 tbgKbZK0RHRt8itMJC/s67i0kV7rjorfBeh2EcLV7wQ2aU+K425S2Rjc+FTZJWIEhV/P
 7abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPlnvWwDJmBGYDY064GS1S31c3Nx6YEROSxkxDU+k+w=;
 b=npWp5u4ifBC8C0PzApRhfe2HZLyWC8tyKXYLnP2fPKu9DuJ6tcn8WgoIOi9plR/t2G
 tXdSB+/j3IfdUTGu86CpnpVKy+MZMgn5mbz/iywHkNk+1dJG7irALZLpyRsa4SXhRHAd
 ulubka32aaWb7uENiRhJfgWv2wHpJL56g3E9M3BSwawRt+o03Tz2Tc3hI55OiYszDYCv
 MU1ScIrEFQiQuFblgjjrOXXsoGPsJcBwWI5A5zlsBfZmuZ7FXS8zLJUmdrZn/G2bZhjU
 vDRRfZJxJF5x74MweI8gvbmyGu+/Zy+1zVokUWVJN3Ea1c/wLKm5oR0M14z8XrFQmg/H
 Z5yw==
X-Gm-Message-State: AOAM530qRtR3ftV+tq+kL6Yg0N2IDibhhzyLXotWqOp3Mv9fkbs4hlA9
 jt3aWjzkoya43tWh9K6ax919igrzGXjv4IiCN0i5WA==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr5055802wrr.149.1631786523815; 
 Thu, 16 Sep 2021 03:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
 <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
 <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
In-Reply-To: <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:01:12 +0100
Message-ID: <CAFEAcA_Xtig7iw97JURq2UnhqWdJA_Fok2=yYNBRoqfoX3M=FQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL,
 VSHR immediate forms
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kT+k9zmTxFVZ

On Mon, 13 Sept 2021 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/21 7:21 AM, Peter Maydell wrote:
> > On Mon, 13 Sept 2021 at 14:56, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 9/13/21 2:54 AM, Peter Maydell wrote:
> >>> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
> >>> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
> >>> +{
> >>> +    /*
> >>> +     * We get here with a negated shift count, and we must handle
> >>> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
> >>> +     */
> >>> +    shift = -shift;
> >>
> >> You've already performed the negation in do_2shift_vec.
> >
> > Here we are undoing the negation we did there, so as to get a
> > "positive means shift right" shift count back again, which is what
> > the instruction encoding has and what tcg_gen_gvic_shri() wants.
>
> Ah, I misinterpreted.
>
> >> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
> >> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.
> >
> > I'm not convinced the resemblance is close enough to be worth the
> > effort...
>
> Yeah, not with the negation bit above.

Could I get a reviewed-by for this patch, then, please ?

thanks
-- PMM
