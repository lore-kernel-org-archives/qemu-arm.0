Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2671737wru;
        Thu, 9 Aug 2018 22:28:22 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz8WUDgxL1RvSYUwGHFSZt8V34pv35kAPXYnTdMREYadiXaQh4K6mdKGdMat8V+0dX/DTWQ
X-Received: by 2002:aed:3b06:: with SMTP id p6-v6mr2957753qte.13.1533878902574;
        Thu, 09 Aug 2018 22:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533878902; cv=none;
        d=google.com; s=arc-20160816;
        b=Bx5IUqX+KVDH952q9EMspOuXyDYO32AY8vikMa5bNI0XZHCvJT+T60rVctdJzuAqwz
         rO0obG7zQwbaWV0Ntt7c/MFllOSzEZwUxOySjkbVCRzrt7/LTq1yMLHA+rzgQxgREA5p
         3AdWy3oTeGJm9Dj0Vn9z0AoZRz3BfSQLH1oD1u2HkkBb3NV0HPY9hd4yfY10a+QJb6c6
         rgGtmne9G6xyR7yws2z7wUwrWI+YxDaArZEV3okI96BK1blYlkGWxU0LAXJYZeKLhbSN
         Af/R9wMWOlZY/nDFU5oRIhnbsn9Wve/iRsHuXnDLBoSWcIa/8gfsfBft4kJiKHdxSxrQ
         weXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=72lIiyAsxl2itSe3y8AycOnynZ556x4jl5aRZYjwvjI=;
        b=ijgpM34idIRP+ABZH/1nE55RWbrKC8S+XGhHJ3VyzxG12LVfUEhlcbcivzbq5YwNQy
         aG/NTu5B1FlsX5PI/Qj5QAyClA2r1j5s8Zwqq/ZUD19oMaHqlw3ijg7UcrzXdw7dkpB9
         e1pGGD+XsuCauxSatxhWGTnaHfmUGmT6FQbJY8btAMWFvfgeRMoxdqVUDKzV2CVKYPBV
         pt3KoC37ouLdINTfoD7fA+TjPVOeOiTHt3q8a5ZBf5SNGtO8aqXb4sY/cbMrwWJm3bPi
         i3+v5aQzSCB8hy9Gt+yloDcrvEAmtQc8SO444HsrHLDyYRIVi1zrx2e0OO/cWC6MF6x5
         zbKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="JaBrcKF/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17-v6si1591842qvj.275.2018.08.09.22.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="JaBrcKF/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzyH-0005nz-T3
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:28:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzxJ-0005Tu-I2
	for qemu-devel@nongnu.org; Fri, 10 Aug 2018 01:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzxG-0005Rq-BN
	for qemu-devel@nongnu.org; Fri, 10 Aug 2018 01:27:21 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:41758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzxG-0005Qh-5W; Fri, 10 Aug 2018 01:27:18 -0400
Received: by mail-ua1-x934.google.com with SMTP id h1-v6so684980uao.8;
	Thu, 09 Aug 2018 22:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=72lIiyAsxl2itSe3y8AycOnynZ556x4jl5aRZYjwvjI=;
	b=JaBrcKF/hHEBikLayeL0crtg2vJhtF7R1sxlL6rrwIeAYnJGmcwpOmbbCIlzCUEEv+
	nUyEuw1g0IOirryWmQDcvwTyGD6cUWZM2HbVC3OdCK8C9Sh+OagOoJycD9KUFwgh+Y7V
	juj3ZobKhnATxLzpr4rhwAzffdNdR23BCwwna8vl+6PDKi4gILUtTya9GtONwhIgEspu
	Xs3cIwKSwuhm6G08fIXepHF4RGJEl6QinrkbObjnEf67d3O9qAQB5mSTKCe5K2rTI2HU
	nFPmlWQw3j2fvLlP/eorqkRBBZViqPWf8gIgCqa83GY8AFKPK+HXADM24WDf3XfkMRFH
	4xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=72lIiyAsxl2itSe3y8AycOnynZ556x4jl5aRZYjwvjI=;
	b=Rg/w9sPPLqNW7KdLPCYH6TIp048Ebe9zZMQDmkRZhQ92lR2gjrW6CYxLSWsFfR+ss5
	a/37nm+yzYVeVyMgUR8MgG2Jpd9PM+cuTVpPa32ZVNUOPfwZwAqdzXPGmRSpp68gzZCC
	4UM8k0tny5xUOeKRj8WR/pqqHQWM2R4+HuvKXckzjWYBV+rhXLf5mr/9t3SwC0VV72CX
	VVGGHdSP55HTEhr4LifUAHkGVIOdoLtU1iGVHj0g+CD8uYCgU6jFRDR8KiwAKfMlV8+O
	QSi7yyb+R51cZuZ91xIaQEO0/j21g8+6+UTH+66k3Nhy1j2ayLUdCBz1QplyxSNdJNip
	yl2Q==
X-Gm-Message-State: AOUpUlFn0ix0iU9WZzTOuS4pbteW8YKtwsU4w+hXIqG9uxeXWpd7DPoO
	TUrjIYnlwhJlYj5f45qjJHs=
