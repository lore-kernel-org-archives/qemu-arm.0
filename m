Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp766615wrd;
        Fri, 17 Aug 2018 17:27:22 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPztQJghpMO1Cplu40jf4/p7VuMpxp1HW2oSgKeYVNAAJNKVJ5D2+kdtZ7EmcrRRLPbP0MlY
X-Received: by 2002:aed:3e14:: with SMTP id l20-v6mr36049400qtf.62.1534552042445;
        Fri, 17 Aug 2018 17:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534552042; cv=none;
        d=google.com; s=arc-20160816;
        b=rWtdahwyPwlLG77bgHOPFYThyDLpvX0dWDilv8cXgz7PqMDykYLGiMQO3IQQ5+NW74
         eQLFUEzyiQZNRWPzf6KCG96QyaD2vn6qxPuXe1qNdSVf9fkPh+xYUYfEtSPgii9m5gTK
         YZtMYigMefbH+UBklkjNrppK+dKZddCSQiGHwQkc0JQVoSiZNCuUIP//axEGzhaEUyP4
         PTZz/zdk13j8HzANkKYDQm3t6Ew05wk2Xr/EMvyUY8stWX6s5M0CRb25PI38YqMfvL+0
         jCbAf8uz70vz5N6aqjuVSOa1Uo1cv6vjh9W5mn8lj0c0fHyRL39KD2vPZcMh3IUFNObL
         6KRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=gjY8bmvATF+9TXeS2OVmhYUX1UhkRQraib10CNc60WA=;
        b=lS13Yr3wQKPqESaoXaosRXWrj1OfPVZIJxORx435OUWIORdeDS+bU7msZZm2Rm7nOL
         dcGpCM/B6hCPZVGQnsPVu6Ac2Ubm+pMgHO3VvVTmHjkiz5rr5/XtYlXt6TKE95OjRmve
         IahxfeHk62jfTH+6Os8tePWjD6m91Y4t4uHPNar2wM7sbyNst76vObN0CJKwnh/8u5H9
         zzPPhpA1lVwdzX2ts2/OKojyW69en7fpmI9yUC6XFAKAgH0nGuW/9ciqmKuf4r72AM8d
         K/otgjTtfLzA94mR+KIY2AFvR4DmMh3fy79pg8PD/HQnwo7vPAnvupVP9vfCMAZzkAwD
         GVsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CQUCNFZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g38-v6si901860qvg.205.2018.08.17.17.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 17:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CQUCNFZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqp5N-0002Hg-S3
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 20:27:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqp5B-0002Es-JJ
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 20:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqp1c-0001qy-BG
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 20:23:30 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:38478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqp1Y-0001jm-Pz; Fri, 17 Aug 2018 20:23:24 -0400
Received: by mail-ua1-x943.google.com with SMTP id o11-v6so6747828uak.5;
	Fri, 17 Aug 2018 17:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gjY8bmvATF+9TXeS2OVmhYUX1UhkRQraib10CNc60WA=;
	b=CQUCNFZUhshCarkul42IPQJPXqNQa3DV+YoqFR8bOgzcf7tb4SQ/VDTV0TR3+E1BEX
	i2KSUbGTvSUCQfhDYEwZwq5f/TrKUdHqwhG0i7v21xCEeATRqlWK3LeeTQnR9qoSUDhF
	VSBUKjt4TlDhvcFGNT9soE9XI8euvDfnCHf+9PT6e8cSAbDh5MbLO9KRJiDpWZyrNFSj
	X6tMBIzS6qaY8Ph30Zp++ipeFJOmnKgegiNkiTFyYRhe8p+FS/7R06DZy/uiw+vciDAK
	nKO/RsWkoQXs/XFf81oykyj7zg8wsksJaHDNA/Tf5IQaYN6kFxlicGeYPxsL34KSOzUw
	4g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gjY8bmvATF+9TXeS2OVmhYUX1UhkRQraib10CNc60WA=;
	b=hVArIb2+2aHsilgMT4aRZGIxBPVbpCzAfJ6CDzkRzxNpJci9wTAt+CXAeoWQtBy2gR
	Xt0xnliGftGRSSEvNdbyKM4OUrFSSCT+Unf+LNuwoW6ErjWHL0zo2fZDRrGCgfjHAiPW
	k7XQ+Hnn5UeRKRemCtdWwhLuTkUG7GnRx81ijJqrc4LsuYO7w+Ifd9R63uoS7iym5+PL
	3uVto7fX+t+vq3qLHhv23h6HiFVrb+AI8nfMzKX2tgnwsyqSRTcovEgLD/iY29KJz4FY
	JiLK1tipMti+sKiauG7+WcYQxnGocxVnN+OIZ7/fre0ArzQg5lieSDT6Wf262oaX9m3A
	j/lg==
