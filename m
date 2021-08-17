Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp351334lfg;
        Tue, 17 Aug 2021 02:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4SWW6cO9l4nfZEuFNxEHEVyVc/NKcDd7PAdU16EqkIJqdCUWrBQ2gcDHTCWQiB+9itmt0
X-Received: by 2002:ac5:c393:: with SMTP id s19mr1768448vkk.2.1629193042249;
        Tue, 17 Aug 2021 02:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629193042; cv=none;
        d=google.com; s=arc-20160816;
        b=gUzZ72Y3cTuuX6gDjbkInFouvOril6nsQBV53hJuTfmObhWVF4/dhzO1T8o/J/Qo4q
         0WFHsbvAbV2y185rbcTE877wfgCOiDcxfo8xUDbPvanVwYQb99CAkbO0OLvLW1J/uJHa
         NHWlR39+e47wL2aaArECrT2pCxTptMFr+OvpfUZQ9H/XBpTtWDQlHfNvRpIeKduPWfbL
         juE+FxzwiC2cXloModiHjMN1naNZ7WMdG2TOLTu0mETyAi4Pi9MK4EtC1f5hjKihlk+u
         k4B3xhXxqfu7Aeb/TvFF5C9Bkum7G8UXkw8kDRPXGl92HPlXY02Fxw2qHvo6T4Hm65hJ
         /fZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=lKp+WL5wH8816XdQO+pWfuhiD4n2W7s6ec7uDDidX0g=;
        b=UP/NA0hm9jNZMpWdS3NcyzjPQT0hctmAuBoIUCDp4qJkwOa74y61Jgf50Bbs/FFI/d
         aPC89Nv9i322EXrj3BxopEHRQDNrp3xxF8yJOsBLlOR2219RiIDYfD0wTdRMukjDfEcB
         U0sCtdZOXAnme1w7RXaPLtRMG+rEzc0NVPRRrIkJGYNffSOmJfi23RMnyoiMJZ9oE38S
         G1gGvWSQGHzpmIixylnpGw4bRG4KVemKuhL+Mj8v/mIOUMo0R8KRxlkHZdzJqzzImXSp
         b64oDz63UNwTjEmVO/7Fd9gDn9W/4Oz+mZXjE7CCEodYIxYJHllTrr4ijtvUiqqN7sGR
         6svw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=MT9nHmVj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p30si683514vsl.264.2021.08.17.02.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 02:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=MT9nHmVj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFvX7-0000q9-FQ
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 05:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvWv-0000pe-MT; Tue, 17 Aug 2021 05:37:09 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvWu-0006Ia-2K; Tue, 17 Aug 2021 05:37:09 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 0F56DC6019D;
 Tue, 17 Aug 2021 11:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629193026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lKp+WL5wH8816XdQO+pWfuhiD4n2W7s6ec7uDDidX0g=;
 b=MT9nHmVj7iJep1/APmEbicMprXgbs0ttBBas6Wk5iaKTxSumrHS5jwxrCfCzdCFzskEbqp
 ItLFFB5xgO4CGaHSKIvyfUJ3gX0ARmgntR6Tho1pa+fc9AHINs4C7R0RS6LKq/C9+ki4L7
 a4+y57qqNN0HbSxrUx/9SCP8MVCjvmUnvk/Xk9+L1uzqAoFvMTxvCE2Gq39ISp/bspshV+
 Fv5IqAD5JYr4oXXzkbBuVwumjo7IkPvZ9jWF3vzK/Ji+LR4h9BbDEgsp4o6BRIAkbohmPd
 t7vBL/MmbnaLuOfsNPP/vL6chdANAWJBii81kE1WxoVVj6tOJpI5hJeOsviMQw==
Date: Tue, 17 Aug 2021 11:39:18 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 08/25] hw/arm/mps2.c: Connect up armv7m clocks
Message-ID: <20210817093918.rpqaixya2nmvnrao@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-9-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-9-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XoAaClOwV3Yc

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Connect up the armv7m clocks on the mps2-an385/386/500/511.
> 
> Connect up the armv7m object's clocks on the MPS boards defined in
> mps2.c.  The documentation for these FPGA images doesn't specify what
> systick reference clock is used (if any), so for the moment we
> provide a 1MHz refclock, which will result in no behavioural change
> from the current hardwired 1MHz clock implemented in
> armv7m_systick.c:systick_scale().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/mps2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 81413b7133e..3671f49ad7b 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -86,6 +86,7 @@ struct MPS2MachineState {
>      CMSDKAPBWatchdog watchdog;
>      CMSDKAPBTimer timer[2];
>      Clock *sysclk;
> +    Clock *refclk;
>  };
>  
>  #define TYPE_MPS2_MACHINE "mps2"
> @@ -99,6 +100,15 @@ OBJECT_DECLARE_TYPE(MPS2MachineState, MPS2MachineClass, MPS2_MACHINE)
>  /* Main SYSCLK frequency in Hz */
>  #define SYSCLK_FRQ 25000000
>  
> +/*
> + * The Application Notes don't say anything about how the
> + * systick reference clock is configured. (Quite possibly
> + * they don't have one at all.) This 1MHz clock matches the
> + * pre-existing behaviour that used to be hardcoded in the
> + * armv7m_systick implementation.
> + */
> +#define REFCLK_FRQ (1 * 1000 * 1000)
> +
>  /* Initialize the auxiliary RAM region @mr and map it into
>   * the memory map at @base.
>   */
> @@ -146,6 +156,9 @@ static void mps2_common_init(MachineState *machine)
>      mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
>      clock_set_hz(mms->sysclk, SYSCLK_FRQ);
>  
> +    mms->refclk = clock_new(OBJECT(machine), "REFCLK");
> +    clock_set_hz(mms->refclk, REFCLK_FRQ);
> +
>      /* The FPGA images have an odd combination of different RAMs,
>       * because in hardware they are different implementations and
>       * connected to different buses, giving varying performance/size
> @@ -223,6 +236,8 @@ static void mps2_common_init(MachineState *machine)
>      default:
>          g_assert_not_reached();
>      }
> +    qdev_connect_clock_in(armv7m, "cpuclk", mms->sysclk);
> +    qdev_connect_clock_in(armv7m, "refclk", mms->refclk);
>      qdev_prop_set_string(armv7m, "cpu-type", machine->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&mms->armv7m), "memory",
> -- 
> 2.20.1
> 

-- 
