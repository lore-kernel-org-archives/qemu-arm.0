Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3010496njc;
        Mon, 18 Nov 2024 18:54:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVe7IeZw3Lv8Gbge0/HNHzP9n3T/4jGoW3sPo1didUgmn2vMT+Gmx+g+aoAMeTzA1m/L4UrO+1vBn4U5g==@linaro.org
X-Google-Smtp-Source: AGHT+IFSkBcoVdeRkj+Pvvnf5FKGCmvgTjEKRzB6vxGdtoIiE0NE9StyD7aY/Fxw3K5Y4T1oiAS8
X-Received: by 2002:a05:6102:d8e:b0:4a5:b003:41bd with SMTP id ada2fe7eead31-4ad6318e901mr13875727137.22.1731984866921;
        Mon, 18 Nov 2024 18:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731984866; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0H4kkP0ngFWrseCGZDxnj/AL8EZQ5CC8vE2NJSH7QlNiRiHfZotjSZJVQlTRblhCi
         pI5Su7O8nxOHDcGNqC/WaCKvrH4VTAML4grM7aXSgqdC8z1qiNS0x2paTB7E8P6c/1R+
         MOTWmv5UPezXPwHPgrfhDvznfiKrk9K10QXMqX1+yhHXpFVi4pBrCdV1Jyq8S/KW0QOd
         0F/av4x4iwlwvVxmHmkHabs6qnZ83eJ8g2nLbdSMF9S9C1hxpZghhGVM1ptlR6yCmRjN
         4tacUE6G8DXXR4dcmmlNWaXAxHPJqFfVyfTo2bU2yRnWEp9lpLMb4fVS2TrlkwePfUtw
         qnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+1CkV48Xky8tzsEiAMgHndI4yPyDnWgRemMh68yVn7w=;
        fh=xXjO1J6nB6i+nAzEnxPnmCNIYV1ycDCUQSU7gNoZzpo=;
        b=H03q9i/jRolp3L4sIM5m4/6K1EkvoDMJiBB/6QBLSCaPDaWy/rf78jIumUBquXUTyp
         8QL2+quHOFtZeoat5JZvZCvPtLtm+G0G6Mkxqk3+sMYDQHmhlXSNIAfSvWjekHAuyKjK
         HZwKZFtKak3YuCkBNsGHUa4LQ1HOpamNqDYsoFJ5hM1kKTChuagFHksnVdNw3hotPsUZ
         FGughBclIYX5BhAMyKloLiwAxvNg2wOSZEIXI0cJVZqQOz3t1OlYYR91fR+oFSvJzYRK
         U+1VotMAt4DNBpyVEkLnEX8kc2Ow8uVUWRBB7CZVm6sdBdKQQWM7rBZP8zk3frFJS96x
         zqXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=lLc9AZcb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d40ddbeae2si83983226d6.557.2024.11.18.18.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 18:54:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=lLc9AZcb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tDENK-0004k1-De; Mon, 18 Nov 2024 21:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1tDENH-0004j7-9r; Mon, 18 Nov 2024 21:53:55 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1tDENF-0005Z1-51; Mon, 18 Nov 2024 21:53:55 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa4833e9c44so56280866b.2; 
 Mon, 18 Nov 2024 18:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1731984828; x=1732589628; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+1CkV48Xky8tzsEiAMgHndI4yPyDnWgRemMh68yVn7w=;
 b=lLc9AZcbxLo5aqyR1n4WAN73EABdULcoGaymhw/VBjPmP4+xVQ/icSREGeFujQmkrJ
 8Eo3fpxvjG7GeOkJlgR42/2c1RM81twwV+0YYDR2nxbADt1rVvJ5spLQjBL/TniAS2Sq
 Vc1Wn15YbBazP4fBefVhx+H2JWo+8kQbHEH70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731984828; x=1732589628;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1CkV48Xky8tzsEiAMgHndI4yPyDnWgRemMh68yVn7w=;
 b=nDYQO76yh/E8Eu4wtRwhqQL/OxEw7dKsUtxVrbVICGQc/C8uNKYruXq0vNoEH3BpHF
 miYPrnNVYsUld8L5oiqvdIvnxM9bw8p6S+jNFF+fPJQgcCNo4YxKpwTv7HsLx5n4PsKn
 1TL2fc8Ej3NQ5lYtyqVrl2weWNJwUy8CJ3GsoGGmJB7ipCWbWjhisgmhyj4BQQlCEnMt
 /5YV/b8J/Vx7otsc5egpOsfAUAQf2ONemydDUchfDAr3WS2MfFadKoJlH4FF1jNBFeU/
 Aubiwr5EW+Lf47VYpUwbEaxg8xRn20nUuxOVxj1dCh5lBDhEsSDnWZED/KSFN4kX/WOE
 Ju9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9RJ1brRIYNzDVv738TSiL7WRa9OF4aNG7FDSjXKAtfm/3TxKXDFoJnvbqgl9i/O7W1GcwP2jRPQ==@nongnu.org,
 AJvYcCXkIrtbkmY+dneciooxQyClDBjYRu2RmqE+vqaS3/GQKpYC6vHIYasrTIvt8xLI4S4o81HiOF+m3lTFsg==@nongnu.org
