Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp907614wru;
        Fri, 27 Jul 2018 09:39:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpevEd6VESPMgO64qrA8dQSysoGFEsK9BhHHNNuLNhobk7MVZqTzSsFSpxz9V7WucahWBD2/
X-Received: by 2002:a37:109d:: with SMTP id 29-v6mr6224055qkq.315.1532709571676;
        Fri, 27 Jul 2018 09:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532709571; cv=none;
        d=google.com; s=arc-20160816;
        b=CqssAfLXamy7amU0L+n6xNQytnL3gqgxk2W+c67sFc/jlF+e3HyBWIHl3w9v6d7LJ9
         0dFyPP+MvvC93ybPxEY3YAdXyV9DNkxIQa583OquHXDyEmY0+A4xXunhqUxaRTz0cVWJ
         +nu1OV6JhMPKmzFPq0kBkZPCNR8VPikNYedLKWMXot9LfiHv2rueYsUsxrg5qjYfI4BF
         XwLJFlra6E/HMudBIl6zJiOgQs15BlFdRE/oL5iWtkXxDNN7ovQX5KlpuVHA2ovyb6Nn
         q0GA/tqFU1iLSXwVOgUGejoFLwGTnIuyj+VUvaiOOjvK7S79mbZZpxumNfd9JrLco8NN
         ZtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=QVX14G9LQUASR3wJUVKKrNVByiEnUPxa4sYLaMueB1I=;
        b=nJXHtFHutVYzI2oHy7jZqRu8IMI7FB4n1REGsBQJJasVZodMVIu6nU7iZZi9O07g/p
         0ITnYdUd6u1tOHHYBcDGVCLs5WebKbJ1Atpc66OGvJ694JIvHeangQhwgtRbKI0EDKQ6
         hzS33Iw5KLSIImR4zqszhs/hXdc9yZYMJMkYWKB/xD8HwQ63e3soTp3DhGWR0kBf72vt
         juLrn1SAFjq4fXdW1URcWcn6YvxqhJclKsJTLtlXFWFai3AqzDFAUJluja4Czr3m5lyO
         bG3Mq1DXDMwtpicpT4cTqLigS3qJmlet80LhOCQ/ZdwvaAtXiLRb94aLSdn1EUMuorQ5
         rtsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Jgv4pjW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g14-v6si2220395qta.90.2018.07.27.09.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 09:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Jgv4pjW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj5m7-0001Xy-7G
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 12:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj5lu-0001Xh-MN
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 12:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj5lp-0006xb-OG
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 12:39:18 -0400
Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244]:33804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj5lp-0006xQ-II; Fri, 27 Jul 2018 12:39:13 -0400
Received: by mail-ua0-x244.google.com with SMTP id r10-v6so3742292uao.1;
	Fri, 27 Jul 2018 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QVX14G9LQUASR3wJUVKKrNVByiEnUPxa4sYLaMueB1I=;
	b=Jgv4pjW/E8GmcoFKSposIo+m6MiJsEPuO8zedeQN7KAoC01OITE00pmd1SBWmXDojT
	N5MuZXMbx+S95nBPWrLkW8/68oY35YtvoFCqRY+KDSmOwY2boKNU5Cgnlkdy+3sNRNGS
	kAQ28JZ0nTFx90oWgliLfcwUEMA3ilVSjVVZhwNkeMi60d7MrK8Ne07s/kTgvlL2NuUI
	PGaxkwybbgijPr9IgtR+XOI/OilTGZf4EHTzOc35CbASQe8nl+REFfRGPZVfbjS++BEa
	HErr8ZmJV1XMTAFyZ8lXiSCybZeTSdNMhmDvdIdXspvqVnXi/yb9mys7D6HuZBUuKHkH
	C94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QVX14G9LQUASR3wJUVKKrNVByiEnUPxa4sYLaMueB1I=;
	b=oY/Fz/VSKblNbugG0u10JNy2vPsHUcLZcEuqrA9IrME8G7lKIzNn40xcuunG1IF5aq
	aJVLYyjdxo3z+ZmfEDlpA5styYpIHEA5Dn5yeexSIwPadXiLkDtZCKhe7HzMg4LrtF9L
	Sbq+Eg+73MtLUzvYu9LP49aaVNNz5cyek3clcZrUgJw9hyTQsFoSD0v5oatQUmUdR84v
	3lfgLFi9xtgjq/yJx1Q+zIcKGo5iZyLoVm7sCH/CwOav3Ql8S+AG+97JGoZq19xIjbxu
	t4CMVNd++OqFXuHs7dQHwCT90dtoiI5yHPTKXaDsPec1u5fVPxzR7fe9SqUypaIsG1Rb
	bWcw==
