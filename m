Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2123962lfy;
        Thu, 6 Aug 2020 16:45:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyULupXxM0ulv1/rT4NqzEhEWKtKXI/oyom02NO8c/kNvVC7KZ1puOt9Z59LVkEf1k9PK/r
X-Received: by 2002:a5b:30d:: with SMTP id j13mr15381320ybp.51.1596757532545;
        Thu, 06 Aug 2020 16:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596757532; cv=none;
        d=google.com; s=arc-20160816;
        b=WhJiqUUA+sLoyCfKoso8FNhId66qWMQcIl+ye4K7WnhXjHzjgsO7NAYQhmGyQ1K/dv
         p5mpB9IMJHEJR9U50lGKriTj7HDs3Rg/Ud5waw/BKTBZufBP8n9yyGtdFKUQsBZ7cv3o
         ea05THa9a+uCRJjBNMjFHmqbY1a4wCsVW0HQ9iHY5oJOOthsmX71shILY7kTAeGOUORZ
         vwk8VN8LIuFsbLHdsr4MvmHMVMTbONg/vPWQ/dx08YS9Sv6+fLSxPsVAEnuAonDyR3B6
         SJ0/cyl2fXINjkwvanEqnjmlwN/NV2kB4rEuBrtSXb6aiKlBVKA/R9RMNDyi0QKT5+Bm
         WqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0lMd6pa5zpRm0TfN15mIqDfirCjLbolJvbMWzYWKZ40=;
        b=Bmw6RcCBikInw4QrhvYvYr/36d5Fk66bzJ2WRPeXbH8T+vhdHz6Gn6d+2ePDQf+ABi
         PV8KPQbOnNIn743Id1wp1B26tRWAN8eBbua0Zlno+8uEAW/RIz6pxNH4gyCdk0ZVpbZI
         c/VpDfnNuv4A+tjnylugJpNCt3Y6yKlpNWwr36AbRrN9z/PeVaQFIICPxRjVpMZyIChs
         2MGXcPifgayk7pFT35YboRAHmOLnqK5MyRHgb3kLIM/9rmeIZ0uuxl5THTF13Js1EfJw
         LoJuqhHaju+Tb5BPgBMbcoYyssEFVKDsq2aaQodGTc0n7OvkeloGVcaYWwa4l5wVn4Z5
         bfcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="deKoK/d2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a60si5837093ybi.189.2020.08.06.16.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 16:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="deKoK/d2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3pZj-0006Ld-Mc
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 19:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pZM-0006LA-HY; Thu, 06 Aug 2020 19:45:08 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pZK-0004DT-MO; Thu, 06 Aug 2020 19:45:08 -0400
Received: by mail-ej1-x641.google.com with SMTP id f24so158229ejx.6;
 Thu, 06 Aug 2020 16:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0lMd6pa5zpRm0TfN15mIqDfirCjLbolJvbMWzYWKZ40=;
 b=deKoK/d2O6CY7qllvF0eTQHHH66n3bqhpEdl9uK+E0v2dkRAvbRJ69gb02TrDEPb/J
 p6LQOVxyTY4KFuQhI1bmwSEa5ZWK2VzvvR/RgTOQMVZi72EjSQf2KHK6ETbm/jZSa+nI
 xKlh0euOR5dVUe7H/Upu2B24BsadmJ+hxbpZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lMd6pa5zpRm0TfN15mIqDfirCjLbolJvbMWzYWKZ40=;
 b=mVgHro6nK/9JQf2SITZ/HuCeerFTjKWglY1hnFLM1UeQM+7x0gQbSypGNdvQYtD5mc
 pD4EpmGZky1mQBVwn8hoa0K9ffmIQdF3haktfiVX94nKFCUhqoORSpMV7DKxHiY7jMlR
 Z3uWjZApYyjkLVzP4M3p9m1hC6BHmUVSHZrm4Ko9uAgga1DieJKkJQIou7PW/4EDA8rf
 rUl13ogF2RRMAexeccGE+8wiYusiiqdMeh5RwMxzWCchQ2Lh6HMoG65x1H8ZXPMEsk5e
 o4GJ+R6eA/aNq5BwnKhr6hOTvC3e0b1D4cKOR1TH8y4H8G4J7Om7aafYnmciRXYTV7Ub
 Awfg==
X-Gm-Message-State: AOAM530feB9s4c4TWcYeu3A4XzrXqOmDMVTN2g5WJLPO3xCPFC2gOSka
 5quOWmyxhivU13sWFXNWZxdAGSejhW33ficZawo=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr6666887ejd.266.1596757504208; 
 Thu, 06 Aug 2020 16:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-10-clg@kaod.org>
In-Reply-To: <20200806132106.747414-10-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 23:44:51 +0000
Message-ID: <CACPK8Xd5b8GT_KPrWaH6_PLh_q-0kq3MG86x-fD_rPJMw+ehNA@mail.gmail.com>
Subject: Re: [PATCH for-5.2 09/19] ftgmac100: Fix registers that can be read
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +VelKvOe+k8E

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Receive Ring Base Address Register (RXR_BADR) and the Normal Priority
> Transmit Receive Ring Base Address Register (NPTXR_BADR) can als be
> read.
>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/net/ftgmac100.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 5f4b26fc5f3c..0348fcf45676 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -669,6 +669,10 @@ static uint64_t ftgmac100_read(void *opaque, hwaddr =
addr, unsigned size)
>          return s->math[0];
>      case FTGMAC100_MATH1:
>          return s->math[1];
> +    case FTGMAC100_RXR_BADR:
> +        return s->rx_ring;
> +    case FTGMAC100_NPTXR_BADR:
> +        return s->tx_ring;
>      case FTGMAC100_ITC:
>          return s->itc;
>      case FTGMAC100_DBLAC:
> --
> 2.25.4
>