X-Gm-Message-State: AOJu0YxsK0Btie/++r6D98hhgbILxGmYBVkPETEU8Uaa7X1Uk5yeQfw4
 KSalN79s5Lb7cWzovHLlntXY96IAItFPuk4vQx9b8W+XJkFTHCoOpBgHW64bFoJw+bSMnPELq5o
 YDzE2xwpCbxYeOSBXxrUDeUZzQwk=
X-Received: by 2002:a17:906:fe01:b0:a9e:b2da:b4a3 with SMTP id
 a640c23a62f3a-aa48352b5d9mr1361083866b.42.1731984828144; Mon, 18 Nov 2024
 18:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20241118021820.4928-1-joel@jms.id.au>
 <CAFEAcA9tPhbjnJ6XjMcZq6iWS4i1BdrTB+=391L5UgaVSMkCLQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9tPhbjnJ6XjMcZq6iWS4i1BdrTB+=391L5UgaVSMkCLQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Nov 2024 13:23:36 +1030
Message-ID: <CACPK8XeFP+fmws+tcG-qgz1WXyKAtMicpfcgDG-pd_jp8PLXwQ@mail.gmail.com>
Subject: Re: [PATCH] hw/aspeed: Correct minimum access size for all models
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 BMC-SW@aspeedtech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m5dWEASG+urM

On Mon, 18 Nov 2024 at 20:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 18 Nov 2024 at 02:19, Joel Stanley <joel@jms.id.au> wrote:
> >
> > Guest code was performing a byte load to the SCU MMIO region, leading to
> > the guest code crashing (it should be using proper accessors, but
> > that is not Qemu's bug). Hardware and the documentation[1] both agree that
> > byte loads are okay, so change all of the aspeed devices to accept a
> > minimum access size of 1.
> >
> > [1] See the 'ARM Address Space Mapping' table in the ASPEED docs. This
> > is section 6.1 in the ast2400 and ast2700, and 7.1 in the ast2500 and
> > ast2600 datasheets.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2636
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  hw/fsi/aspeed_apb2opb.c  | 2 +-
> >  hw/gpio/aspeed_gpio.c    | 4 ++--
> >  hw/intc/aspeed_vic.c     | 2 +-
> >  hw/misc/aspeed_scu.c     | 4 ++--
> >  hw/misc/aspeed_sdmc.c    | 2 +-
> >  hw/misc/aspeed_xdma.c    | 2 +-
> >  hw/net/ftgmac100.c       | 4 ++--
> >  hw/sd/aspeed_sdhci.c     | 2 +-
> >  hw/timer/aspeed_timer.c  | 2 +-
> >  hw/watchdog/wdt_aspeed.c | 2 +-
> >  10 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/fsi/aspeed_apb2opb.c b/hw/fsi/aspeed_apb2opb.c
> > index 0e2cc143f105..855dccf6094c 100644
> > --- a/hw/fsi/aspeed_apb2opb.c
> > +++ b/hw/fsi/aspeed_apb2opb.c
> > @@ -259,7 +259,7 @@ static const struct MemoryRegionOps aspeed_apb2opb_ops = {
> >      .read = fsi_aspeed_apb2opb_read,
> >      .write = fsi_aspeed_apb2opb_write,
> >      .valid.max_access_size = 4,
> > -    .valid.min_access_size = 4,
> > +    .valid.min_access_size = 1,
> >      .impl.max_access_size = 4,
> >      .impl.min_access_size = 4,
> >      .endianness = DEVICE_LITTLE_ENDIAN,
>
> Have you reviewed all the device read/write function
> implementations for these devices to check whether
> (a) changing the .valid value does the right thing, or

I read the implementation of the read/write memory ops and I believe
it does the right thing. We want devices to accept reads that are of
any size, instead of returning an error.

> (b) whether there are cases where we should instead
> be updating the implementation and setting the .impl
> min access size ?

Reading the documentation for impl vs valid, we definitely want to set
valid to 1. There should be no machine check when performing byte
reads.

I don't think we want to change .impl.min from the default of 1.

I'm not sure if I've missed something that you're trying to point out.
Are there gotchas about setting valid.min=1 that I should know about?

Cheers,

Joel
