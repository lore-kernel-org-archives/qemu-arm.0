Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp417208lfr;
        Thu, 8 Apr 2021 05:48:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjwXemmhOYVGiVVmKAD1MrbZIMr0Puj1vXjUnPQTPlE/2Wwt5k47JyC7ITurO9cFbUn1WR
X-Received: by 2002:ac5:cb0b:: with SMTP id r11mr5701892vkl.13.1617886089306;
        Thu, 08 Apr 2021 05:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617886089; cv=none;
        d=google.com; s=arc-20160816;
        b=byn9yqQQMSyozhIQBcS1IGyDMIjroerL4Ye5jmWi8fOP3/VuWQkzHX4jGTabCQnrlT
         Erfa04LssJRrWGuleTAc4pmvWwlt6p4AfL0Oy1TGy+jhb/bnU5TuvrOAEb45EQIUx2MA
         hBxhFhze4oVTgjgcvpvH1ty+tFQj49ieqGo7l+RWAJ3xdhYa96KCjxOyU6P8Kl/6JNES
         gLKcqzVUQ3n0CA7vwHuVO4Ocf8UEkKlftA7r/gaQZfy+tiV7FMekWeWm1L/5CWSRQK1J
         Ti7WMiyEvvEp/cb9hVz2ws0NeL6VKUAsy0ddxnsNBROCfquL8oshPcZTkF9wZpBqBekC
         UmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAYUbw5XgQAHkMiEchtAHmz4INBKE1zAtZGvAkeWZck=;
        b=sah9KG0nEvslMYB4Zin/nSOb7YPSwCvqjwF6aFjpHnI5WOS76+4oB8ZUxWe/Sjypw/
         b7wuT3tyjEltpwWiDDBXI1ToYAi78amL+8BXEi2o4qsa33J6ohBKoYoC/rC+RyBOWj/3
         g1PfjoXdWB+HDAJnDYwfUxlfbQRRBl5/20Oqb5HqkJPcO7ia4RZmW2clQ6l5AQItzeWA
         3RUFoVuFKcn9OR/h6KirUdwB71hcGfn684ATQ5oulaDsd04i00kRqN6R/VLdn2x48lOG
         7g0kYlOzBhIcY5XKXYdWvp+6ETzONbXXbYX3WxUlswAkaiDSDaRDmEJLxzeR17PkbimA
         Parw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aIAvUhPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si6043168vss.210.2021.04.08.05.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 05:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aIAvUhPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUU4u-0002ls-Kc
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 08:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUU4e-0002kE-7t
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 08:47:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUU4b-0007G9-LS
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 08:47:52 -0400
Received: by mail-ej1-x629.google.com with SMTP id g17so44954ejp.8
 for <qemu-arm@nongnu.org>; Thu, 08 Apr 2021 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QAYUbw5XgQAHkMiEchtAHmz4INBKE1zAtZGvAkeWZck=;
 b=aIAvUhPO7Cq015u6T8+6Q3fP2cnZaJmfcfO875KbHBIt3U38SNILKbl8XhXYeoXc9T
 k4nRoVIZeq5+yQjU7yWJz+ISueSfApNlHPvuPrvEvCAw1rd53MgBnYA48MtB+o8XaumK
 7+gA1UtROA17rCjSa70L+dKymMV1N4psuVe0VO6NmxJD3yhP3bjO1sKyx0O2eKpD7e6V
 wSIlV4IasAsVvzM3259hwqGCSFyF8Lth39jvQZa0Z91llb1HXwucXsVNgxctXgwczFZW
 WhQNnnTm6noofH0OLNRBI4SP4Z4Xovaj7aIHA4WsXVYjKtLG6aO5HOm9V8gZ/mmhrkkf
 nq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QAYUbw5XgQAHkMiEchtAHmz4INBKE1zAtZGvAkeWZck=;
 b=bfqpSR4675yV2OW0jGXng0j0KlafFXbtvf6tFUrxCbVoRldsbm9TF41Tx09hQ2taLB
 CsXqz/cN/kYzQvxjSBkt4h882vKjGJvewwNesL4Eu8Nnbd9glAqc4xwsl3I7jVTKNLwJ
 bCzb5dIReFrHR5+TOyL9gAyvRhFNxPilx6DPHM0rND2a0YmY6U6jwmWUMFJGKkq5tbyk
 CAE1AVPt4utfzTy7RxHPDJDw2Iz8rhfOnfr1dWO2PKlXRwtbNw9BNaRFOrw7auZ1ilC2
 muYRCAt40YcBdlIbu8IulBZaYr4XENozoF//wawP3MyGw2iRlVjJ5KOPVyCatdzOr6PM
 oaxw==
X-Gm-Message-State: AOAM530Vr3YH3s+n0iKzQzyhNgNclmWkXqZXO4hhBntH6Pn54HSiuHgn
 8zd1vdOUgnSIGThfTPlYjzD8fHw5Z/GDjEPKGrA1Xw==
X-Received: by 2002:a17:906:881:: with SMTP id
 n1mr10323609eje.56.1617886067873; 
 Thu, 08 Apr 2021 05:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210406174031.64299-1-richard.henderson@linaro.org>
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 12:47:07 +0000
Message-ID: <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] target/arm mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8sdiduuj5wvt

On Tue, 6 Apr 2021 at 18:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Fix tag count computation error in mte_checkN, which when used
>     by mte_check1 in patch 5, caused all sorts of KASAN failures.
>   * Fix PAGE_ANON / PAGE_TARGET_1 overlap.
>
>
> r~
>
>
> Richard Henderson (12):
>   accel/tcg: Preserve PAGE_ANON when changing page permissions
>   target/arm: Check PAGE_WRITE_ORG for MTE writeability
>   target/arm: Fix mte_checkN
>   target/arm: Split out mte_probe_int
>   target/arm: Fix unaligned checks for mte_check1, mte_probe1
>   test/tcg/aarch64: Add mte-5
>   target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
>   target/arm: Merge mte_check1, mte_checkN
>   target/arm: Rename mte_probe1 to mte_probe
>   target/arm: Simplify sve mte checking
>   target/arm: Remove log2_esize parameter to gen_mte_checkN
>   exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1

So, what should we do with this series for 6.0 ? We'll be at rc3
next week, and this big a change seems risky at this point
in the cycle. Is there anything in here that's worth extracting
as a for-6.0 change? (maybe patches 1, 2, 12?)

thanks
-- PMM
