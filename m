Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp171927lfm;
        Thu, 27 May 2021 02:30:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsCap540JcayJVDGPcysqrYDOxvjMIVDUaGT0jg/ro7cniO/dz5Pb3AWyowjjPwysb2nWn
X-Received: by 2002:a02:938f:: with SMTP id z15mr2559144jah.70.1622107805056;
        Thu, 27 May 2021 02:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622107805; cv=none;
        d=google.com; s=arc-20160816;
        b=KzpRWrgXGwXDKOrO814f2+5dZiN+y3FKqgQYtRIs0hGykHOjesyLC0ShoDwirFdaGR
         ec5pxOOjk6um42fsW1LsEhPy/xqHmNF5DrQ0XHC5fKQVKl8+BNnka9HAcWENgnpCCyle
         LlrywVYdviudvOxXseYnx9S6erLX9fHa337RCvRp3Ah881H22IhwX5bXOSbQcDVnIyn1
         GjTTRjNj96M7dLp/vwNZbPyeHZSJ5/queGUpa0KkdYuAP5e/LPrir7oAjn6BxHHuKiFt
         rLSwqK9OFKVd6l/k3Ls5umH3MSQgjq9VyXj4ACKFbiOTWNrrdQP3/T4H0E9EdRPahweo
         qXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nWmN5w38Znlhy7io4NXD5y3o7ggw3kzEE+t4RwhMjA8=;
        b=grNBTLHPcYH0b7vByyXwt7LHeNaKNIwkHqBc7bmqQ0ffi8j1rqWNTCwpfAGQhxLor8
         Hk6vaTwVR2IssRa63LaQ5qjfpIxVbbtbiQJN82y/7x8lCi56RIYmzTtLzoHXXzyJIjsT
         EEEZ2NNvOy4GSM+OYRi5EWY1Ahm+TeiEkqdFw0XgXmm9Dns2/inODkqK2YMEduMzY1az
         U9Znam9PebrZT/Gq5VK9oqu/UBfdsIyy09wM2/8YDy1q+3dI1LQ4+ZJ4dq5wyl67gANn
         zR0ix/a0UqmgXPPtxnHLn0w51Sim0Lmi9lii7/kp0qwDL6rdlGn/b+SnpnWIePpQWtax
         qo5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xWo72MhW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si2222578jat.22.2021.05.27.02.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 02:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xWo72MhW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmCL6-00048V-Ep
	for alex.bennee@linaro.org; Thu, 27 May 2021 05:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCKy-00047H-Nc
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:29:56 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCKx-00047I-AG
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:29:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y7so85816eda.2
 for <qemu-arm@nongnu.org>; Thu, 27 May 2021 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nWmN5w38Znlhy7io4NXD5y3o7ggw3kzEE+t4RwhMjA8=;
 b=xWo72MhW5FU402/i3e5AeOe+3Oee+IvuLjgs+uUNbrLrh6PgEyN5D5MJfjKwLeiGva
 WZqOZt5V92dhLqXuXDsedYd+ERkxOatBW/biyF3M1xoPA+fHmeA88J9h5DReHKQKbSta
 QRPmmgq9Cd4YHWJ8uDIvw0tswOsQm+BXZreqFuPDrz55k+TsLFx4f5HtX6v3XIxMwyNz
 AJp4QdDk5C1yT8+9TKUfR9jUTXIJ40ZDvKkHcFZi0bX7byVCLzbFDpeGHARvVpJ5K/ub
 tsODmegqNOrU8BDeD9nUVwv6tsWldfmFER9c7i62nr18EiYSWO6XAQVfZU4yvTmT6vVl
 9TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nWmN5w38Znlhy7io4NXD5y3o7ggw3kzEE+t4RwhMjA8=;
 b=IJpYrjT8EIu0Jyn9tjSGxUeWMG1gfAwvTna+r/s6pd3SujZFlS15T+szjQNujJlRcL
 rQcPA1MqhXSeuzfUvHeTvz9daHgf+3AeWIINf0Jt+WNMIpH6PVnLLjX1oVrm2/4Yjam6
 F/qz64GvtlS/F+H1FluKT+oUTd9w/ycNadJz5rNTeYHTILxh6X0PLxpHJGy1gUu1+Q7M
 yFRVX3OIyfkn2DHtJI9EkAWMU+HCfZNWFxrD70apyewRC79bd+de0H1xUf9+HG9XQTaJ
 ZFgvup2JpWQNaHDeEHok6JLQlsljXUTb+PCzDWMieD/fhrwLBbSL8VpcWX1V9qmBc374
 ls0Q==
X-Gm-Message-State: AOAM531xS5VIXsfAUPm8Y2oEZPwi0Z/Esedzsn7yzgsHnj0TCWd2M0G8
 rzhbRZu6j3YW0pt8RNf3v+Jlfb+JfrUJ8auKTaQxAQ==
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr3100734edb.100.1622107793913; 
 Thu, 27 May 2021 02:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210519200942.2223292-1-f4bug@amsat.org>
 <20210519200942.2223292-4-f4bug@amsat.org>
In-Reply-To: <20210519200942.2223292-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:29:28 +0100
Message-ID: <CAFEAcA8A6p57mmgCjMw+tDUuXYrxm8c1nyd-y4fuccSjmcdfdA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm/Kconfig: Add missing dependency IMX_USBPHY ->
 FSL_IMX6UL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ecJTamQL49c

On Wed, 19 May 2021 at 21:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We added IMX_USBPHY in commit 0701a5efa01 ("hw/usb: Add basic i.MX
> USB Phy support") and had the FSL_IMX6 machine select it, however
> this machine did not use the IMX_USBPHY until commit 49cd55789bb
> ("hw/arm/fsl-imx6: Wire up USB controllers"). Commit 17372bd812d
> ("hw/arm/fsl-imx6ul: Wire up USB controllers") added the similar
> dependency but forgot to select the Kconfig symbol. Do it now to
> solve when building using --without-default-devices:
>
>   $ qemu-system-arm -M mcimx6ul-evk
>   qemu-system-arm: missing object type 'imx.usbphy'
>   Aborted (core dumped)
>
> Fixes: 17372bd812d ("hw/arm/fsl-imx6ul: Wire up USB controllers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/Kconfig | 1 +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
