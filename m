Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3791146njj;
        Wed, 7 May 2025 06:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUsv/WYawWH0QXSnXzy0f70B7jfQ7nK1QjydUNlvV+AYXAPkL0PS5eYYb4z3HkYspSOkpR3MCq/0LbyA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZUA+3w41PJGVfuTrdD2PdDYQhyFVK4TtW6rPc4dvy6nYxIU3Ay12oZAnuJdAskwqQFotC
X-Received: by 2002:a05:6122:c9f:b0:52a:79fd:d05e with SMTP id 71dfb90a1353d-52c379a0517mr2196219e0c.2.1746623202086;
        Wed, 07 May 2025 06:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746623202; cv=none;
        d=google.com; s=arc-20240605;
        b=TT6AnLBX2XAztI4qhFWcnJ9Qk/wLsIL6hDzr7y2iLNOhhDMa4WG7Nw2mXmwrliuMGB
         +anMiP0Y0LJeExKB6LmkkaW41Ygyf66mb8KlJnzqcZ4GaeEFWzigDL2GidggN0CkjDZy
         J9DqBkxtt6PfoOHZtFB5rJz4qxsthb8LFMKeHdqRdio/1slRQ/CvhqA+/Pw9gSJxL/H4
         81gglsfOTTGD4M3BwmiIcwAMj5jcYTrX1dP6IEXCryKNsYQON5Om1WcH5mxkECe6VTIq
         0h5wwSg/poiSTAdT52j3N9fEwvxAKA5B8m9R+CiuSxo5WjxWqHJKojQRMe+JslH9R8mT
         3E/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=mdO84SBT+yzy9Vdl7PflEH11rZSK9840HXhCWIBmk2I=;
        fh=XRe0qIdNXlvElDwlCl+uieeOja16CX/X2JzsgK6l37g=;
        b=VAUGpDOsTnMl4laVenvQk7Wxh+jMcpsPM1CCcKUDBOXxhllc9R5fTXAOBr8RN509Zg
         8/VAinkaf17Nrb5B/tJIP0IPUUEas+q+5lnUL8q9koueFIHMsS9l+VaijGyqi8UAGIjX
         1Ddk1hz2TqhUZP/4Cav9eolwPYTUpPzg4fjJNWnwSb+dH4Mz+al6ZwTbQZPqO/9WqKLU
         /csGx46lfPKMxkmLtAkAMwco4UPqmZmBR8AvWchSo5sstvzN7eCOfOR9VJ8fod8EQ4cj
         uBwF8wu41qiuHBm4i4mj5YucUHijmjfglNaizxX5iDVLkuUk2a1Pj46THyyVVVV+wYUK
         f/ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=HaaaGTNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4daf263e493si3015853137.646.2025.05.07.06.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 06:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=HaaaGTNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCeTc-00055E-Dr; Wed, 07 May 2025 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1uCeTb-000548-JU
 for qemu-arm@nongnu.org; Wed, 07 May 2025 09:06:19 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1uCeTZ-0007mp-IM
 for qemu-arm@nongnu.org; Wed, 07 May 2025 09:06:19 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2c769da02b0so5341202fac.3
 for <qemu-arm@nongnu.org>; Wed, 07 May 2025 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1746623175; x=1747227975;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mdO84SBT+yzy9Vdl7PflEH11rZSK9840HXhCWIBmk2I=;
 b=HaaaGTNhuJ7bxLkEuobxfVmFVjuiy2G6OAwvMpOI3Z2Nnl7fKUF53gNOaj0O6xHhhZ
 j5WAAQwDBVqKKqwsUzyIxMazKoKnSdLQ5E9lVIAfIiQbrGyy8Mcfm6KtsFS0TAVUt3zy
 qMLMej7ld0CF8JGEU3yKMBg1AYoN7U9F+KHH7snIr52vU41EvqioesfgheyFXo5/GXS/
 8HKgja0UcXaIu3j6VTYq0U9odH6LnV01bGGGpWJkiESsvYau6P2tRXqq09fyg+RR7bUD
 8KmqwxHgjGJWlwKmkzbfzIbUhUqHMsPeSUHSScikR0eNmst0LN0hx4nrZHZ8qHHhLI+W
 85fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746623175; x=1747227975;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mdO84SBT+yzy9Vdl7PflEH11rZSK9840HXhCWIBmk2I=;
 b=DL4pnUEltVn5ZT+6M2KhMw0cucfiQ8F5ay2KyfY7lqVwKqOGljx8v05jtoWhClgFBN
 NIeUOi7BTK3k8RJZ6FyfryRkeq/9rFEkXivS5OT6Hbi9uMn9irKqo7skFSTsenFhc9mG
 5Z4isFuSSv+H+ZVCXGYd1hss18U7pJ7lsW3Av/e0AjN1xMI/vtHkRUn7EbiDlfCrU1+g
 g9Do/OynMySKjn+uXKMW7aWwNfRRPTi1brz8j/9jPMItvaY2KGQ4hUSdUiDAcM3s4tWI
 lXfM9eJPiZs6aVwCcfuiQ5jRY3EThj9gHHDIr8/V9KlzNNc0/G2YYmo0QOo2iqQ1kKmG
 4F4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNmE2lTsc1i1qAqkEAghn+4bpLP6GCpQGZtnh7Prm6J2D2BQWWatjl033oHvyG+j5DvOtI/nrj0Q==@nongnu.org
