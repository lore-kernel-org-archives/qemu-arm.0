Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1212659lfb;
        Fri, 22 Jan 2021 13:41:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDNn1GVboUCdp9Lmhz3PqvReEN4qPAKmgAzv8g6PFNDMSkjbAxCpUnWx+KaRcHm2kkExwW
X-Received: by 2002:a25:6187:: with SMTP id v129mr9134421ybb.318.1611351705625;
        Fri, 22 Jan 2021 13:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611351705; cv=none;
        d=google.com; s=arc-20160816;
        b=AldnqcjQn7wlViZWlc084uB9NcTi9aw3Pe+acbCKQzxuUK7K5GiABEA2ExqbDpF1Pz
         4DjTav6ihL44T1PpMYp1WSJMR4FdUyo1BlwioDYLK7oH5Mcd7urB09+fMTW2pJ2l8AVw
         WVu0Zkh4vgUqWxp54Z1FomecErAiR5zTKfRadlnu+sVOCvWazA5fUcC2P4zkWGEE8Gcr
         EWzPQRceVcVY/WKK+aPOSYIRsdwBSBYa2OLMPrNV/vQm1ERodk2SV9OZRrX5Emxfx++a
         ebpYeKGcu+gQPIviB2Uk7KBU8PcCRJHvAFNsdhGHC32NC2k/C84S182ZXvnpWBmbOyxN
         89UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3+Jjj4R0BZKvlqNRp/LxEgdbmXofi2HFjYd51zTn08=;
        b=VCKdVIaGcexZBbQZv48gO9XkP/7TaDBXmYiuELO7QJ0fM2Dse2ktSwLsPHi9Viyys2
         QjfFn3w1pO0CxP6mwgwKowqfO7OgMxAXToeL1/m60JQ5kqEG1nfCLN3smkA9skB2JNE2
         4CWT/bn7jNJ5LeuaBCvB3ILOSt2CB7L57DbOmgAGm4JP62FqMgvGBbXrEgIw6SIAoWBL
         /ZZp/EgdZHpCP0KiQct07nJFX5bCZKRkAgHG6TRk4pxWkFzvDNx/0HUM6GO/65UDa4Va
         NDaVUfTvRg8U/KvYux0nlNHzEWOGEZA8Q/xoUPSK3lt5EQM0ZBvyFeF2RfdtjZiob9PH
         vLxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQykBdKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si11198452ybk.369.2021.01.22.13.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 13:41:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQykBdKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l34Bc-00040w-Uz
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 16:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l34BS-00040d-JA
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:41:34 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l34BQ-0002XT-OX
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:41:34 -0500
Received: by mail-ed1-x531.google.com with SMTP id n6so8176033edt.10
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3+Jjj4R0BZKvlqNRp/LxEgdbmXofi2HFjYd51zTn08=;
 b=ZQykBdKmfo/lHdEUgnxJ24MpZhJiLCblZXkgyo7HyZCa0Jw8wOpcA2HX13WjJJLODV
 RzHzojs3Mw4YNDkMrsBkPX6jRgyXNAyrNJ30Zm4/Rl78AT2GuKf+Y1TuRWasQDcgyp/b
 f4CkPUVD51yiMnqWxZj6ixFGqxRzaozzHAYsHxv6pfnkMkzVxPa7ZVaSvX4IUlXkQQWf
 zdn+WJnc5gnHcZHV4kVzjbDPhi/kevEV8iUAp0UERO7v2PyKxoehuo1C4KqYXf0q4MEM
 VjudsxMTCWR6sDugSZttpoj7i1+bhjnqw0nyQSELo3UICq5+1Je1Z64KBeUoAeW3iavA
 YlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3+Jjj4R0BZKvlqNRp/LxEgdbmXofi2HFjYd51zTn08=;
 b=uoSqwZ/H7M+U1tIsKm6kIK7YGpPZu0LTgnqfjTfOUK98PZp7D0IKDndoVCjYzhedCI
 hGRSAyHEoU/K4ja5YvIrVXWJA4GZ9Z2oLg75rUGsf/cx41U+n+Is9I+CNVZwgBhGMAMs
 HRnivJGzLPiY8JFtGICUgHQjH8KHWfhDO0U2RciXuEowX3rk+BJnaZN2F+SVdrxyR/1G
 eOqloLiicVM+ox87FUMJ+iTgPYaaS/sq1ByuU7cbuKHq8J+ECE/cZfxuBg+zv/00kRkN
 icUiZEYcpwud/xifx7F4B5uCXjXkMO0rUC5E/Ga8uNQJlT/XaoktP0JgXVGww88zdR7M
 XnFw==
