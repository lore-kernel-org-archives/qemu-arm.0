Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp749171wrd;
        Fri, 17 Aug 2018 17:00:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzxpIZoZS2SFcN5AeVsDsCtaO5a40lqa2n0H9OpRdaiusyyvsr/ar2T5nkaWVcJsB6/sjV5
X-Received: by 2002:aed:24e7:: with SMTP id u36-v6mr36318697qtc.58.1534550435492;
        Fri, 17 Aug 2018 17:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534550435; cv=none;
        d=google.com; s=arc-20160816;
        b=QT8kEBcM4ABPVgCiMFNiFCcLpxmvsEQ/EKL4zQDSG9iTySArVJlYF4P4Qc4CsFR/g1
         nJpah5mSDD2YuZChrNeEPrclDAQUp390qVp5GwTgDQShppe8NhLQDTkUuJQcjMtjwUWv
         s5ddAYSNkoy7DAsSrbvw066q+5Xa9a322imcq9TnfRSaE75fJg2cLuMEFzuWr7ITPOOL
         radU4SFsQ/lSYjXrAvyQJYwOP6dSrlJFM1qv8X9G6Lh1yNh/ZF+RTHA7e9khnQWI8Lkf
         7Bdwx2/pz9rMD+vp6gg8WXyh3rzp4XiapoHtIataC7QY1hgBvVTFu/QSlWZaPsleoFxg
         q/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=tgVRuT5puIC/a0SpPmIVungwcmB546P1GzuKaCg+0DQ=;
        b=p7o8E88WmAYGIsmO7fBnOpQMhqJXhZBwq51BEbbJFR5clj0xDgC+C8QL6vYO/WEQyR
         COK7fYy3eWQKMHtRVFcQwweHhBA5xMHWLWT56QBpTw5GsagykHqaczQMOCpzvz0TfGRB
         ulBhV5cFSkG5PIBeNnnqj1ft8fAyBMagDdohG4pkyH6IAR4JpKtrcIHPbRYsjd/+TMvR
         4aMJ+D3qC1Zmg6i6OV5TkxigSYXOIMwkBRMzxwjzBtkSL2j6I3VZ7XRhuGHRHr2uW9Bk
         YC1Hyclt5f95VEoFNZtcc+0iC2cE1lx4OKD6OOP9AZ7DYR0+nPCGXOJ3eMPES/yNO86C
         0QOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mlv0qnFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p43-v6si3207387qtc.79.2018.08.17.17.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 17:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mlv0qnFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqofT-0004sQ-0C
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 20:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqofJ-0004r2-Oc
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 20:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqofI-0005wl-SR
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 20:00:25 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:42925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqofC-0005oq-PC; Fri, 17 Aug 2018 20:00:18 -0400
Received: by mail-ua1-x941.google.com with SMTP id w7-v6so6709935uan.9;
	Fri, 17 Aug 2018 17:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tgVRuT5puIC/a0SpPmIVungwcmB546P1GzuKaCg+0DQ=;
	b=mlv0qnFBhWe4z9FqtUBTi8aOpW+wScvLx8LjPlhYBl0rsaHAnVj+EirpiKfXjTBNZ5
	/lZ7acHALPk0VpN8tmKlIdM+52edPeV0jUE/iDeht95uTKiVfI9SfKEztLUpOCehz/M/
	xbpUIifzJey9eeHNkyFRkJ5WQjHW/R9dnmJuzk/B10I0+rM5ryBvV3AUACIdsvoySNPg
	CfY5KvmmSzQK3XE/5Rqm/jpdSYHb09JmD2/8SvQaw3toARqQY8+Lm00ot4JLAkXBzMmV
	jpzo/piBlRL3YVrnZztNLVysCcHieZIdHSeiNPayWL0jMhIhcSD/+8ZxNqt4xDkoKWhc
	6FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tgVRuT5puIC/a0SpPmIVungwcmB546P1GzuKaCg+0DQ=;
	b=LgeZlL5FMvgFo9/Ny9DQL6SHzGlzv+veBOXXpSETfVlgoK1piT4+kA6UZsiWwuFE7L
	hdrARZS3G71sU1luqxHEsDYfVaxL034cTucnt1ToYZCht30M7MoqBfAfrdxWkJ61ioRK
	iBlOVzyccIIDY0JCaRM0iANgectxCIuJWDGZsZJkQKANd9EjgmGSuGcvXRsAZZw03DHU
	sthpvYpQFvA3KD/d9QJbmfXHUc1mUgDJY+rMJ39CvDUEuqS6dXA7HN9R/moi8PQRWZN0
	Bf2P0W5QLaMzKqSVtqDtuP/fGQSDLjCobXDN29503gevTYmdrlVrLk9STw3AADXDH19J
	CMOQ==