X-Gm-Message-State: AOJu0Yym5BvTOaDzCW71PgOPweV46/+icGjmPbH6A3bj2zKpWyG+68S5
 YvDsi8pqQAxKz2lQc7/M4B9G2hyHoAXziVp/rmgpMloTzgyj19mf6B7HwuaR+xI=
X-Gm-Gg: ASbGncsxIRFt5mO6FoW+c5fETZIUgncBEobUjHDmDOO5r2cdkLA7i0A9qYZgqrwg6Bf
 j9g7NjsX9W1wzoRmvesEgS0Zb77H0+2BsLxN1qK8B2ZGJXvAeOUlOStr+19oI6xqy+VtJcMrVDD
 H/rZSQd6X4Y3UArL7vdVTy6ZIMhPTS/7KIg+8DegbM7+9G7TuCdiY/BzR/fiRGw2w6qwFcc6/Ej
 QGqKfvyQhuiFEfhOihNnYaM15mzUAMFZnGCiRSaGuNY4U6bWkJeIEtmf2FxqYaJ/V/3jGokkSan
 Fd0/C8uIKRXLwA/7nyMXGVfIZQZwixpRXGFebXT41I/0
X-Received: by 2002:a05:6870:548f:b0:2d4:d9d6:c8c2 with SMTP id
 586e51a60fabf-2db5c114a03mr1906432fac.34.1746623175102; 
 Wed, 07 May 2025 06:06:15 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:5eb9:1067:bea9:6bfe])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2db5d0dcd34sm570787fac.41.2025.05.07.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:06:13 -0700 (PDT)
Date: Wed, 7 May 2025 08:06:06 -0500
From: Corey Minyard <corey@minyard.net>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/i2c/imx_i2c: Always set interrupt status bit if
 interrupt condition occurs
Message-ID: <aBtavpDt1yfoavj7@mail.minyard.net>
References: <20250507124040.425773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507124040.425773-1-shentey@gmail.com>
Received-SPF: none client-ip=2001:4860:4864:20::2d;
 envelope-from=corey@minyard.net; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: corey@minyard.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M7J5ImgpoFGx

On Wed, May 07, 2025 at 02:40:40PM +0200, Bernhard Beschow wrote:
> According to the i.MX 8M Plus reference manual, the status flag I2C_I2SR[IIF]
> continues to be set when an interrupt condition occurs even when I2C interrupts
> are disabled (I2C_I2CR[IIEN] is clear). However, the device model only sets the
> flag when I2C interrupts are enabled which causes U-Boot to loop forever. Fix
> the device model by always setting the flag and let I2C_I2CR[IIEN] guard I2C
> interrupts only.
> 
> Also remove the comment in the code since it merely stated the obvious and would
> be outdated now.

This looks good to me.  I can give you an:

Acked-by: Corey Minyard <cminyard@mvista.com>

or I can take it into my tree.

-corey

> 
> Fixes: 20d0f9cf6a41 ("i.MX: Add I2C controller emulator")
> cc: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/i2c/imx_i2c.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index 91f84c2ad7..d26177c85d 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -79,13 +79,12 @@ static void imx_i2c_reset(DeviceState *dev)
>  
>  static inline void imx_i2c_raise_interrupt(IMXI2CState *s)
>  {
> -    /*
> -     * raise an interrupt if the device is enabled and it is configured
> -     * to generate some interrupts.
> -     */
> -    if (imx_i2c_is_enabled(s) && imx_i2c_interrupt_is_enabled(s)) {
> +    if (imx_i2c_is_enabled(s)) {
>          s->i2sr |= I2SR_IIF;
> -        qemu_irq_raise(s->irq);
> +
> +        if (imx_i2c_interrupt_is_enabled(s)) {
> +            qemu_irq_raise(s->irq);
> +        }
>      }
>  }
>  
> -- 
> 2.49.0
> 
> 