X-Gm-Message-State: AOAM532k2RDd/4Ih6oCEu0qOQ+tv3Ln5/UpUOkLMBPtWoYXLrLbttsJg
 j/NQMqjtA4kaq075mcXs1bKzqMbDMYeQS6auIkzDqw==
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr4711369edv.36.1611351689953; 
 Fri, 22 Jan 2021 13:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-20-peter.maydell@linaro.org>
 <20210122204910.xadaf4zutpbu4qp5@sekoia-pc.home.lmichel.fr>
In-Reply-To: <20210122204910.xadaf4zutpbu4qp5@sekoia-pc.home.lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 21:41:18 +0000
Message-ID: <CAFEAcA8adGg+i65an_2Pser8acSmgz4D1wvmidaKNpeOt6jJKw@mail.gmail.com>
Subject: Re: [PATCH 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock
 input
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AiMrd7vulZxB

On Fri, 22 Jan 2021 at 20:48, Luc Michel <luc@lmichel.fr> wrote:
>
> On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> > Switch the CMSDK APB dualtimer device over to using its Clock input;
> > the pclk-frq property is now ignored.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
> >  1 file changed, 37 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> > index 781b496037b..828127b366f 100644
> > --- a/hw/timer/cmsdk-apb-dualtimer.c
> > +++ b/hw/timer/cmsdk-apb-dualtimer.c
> > @@ -106,6 +106,22 @@ static void cmsdk_apb_dualtimer_update(CMSDKAPBDualTimer *s)
> >      qemu_set_irq(s->timerintc, timintc);
> >  }
> >
> > +static int cmsdk_dualtimermod_divisor(CMSDKAPBDualTimerModule *m)
> > +{
> > +    /* Return the divisor set by the current CONTROL.PRESCALE value */
> > +    switch (FIELD_EX32(m->control, CONTROL, PRESCALE)) {
> > +    case 0:
> > +        return 1;
> > +    case 1:
> > +        return 16;
> > +    case 2:
> > +    case 3: /* UNDEFINED, we treat like 2 (and complained when it was set) */
> > +        return 256;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +}
> > +
> >  static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
> >                                               uint32_t newctrl)
> >  {
> > @@ -146,7 +162,7 @@ static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
> >          default:
> >              g_assert_not_reached();
> >          }
> > -        ptimer_set_freq(m->timer, m->parent->pclk_frq / divisor);
> > +        ptimer_set_period_from_clock(m->timer, m->parent->timclk, divisor);
>
> Just a small cosmetic note, maybe you can use your new
> cmsdk_dualtimermod_divisor function to factor out the switch above?
> Something like:
>
> if (changed & R_CONTROL_PRESCALE_MASK) {
>     if (FIELD_EX32(newctrl, CONTROL, PRESCALE) == 3) {
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "CMSDK APB dual-timer: CONTROL.PRESCALE==0b11"
>                       " is undefined behaviour\n");
>     }
>
>     ptimer_set_period_from_clock(m->timer, m->parent->timclk,
>                                  cmsdk_dualtimermod_divisor(m));
> }

Nope, because cmsdk_dualtimermod_divisor() uses the current
m->control value, and at this point in the code we need the
divisor from the new control value which isn't in m->control yet.
I liked the slight duplication better than either having to
pass m->control in in all the other callsites or trying to
refactor the control write handling so that m->control is
updated before this point in the code.

thanks
-- PMM
