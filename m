Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5306611wrv;
        Tue, 6 Aug 2019 07:09:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJasV2tRfHKdGdf3d96MSxC9cIIKL2x5Zj0vwNxAd/NwBPaui2NqNKNbeRCtlmtvpfXVUh
X-Received: by 2002:aa7:c393:: with SMTP id k19mr4039616edq.76.1565100544472;
        Tue, 06 Aug 2019 07:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565100544; cv=none;
        d=google.com; s=arc-20160816;
        b=kU/vv4RbJ4TlzQ9pXTwUkhHTI+6FQDOkefSZJQU/xGyogBG5/lCjND0sMmk/kZ7Ys6
         sKTT/nvstJZBl2x2PhIsKHN+X+lymfhB9pZ9nzLf4Jx/EaJD2WO0iBEfF0v0JVKOBgXD
         tJxbfNJjV1mlb+8byVkvTA5Ht36O69yOF5ufy8EWuTHzoFPp8YCuOlDdFaNEt5KoCEZG
         KX7k1nLXP7wHuo8mNmQQlXe/v5Y1EZ8JDNTVdDwFF9qj5ndprVZ6a+XaRoMkO0rRVjwH
         +DshRUt9z1Nd0ac3YrCHRMk7iUpE/5jejQiTKiDWh/MDDI5A6O6ffprP7HxcV1VQ/TBo
         AjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzgxtu0/dq4kwvaccOAO9rAoqxbKfC7HMKno1MSksXQ=;
        b=vOh1OWjaalulVT2p1P06P9LSgPVCcW/DrqRdeCrF3Pnnh5XC9aRuKpPBFBdb6t43EL
         ViGxyroS9nJsu1Iv4dTbgPYeHpMXxQL8/BT3n6VWxyNGZfZv7gxAe0m/I+lkh1u0ipB5
         GifrhM/VDV1VhkY6RR//cQiSF097gYVF9iTljPWLeUOEisTJ/BDNy6O/KK4lMYz+GByq
         ziIP9D8wuXjaAaaFhLv23VnQBuQ8bW9rdBwfac9Q0LLpucD0NsLxR4x35nGCr9GCjgsu
         uuuFJD+2XfrX4jbNX9yWb39dSZnOAA5l6lb+LjSndO3mce8J2+dX0oWNm6Leebn07Dxc
         F8oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VJ7e+Z1O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si27675555ejx.120.2019.08.06.07.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 07:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VJ7e+Z1O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hv099-0005R2-Ik
	for alex.bennee@linaro.org; Tue, 06 Aug 2019 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38521)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hv092-0005QI-Ts
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 10:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hv091-0000Kg-PB
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 10:08:56 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39319)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hv091-0000KM-Im
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 10:08:55 -0400
Received: by mail-ot1-x341.google.com with SMTP id r21so86768901otq.6
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzgxtu0/dq4kwvaccOAO9rAoqxbKfC7HMKno1MSksXQ=;
 b=VJ7e+Z1Ol7lot7JU9WFcp8j272IHcxtN39+DctnTo9G72lkpiWxVQvh8fjHFF/Rfsl
 f0S9jBPfinAnzWkgP/DNPlqna4Sp/P2M8qeNv+dSSulsXexTs4HJ7wRQbaWnD6EzXWRg
 I74d1YmHkOEH87ltf21QOxo50iyf2tTN0ZTcZLWvBDoRtHq7Pd7zsUZwGdIU4vfAsarM
 31DRysbx5cQ7aYDIK7YHQmbGqQPCwywbBYqdy9do1SqxY6wVIh6rjr8PjcFvkwR4c+e9
 0P0wBUct7aK1ggypZrveaOihL3cEg4xzzHX7NO4YD1Re+va3PLDEc6onfqFoP9uX+SDw
 7o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzgxtu0/dq4kwvaccOAO9rAoqxbKfC7HMKno1MSksXQ=;
 b=fLZH6DnclRyxj1Bvs63IpsetYneYfGc57KHH4J6+br7T4tMHzIpfUcMTh8BfXNUyDz
 sstevijIoUoL1mMJ0ljGWsNn9NQvh98K8etA9/HYDSxmwwlOnTBzShzdwXhLCpmlQv8/
 qs+qwkoBLaMH7z5IGy4k09OAyh1r0yX7ttKHoiGdSLCD0hIRwdDun3ihsW1dHW7TofUn
 cQdBFzFx9EOFoUT5J4KeTencYbVwbA8/yCltV4wNPHJIKqgHTSNCE4l5q41suP0BVTTT
 cVhaxB5hp29yHj11ySpG1dqrt3yR6LSNrILMdowvGZSie2uyLZiSxt6G1YfMSLC2C6JG
 vTlQ==
X-Gm-Message-State: APjAAAUo4v9zjPczUaGrysYiA5RYZyjlBgsHlbqxIQorwWFIJPsOJ2Md
 JxXJJHLKY9iLhQK3S67o3dnHse2PtSHhzVlCAe6l9A==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3505008oti.91.1565100534453; 
 Tue, 06 Aug 2019 07:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190730054501.32727-1-rashmica.g@gmail.com>
In-Reply-To: <20190730054501.32727-1-rashmica.g@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 15:08:43 +0100
Message-ID: <CAFEAcA_-qLt4JzMkG7mm5wnVvrpC8qnO=XC0GWmcU2ZXoMQEtA@mail.gmail.com>
To: Rashmica Gupta <rashmica.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v3 0/3] Add Aspeed GPIO controller model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hGGGUYOUDItB

On Tue, 30 Jul 2019 at 06:45, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> There are a couple of things I'm not confident about here:
> - what should be in init vs realize?

We are not very good at documenting this distinction (and there's
some bits of it I'm not sure about either), but:
 * init cannot contain anything that might fail
 * init cannot contain anything that affects the simulation
 * init shouldn't do anything that needs explicit cleanup
   (eg memory allocation)
 * property creation has to happen in init, because properties
   are set after init but before realize

Thomas did a good blog post on this:
http://people.redhat.com/~thuth/blog/qemu/2018/09/10/instance-init-realize.html


> - should the irq state be in vmstate?

I guess you mean the "uint32_t int_status;" field here?
If it's state that's in your device then it needs to be
in vmstate (this roughly corresponds to 'is there a flipflop
in the hardware that holds this state', though that is not
a 100% perfect guide). A 'qemu_irq' holds no state of its own,
so you cannot query it for the state of the line after migration.
So if your device model needs to be able to know that state
itself then it has to keep it in a struct field and migrate
that struct field. (For some devices the state of the outbound
interrupt line is a purely combinatorial result of some other
state: "int_output = int_status & int_mask" is a common one
where there's a "raw interrupt status" and a mask bit that
suppresses the outbound irq line. In that case the int_output
need not be in the device's state struct or migrated, because
we can just calculate it when we need it from the int_status
and int_mask state.)

> - is there a better way to do composition of classes (patch 3)?

No strong opinion. From a quick scan through of patch 3 it
didn't look obviously doing something in a suboptimal way.

thanks
-- PMM
