Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp340299lfq;
        Tue, 5 Jan 2021 13:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLOHNWS7QobtkZAt+jBRjHtiTJ9a9qz9OcJdjfe16QYFMJZAz2+GwsVCU+502CinxLfn4k
X-Received: by 2002:a25:afd1:: with SMTP id d17mr2031017ybj.6.1609883826825;
        Tue, 05 Jan 2021 13:57:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609883826; cv=none;
        d=google.com; s=arc-20160816;
        b=dbGD/G7ugM0pgnOkupM0CK4/Q/D6wK3OmoVyr9cd+Aj/Kg1aQ2t+xWkkcNpg5EI6nh
         KR0MT4p5Q4UugW10P18WRgkWkOuxxpuO9fzVt3BJtVN4Y14JapoG9BSkv0jFMUO9Jfwc
         lY8mDPxTGdz7FnkMEgYI6DeTjl0r2kEW4swD6WQqLCZ0we3+LsntsNvW0Bf2rOaPV1oz
         +cwGNT8V2RLGkqbOAcWn6CjDd3S6A1E2THLLfNHXGqld7w6QolbJsj5kDUUSqbxGuOoF
         GnxNSf26yBFkEmRxO8FJvs76/Ri8lf3ofmLEjEWmPVCfjHad45t80ekqODEcEiOWQxol
         9W9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CJTR5P+O1pAD9ZwARwSZ/K8/6oUZwdn6dUQpE4KreUU=;
        b=X0Eoty64QGsrOgBTmBOZZyPbrHt10rJqhUJ+big6RFBWmboikY+I9dl7YwlBKsBEzN
         13egvfriazJ8ANfZZ46EFdKMdnbN8+Bjpkdd9y9/VB38HULL8dRgqE2p5WBfN0fUX7Ry
         RbXB77cWl0hLhIAJsBMGVn16p43eXsDwHLFeTQwKrDZRgnEMM9LVGW56PNo5c/QxFmuL
         MerQcymABLaKguAqQpiUb+sxVexhwhANOewpyNev/Ts1VfWO0ofQ0vQgOgfnwwDJo2jm
         4niK44TP17f52P7VRfSodKYQSke4q7nDXfTlMteN/MAW6VN2Vkk3RUnNVewrz1XK9ZfS
         8g0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=X3nJsZLr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si625999ybr.8.2021.01.05.13.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 13:57:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=X3nJsZLr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwuKA-0002dH-85
	for alex.bennee@linaro.org; Tue, 05 Jan 2021 16:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kwuJn-0002d2-1c
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:56:43 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kwuJl-0004za-0i
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:56:42 -0500
Received: by mail-lf1-x134.google.com with SMTP id a12so2021493lfl.6
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 13:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CJTR5P+O1pAD9ZwARwSZ/K8/6oUZwdn6dUQpE4KreUU=;
 b=X3nJsZLrGDkre0IxhwB9gU76MRmgh7NQQkgtmp+2qgfMN2myC1CqKbyupf/g2JGSKB
 ePT96owqK6R0bUltPu1FuQg5iF09pnelWWk46QC8eHo1iOdCnVN11L6zkHbmabV+v/vu
 o5uQ9VJs/ggBrzXEHevTQMOLE8m8l6/Z2UVqtsWHeN6Xl0WoczwVZn+MKfKNEO2aCCaN
 AEdihsmfHRofpW/EEzwAxde7+/D9BhED9pdFBZpgbdQZbPbDsHSh/v/LHum5/Mcs2YpY
 dA7kpcBmfs7Oa9yvL5p4Yz5UEUP9AfWXPt39D4KbcBeOtQV4Zj5zMKY2DhtvZ83v/BEX
 qcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJTR5P+O1pAD9ZwARwSZ/K8/6oUZwdn6dUQpE4KreUU=;
 b=ZAbKiKB8WNsrInsaUnPEGIlakaXGODbofY+vqwvr4vRuvRnEPt+LvSEf/0zhWTfY3x
 D87xmojvUt8b6CSgsHki681FQ6EoRzldS4OjV/MHGvJR+nM0LgpOTU+i/TVPzhGTOcWY
 rCF47RRTzbjTNp8IMV46PRX6y0Rq1i7xdbUHIoThykQGQtICV0Slves40gps2hrj4dje
 d92K6AaA+ZLZMe6lpJITT2rI/Dg2EAsGLPUsDfoWyzAicaQahCh9s+MEBVeqADsWgQ+5
 eDCR/xMwzWACKZwqKl9QLluyo8e6oGIZNFkxUNY6oSqCEsoOk+XIejgHvVTdnOu4oAbr
 7RQw==