X-Gm-Message-State: AOUpUlG/co8I88m+6eq0qGDPxNeQfYdWzYk+bNiTstQyMNpjFzLPkgxL
	pHqH6z+fipZ4hZ5+dimUtqA=
X-Received: by 2002:ab0:2687:: with SMTP id
	t7-v6mr24581925uao.195.1534551803954; 
	Fri, 17 Aug 2018 17:23:23 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w7-v6sm898432uaa.33.2018.08.17.17.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 17:23:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-6-peter.maydell@linaro.org>
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
Message-ID: <34fd5e4b-4b39-65be-d1e9-a655f656dbc9@amsat.org>
Date: Fri, 17 Aug 2018 21:23:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::943
Subject: Re: [Qemu-arm] [PATCH 05/16] hw/misc/iotkit-sysctl: Implement
 IoTKit system control element
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
X-TUID: rT79oWattFN6

Hi Peter,

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The Arm IoTKit includes a system control element which
> provides a block of read-only ID registers and a block
> of read-write control registers. Implement a minimal
> version of this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/iotkit-sysctl.h |  50 +++++
>  hw/misc/iotkit-sysctl.c         | 324 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   7 +
>  6 files changed, 385 insertions(+)
>  create mode 100644 include/hw/misc/iotkit-sysctl.h
>  create mode 100644 hw/misc/iotkit-sysctl.c
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 93509008451..dbadb41d57a 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -65,6 +65,7 @@ obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
>  obj-$(CONFIG_TZ_MPC) += tz-mpc.o
>  obj-$(CONFIG_TZ_PPC) += tz-ppc.o
>  obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
> +obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
>  
>  obj-$(CONFIG_PVPANIC) += pvpanic.o
>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
> diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
> new file mode 100644
> index 00000000000..c3b14ccee4c
> --- /dev/null
> +++ b/include/hw/misc/iotkit-sysctl.h
> @@ -0,0 +1,50 @@
> +/*
> + * ARM IoTKit system control element
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
> + * This is a model of the "system control element" which is part of the
> + * Arm IoTKit and documented in
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> + * Specifically, it implements the "system information block" and
> + * "system control register" blocks.
> + *
> + * QEMU interface:
> + *  + sysbus MMIO region 0: the system information register bank
> + *  + sysbus MMIO region 1: the system control register bank
> + */
> +
> +#ifndef HW_MISC_IOTKIT_SYSCTL_H
> +#define HW_MISC_IOTKIT_SYSCTL_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_IOTKIT_SYSCTL "iotkit-sysctl"
> +#define IOTKIT_SYSCTL(obj) OBJECT_CHECK(IoTKitSysCtl, (obj), \
> +                                        TYPE_IOTKIT_SYSCTL)
> +
> +typedef struct IoTKitSysCtl {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion sysinfo_iomem;
> +    MemoryRegion sysctl_iomem;
> +
> +    uint32_t secure_debug;
> +    uint32_t reset_syndrome;
> +    uint32_t reset_mask;
> +    uint32_t gretreg;
> +    uint32_t initsvrtor0;
> +    uint32_t cpuwait;
> +    uint32_t wicctrl;
> +} IoTKitSysCtl;
> +
> +#endif
> diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
> new file mode 100644
> index 00000000000..9445500be76
> --- /dev/null
> +++ b/hw/misc/iotkit-sysctl.c
> @@ -0,0 +1,324 @@
> +/*
> + * ARM IoTKit system control element
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
> + * This is a model of the "system control element" which is part of the
> + * Arm IoTKit and documented in
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> + * Specifically, it implements the "system information block" and
> + * "system control register" blocks.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "qapi/error.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/misc/iotkit-sysctl.h"
> +
> +/* sysinfo block registers */
> +REG32(SYS_VERSION, 0x0)
> +REG32(SYS_CONFIG, 0x4)

I find it a bit confuse to have the both SYSINFO/SYSCONTROL in the same
"iotkit-sysctl" device. They share the same state but there is no
particular need for it, then you need connect them as 2 different
devices in iotkit_realize but they have the same name "iotkit-sysctl".

Why not declare 2 different TypeInfo? I am probably missing what state
they need to share.

