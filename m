Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2657739wru;
        Thu, 9 Aug 2018 22:11:12 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxkdxk6UTAVz3G9svhlNyeY+v9aWMrKK4+MpQFUXYkqMD+VbC7Bum6E1g7GUNJ5ki8X4d1i
X-Received: by 2002:ac8:435c:: with SMTP id a28-v6mr4948521qtn.412.1533877872310;
        Thu, 09 Aug 2018 22:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533877872; cv=none;
        d=google.com; s=arc-20160816;
        b=CZVLIqVNzE4tXLqM/7Nr74o1CxJydFu8qdJ/lfDVNwX+WN4V+LRUuK9nH2DLpMPAVm
         2rTxFxA9LEJI/7hhJTAcdjTUrMdqh/iFw2QaPF0gfAZM2cBicIT4Tpvl1BDn42CA2IaH
         p6NiadI8wWhPH/mYwlNpjXgnz4n/2gIyUBpn/HFoxVBjC3a+BVp2jRjPkcRCvUkfX38q
         Z5i3mAuQtdnqFvgoqaZ1HCZXJbXyiVxrey8JQP42IC6ICIN4VP+fTwKrCcAFt3hh4Mx3
         4op+bbtjdjZQA8nI4o4yU56WMyn3O4I8oBI/adQU/xuX/nPhLUc6JFg3uoqMkvjzgXbs
         /z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=OG4Jvxc59cvKX1WxdpBLyCYHQ5flFTnOSfJPPYNL9K0=;
        b=kh9EIjtiLst5m/rLwzUTPz/cLbhS11Vbn5IEPxs51vUCHrs7/m5ibuGmuhp8LLsjmv
         u00hBxHMhL10gW1gj3rB+gvtmDqejRrLnjVQ51BOP4iCnWxbh4cyQUOLam0OK4qGBsEe
         9DB2ygU3PShfM3+zH5IY+Dsd13F6Rod7doxE40ODu+/klmTSAMVR2aZWlKjjs42nILa3
         i2WHtDlXgYXS7FQM8z703LIqaUq6qr1t5wbXCU9zyk/eOqx+0v0kHYa2fgL7OF7wHVZd
         VyyMq8Mjj8kKKA4nu6rAAtibRTTfwTQl+yQ5ue7kwcX7fV/68DYMgKvfvbQQiGbJAyDy
         R0nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DjAZ1PZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2-v6si5447443qvc.154.2018.08.09.22.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DjAZ1PZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzhf-0006PC-Ea
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:11:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzhS-0006Nh-1P
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:10:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzhQ-0008SV-Jh
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:10:57 -0400
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:39228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzhK-0008OX-39; Fri, 10 Aug 2018 01:10:50 -0400
Received: by mail-ua1-x942.google.com with SMTP id g18-v6so651090uam.6;
	Thu, 09 Aug 2018 22:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OG4Jvxc59cvKX1WxdpBLyCYHQ5flFTnOSfJPPYNL9K0=;
	b=DjAZ1PZU1Eg8NYrRS0cU9ecR1N/tecYTxPDJqhqhh7E08q4xX4q103UM30AfhV+hXU
	pKyXYloL2gt5iXL0Kz6/kEr0lx+4MjBQZ97X+WdeMsNcGH3A+J3mBIdRaCJCKgJDRiIb
	nPfep89hTgcVmFwf+4fJXYQWc/BRafoEnLjsCScrm+QQOTe6sFGU8gjEQ1i1KCIaeHqx
	NFQEOkoIezgA7qC31hVb1SaFqr4Hx7K6nqlzXYxZwQsfp0NHOR52pSArDrExD60EVwo8
	E/0TALr3JJ4FFPCSb6nFp4H+m6vt8JdYpJrhH/TuSvqQyGzTF6micSimmyEAJB0NDAeN
	5o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=OG4Jvxc59cvKX1WxdpBLyCYHQ5flFTnOSfJPPYNL9K0=;
	b=HJXzRxwQTrZms7LsY/jlNL+0hBd6IHyk32nPvEVSJjHmTqPBqzdnalezf6tk70sVRd
	5AztA0qFqfUjpy0i0yd3qhHCR4fFN0YdBVnO5qJAwYiogoIY9ALR0zq/drYTWSmiXEGk
	YWO4pvJS0LvyOLC8bqxE1q+7B6pQvqvvK+mmj9zzLQKmrWsV0Do3tNLnNzc0rK59SBL7
	zlWBCxiIoQgtRk5q0rn7vZWbMuBTIuCOGtf7dNU0GTddzH+3DzaZzySQnauTcOpKv+Py
	Eq/TcJ8iQbxGg0Ncpy1edRoNxemkq9o3WU92dy8s6XVnkz8Ca98Xja4qx39STMKxTpN9
	Ofxg==
