Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1561628wrd;
        Mon, 20 Aug 2018 23:46:41 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzVuY4Wlm5t+ogjDi5M+zsZMbAafCwXMyvS0pfku1wbtnCyvQPjQobcXH8yirn76BK74PjH
X-Received: by 2002:ac8:390e:: with SMTP id s14-v6mr16800262qtb.363.1534834000965;
        Mon, 20 Aug 2018 23:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534834000; cv=none;
        d=google.com; s=arc-20160816;
        b=ooX21Tyfh8fVdp6UHmy0pdLXPPmrp2zX/pqBocpeCz35jrh5snldlF+ARPueQh3jU8
         BgdgmmocD7UmQJrFtoE1VMQhr0lIHAU1HhzMdrorw1Ww7J6Ytg1YhDKR1JREEUl3BuTK
         v0ycyNl6RNM/yxrcPKXZHwqwmqgCF5HrB7xm6ZG1HT1nbP6xlQztryzM5+S3xpYWCVwB
         Tv/f/Gpak873mYIHdtVEaEDe0yF9lWCYDnFT8OLPAqJU2KCalUJAZTG41nj698IKhPYl
         UhVxD6H3f97SgixnNTNzgSgWSAwydW7YWNgcJ7i94xE5KeD7te5EOq3PNRQZ/xX+Zipw
         QJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=398yp8gStmPSOAEwq2BGJsbk4ENAK9+knw6IjGc1Xvk=;
        b=UJTCjtMJDwxxaLKz2ESAwVQoidEAbfDkPbu7pX9zNcp0doe1RHOAq3JRoJjbYDLhv9
         bnizbRiU80I5Fl5ivzuCe4+VUuH+ii7bgWihPoxlJMFDTkE0rKZ4J/+AHKFCgIxizqzI
         aTFRX3dYdAlUFYqzOI5jmSlKMhqCI4cRIqVlINAkns9QpjaPgaD2repmtWitBV0nmluv
         zloOh66IR67KL9kCyD64xsz93auOVQnK48buXiSM14aSk5zQKjWWIBAu45tudonZj42Y
         tfonVSBjksfWm7CtwbJKJakTEhBBARBjA/pcQCRat6YEIOZLxTXrGmsQX80cjKp4T0b3
         LFzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RyVEOdhc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e23-v6si4362118qta.54.2018.08.20.23.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 23:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RyVEOdhc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs0R6-000611-BP
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 02:46:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0QQ-0005zg-7K
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0QM-0003Va-5G
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 02:45:58 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:37674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fs0QL-0003VK-TL; Tue, 21 Aug 2018 02:45:54 -0400
Received: by mail-ua1-x944.google.com with SMTP id y10-v6so11240745uao.4;
	Mon, 20 Aug 2018 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=398yp8gStmPSOAEwq2BGJsbk4ENAK9+knw6IjGc1Xvk=;
	b=RyVEOdhcyhfMzrQvRbipmibbx2IhJX82Md9V36RIM6Byrc6wO67MkWZF+iH9MHrw3x
	ZyRL6spcHM8SqD7miZWLiWxf1aHQ5SQpUT4fphmtJj1QjHElGb3UFHF0k9FsF8pYe5HX
	mc7mST55g2ZorvzkjZp8izKut8vdtBMiCtP19AQzyhtOStHIRWxDA1jQ+BIo2lu3/mSx
	TRt8QUH3fuCbGZ4+3wybaLXGRqey/oWMKdwW/0B6idDEDMgbzTutDWdIoOd2C7x3EEHI
	FLmxV37ZqZDEh6ScFlEv7DI2qFDT3qEE8OJMgNPC7+ayU+5DMon5DyzFM7gxMEDhPaR3
	mUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=398yp8gStmPSOAEwq2BGJsbk4ENAK9+knw6IjGc1Xvk=;
	b=oQTNSEj/seEJwOcQ+yShQl0N8xihj81jE+tlTlmOSteFMZYgDCu2EB78Qnjkcxp5/E
	bK37FHCVt4Av6ax7M2fgz4GD+69mP160xJGovo+2hlRAnbaGTz0s8S52o150o6L9z28B
	a5WqKeiRhkOqE4IF1Qz5nXsCo0c4g8YBMgCzLJ95siEtZn0089g/R4L4T89aC4NG8dGJ
	/6FONhG+GyS0+nKp0sBRHO6389HlYqzUHNf/BnV5W6NaZc5eUxOsRmYPIhEB0siW771c
	hsC6brpor178mkEgOMYCxn8mxGOTxVflT7Ted6Fek4B+kkjyafbHvGHJdFCcc+020FdE
	H5FQ==
