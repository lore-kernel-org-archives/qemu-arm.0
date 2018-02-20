Received: by 10.28.71.27 with SMTP id u27csp1397078wma;
        Tue, 20 Feb 2018 10:26:26 -0800 (PST)
X-Google-Smtp-Source: AH8x224yXMy/XKWvz4u4xjjgScs/HdTMX4TTHXxJR1wLc0v18OkFQk4g2n1ipzZUUf/x6d5wnZ1B
X-Received: by 10.129.147.67 with SMTP id k64mr511172ywg.46.1519151186183;
        Tue, 20 Feb 2018 10:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519151186; cv=none;
        d=google.com; s=arc-20160816;
        b=QbFhPi8UGiPJDNe/fNR4pTasIJO3GYwBV8UyOUupMJ1feXy4sHfmlv5FdubTu+IR8f
         BzEPNjl11/h0sARvO+s+Q69fDDZDkh3F56S/yCqDMOPX3ITd/ZogZED8hApO07pJDQUj
         7Vclm5bA9pHtKLSys/YB6rapEmKbsy7nwzbQLeqHGYj6m2AdeRmjJmjlUmOv9WxoNcs+
         KPha9K6lUXojc6QQFlaSjXbHk5qE3EfDoO043rTogBSHOY1I98GiToX9omsiqeF6FSnq
         nucuU95KAaVLqgxnfGOYubrasMhgDAsYWzjPD0zTAvngYybo5cpZZx4gX6mgzmqj/lkL
         O1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=kdA30CybV3bxpU+J3xFPW01fGYXKs4HFGxEAmuO+8Vk=;
        b=SQlhsQjfMJ/lvbJvaZuwvQig24NTGXTzgf98QRxEjAZrjgk92yxmTRFpc3YE+YrqTv
         xNra12RWJnYZEMyeIWhhqgcvYWEHnywW87LX2o2a3rgC/+IdaSNZhIfLfEWq5gv8l2pg
         f1a7MILMwPGPFFf3E6rm1QcswzJIE4pFs0YFKDTaAsx6OqevTubiFd/BJngtW6D9xdm8
         Kr1yfFtaAdsadcN4Ib6eTaA3SuZQ2QT/LrLGg5cHYEeW+PgnI+edoSTC20qWawmsZZr7
         pq5rG7YWTw1JQVjFsfug7k+O6Ej4Cbwca464DRQeGY0zbsJ9uhYQAMeRTfVA2WZgzRBg
         M8+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=urHKYVny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si393472ywb.202.2018.02.20.10.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=urHKYVny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCcT-00039r-GR
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:26:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCcF-00037P-Lz
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCcE-0007zV-LM
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:26:11 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCc9-0007vk-Si; Tue, 20 Feb 2018 13:26:06 -0500
Received: by mail-wr0-x244.google.com with SMTP id u15so17145298wrg.3;
	Tue, 20 Feb 2018 10:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kdA30CybV3bxpU+J3xFPW01fGYXKs4HFGxEAmuO+8Vk=;
	b=urHKYVnyw7rvQ+nlkVg9Rcjt9goAsLhnoGbZGqZAyNtaIvRI/MC6QK+zMdXv8EIFAO
	zkqaA38ZuO4D5dD7yIeUqR2ccR9vlFuQa+UXPHoIPfygmt6xD6h7dQwFM7ZbV9saQavZ
	UxvKwAqUTHzXbnQNvCx6VHsn+SbDS2MljxJBn1JLz8bmaHdoRhx48UTeDUNzWmzICS7+
	AhxfIoNhdzC6x0kEMXFfuW7a3RdBZ/przbIUSOvYrMxoQPTQpMvE+0IylVsKOGoO4yw4
	Va24g0yZg3/9wGPX04vfrceiQrwhjpratnb/Eg178/4b1NpZ7Bq7StjK/N/8LwP3oZkn
	ei8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=kdA30CybV3bxpU+J3xFPW01fGYXKs4HFGxEAmuO+8Vk=;
	b=bhMb2wex0KXPaW8aYR1L73u2todKGcLCBRobavuvph+Yj+YcUs7L2/43rAv8i2dSvl
	vPFs4weyIxj391RfJMRBH39/DA/ndnnNm8QWC+YzQa4xYh/zTWPyHGmsMaGEPbkEtiBa
	aO3HNoQ2DIPcsB8nt4b5MSuCxVlOHhmNngZYOClClF1J+9JTqa98fsd97eQOBVGNU52i
	ZBYJXcDUf8IIJKcMBbssPoZ6077M5VvpgEeXBgjPRLWZDdKBFrhNGogJPuI2RChh54lP
	mrPLHsnbw4ycH8XWj8DFSLgRAajBIIHeQzQGSUH5ktZNHBP43EQ47zii6kyGD8Anb1Qp
	dEtA==
