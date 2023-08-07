Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1571774ejb;
        Mon, 7 Aug 2023 09:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2akB8D1XG1k7N+aDXpxcl/egrcmdzHna2LkwUYy0wF8Q0euncgXmXR/hL25W2o/wy2ov
X-Received: by 2002:a67:f112:0:b0:443:7935:6eb5 with SMTP id n18-20020a67f112000000b0044379356eb5mr5212870vsk.15.1691425691765;
        Mon, 07 Aug 2023 09:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691425691; cv=none;
        d=google.com; s=arc-20160816;
        b=qQB53nNAdQ+OxD0hdGDZ5mXeTvZge9vJD9pIm6rIi6xV7KNKQ0Rhzqsv4E5hF5jnj5
         umwFWEyWctp8q+VLcIUYvnTb8D0Xlv1ZLFp/w81IQvMCyAiHpMUMTsog9Nthxvd9ANlA
         FmJckeMy2s5Wz1Gp2gC0HtyIDWcrjD7kbrBWypDb+4d6Y/l/xAFs/Ld8CrOuiWdyZ1Gy
         sSfR6UOqnA2YdgIqHk5xDbLLFpUAE4HCeVyljY3CTAvt55dThdEEqGI3qbEH4ezpIQ12
         OtAMUOrxRYLjTJrxAlYYSXjqxM8oXEFDGpbykg0ioR679+dJnOHk9M9gq8v1n4vlEBf6
         OvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LfNDcKRuOI+hL1JSklbZy6mFmwyJGqRAyiMRERzAUPM=;
        fh=vaDpLBJmz5JjobJK3RXWYZonZ7WwqDVHFeS4aZ+rLcg=;
        b=e4rRSJxgRbHM6vSG07FdQdmgb01i59ezfge9KiqQ3GHpKThcRCdX0cjqnDn9Zb/SmK
         d0iAle1r6hBDPCnG6U/s0nKDmwBZbwFz6ABGnHx/V/N9YkI2bDpGPXTVJqp2nvEABVh3
         w5LqcEMKW2N/wk7g+yoH3985u7WniyVXHmG67cSSWtbx216s4MKpNNh4DyF0cClWzAC7
         1DjhPPOQugQaGzRfA1pca0UtEMXsTALfqGLA+t9vh5edeauaqZbpucS3Ohe4W5kt0SLA
         NeIBwheKrfPSuLSQrYjdPkDo85JtwWH+ktOcYjYklIZ85DSL72EaMnTVk6xLk8tN4qCg
         kCjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vv2/XwUR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05622a04cc00b00403aac185c5si5175060qtx.636.2023.08.07.09.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 09:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vv2/XwUR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT35K-0003Aq-0o; Mon, 07 Aug 2023 12:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT35I-0003AM-0L
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 12:27:56 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT35G-0000g2-Fx
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 12:27:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52340d9187aso48770a12.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691425673; x=1692030473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LfNDcKRuOI+hL1JSklbZy6mFmwyJGqRAyiMRERzAUPM=;
 b=vv2/XwURNxoLRMaV6ALFUARru+PlUxu5NVBeVRIggdJeft5O6eMtH/mbP8pKx1IXvs
 fEVGgoqw52WP9pnGzJ23n4+FVsW+ougYx/HluLGBke65iUCow/fihFE6AAwuPPb7Oli8
 5YDZERX6svg9bZQa0U915pXVlWg9r2RlQ4BJUm+nSHim35So5xgC2K5BcYtdPfxQjnCe
 8kpbENjcNtfZpsL1hvpnWaqHvrbqvHCbmyWnZ+Pix4/H94QEdZadixUVqHVUYEQKtHl4
 pGythOEqsrmX1rv+jHKEfYe+e9V0R8jwro5pd2bpwn9piC5ivJ7vxBQI7kP2geZaQuxb
 Qupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425673; x=1692030473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LfNDcKRuOI+hL1JSklbZy6mFmwyJGqRAyiMRERzAUPM=;
 b=Cwx3xskgJ9ONWROmVpjB4NtuKzR83+Qd05CJ7k1+Isar48UBuqtcc5o2o1TBsAxNvC
 nVIljQiKpaJ1k0nysGN/LgKLUb+UPGksrlj/rP7Rgl8TUJsS2J8QrKSa0T5iHaoElMWY
 r5OqVnrq3MHLtwT469PIWF+JA5GX+/iA5BKQ7ioAm71Lp3B3y6sZ5qeIzpNEwA9SKbFj
 Qnl528Nw8qCKu6GYOk0ifUAiKomewh+YrLrLESle2ayh0Ezoun8YurQmcbEv4VDUc4w4
 vXDFmS4KYNTzpBelTTn8FRpPOm25W//esXAyH345h6y/B7Mg9EhiI36N0t9Q0hccML3f
 CfDA==
X-Gm-Message-State: AOJu0YxaIE1ygKb4dHtKKvGFRd0gCsOTamEIZkquKkdUDZtKj4lv/SCh
 YDJzNkieNGikHlfq8Gx1t8jJ5Bk/4UTCVRMytHktjg==
X-Received: by 2002:aa7:d049:0:b0:522:1f09:dde3 with SMTP id
 n9-20020aa7d049000000b005221f09dde3mr8423786edo.3.1691425672801; Mon, 07 Aug
 2023 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691010283.git.jcd@tribudubois.net>
 <649a1160b36c58ea89daf02a11b12f2dff164fee.1691010283.git.jcd@tribudubois.net>
In-Reply-To: <649a1160b36c58ea89daf02a11b12f2dff164fee.1691010283.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Aug 2023 17:27:41 +0100
Message-ID: <CAFEAcA_ZS81+0b6tsFxmNNaRCXgUC3HGFSfmyjF-1BnAv6gphw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] Refactor i.MX6UL processor code
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xZ1mgOPetDsa

On Wed, 2 Aug 2023 at 22:09, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> * Add Addr and size definition for all i.MX6UL devices in i.MX6UL header file.
> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>   - SAI
>   - PWM (add missing PWM instances)
>   - CAN
> * Add/rework few comments
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

>
>      /*
> -     * PWM
> +     * PWMs
>       */
> -    create_unimplemented_device("pwm1", FSL_IMX6UL_PWM1_ADDR, 0x4000);
> -    create_unimplemented_device("pwm2", FSL_IMX6UL_PWM2_ADDR, 0x4000);
> -    create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
> -    create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
> +    for (i = 0; i < FSL_IMX6UL_NUM_PWMS; i++) {
> +        static const hwaddr FSL_IMX6UL_PWMn_ADDR[FSL_IMX6UL_NUM_PWMS] = {
> +            FSL_IMX6UL_PWM1_ADDR,
> +            FSL_IMX6UL_PWM2_ADDR,
> +            FSL_IMX6UL_PWM3_ADDR,
> +            FSL_IMX6UL_PWM4_ADDR,
> +            FSL_IMX6UL_PWM5_ADDR,
> +            FSL_IMX6UL_PWM6_ADDR,
> +            FSL_IMX6UL_PWM7_ADDR,
> +            FSL_IMX6UL_PWM8_ADDR,
> +        };
> +
> +        snprintf(name, NAME_SIZE, "pwm%d", i);
> +        create_unimplemented_device(name, FSL_IMX6UL_PWMn_ADDR[i],
> +                                    FSL_IMX6UL_PWMn_SIZE);
> +    }

This looks like a behaviour change -- we used to create 4
pwm devices, and now we create 8.

thanks
-- PMM