X-Received: by 2002:ab0:4eef:: with SMTP id
	x47-v6mr3390488uah.23.1533878837483; 
	Thu, 09 Aug 2018 22:27:17 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm1311489uao.5.2018.08.09.22.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:27:16 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-11-peter.maydell@linaro.org>
	<b16ded66-e814-43f4-389f-65e697660740@amsat.org>
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
Message-ID: <fd82c9db-1ecd-a833-8eab-0060647c2220@amsat.org>
Date: Fri, 10 Aug 2018 02:27:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b16ded66-e814-43f4-389f-65e697660740@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::934
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 10/16] hw/dma/pl080: Allow use
 as embedded-struct device
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
X-TUID: gVvHGF9Zt/w7

On 08/10/2018 02:18 AM, Philippe Mathieu-Daudé wrote:
> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>> Create a new include file for the pl081's device struct,
>> type macros, etc, so that it can be instantiated using
>> the "embedded struct" coding style.
[...]
>> +#ifndef HW_DMA_PL080_H
>> +#define HW_DMA_PL080_H
>> +
>> +#include "hw/sysbus.h"
>> +
>> +#define PL080_MAX_CHANNELS 8
>> +
>> +typedef struct {
>> +    uint32_t src;
>> +    uint32_t dest;
>> +    uint32_t lli;
>> +    uint32_t ctrl;
>> +    uint32_t conf;
>> +} pl080_channel;
>> +
>> +#define TYPE_PL080 "pl080"
>> +#define TYPE_PL081 "pl081"
>> +#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
> 
> The PL080() macro can stay in the source.

Oh this respect the "coding style" indeed.
Can you add the PL081() companion? Thanks.

> 
> Regardless:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> +
>> +typedef struct PL080State {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +    uint8_t tc_int;
>> +    uint8_t tc_mask;
>> +    uint8_t err_int;
>> +    uint8_t err_mask;
>> +    uint32_t conf;
>> +    uint32_t sync;
>> +    uint32_t req_single;
>> +    uint32_t req_burst;
>> +    pl080_channel chan[PL080_MAX_CHANNELS];
>> +    int nchannels;
>> +    /* Flag to avoid recursive DMA invocations.  */
>> +    int running;
>> +    qemu_irq irq;
>> +} PL080State;
>> +
>> +#endif
>> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
>> index 7724c93b8f2..0f79c2d8a6c 100644
>> --- a/hw/dma/pl080.c
>> +++ b/hw/dma/pl080.c
>> @@ -11,8 +11,8 @@
>>  #include "hw/sysbus.h"
>>  #include "exec/address-spaces.h"
>>  #include "qemu/log.h"
>> +#include "hw/dma/pl080.h"
>>  
>> -#define PL080_MAX_CHANNELS 8
>>  #define PL080_CONF_E    0x1
>>  #define PL080_CONF_M1   0x2
>>  #define PL080_CONF_M2   0x4
>> @@ -30,36 +30,6 @@
>>  #define PL080_CCTRL_D   0x02000000
>>  #define PL080_CCTRL_S   0x01000000
>>  
>> -typedef struct {
>> -    uint32_t src;
>> -    uint32_t dest;
>> -    uint32_t lli;
>> -    uint32_t ctrl;
>> -    uint32_t conf;
>> -} pl080_channel;
>> -
>> -#define TYPE_PL080 "pl080"
>> -#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
>> -
>> -typedef struct PL080State {
>> -    SysBusDevice parent_obj;
>> -
>> -    MemoryRegion iomem;
>> -    uint8_t tc_int;
>> -    uint8_t tc_mask;
>> -    uint8_t err_int;
>> -    uint8_t err_mask;
>> -    uint32_t conf;
>> -    uint32_t sync;
>> -    uint32_t req_single;
>> -    uint32_t req_burst;
>> -    pl080_channel chan[PL080_MAX_CHANNELS];
>> -    int nchannels;
>> -    /* Flag to avoid recursive DMA invocations.  */
>> -    int running;
>> -    qemu_irq irq;
>> -} PL080State;
>> -
>>  static const VMStateDescription vmstate_pl080_channel = {
>>      .name = "pl080_channel",
>>      .version_id = 1,
>> @@ -408,7 +378,7 @@ static const TypeInfo pl080_info = {
>>  };
>>  
>>  static const TypeInfo pl081_info = {
>> -    .name          = "pl081",
>> +    .name          = TYPE_PL081,
>>      .parent        = TYPE_PL080,
>>      .instance_init = pl081_init,
>>  };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5d1a3645dd4..92ccca716c6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -444,6 +444,7 @@ F: hw/char/pl011.c
>>  F: include/hw/char/pl011.h
>>  F: hw/display/pl110*
>>  F: hw/dma/pl080.c
>> +F: include/hw/dma/pl080.h
>>  F: hw/dma/pl330.c
>>  F: hw/gpio/pl061.c
>>  F: hw/input/pl050.c
>>
