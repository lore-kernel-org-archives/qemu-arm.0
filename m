Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1656109lfr;
        Fri, 9 Apr 2021 09:51:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXhbIsUsDxUNt7qphbCCSh7FYrtuzne1D7tGZMZWJaUKAe7nMIvNqMCFCGXbk/rj+el272
X-Received: by 2002:a05:6e02:dea:: with SMTP id m10mr5110493ilj.112.1617987109501;
        Fri, 09 Apr 2021 09:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617987109; cv=none;
        d=google.com; s=arc-20160816;
        b=GiAxrjimf5PlNAUHn00bWFetB/cJB91aiKQTsgYogyhimOZBv1J+TMn0OAy1SYhTDq
         fdb9yywl1Kdf6fa2nJle3z8qBnzO88WaLPGOvp6MJ3KauHVIhhOOZ0BkZk+GOCML2frW
         UZo83r36Ua7D0pjCVsqyctsd7dbwohXEFGo3ZTVOMkLcjdOW03Ck6UZluaoZBR48/Td9
         VzCKhgAbgYeHXdqrfwaE0gnAmCUKjDztlixHqOjoqDJf8EHSW2eGms/68Rs6LcFdixD1
         UKTKydr7757kU/I/a0SL04KmqAWqQ6f0iT+BS6zjccgtmdu6K67/A2fjZOqb+NpCSHMj
         YQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eL9M3nSvYIcjKGaYAMdCUToT3hR0h2dEDWmp0lKhSvQ=;
        b=rNLxMNt5oV8UeGf5h5lqHDNryCupko0S5bpsVvK6MH3KeMf2MOUkjUTZfTdVubTj2f
         H5u1eHLXA9a8SzmWBnrjN4KauJzNuVHLItwAWyO+pC1glV/fi74GymZgWrNm1rgqafnE
         cUridCPq7TedgI0MSJkcRw3HRAkFA79aNzRtJcFD0WaMz3jjwy0Wkg+z5CBsoUsOSIyj
         za0DVIMC8KsKh1sCN9DPqvHZslDGPfG+ldZrhueQ6Z57C9hPUppZJpupolku7pbSragR
         +Kg2kKhOA7/83oonba49o4SGq/cbcf78i3jy2kgoCNgQ+BHKw1gCOSi+hpsLSZGjXRXB
         wV1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lwirJ2uZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si3154599ilj.33.2021.04.09.09.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 09:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lwirJ2uZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUuMG-0003w8-OG
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 12:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUuM0-0003nK-PG; Fri, 09 Apr 2021 12:51:32 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUuLz-00081q-87; Fri, 09 Apr 2021 12:51:32 -0400
Received: by mail-ej1-x631.google.com with SMTP id w3so9715900ejc.4;
 Fri, 09 Apr 2021 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eL9M3nSvYIcjKGaYAMdCUToT3hR0h2dEDWmp0lKhSvQ=;
 b=lwirJ2uZ2V9eq8gQwSI9JXn85Gmlis6GuY8wnC457EvvVyx1JY7/6BzwCjopNjFiod
 83lMtSay5UA9QBjlSbFr6XCH0N3OXTrFebGwoBnHXdjfBvbUEcTUh/7WS/S2U7yHq/kJ
 HGjAZ0K2Yw9OoIIetgF5wVbIGsfVwurMWHgEdh6IOMDVp/OhgvWa8JeRbwMctAyFn2vL
 x097cXUZLAAWGp025FkFAInhnFmvRqHOCMEKuZZUURnAcRB0i/ftKBjceuj1eXgfdbKY
 30NV6MfdCbCdAUccn1HiaLpifG9uSisNXViIxjg9aJ+H09+5C/Xz77FmYa8QAOxsLueA
 d/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eL9M3nSvYIcjKGaYAMdCUToT3hR0h2dEDWmp0lKhSvQ=;
 b=pCWcxRoMMpafM4HDcuWMyS1VaVkPsZEhMCTZ+ulcH/ZctbcxPhXqQf82IzaPQdicRp
 uP129Emzevg09cRIRmrO19/3rI2gFF+Hs5904ipLzmjxIjBhI22jVWZi1XTO/I9AVrJ4
 alc4OL/0tuKAzn3K+TMHrF59DEl8mbYr9Ae4WxeQMvFHGh5L2/LvP+8wazfIfTbdY/Il
 iMMRyEapoSDyYLrbuS4/fqE1j3JrdDT20RWHH3+sZNDNkHw0ZbNRlL7R+ep/IUqPtUhy
 /tBbmrX7zGVXHZWXxRiHHG9ptkY9mda7oz0qlsJcTaPPXajwX1CfVdAvRqPlxbVLurET
 al5A==
X-Gm-Message-State: AOAM5319hV4TTsIBHmyDk7uRLU7ZggxRU5nxD+dVC82aHjwDzr+KdcPL
 i9gV6TuQ5J5rFSqtqQCzd7JaOhR+6od4lg==
X-Received: by 2002:a17:906:5056:: with SMTP id
 e22mr16709042ejk.289.1617987088792; 
 Fri, 09 Apr 2021 09:51:28 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id qk3sm1494205ejb.22.2021.04.09.09.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:51:27 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] hw/i2c: add pca954x i2c-mux switch
To: Patrick Venture <venture@google.com>, cminyard@mvista.com,
 wuhaotsh@google.com, hskinnemoen@google.com
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-5-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
Date: Fri, 9 Apr 2021 18:51:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409162545.3705962-5-venture@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZkELSorEo0kx

Hi Patrick,

On 4/9/21 6:25 PM, Patrick Venture wrote:
> The pca954x is an i2c mux, and this adds support for two variants of
> this device: the pca9546 and pca9548.
> 
> This device is very common on BMCs to route a different channel to each
> PCIe i2c bus downstream from the BMC.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  MAINTAINERS                      |   6 +
>  hw/i2c/Kconfig                   |   4 +
>  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
>  hw/i2c/meson.build               |   1 +
>  hw/i2c/trace-events              |   5 +
>  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
>  6 files changed, 325 insertions(+)
>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 09642a6dcb..8d120a25d5 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -28,3 +28,7 @@ config IMX_I2C
>  config MPC_I2C
>      bool
>      select I2C
> +
> +config PCA954X
> +    bool
> +    select I2C

Do you have a circular dependency when also using:

       depends on I2C

?

> +static void pca954x_realize(DeviceState *dev, Error **errp)
> +{
> +    Pca954xState *s = PCA954X(dev);
> +    Pca954xClass *c = PCA954X_GET_CLASS(s);
> +    int i;
> +
> +    /* SMBus modules. Cannot fail. */
> +    for (i = 0; i < c->nchans; i++) {
> +        Object *obj = OBJECT(&s->channel[i]);
> +        sysbus_realize(SYS_BUS_DEVICE(obj), &error_abort);

No need to cast to Object:

           sysbus_realize(SYS_BUS_DEVICE(&s->channel[i]), &error_abort);

> +    }
> +}