X-Gm-Message-State: AOUpUlFTIGqPu8o+DY77A3yT0kyB+8nlrcvHelmb3VeIsEZbrRHRDUup
	1o7W8QsH7MSQBWFSp823pxQ=
X-Received: by 2002:ab0:6654:: with SMTP id
	b20-v6mr5270304uaq.193.1532709552742; 
	Fri, 27 Jul 2018 09:39:12 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w62-v6sm1166335vkf.21.2018.07.27.09.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 09:39:11 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <cover.1532701430.git.damien.hedde@greensocs.com>
	<2b92ae960dfc47149945c9e47f90b4433d8eee35.1532701430.git.damien.hedde@greensocs.com>
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
Message-ID: <155529c9-2847-0f30-9277-6b2c8bb31b78@amsat.org>
Date: Fri, 27 Jul 2018 13:39:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2b92ae960dfc47149945c9e47f90b4433d8eee35.1532701430.git.damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::244
Subject: Re: [Qemu-arm] [RFC PATCH 2/6] qdev: add power/clock gating control
 on bus tree
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6k2ywV9gujzv

Hi Damien,

On 07/27/2018 11:37 AM, Damien Hedde wrote:
> Add functions [qdev|qbus]_set_[power|clock]_all(_fn).
> Theses allow to control power and clock gating along a bus hierarchy.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  include/hw/qdev-core.h | 20 +++++++++++++++++
>  hw/core/qdev.c         | 51 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 659287e185..607c367738 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -464,4 +464,24 @@ void device_set_power(DeviceState *dev, bool en);
>   */
>  void device_set_clock(DeviceState *dev, bool en);
>  
> +/**
> + * qdev/qbus_set_power_all(_fn)
> + * Enable/Disable the power of a tree starting
> + * at given device or bus
> + */
> +void qdev_set_power_all(DeviceState *dev, bool en);
> +void qdev_set_power_all_fn(void *opaque, bool en);
> +void qbus_set_power_all(BusState *bus, bool en);
> +void qbus_set_power_all_fn(void *opaque, bool en);

I think we don't need the _fn() functions, most of the current codebase
directly use DEVICE(x) or BUS(x) to casts.

> +
> +/**
> + * qdev/qbus_set_clock_all(_fn)
> + * Enable/Disable the clock of a tree starting
> + * at given device or bus
> + */
> +void qdev_set_clock_all(DeviceState *dev, bool en);
> +void qdev_set_clock_all_fn(void *opaque, bool en);
> +void qbus_set_clock_all(BusState *bus, bool en);
> +void qbus_set_clock_all_fn(void *opaque, bool en);
> +
>  #endif
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index bb6d36eab9..24b90bd45f 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1138,6 +1138,57 @@ void device_set_clock(DeviceState *dev, bool en)
>      }
>  }
>  
> +static int qdev_set_power_one(DeviceState *dev, void *opaque)
> +{
> +    device_set_power(dev, *((bool *)opaque));
> +    return 0;
> +}
> +
> +void qdev_set_power_all(DeviceState *dev, bool en)
> +{
> +    qdev_walk_children(dev, NULL, NULL, qdev_set_power_one, NULL, &en);
> +}
> +
> +void qdev_set_power_all_fn(void *opaque, bool en)
> +{
> +    qdev_set_power_all(DEVICE(opaque), en);
> +}
> +
> +void qbus_set_power_all(BusState *bus, bool en)
> +{
> +    qbus_walk_children(bus, NULL, NULL, qdev_set_power_one, NULL, &en);
> +}
> +
> +void qbus_set_power_all_fn(void *opaque, bool en)
> +{
> +    qbus_set_power_all(BUS(opaque), en);
> +}
> +
> +static int qdev_set_clock_one(DeviceState *dev, void *opaque)
> +{
> +    device_set_clock(dev, *((bool *)opaque));
> +    return 0;
> +}
> +
> +void qdev_set_clock_all(DeviceState *dev, bool en)
> +{
> +    qdev_walk_children(dev, NULL, NULL, qdev_set_clock_one, NULL, &en);
> +}
> +
> +void qdev_set_clock_all_fn(void *opaque, bool en)
> +{
> +    qdev_set_clock_all(DEVICE(opaque), en);
> +}
> +
> +void qbus_set_clock_all(BusState *bus, bool en)
> +{
> +    qbus_walk_children(bus, NULL, NULL, qdev_set_clock_one, NULL, &en);
> +}
> +
> +void qbus_set_clock_all_fn(void *opaque, bool en)
> +{
> +    qbus_set_clock_all(BUS(opaque), en);
> +}
>  
>  Object *qdev_get_machine(void)
>  {
> 
