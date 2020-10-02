Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1673947lfq;
        Fri, 2 Oct 2020 08:57:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzedevanVwoZVdbzz55QRDbJ75vgjdndSMF0Hwzmsp2vPYgTwCaPfU+x9bDZknuMfN4+0hc
X-Received: by 2002:a25:4845:: with SMTP id v66mr3651333yba.397.1601654239133;
        Fri, 02 Oct 2020 08:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601654239; cv=none;
        d=google.com; s=arc-20160816;
        b=QHf0C9qU09Q7WKkixoZZs4Ho9A+eQTHS8gju6SkA/kOurvHCK/EqYVUjp2nhfj+npM
         1UJ28ASjH0O2WXUmAIH4HNZeaUq7uN+WTa4Q70S3EiqzIuQRF8eMiz2WH46PKYngdoVS
         oa0DSmWdoebGwzBH/CbYQkhTBr3/A5P0U7+0nCIPpcWdFQCKyOOWtGxEjyKcTP5HM60X
         mytTyTB3pjt79+tKgY8tFF6u0dFX0HgM3+wlfkUniWnMtYY1MpZ7QZWHIXCpydL6tR99
         9AngQ4qC4jKXi1sOvqvwdgtuJWmHUIkkqkFPZZkXZE9SLyhdfJclqcdNxhWaaM1Z1zDv
         M6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IqVrNhZTauTtwi6BBKx0EUucNfa0p2NyiXM/ojlYnfc=;
        b=a0ZwCs7uN0kMIpoTGX0PDvjpe+GhHV3ii0CD3ajK749UVpDiO8ZH2l4WbPSnZGlbYp
         9N4GEnJ2T1QEAPLgbGjOgDCquISzSrTo3vnKrHJ3VECzWf5lCw75gbo4iGMY0HDPVhKj
         fdzOQoOf1JEntMhZYE6rzPtKegsC7rmHPc4FdirQARorAP6VXSYaEeXjvdiAsypcVlQA
         zXOJiVNIqkTsOat28JlyFi0pQbqyPpAxlxm5r/Fc/B0g/WsBkymUOkuPEqd0CxMZxpnk
         Lf3m0dSVus9+hCpiLmFMiimrtgfdQHxI4FUasWNhNjVBYfr1jB5NbWKe83UOFQ7Wu5C5
         3YPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nYu7j1b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si2126955ybf.423.2020.10.02.08.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 08:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nYu7j1b8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kONQs-0007as-HD
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 11:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kONPy-0007Yh-FP
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 11:56:22 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kONPs-0006Mj-OV
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 11:56:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id md26so2651492ejb.10
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2020 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IqVrNhZTauTtwi6BBKx0EUucNfa0p2NyiXM/ojlYnfc=;
 b=nYu7j1b8J0bUKwuB69hdchKrJnfWaGbA0wqMjFuumPqJv+r+eBilDxudUC3mVk5hf+
 Y+qhfEvn02nufswaNqnNC5i8e2brtRSiCMOdFdX+vsN7h0uBjjOimbUfgX4ZMAjBOxLJ
 mGwfpfiRmJQdD/qy8mWOh1/Gw2sdQguFfE00Qb6pSqRRQLX7pGkJdUeM6IECd6mjyYJ8
 04bLNRn44LX2N8C28D2/f7KoBBTP6oBQxLmqwm1a6B7JW7cIaBWaStY5qx1F4VH734dP
 uvqMXdK/Iv6s8MeuOaDTBmdDfGuMHFBPw+ynnYodOMfQ66s7RaRJxDIRt2M8M4kQ+pxG
 vUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IqVrNhZTauTtwi6BBKx0EUucNfa0p2NyiXM/ojlYnfc=;
 b=NlEFf/5VpA/NNmS1ZE0KsP2MMFF7VWsi2BF1cVRbtYPVi2IKpsnZBYpzcBIY0Gj0pY
 W9rb8r7TVLE6N2XzNt10fXa7ALcPVNipTTrZUtE1X5FlHJDYGe1TR6/c6U1fW0c9NIUI
 lhjsusrcJ58V5LOSfK6p7zwJVqS5/IOWKVQtaEYrU+DH4gb/Zl6RhCu7BTwm969QYY+g
 euy2voXZwooIuSr7NyPD1N6G04ujiZl+nbjM+afB+2izF1839sVoXK8ia9ds64VfPW6E
 WjpHEfjaq45Br8N7vCBeNoS57suwbw3DFHsTGf6fsWblFcFKAr4XweDUIGeuQSvvhwuG
 u0wQ==
X-Gm-Message-State: AOAM531UL98GDSBFHaHdqC8WzR9q86ZRW4yrVU8yJKxlQuVjXLP7i83v
 K1WrJeDq7BeNCOwkMG3lFDYoNpB6nD0zqpz004P1Ng==
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr2901769ejb.482.1601654175048; 
 Fri, 02 Oct 2020 08:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
 <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
 <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
 <1bfa78a6-b478-118f-c284-466dcddde468@amsat.org>
 <CAFEAcA8OhKmg5R=h4E4qO_RwPGbP50p711j_zjoSY-fhjeMAjA@mail.gmail.com>
 <CAC41xo1cOxgM5bR9G6O72QRgAcPMEA_tCje0=HZ73vGhD22hQg@mail.gmail.com>
 <CAFEAcA__RSrAhxWe8P5JkJwh3p8-w1MiNOjgCf_D323mxns5UA@mail.gmail.com>
In-Reply-To: <CAFEAcA__RSrAhxWe8P5JkJwh3p8-w1MiNOjgCf_D323mxns5UA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Oct 2020 16:56:03 +0100
Message-ID: <CAFEAcA_psc6qJ4dcxb5vCU5f3hf6sm5FmjMCwW6X7DNZ-pefHQ@mail.gmail.com>
Subject: Re: gicv3 maintenance interrupt not triggering
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/mmhu/zhOIB

On Fri, 25 Sep 2020 at 17:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> Do you have a test case binary/command line I can use to repro?

Ping? I have a draft of a fix for this but I'd like to test it
before I send it out to the list...

thanks
-- PMM
