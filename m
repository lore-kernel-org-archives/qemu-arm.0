Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3018783lfq;
        Mon, 14 Dec 2020 16:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLGur44GfGqA32tF+uWKOpYr3ebrc0/hhGNmhlusj3KPtyCQrRyZBm3033m2CdPkpCya/R
X-Received: by 2002:a25:4148:: with SMTP id o69mr38782812yba.462.1607991394041;
        Mon, 14 Dec 2020 16:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607991394; cv=none;
        d=google.com; s=arc-20160816;
        b=L5ineXkXdHJGIFjvD8VGaEdvB6Q8pqgn+/JJNWMTVAYaTyYnCPrrD5sRAgQWcA9354
         lgAD0Xt6DuKTyyDwKqlWDbcChEQ1z8kQ4eAgCgSeREJY6v+A5e8pwv7W+O+5inndTweo
         xh6l05GESaVjP9EqQDlhS4qpgXRaDZBzTALP+PKPOOunOhI9vXvfkv19rc2GqHqUVTQP
         x0rks2jd8bsldtwM6YGmvcgbLHQXTEVQlHHthS8xw5k8QuWTocE8soMozM5IUkWG4iSR
         WBBvUydk7HzyusqDG8hk28FQUhLvozcV2t7gy+YWS4yJ4WOIMfrswGLofJVLIRaAV/3W
         b/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3g1iJDAIyFEiVT/bq3Ap4xE8y4oUGUzuZ5yr37NL4ys=;
        b=RlZ7Oxoek19YpvmtP9XJiXVAEpCaYKnrZxMH47LVFmmJMyz3Fj1bqE6rxwr6pEwTXm
         hK2FTHf9X2KSaTGU0xDziFj44ZFn8ewyf+1fGdXU/PEaFzgLfgx2zlUUFiUf8ZVTXU1l
         Go75QTy3Kv0g5Tel/lc0lTzLO7HKo5VG7F2krvjHVz0O+OtqlrPIgJB/p6Z9/occC/t4
         27g1RWlG1WgNSfTamVzWVsJiTnTPZSMHCHANw0GQeBmA62RsoiEn1H6+Jzq+WmVyMch4
         87X2G00NFnC8uUMe26NqkyMH58cGlslHdj1LiyRdEv+K4A6cQZcKvqMkipA4Qz7x7r92
         Ytzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=h9ePbcFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x136si17278608ybg.168.2020.12.14.16.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 16:16:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=h9ePbcFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1koy13-0003sT-Bm
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 19:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy0Z-0003qR-Os
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 19:16:03 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy0X-0003Nh-Mo
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 19:16:03 -0500
Received: by mail-lf1-x144.google.com with SMTP id m25so34785282lfc.11
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3g1iJDAIyFEiVT/bq3Ap4xE8y4oUGUzuZ5yr37NL4ys=;
 b=h9ePbcFR6AQixb1ocTPjefKkNGR7Z+RcmTSYrLcHDVWUhIyNT9Fwx+A3RFmRe9PlbZ
 rgsaRK36m6hQEOYoIFYzJzH98q5yzspAVwOxzrBvwZdm3xtQFr1Oj0Xq9cZh+70Ycffq
 t1oC0ZKFZ02fApNhi6od+SzGQNwJRcQhWpgYLyWrtPjbB3kpXkdKtrn2ICDT+dzUC+2i
 BG/K0wijIHDuSvKWLWMxYhXmWzKVfJPjM5SZDBYVAgXf/RuLClNXoEPJ560RgYc/TUtB
 stQydI2uX8f4f46rrRpCr+2E1SjSDL/Vkwq6sLqHT7yd+xJVphIgBujxKu5iio/hZK2m
 fXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3g1iJDAIyFEiVT/bq3Ap4xE8y4oUGUzuZ5yr37NL4ys=;
 b=DLr6IagcZTJ4esE1qcCyA577oUpgze2N60BLyWWbuRzaua6xN0RT0qZDkEiBcbeQp9
 qIBS6RcdCKbsLJdwroDeGW3BcCP57trUyhXkeGBzAXVG1uS8eIZluyQ/XbyDvrp7Lx2P
 NZD/zrl4jvIPsw35jaVFlMLApFW+ph08jTVH/znsGiahj5FU1LOepzm7GiDcZFKOkm2n
 7SRdntohNZ3CkEyMCofjp41VD459H5WFAsk0fB+PQa9IvwiCwI2PtZcWRQ7k4Rdz32JT
 /+O5AZulVu88/p4jKL8Je6ID0gxOy9pG2pmuaJk2yVvFw6CPW33NEtpjh1OqknuzccKs
 RHXA==
