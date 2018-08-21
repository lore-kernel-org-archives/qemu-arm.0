Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1563673wrd;
        Mon, 20 Aug 2018 23:49:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwVciWDW7PtVxtPg1z4dvTSxQ0vdtaHz8E5xsMTTgXV1FeZT48wKeFgdRblJGku4Dsyn/PL
X-Received: by 2002:ac8:4283:: with SMTP id o3-v6mr8959320qtl.28.1534834174935;
        Mon, 20 Aug 2018 23:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534834174; cv=none;
        d=google.com; s=arc-20160816;
        b=egbtLforsUCsR2blob5IvswZkf+DV+wrd8Vgr36zKjYT7e8HIWZeYVZopzqMU2Crxz
         BZfO8OpKtrng0R4/sr1eRjD1dBDOGy2UOhvYsmdV6vAczhh1olDu09aohPlvZ3vVFbwq
         qfmmmJ3szvc5Rp0WQueKw7DXC4H6GQWou7tdh3Y39KY3zQWCiLged4n/5My09JvTwGKO
         VFSI2lnZFdH4Lv5NixgDeNyodiao5UrbjXrff0aLfAkI9/N0v86Zfy3K42N+Na5+Xl3I
         3TtUGSuPbYczlnmfO4dt0RIj5weu0megPPwyQ0ms/qK7cVjoAd2qiye0/E9ABJ/KY5Va
         gTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=f6IrLvwR3PpNvnJw23pLEz8x77VZnKQ8bqy6L2CvTo8=;
        b=cx6ShbgAD2zQF8/5YIDYdjdXE/y9E5/hRgsAvzvSu+rGOKXpaCSI5knut43aP3PvV2
         xFNcXWx+RpWMdtxxRvPZDGR6x1tlSvAlsXCntA+e9AgV++8JK2wijVn/on6dA7XWPUtL
         wOXJ0ELu72kLJ2D5OliaDXaC0DkEXqRq6e7Is/82zsBarRxjRB0zcYP4pYm7OOcE38An
         vctJtVJCsPQXGH8r3GEClPDVPLUrdHC2XpOT31oJKXcGxxk6VWL28bDVSSgEnjpkO8QD
         kPhfBr5bvw0xiJvuT47sCXiAXtfia8onWmcQNeQ5HMxp9IVzlHquQHPs++pimQhF3PvO
         MkMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GtdPKpld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185-v6si10930344qkf.234.2018.08.20.23.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GtdPKpld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0Tu-0000Ln-A3
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:49:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0TM-0000AZ-Uh
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 02:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0TK-00055T-Kf
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 02:49:00 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:45933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0TI-000543-Eu; Tue, 21 Aug 2018 02:48:56 -0400
Received: by mail-ua1-x944.google.com with SMTP id k8-v6so11206940uaq.12;
	Mon, 20 Aug 2018 23:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=f6IrLvwR3PpNvnJw23pLEz8x77VZnKQ8bqy6L2CvTo8=;
	b=GtdPKpldE4YLBxjBoB/noL1Eap4xkZ0QnEXnHr77ceV/cPy6vipfoyjRhKEP8xtl3I
	Pi4IkfBCrmP2TilVR2e5edNGUinb9a+yWIl+NOsyd3I/SCMnU/F4WgpWdJVPYI75J/9S
	41b/HMvdEqb4zi40ARNCoGDjTCHNBL+6hVZYCvQkjsfJcSZq9qxs9tf7qQ0UOK5gYAgv
	91FwdIwNpzPk24vkWxAUwBLgRvrPAkSFqqFH+IkfAQmux4/V5wBgdOCxafg/GfDacjQy
	OAZ7w+nUYtH7DoM2BtHbSO1kZsHyDCBtQQJGv6/EcaI+HF4ntvdbKqfnZ4cw2RfGENsN
	Y+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=f6IrLvwR3PpNvnJw23pLEz8x77VZnKQ8bqy6L2CvTo8=;
	b=mcQSCx5tEVPvWuoG0hq88/lz8/rSWZBZArMC1ZVmBMaycw4xuOEms+AfbzlHdb9vPN
	HB20mw4aVNuSlmjq5KFRsL5yDDI4uSeeCmzKKnY0ThSDZJp/e/Y13FmpzRCAcGHhmmSa
	OdRCpqsKENvx2Dyh7UupuUsDsaIWHH369eg/fyC49djusYn+ghXw3RZHaC7xbiadfq5C
	r2vc789BQ9QKrFmNCB14Kf2iDmaunVBo4+ZsApM9aZh2ZhNNXzbvf7AZ9GEiiMYk+2d3
	Z2fNMBIl5Ivw+68BhsQH1OQGjx+8jbNO7kj2rLWr4tT08fkoNDuBtRZkeHJXood84B3G
	xf1g==
