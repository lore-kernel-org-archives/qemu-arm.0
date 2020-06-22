Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3522495lfm;
        Mon, 22 Jun 2020 13:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdgxgcH1St1hdBECGaKLl1bfyfY/fhn8xMN6BFw1vsCbFGaFZhqQ2E6+4WoJL1TBDQ14G0
X-Received: by 2002:a5b:648:: with SMTP id o8mr29853314ybq.511.1592858777308;
        Mon, 22 Jun 2020 13:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592858777; cv=none;
        d=google.com; s=arc-20160816;
        b=zbQ6l2FSahnjiRoeC5I6nBJhnKb52jC36hUcP3hL+Yw/Dd/EtreTXrUlmx7EEf04wU
         vQrtUMgVrpKVXbmGpARUxUda7A+cwbZLzaq1EyPR2f0D/0n4uq6rOIzbfH6sK1LqP+28
         Sz/aSFGcsKRnFVj/RxXkn05lV1VAbTPeM0nrMFO7d4QaGFvlTEaJWqFbhMOmLIb0sBPI
         iItXQVXEPFF3r6PmyFiaB5X9bVNaGp/akeBZq6NrTbIKc0TsZv3F11uBAEcfRi2ud81z
         VtwcwYoFvbdLcL8YI3SlWBYzhZNYkgju654c4/ZDm/z//7ZHViRCgQ+oZGe1ddocjtrI
         bP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xjlab+khnqG5kK8RlhsVJgH9kcSuAhCvWwUM+tLTgQA=;
        b=DT24RwwnvvHfjOpvWA8kaSd+IBB+zuBZeJLyQ0NLSLPWndINM4TB5wqVh7wgdBRoy9
         r+xL0aqfGLbRFou0S2wHkm+fa2kmsi7CIhmIOtU8alLtTtYkuEmrXaEye6JZOLFgGUNx
         BjOhlGO9/ziyVO6YdtVGiczIq/9Nez3k/MYwOPse2QuE1EIvgfybk9YHiqeW2rOfyZkK
         T3ZvumUVAYNiZTV9fJVTmXEbR/yy6hSTy7+f7/7hLe/GM7PSWWqFVnQ2dyrBHc11p9ep
         es4fgCyE8UsmVCLOTVqkKGWWLmPptwOeZCGWLp0JubY49LPwKeTWrL42HBWdLwuowiq2
         FAZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=mgxZYelu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si13724195ybn.76.2020.06.22.13.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 13:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=mgxZYelu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnTKa-00061n-O9
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 16:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1jnTKT-00061M-3r
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 16:46:09 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1jnTKP-00010P-VX
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 16:46:08 -0400
Received: by mail-ot1-x341.google.com with SMTP id m2so14297528otr.12
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=xjlab+khnqG5kK8RlhsVJgH9kcSuAhCvWwUM+tLTgQA=;
 b=mgxZYelu1CM6JChzpoe7gj3jAgIyMnYiXq/LdxlUWT4uq0ZhopIF4Uuw+YmWlr6VS6
 UG68DD0ZR8RL0IQRRM0SJmWZuv22q8IjNWIv7bH9WGOSsHykHJbSRRtNXIYH/15VrbtA
 Uqcf6cfPm89etwlDb6ivUVthWKw5mgM63kcuMUq0fBupEtGZBclHhaDsgIDH4Dw1BOw4
 WP4+glG7+1Cg8WEuYRQcQSVAAygiunNOedsIzc4Q3xXoISc01z4ko5PWt8d5VRrysfqn
 4gUBr//1S1hFxPEg6qFXQeKgfNVcJlP9+vQ7kTwnVJIwTqQmCHKter7KGIGBJ2JF6iyq
 lo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=xjlab+khnqG5kK8RlhsVJgH9kcSuAhCvWwUM+tLTgQA=;
 b=jcCqi/HFmOfr4XgeOWDY6D+RuvjTDpury0EmemZVPZClU5RPhNOpA6clDbrSzqUt85
 Yc5bzavmQu5raAUVHxQ7C8VnHxSWQH+/AuURAhfESL3JVP1mw/U3LxIFdDZ5ftyHNHhO
 i04c7UPHyKGFW8lJBMXVP02O7IQn2x7dnPhNpkqoYIrYocVvA8PUCNnpn9iq4andqZUn
 wCr0NfDGZe3uhW4PymW7GXTcJrB7s9mazQtzEwVtiXAjuEHKXEj4KRTzTkOIj/NYR1Zs
 t/Ax+FVtHTaJMkSOMtffLFHo9N8M5G2fs7fI5BcI6AUMkDHEwDUnn1irKUtjJdFSwZ/+
 +d8g==
X-Gm-Message-State: AOAM5324LQn4nzMe2C6l8fHhtLX9mvtiFzNjVh9G1CxQs2iO/pC+AqUD
 eqDTISgj5sDBkGtiuJSxLUM97g==
X-Received: by 2002:a4a:3744:: with SMTP id r65mr3228265oor.82.1592858762985; 
 Mon, 22 Jun 2020 13:46:02 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:acca:171:3424:849f])
 by smtp.gmail.com with ESMTPSA id w10sm3677221oon.40.2020.06.22.13.46.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jun 2020 13:46:02 -0700 (PDT)
Date: Mon, 22 Jun 2020 15:46:01 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
Message-ID: <20200622204601.GA3258@minyard.net>
References: <20200622183428.12255-1-f4bug@amsat.org>
 <20200622183428.12255-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200622183428.12255-2-f4bug@amsat.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: permerror client-ip=2607:f8b0:4864:20::341;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Reply-To: cminyard@mvista.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LRlYgS/PAM6F

On Mon, Jun 22, 2020 at 08:34:20PM +0200, Philippe Mathieu-Daudé wrote:
> Extract i2c_try_create_slave() and i2c_realize_and_unref()
> from i2c_create_slave().
> We can now set properties on a I2CSlave before it is realized.
> 
> This is in line with the recent qdev/QOM changes merged
> in commit 6675a653d2e.

This seems consistent with outher things and looks proper.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  include/hw/i2c/i2c.h |  2 ++
>  hw/i2c/core.c        | 18 ++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 4117211565..d6e3d85faf 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,6 +80,8 @@ int i2c_send(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
>  
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
>  
>  /* lm832x.c */
>  void lm832x_key_event(DeviceState *dev, int key, int state);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 1aac457a2a..acf34a12d6 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -267,13 +267,27 @@ const VMStateDescription vmstate_i2c_slave = {
>      }
>  };
>  
> -DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
>  {
>      DeviceState *dev;
>  
>      dev = qdev_new(name);
>      qdev_prop_set_uint8(dev, "address", addr);
> -    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
> +    return dev;
> +}
> +
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> +{
> +    return qdev_realize_and_unref(dev, &bus->qbus, errp);
> +}
> +
> +DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> +{
> +    DeviceState *dev;
> +
> +    dev = i2c_try_create_slave(name, addr);
> +    i2c_realize_and_unref(dev, bus, &error_fatal);
> +
>      return dev;
>  }
>  
> -- 
> 2.21.3
> 
