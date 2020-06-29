Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3357439lfm;
        Mon, 29 Jun 2020 14:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz59/irZvntbD1HQKi7fVLsGzRd7zYFERg+FrV9svyxovkdiVh6z8vqw9g/rwi16y8E+kX
X-Received: by 2002:a25:7811:: with SMTP id t17mr27255990ybc.508.1593466192042;
        Mon, 29 Jun 2020 14:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593466192; cv=none;
        d=google.com; s=arc-20160816;
        b=K9ThPMbu7uzeaJ59pjXxhnwz1Kk0YcqIt2z7ZGH4UWA/rA84oPkpsqQLNnzN+A99lf
         ProN9mrA9TT5uyNQwiYE/pjIXRPQl5YT82At/aDdmy/KuX0csOGcavClq39jciGRM5zW
         xzuMCNwlkBQHxKG00guRGkfm4Kb+VHuNGoI6y9mtKQ/bPngydM3yZ4U2pCja73xB+WI/
         nc6tZUnkizvun7Q4KlRP1KA55gr3P+LVlwSw8ni0lVd2pSMuZxRm7o0flxDOZPq1CuZB
         KYka7czu8y+fuSemXWLe8xNo4Uh1WNYFRrWsmqFLjVJUze0cvIT3gjycrLnjzJOhlIoa
         /EmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OB9q+hhY+jTbvys8ZF1UPkCVvSQdNiVrK4Mm5Ab4Dlk=;
        b=FLiFBlRicyXb/x63ADgAOMCCUdmnnGaaYrs+IL8Dems+TjI6VSp2C0eT2YMi16x6yR
         t6xnhW7CTPJvPoesQEBG3BVEFFgkWNowPvIce/fObfuVWFzM40mPPmYdG8BnxO/nZbHR
         7199JugobY/BrnUhQGBtdc/ZLcXX4kw4fKPm/HMl4nBZQfF9ytksYmkniDGbGCTlqG4d
         s7U6sCDaOd8qPAyJfSSU+0RMk48OeO0i2/vK5OKl9OBzm0hzqzaSDq4I/WO0xFPBJXly
         ibe42aA+68Wiah9s/58tQ06H0OPe1QEjXlaNChsSNtb2p5Dj3wW6TuV5Nd9IMfyUeEuG
         rEGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qIGxe6Hd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si809898ybi.108.2020.06.29.14.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 14:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qIGxe6Hd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jq1Lb-0002cY-BM
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 17:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1jq1LR-0002a8-BY; Mon, 29 Jun 2020 17:29:41 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1jq1LP-0004rH-M9; Mon, 29 Jun 2020 17:29:41 -0400
Received: by mail-ot1-x342.google.com with SMTP id 5so14790294oty.11;
 Mon, 29 Jun 2020 14:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OB9q+hhY+jTbvys8ZF1UPkCVvSQdNiVrK4Mm5Ab4Dlk=;
 b=qIGxe6Hd0cS96yTh282TMcngjW7WP21xVJJqxtWip/cAHujTvexUHeE0RPCoYWY+l9
 SqErCWMdvve6uDzRAi6rOJMdj1mvRdVVNKLBvLwHVeHIjAc7IcIdVqm8M5js4XxStWFJ
 uhH/t7kIvhjGeR+h9dpkqW3QKPIH59IRv7Ti889D7jRQEbqTORsoMREkS8X3/aNMGIY/
 hdeKzBC0tXG2EP2FYsWSW7CIkttTpHTWDteKyqzbYMuHhFUbszQzhTv0T1gsjClNR27P
 hF5jjwFNew957hTUyri9DN9x8ODAhPeJBGjI1G+ywGMLEm3nPGjBez9grimXN7TrERUu
 jPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=OB9q+hhY+jTbvys8ZF1UPkCVvSQdNiVrK4Mm5Ab4Dlk=;
 b=eVsOQnuWpU6BRwrgDfEudzECK8ZHoHoO2+p6ctDM8ksl8lAGkpo2USgzObGwpI/tJW
 yk/bKGUCznuAxx1fPyHDJ/izaEt+Tkzck2DNuTQ1juyQoKLVDobaeBGMVblb+ePxZv16
 AE0Lt9uojGgauDHc5oBfrJbjAktlc/F7PvlrK3XmIcD+CepD8IpWT4mpxfuFDfpf0ek1
 Lvme4m982ElR0i0SFEPgkzvw0Q5dAj0lgjNKpMeOqJ84Ek3jVcb6MwXrURcoMI7Ej+DM
 FHpYMFwemavTwnFbl1/rRm/hs0GsmklhboEGr8kpNgU3h90Qreks6Jnnspy3FXSAtX5A
 szWw==
