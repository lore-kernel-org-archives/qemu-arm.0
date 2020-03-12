Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp626208lfc;
        Thu, 12 Mar 2020 06:16:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtSuuJYK8USDoG4eOktnz3ExRiaIbNK6BshMoafheXLYLynpuV7yleUERmxRb1vlUWmH0Al
X-Received: by 2002:ad4:5651:: with SMTP id bl17mr7391852qvb.1.1584018984654;
        Thu, 12 Mar 2020 06:16:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584018984; cv=none;
        d=google.com; s=arc-20160816;
        b=h81d4IiXJsuOVEY4QmdlDrDpxjuOWy46vj4dEza54M4TPI7wPxZvx9VU8YEwh55t2U
         a5nMV3a1FO0PTG9c4BByx128ocx7rQv9AtOIbuSPqK7a4picCp146IRBTBpu1W/DRb6i
         bRHFwHzLkogjjBURPdpWfmz34Y+QZ7NCiRvaYHDkM2wy0j1l1QS1ykjnt4bgDir79W3E
         7TPR1I2QOcv3ExxeeL7dTGIZT9iR9PBdJOgQjQsPrbqffRLFUXumm3fJtH202E32II32
         9Rick5D4zNH6TwLqmJUFQaGBap2IZeOj3AdPFA1AMHqJs1MHxvTDtYqJqf5tktIQyeJi
         Enrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0dnyT0V5hNHVjGHyHBwPkekbDHXrX1zyrjIt9zRZphk=;
        b=oxvaKYjANBoMsZKmDp8ljMF3QuLdcV1/egq+tr5/6FPLTSPkdTr2PQLdJamVPmxNzi
         KxIGDi77lYb9j3tHrCzjlW5MX5r1qE4KB7zp8vxWME6WWA7gpTfhU7PAzps1rOqONLcS
         noCW4WSB/gEpuz3N0FKVz1TMqNCofZzoRq1qmkQumCIZ5g3faF8zVEb7NR9G5AkEzly/
         LwDh8XBaVhrhDTAgXX7xQGVeEfd/j8Z6r2JO1xEcKwo+0UJ6GMu9eJLrabUorQ0PJast
         kkJ/8TUDomhIaFTjTMkAPDXv55QnmURgFa8DlaFyQOZJY6/oAjS93LbvDRi6iJnRDTPk
         U3Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rSNWDg+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k79si2789990qke.143.2020.03.12.06.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 06:16:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rSNWDg+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCNhI-0004Dz-1m
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 09:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCNh9-0004De-Bf
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCNh8-0001mB-5j
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:16:15 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45627)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCNh7-0001jj-WB
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:16:14 -0400
Received: by mail-oi1-x244.google.com with SMTP id v19so5384454oic.12
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0dnyT0V5hNHVjGHyHBwPkekbDHXrX1zyrjIt9zRZphk=;
 b=rSNWDg+G7SdGpW6ZqxT1YM45aQ3PDQWCdjgNr8IaweyMfeebuL80CHwJrSa+0oeraE
 lksIUgw81oTMbMduPAvYW1DStpO1/YHsiE0+2MbfoFI1Y+QxzPi+yYrUgqKHRGOzOLba
 GmZYK48553W+Vz5iz9AYwfuJCKQOkj5+beg8DdRG76VQ2R6FGsEWqZHj6f7LeTJeXbKS
 AxGBmKpxY7rufSCH9Y2kgnMjaFR2smIi0H8b4z9jO3w+jyCLUfGKVae8k8S+tjfygQwp
 fF0HXWM0DC+z7GXUwfdCowfwypdbQEY3RHg6lOFZWvBeoaIjOU2sXWwO4H+if0rmQ2R+
 5wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0dnyT0V5hNHVjGHyHBwPkekbDHXrX1zyrjIt9zRZphk=;
 b=jNdr/MQ88b7y+GYsGCF7UYH9BuqKaiq/o/ajaskhg3uVjsvp69wtLUhxME1iiIvXt3
 dg1KnhZzQI1f1WI3hDHmFyYYQlhymdigaqPs3Jbjh1bU4XQYiQWwLkMTQoKM6UlmNSWk
 qmE4C896BgXCu7Bw1ViSez5DH8zizUF0DCoOasp1wG40AwfV+sagboJjE+s9MhABi8Lb
 ovUePxRmutDSmsvtBGmGDxvg+jb9C34J0Zz4ZBDSbyJagewrLcBSxrtoU7LR8p3BQmqd
 KbiCGQn93Hjd4Q1VxeMaD9HDarIjVXMllBBqutsHmJ0umjEdyf8vpxZWdpJzk7PHd+Kt
 Y+tQ==
X-Gm-Message-State: ANhLgQ2ixcdPao4ATEcB0h5xd0XkKBGe7cuMx36kk3+wVShuGCK2A4Az
 seduCwdClJImuJCeRH48rYuOMq3ndGLaDc4/WAqyrQ==
X-Received: by 2002:aca:5b07:: with SMTP id p7mr2447363oib.146.1584018972888; 
 Thu, 12 Mar 2020 06:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-2-linux@roeck-us.net>
In-Reply-To: <20200310210434.31544-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 13:16:01 +0000
Message-ID: <CAFEAcA_B5zjyV0xknaffcGbqELjTUUDEg7OG_wh+21r-Ya29Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/usb: Add basic i.MX USB Phy support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eIlY0bcFMnxV

On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> and i.MX7 SoCs.
>
> The only support really needed - at least to boot Linux - is support
> for soft reset, which needs to reset various registers to their initial
> value. Otherwise, just record register values.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: New patch, replacing dummy STMP register support with basic USB PHY
>     emulation.
>
>  hw/arm/Kconfig               |   1 +
>  hw/usb/Kconfig               |   5 +
>  hw/usb/Makefile.objs         |   2 +
>  hw/usb/imx-usb-phy.c         | 225 +++++++++++++++++++++++++++++++++++
>  include/hw/usb/imx-usb-phy.h |  53 +++++++++
>  5 files changed, 286 insertions(+)
>  create mode 100644 hw/usb/imx-usb-phy.c
>  create mode 100644 include/hw/usb/imx-usb-phy.h


> +        /*
> +         * All REG_NAME_SET register access are in fact targeting the
> +         * the REG_NAME register.
> +         */

All these comments have a duplicate word: "the the".

You should add the new files to MAINTAINERS:

diff --git a/MAINTAINERS b/MAINTAINERS
index 857f969aa1f..4e42187aafb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -748,6 +748,8 @@ F: hw/arm/sabrelite.c
 F: hw/arm/fsl-imx6.c
 F: hw/misc/imx6_*.c
 F: hw/ssi/imx_spi.c
+F: hw/usb/imx-usb-phy.c
+F: include/hw/usb/imx-usb-phy.h
 F: include/hw/arm/fsl-imx6.h
 F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