> +
> +/* sysctl block registers */
> +REG32(SECDBGSTAT, 0x0)
> +REG32(SECDBGSET, 0x4)
> +REG32(SECDBGCLR, 0x8)
> +REG32(RESET_SYNDROME, 0x100)
> +REG32(RESET_MASK, 0x104)
> +REG32(SWRESET, 0x108)
> +    FIELD(SWRESET, SWRESETREQ, 9, 1)
> +REG32(GRETREG, 0x10c)
> +REG32(INITSVRTOR0, 0x110)
> +REG32(CPUWAIT, 0x118)
> +REG32(BUSWAIT, 0x11c)
> +REG32(WICCTRL, 0x120)
> +
> +/* PID registers, same offset in both blocks */
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
> +static const int sysctl_id[] = {
> +    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x54, 0xb8, 0x0b, 0x00, /* PID0..PID3 */
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

(superfluous newline)

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
> +static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
> +                                    unsigned size)
> +{
> +    IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
> +    uint64_t r;
> +
> +    switch (offset) {
> +    case A_SECDBGSTAT:
> +        r = s->secure_debug;
> +        break;
> +    case A_RESET_SYNDROME:
> +        r = s->reset_syndrome;
> +        break;
> +    case A_RESET_MASK:
> +        r = s->reset_mask;
> +        break;
> +    case A_GRETREG:
> +        r = s->gretreg;
> +        break;
> +    case A_INITSVRTOR0:
> +        r = s->initsvrtor0;
> +        break;
> +    case A_CPUWAIT:
> +        r = s->cpuwait;
> +        break;
> +    case A_BUSWAIT:
> +        /* In IoTKit BUSWAIT is reserved, R/O, zero */
> +        r = 0;
> +        break;
> +    case A_WICCTRL:
> +        r = s->wicctrl;
> +        break;
> +    case A_PID4 ... A_CID3:
> +        r = sysctl_id[(offset - A_PID4) / 4];
> +        break;
> +    case A_SECDBGSET:
> +    case A_SECDBGCLR:
> +    case A_SWRESET:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "IoTKit SysCtl read: read of WO offset %x\n",
> +                      (int)offset);
> +        r = 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "IoTKit SysCtl read: bad offset %x\n", (int)offset);
> +        r = 0;
> +        break;
> +    }
> +    trace_iotkit_sysctl_read(offset, r, size);
> +    return r;
> +}
> +
> +static void iotkit_sysctl_write(void *opaque, hwaddr offset,
> +                                 uint64_t value, unsigned size)
> +{
> +    IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
> +
> +    trace_iotkit_sysctl_write(offset, value, size);
> +
> +    /*
> +     * Most of the state here has to do with control of reset and
> +     * similar kinds of power up -- for instance the guest can ask
> +     * what the reason for the last reset was, or forbid reset for
> +     * some causes (like the non-secure watchdog). Most of this is
> +     * not relevant to QEMU, which doesn't really model anything other
> +     * than a full power-on reset.
> +     * We just model the registers as reads-as-written.
> +     */
> +
> +    switch (offset) {
> +    case A_RESET_SYNDROME:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "IoTKit SysCtl RESET_SYNDROME unimplemented\n");

Maybe warn_report() or warn_once() is more appropriate than UNIMP?

> +        s->reset_syndrome = value;
> +        break;
> +    case A_RESET_MASK:
> +        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl RESET_MASK unimplemented\n");

Ditto.

> +        s->reset_mask = value;
> +        break;
> +    case A_GRETREG:
> +        /*
> +         * General retention register, which is only reset by a power-on
> +         * reset. Technically this implementation is complete, since
> +         * QEMU only supports power-on resets...
> +         */
> +        s->gretreg = value;
> +        break;
> +    case A_INITSVRTOR0:
> +        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl INITSVRTOR0 unimplemented\n");
> +        s->initsvrtor0 = value;
> +        break;
> +    case A_CPUWAIT:
> +        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CPUWAIT unimplemented\n");
> +        s->cpuwait = value;
> +        break;
> +    case A_WICCTRL:
> +        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl WICCTRL unimplemented\n");
> +        s->wicctrl = value;
> +        break;
> +    case A_SECDBGSET:
> +        /* write-1-to-set */
> +        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SECDBGSET unimplemented\n");
> +        s->secure_debug |= value;
> +        break;
> +    case A_SECDBGCLR:
> +        /* write-1-to-clear */
> +        s->secure_debug &= ~value;
> +        break;
> +    case A_SWRESET:
> +        /* One w/o bit to request a reset; all other bits reserved */
> +        if (value & R_SWRESET_SWRESETREQ_MASK) {
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        }

Shouldn't this be:

           } else {
               cpu_reset(...);
           }