X-Gm-Message-State: AOAM533zxJDydKyGHT6eOFS/mHv+cwTn4mFc2XfJD5gkGER+tH5DaKh9
 0s6fXkojwk/Zp25o4JFhog==
X-Received: by 2002:a9d:73c9:: with SMTP id m9mr5854491otk.94.1593466177753;
 Mon, 29 Jun 2020 14:29:37 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id m84sm214760oif.32.2020.06.29.14.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 14:29:37 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:9993:aaf8:7c5:309c])
 by serve.minyard.net (Postfix) with ESMTPSA id 6566E18003B;
 Mon, 29 Jun 2020 21:29:36 +0000 (UTC)
Date: Mon, 29 Jun 2020 16:29:35 -0500
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/5] hw/i2c: Rename i2c_realize_and_unref() as
 i2c_slave_realize_and_unref()
Message-ID: <20200629212935.GS3235@minyard.net>
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200629173821.22037-4-f4bug@amsat.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2XSjHq75jU+F

On Mon, Jun 29, 2020 at 07:38:19PM +0200, Philippe Mathieu-Daudé wrote:
> The other i2c functions are called i2c_slave_FOO(). Rename as
> i2c_slave_realize_and_unref() to be consistent.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/i2c/i2c.h |  2 +-
>  hw/arm/aspeed.c      | 10 ++++++----
>  hw/i2c/core.c        |  6 +++---
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 18efc668f1..cb7211f027 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -81,7 +81,7 @@ uint8_t i2c_recv(I2CBus *bus);
>  
>  I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
> -bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
> +bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
>  
>  /* lm832x.c */
>  void lm832x_key_event(DeviceState *dev, int key, int state);
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 54ca36e0b6..ed14e79f57 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -515,8 +515,9 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>      /* Bus 3: TODO dps310@76 */
>      dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>      qdev_prop_set_string(dev, "description", "pca1");
> -    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 3),
> -                          &error_fatal);
> +    i2c_slave_realize_and_unref(I2C_SLAVE(dev),
> +                                aspeed_i2c_get_bus(&soc->i2c, 3),
> +                                &error_fatal);
>  
>      i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
>      i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
> @@ -533,8 +534,9 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>                            eeprom_buf);
>      dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>      qdev_prop_set_string(dev, "description", "pca0");
> -    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 11),
> -                          &error_fatal);
> +    i2c_slave_realize_and_unref(I2C_SLAVE(dev),
> +                                aspeed_i2c_get_bus(&soc->i2c, 11),
> +                                &error_fatal);
>      /* Bus 11: TODO ucd90160@64 */
>  }
>  
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 6eacb4a463..135ea56036 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -276,16 +276,16 @@ I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
>      return I2C_SLAVE(dev);
>  }
>  
> -bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> +bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp)
>  {
> -    return qdev_realize_and_unref(dev, &bus->qbus, errp);
> +    return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
>  }
>  
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
>  {
>      DeviceState *dev = DEVICE(i2c_slave_new(name, addr));
>  
> -    i2c_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
> +    i2c_slave_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
>  
>      return dev;
>  }
> -- 
> 2.21.3
> 
> 