X-Gm-Message-State: APf1xPBRZ1XspeDt9MWlcp6+vxt6ODD7LvwIpwzoF3zMpuVK4iB55jH1
	qhqHsRcgwOcQcLnGHtJPKTyKpgBq
X-Received: by 10.223.152.83 with SMTP id v77mr511490wrb.70.1519151164837;
	Tue, 20 Feb 2018 10:26:04 -0800 (PST)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	y8sm10804287wrg.16.2018.02.20.10.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 10:26:04 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b673b8c2-9eed-9d2c-196b-8782bfa8edb0@amsat.org>
Date: Tue, 20 Feb 2018 15:26:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [PATCH 11/19] qdev: Add new
 qdev_init_gpio_in_named_with_opaque()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y0Z/DEEcbvp7

On 02/20/2018 03:03 PM, Peter Maydell wrote:
> The function qdev_init_gpio_in_named() passes the DeviceState pointer
> as the opaque data pointor for the irq handler function.  Usually
> this is what you want, but in some cases it would be helpful to use
> some other data pointer.
> 
> Add a new function qdev_init_gpio_in_named_with_opaque() which allows
> the caller to specify the data pointer they want.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/qdev-core.h | 30 ++++++++++++++++++++++++++++--
>  hw/core/qdev.c         |  8 +++++---
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index fc9d617a76..9453588160 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -311,10 +311,36 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
>  /* GPIO inputs also double as IRQ sinks.  */
>  void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
>  void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
> -void qdev_init_gpio_in_named(DeviceState *dev, qemu_irq_handler handler,
> -                             const char *name, int n);
>  void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
>                                const char *name, int n);
> +/**
> + * qdev_init_gpio_in_named_with_opaque: create an array of input GPIO lines
> + *   for the specified device
> + *
> + * @dev: Device to create input GPIOs for
> + * @handler: Function to call when GPIO line value is set
> + * @opaque: Opaque data pointer to pass to @handler
> + * @name: Name of the GPIO input (must be unique for this device)
> + * @n: Number of GPIO lines in this input set
> + */
> +void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
> +                                         qemu_irq_handler handler,
> +                                         void *opaque,
> +                                         const char *name, int n);
> +
> +/**
> + * qdev_init_gpio_in_named: create an array of input GPIO lines
> + *   for the specified device
> + *
> + * Like qdev_init_gpio_in_named_with_opaque(), but the opaque pointer
> + * passed to the handler is @dev (which is the most commonly desired behaviour).
> + */
> +static inline void qdev_init_gpio_in_named(DeviceState *dev,
> +                                           qemu_irq_handler handler,
> +                                           const char *name, int n)
> +{
> +    qdev_init_gpio_in_named_with_opaque(dev, handler, dev, name, n);
> +}
>  
>  void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
>                       const char *name);
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 7ed1f431f0..f3754ee606 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -385,15 +385,17 @@ static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
>      return ngl;
>  }
>  
> -void qdev_init_gpio_in_named(DeviceState *dev, qemu_irq_handler handler,
> -                             const char *name, int n)
> +void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
> +                                         qemu_irq_handler handler,
> +                                         void *opaque,
> +                                         const char *name, int n)
>  {
>      int i;
>      NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
>  
>      assert(gpio_list->num_out == 0 || !name);
>      gpio_list->in = qemu_extend_irqs(gpio_list->in, gpio_list->num_in, handler,
> -                                     dev, n);
> +                                     opaque, n);
>  
>      if (!name) {
>          name = "unnamed-gpio-in";
> 
