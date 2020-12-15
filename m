Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3409176lfq;
        Tue, 15 Dec 2020 03:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3MK26JcmnV41/6yx8303UB7iBiXsdgtQxNveW5uCd8W3Az7NqSgbK+RpVY0WEpu4siDnF
X-Received: by 2002:a25:57c1:: with SMTP id l184mr20126057ybb.382.1608032168390;
        Tue, 15 Dec 2020 03:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608032168; cv=none;
        d=google.com; s=arc-20160816;
        b=tF+9syDNZbTiJD/ky99YQRmrJaLBKSbEqZ0/MM84Gq4NJ0lqzXQWoaWJ9mEf+YloBB
         CrOzPNBlwsUXUnTefp0xyXytQdaFkS5+YHqvo6vcZiScgXWkstOTdcrZZB22QH4+pCHs
         UK+hjJ+avIXyAZUAZgrdDCqq5I2VcNy7k/fxyqWN+FqgNovo12Ip5Lt8wnJ4U8zhsV3s
         aUX613UQGH1bK/JXny5HE4z1H7wy8uEqlYjKvyAJeFbJA0iODqaGTkEElww15M1sUehO
         BW3bIojLolSpVkxq03MCtNXxs722s/Oen+6aHnj4VLosne4f6yaLNcXJ03F8emsviebE
         PTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugHnBKbiOw+vGkqie8l/9hZ/o/LVdpm68kVJpnSWLKM=;
        b=B2qQQXdx3CW9knMMW4qeObyPjSjiERHeiN5SXpsFKuD8WhgrYyeP39mD4UeQkpvY8D
         hL3BwfLEFtXIxreuG+ZPSCchU3os4X2VD4VdU4uDy+tELR5ECdjh1bTUVq5VxmYV42uh
         Scu+rviHpTCggfs165KwbMv1yPHe0u9Kt3OWFHteX9aThzVvD4kSHcgxaehMePifXllS
         qSZqAwdjqhx+CW/AE/OxpqT+tKPI53AmhAu7D9+/EPyZeBA59KR9TklzUIAQQ6VdwkQV
         1XjS6h9xkBQCdMPLZSC/tqIbcxdzeBIvfkR+igMVbXs2VTT6UCMIaWPo2Z055Irh+i5C
         Nn3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="b/OKRcYZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si20410657yba.279.2020.12.15.03.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="b/OKRcYZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8ch-00067a-Jn
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8cU-00067O-S9
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:35:54 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp8cN-00059s-NK
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:35:54 -0500
Received: by mail-ej1-x642.google.com with SMTP id qw4so27150045ejb.12
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugHnBKbiOw+vGkqie8l/9hZ/o/LVdpm68kVJpnSWLKM=;
 b=b/OKRcYZRZkaYL476g0MVRN/NbFkCoJsZTnlPSicfZ8cszo0p4TS0DMfT7Az8MEvg4
 OlEF7XtLuKmuIXL+Zdi9VCYKXrXLKBNPA9gmRMPwLl66JOcGsnBSGI8W6998tGM9/wR5
 Osn4hLU6ZRdhFsr+Y+W0lk/9jS1ZIyJl5FgQZn4g1dYfCzvLIWcxuI66vvC3wVzTLDe2
 p0O7jf94T3Gxh6O9ONNfkqDTt3qeBd5dQ8cLq4oukOZ4z1mufJlvNYu6A84+ccIUTl30
 VljBp+CIyDMPi16pIwWK6vBXZV6hrRMvQ9BvxjMD5WHhebITDqnSeQMIcTbRkEXuaEqp
 wQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugHnBKbiOw+vGkqie8l/9hZ/o/LVdpm68kVJpnSWLKM=;
 b=coEmxbE2N32cdEeN1h1iyfdTMC77FvqiheI7fvhnbMr2KrJnwypjMsvkP7pYzx4E/j
 8PljKg4KJ/BGF5jHxaqqqWPdZ5egmJfpAcf22qXUXWRFhYtzMji2vdQxkH6CrIHmpb3n
 R2MSsCwR/64KQvUCuKdRuzAI/+abi3buxRWSf76MbW7vSAP6SJiq6uoXym3oJDMb6qFM
 qgc+5lMT9T1MEdBMVVTcDFKkP6+tMbf5gJ6WPRFYXx6GrtOQtL+sdE2/UaUOZZomi2qb
 6/zjy2reWjXlOoVjKfvp0q3RhLS4lM2AG/fX6l3exY9M60jPBr/PQHAGAROujrxKE3E6
 vwTw==
X-Gm-Message-State: AOAM530FrLiS6quz87S85FgQpEWnDwkMyQHxtKf+mLObgeE7x9mYrJgG
 r8sJsPTSCBMjuxVSz7H3ZenEGPcyAE2K0t+A15Oeag==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr26367127ejf.407.1608032145960; 
 Tue, 15 Dec 2020 03:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20201127071803.2479462-1-ganqixin@huawei.com>
 <20201127071803.2479462-2-ganqixin@huawei.com>
 <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
 <CAFEAcA8pc+vCBj9fk+8jwXV6H0H3xOe2Q0HY2=irfkTRfwOVTg@mail.gmail.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065F5F11@DGGEMI525-MBS.china.huawei.com>
In-Reply-To: <A5B86EC83C48EF4CB2BC58BEF3A2F496065F5F11@DGGEMI525-MBS.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 11:35:34 +0000
Message-ID: <CAFEAcA9xHaewrSMWfCWDwsFbm4mz6QwKT7vDDHv78mEkW1ad2w@mail.gmail.com>
Subject: Re: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
To: ganqixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SZ7gN7ifLrRL

On Tue, 15 Dec 2020 at 02:38, ganqixin <ganqixin@huawei.com> wrote:
>
> > -----Original Message-----
> > From: Peter Maydell [mailto:peter.maydell@linaro.org]
> > Sent: Tuesday, December 15, 2020 12:20 AM
> > To: ganqixin <ganqixin@huawei.com>
> > Cc: qemu-arm <qemu-arm@nongnu.org>; QEMU Developers
> > <qemu-devel@nongnu.org>; Chenqun (kuhn)
> > <kuhn.chenqun@huawei.com>; Zhanghailiang
> > <zhang.zhanghailiang@huawei.com>; Euler Robot
> > <euler.robot@huawei.com>; Beniamino Galvani <b.galvani@gmail.com>
> > Subject: Re: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the
> > finalize function to avoid memleaks
> >
> > On Mon, 14 Dec 2020 at 16:02, Peter Maydell <peter.maydell@linaro.org>
> > wrote:
> > > Please don't make unrelated whitespace changes like this in a patch.
> > > We don't line up the assignments in this sort of struct -- this is
> > > deliberate, so that if a new line is added whose field name happens to
> > > be longer than those used already, the patch does not have to touch
> > > all the lines in the struct to maintain the formatting.
> > > Instead you get a readable diff where only the new line changes, not
> > > all the others.
> >
> > Hmm. Having said that I see that the other 6 devices touched by this series
> > did use the line-up-the-assignments style.
> > Anyway, the style this device was using is the right one.
>
> Thanks for your reply, I will resend this patch. By the way, do we need to keep
> the other 6 devices in the same style as this device?

My suggestion would be that for all these files you just add
the one new line you need to add, and leave the existing lines
in the struct the way they are now (regardless of which style
the file is currently using).

thanks
-- PMM