X-Gm-Message-State: AOUpUlHdmuo1SaVxj8KORpq60hwXYJ+t24mANHAfntiH0MOtxx8YO/uP
	MQQfDV/FVIQT0Fpg7meV1o5aMirb
X-Received: by 2002:a9f:3acc:: with SMTP id
	q12-v6mr32171000uag.178.1534833953338; 
	Mon, 20 Aug 2018 23:45:53 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k12-v6sm922818vkf.4.2018.08.20.23.45.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 23:45:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-10-peter.maydell@linaro.org>
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
Message-ID: <21a97256-d88e-fa9d-4d1e-154ce2ee3a61@amsat.org>
Date: Tue, 21 Aug 2018 03:45:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-devel] [PATCH 09/22] hw/misc/iotkit-sysinfo: Implement
 IoTKit system information block
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nSLsZFlxexbZ

On 08/20/2018 11:11 AM, Peter Maydell wrote:
> Implement the IoTKit system control element's system information
> block; this is just a pair of read-only version/config registers,
> plus the usual PID/CID ID registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/misc/Makefile.objs            |   1 +
>  include/hw/misc/iotkit-sysinfo.h |  37 +++++++++
>  hw/misc/iotkit-sysinfo.c         | 128 +++++++++++++++++++++++++++++++
>  MAINTAINERS                      |   2 +
>  default-configs/arm-softmmu.mak  |   1 +
>  5 files changed, 169 insertions(+)
>  create mode 100644 include/hw/misc/iotkit-sysinfo.h
>  create mode 100644 hw/misc/iotkit-sysinfo.c
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ac1f3bc030c..af2b503824e 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -67,6 +67,7 @@ obj-$(CONFIG_TZ_MPC) += tz-mpc.o
>  obj-$(CONFIG_TZ_PPC) += tz-ppc.o
>  obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
>  obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
> +obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
>  
>  obj-$(CONFIG_PVPANIC) += pvpanic.o
>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
> diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
> new file mode 100644
> index 00000000000..7b2e1a5e48b
> --- /dev/null
> +++ b/include/hw/misc/iotkit-sysinfo.h
> @@ -0,0 +1,37 @@
> +/*
> + * ARM IoTKit system information block
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/*
> + * This is a model of the "system information block" which is part of the
> + * Arm IoTKit and documented in
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> + * QEMU interface:
> + *  + sysbus MMIO region 0: the system information register bank
> + */
> +
> +#ifndef HW_MISC_IOTKIT_SYSINFO_H
> +#define HW_MISC_IOTKIT_SYSINFO_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_IOTKIT_SYSINFO "iotkit-sysinfo"
> +#define IOTKIT_SYSINFO(obj) OBJECT_CHECK(IoTKitSysInfo, (obj), \
> +                                        TYPE_IOTKIT_SYSINFO)
> +
> +typedef struct IoTKitSysInfo {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +} IoTKitSysInfo;
> +
> +#endif
> diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
> new file mode 100644
> index 00000000000..78955bc45f5
> --- /dev/null
> +++ b/hw/misc/iotkit-sysinfo.c
> @@ -0,0 +1,128 @@
> +/*
> + * ARM IoTKit system information block
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/*
> + * This is a model of the "system information block" which is part of the
> + * Arm IoTKit and documented in
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> + * It consists of 2 read-only version/config registers, plus the
> + * usual ID registers.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/misc/iotkit-sysinfo.h"
> +
> +REG32(SYS_VERSION, 0x0)
> +REG32(SYS_CONFIG, 0x4)
> +REG32(PID4, 0xfd0)
> +REG32(PID5, 0xfd4)
> +REG32(PID6, 0xfd8)
> +REG32(PID7, 0xfdc)
> +REG32(PID0, 0xfe0)
> +REG32(PID1, 0xfe4)
> +REG32(PID2, 0xfe8)
> +REG32(PID3, 0xfec)
> +REG32(CID0, 0xff0)
> +REG32(CID1, 0xff4)
> +REG32(CID2, 0xff8)
> +REG32(CID3, 0xffc)
> +
> +/* PID/CID values */
> +static const int sysinfo_id[] = {
> +    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x58, 0xb8, 0x0b, 0x00, /* PID0..PID3 */
> +    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
> +};
> +
> +static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
> +                                    unsigned size)
> +{
> +    uint64_t r;
> +
> +    switch (offset) {
> +    case A_SYS_VERSION:
> +        r = 0x41743;
> +        break;
> +
> +    case A_SYS_CONFIG:
> +        r = 0x31;
> +        break;
> +    case A_PID4 ... A_CID3:
> +        r = sysinfo_id[(offset - A_PID4) / 4];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "IoTKit SysInfo read: bad offset %x\n", (int)offset);
> +        r = 0;
> +        break;
> +    }
> +    trace_iotkit_sysinfo_read(offset, r, size);
> +    return r;
> +}
> +
> +static void iotkit_sysinfo_write(void *opaque, hwaddr offset,
> +                                 uint64_t value, unsigned size)
> +{
> +    trace_iotkit_sysinfo_write(offset, value, size);
> +
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "IoTKit SysInfo: write to RO offset 0x%x\n", (int)offset);
> +}
> +
> +static const MemoryRegionOps iotkit_sysinfo_ops = {
> +    .read = iotkit_sysinfo_read,
> +    .write = iotkit_sysinfo_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    /* byte/halfword accesses are just zero-padded on reads and writes */
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void iotkit_sysinfo_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    IoTKitSysInfo *s = IOTKIT_SYSINFO(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &iotkit_sysinfo_ops,
> +                          s, "iotkit-sysinfo", 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
> +{
> +    /*
> +     * This device has no guest-modifiable state and so it
> +     * does not need a reset function or VMState.
> +     */
> +}
> +
> +static const TypeInfo iotkit_sysinfo_info = {
> +    .name = TYPE_IOTKIT_SYSINFO,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IoTKitSysInfo),
> +    .instance_init = iotkit_sysinfo_init,
> +    .class_init = iotkit_sysinfo_class_init,
> +};
> +
> +static void iotkit_sysinfo_register_types(void)
> +{
> +    type_register_static(&iotkit_sysinfo_info);
> +}
> +
> +type_init(iotkit_sysinfo_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea35aa2cca5..cb780f463cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -541,6 +541,8 @@ F: hw/arm/iotkit.c
>  F: include/hw/arm/iotkit.h
>  F: hw/misc/iotkit-sysctl.c
>  F: include/hw/misc/iotkit-sysctl.h
> +F: hw/misc/iotkit-sysinfo.c
> +F: include/hw/misc/iotkit-sysinfo.h
>  
>  Musicpal
>  M: Jan Kiszka <jan.kiszka@web.de>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 79aac7702a9..ebbdcb29f38 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -115,6 +115,7 @@ CONFIG_TZ_PPC=y
>  CONFIG_IOTKIT=y
>  CONFIG_IOTKIT_SECCTL=y
>  CONFIG_IOTKIT_SYSCTL=y
> +CONFIG_IOTKIT_SYSINFO=y
>  
>  CONFIG_VERSATILE=y
>  CONFIG_VERSATILE_PCI=y
> 
