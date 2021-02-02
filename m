Received: by 2002:ad4:54c3:0:0:0:0:0 with SMTP id j3csp2251688qvx;
        Tue, 2 Feb 2021 02:32:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXuQCs+N/0O+w0XXk+SLBqOrlh/OHfxOg87+isee+APZDBheKSrkQyUlu7uKVMpxJp4Fjr
X-Received: by 2002:a25:ba13:: with SMTP id t19mr32175586ybg.129.1612261925421;
        Tue, 02 Feb 2021 02:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612261925; cv=none;
        d=google.com; s=arc-20160816;
        b=hr8DCM8oHsUHkZ0d0kpF0BMAIbbaxWgbuQrqebH0hciYDSEFKgQ3NognRwRRaFmfL5
         SLYqM52MiVwTLsky1uNscRRnSYpsQTEbtaLCNkxpYUyrutWrQ9jdi23xiGCgwAw24XHb
         PCQWLrxXty7WJkEOmK88sYOwLK31rAHw7TQqX6qDk/w0ordkXs7LLDrSpa13f2thVOiI
         V2tja7FR/3aNyFSlvD7xGFysMmx0Y/+E7XIR+WzUw8dOqhUNkGHBueq9bPmAFZdcQA+7
         j09321y1FZnl04s+qAtGpbSH0EUeOMMBdmnq4kM/Rs9vUyP+cyns9yrtI3P6j03y3YXo
         z4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nn73uSUVH5yPYti5eVa0hD1TrkgyKYCxhklx9OwkBLM=;
        b=YnymzC8S4+se29I9ayyMTx9H74Fs31TpUXtfz677lm7JQxenmz3fRq8s/17DK143p5
         okq8g5XojXrgSMwZkMr2otOxt+DyeuadIdBewMILdmLWV8Ppp6KSnocdYX1pt22lYlX6
         dMiAfhT5o+4fFQW4ISjveSnSLOaMfN1POb80ysW0xIyvMM1vLsvzmL4xy3kyVhvakH2R
         H6kHAZI3CqruQ8SeudPzpSvavY0kFEMw3hpvySQHy91Y4bPeuLUnuupJKY6SxdAq77sS
         r2dGZ1+NieGyImv6N94GpY9t0Bmdu7qaRYwtHKMMBJvhdXWksBkM4MTZunEbrv9JoKmH
         rr1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=en+Uk6F8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p82si3501586yba.351.2021.02.02.02.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 02:32:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=en+Uk6F8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6syC-0004P3-T9
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 05:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sy4-0004Oq-3p
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:31:32 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sy1-0004K4-Hz
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:31:31 -0500
Received: by mail-ej1-x62a.google.com with SMTP id rv9so29083342ejb.13
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nn73uSUVH5yPYti5eVa0hD1TrkgyKYCxhklx9OwkBLM=;
 b=en+Uk6F81I9FDa10oTKmhrwCJQAi87Vw1pGPK3c4pVl6YmWxXG2r6ij+WAsxwDBvbZ
 ThY1dNCmLuSTC0SxxqrekuCzPo08QDhOj2Yk5gh0LSi7ER0+nDAAkjiFRB7oCy8HS3er
 d329DHQV//iUrRfO0nVcX5fJA1NwoZfyeUOx/pjqsVMKvc+LVDrsvg1Y0j/IpPLlVWMy
 YKGQRaqXQcwgab9DI/ifuui27AAhfDvlSyYzZcG9g5K67tC3NwJzJfppPe0ekx13kUoS
 cgeOEKr5rIA7AIPtt3hVav+/EMhrI3CDNz+2f+GgDzDVa9ISvaKwVENEpNbFZyh5e5rQ
 ZCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nn73uSUVH5yPYti5eVa0hD1TrkgyKYCxhklx9OwkBLM=;
 b=j8cQvcBLpcuN2UO9+AV+NG5x+0e8wqlPP7jeXcM0XsyuhL7w0Xznth3NdyS+ouzVSv
 +rSdSKJ83LeEkbblinPNKpV/gnUjbcm4tJrysuIOMrAli5Dv2oHoIo7dWrZCBUH8EfdC
 onp6nFKr3mTC7I+FBC6VFjQK4iA+QTD+50mqczTrLK9MSKcOQVHUPjOuIRX/BIbFomMb
 UVOcHHg+Ipl7txY44QppD8dMzwW3+x4HcwMyH6e+psnXqPL6597pRmho2QWVcuUzFi8n
 EwUqQZIOYjJfqP4NpUQfkVsSjDy+VN69zyAeGPKEJiiMbSo4yFDxTdqmTaeQMWCYkPOS
 anwg==
X-Gm-Message-State: AOAM533KoxkOixT7ATLH+ZP/P8xa7Vdd2mVsPe5CaoXtKBoJ4T+CDUYX
 gHbQwOFJTwZBC910gx1pBrDSfOQ96pKolfQPZ9k1Cg==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr22057746ejt.56.1612261888209; 
 Tue, 02 Feb 2021 02:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-5-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-5-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:31:16 +0000
Message-ID: <CAFEAcA-j8TeozQLSTSK1ueVFKZ4J6tTCjMBNJMQTLQCeAnKkpw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] hw/intc: make gicv3_idreg() distinguish between
 gicv3/gicv4
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GjnFBnsbRnMH

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Make gicv3_idreg() able to return either gicv3 or gicv4 data.
> Add a parameter to specify gic version.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_dist.c   |  2 +-
>  hw/intc/arm_gicv3_redist.c |  2 +-
>  hw/intc/gicv3_internal.h   | 12 ++++++++++--
>  3 files changed, 12 insertions(+), 4 deletions(-)

> -static inline uint32_t gicv3_idreg(int regoffset)
> +static inline uint32_t gicv3_idreg(int regoffset, int revision)

I would prefer to pass in the GICv3State* and let the function
look at s->revision.

>  {
>      /* Return the value of the CoreSight ID register at the specified
>       * offset from the first ID register (as found in the distributor
> @@ -331,7 +331,15 @@ static inline uint32_t gicv3_idreg(int regoffset)
>      static const uint8_t gicd_ids[] = {
>          0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
>      };
> -    return gicd_ids[regoffset / 4];
> +    static const uint8_t gicdv4_ids[] = {
> +        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x4B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
> +    };
> +
> +    if (revision == 3) {
> +        return gicd_ids[regoffset / 4];
> +    } else {
> +        return gicdv4_ids[regoffset / 4];
> +    }
>  }

Updating the comment "These values indicate an ARM implementation of a GICv3"
to add a note about what the new values are indicating would be nice.

thanks
-- PMM
