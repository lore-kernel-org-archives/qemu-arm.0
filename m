Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2448284lfa;
        Tue, 13 Oct 2020 17:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV/shFoFKtQ7fiuXDL7REC+1xNeZwBfyrc8fGy69jw9ffQ6kmqR2NNE4l7zVSb1EXsf6tW
X-Received: by 2002:a5b:891:: with SMTP id e17mr3297364ybq.341.1602636087379;
        Tue, 13 Oct 2020 17:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602636087; cv=none;
        d=google.com; s=arc-20160816;
        b=fA8H3RnvhyQ+uAVn5XOOZiT91dAehCFtOf7W9ZCxS/mQEMR7f4P8OjBHdKV/ctK2Ut
         hv38Vhk97/+I0IYv+TqLe/9ctcQ6OKA2UsjBJas3e771q5SLv38j685gdz7w5F1av6e8
         XwqwZed/xzldXglF0ZdYktTA8QkmpqmmTJrLkyALYCzmuLtsVCiNy+90jd3KdVYokeLu
         6v2IWmVQpOdwyUe3pH0hHbyiHV+UEe+cBbJrjuqRVwu8dqlVX+k19XoDKXqh2MoPYygD
         TkSWNmI6h+vAylioozgBH8pRxcWje0lcnLpi3+0cXFYkOzfnBQQXbUtb6gBI+kXgvGcj
         jmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+r5ToroeDUuYkZgbyDgAF/e8P+o5DiJI+k6NjPSMAQ=;
        b=FwqEfO4U4P8xYDkxOWQvZlPKgOUTHnhlg3yBa6GQx8hJfELbddM6vtHRxAuaqZwUb7
         PnLOL+7horuPfE7+cmgs/T0VD9MDJBnOkxyF5kQDg0VPAlrKNwXRYdS//e/r2kms6tA4
         /KDWFYxAuChTEjHQMpHgFrC7lapvr83qrn6SQV4LrOSewkn5q/QNAALol3r064uHjdAn
         4NW4DfiMUBBCbRrKZDkjDo0tVFo7LZJN4f2QvGd12zUtDgF+3wU+wCQbzxyS4jh/Q3yU
         42kJPVexVxZuQWUT7I6v0Q9j269qAN580Qp5SZ8Jp9B5iH1D1jLnN/klgk8I1n718tJX
         8QDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rKNTPf+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t125si1599043ybf.333.2020.10.13.17.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 17:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rKNTPf+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSUr8-0007D2-It
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 20:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSUqz-0007Cc-9Y; Tue, 13 Oct 2020 20:41:17 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:38193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kSUqx-0005YL-EO; Tue, 13 Oct 2020 20:41:16 -0400
Received: by mail-il1-x143.google.com with SMTP id p16so3227329ilq.5;
 Tue, 13 Oct 2020 17:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+r5ToroeDUuYkZgbyDgAF/e8P+o5DiJI+k6NjPSMAQ=;
 b=rKNTPf+fSmpvZpnkegYSgzUlNhYnmEYa4Pqp1m+f4WxTII7eTdmEQvJhV+cQNGeNQ0
 EoEr8reCadqeNay/Q6O29bBXFq/UilihnLa++yBNQl1Lpw8xdOslamHxuAKzuV4wJkhN
 9Nma+ylQym46OF5yL4h4JCkqgDLpTmYO5tjX5wDXzUZLWvISSBM2/DShuXscxF60Nmmz
 RSVXW971PIU+otOoUrhJG2Ox5ea9yn6eqxMTnK2LwOC9AhRdYuw9OefTtVSSgUwHitF/
 m2+B9Q33ltHOvKIT70H7S2+q1Xli50RFGJY+wgW8GdhqM6E2xba0nyBZOFvQTq3qy6s+
 aFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+r5ToroeDUuYkZgbyDgAF/e8P+o5DiJI+k6NjPSMAQ=;
 b=lKYeLkYelhfemDjSdbNWYaO9g5CfKOhwMJXli8Y+clhII+l+5KiQN6hdvIiEqi9Vo3
 qT8Uc0zhfi3F4aLwBoqP1D23TvjHZ9+J7vGMzKujZkuXvgioKSNx1EYz2UKUuxpcId43
 L2uLgEUelWIrV+3pnCkZhyqHi9HNASnTbMZJcjQSyIdpE84wVfaHrg1aZiBuiBDz+qOv
 eZev7bzoF2Taty1rlORpxWk/Dsx2b96OG+Eu43ZzyTfS40I3Z6t//oQKYqhk+dcwT4Vw
 b1ivUe5nuQbzYpGGyh4dderd2PtPZ9Y5I2ES1BlpLzhZdi5wFq3PRt4aGKuBfdR/ou1V
 wYpQ==
X-Gm-Message-State: AOAM531mRyO+7CYXYpS+UII1BWMt7AEkoD06DLuaTEXWWFjhMoNR8hZn
 MEHOSYqwQgwmesl7DtDfhdBcTloamNfHHVkX0KQ=
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr2022276ilt.177.1602636073911; 
 Tue, 13 Oct 2020 17:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153408.9747-1-peter.maydell@linaro.org>
 <20201012153408.9747-13-peter.maydell@linaro.org>
In-Reply-To: <20201012153408.9747-13-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Oct 2020 17:29:37 -0700
Message-ID: <CAKmqyKO-bRg0WcoqXnt1oaKtgzKTdajwJ-U2YfZh=PzvP77xug@mail.gmail.com>
Subject: Re: [PATCH for-5.1] hw/arm/netduino2,
 netduinoplus2: Set system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HB4ftSqiMSQ

On Mon, Oct 12, 2020 at 8:45 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The netduino2 and netduinoplus2 boards forgot to set the system_clock_scale
> global, which meant that if guest code used the systick timer in "use
> the processor clock" mode it would hang because time never advances.
>
> Set the global to match the documented CPU clock speed of these boards.
> Judging by the data sheet this is slightly simplistic because the
> SoC allows configuration of the SYSCLK source and frequency via the
> RCC (reset and clock control) module, but we don't model that.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1876187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> NB: tested with "make check" only...
>
>  hw/arm/netduino2.c     | 10 ++++++++++
>  hw/arm/netduinoplus2.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 79e19392b56..8f103341443 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -30,10 +30,20 @@
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/arm/boot.h"
>
> +/* Main SYSCLK frequency in Hz (120MHz) */
> +#define SYSCLK_FRQ 120000000ULL
> +
>  static void netduino2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
>      dev = qdev_new(TYPE_STM32F205_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 958d21dd9f9..68abd3ec69d 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -30,10 +30,20 @@
>  #include "hw/arm/stm32f405_soc.h"
>  #include "hw/arm/boot.h"
>
> +/* Main SYSCLK frequency in Hz (168MHz) */
> +#define SYSCLK_FRQ 168000000ULL
> +
>  static void netduinoplus2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
>      dev = qdev_new(TYPE_STM32F405_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> --
> 2.20.1
>
>
