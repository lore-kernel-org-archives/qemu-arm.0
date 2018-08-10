Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2653936wru;
        Thu, 9 Aug 2018 22:06:01 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzy5gbkH87DHk5Am0rArWRtdLV+r/ZzI3asB7TVUYUAsih1EePllh7NkLa6ahlOB+whjdNt
X-Received: by 2002:ac8:1afc:: with SMTP id h57-v6mr4684200qtk.175.1533877560922;
        Thu, 09 Aug 2018 22:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533877560; cv=none;
        d=google.com; s=arc-20160816;
        b=WrrZFKR0bmcoCuSrXi6fgNk33GQRe81QH8WAiRG8GuFeUv0IbgkuSuquTGDb4NIpx4
         s70A0seFHAkXOAKkvENihVdvrUmJqLx/Grv6qVgFEjHE6Qi6gXtEMfQiSY+m64RYLfNc
         dElTpLGdPpDqbfMZSxp4nujpSBsa6+2r//jLs1tjo5OA5nnVPt4TSfzQqW6LGc8QOJ7W
         DGysB/hm6HTJYtjcBiwkuAjPApQl0nQfk6YO0RPz7Z6kDVHvdrDpwxLPunJjVv6GYbZ4
         lQClOyJAg/chPiU9b6nNLk0yhaVDnX1pjqBzaC0por8db1ngwe8rQEP9rub47GuapEgA
         JYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=00xZvms2hdJ5mAToPwjYqYoQ+XVSgpw41uYU82zuwXA=;
        b=TJdul/qtBa+pvPUVBFHE8GdVhVlOUABs+CZskkNRujY/ND4X3nFRoYV4v6WQLDos2/
         DQ33tM02nEAoStZ2QdXqQa94xIcQ3UFjCPv1hF+XOwAamtzvwKrK+GbyR8ua6y4+R8i8
         1AzClbLe+eDr9kpLjhUtjnaKScNitzvT09X/2iqHzMNGzZFxHgyuL2ncnS2ELNhqXpFC
         3/gEloUOkGn373hZktitBfGs6GV6WKBuzHs0IrNue+9AHYESbb+3T2VIvSpG4wXSSKZq
         MAz2YsIVjRt4yMY1XaJytzMksxD+Pw44VSfShVsErn+928tuCVri9BQFSApZQp8GLJej
         eemg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=axp1uBtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si596175qvb.280.2018.08.09.22.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=axp1uBtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzce-0005LB-1f
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:06:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzcU-0005JO-D3
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzcT-0003s7-6y
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:05:50 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:38034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzcN-0003nt-16; Fri, 10 Aug 2018 01:05:43 -0400
Received: by mail-ua1-x944.google.com with SMTP id o11-v6so645759uak.5;
	Thu, 09 Aug 2018 22:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=00xZvms2hdJ5mAToPwjYqYoQ+XVSgpw41uYU82zuwXA=;
	b=axp1uBtfbPsjXbVKWh8+tlc7udDDjwePfdLzDXS/cdcbTFYG7DzPyS1uhQSZQq9x/1
	OQHhUVt7HmAmg5MV+1q9NC477HK1EJuZXFekAsWntpmJoByIPNm9qFi6Luhr7pl4yp6B
	8h8uXyc0WMmOqA2WYfsgeWFMeSU3/vUcJT3sYzKFoorAAJPlXPfoSZ8XvwLN1znxV/nd
	2Gck5HMC9gKiyAq+0JW09AvQ6mvLc8gZ4RkMKLwtl9VTqlFB+peEzckaVM1DlBGnDnbR
	cY5ESwRGtZE/sQa4cVcL3LQj+POU2i0eWBjYRxST61arkQqnMiO36k7hrgDdEIZ7H57j
	087Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=00xZvms2hdJ5mAToPwjYqYoQ+XVSgpw41uYU82zuwXA=;
	b=n0KAYY80R8r2PUGeVtS8zXBjGHrDmmonE0t9jng0tQHp1fNGHk1wby2TZqASuevVHz
	CAn1kyXBSL4OkJaii/GahpKzGOiG3NvMK2abgwAvApW9baA0cGczotmiqwNu2pvlTQZh
	z9vb5d1JRYp+1Pe4I+XqeDoX1cvCvU1c1gFjyojSrbzQ3W8uL3YtbNehXMilmPKk3t6E
	dbL+zcd42B06lwNxwqHeysLtkTsdbcey51iPsNEmzo1q78LG1g4ZzufMUwudm8YHrc1n
	P6Wtrq88bljAbkHC7Ydd0CuOQ20rr+pnOqqiNcM7066yX7bVYl3Knybgz3FIPT7VGvAJ
	gn5g==
