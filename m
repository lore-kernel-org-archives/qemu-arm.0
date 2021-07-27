Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3586247lfc;
        Tue, 27 Jul 2021 02:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6ij3BpD/ayKoNtBvNOIh8oWR0rySfeqHo4QQ9O0YNM5EREgAlYaycxb678+RL+CyyNqtw
X-Received: by 2002:a05:6e02:1c2d:: with SMTP id m13mr15857486ilh.137.1627379990302;
        Tue, 27 Jul 2021 02:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627379990; cv=none;
        d=google.com; s=arc-20160816;
        b=WG7VUfTwt3qoJ/9t4yjgPYg1jOU7Eq1X5BaZyQVsf1k+k5mXdVX9S8tFyWNaqTdaUm
         6nyxx65KoGaRf1DMqrUlUMxynHcEiWLpCnBfDrxkc314mBLKtqBvsjM+bvzi8jU/oKLO
         sSZpcGsX+1L+zZmkW/NnuhcphxIWeJLYotJeypwV6fTgQSDkAl20DpfBkQwmD4c1F2m/
         AqfxDvubar+eSLQdJqkIcP9bffrMDaBPO7QuUOoxzA+8+3/hH9+b1BfVwVbclGzBs1B7
         r6o4eT2wuWNrmmIGH6ZSq1wxQH55ZFtIjus9Lbtku9+AOij5r+XNEywpdXsZHrGqFkPL
         BluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lArMNQEDdOlxa3qae9jy7hBhFApSQSSTf8XVUotnVBM=;
        b=0nB08tycP8pEcOztRqQJcvuOJ0T9s0qXF+ueibWAgh7WoyxTtGxZ8PjlukgRUu06hE
         /bv5Xp2h7/WrW0tqdaeOhAtMUlMrkd6HSvI7PDNzbogTYjfQZSgvH4bO8QTqkPdmgCZ7
         2f/SQFzK12K9Ini+EJg9CTBY7W1RpqZn7swMBJ1BMbe6HO4cgMYivZDQ/FqwvpC+CXDV
         2LzPGwH7Mc+Zo+Sne+vmdIjZ4vdlz7AKsAJyWbCX0qxLac5N3u94CDoaesgYQ6lYNBCW
         75GQOb98Bg9LRZqd+hxcLYO4XvO/UzkJuidMh4qK+yKhcZp3CfFSikYOIzD6307hL2wQ
         j1yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oag5gO49;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si2866798ilq.85.2021.07.27.02.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jul 2021 02:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oag5gO49;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8JsL-0004Uw-Jd
	for alex.bennee@linaro.org; Tue, 27 Jul 2021 05:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JsC-0004Uf-SY
 for qemu-arm@nongnu.org; Tue, 27 Jul 2021 05:59:40 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JsB-0005TG-9W
 for qemu-arm@nongnu.org; Tue, 27 Jul 2021 05:59:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id j2so13681153edp.11
 for <qemu-arm@nongnu.org>; Tue, 27 Jul 2021 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lArMNQEDdOlxa3qae9jy7hBhFApSQSSTf8XVUotnVBM=;
 b=Oag5gO49g/2Gp45IwV/nk7OcsGwy2nQ+tOMQsL8T66bYOOjGXXYPgdAkA24jv4VPA1
 FRGKxH0UUmPiVBWIWr8q6902auD+4XaqJECV0RwRgpVoyapqKfIeM83RIl8g0c/mw8p8
 1dN3e+sneht4TqdpnVQQIlZvYOcTzG5uuT1jIBi09eaF/DAsnJuYQ2kbtg5KZam3dA7X
 hcInjJ9Hg5CdJ1XKCXecojI+eEk24bLBrwKqqWZobKE1M0NX8ZkwU6QGCcOPg9GT5FRV
 47I22cq/k6oYhNfFPxyyyXPxaTe5/1wGvn5Kkw1b6dXMGUXMOuYwWfWnePdubGHLGYH8
 VBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lArMNQEDdOlxa3qae9jy7hBhFApSQSSTf8XVUotnVBM=;
 b=ebXa3TpA2jA8BkP+OCU/5zXs6a6qJ8AMJxSIA/M/vEVVThezv5nF/CFgQ/vIsqXCtf
 rOEn58htUo2a4SooDwdweXoz8kN6yous10RhIyRkfblC7g4nnSj0qoPYZXwQJqvh0cUs
 BVJNVQ4ArEpqeD6KY6KeYBz+SUbVJnRKtenDZWfDzkdPyNXhyV5YxRSlN+APWH60vVRf
 ezL8Z4/1uPqCTQV9mtemz0OqA+nhczA+RBeRwAjztW8aQrwasHVmnw4aq+cWJo2nctgd
 GFRFC4cIDE55eTvSEW94i6+rCjLpHe9IJNBWtLJ0cAW1tfItQclXTZ40GbtZMz1s6q+U
 2l3A==
X-Gm-Message-State: AOAM533NXD9Dkov3+F75ryPcd27Iry9Qou7zpIbFYE/ry+GILoaCt9SQ
 Oufd1d3awAwdktjKwS65WG6Wq4G99I9YcZ/KpN7bXg==
X-Received: by 2002:a05:6402:35c7:: with SMTP id
 z7mr26917308edc.36.1627379977943; 
 Tue, 27 Jul 2021 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-2-joel@jms.id.au>
 <7c5dd20c-4710-4bdb-605f-e35ed7bfb35a@kaod.org>
 <CACPK8Xe=v4KRT1TqC8-DFWxqUoCak1MisWr84_9ug-xfXezWEA@mail.gmail.com>
In-Reply-To: <CACPK8Xe=v4KRT1TqC8-DFWxqUoCak1MisWr84_9ug-xfXezWEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:58:55 +0100
Message-ID: <CAFEAcA9t4P-h2fnY7=s_jt0RmB0pj2gUuz6zVZ7YfF9uXzKj9g@mail.gmail.com>
Subject: Re: [SPAM] [PATCH v2 1/3] hw: aspeed_gpio: Fix memory size
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBVzo6mfAaHD

On Tue, 27 Jul 2021 at 09:02, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 19 Jul 2021 at 16:02, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > On 7/13/21 8:58 AM, Joel Stanley wrote:
> > > The macro used to calculate the maximum memory size of the MMIO regio=
n
> > > had a mistake, causing all GPIO models to create a mapping of 0x9D8.
> > > The intent was to have it be 0x9D8 - 0x800.
> > >
> > > This extra size doesn't matter on ast2400 and ast2500, which have a 4=
KB
> > > region set aside for the GPIO controller.
> > >
> > > On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so t=
he
> > > regions would overlap. Worse was the 1.8V controller would map over t=
he
> > > top of the following perianal, which happens to be the RTC.

I'm going to assume this is an unfortunate autocorrect for
"following peripheral", and will tweak the commit message...

> > >
> > > The mmio region used by each device is a maximum of 2KB, so avoid the
> > > calculations and hard code this as the maximum.
> > >
> > > Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific implementation=
")
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> >
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Cedric, Peter; can we please get this merged for 6.1? Without it the
> RTC model is not functional on the ast2500.

I'm doing an arm pullreq today so I'll put it into that.

thanks
-- PMM
