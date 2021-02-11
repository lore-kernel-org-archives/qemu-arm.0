Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2365272lfc;
        Thu, 11 Feb 2021 07:30:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsYeZAuhSQJ+RVGkFX/nRmHn6J1wvtNqwu2mafL6h3zo6wYZFfcOAS1auWetGblf8Y8KwN
X-Received: by 2002:a25:ab0a:: with SMTP id u10mr11572136ybi.312.1613057456915;
        Thu, 11 Feb 2021 07:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613057456; cv=none;
        d=google.com; s=arc-20160816;
        b=jQBCqX6SogaeLDa+TnZLBrKSKjmCrxPwWmpouhTyOYKfrdk9fpdrEgcAG8FYx7soQv
         hnd4zNL+WqDqjEgVihs2XdqXl9u5CMZoUUW3l+TfoBZsxwkcuMA7vTPBt0F9HM8mTtCj
         u4aG9uPnMXstNh0F2JUC+al0ejaIGBycB5MPVLXvFP4etCMplSSwTVCuOXT3BhKwSJua
         fcTNQUnHKqeoJkHjS30sl3vY40jzaYV1nwmihGqBgLBL4C0Hg/7fLbcatX+tH95YCmLK
         wMKcBylzWWZqN2vG5jQg96RSBV9/0AYdPcrGwpCVa9SFUpvvNBnrS4VRkG711si6bEll
         rIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hujUONcUIFxGFuAuJBvjDy+PFPW6faw5i7Unzwp5ic0=;
        b=SZff1fWJFnoCJareJdgfVpIYP+IbBWj5Na4FUsqw0YCeiilYt5cSZy1coGBQFoHlld
         +DVEM4HRDKq0IsQc9SWDMd9hOORCf7HKNQM3YrFrZKBEtuBamd7uhvEyvfjXmjVqFz/d
         3pVFQQUlI4vjG6Ng0zPRUY/8SPAY9NCuGxeuPm5Fpeq2SXc/DjmqHSlxSHDrqkiwRqTU
         v0jYex77AlFMb586+i2FiL48dQ/dfZMq4xF6gN+s4gYPuHs1mKa/PFXj2i95diJfjQMJ
         RCmDwBEFSC44mWFGA8xV20aijoz2SZflg5rrV3/U88YTtxC1N8dYR+qXEwCNwrTRMRiN
         dMOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VAnT+QCw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si5251299ybo.226.2021.02.11.07.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 07:30:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VAnT+QCw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lADvk-0001IJ-6n
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 10:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lADuN-0001Dg-1s; Thu, 11 Feb 2021 10:29:31 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lADuL-0006wg-AK; Thu, 11 Feb 2021 10:29:30 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hs11so10707744ejc.1;
 Thu, 11 Feb 2021 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hujUONcUIFxGFuAuJBvjDy+PFPW6faw5i7Unzwp5ic0=;
 b=VAnT+QCw4oXQoPxLou44ZPBp7mf7Zk3MoY/nXNmitiA1UgfO/q8VgEqAOeY7/1BF9p
 tcRnPWbIQtBhGxuqgwnTeCFupaiOn0wYJW60ApcbGhmm0KLC1eVXO4SNFTYdPCmL2JEw
 nPlwCAXNsgNkZ0VR12R6ydgJhNkfuUfRDoGz785hCET9+BVDPoyrhT28fXqtGP1jMkgx
 Tsev/yU0HtEhLuBar8XBAQNviaOVC55RZLC/LnZsqe5z0/VoYt3RsrZQ8OvB+v1y/1aV
 Qwi5o1XJPCOysUyMjqUhPcWY8OirVK5bI/4SQKIU6BRX3GdMUE1p3Jc9yUNXnds821aY
 UnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hujUONcUIFxGFuAuJBvjDy+PFPW6faw5i7Unzwp5ic0=;
 b=Bj9dBUQrCq2dydPu+O/36OnosswSsRyVzPKMkkt7xRBUaVhgZrZ4UQf2819Eefun6R
 h/IKlNYSmM7DMjan9PhHY6p9sW8c7R4U1pck2d/u0PyLJS0v097a40TkQYngNrvhAuBd
 +C6uI+83OPdKLuy5VjNspHh4bw523uVvLrwJCRCg0SiDV80TlLzfVS+Vjtg/QIxZIESW
 6tdczqoa9m00aATIxH7clfIb9qyXkHUxNDcfS28FA3Sv/BUeyDj8lKhsFBl7N5YlnFT+
 pnV5QF6jKwUnGq4Pv61anoz9yOI7kGYQlB+jViJ133MgvuCzT4OAxWPE2r91c8zWeaSB
 nj0Q==