X-Gm-Message-State: AOAM531HRJkbYHdlzwB4R9OVAd5t2GcLP1rzRDTTsZBEQ6z1ndmMNdnj
 zaJtd2zG0pw0muM3XGET6XXm1g2XUxGWYJQT9gqGtQ==
X-Received: by 2002:ac2:4d14:: with SMTP id r20mr576847lfi.410.1609883793668; 
 Tue, 05 Jan 2021 13:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-1-wuhaotsh@google.com>
Date: Tue, 5 Jan 2021 13:56:22 -0800
Message-ID: <CAGcCb10FdAJs2qkwU3COtapt-xtNAAJg7oVPCFdE-LUHFjwBKQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Additional NPCM7xx devices
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a7214905b82e4742"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.369,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>
X-TUID: A498inXaF1rv

--000000000000a7214905b82e4742
Content-Type: text/plain; charset="UTF-8"

Ping?

On Wed, Dec 16, 2020 at 4:45 PM Hao Wu <wuhaotsh@google.com> wrote:

> This patch series include a few more NPCM7XX devices including
>
> - Analog Digital Converter (ADC)
> - Pulse Width Modulation (PWM)
>
> We also modified the CLK module to generate clock values using qdev_clock.
> These clocks are used to determine various clocks in NPCM7XX devices.
>
> Thank you for your review.
>
> Changes since v3:
> - Use type casting instead of accessing parent object in all devices.
>
> Changes since v2:
> - Split PWM test into a separate patch in the patch set
> - Add trace events for PWM's update_freq/update_duty
> - Add trace events for ioread/iowrite in ADC and PWM
> - Use timer_get_ns in hw/timer/npcm7xx_timer.c
> - Update commit message in ADC/PWM to mention qom-get/set method for usage
> - Fix typos
>
> Changes since v1:
> - We removed the IPMI and KCS related code from this patch set.
>
> Hao Wu (6):
>   hw/misc: Add clock converter in NPCM7XX CLK module
>   hw/timer: Refactor NPCM7XX Timer to use CLK clock
>   hw/adc: Add an ADC module for NPCM7XX
>   hw/misc: Add a PWM module for NPCM7XX
>   hw/misc: Add QTest for NPCM7XX PWM Module
>   hw/*: Use type casting for SysBusDevice in NPCM7XX
>
>  docs/system/arm/nuvoton.rst      |   4 +-
>  hw/adc/meson.build               |   1 +
>  hw/adc/npcm7xx_adc.c             | 321 +++++++++++++
>  hw/adc/trace-events              |   5 +
>  hw/arm/npcm7xx.c                 |  55 ++-
>  hw/arm/npcm7xx_boards.c          |   2 +-
>  hw/mem/npcm7xx_mc.c              |   2 +-
>  hw/misc/meson.build              |   1 +
>  hw/misc/npcm7xx_clk.c            | 797 ++++++++++++++++++++++++++++++-
>  hw/misc/npcm7xx_gcr.c            |   2 +-
>  hw/misc/npcm7xx_pwm.c            | 559 ++++++++++++++++++++++
>  hw/misc/npcm7xx_rng.c            |   2 +-
>  hw/misc/trace-events             |   6 +
>  hw/nvram/npcm7xx_otp.c           |   2 +-
>  hw/ssi/npcm7xx_fiu.c             |   2 +-
>  hw/timer/npcm7xx_timer.c         |  25 +-
>  include/hw/adc/npcm7xx_adc.h     |  72 +++
>  include/hw/arm/npcm7xx.h         |   4 +
>  include/hw/misc/npcm7xx_clk.h    | 146 +++++-
>  include/hw/misc/npcm7xx_pwm.h    | 106 ++++
>  include/hw/timer/npcm7xx_timer.h |   1 +
>  meson.build                      |   1 +
>  tests/qtest/meson.build          |   4 +-
>  tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
>  tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
>  25 files changed, 2972 insertions(+), 38 deletions(-)
>  create mode 100644 hw/adc/npcm7xx_adc.c
>  create mode 100644 hw/adc/trace-events
>  create mode 100644 hw/misc/npcm7xx_pwm.c
>  create mode 100644 include/hw/adc/npcm7xx_adc.h
>  create mode 100644 include/hw/misc/npcm7xx_pwm.h
>  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
>
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--000000000000a7214905b82e4742
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Dec 16, 2020 at 4:45 PM Hao Wu &lt;<a href=3D=
"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">This patch series include a=
 few more NPCM7XX devices including<br>
<br>
- Analog Digital Converter (ADC)<br>
- Pulse Width Modulation (PWM)<br>
<br>
We also modified the CLK module to generate clock values using qdev_clock.<=
br>
These clocks are used to determine various clocks in NPCM7XX devices.<br>
<br>
Thank you for your review.<br>
<br>
Changes since v3:<br>
- Use type casting instead of accessing parent object in all devices.<br>
<br>
Changes since v2:<br>
- Split PWM test into a separate patch in the patch set<br>
- Add trace events for PWM&#39;s update_freq/update_duty<br>
- Add trace events for ioread/iowrite in ADC and PWM<br>
- Use timer_get_ns in hw/timer/npcm7xx_timer.c<br>
- Update commit message in ADC/PWM to mention qom-get/set method for usage<=
br>
- Fix typos<br>
<br>
Changes since v1:<br>
- We removed the IPMI and KCS related code from this patch set.<br>
<br>
Hao Wu (6):<br>
=C2=A0 hw/misc: Add clock converter in NPCM7XX CLK module<br>
=C2=A0 hw/timer: Refactor NPCM7XX Timer to use CLK clock<br>
=C2=A0 hw/adc: Add an ADC module for NPCM7XX<br>
=C2=A0 hw/misc: Add a PWM module for NPCM7XX<br>
=C2=A0 hw/misc: Add QTest for NPCM7XX PWM Module<br>
=C2=A0 hw/*: Use type casting for SysBusDevice in NPCM7XX<br>
<br>
=C2=A0docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br=
>
=C2=A0hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 321 +++++++++++++<br>
=C2=A0hw/adc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 55 ++-<br>
=C2=A0hw/arm/npcm7xx_boards.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0hw/mem/npcm7xx_mc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 797 =
++++++++++++++++++++++++++++++-<br>
=C2=A0hw/misc/npcm7xx_gcr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 559 =
++++++++++++++++++++++<br>
=C2=A0hw/misc/npcm7xx_rng.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +<br>
=C2=A0hw/nvram/npcm7xx_otp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0hw/ssi/npcm7xx_fiu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 =
+-<br>
=C2=A0include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 72 +++<br>
=C2=A0include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 | 146 +++++-<br>
=C2=A0include/hw/misc/npcm7xx_pwm.h=C2=A0 =C2=A0 | 106 ++++<br>
=C2=A0include/hw/timer/npcm7xx_timer.h |=C2=A0 =C2=A01 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0tests/qtest/npcm7xx_adc-test.c=C2=A0 =C2=A0| 400 ++++++++++++++++<br>
=C2=A0tests/qtest/npcm7xx_pwm-test.c=C2=A0 =C2=A0| 490 +++++++++++++++++++<=
br>
=C2=A025 files changed, 2972 insertions(+), 38 deletions(-)<br>
=C2=A0create mode 100644 hw/adc/npcm7xx_adc.c<br>
=C2=A0create mode 100644 hw/adc/trace-events<br>
=C2=A0create mode 100644 hw/misc/npcm7xx_pwm.c<br>
=C2=A0create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
=C2=A0create mode 100644 include/hw/misc/npcm7xx_pwm.h<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_pwm-test.c<br>
<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div>

--000000000000a7214905b82e4742--