X-Gm-Message-State: AOAM533PWVXOP1ZaMmwozEngwaEDH6YEpYZ7fujEPEhvl3RGh4dfbJ4E
 /kWq8uMItn7qjkmoyqLTZoh1V0bxnMKUznXWOtSMdQ==
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr9417652ljj.393.1607991359509; 
 Mon, 14 Dec 2020 16:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-1-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:15:47 -0800
Message-ID: <CAGcCb11VRTUj+uMiikuDCgM2Y6op_mje+J+kazQSM9E9FF7zJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Additional NPCM7xx devices
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c97ae905b675a95c"
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x144.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: minyard@acm.org, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: n1d3b5snFzIo

--000000000000c97ae905b675a95c
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

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
> Hao Wu (5):
>   hw/misc: Add clock converter in NPCM7XX CLK module
>   hw/timer: Refactor NPCM7XX Timer to use CLK clock
>   hw/adc: Add an ADC module for NPCM7XX
>   hw/misc: Add a PWM module for NPCM7XX
>   hw/misc: Add QTest for NPCM7XX PWM Module
>
>  docs/system/arm/nuvoton.rst      |   4 +-
>  hw/adc/meson.build               |   1 +
>  hw/adc/npcm7xx_adc.c             | 321 +++++++++++++
>  hw/adc/trace-events              |   5 +
>  hw/arm/npcm7xx.c                 |  55 ++-
>  hw/misc/meson.build              |   1 +
>  hw/misc/npcm7xx_clk.c            | 795 ++++++++++++++++++++++++++++++-
>  hw/misc/npcm7xx_pwm.c            | 559 ++++++++++++++++++++++
>  hw/misc/trace-events             |   6 +
>  hw/timer/npcm7xx_timer.c         |  23 +-
>  include/hw/adc/npcm7xx_adc.h     |  72 +++
>  include/hw/arm/npcm7xx.h         |   4 +
>  include/hw/misc/npcm7xx_clk.h    | 146 +++++-
>  include/hw/misc/npcm7xx_pwm.h    | 106 +++++
>  include/hw/timer/npcm7xx_timer.h |   1 +
>  meson.build                      |   1 +
>  tests/qtest/meson.build          |   4 +-
>  tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
>  tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
>  19 files changed, 2964 insertions(+), 30 deletions(-)
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

--000000000000c97ae905b675a95c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:13 PM Hao Wu &l=
t;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch seri=
es include a few more NPCM7XX devices including<br>
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
Hao Wu (5):<br>
=C2=A0 hw/misc: Add clock converter in NPCM7XX CLK module<br>
=C2=A0 hw/timer: Refactor NPCM7XX Timer to use CLK clock<br>
=C2=A0 hw/adc: Add an ADC module for NPCM7XX<br>
=C2=A0 hw/misc: Add a PWM module for NPCM7XX<br>
=C2=A0 hw/misc: Add QTest for NPCM7XX PWM Module<br>
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
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 795 =
++++++++++++++++++++++++++++++-<br>
=C2=A0hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 559 =
++++++++++++++++++++++<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +<br>
=C2=A0hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 =
+-<br>
=C2=A0include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 72 +++<br>
=C2=A0include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 | 146 +++++-<br>
=C2=A0include/hw/misc/npcm7xx_pwm.h=C2=A0 =C2=A0 | 106 +++++<br>
=C2=A0include/hw/timer/npcm7xx_timer.h |=C2=A0 =C2=A01 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0tests/qtest/npcm7xx_adc-test.c=C2=A0 =C2=A0| 400 ++++++++++++++++<br>
=C2=A0tests/qtest/npcm7xx_pwm-test.c=C2=A0 =C2=A0| 490 +++++++++++++++++++<=
br>
=C2=A019 files changed, 2964 insertions(+), 30 deletions(-)<br>
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
</blockquote></div></div>

--000000000000c97ae905b675a95c--
