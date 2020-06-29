Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3362236lfm;
        Mon, 29 Jun 2020 14:37:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6dnTTfNc3NUbX+aoZPCDVjKW7+XawryFXC0EVLluSRCQrSktTFJNFN3RAAcbAjuqTwWfq
X-Received: by 2002:a25:5186:: with SMTP id f128mr30355355ybb.293.1593466651348;
        Mon, 29 Jun 2020 14:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593466651; cv=none;
        d=google.com; s=arc-20160816;
        b=0+VaUClMIUCtXZ9htMTZ21jIUdIgC/jMKlYHfML7UsXKJe9p8lPIIa48hl9YQme1fa
         tVLpApM0Tq87woFpTj8FLAj37siXGYiweyZyWhYudlnjbhwX12OKoEy8hbp/zoVqwztl
         tVFFwbgaqkGb1snwtUBVTUeVUGm9RBii6dnuA2q5GZCSxR6405XzDRIE4ah//Qx1Ktyl
         R07lwjZnuj9KATr8FuqXvHMaGTvKkBJtOcnuIHvFc7dvNDR89lf4iyo7jfF0fr9SE6SD
         M4Ou0WiFwq6N4NzKdCTe6Y8z00MxkrEuc9VykLZqX9FkLi9YR2DrAwi1Bv6SpbMSxg8N
         D/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=bvra1OQqXKKgyAkSDvBuDEeAeNiNjGUxoO366aOXIcA=;
        b=bNqmxmtZ2U6EEVjBQmmw54ldFs/Bvx9aBGcrxzOzKfbm1JQfiW7XNsj2qlhhP9rqDw
         6bzP21AahzWgqyKC5EQ0lmeP4bNlRWpTv1TlFBubjLfD5cgeWm+36lLfdN/BOdVqUXzZ
         JatFI7TinB8/aQGLbEma5DNjNbhDAhEbinjb77FtE42OObK4zhZNBlOBSbZ0tZyZ810Q
         k2/Zxk5jJMN+XU0OU5Vwcda8aYfJi4MOaaUOIfOD4Hx2wboSZeB/bYCoDndyza3HndQz
         TD/UDhDWzGzRG1CFzJZae0R9NiknwrF1WHkzR2QGID0b1NNyNUa8zJrAn68RfsyUPl43
         h5Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si830823ybk.105.2020.06.29.14.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 14:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jq1T0-00016a-OC
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 17:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jq1Sf-00015a-OK; Mon, 29 Jun 2020 17:37:09 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:48090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jq1Sd-0006Ke-BS; Mon, 29 Jun 2020 17:37:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4E3A47475F9;
 Mon, 29 Jun 2020 23:37:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 24760746335; Mon, 29 Jun 2020 23:37:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 22EE2746331;
 Mon, 29 Jun 2020 23:37:05 +0200 (CEST)
Date: Mon, 29 Jun 2020 23:37:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/5] hw/i2c: Rename i2c_try_create_slave() as
 i2c_slave_new()
In-Reply-To: <20200629173821.22037-3-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2006292333540.63145@zero.eik.bme.hu>
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-3-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-715433422-1593466625=:63145"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 17:31:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t3x0HZ2O9207

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-715433422-1593466625=:63145
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 29 Jun 2020, Philippe Mathieu-Daudé wrote:
> We use "new" names for functions that allocate and initialize
> device objects: pci_new(), isa_new(), usb_new().
> Let's call this one i2c_slave_new(). Since we have to update
> all the callers, also let it return a I2CSlave object.

All the callers now need a cast due to change to I2CSlave * instead of 
what they expect. Does that really worth it? Also this introduces 
inconsistency between i2c_create_slave and i2c_new so not sure about that 
part but I don't really mind either way. Maybe return what most callers 
expect so the calls are simple and don't need an additional cast in most 
of the cases?

Regards,
BALATON Zoltan

> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> include/hw/i2c/i2c.h | 2 +-
> hw/arm/aspeed.c      | 4 ++--
> hw/i2c/core.c        | 9 ++++-----
> 3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index d6e3d85faf..18efc668f1 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -79,8 +79,8 @@ int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send);
> int i2c_send(I2CBus *bus, uint8_t data);
> uint8_t i2c_recv(I2CBus *bus);
>
> +I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
> DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
> -DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
> bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
>
> /* lm832x.c */
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1285bf82c0..54ca36e0b6 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -513,7 +513,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>     /* Bus 3: TODO bmp280@77 */
>     /* Bus 3: TODO max31785@52 */
>     /* Bus 3: TODO dps310@76 */
> -    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
> +    dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>     qdev_prop_set_string(dev, "description", "pca1");
>     i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 3),
>                           &error_fatal);
> @@ -531,7 +531,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>
>     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
>                           eeprom_buf);
> -    dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
> +    dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>     qdev_prop_set_string(dev, "description", "pca0");
>     i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 11),
>                           &error_fatal);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index acf34a12d6..6eacb4a463 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -267,13 +267,13 @@ const VMStateDescription vmstate_i2c_slave = {
>     }
> };
>
> -DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
> +I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
> {
>     DeviceState *dev;
>
>     dev = qdev_new(name);
>     qdev_prop_set_uint8(dev, "address", addr);
> -    return dev;
> +    return I2C_SLAVE(dev);
> }
>
> bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> @@ -283,10 +283,9 @@ bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
>
> DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> {
> -    DeviceState *dev;
> +    DeviceState *dev = DEVICE(i2c_slave_new(name, addr));
>
> -    dev = i2c_try_create_slave(name, addr);
> -    i2c_realize_and_unref(dev, bus, &error_fatal);
> +    i2c_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
>
>     return dev;
> }
>
--3866299591-715433422-1593466625=:63145--