X-Gm-Message-State: AOUpUlHkOs13Cos1SK2ePX7eNHZNmCjYdgh5Uu1e5B4rG3ByaY27Z89i
	ip6PSxTaDoDI14plAIYh/PQ=
X-Received: by 2002:ab0:3352:: with SMTP id
	h18-v6mr21911395uap.10.1534834135876; 
	Mon, 20 Aug 2018 23:48:55 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k12-v6sm926920vkf.4.2018.08.20.23.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:48:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-16-peter.maydell@linaro.org>
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
Message-ID: <b5eaab49-ca93-37b9-a0e7-31ac60cace58@amsat.org>
Date: Tue, 21 Aug 2018 03:48:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH 15/22] hw/ssi/pl022: Allow use as
 embedded-struct device
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
X-TUID: dIWlv1vz/2cj

On 08/20/2018 11:11 AM, Peter Maydell wrote:
> Create a new include file for the pl022's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> While we're adding the new file to MAINTAINERS, add
> also the .c file, which was missing an entry.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/ssi/pl022.h | 51 ++++++++++++++++++++++++++++++++++++++++++
>  hw/ssi/pl022.c         | 26 +--------------------
>  MAINTAINERS            |  2 ++
>  3 files changed, 54 insertions(+), 25 deletions(-)
>  create mode 100644 include/hw/ssi/pl022.h
> 
> diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
> new file mode 100644
> index 00000000000..a080519366d
> --- /dev/null
> +++ b/include/hw/ssi/pl022.h
> @@ -0,0 +1,51 @@
> +/*
> + * ARM PrimeCell PL022 Synchronous Serial Port
> + *
> + * Copyright (c) 2007 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or
> + * (at your option) any later version.
> + */
> +
> +/* This is a model of the Arm PrimeCell PL022 synchronous serial port.
> + * The PL022 TRM is:
> + * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0194h/DDI0194H_ssp_pl022_trm.pdf
> + *
> + * QEMU interface:
> + * + sysbus IRQ: SSPINTR combined interrupt line
> + * + sysbus MMIO region 0: MemoryRegion for the device's registers
> + */
> +
> +#ifndef HW_SSI_PL022_H
> +#define HW_SSI_PL022_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_PL022 "pl022"
> +#define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
> +
> +typedef struct PL022State {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    uint32_t cr0;
> +    uint32_t cr1;
> +    uint32_t bitmask;
> +    uint32_t sr;
> +    uint32_t cpsr;
> +    uint32_t is;
> +    uint32_t im;
> +    /* The FIFO head points to the next empty entry.  */
> +    int tx_fifo_head;
> +    int rx_fifo_head;
> +    int tx_fifo_len;
> +    int rx_fifo_len;
> +    uint16_t tx_fifo[8];
> +    uint16_t rx_fifo[8];
> +    qemu_irq irq;
> +    SSIBus *ssi;
> +} PL022State;
> +
> +#endif
> diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
> index c1368018ee3..379d3093987 100644
> --- a/hw/ssi/pl022.c
> +++ b/hw/ssi/pl022.c
> @@ -9,6 +9,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> +#include "hw/ssi/pl022.h"
>  #include "hw/ssi/ssi.h"
>  #include "qemu/log.h"
>  
> @@ -41,31 +42,6 @@ do { fprintf(stderr, "pl022: error: " fmt , ## __VA_ARGS__);} while (0)
>  #define PL022_INT_RX  0x04
>  #define PL022_INT_TX  0x08
>  
> -#define TYPE_PL022 "pl022"
> -#define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
> -
> -typedef struct PL022State {
> -    SysBusDevice parent_obj;
> -
> -    MemoryRegion iomem;
> -    uint32_t cr0;
> -    uint32_t cr1;
> -    uint32_t bitmask;
> -    uint32_t sr;
> -    uint32_t cpsr;
> -    uint32_t is;
> -    uint32_t im;
> -    /* The FIFO head points to the next empty entry.  */
> -    int tx_fifo_head;
> -    int rx_fifo_head;
> -    int tx_fifo_len;
> -    int rx_fifo_len;
> -    uint16_t tx_fifo[8];
> -    uint16_t rx_fifo[8];
> -    qemu_irq irq;
> -    SSIBus *ssi;
> -} PL022State;
> -
>  static const unsigned char pl022_id[8] =
>    { 0x22, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2f8b562dc5..1e81ad8d4b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -451,6 +451,8 @@ F: hw/gpio/pl061.c
>  F: hw/input/pl050.c
>  F: hw/intc/pl190.c
>  F: hw/sd/pl181.c
> +F: hw/ssi/pl022.c
> +F: include/hw/ssi/pl022.h
>  F: hw/timer/pl031.c
>  F: include/hw/arm/primecell.h
>  F: hw/timer/cmsdk-apb-timer.c
> 
