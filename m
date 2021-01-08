Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp613211lfq;
        Fri, 8 Jan 2021 08:02:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye4EJIKoOHhHjZF1Z36TbMRHgioAyd1GGOdXUp6444jXQthMhcerzNSYafmC6aV0ie1Hd9
X-Received: by 2002:a25:7c87:: with SMTP id x129mr6434397ybc.461.1610121721249;
        Fri, 08 Jan 2021 08:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610121721; cv=none;
        d=google.com; s=arc-20160816;
        b=JMLvtZfhA8e3ABy9etfgpcQZ/b6bqk5buNYvXuwWUZcjAPn0Nct/aJRH7O6gZToHKZ
         QbK1CJyOlIZX8AKcDjmpZ4Qa08fAPyE3BpLuhd6jXdL4IUjVQ2klUQHd3VrB7EoEfiIu
         HkikOrTyR4lZtOcFeuxAGJkOqGRK4Cv+NX9OGHVihxi+OJyT4U2UjPHvRxBj3yCqKjLp
         StPwjH3sTqr75w1EDrfUFfhMJ2PG9jSHaTcKbE5r/mnv47adwEiMVYxXPmOKEmm4+R2l
         ilw+MNflWfOvGhyI9w1UKLffJntVF3YCNvMxrEimv5/nHYZnDY7ehJJCcCop4T5QMua7
         HGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2Z3JJqh6lJ4+2UuFN+lpZ/yFsy8mzeTUPDi4ohDRp0=;
        b=dOeM+t9wdQLEjtT2HKwkv+1h0fbF4TUO2UMBQ6BTBfzRdsry/vTuB2qDGYusCnwhFz
         eOEniRANML7i73s5g8dgttUlt+VC4dRb+d112JMhzKOlU211Ho0os5vAdhzUhiGNbYAV
         ZWulWUlZh77h1cyO6DHwusoQQCAeeeB6+fj5SuQ8s2dZiZ1zLTevsXy7HxHWjNYB5BWj
         MR1YItW8FNI7NaUMVqMgMhH02frtm40vusfGBLyRchE0F1aagI0Z0vyQI1BRYzz2lev/
         DZuu9cI5n2hh2gMP80PKbbcHtfh9hVq2BwSrrPG9aY64MjsaULHot/lE2LPlHAZ6f+Nt
         pzXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cDMIOnPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si11406360ybr.44.2021.01.08.08.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 08:02:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cDMIOnPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxuDA-0005An-Lx
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 11:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuC8-0005A0-EO
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 11:00:56 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuC6-0003AP-GA
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 11:00:55 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c7so11672605edv.6
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 08:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2Z3JJqh6lJ4+2UuFN+lpZ/yFsy8mzeTUPDi4ohDRp0=;
 b=cDMIOnPfIKfubaTtfn4xKksco14U2ABle0lZWXSr4YVdwfsB+sXYmM+7EGmcK72xth
 mbU+/KglcXSH51oxWG6749e/6OCu5idrAFvDask9vAdMKrxTtNFwb6ITwDXdP3D2ATu5
 X2wfTdyhcr8JP6/raPXQahawyM/zSqhw34ZqRcZ5nal8lBsFO0yTpJG4vFzd2UWVVvQj
 xVJa7c64cH5iRrxUjQnkAXVaITmbsJE3RYh1iFuaoR8rwzZ+NoFm88IR7dM4WSkqxb4z
 PC/TpJNuyKEoeUchnQLLklt/hg26RTUjUUnA5KCNcHEkzwkXJaIsf1GlIZRMdOhSBKPS
 wi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2Z3JJqh6lJ4+2UuFN+lpZ/yFsy8mzeTUPDi4ohDRp0=;
 b=CacNLOgwbrlPvSW5NyjAkS5WnqYaooaTUQ/0l0ErH86G2g4mZrcGsoa2ghAETnVohH
 /D/AK6iqCipJ1k4oouiIkPwrNkYNHAuC7M+qb9TBKxtQacBVDgDZAlckYzYeI2fvxCGo
 jaHQLS+apGQZhP97f/4DDSj0Qn0vzTAtfBKjpQ80ozuRqjto+fB98h9Utv9daM9QZJYx
 1d5ZD+dB1qnTXz7Y4dXgEdEDBWKb7rrt1fKN8iJ2pO7b+GolxLw+O1fNHC+vUv17DKQl
 5p41dWk7eGNLNfmSVylg7TuiodLSjIyBXXVdUx6FvDI6NPe96wvRlv8ZnUxQGFHhVVL4
 wYlQ==
X-Gm-Message-State: AOAM530tyL+pj1mSYxsn2pEKqsERfiObOBTSAndo2s92YHLLQpHIUpIX
 1FggylQyogw6SXiFNAcCIy8dxDZaZVZJLzU4G2aMXA==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5652445edw.52.1610121652158;
 Fri, 08 Jan 2021 08:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <20201202144523.24526-2-bmeng.cn@gmail.com>
 <CAFEAcA9weaHgHTZBmEeveOxaakpeQTAvqrKGG6pZAprr=DcpWQ@mail.gmail.com>
 <CAEUhbmVsjNAm+arSskKJx5LCCKbcpHyRJr+SO6wY_8mE-P37Og@mail.gmail.com>
In-Reply-To: <CAEUhbmVsjNAm+arSskKJx5LCCKbcpHyRJr+SO6wY_8mE-P37Og@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 16:00:40 +0000
Message-ID: <CAFEAcA_2Qe8PW3A-4Ff+HvbR+A5ACOg3upPUQvSMZ-GuQQg-rA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5TVkRFdnEoI5

On Fri, 8 Jan 2021 at 15:55, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 8, 2021 at 10:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Calling qemu_set_irq() in a device reset function is a bad
> > idea, because you don't know whether the thing on the other
> > end of the IRQ line (a) has already reset before you or
> > (b) is going to reset after you. If you need to do this then
> > I think you need to convert this device (and perhaps whatever
> > it's connected to) to the 3-phase-reset API. (But you probably
> > don't, see below.)
> >
>
> Thanks for the review. What about the imx_spi_update_irq() in the
> imx_spi_reset()? Should we remove that from the imx_spi_reset() as
> well?

Yes, I think so.

thanks
-- PMM
