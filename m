Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp407259lfg;
        Wed, 17 Mar 2021 06:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaNyjG8TuX869wovHCmdO6Y3Ngw/8w4LZQXNcr1N2VGd+Wlwp5d0wCARuBa/6mg82sbSgz
X-Received: by 2002:a25:e0d7:: with SMTP id x206mr4246527ybg.159.1615987401728;
        Wed, 17 Mar 2021 06:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615987401; cv=none;
        d=google.com; s=arc-20160816;
        b=UTOHdf2muUJintUiobzuyy8XG5z3txOFCNQiF5I1IJHhIpxW8YMgYANilEEycjLRpy
         vDvjEA+tOaV4YIRI3tDVLTrO25c8qUtojgxpVlBtvc3wl2yrr5WtG5uTOvcCKpuKQIH1
         SIKGgBwCOox4JVGzcRtn1IWb+R1+ZiqZElpyAIjggDjuiFEnBHv544GrNGXxF8bje58Y
         dNC+tfy9yTLhe7d5sn6SZf5afP9JC08h6AnWTIhwJFR4m3GS+Tuff56iKIjzIeAlZY54
         s2GMciA0FnwI1yB/tq5AGRscISlHnMAfCillgNo/knZaCVrLeTnmKBDVrU2Dka+QUtZ2
         sFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rphJhjkCH8kuw+MPjRKlFNngaeDtByrEV/v9buyyszI=;
        b=0XVHLrwbKzDIX7/7gjofZeuEzfv+gauInNXhtF7rpkdILgSxCQaoxGr9hwV5urKQjS
         +gnFCUjtSoeyp2bTsVTV1VIiQYpm3Yf4l8DpqXg23QnVx6pI0HesbgGVoi8lWcAwIuIH
         NqUxCsoCT5XBJ4dj7y4GVdpwz34Jt7kZeY28s2lrGgLboq5s5qhlZGsOFZcHju+58WgH
         YuaDM0tbtglmghu0mT+5OIGShVk4sPmHOnZ9FSZfHzGSOmR8rAb+3MNLUiLwdxNBjYdV
         fUZY3mhfHfjsslDIV1tU6Yd1wBtuWwflv24OdObW9B8gJ8NQRhlswpWBmqjJRUX7huA2
         0Zfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGmIM+DP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si20366819ybl.290.2021.03.17.06.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 06:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGmIM+DP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMW8v-0005U7-2f
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 09:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMW8f-0005Pt-K9
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 09:23:05 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMW8b-0004AI-7L
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 09:23:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id dx17so2589486ejb.2
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rphJhjkCH8kuw+MPjRKlFNngaeDtByrEV/v9buyyszI=;
 b=QGmIM+DPndpdtVtKZwL6iNQrN/uXTpTOEQMPV8pm2a4cE8RvjmuseKSJ3p5Ke7NezF
 NN3WDo9DyrcUo4AF7W2BscZO8gH76XWIYZJJK71w3gNr6zlGZsniFKG3gKCGp4kK+eyv
 cAesUtpaePwSIleyjKbSDoJPxEggIWiVQiTM4CohTPwUWBLzXbQBUHtHcFafzaHvAkQR
 odgHehOPGOS9SglkvGQt+U7a4hrkD6z4tI7BGp979h5IrrISsTpGaNgqrQCeckf6+IV1
 VGRnpIz53GBfaAtAUGyGXYnYNDhE4ScKJypMEu8p8/TC6D6aAf0lKMMFdZN3EaB5uPHv
 y99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rphJhjkCH8kuw+MPjRKlFNngaeDtByrEV/v9buyyszI=;
 b=JSwHSB/YlWZxPI0HCrqHOtYZr2arkHk4Ccv9qEoZSKy+DVnL6jWAMs1jOCxJE9YkaL
 9Q8pN7keuP8URFJPfcrJ6cPlCmH7DK8//af5dFccaEnOszspFm16jUW4sMGN/6kMkseT
 oVjhWm/A8BvZI9NryjxIWfjcAkKsP8bIfmxTXiz1hAJv/YX9SZW9a+tZRpYkbhbmqYe3
 JD4ei3FobD8UJfgDTlwD+gCNUN2qoNaVe6IWk2rGTpO4/qC3oOVhmaG1Q36p8iKdUmwk
 v2VdrKSN0foFBAXe8HM6FynntmX/Q1wnNb5kDxl1SAbfJBjjm1iDjAqffxT8pc1lqzTX
 qLJQ==
X-Gm-Message-State: AOAM5315g0ZVf66nAY+hunVbSCMeXkOH6psqUt5jo8ElBVKLc1MnDTnh
 YaWeSLt50duhaYlXZ9LVz6gbpGX6yFLOjIVwr6eNYQ==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr36065258ejc.250.1615987379486; 
 Wed, 17 Mar 2021 06:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
 <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
 <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
In-Reply-To: <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 13:22:48 +0000
Message-ID: <CAFEAcA8RZB4-SYBq102T3ogCyTg8HCw2FZ3wV3KQ94zf9qSbwQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJE4cWKuhi1R

On Wed, 17 Mar 2021 at 12:55, Andrew Jones <drjones@redhat.com> wrote:
> I'm also curious what the state of mach-virt's machine types are for
> migration.

Probably not great -- I don't think anybody is really testing
cross-version migration, and I don't think there's a great
deal of in-practice use of it for Arm either. (See also the
issue with accidentally having env->features in the CPU
migration data, which broke cross-version migration: that
was around a while and we only got one user complaint about it.)

Unless we have a serious test suite for this kind of thing
upstream it's just going to continue to be broken, because at
the moment all we have is "people make best-efforts to think
about migration compat when coding and reviewing, but don't
actually test".

thanks
-- PMM
