Received: by 10.28.71.27 with SMTP id u27csp1730046wma;
        Thu, 22 Feb 2018 01:06:22 -0800 (PST)
X-Google-Smtp-Source: AH8x225qcJYmURxAPJECSTLl6IscwnNyA0nARYelrzY/8ESjxuVRnUT4Pms+cVGi1iDU7DHOJaK8
X-Received: by 10.129.121.136 with SMTP id u130mr343263ywc.368.1519290382329;
        Thu, 22 Feb 2018 01:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519290382; cv=none;
        d=google.com; s=arc-20160816;
        b=Q24QFKTs7YNY8EQUeb5nPgPPINj+CYaKCKX/7VApfaMTspETnLb09YYk678+c2On+K
         qT6nA6Cd6hmv9RfFTVpacgPNuZbySi371l0FXHi5xUsVG5HFXAwMip1cndHukhXsmmeY
         PoDt+u7YIdxBiflqw4iQGtuZoKLLCPjiNZKwFscWZHgFLkqgcPH8GRBcT6b+d3yYfpdq
         xjRbbHgh9CkTthG7UxfR0wEXFBrhX74L0dG4+VGc0fxAUXkRWB+CeSuwyVfE03QiHxJ5
         60vOAdy+VV6212VkBrrUCcJvwuMUXTwRbNPYHcU221pV3FrPxLK1apQHYlzVbb34Qdqk
         Eu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TRKoUYjziZfZ9BhjDM+G8PKFC3pBmINaNxeFkarGD8E=;
        b=ZDYV1BTgp3jWa7pBgxZYjeDRSYhDK1mx8Y6VkZNEgHFimzpmDC7G5zO3KexxZRWWId
         4LnPGTlM6Lamm8NXbzC59mt/LqqpGZj0D2knaCvOtxqWhDPdWiFueZti80NED5eErE7e
         9bN+IzyKHWYOYrj0hoUOhrrH4DDuq0JIMIihTxjcvBgfBJRkY2k4rDlRf6Dl5C7RXJQU
         g3PUsqFAa+q/jC/FinUN9R48i57WfMN2LeNaqe+kWVa2YIX9DPlXmanew80NpjmHGjxl
         YxzMSUkS2EzVoWVlXjGDBXE/rv3ZP95JDO2iJuAhN1lTNsrfwVc6rIki1VrtK5Qvw10e
         glvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YWz04uE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r129si3294490ywh.285.2018.02.22.01.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 01:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YWz04uE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eompZ-0007Eo-LV
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 04:06:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eompL-0007CL-BD
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 04:06:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eompJ-0004Og-NZ
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 04:06:07 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:38405)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eompJ-0004OG-EW; Thu, 22 Feb 2018 04:06:05 -0500
Received: by mail-wm0-x243.google.com with SMTP id z9so2272233wmb.3;
	Thu, 22 Feb 2018 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TRKoUYjziZfZ9BhjDM+G8PKFC3pBmINaNxeFkarGD8E=;
	b=YWz04uE3VKAbElptEePO25jchICq4xXm5WWs9G/NFzB89mkeyDJrWELSf+qO4HjqFU
	ahjy/CxTN4R95nCWT5SE/mjSzDjq5UlmfqHNqyOCFVg7zblUK4tIfEFZkaop7RVXfFIk
	8CeQ8+N5jLok8s8w3b9pizBHFlI/JNeDMDfuFyV8jgF3vO9njzwNeetwNijOX2wmjXrM
	lW8uJVQH3In+tr1Jk9z0TiP2UrR9Y9L94V10jJDpAU1/iRMJtaWrASXDYykN8odOS2cH
	T13eZRvyXjC6osh1U0GUHm9CVfyLNnR+g4sbXLsat4h2fhxN+DKlsaNZu6uuplS4FdEc
	Y7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TRKoUYjziZfZ9BhjDM+G8PKFC3pBmINaNxeFkarGD8E=;
	b=R6ttkt5pZdvPK1KidqyMgRt/vjgzn5jB0ExUrj3AlvTf1KRr0uYEhAmK9B5N2a4pPR
	kaiyEw/WZTMRmNFIgsWpGFsynYgorqzN2SUNmrRpNajAeJmNSNMSSknCmu+VXN4Ejnxf
	pNW/P8XXuJUSs5KrJoKcurKpkGl7SWH7t0voASEqtFJXXAHBnQzjnrSf9vVCaJquRvS2
	ug6dhZJWBLYuX1DMpnCui2AUI8zJJ4OGcDmSMhAHP2zDkC++h2NsroR+i9vHXHGT2YZd
	Hr71Me1u84UAcZliHqe7EzmdC5gblaQspeKPeO3oYym96Kz8I/9bb+FZugNq9t1WSA9+
	TKwA==
X-Gm-Message-State: APf1xPAhBoVf5fwoKuBGKCtD6m19kLKb78um860mcgMX5e48JIpupsKm
	GFY+YkJU8e6sFgx/KOtYl0NPXL0e
X-Received: by 10.28.212.141 with SMTP id l135mr3855139wmg.122.1519290364127; 
	Thu, 22 Feb 2018 01:06:04 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7?
	([2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7])
	by smtp.gmail.com with ESMTPSA id
	n20sm16476820wrg.84.2018.02.22.01.06.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 01:06:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>
References: <20180216022933.10945-1-f4bug@amsat.org>
	<20180216022933.10945-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d19cdb63-b75e-82d6-1883-109a1d75fad8@amsat.org>
