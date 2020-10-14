Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp396283lfa;
        Wed, 14 Oct 2020 05:40:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ8ejDjuNQTuFo/rUySfZqTzTkL3rVh/Rb7D3AByKt7W+SZv/X+Tt9VrKEC1tRaDLBVZCs
X-Received: by 2002:a25:dac4:: with SMTP id n187mr6960032ybf.232.1602679209350;
        Wed, 14 Oct 2020 05:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602679209; cv=none;
        d=google.com; s=arc-20160816;
        b=zvVEZkJTiLvQ5ArUrb2Z3hwhetxlCkCcqBjQQUCP+u23wHO4/eqfcjZquuFx5YWadp
         ZukvfYwwvYcoYmBzQVKVK4gdxYbj0iZAItmbIW1SiYh63pdshmDYBxATAMM076C/OtOE
         T+Xn5fKrs4/oXaGSbEqwkzM4IfITiovSd6rZwnoGc+yVHyOIvhPIK38dnE30rabEzhtd
         FsjaVbNCqisZJCj69WFw3hBwpmqLJY32ScT5BE9QEMBv0uCY7YobtRHX6rtZ5D9bqEr/
         r8yd46BMdPg83n++yfoJ6zLIL+bbEqB0AI0CvQmE61ZlrZYEUfTH2IJagMOl1K+D/ubv
         Mxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Tikf6X+wx5WDdPE8qGQIsJ1PjPO9vo57cY7mn/bJS0=;
        b=raNO+HFQZ8NPsm2zsr3gKunAP6tamrQD9c/IOGM7MA7ilTx84dp5p+CoaE6nLDg5oV
         hUrjYc5dM4k/saHuXsv4OVH5YYLnPHzKmTA6R++gzV7sg5iub1LWRkooD2AupQwHf8hg
         Ko4UZm1Zz/zyFdo8GaIUxRddz8zkqoiUbSfdlJqD45e6x24cf28bA85FIt8xDfVR4VZ8
         oS1LpT4J9bE9L+6DIq86b8hHJs2tZLRqnkVYXC+PspRotV0i6l/Pw7boLrDTEJlMllFY
         GNTCimoCPg73AUfbKFF23+k6pmEE0Y+ZNV+U9rLuU43kVEL9NMb5Hxbbh7jhONlYoNKv
         /owg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=doG+Nmg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si2819422ybm.188.2020.10.14.05.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Oct 2020 05:40:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=doG+Nmg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSg4e-0000gI-KE
	for alex.bennee@linaro.org; Wed, 14 Oct 2020 08:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSg4R-0000fz-VD
 for qemu-arm@nongnu.org; Wed, 14 Oct 2020 08:39:55 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSg4Q-00074P-1p
 for qemu-arm@nongnu.org; Wed, 14 Oct 2020 08:39:55 -0400
Received: by mail-ej1-x643.google.com with SMTP id qp15so4632064ejb.3
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2020 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Tikf6X+wx5WDdPE8qGQIsJ1PjPO9vo57cY7mn/bJS0=;
 b=doG+Nmg3I+PLqB/wxooowpDYV2m9bBtSEU9F9VyTjT0105enGw1wQC01lq4pgzHk+Q
 HfA4iENbX0pGThVBUnJd80aniDJ1siAj+G2bp7vBpv6bc/fDS3sq+nBIC6NrIBV2eDAJ
 HgJX5QpQOKsw5vZDa2zoclG7y3IPIZmoP2AIhDt0Oo0X8OGPzMvkiP6GomKix6Wt4xCW
 mS9R31R7VVGWyoG5F9GKHpwf2Q5qGqfoJiORBxbnnm03dHCTN3dQDp21F0vzQFIVAp6R
 JbVIfhbfBab6GT2ejPO7Nl/Y81Dm9puZ5D44M8vFqmPtnYiy7rlHSwt2cdtei7UTIN/2
 u0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Tikf6X+wx5WDdPE8qGQIsJ1PjPO9vo57cY7mn/bJS0=;
 b=rQRjek68AK0lG0aASeEaRrcQg7YuP9QPp1s/UGh9XKb/Z6LekWmY1BuLD1riEX0uJ8
 m6p/IjoDtReOif5jtgm4nszwh78AkkefioxD3BYjA8Lbc8UIxp9gjsJsJODMXCHi+OX0
 ztdsXZ7F5S7abGsBxwMm2HwMqbmALr2L5dfsau5UT4A5kb2PAdNCAJYR40IRYrR6TDxu
 bTTnUBKdwbT+G+C/dJipA/W5I361fWenqbP9KJhSeblAMRcvihnj/OL8qMARACv8EXI5
 TLktMgLkd5sJw0i36YvU5vIF3SEYnx6qook/zmna489BDkwvQ9k2oD4kkpfRvnc3QS2Q
 CGZQ==
X-Gm-Message-State: AOAM530UgRUAcYOCGFme+4VmBC0ecy3/dGKBkS26vd8DP6Kjl5KjbrWO
 nF32BSUDZn+sKPawBL2tGsmI/7PMW1D18zLYotLd2w==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr5139718ejb.4.1602679189139; 
 Wed, 14 Oct 2020 05:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153408.9747-1-peter.maydell@linaro.org>
 <20201012153408.9747-13-peter.maydell@linaro.org>
 <CAKmqyKO-bRg0WcoqXnt1oaKtgzKTdajwJ-U2YfZh=PzvP77xug@mail.gmail.com>
 <CAKmqyKNpkFmXD+FJHXy4MGL03pUkXgWQLz6qPETB0TQBORwkFQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNpkFmXD+FJHXy4MGL03pUkXgWQLz6qPETB0TQBORwkFQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Oct 2020 13:39:37 +0100
Message-ID: <CAFEAcA_WqxjOFkSmhoNnJUax9u6O6+fk6S-shWWjYK91RBBv5w@mail.gmail.com>
Subject: Re: [PATCH for-5.1] hw/arm/netduino2,
 netduinoplus2: Set system_clock_scale
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P9rBl7trHOQl

On Wed, 14 Oct 2020 at 01:42, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 5:29 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Oct 12, 2020 at 8:45 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > The netduino2 and netduinoplus2 boards forgot to set the system_clock_scale
> > > global, which meant that if guest code used the systick timer in "use
> > > the processor clock" mode it would hang because time never advances.
> > >
> > > Set the global to match the documented CPU clock speed of these boards.
> > > Judging by the data sheet this is slightly simplistic because the
> > > SoC allows configuration of the SYSCLK source and frequency via the
> > > RCC (reset and clock control) module, but we don't model that.
> > >
> > > Fixes: https://bugs.launchpad.net/qemu/+bug/1876187
>
> Thanks for fixing this Peter.

This is already in master (commit e7e5a9595ab) -- this email is
one of a set of stale patchmails I sent out by mistake on Monday
when I mangled a git send-email command. Sorry for the confusion.

-- PMM
