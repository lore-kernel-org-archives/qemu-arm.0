Received: by 10.25.159.131 with SMTP id i125csp616711lfe;
        Wed, 30 Nov 2016 19:14:25 -0800 (PST)
X-Received: by 10.55.72.86 with SMTP id v83mr31293154qka.262.1480562065128;
        Wed, 30 Nov 2016 19:14:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a4si39333389qkd.7.2016.11.30.19.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 19:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ozlabs-ru.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCHpI-0003CY-J0
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 22:14:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCHon-0003CO-F8
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 22:13:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1cCHoi-0001s9-IF
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 22:13:53 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1cCHoi-0001ro-CH
	for qemu-devel@nongnu.org; Wed, 30 Nov 2016 22:13:48 -0500
Received: by mail-pf0-x241.google.com with SMTP id c4so11060804pfb.3
	for <qemu-devel@nongnu.org>; Wed, 30 Nov 2016 19:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=s82CTLf5gHchzELN3GkjXz2Fc7S1ZX4o3j9ltJ49fcA=;
	b=htRbrKLwrGGYhaPShxSQBgjSt3wSPWVDZqtoDE4NBMybdituEIvgrcSMsjiFNMySzt
	Lf3IkuWNr3Oh09xoxh/h5Wf++Fz/pXjtk5GrrvqPMkH/TXVzIKrV3tZ8hMJHtTmo5P/4
	U1Zv81T1LvrT9H4Sy5IljpZiRkb/jPcuu8fpdYne7f6Nlmh3d+4MmYogf1ocROpSWxDS
	m6QrN3mZcrrpNVMSwsqmZBfJ8f3eoOGgVvjtOtyhk1YRyqBGII1B100PWagbUyCAcB4r
	qc5lJsbgCcZCF9tfowiCuTq+fMXiirdMKjXR0uHnGQNihDaV60C3IGM6oexXg9TL9HAM
	/ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=s82CTLf5gHchzELN3GkjXz2Fc7S1ZX4o3j9ltJ49fcA=;
	b=Zw1nYdhKxQMNcI44L0NKdNiD/ahwmr1rw1Mqd76zhPDDCLdY/XLWcLKJx6IxfaW6a9
	XnjfToP3mSXZ5+h/taAscL6JEe2cnPrDu91/t9NWzeLkw3sr4rZuvRRhUxJ75yi1KrNk
	7zEHqVXDN/FqsArltGnSwGnq8Wq442bgwxqUFFk+hoHaBJDvMbWuMHrpeGE583s8rqGY
	sB8wPmVb/sIsK1VBnSD1dFRc1iBVnE4Vt/ckbqLVHVSRub0m355EZsUzaYrRHyv3IprH
	h1AwOC2g5HYlKUuuvR+U645Dx1Jdjqb7UmGnTOSovLR8UXbw6SQ8eIy+W1Q9SA3weOQm
	Ka+A==
X-Gm-Message-State: AKaTC0166cX+dvBhBGOHAm2ybRD+2hG+lopPMtLGCuMrBiZw88bGPVthzmoMatBjv2D2LQ==
X-Received: by 10.99.114.2 with SMTP id n2mr65185476pgc.130.1480562027421;
	Wed, 30 Nov 2016 19:13:47 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	p1sm51074649pgc.29.2016.11.30.19.13.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 19:13:46 -0800 (PST)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-3-alastair@au1.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <5b170e3d-ba83-da06-a4b5-fa45600be1c6@ozlabs.ru>
Date: Thu, 1 Dec 2016 14:13:41 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161130053629.23340-3-alastair@au1.ibm.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-devel] [PATCH v2 2/6] hw/i2c: Add a NULL check for i2c
 slave init callbacks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Alastair D'Silva <alastair@d-silva.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BjZPBDEyl094

On 30/11/16 16:36, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Add a NULL check for i2c slave init callbacks, so that we no longer
> need to implement empty init functions.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/pxa2xx.c   | 9 +--------
>  hw/arm/tosa.c     | 7 -------
>  hw/arm/z2.c       | 7 -------
>  hw/i2c/core.c     | 6 +++++-
>  hw/timer/ds1338.c | 6 ------
>  5 files changed, 6 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 21ea1d6..bdcf6bc 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -1449,17 +1449,10 @@ static const VMStateDescription vmstate_pxa2xx_i2c = {
>      }
>  };
>  
> -static int pxa2xx_i2c_slave_init(I2CSlave *i2c)
> -{
> -    /* Nothing to do.  */
> -    return 0;
> -}
> -
>  static void pxa2xx_i2c_slave_class_init(ObjectClass *klass, void *data)
>  {
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> -    k->init = pxa2xx_i2c_slave_init;
>      k->event = pxa2xx_i2c_event;
>      k->recv = pxa2xx_i2c_rx;
>      k->send = pxa2xx_i2c_tx;
> @@ -2070,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
>      }
>      if (!revision)
>          revision = "pxa270";
> -    
> +

Unrelated change.


>      s->cpu = cpu_arm_init(revision);
>      if (s->cpu == NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index 1ee12f4..39d9dbb 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -202,12 +202,6 @@ static int tosa_dac_recv(I2CSlave *s)
>      return -1;
>  }
>  
> -static int tosa_dac_init(I2CSlave *i2c)
> -{
> -    /* Nothing to do.  */
> -    return 0;
> -}
> -
>  static void tosa_tg_init(PXA2xxState *cpu)
>  {
>      I2CBus *bus = pxa2xx_i2c_bus(cpu->i2c[0]);
> @@ -275,7 +269,6 @@ static void tosa_dac_class_init(ObjectClass *klass, void *data)
>  {
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> -    k->init = tosa_dac_init;
>      k->event = tosa_dac_event;
>      k->recv = tosa_dac_recv;
>      k->send = tosa_dac_send;
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 68a92f3..b3a6bbd 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -263,12 +263,6 @@ static int aer915_recv(I2CSlave *slave)
>      return retval;
>  }
>  
> -static int aer915_init(I2CSlave *i2c)
> -{
> -    /* Nothing to do.  */
> -    return 0;
> -}
> -
>  static VMStateDescription vmstate_aer915_state = {
>      .name = "aer915",
>      .version_id = 1,
> @@ -285,7 +279,6 @@ static void aer915_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> -    k->init = aer915_init;
>      k->event = aer915_event;
>      k->recv = aer915_recv;
>      k->send = aer915_send;
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index abd4c4c..ae3ca94 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -260,7 +260,11 @@ static int i2c_slave_qdev_init(DeviceState *dev)
>      I2CSlave *s = I2C_SLAVE(dev);
>      I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(s);
>  
> -    return sc->init(s);
> +    if (sc->init) {
> +        return sc->init(s);
> +    } else {


"else" and "}" below are not needed.


> +        return 0;
> +    }




>  }
>  
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> diff --git a/hw/timer/ds1338.c b/hw/timer/ds1338.c
> index 0112949..f5d04dd 100644
> --- a/hw/timer/ds1338.c
> +++ b/hw/timer/ds1338.c
> @@ -198,11 +198,6 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
>      return 0;
>  }
>  
> -static int ds1338_init(I2CSlave *i2c)
> -{
> -    return 0;
> -}
> -
>  static void ds1338_reset(DeviceState *dev)
>  {
>      DS1338State *s = DS1338(dev);
> @@ -220,7 +215,6 @@ static void ds1338_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>  
> -    k->init = ds1338_init;
>      k->event = ds1338_event;
>      k->recv = ds1338_recv;
>      k->send = ds1338_send;
> 


-- 
Alexey
