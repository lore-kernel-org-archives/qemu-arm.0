Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12716277lfc;
        Mon, 2 Dec 2019 05:11:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqymdJCLZAqGXG1ctihWfxVeLSiNK6S8FR3LmpP7ex6kZFyTn81H7hyjCSbUMNBwx8e0o6sH
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr648043ljk.220.1575292262222;
        Mon, 02 Dec 2019 05:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575292262; cv=none;
        d=google.com; s=arc-20160816;
        b=Rdr72bqSP5Qu3EnngrSFraXWs65r2seh9VSfhk3y8T8cnQ7yYRuYh9w6qZ5H/3EDO/
         SR8+DKZyLppD8UeRxPTKLu4A5qC5dmme2Hh0OKSjH5yJyYfjmwA/BaGOxrvINufuzUl0
         Rby30knr77LNoHgdudSUcnGIPWBdEXKafOMpMJOZRUlFPEi1ak8Oxdjz4HoGt6huX87z
         yfss+MpTEPf1b/764a7hRjPtp4OIYazNKVO8KkbDSpRL9I2xaQkAOmig0Qvh2WDj5lQP
         whcQ3pjpVmU2vMUJ3Ih35JbfxWni9GgLdFOjWzAvb5VMIN1azklWdFeVqPvEwfqvb2Yf
         pn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtmk+AViR5zUt+ZAvHOkNZ2Mi79saamn3iW5l1Vzgto=;
        b=MInxQAacAHfui8flvoSQ/6sMkitQ0SOqKv8pJ4rQa90nd4JiMI5G9Yx8i+6W5KOTaY
         8bVOPA84Pwk1FX8jgFs6eyOidn6nDVpV6Iyg9TKmoFgzrIM8gnfVBpKA0zsEKzMVdTki
         DNSrTDxpWsKchRBdbYbkMbdiebtHCr1Fc0BGRwDpSWwMZAzc5ugtacP4AI05qISHZ06t
         HyQ7qX4x2Yt2U6CrXcV1C+se9Wn/rSzVxDLu02dgwccoKEpzSf9JfHeDTpAUOwr45O78
         32eBYSU2K+Sd+iLQYM0MKNFFuaxBoQ6VVpdMCNwcQolv5xXDFh6h8OIRdekkGuFeyh9Q
         k/VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SUClcpAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si10009699edt.157.2019.12.02.05.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 05:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SUClcpAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iblTh-0003KD-8P
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 08:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iblTU-0003EX-9P
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 08:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iblTS-0004P7-UL
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 08:10:48 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44439)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iblTS-0004Og-NS
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 08:10:46 -0500
Received: by mail-ot1-x343.google.com with SMTP id x3so6439425oto.11
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 05:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtmk+AViR5zUt+ZAvHOkNZ2Mi79saamn3iW5l1Vzgto=;
 b=SUClcpAMdEJS8EdmXJRr1EU6yjG7j/JR/pHHYbaOAhpsKtV4LLuLUpeWGc1F4hucaO
 GcAdMWZ9MPMH/gZZltSS/fLABCEzeHJxsZAsR8pLsVVoyNG8N9az09Q7IGlSdW22TWTv
 yc7BJQcIUsKUyTnUipzAV4X8g6+wMN7ARf3b1wkC+JBD8DEwEEjwuPWbWLxiQDJhF3Ip
 lQzkBPcksBnZfoZtlIHh9RlJJ1AIRssOfcSiKDxc2nFXPoVt8VI40iQasqhpJgnUutpt
 TSPHTyVWOLTpKtHEzTxhI6lhzwpMnvzzJOFNL/EynHqkBQMvrWxWjT878Beb5rmCgM8x
 J8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtmk+AViR5zUt+ZAvHOkNZ2Mi79saamn3iW5l1Vzgto=;
 b=BqvYqNA1Kn2mOfMpVr1PtlRZ3CC8ie58d0BBjagPNhhz4grFPfLS8ANS4bJ7Wk4hZ/
 T+hVOJ5DBy3EFCT3XAi+gG1Y1ByQrxwWsvn8h7G9hIZ6vtb2tyUYgPIuOOPqliJjssYr
 /l9UitbVfxMBq2EuiThSxi6ToxXBK2XrFcDhxzm8tIIe2YWihRY4sBmhg/WJCJkwH4BM
 mJclOeK9hgAGMT43dlaID5jDLZ7heOrlU8cCLNxHLlIv736c1j5V+nVkzubuC8VFuRRg
 qtVcXEaw+MoefYxhU1r9xFuB7H0f/fx/Q8sEtNG5wknMGWsmIMWrrttDkvXTCxt4B0v9
 obzA==
X-Gm-Message-State: APjAAAXH075i3gL41lVSiXXdtiIZOfJ7OlTW/j9QLwU1vfURL9TSvmwx
 2JMU6irXcakk5M4cqs2KyoTUgdHEO4z/ewMslvapWg==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr2063572otq.135.1575292245725; 
 Mon, 02 Dec 2019 05:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-13-damien.hedde@greensocs.com>
 <CAFEAcA-YiD6B1wMTrOvj5=QbYY3uuqdbJbSP57zg3S86nU=k-Q@mail.gmail.com>
 <1ae3a4d3-26e6-fe6d-87a3-d5dcce1fd64c@greensocs.com>
 <CAFEAcA89bbvd0Zi44GZrCDc8e-AEKqGkJ3SA3e=Sz6xVHNbfEw@mail.gmail.com>
 <8bd421d9-d0a9-853d-1ab2-09467df64e05@greensocs.com>
In-Reply-To: <8bd421d9-d0a9-853d-1ab2-09467df64e05@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 13:10:34 +0000
Message-ID: <CAFEAcA8rs_YtUWsdzgmyv3h8_mxe8a5WU9Gd3W8XYGjbRw8Syg@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8AHAEces4dLP

On Mon, 2 Dec 2019 at 13:05, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> I don't know why it has been implemented like this but right now the
> raspi_init() does the following during machine creation:
> | bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
> | [...]
> | carddev = qdev_create(bus, TYPE_SD_CARD);
> which put the sd in the BCM2835GpioState.sdbus .
>
> Then the reset procedure of the BCM2835Gpio move the sd card
> to one of the two usable controllers and the sd card can never go back
> to the initial BCM2835GpioState.sdbus.

This seems like it's just an oversight. The code in raspi_init()
which creates the SD card was added in 2016, a year before
the gpio device was added, so when it was written there was
only ever one place the SD card could be, I think. We should
fix it so it puts the card in the right place to start with.

> As far as I understand, it is theorically possible to have the sd card
> on no controller at all (it's maybe the reason for the .sdbus "useless"
> bus) (for example if the BCM2835Gpio is badly configured) but this is
> not implemented in qemu.
>
> Anyway I can add some plumbing to only call sdbus_reparent_card() when
> really needed by:
> + not duplicating the sdbus_reparent_card() in gpfsel_update_sdbus()
> + adding needed test in reset() method to only do the initial
>   sdbus_reparent_card() if needed (first time we call reset).

I don't think you need the latter if we make the machine model
put the card in the right place to start with.

thanks
-- PMM
