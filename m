Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4222371lfm;
        Tue, 23 Jun 2020 09:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi1PYx4xmQK1sRVa1/Xpei/aE//PNtZxpiygWy1tLP7xpFkh9QLCHQGmotFAJAuPE7zVBW
X-Received: by 2002:a25:75c6:: with SMTP id q189mr37085934ybc.501.1592929851988;
        Tue, 23 Jun 2020 09:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592929851; cv=none;
        d=google.com; s=arc-20160816;
        b=EY2vE3qFHXUaAebpfiG9bCTBkSa9+8f+71SP/eTqWibrJ7s86cY4O5xK6zfwc9PUI2
         v4QXJgACY1l6w9it23TREiVrnSiNEHV/xjUzU1hX6OOnqNyAh7CKrL92a0Us82qLMof8
         dU++0TbRFK4mazZLdO2WeJeVNjvBzKCbXy/qxsLtM3VAEdlzB5OFPMgKfxaW8dXpICZ8
         +amuAkn4YM2bBX8yGq5ee7c0ZRAWRmye1CuDU4RRkjh9n9fwWOADr4JjZ6y+1Ft4y4+7
         OMoSClzQ3cdNr2MFFkiK1fayq6wuP9ivCak47RT52dzcF50ZGTI1uyYROmmNKN96RKOh
         +YqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4MdvmBlCOD1q+E+aQO45jyj+IdzVQKgYnKAanEBNUMc=;
        b=zYGsk4uLEu5eeTYAVbHyeTuwKCa8fy0eTqCo0IBF9GM08Bwf4X8qgGMJ4SUU2if2Eh
         lsP9f2hqprXULjdOGtHp3KughTgjkw+8VL5ndNsdpBsN/4ACbeLicw9Rre4pQ9WW1iMV
         fI4myBuptghTEVewIl0nyCtIuPELuuWu88AOchX+u27pQoNYCbUugsGnpoXB7n8buM4V
         iKDX9uH4xbgkpnLiRqsBj0nryrdq3jMgG3tGmAGC9H5wHyxDIZR1MALIB0tOCdxUUJ4K
         NSwgTeOajTzHYcLI2SM9sktVs7lMEhAOgpuS6Yx3/cUrcJ7+KphufMzq3yUeLUURleYQ
         rTEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=WR+Z9TqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si16586425ybk.325.2020.06.23.09.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 09:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=WR+Z9TqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnlox-0004ou-Af
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 12:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1jnlom-0004n7-Vg
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 12:30:41 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1jnlok-0005qL-1Q
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 12:30:40 -0400
Received: by mail-ot1-x342.google.com with SMTP id n5so17252729otj.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=4MdvmBlCOD1q+E+aQO45jyj+IdzVQKgYnKAanEBNUMc=;
 b=WR+Z9TqKD6autEJYzBkeOsxy0p9LoOWALngfxl/pfSeLYX1fz8GfOKcOSOv0MVf0Uy
 o5OCV4h0jwXkev+1CMNeZ5Cv/lq8EgdbDtrJks+0cNNb0SNJfZDc9pxZihTPKgX/RDCW
 DBCNhlzkHlQuF5Z0Oo4vWVwbCbhMlxMDZ1cG92kzRLbPiWMAoZIy0Jl0mOOprd2vL77D
 TT/Aa53vuHeUrVxSEkce4q0FRoYPOo4kdyjMy9t3gGQiOYrRGBrmOmGALePVrLcLfy80
 NBuZFhP+6MGa8hdsoKqmV7qKYTuu8okCLb2ijsfI3mZFKJrQO+gndpRKQ91TpL5SwlnE
 87xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=4MdvmBlCOD1q+E+aQO45jyj+IdzVQKgYnKAanEBNUMc=;
 b=LxUeDb2Bdoaoa+c5b+AUVrPe8B8R0U3QF+Q1gGUh5o7pu31H1J+jpssj9S0hsPPWCn
 nAAabYjAilC+s2cjeyFcU94pUns7pS8WyLQQRn7Pf147XVCii/+ruduyvG9hFDagpmit
 buWEnHC5zXQsIfCRHG28CtZvb8XWA7qeDsQU/tCYIWwyXDH0oOvnq5M/qzTymVA9wiT3
 4zErJSHR50xcRKu8vyxZXqZ6xqLllvcoYLJOh56UAoTPTuJvzqX0zBJ+11h5K9kzI2F7
 4SewecQ0krxzHrcenFhX71g4i5bGeNKMMwWag8ljHFhDc4eXdpOKjcsMdje7unmoViBI
 rnrA==
X-Gm-Message-State: AOAM531gIobATccqj2F9iPtGh1OzthB2aAnc0ZoW2kdAC8it5o8Ad+fw
 6x1UiAtSCNNdGz5qoJX4ExSUqw==
X-Received: by 2002:a9d:1b6a:: with SMTP id l97mr17240814otl.325.1592929835108; 
 Tue, 23 Jun 2020 09:30:35 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:6d79:306:b4b0:35c1])
 by smtp.gmail.com with ESMTPSA id z7sm4144236oto.2.2020.06.23.09.30.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 09:30:34 -0700 (PDT)
Date: Tue, 23 Jun 2020 11:30:32 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 7/9] hw/arm/aspeed: Describe each PCA9552 device
Message-ID: <20200623163032.GE3258@minyard.net>
References: <20200623072723.6324-1-f4bug@amsat.org>
 <20200623072723.6324-8-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200623072723.6324-8-f4bug@amsat.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: permerror client-ip=2607:f8b0:4864:20::342;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x342.google.com
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
X-TUID: OP4RpLnMqmqk

On Tue, Jun 23, 2020 at 09:27:21AM +0200, Philippe Mathieu-Daudé wrote:
> We have 2 distinct PCA9552 devices. Set their description
> to distinguish them when looking at the trace events.
> 
> Description name taken from:
> https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml

I forgot to respond to this earlier.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/arm/aspeed.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ccf127b328..307dba5065 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -508,12 +508,15 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
>      uint8_t *eeprom_buf = g_malloc0(8 * 1024);
> +    DeviceState *dev;
>  
>      /* Bus 3: TODO bmp280@77 */
>      /* Bus 3: TODO max31785@52 */
>      /* Bus 3: TODO dps310@76 */
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PCA9552,
> -                     0x60);
> +    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
> +    qdev_prop_set_string(dev, "description", "pca1");
> +    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3),
> +                          &error_fatal);
>  
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423", 0x4c);
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423", 0x4c);
> @@ -528,8 +531,10 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>  
>      smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x51,
>                            eeprom_buf);
> -    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_PCA9552,
> -                     0x60);
> +    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
> +    qdev_prop_set_string(dev, "description", "pca0");
> +    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11),
> +                          &error_fatal);
>      /* Bus 11: TODO ucd90160@64 */
>  }
>  
> -- 
> 2.21.3
> 