X-Gm-Message-State: AOUpUlFF4W5WnaNAYF1eH2bXk2LixhX8MDPOA+wboqi/Tl4XBnK2xdPY
	veUz1tDmvzOy+4gE3HCHeIs=
X-Received: by 2002:ab0:284b:: with SMTP id
	c11-v6mr23700629uaq.201.1534550418226; 
	Fri, 17 Aug 2018 17:00:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	9-v6sm2025592uau.47.2018.08.17.17.00.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 17:00:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-7-peter.maydell@linaro.org>
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
Message-ID: <39365f2c-e947-3530-ee8f-9062bbb1264f@amsat.org>
Date: Fri, 17 Aug 2018 21:00:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-arm] [PATCH 06/16] hw/misc/iotkit: Wire up the system
 control element
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
X-TUID: qTQFmhv5Vim/

Hi Peter,

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> Wire up the system control element's register banks.
> 
> This is the last of the previously completely unimplemented
> components in the IoTKit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h |  4 +++-
>  hw/arm/iotkit.c         | 19 +++++++++++--------
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 0f5c5101708..1ffa31d521b 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -58,7 +58,7 @@
>  #include "hw/timer/cmsdk-apb-timer.h"
>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
> -#include "hw/misc/unimp.h"
> +#include "hw/misc/iotkit-sysctl.h"
>  #include "hw/or-irq.h"
>  #include "hw/core/split-irq.h"
>  
> @@ -97,6 +97,8 @@ typedef struct IoTKit {
>      CMSDKAPBWatchdog nswatchdog;
>      CMSDKAPBWatchdog swatchdog;
>  
> +    IoTKitSysCtl sysctl;
> +
>      MemoryRegion container;
>      MemoryRegion alias1;
>      MemoryRegion alias2;
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index cb0ec456f39..5d59ed5489f 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -16,7 +16,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/registerfields.h"
>  #include "hw/arm/iotkit.h"
> -#include "hw/misc/unimp.h"
>  #include "hw/arm/arm.h"
>  
>  /* Clock frequency in HZ of the 32KHz "slow clock" */
> @@ -151,6 +150,8 @@ static void iotkit_init(Object *obj)
>                            sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
>      sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
>                            sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
> +    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl, sizeof(s->sysctl),
> +                          TYPE_IOTKIT_SYSCTL);
>      object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
>                              sizeof(s->nmi_orgate), TYPE_OR_IRQ,
>                              &error_abort, NULL);
> @@ -516,13 +517,15 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>                            qdev_get_gpio_in_named(dev_apb_ppc1,
>                                                   "cfg_sec_resp", 0));
>  
> -    /* Using create_unimplemented_device() maps the stub into the
> -     * system address space rather than into our container, but the
> -     * overall effect to the guest is the same.
> -     */
> -    create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
> -
> -    create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
> +    object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    /* System information registers */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x40020000);

What about the Secure access?

       sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50020000);

> +    /* System control registers */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 1, 0x50021000);
>  
>      /* This OR gate wires together outputs from the secure watchdogs to NMI */
>      object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
> 
