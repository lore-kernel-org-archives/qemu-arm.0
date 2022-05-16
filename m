Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1963318lfj;
        Mon, 16 May 2022 05:41:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbyOQpHz7I2Oc4hP+0juPr8J43jGOio7wrjQ8+batih9YNREJ6ktnZzyN550azlgb9VdVU
X-Received: by 2002:ac8:5f50:0:b0:2f3:dc83:7435 with SMTP id y16-20020ac85f50000000b002f3dc837435mr15155746qta.283.1652704916509;
        Mon, 16 May 2022 05:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652704916; cv=none;
        d=google.com; s=arc-20160816;
        b=FMGg0BngSXdpWu96kaCoy7053yYVWvOIHODscpyP4EDwBdKv0Wkm+XuJGaIeSoa+FB
         PFVTOoU6Fbo1CU15TL4JTNIKKnucJggDZfCfSDGQCgk4M7ewfwEm9rUUNXaOL2FXsCOl
         gS0/xp8wPeRJoFOnU+xTG4i/SofpSyIn5Sbm9gE3jlcwF8KcVunyhKQBV0gTKgLohIbg
         P3KcGSEqjz8O6F99E3q8VVdqi3g3pb5NNbN4X3XP0cXwfhfx/pa9K3TnbO7sUXqacKpH
         ahjrrHlgFRI2jHV+RTnaL8eyWB+iVcrvXyaFoINcmHTAf5+CPVj9/M7+O9WVtUtOoLLO
         QyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gLCwmZbj5SvRuszPsiERa19LmTI+L7ux/uEmkuEXA9I=;
        b=DqFgmOCi8Xq/KWh1ElCZHtgsoJY7DoCR7Cte+PND84+s42iIuNZqsrIXmtvTGTlsoQ
         n6JlYXleC58etLvcTaqYKobJSSvm+VwLDga2pFYbE7G2UODaTdLrjppmCt3iFnLIhVhp
         HSJVv5iGegFbdc0HceKxqzGwtA6RiGHT9lrYpBCqy6mWbflZEc+BItw0ZE1dSxiyGhuP
         sZbeDJnQdbjVhBVAj7Wnf9RppJNXLQum1VR/ObMZ/axXoZs26yJhhcK9pjQOdbzP/3Ew
         ZN/QioDewzA9GV1ji6k93Pfrzlf2HtLtjaTkCR9yAT+7sa/UEpjq2N3B0B8W80JCKFma
         kbdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lxo+2cVe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a148e00b002f39b132785si6117547qtx.666.2022.05.16.05.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 05:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lxo+2cVe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqa2t-0006h3-Sc
	for alex.bennee@linaro.org; Mon, 16 May 2022 08:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqYB6-0004xL-6n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:42:16 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqYB3-0006KQ-EV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:42:15 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j2so26291834ybu.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLCwmZbj5SvRuszPsiERa19LmTI+L7ux/uEmkuEXA9I=;
 b=Lxo+2cVeGWvmUDTwIoJM+CTX9QoW3w05o5z9DD3t2rVI0X11heQsF6L8OEYsZ47DGL
 3FEE8w9SPZ5da9ee8Vji4Do9JjklS1JkBy7GrHyUGU3wYkI17EBg6mPOhJRlYsY1v3nm
 iYC8URlWpn0hJytC8aXSdCyqeu6R6WPbiynRPwZ1pZtOH+qYwRje4FpUOY21K65TcNQY
 b2oiBAAp/vqArg6TJwcwag0SZL0naDmZ3JF7bi/NzqPIi1VOFkYkDFXVeagt11/HRoQs
 t+JG//mKACUAX87o2Sws1Uo1C3UjhK1eFBJuSGAWGNZk/k9q0Nf0RO24qdjWCAS+DUvr
 Yelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLCwmZbj5SvRuszPsiERa19LmTI+L7ux/uEmkuEXA9I=;
 b=GzrJKpdAc3bfqZWYZqiDBrVsTftZS7WO30MOfALQ+cY0NQHbkvdhgL0SU36Yu+FKLv
 wm6sv4obvtgMo3HPc0K2P6FldvgebgXk6M6bxdnnDTSyttSGhi5ZIR65+aydxXYBvMkG
 rpeQ3ctaBjo4nUV6PpcZql3KW/FQXRZcnneOUrQSsvHxHUreseY5JRixar+wzMfscyUK
 n4SswnAFTqzP9ZFLIL9bL/+ZQXYE44kZko+zFxIbzTu4OkL5Ai5mWqAQPctDxpMHh0tM
 xrQuhYBQq57blUHo+Zf5mpbQq6rYVQIQi+oV1dTZvXkocTU1LYB/Yfyyq/FourJAkwHN
 NKhQ==
X-Gm-Message-State: AOAM530KyOXzOU1ZwPXyFZtvOF0tnjBgmUu6OoFk1YtQXB1GOVNeGk2P
 nnqDByUC6P+g/QvG3aE2d97nzkzc05IBs+YiRjJNqw==
X-Received: by 2002:a25:8f82:0:b0:64b:4d9:46fe with SMTP id
 u2-20020a258f82000000b0064b04d946femr16427720ybl.479.1652697732227; Mon, 16
 May 2022 03:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-3-fkonrad@xilinx.com>
 <CAFEAcA-x+7Gm9Jo9oPdcXZ0DpeT=PmfXogxZkjVZC_SL3gHNGg@mail.gmail.com>
 <BY5PR02MB635470A06CB87A0288FE5AC4CCCF9@BY5PR02MB6354.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB635470A06CB87A0288FE5AC4CCCF9@BY5PR02MB6354.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 11:42:01 +0100
Message-ID: <CAFEAcA_Or2T0N+pohncCYzn7ScT9eXEzTpk+cauuBz6Hy+mqMA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
To: Frederic Konrad <fkonrad@xilinx.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, 
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>, 
 "fkonrad@amd.com" <fkonrad@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ozdnFATeHztH

On Mon, 16 May 2022 at 11:36, Frederic Konrad <fkonrad@xilinx.com> wrote:
> > From: Peter Maydell <peter.maydell@linaro.org>
> >
> > On Tue, 3 May 2022 at 16:27, <frederic.konrad@xilinx.com> wrote:
> > The ptimer documentation (in include/hw/ptimer.h) says
> >  * The default ptimer policy retains backward compatibility with the legacy
> >  * timers. Custom policies are adjusting the default one. Consider providing
> >  * a correct policy for your timer.
> >
> > and goes on to describe various weird behaviours of the default
> > policy. You almost certainly don't want to use PTIMER_POLICY_DEFAULT
> > for a new timer -- instead figure out the behaviour you actually
> > want and specify the appropriate flags.
>
> Hi Peter,
>
> Thanks for your feedback.
>
> Yes, I think, I can just use CONTINUOUS_TRIGGER and NO_IMMEDIATE_TRIGGER
> instead of forcing the decrementer / reload value to 1.  Would that be cleaner?

I don't know exactly what behaviour you want, but you should probably
also consider PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD.

-- PMM