> +        break;
> +    case A_BUSWAIT:        /* In IoTKit BUSWAIT is reserved, R/O, zero */
> +    case A_SECDBGSTAT:
> +    case A_PID4 ... A_CID3:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "IoTKit SysCtl write: write of RO offset %x\n",
> +                      (int)offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "IoTKit SysCtl write: bad offset %x\n", (int)offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps iotkit_sysctl_ops = {
> +    .read = iotkit_sysctl_read,
> +    .write = iotkit_sysctl_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    /* byte/halfword accesses are just zero-padded on reads and writes */
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void iotkit_sysctl_reset(DeviceState *dev)
> +{
> +    IoTKitSysCtl *s = IOTKIT_SYSCTL(dev);
> +
> +    trace_iotkit_sysctl_reset();
> +    s->secure_debug = 0;
> +    s->reset_syndrome = 1;
> +    s->reset_mask = 0;
> +    s->gretreg = 0;
> +    s->initsvrtor0 = 0x10000000;

This one could be a property (now now ;) ).

> +    s->cpuwait = 0;
> +    s->wicctrl = 0;
> +}
> +
> +static void iotkit_sysctl_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    IoTKitSysCtl *s = IOTKIT_SYSCTL(obj);
> +
> +    memory_region_init_io(&s->sysinfo_iomem, obj, &iotkit_sysinfo_ops,
> +                          s, "iotkit-sysinfo", 0x1000);
> +    memory_region_init_io(&s->sysctl_iomem, obj, &iotkit_sysctl_ops,
> +                          s, "iotkit-sysctl", 0x1000);
> +    sysbus_init_mmio(sbd, &s->sysinfo_iomem);
> +    sysbus_init_mmio(sbd, &s->sysctl_iomem);
> +}
> +
> +static const VMStateDescription iotkit_sysctl_vmstate = {
> +    .name = "iotkit-sysctl",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(secure_debug, IoTKitSysCtl),
> +        VMSTATE_UINT32(reset_syndrome, IoTKitSysCtl),
> +        VMSTATE_UINT32(reset_mask, IoTKitSysCtl),
> +        VMSTATE_UINT32(gretreg, IoTKitSysCtl),
> +        VMSTATE_UINT32(initsvrtor0, IoTKitSysCtl),
> +        VMSTATE_UINT32(cpuwait, IoTKitSysCtl),
> +        VMSTATE_UINT32(wicctrl, IoTKitSysCtl),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void iotkit_sysctl_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &iotkit_sysctl_vmstate;
> +    dc->reset = iotkit_sysctl_reset;
> +}
> +
> +static const TypeInfo iotkit_sysctl_info = {
> +    .name = TYPE_IOTKIT_SYSCTL,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IoTKitSysCtl),
> +    .instance_init = iotkit_sysctl_init,
> +    .class_init = iotkit_sysctl_class_init,
> +};
> +
> +static void iotkit_sysctl_register_types(void)
> +{
> +    type_register_static(&iotkit_sysctl_info);
> +}
> +
> +type_init(iotkit_sysctl_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7ea39c0176b..96fe011e952 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -537,6 +537,8 @@ F: hw/misc/mps2-*.c
>  F: include/hw/misc/mps2-*.h
>  F: hw/arm/iotkit.c
>  F: include/hw/arm/iotkit.h
> +F: hw/misc/iotkit-sysctl.c
> +F: include/hw/misc/iotkit-sysctl.h
>  
>  Musicpal
>  M: Jan Kiszka <jan.kiszka@web.de>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 521c3d459fa..da59b820a4f 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -114,6 +114,7 @@ CONFIG_TZ_MPC=y
>  CONFIG_TZ_PPC=y
>  CONFIG_IOTKIT=y
>  CONFIG_IOTKIT_SECCTL=y
> +CONFIG_IOTKIT_SYSCTL=y
>  
>  CONFIG_VERSATILE=y
>  CONFIG_VERSATILE_PCI=y
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index c956e1419b7..83ab58c30f5 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -109,3 +109,10 @@ iotkit_secctl_s_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit Sec
>  iotkit_secctl_ns_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs read: offset 0x%x data 0x%" PRIx64 " size %u"
>  iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
>  iotkit_secctl_reset(void) "IoTKit SecCtl: reset"
> +
> +# hw/misc/iotkit-sysctl.c
> +iotkit_sysinfo_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysInfo read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysInfo write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
> 