X-Gm-Message-State: AOUpUlH6zHZuImEo0r4BRZavIIMthpKmuuAantYAVgm03IEmsUww9q0Q
	pv3YOMLHqiUZaLuhqbEoCaOk43JU
X-Received: by 2002:a1f:f01:: with SMTP id 1-v6mr3280501vkp.56.1533877849349; 
	Thu, 09 Aug 2018 22:10:49 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w16-v6sm1317491uam.50.2018.08.09.22.10.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:10:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-13-peter.maydell@linaro.org>
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
Message-ID: <7e644a0e-0059-0dcb-edc9-315d041e3335@amsat.org>
Date: Fri, 10 Aug 2018 02:10:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::942
Subject: Re: [Qemu-arm] [PATCH 12/16] hw/dma/pl080: Don't use CPU address
 space for DMA accesses
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
X-TUID: 3V8g8iTqa+PG

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> Currently our PL080/PL081 model uses a combination of the CPU's
> address space (via cpu_physical_memory_{read,write}()) and the
> system address space for performing DMA accesses.
> 
> For the PL081s in the MPS FPGA images, their DMA accesses
> must go via Master Security Controllers. Switch the
> PL080/PL081 model to take a MemoryRegion property which
> defines its downstream for making DMA accesses.
> 
> Since the PL08x are only used in two board models, we
> make provision of the 'downstream' link mandatory and convert
> both users at once, rather than having it be optional with
> a default to the system address space.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/dma/pl080.h |  5 +++++
>  hw/arm/realview.c      |  8 +++++++-
>  hw/arm/versatilepb.c   |  9 ++++++++-
>  hw/dma/pl080.c         | 35 +++++++++++++++++++++++++++++------
>  4 files changed, 49 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
> index 7c6a4184833..9d4b3df143f 100644
> --- a/include/hw/dma/pl080.h
> +++ b/include/hw/dma/pl080.h
> @@ -21,6 +21,8 @@
>   * + sysbus IRQ 1: DMACINTERR error interrupt request
>   * + sysbus IRQ 2: DMACINTTC count interrupt request
>   * + sysbus MMIO region 0: MemoryRegion for the device's registers
> + * + QOM property "downstream": MemoryRegion defining where DMA
> + *   bus master transactions are made
>   */
>  
>  #ifndef HW_DMA_PL080_H
> @@ -61,6 +63,9 @@ typedef struct PL080State {
>      qemu_irq irq;
>      qemu_irq interr;
>      qemu_irq inttc;
> +
> +    MemoryRegion *downstream;
> +    AddressSpace downstream_as;
>  } PL080State;
>  
>  #endif
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index cd585d94694..ab8c14fde38 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -201,7 +201,13 @@ static void realview_init(MachineState *machine,
>      pl011_create(0x1000c000, pic[15], serial_hd(3));
>  
>      /* DMA controller is optional, apparently.  */
> -    sysbus_create_simple("pl081", 0x10030000, pic[24]);
> +    dev = qdev_create(NULL, "pl081");
> +    object_property_set_link(OBJECT(dev), OBJECT(sysmem), "downstream",
> +                             &error_fatal);

Nice!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    qdev_init_nofail(dev);
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, 0x10030000);
> +    sysbus_connect_irq(busdev, 0, pic[24]);
>  
>      sysbus_create_simple("sp804", 0x10011000, pic[4]);
>      sysbus_create_simple("sp804", 0x10012000, pic[5]);
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index a5a06b6d408..8b748570596 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -287,7 +287,14 @@ static void versatile_init(MachineState *machine, int board_id)
>      pl011_create(0x101f3000, pic[14], serial_hd(2));
>      pl011_create(0x10009000, sic[6], serial_hd(3));
>  
> -    sysbus_create_simple("pl080", 0x10130000, pic[17]);
> +    dev = qdev_create(NULL, "pl080");
> +    object_property_set_link(OBJECT(dev), OBJECT(sysmem), "downstream",
> +                             &error_fatal);
> +    qdev_init_nofail(dev);
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, 0x10130000);
> +    sysbus_connect_irq(busdev, 0, pic[17]);
> +
>      sysbus_create_simple("sp804", 0x101e2000, pic[4]);
>      sysbus_create_simple("sp804", 0x101e3000, pic[5]);
>  
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 301030dd118..8f9f3e08d9a 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -12,6 +12,7 @@
>  #include "exec/address-spaces.h"
>  #include "qemu/log.h"
>  #include "hw/dma/pl080.h"
> +#include "qapi/error.h"
>  
>  #define PL080_CONF_E    0x1
>  #define PL080_CONF_M1   0x2
> @@ -161,14 +162,16 @@ again:
>              swidth = 1 << ((ch->ctrl >> 18) & 7);
>              dwidth = 1 << ((ch->ctrl >> 21) & 7);
>              for (n = 0; n < dwidth; n+= swidth) {
> -                cpu_physical_memory_read(ch->src, buff + n, swidth);
> +                address_space_read(&s->downstream_as, ch->src,
> +                                   MEMTXATTRS_UNSPECIFIED, buff + n, swidth);
>                  if (ch->ctrl & PL080_CCTRL_SI)
>                      ch->src += swidth;
>              }
>              xsize = (dwidth < swidth) ? swidth : dwidth;
>              /* ??? This may pad the value incorrectly for dwidth < 32.  */
>              for (n = 0; n < xsize; n += dwidth) {
> -                cpu_physical_memory_write(ch->dest + n, buff + n, dwidth);
> +                address_space_write(&s->downstream_as, ch->dest + n,
> +                                    MEMTXATTRS_UNSPECIFIED, buff + n, dwidth);
>                  if (ch->ctrl & PL080_CCTRL_DI)
>                      ch->dest += swidth;
>              }
> @@ -178,19 +181,19 @@ again:
>              if (size == 0) {
>                  /* Transfer complete.  */
>                  if (ch->lli) {
> -                    ch->src = address_space_ldl_le(&address_space_memory,
> +                    ch->src = address_space_ldl_le(&s->downstream_as,
>                                                     ch->lli,
>                                                     MEMTXATTRS_UNSPECIFIED,
>                                                     NULL);
> -                    ch->dest = address_space_ldl_le(&address_space_memory,
> +                    ch->dest = address_space_ldl_le(&s->downstream_as,
>                                                      ch->lli + 4,
>                                                      MEMTXATTRS_UNSPECIFIED,
>                                                      NULL);
> -                    ch->ctrl = address_space_ldl_le(&address_space_memory,
> +                    ch->ctrl = address_space_ldl_le(&s->downstream_as,
>                                                      ch->lli + 12,
>                                                      MEMTXATTRS_UNSPECIFIED,
>                                                      NULL);
> -                    ch->lli = address_space_ldl_le(&address_space_memory,
> +                    ch->lli = address_space_ldl_le(&s->downstream_as,
>                                                     ch->lli + 8,
>                                                     MEMTXATTRS_UNSPECIFIED,
>                                                     NULL);
> @@ -358,6 +361,18 @@ static void pl080_init(Object *obj)
>      s->nchannels = 8;
>  }
>  
> +static void pl080_realize(DeviceState *dev, Error **errp)
> +{
> +    PL080State *s = PL080(dev);
> +
> +    if (!s->downstream) {
> +        error_setg(errp, "PL080 'downstream' link not set");
> +        return;
> +    }
> +
> +    address_space_init(&s->downstream_as, s->downstream, "pl080-downstream");
> +}
> +
>  static void pl081_init(Object *obj)
>  {
>      PL080State *s = PL080(obj);
> @@ -365,11 +380,19 @@ static void pl081_init(Object *obj)
>      s->nchannels = 2;
>  }
>  
> +static Property pl080_properties[] = {
> +    DEFINE_PROP_LINK("downstream", PL080State, downstream,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void pl080_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      dc->vmsd = &vmstate_pl080;
> +    dc->realize = pl080_realize;
> +    dc->props = pl080_properties;
>  }
>  
>  static const TypeInfo pl080_info = {
> 
