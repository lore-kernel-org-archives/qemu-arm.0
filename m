Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1796874lfk;
        Thu, 10 Feb 2022 12:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJUI2g7pfCpo3ngawQGvw9dN6QsJPn5mo/oAAlPbdgAK0emCyaDgFaLEeDB0malc3foo1Q
X-Received: by 2002:a25:610e:: with SMTP id v14mr9211554ybb.722.1644523731968;
        Thu, 10 Feb 2022 12:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644523731; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/Cux+QIHMMs8DkA6lBsenDEQecWpZLcVmvv0Q6WiXfww1P7/NZwMCBXgH0ltxLEL9
         gXvtkidIkpOWQdUcfOZTkbTM8iNOk+SCQw6TPf4bWQYQhd+Q2sbLTtQUZsF1Mx2U9G1P
         LKX+RcUYP0jVrk3hk+7juFClxSHBzUP8m0XiiQJBQ70es6YVSnH5m67nGrmBcqvR1dSB
         roGZYzKwlzYMjtRXcZXN+E4XqPJMvSmdNgDu5samNXJ6yj2F53xQ3kT6ZcdioBvLkRy0
         5yrCt9gCMKebttG7WXAa4DLOjv6HCpFX/5033nxAodFTej5iSzZAKI7ngicWT6YAS1oR
         wf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JR9e9fWcfms64DuhxI4GYueHehDidQTtSLd+kfj1mKQ=;
        b=uzkY8yeEKNXy2zRmpI5We1sUG2MeeWxhfTRKdbQqnGR/1fd1l4rpknoKPa90p6fuF6
         yukyrQPUcURslpBa1vfiEfdNxNorlylx355QvD972Rdpuh3BpwLKYmtbDEfOsLzf1RR3
         +SlwzaNkn03gomUjxSqCsYDlw5GP9dhNGXF2uwMTPm/FmRapHDj9/3AvbMPsVndBkIYl
         Cui99El3+vBh6AUHH3PJ2QSzKisEuLXrvbTIWH2aOAYtkJVpxl5twn2QYJjOfyBZcbaK
         NCYXumOomZt+5IcqWxioejsZ8kUUguytP0F1qi+8MKKLd9h2BXDhzc10rFJ2edtr+sqW
         cUkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2guZVxZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c191si14798940ybf.163.2022.02.10.12.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Feb 2022 12:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2guZVxZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nIFkJ-0006go-CD
	for alex.bennee@linaro.org; Thu, 10 Feb 2022 15:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIFjw-0006g7-F9
 for qemu-arm@nongnu.org; Thu, 10 Feb 2022 15:08:28 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53848
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIFjs-0007jk-T6
 for qemu-arm@nongnu.org; Thu, 10 Feb 2022 15:08:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id qe15so6151588pjb.3
 for <qemu-arm@nongnu.org>; Thu, 10 Feb 2022 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JR9e9fWcfms64DuhxI4GYueHehDidQTtSLd+kfj1mKQ=;
 b=f2guZVxZRF8qfzBz/UmneI8yyIbdut+kYFi7gohaMlOhx40ZHp39Yk4xtDmyND8wa/
 Jvd71uDw6hXdzQLRQDbdlxu/P7traoHtzgnJTou8dCxuF7XH5BxxvZAJEoYG6c7KSJET
 kugHg+qUn2WoL4DUkb2Y4RBjDAXDKaifTvVq8HL6Vg1dU4mN1wZswK6DOBc2O8JtI9Dw
 o1OYvugMkD6GKEo4d6rNAnyz7kL/WgLLwYXHCIP4cv/e2SN35JT8ikHWljRbKSW8yfL2
 xqmVqkcfaEAtwQ5tbT9tZ/ZUsiFK4R9uGrOvzd5QdmfhJTdFc+j8u0zVb5aajFUdoFWW
 1Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JR9e9fWcfms64DuhxI4GYueHehDidQTtSLd+kfj1mKQ=;
 b=a+XW/dwMgOF3FQS1+oCZ49CtGN0ySZetY4Pa3O/9Qti4pyzBNN5uOKjiB5almpGO/L
 u7fusCEqik0MKnkR5ZVc99hy1Ksxvmf80Ti93Bx7JYyjdo2UpBCDKq+X+Jzlcj6zne3c
 R+sUjf4VOYDyJGvpJZxVuEg1btQl1sN610Dd+mrgm3IN64agVVBJZmomZixTQnYglm14
 2TF+OeGNeK1VYc6C8+/gBuj4PZHcHsYfZ3Xq2H9tvpThyvZdAYT0GdBI97qfBLP4l+sa
 tSYkia/gXkO6SiBAdFi19jDwxmty6VYhEdDA51bnDgrHwBVhE2jig85kKjUkHUch41Ry
 AOBw==