X-Gm-Message-State: AOAM531edbQ2Z4respenBVvNG4RC3gWHKfyN+zfr2CpqIhigxKcWunM+
 RRzMjwgQ4MMCDGf/8F6M0S0=
X-Received: by 2002:a17:906:2299:: with SMTP id
 p25mr9085400eja.279.1613057367170; 
 Thu, 11 Feb 2021 07:29:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q20sm4684256ejs.17.2021.02.11.07.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 07:29:26 -0800 (PST)
Subject: Re: [PATCH v2 1/4] clock: Add ClockEvent parameter to callbacks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <46398c06-1545-77aa-85fa-66d9d373e277@amsat.org>
Date: Thu, 11 Feb 2021 16:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209132040.5091-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yacfculcxp7T

Hi Peter,

On 2/9/21 2:20 PM, Peter Maydell wrote:
> The Clock framework allows users to specify a callback which is
> called after the clock's period has been updated.  Some users need to
> also have a callback which is called before the clock period is
> updated.
> 
> As the first step in adding support for notifying Clock users on
> pre-update events, add an argument to the ClockCallback to specify
> what event is being notified, and add an argument to the various
> functions for registering a callback to specify which events are
> of interest to that callback.
> 
> Note that the documentation update renders correct the previously
> incorrect claim in 'Adding a new clock' that callbacks "will be
> explained in a following section".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: (suggested by Luc) instead of making callback functions check
> whether 'event' is one they are interested in, specify mask of
> interesting events at callback registration time.
> ---
>  docs/devel/clocks.rst            | 52 +++++++++++++++++++++++++++-----
>  include/hw/clock.h               | 21 +++++++++++--
>  include/hw/qdev-clock.h          | 17 ++++++++---
>  hw/adc/npcm7xx_adc.c             |  2 +-
>  hw/arm/armsse.c                  |  9 +++---
>  hw/char/cadence_uart.c           |  4 +--
>  hw/char/ibex_uart.c              |  4 +--
>  hw/char/pl011.c                  |  5 +--
>  hw/core/clock.c                  | 20 +++++++++---
>  hw/core/qdev-clock.c             |  8 +++--
>  hw/mips/cps.c                    |  2 +-
>  hw/misc/bcm2835_cprman.c         | 23 ++++++++------
>  hw/misc/npcm7xx_clk.c            | 26 +++++++++++++---
>  hw/misc/npcm7xx_pwm.c            |  2 +-
>  hw/misc/zynq_slcr.c              |  5 +--
>  hw/timer/cmsdk-apb-dualtimer.c   |  5 +--
>  hw/timer/cmsdk-apb-timer.c       |  4 +--
>  hw/timer/npcm7xx_timer.c         |  2 +-
>  hw/watchdog/cmsdk-apb-watchdog.c |  5 +--
>  target/mips/cpu.c                |  2 +-
>  20 files changed, 160 insertions(+), 58 deletions(-)

> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index e5f45e2626d..5c73b4e7ae9 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -22,7 +22,17 @@
>  #define TYPE_CLOCK "clock"
>  OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>  
> -typedef void ClockCallback(void *opaque);
> +/*
> + * Argument to ClockCallback functions indicating why the callback
> + * has been called. A mask of these values logically ORed together
> + * is used to specify which events are interesting when the callback
> + * is registered, so these values must all be different bit values.
> + */
> +typedef enum ClockEvent {
> +    ClockUpdate = 1, /* Clock period has just updated */

Just wondering loudly (QEMU doesn't have enum naming conventions),
maybe rename  ClockUpdate -> ClockUpdateEvent to clarify.

> +} ClockEvent;
> +
> +typedef void ClockCallback(void *opaque, ClockEvent event);
>  
>  /*
>   * clock store a value representing the clock's period in 2^-32ns unit.
> @@ -50,6 +60,7 @@ typedef void ClockCallback(void *opaque);
>   * @canonical_path: clock path string cache (used for trace purpose)
>   * @callback: called when clock changes
>   * @callback_opaque: argument for @callback
> + * @callback_events: mask of events when callback should be called
>   * @source: source (or parent in clock tree) of the clock
>   * @children: list of clocks connected to this one (it is their source)
>   * @sibling: structure used to form a clock list
> @@ -67,6 +78,7 @@ struct Clock {
>      char *canonical_path;
>      ClockCallback *callback;
>      void *callback_opaque;
> +    int callback_events;

Isn't "unsigned" recommended for bit mask?

Otherwise (minor Hao Wu's NULL remark):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