X-Gm-Message-State: AOUpUlFHvAK0R0Px6456mExOEg+dWc/8DvZywAzLWfCTaSB2G4GHnwCJ
	oWc/Frux68nBQHr2HgmGibE=
X-Received: by 2002:ab0:5a52:: with SMTP id
	m18-v6mr3293079uad.129.1533877542376; 
	Thu, 09 Aug 2018 22:05:42 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	c68-v6sm2570991vke.19.2018.08.09.22.05.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:05:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <11a99e21-64c3-403b-959f-b0d5ad8ebb2f@amsat.org>
Date: Fri, 10 Aug 2018 02:05:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH 02/16] nvic: Expose NMI line
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
X-TUID: 96ozzTm73yzd

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> On real v7M hardware, the NMI line is an externally visible signal
> that an SoC or board can toggle to assert an NMI. Expose it in
> our QEMU NVIC and armv7m container objects so that a board model
> can wire it up if it needs to.
> 
> In particular, the MPS2 watchdog is wired to NMI.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/armv7m.c       |  1 +
>  hw/intc/armv7m_nvic.c | 19 +++++++++++++++++++
>  hw/intc/trace-events  |  1 +
>  3 files changed, 21 insertions(+)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 6b076660574..66217a6053a 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -202,6 +202,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>       */
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, "NMI");
>  
>      /* Wire the NVIC up to the CPU */
>      sbd = SYS_BUS_DEVICE(&s->nvic);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index cd1e7f17299..be7771e9d1f 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -772,6 +772,24 @@ static void set_irq_level(void *opaque, int n, int level)
>      }
>  }
>  
> +/* callback when external NMI line is changed */
> +static void nvic_nmi_trigger(void *opaque, int n, int level)
> +{
> +    NVICState *s = opaque;
> +
> +    trace_nvic_set_nmi_level(level);
> +
> +    /*
> +     * The architecture doesn't specify whether NMI should share
> +     * the normal-interrupt behaviour of being resampled on
> +     * exception handler return. We choose not to, so just
> +     * set NMI pending here and don't track the current level.
> +     */
> +    if (level) {
> +        armv7m_nvic_set_pending(s, ARMV7M_EXCP_NMI, false);
> +    }
> +}
> +
>  static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>  {
>      ARMCPU *cpu = s->cpu;
> @@ -2310,6 +2328,7 @@ static void armv7m_nvic_instance_init(Object *obj)
>      qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
>      qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger",
>                              M_REG_NUM_BANKS);
> +    qdev_init_gpio_in_named(dev, nvic_nmi_trigger, "NMI", 1);
>  }
>  
>  static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 5fb18e65c97..33e932fb918 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -184,6 +184,7 @@ nvic_acknowledge_irq(int irq, int prio) "NVIC acknowledge IRQ: %d now active (pr
>  nvic_get_pending_irq_info(int irq, bool secure) "NVIC next IRQ %d: targets_secure: %d"
>  nvic_complete_irq(int irq, bool secure) "NVIC complete IRQ %d (secure %d)"
>  nvic_set_irq_level(int irq, int level) "NVIC external irq %d level set to %d"
> +nvic_set_nmi_level(int level) "NVIC external NMI level set to %d"
>  nvic_sysreg_read(uint64_t addr, uint32_t value, unsigned size) "NVIC sysreg read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
>  nvic_sysreg_write(uint64_t addr, uint32_t value, unsigned size) "NVIC sysreg write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
>  
> 
