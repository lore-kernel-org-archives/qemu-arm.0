Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1217461lfb;
        Mon, 19 Apr 2021 07:24:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws2ISczOp60qgITQ/l7Ht8cgexTElKu2x87NmERMV2bNl6f4zmDThl+z04XhNNl69PiGfB
X-Received: by 2002:a92:6e0e:: with SMTP id j14mr17709226ilc.90.1618842279713;
        Mon, 19 Apr 2021 07:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618842279; cv=none;
        d=google.com; s=arc-20160816;
        b=ntSWb0ea+n+yLDCxCMi0TqG9wjBCGtLUI6aRzBeZ36z2oNRLa5ebcFHv6Aox4Hh+al
         3AtwEVlOwhqcuZO8bUpxCm5Hz6XcW1FSwjf8MRgrNsHdNkvK5QGYwPe9PbGjahqVXtMO
         CceCRClSIo/XflPvcdmYkjbMpSq+pSAhxYV7wVcQQkYFs7tYqQWARm+mZTARL9DKhCL9
         aPEpJK59+D3TTjA0E0HoSQQ2/Wq9G3ocSVmYrwTgw3XTrBGOdKwkBCT9SObrxglqd+Ha
         T7XSK3fpwpY9a0ycr7D+QcV0qjc0twBEkCkNO10wunjsA0Cl2CiKsFpzau5GBdkq0svt
         9vng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=i9Cn3lfbkqaD/dPPAyj9Yc5qoRrNICqZvpNKjWddS3E=;
        b=f1wQdFLzNUOgM9Ai9Qe8vznm2HRt++iMnOKJBprE+YyCyRQ01h0B+n/sZQp2aJyL/q
         odO1BKUswran5JI1R7ZFI/A0zLJQIsurJ0/W+nh2s0Klqfe+gemwq1b3VYuBv+lsgbYl
         EuPCoP1ZCNI6asm7VcXWwHjpaV67i0l6O+pfAPrA2M9tqzwofR1UT+jFufLgmhuyhTyq
         CszlqJzj/UVv3EYkaa4gLjyYTn4WKeljj9S+JDMMmZ9BEW1UI83beq/3LSh2nQIYmOVO
         vobGI1yifiIuRZfMWncls3lwDthphlR5f9jO5QTV/C6kBuwQ1HLOxsWFejAe/EeR/NLW
         WFDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TpzS0API;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si14039971iow.63.2021.04.19.07.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 07:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TpzS0API;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYUpL-0007ji-0M
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUoC-0006v0-VW
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:23:29 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUoA-00053a-Vk
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:23:28 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u17so53247832ejk.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i9Cn3lfbkqaD/dPPAyj9Yc5qoRrNICqZvpNKjWddS3E=;
 b=TpzS0APIfLIyXpDz2ZhMZFB1XHWqB1TU1KRq46sgssks7FFZIFTa3LoxqzY0x3m4rv
 EDwGmvSHaS/BmiwZbiwRMbqy3P3jvb6qZ5yP/OkwBbOsZ+tcnjMV4hKvSB84M0lVS38R
 YxKzUcE+7EuIeWk8Ld7MVkqzVXaKVULMX3xAaorpkVOq/SGGk2FaefUZCDL+dPlf4+Ok
 gSVdJejg2mJaBY4oGptCVlPlWqZql8sg34VcAqs1WjrsIfTXo3yczGyqDlmiV1NEjNc8
 jprHufqP9VAmtNYZSqQnWQC8V41ZgiKdxCyqfCst/6McEuEqDcvvJTPvU58bemxzOXQT
 7Vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i9Cn3lfbkqaD/dPPAyj9Yc5qoRrNICqZvpNKjWddS3E=;
 b=Qfw8GQtPvH6ZBK3pZOME3qLnp+XOkFJYxzlu93j+EaEgj5NzMLUcCzNcN3w+4VouIW
 Gk3Si7HzGJszdSYy5q762DBNtf0O5/LmIY/oV6AKWqRW4M7/WjVUfkuS0Jim/IFk1AFv
 D2Ftzn8RuAeHIWMFxGqzJsZ4GwxVRYwAHuMqkQ4qYvRWDTLAQJl5zKxRTv0PtOLJ5d5V
 n9Eu7kUar3OEJeJjudVwOcCmA5yuLWhBzSJjtKU/0uC2kkdVcsPAKIrRBC7clvUS/GHZ
 gWAFtAXh8bjn2XaYX1Ju8xP1lN8Ii61SGl/7qH2y3PJInM/MsSMXWBTbna8crm9y11Su
 DRzw==
X-Gm-Message-State: AOAM530flBjkUD3iElaCWE0hCNGq5xVOSmPIapxyzaCpTU4YYlsLeDQe
 lmiah3tSHRYFA7sfVjFivC3QUa5bKn+hdKQfuktRfQ==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr22287316ejh.4.1618842205480; 
 Mon, 19 Apr 2021 07:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-6-f4bug@amsat.org>
In-Reply-To: <20210409062401.2350436-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:22:34 +0100
Message-ID: <CAFEAcA-5mv8B=CWO9g5M2GmQhz2m0PCV1g1wt4XNwSh0bUThGw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 5/9] hw/core/qdev-clock: Add
 qdev_ground_clock() helper
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3hSJAcGZFGZM

On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Clocks are rarely left unconnected, but rather connected to ground
> plane to avoid noise. When representing the clock tree, we want to
> see such ground clock. As we might reuse this clock on various
> boards, introduce the qdev_ground_clock() which return a singleton
> ground clock.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/qdev-clock.h |  9 +++++++++
>  hw/core/qdev-clock.c    | 11 +++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
> index ffa0f7ba09e..2f2d2da6cd6 100644
> --- a/include/hw/qdev-clock.h
> +++ b/include/hw/qdev-clock.h
> @@ -161,4 +161,13 @@ typedef struct ClockPortInitElem ClockPortInitArray[=
];
>   */
>  void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)=
;
>
> +/**
> + * qdev_ground_clock:
> + * @returns: a pointer to the ground clock
> + *
> + * Get the special 'ground' clock. This clock can be used as input
> + * (unclocked) or output.
> + */
> +Clock *qdev_ground_clock(void);
> +
>  #endif /* QDEV_CLOCK_H */
> diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
> index 117f4c6ea4a..a46384a84b7 100644
> --- a/hw/core/qdev-clock.c
> +++ b/hw/core/qdev-clock.c
> @@ -210,3 +210,14 @@ void qdev_connect_clock_in(DeviceState *dev, const c=
har *name, Clock *source)
>      assert(!dev->realized);
>      clock_set_source(qdev_get_clock_in(dev, name), source);
>  }
> +
> +Clock *qdev_ground_clock(void)
> +{
> +    static Clock *gnd_clk;
> +
> +    if (!gnd_clk) {
> +        gnd_clk =3D clock_new(qdev_get_machine(), "gnd");
> +    }
> +
> +    return gnd_clk;
> +}

I'm not really convinced that we need this, given that we have
exactly one user of it in the tree. I think if you happen to want
a fixed-frequency-0Hz clock it's not a big deal to just create
it like any other clock. If we had half a dozen users in the tree
I might feel differently.

thanks
-- PMM