Date: Thu, 22 Feb 2018 06:06:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180216022933.10945-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [RFC PATCH v3 5/7] hw/sd/pl181: expose a SDBus and
 connect the SDCard to it
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73vWJMu8RsyC

ping? :)

On 02/15/2018 11:29 PM, Philippe Mathieu-Daudé wrote:
> using the sdbus_*() API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> 
> RFC because how pl181_sdbus_create_inplace() doing class_init(SDBus) in
> realize(pl181) seems weird...
> 
> from http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg01268.html:
> 
>     I think you have to change that sd_set_cb() code now.
>     If you look at sd_cardchange() it uses "is this SD card
>     object on an SDBus" to determine whether to notify the
>     controller via the old-API IRQ lines, or using the
>     set_inserted() and set_readonly() callbacks on the SDBusClass.
> 
> This previous series intended to enforce a cleaner OOP design, adding a
> TYPE_SD_BUS_MASTER_INTERFACE TypeInfo:
> 
> http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02322.html
> http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02326.html
> http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02327.html
> ---
> 
>  hw/sd/pl181.c | 59 ++++++++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 3ba1f7dd23..97e85e4a64 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -33,7 +33,7 @@ typedef struct PL181State {
>      SysBusDevice parent_obj;
>  
>      MemoryRegion iomem;
> -    SDState *card;
> +    SDBus sdbus;
>      uint32_t clock;
>      uint32_t power;
>      uint32_t cmdarg;
> @@ -179,7 +179,7 @@ static void pl181_send_command(PL181State *s)
>      request.cmd = s->cmd & PL181_CMD_INDEX;
>      request.arg = s->cmdarg;
>      DPRINTF("Command %d %08x\n", request.cmd, request.arg);
> -    rlen = sd_do_command(s->card, &request, response);
> +    rlen = sdbus_do_command(&s->sdbus, &request, response);
>      if (rlen < 0)
>          goto error;
>      if (s->cmd & PL181_CMD_RESPONSE) {
> @@ -223,12 +223,12 @@ static void pl181_fifo_run(PL181State *s)
>      int is_read;
>  
>      is_read = (s->datactrl & PL181_DATA_DIRECTION) != 0;
> -    if (s->datacnt != 0 && (!is_read || sd_data_ready(s->card))
> +    if (s->datacnt != 0 && (!is_read || sdbus_data_ready(&s->sdbus))
>              && !s->linux_hack) {
>          if (is_read) {
>              n = 0;
>              while (s->datacnt && s->fifo_len < PL181_FIFO_LEN) {
> -                value |= (uint32_t)sd_read_data(s->card) << (n * 8);
> +                value |= (uint32_t)sdbus_read_data(&s->sdbus) << (n * 8);
>                  s->datacnt--;
>                  n++;
>                  if (n == 4) {
> @@ -249,7 +249,7 @@ static void pl181_fifo_run(PL181State *s)
>                  }
>                  n--;
>                  s->datacnt--;
> -                sd_write_data(s->card, value & 0xff);
> +                sdbus_write_data(&s->sdbus, value & 0xff);
>                  value >>= 8;
>              }
>          }
> @@ -477,13 +477,6 @@ static void pl181_reset(DeviceState *d)
>      s->linux_hack = 0;
>      s->mask[0] = 0;
>      s->mask[1] = 0;
> -
> -    /* We can assume our GPIO outputs have been wired up now */
> -    sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
> -    /* Since we're still using the legacy SD API the card is not plugged
> -     * into any bus, and we must reset it manually.
> -     */
> -    device_reset(DEVICE(s->card));
>  }
>  
>  static void pl181_init(Object *obj)
> @@ -499,16 +492,52 @@ static void pl181_init(Object *obj)
>      qdev_init_gpio_out(dev, s->cardstatus, 2);
>  }
>  
> +static void pl181_set_readonly(DeviceState *dev, bool level)
> +{
> +    PL181State *s = (PL181State *)dev;
> +
> +    qemu_set_irq(s->cardstatus[0], level);
> +}
> +
> +static void pl181_set_inserted(DeviceState *dev, bool level)
> +{
> +    PL181State *s = (PL181State *)dev;
> +
> +    qemu_set_irq(s->cardstatus[1], level);
> +}
> +
> +static void pl181_sdbus_create_inplace(SDBus *sdbus, DeviceState *dev)
> +{
> +    SDBusClass *sbc;
> +
> +    qbus_create_inplace(sdbus, sizeof(SDBus), TYPE_SD_BUS, dev, "sd-bus");
> +
> +    /* pl181_sdbus_class_init */
> +    sbc = SD_BUS_GET_CLASS(sdbus);
> +    sbc->set_inserted = pl181_set_inserted;
> +    sbc->set_readonly = pl181_set_readonly;
> +}
> +
>  static void pl181_realize(DeviceState *dev, Error **errp)
>  {
>      PL181State *s = PL181(dev);
> +    DeviceState *carddev;
>      DriveInfo *dinfo;
> +    Error *err = NULL;
> +
> +    pl181_sdbus_create_inplace(&s->sdbus, dev);
>  
> +    /* Create and plug in the sd card */
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo = drive_get_next(IF_SD);
> -    s->card = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false);
> -    if (s->card == NULL) {
> -        error_setg(errp, "sd_init failed");
> +    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    if (dinfo) {
> +        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
> +    }
> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
> +    if (err) {
> +        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
> +        return;
>      }
>  }
>  
> 
