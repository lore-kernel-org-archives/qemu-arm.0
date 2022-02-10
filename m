Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1686353lfk;
        Thu, 10 Feb 2022 08:59:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmJutxug6AT4q/3uQVVCE0VYpCfGrsG2e0fWd73TIS3i5U1x/JevK0c6M3a05C/K7gDKyB
X-Received: by 2002:a81:c44a:: with SMTP id s10mr8136244ywj.204.1644512357776;
        Thu, 10 Feb 2022 08:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644512357; cv=none;
        d=google.com; s=arc-20160816;
        b=Mdib+hhbQcaNbX+jdJG2S9z7zJsV51dwFp7DS2Gn5foPKq+fDkCEk4pTelNuElIuZC
         tf2inAYUEC6XwEKw7d8RMPLmXUSckTWbgKF6ix0SHTy+cj4OvRBSlQBIQIPSIO5LeWBp
         z4zQ9sKMULp0FwyDBq2NNFrM3oXOZO9cLmYbvd/uKUqvm9OBncaWu0Ic99quDPuV3BXh
         yyajGJgn97GY1heB119aKb3XiCWeRo9TjkS/aWniQm+3Zsp+ofqzJ0iniFIvsKtusuma
         0uve0tMP3/qm8RGFEYA65pWHuHHbrxffPAOP+b1wYlyb34GXwhgPQB7r8KBKD8WkCjFw
         xhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emrbA/kK/sBgGq0LRqqAp+3DdCqPcwtQAE8h2LQeKQc=;
        b=HCrOvxp7VV7XSQkwqvBIBESF1BfCd0yW5X95NfHsu+VycNvLyQg4eNytXBSoIZpXP2
         geHOJOCToP/S1HGy0Z4TQ+zqv4GAKJV+HLBe8oVxYPO1CyN7MOaNItXZSpmFCWCSZmNq
         SOVFJQMoFx336KnMcY1FXkk8/O3ZLxFM+s3vqYSEl4j0h8u3KxfbRSY7UhujM/LBRV5Q
         m5WU9UoEpjto4PzBK9Z2WJI2pe6iydSismVS/nAjSVvJuHRw70gWDZyUFqsG95ZHOoFM
         NIfcms4QO6m7L4D+cAXgcoTgT+OR34HBoBp7k/wbHZGqQhbgtMEQIROyXBDi5RiqYVJF
         TEPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8shXCfq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si4005347ybu.91.2022.02.10.08.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Feb 2022 08:59:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8shXCfq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nICmp-0006CN-UM
	for alex.bennee@linaro.org; Thu, 10 Feb 2022 11:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIB8l-00028e-6c
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:13:47 -0500
Received: from [2607:f8b0:4864:20::436] (port=45918
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIB8j-0001X4-GX
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 10:13:46 -0500
Received: by mail-pf1-x436.google.com with SMTP id 9so7878827pfx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 07:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emrbA/kK/sBgGq0LRqqAp+3DdCqPcwtQAE8h2LQeKQc=;
 b=J8shXCfq/b/lI4BqNvPpefnxj3uZTN9z5WMQDTFQspk+FMf3wScuKm0BH1WAWGHOzs
 20PVw6uaFyzKN5XM7HEUUlCOzWy/RdShdMeL746CLw5iOB3/RJtl576xQWdByhyud1Zi
 wbyTFYm/CFagXbODz58jT/IlITHtvRmIv3urw3pVwNb7UalEtNfqz8FuWcCjk1N0uCKI
 gAWG7+VCouQNFBa/VwREXBo+bU3RbP++9KBOJ36q97kNkYNjd2wlVJY1vYY5OhgABuQc
 LLFoY2Hw88+Pg5iP4+F8P8ZDOV08/dZzTQ6fhMAQYFHWHxa0xlvqfQdXD9hoSEqlGGLb
 bi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emrbA/kK/sBgGq0LRqqAp+3DdCqPcwtQAE8h2LQeKQc=;
 b=Mtr3oNhK6LYrIsRk4J4Yx8hwnuifG/0JO74ivLYDWQVpd1uKNn0Gq+PktImx8LijQe
 spsRznRja9ZIq6Fmf0/MWNUH7nHaXUXMhSoACStFfgwRdesDeBP6wOYJFysxd9Bd0+zh
 2b+LKE4nVswRNgT1b4Xg0GRm/DxsiGXfSNU2ndI8FPfCYxIR0gJ57wwLHiA90c+sawlf
 45VKjRpMiNdZs+HaJdGdAHCYVRzObfbdsooOL6JoLTSm4hDPvT+Bx+nPNjqnZM2qW4Ua
 J8XlVQThqPsMLE1A6GSah3KMLkOvrAl6JDgxiu1SDYjfsFpJzY1s4/cwvyUQhPOsOGh4
 +YCQ==
X-Gm-Message-State: AOAM532QMzm1lPmQ5IyoJzRHc/NVWCtpjsZbTeiaPT7gjcKnBpD5031p
 Y5nV0Y1bljduQiAP9ZhcSq0XrgvIfiRDas9fIFifyA==
X-Received: by 2002:aa7:9576:: with SMTP id x22mr8155528pfq.56.1644506020642; 
 Thu, 10 Feb 2022 07:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
 <CAFEAcA-bn0mQw5Xsn4+-b6_Qa67TViKsVK4uVmNmNkkcq5FqTw@mail.gmail.com>
In-Reply-To: <CAFEAcA-bn0mQw5Xsn4+-b6_Qa67TViKsVK4uVmNmNkkcq5FqTw@mail.gmail.com>
From: Jimmy Brisson <jimmy.brisson@linaro.org>
Date: Thu, 10 Feb 2022 09:13:29 -0600
Message-ID: <CAH8FvQuJAkum69p6dX6mCR0kKZ7zZaM4GikcahCbsJxC3LBXsA@mail.gmail.com>
Subject: Re: [PATCH v1] an547: Correct typo that swaps ahb and apb peripherals
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=jimmy.brisson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qRUKt1QTNEs

On Fri, 4 Feb 2022 at 11:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 2 Feb 2022 at 15:23, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
> >
> > Turns out that this manifests in being unable to configure
> > the ethernet access permissions, as the IotKitPPC looks
> > these up by name.
> >
> > With this fix, eth is configurable
> >
> > Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
>
> Can you explain the issue here in more detail, and maybe
> provide a repro case ?

Sure. I documented how I found this on my blog here:
https://theotherjimmy.github.io/blog/blog/2022-01-31-debug-qemu-eth.html
It's long, so I'll provide a quick summary here.

My reproducer is the following zephyr example:

```
west build -p auto -b mps3_an547_ns zephyr/samples/net/dhcpv4_client \
  -d build/mps3_an547_ns/net/dhcpv4_client -- \
  -DOVERLAY_CONFIG=overlay-smsc911x.conf \
  -DCONFIG_NET_QEMU_USER=y \
  -DCONFIG_BUILD_WITH_TFM=y \
  -DCOONFIG_TFM_IPC=y
```

As part of my debugging, I was using gdb on both the guest (tfm &
zephyr and host qemu).
I was able to reproduce this quickly by dumping the associated
smsc911x struct in guest gdb, and
watching the breakpoints in the `tz_ppc_read` function. Digging
through, it seems that when setting
up the peripheral access control in `iotkit_secctl_update_ppc_ap`, it
wrote the lowest 3 bits of the ap
and ignored the rest. This matches the expected behavior from the APB PPC EXT0.

Let me know if you have further questions,
Jimmy


> The AN547 document definitely thinks
> that APB PPC EXP 0 has the Memory Protection Controllers and
> AHB PPC EXP 0 has the GPIO, USB and Ethernet devices:
> https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
> (tables 6-2 to 6-4 on pages 35, 36).
>
> thanks
> -- PMM
