Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1923541lfb;
        Sat, 23 Jan 2021 11:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsqj8q+Yeno9z+oTumMr+gewuGPuLM4N5bQoEgdRq/ARVfrVONpZkz8Gwg/XDtuuyPu6h7
X-Received: by 2002:a25:5054:: with SMTP id e81mr15387882ybb.131.1611431955104;
        Sat, 23 Jan 2021 11:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611431955; cv=none;
        d=google.com; s=arc-20160816;
        b=DBYB8jqMT0HAgffdiXDAq4FuFR83DCOlhHQqpHKvc+gcN/RIVKYfpzO7D/83J2MNef
         D2UhOBclSO5y6jDCNVMvFWpmdkSkFc1cdc5rPCvr8PZqGzHuTb1WITrYCZReFt+OvhTg
         gQX/yiZBWsgnBibwHI1bXeNuOHHOgCqsRo7kyWkcwAJiNypT+NVDJD7sNVTh4q9mj5lX
         ZTKof9iyY/mXdbbV8uvQlgzvW0yIwxAP+YP9adfevc5ThTdT7xVJUdti0an0+UQWYgps
         GjgE7C2gDsa9y9xdj7YXZ3zChvgv5VF0L1/zogmCIzagj1n57yexFSk/VfNFgwLqK0GN
         c+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=FaDpLnjgBAc1P1v9+G3Z98irkzGLB2axmdOyN1CrnMQ=;
        b=zPTf1DNjFaRL/MbQ5MMarNVUz8R6DdyUcydhhqKrUsMp7A8BdtZ9A390OzhYwuOQ+2
         3OD4p8w5bDf7R5jLR79a1XRH0TiYKHOHOuR1H9ZFmwXhw+i03P2InqCQ/rKPyfKj+NZa
         krJrCZSXv3XIl/8zgBVM//jGDN/0E4JRANmFEqU56igOLr6ni/fzAsLim43JjMEfSrOD
         OE7jxaZSSuyy/3jSRbgI8CcK1qZBGn4p6elYhsY/mcP7RBMN4fdBwbe7f/6beb6OfXH+
         Dp4xcDD/BCEEaYJfguf2cFpifdi/D5Utx7Jz7Efn5SaMNFcHpP2CiP/9UyP82RPb5xZv
         M9WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=cziHh6Yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si9955300ybe.97.2021.01.23.11.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 11:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=cziHh6Yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3P3y-000176-GO
	for alex.bennee@linaro.org; Sat, 23 Jan 2021 14:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3P3Z-00016e-TM; Sat, 23 Jan 2021 14:58:50 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:51834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3P3U-0005Um-2v; Sat, 23 Jan 2021 14:58:48 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id F1386C602E6;
 Sat, 23 Jan 2021 20:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611431918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FaDpLnjgBAc1P1v9+G3Z98irkzGLB2axmdOyN1CrnMQ=;
 b=cziHh6YbnJGkDgtP1bWUuyZNYDnoWreem1XpiZ3YMK0mc8Je9UHrxiXuuxOtXw1HGvJtp7
 AgdRscHEiQG88Dt/fBFD3cV/1h4fMD5Mw4D8Xdo0cKf3Ueo8J2sA1gs0EBanDenGlcDezs
 K2lq/B93Co5yTogoQKl+TeRvVt2Yu0qRhb4x3WDC9T13dVqmDF0aHOcMCVFXyGPOAdhWFD
 /aBLPynRbTDSjhjouX3oHsymsGjKorOSQDr+j8um+WrpS/XerlC/OFcYRJ0cMbozr2cufd
 a7f11hlo2lE3gr7dBvH5N9WGNBXFmfCfuIZYqInpGMzg7JUHt6tB1Fs3KSNNYg==
Date: Sat, 23 Jan 2021 20:58:59 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock
 input
Message-ID: <20210123195859.btxj66mgka4c7s62@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-20-peter.maydell@linaro.org>
 <20210122204910.xadaf4zutpbu4qp5@sekoia-pc.home.lmichel.fr>
 <CAFEAcA8adGg+i65an_2Pser8acSmgz4D1wvmidaKNpeOt6jJKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8adGg+i65an_2Pser8acSmgz4D1wvmidaKNpeOt6jJKw@mail.gmail.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tb/tdFl3ggZ1

On 21:41 Fri 22 Jan     , Peter Maydell wrote:
> On Fri, 22 Jan 2021 at 20:48, Luc Michel <luc@lmichel.fr> wrote:
> >
> > On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> > > Switch the CMSDK APB dualtimer device over to using its Clock input;
> > > the pclk-frq property is now ignored.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
> > >  1 file changed, 37 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> > > index 781b496037b..828127b366f 100644
> > > --- a/hw/timer/cmsdk-apb-dualtimer.c
> > > +++ b/hw/timer/cmsdk-apb-dualtimer.c
> > > @@ -106,6 +106,22 @@ static void cmsdk_apb_dualtimer_update(CMSDKAPBDualTimer *s)
> > >      qemu_set_irq(s->timerintc, timintc);
> > >  }
> > >
> > > +static int cmsdk_dualtimermod_divisor(CMSDKAPBDualTimerModule *m)
> > > +{
> > > +    /* Return the divisor set by the current CONTROL.PRESCALE value */
> > > +    switch (FIELD_EX32(m->control, CONTROL, PRESCALE)) {
> > > +    case 0:
> > > +        return 1;
> > > +    case 1:
> > > +        return 16;
> > > +    case 2:
> > > +    case 3: /* UNDEFINED, we treat like 2 (and complained when it was set) */
> > > +        return 256;
> > > +    default:
> > > +        g_assert_not_reached();
> > > +    }
> > > +}
> > > +
> > >  static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
> > >                                               uint32_t newctrl)
> > >  {
> > > @@ -146,7 +162,7 @@ static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
> > >          default:
> > >              g_assert_not_reached();
> > >          }
> > > -        ptimer_set_freq(m->timer, m->parent->pclk_frq / divisor);
> > > +        ptimer_set_period_from_clock(m->timer, m->parent->timclk, divisor);
> >
> > Just a small cosmetic note, maybe you can use your new
> > cmsdk_dualtimermod_divisor function to factor out the switch above?
> > Something like:
> >
> > if (changed & R_CONTROL_PRESCALE_MASK) {
> >     if (FIELD_EX32(newctrl, CONTROL, PRESCALE) == 3) {
> >         qemu_log_mask(LOG_GUEST_ERROR,
> >                       "CMSDK APB dual-timer: CONTROL.PRESCALE==0b11"
> >                       " is undefined behaviour\n");
> >     }
> >
> >     ptimer_set_period_from_clock(m->timer, m->parent->timclk,
> >                                  cmsdk_dualtimermod_divisor(m));
> > }
> 
> Nope, because cmsdk_dualtimermod_divisor() uses the current
> m->control value, and at this point in the code we need the
> divisor from the new control value which isn't in m->control yet.
> I liked the slight duplication better than either having to
> pass m->control in in all the other callsites or trying to
> refactor the control write handling so that m->control is
> updated before this point in the code.

Oops yes I missed that. Sure make sense, forget what I said.

> 
> thanks
> -- PMM

-- 