X-Gm-Message-State: AOAM532SEmyb14BBccu2K+HXRupbIwVr8D1ETsYEqbJFdiZu0uW/rUkn
 F1wHtMZnQfRzUZbA2AwfsA4niwZo5RTw/GIHPesGZw==
X-Received: by 2002:a17:902:6902:: with SMTP id
 j2mr9181538plk.141.1644523689272; 
 Thu, 10 Feb 2022 12:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
 <CAFEAcA-bn0mQw5Xsn4+-b6_Qa67TViKsVK4uVmNmNkkcq5FqTw@mail.gmail.com>
 <CAH8FvQuJAkum69p6dX6mCR0kKZ7zZaM4GikcahCbsJxC3LBXsA@mail.gmail.com>
In-Reply-To: <CAH8FvQuJAkum69p6dX6mCR0kKZ7zZaM4GikcahCbsJxC3LBXsA@mail.gmail.com>
From: Jimmy Brisson <jimmy.brisson@linaro.org>
Date: Thu, 10 Feb 2022 14:07:58 -0600
Message-ID: <CAH8FvQvtxCB1_T+CkXn1urRcqGUaoaQ2+MyLcnOQ+xeyhRxFOw@mail.gmail.com>
Subject: Re: [PATCH v1] an547: Correct typo that swaps ahb and apb peripherals
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=jimmy.brisson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4fxRmJXzCwnG

On Thu, 10 Feb 2022 at 09:13, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
>
> On Fri, 4 Feb 2022 at 11:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 2 Feb 2022 at 15:23, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
> > >
> > > Turns out that this manifests in being unable to configure
> > > the ethernet access permissions, as the IotKitPPC looks
> > > these up by name.
> > >
> > > With this fix, eth is configurable
> > >
> > > Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
> >
> > Can you explain the issue here in more detail, and maybe
> > provide a repro case ?
>
> Sure. I documented how I found this on my blog here:
> https://theotherjimmy.github.io/blog/blog/2022-01-31-debug-qemu-eth.html
> It's long, so I'll provide a quick summary here.
>
> My reproducer is the following zephyr example:
>
> ```
> west build -p auto -b mps3_an547_ns zephyr/samples/net/dhcpv4_client \
>   -d build/mps3_an547_ns/net/dhcpv4_client -- \
>   -DOVERLAY_CONFIG=overlay-smsc911x.conf \
>   -DCONFIG_NET_QEMU_USER=y \
>   -DCONFIG_BUILD_WITH_TFM=y \
>   -DCOONFIG_TFM_IPC=y
> ```
>
> As part of my debugging, I was using gdb on both the guest (tfm &
> zephyr and host qemu).
> I was able to reproduce this quickly by dumping the associated
> smsc911x struct in guest gdb, and
> watching the breakpoints in the `tz_ppc_read` function. Digging
> through, it seems that when setting
> up the peripheral access control in `iotkit_secctl_update_ppc_ap`, it
> wrote the lowest 3 bits of the ap
> and ignored the rest. This matches the expected behavior from the APB PPC EXT0.
>
> Let me know if you have further questions,
> Jimmy
>
>
> > The AN547 document definitely thinks
> > that APB PPC EXP 0 has the Memory Protection Controllers and
> > AHB PPC EXP 0 has the GPIO, USB and Ethernet devices:
> > https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
> > (tables 6-2 to 6-4 on pages 35, 36).

I looked that up, and funny story, the _actual_ problem is that we're
missing the User AHB interface 0-3 peripherals.
Without this change, and adding empty peripherals e.g. {},  as
placeholders it seems to work correctly.

> >
> > thanks
> > -- PMM
