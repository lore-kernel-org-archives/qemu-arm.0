Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp783842wrd;
        Fri, 17 Aug 2018 17:56:31 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwUVhLVWAqoGePpuAt7rAKmFDgfE5fhfdRT2ps+dcqGTRNNSDGgzlGHZI1SkBU566467DCz
X-Received: by 2002:a0c:b0e4:: with SMTP id p33-v6mr32938900qvc.42.1534553791331;
        Fri, 17 Aug 2018 17:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534553791; cv=none;
        d=google.com; s=arc-20160816;
        b=Sd5FaIGR+KEemiK7RDL/OwtbsxP0NhK2DqZZxoNY/gv9MwL/+2Mxm61rOGK8XNg24c
         RrnfsfCvWxXnbFUusjGI1n3TT0ftJ0trqpeszS4QL64k9XnZ78vlcyEfnCC3suthbAkK
         r+TxbLLJIx0Y0v+Th8hflIqTWyCJzWWRmGvPjvQeEieQbB7QUMjRtjgl2OenKbTu7e5B
         0CFlSCjAIo/mq2JovGMY20SNLnC15UF6xUdhggpW3Ua888WH+XeXHdWDJ1rBG0LFNscp
         S00yGK9nu4Pnm1P8+WdcRZ6FRJthOv3jYipCbMnFDeRkX67iHXMkH5P+2Msjr7/v1EPs
         Z7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4rKXKQGmFPijsVNJGFLJtpF42F+E6FDGunZBMoh5t3c=;
        b=aoNCCeNxbNBnHEvcuMhP649OzQ+zjREFZOcJ+2/S03B4WVRN6Jmak/R/2HrwoxkClM
         WKBNtElfOECbQas91abMdaZmZkE/8GsHidpEG7IyBLFTdbNtTonWdnQBj5BjGUYXzLTy
         ECAfaOoyaN7qfUtZ95gRUhmZDjIyuEF5x1+RfjY96g1T4/8SM8pPZFtil4+y9ZxRFEDQ
         DaN+XjXgCE6tUIh3coZJtw5KYvGjFhPNLvIMSPuYKzLj31okPuZjR3M+5c5mACR8Wh94
         3lniMiDFiQslOGPKmzNlV2CmsuoNAozPHjhEIQFkXuSTDrWSkTCFXxBc4OsiKqZ5hNE9
         EK/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s2JZXgiP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 205-v6si3076944qkd.241.2018.08.17.17.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 17:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s2JZXgiP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqpXa-0002Pk-TD
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 20:56:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpVK-0001Kc-UT
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 20:54:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpGw-0003yK-5C
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 20:39:21 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:36843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpGv-0003y5-TN; Fri, 17 Aug 2018 20:39:17 -0400
Received: by mail-ua1-x944.google.com with SMTP id c12-v6so6747378uan.3;
	Fri, 17 Aug 2018 17:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4rKXKQGmFPijsVNJGFLJtpF42F+E6FDGunZBMoh5t3c=;
	b=s2JZXgiPvCjsbkrlfrHY3kiSTniFmAGJCNNhRUKiSALviNUwNnB7QxWTYS+rJ8/73M
	lC/OxD7QbsW0s06GHudasVlC+o8zQ/MZjROkgGDE2sfL4/SoxniDf268R2n0a+KKq3vu
	2dzKcbXGlIfMx2M0St8rwVH914q55A+8pxH1ks2OuFYOIx/tDFt5TB9+U8Yk0YrohY1i
	11HkeGkhs/DA9g/O4eAP0nINLyw/9Y6QHuiFLpFEwIDgx103RTFTB3ACOwaFRAqZ5Emb
	dZilcSBH7m6UWBVPNIldeUYsP8aFDPSPVZV9Q0ZAX08V2H9eVnImmd7j5YAA3YM+RKok
	HwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4rKXKQGmFPijsVNJGFLJtpF42F+E6FDGunZBMoh5t3c=;
	b=XUVcqrmuMcE0GIQLGmYC1K7vh4wI8803+9Se/PkMJh5OCuknkdaZE1TgQXJ1pNbWbF
	NR3UKez327G0Xdnu2mGSfo4rVeDweSagNwWFel+8PX0jx88WMvD+KuYC+d85QP9E2W8t
	JP50ZXRDafAFw6MSoShs5q+2RCauJQRuiLJrJs70uY8KurZneSC0K6nWuvIZmiJUlmDT
	KhwGNiLH4n82TuVHRoUxb7EFTZ4rzEQaj+/FZm4KdISCAWlYiUhkG+sUmiExCZ3ZOfbr
	oq3geGBzM7d8+mkAfloMW5lbgzVbdMOPc7LVh5UQ9ZDAEy3akPH19WLWCm+8HbnV8uth
	cdDg==
X-Gm-Message-State: AOUpUlEBjTfnVhswE16YjM+lsZe2MyLjgv3dG7AwKFbog++2Wyaj8X0V
	HFTMV4tWsgvHAGy/UTHnpho=
X-Received: by 2002:ab0:2044:: with SMTP id
	g4-v6mr24715703ual.95.1534552757359; 
	Fri, 17 Aug 2018 17:39:17 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m143-v6sm775589vke.23.2018.08.17.17.39.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 17:39:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-10-peter.maydell@linaro.org>
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
Message-ID: <6405e67c-49a6-dff4-1a78-6e410a72ec0d@amsat.org>
Date: Fri, 17 Aug 2018 21:39:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 09/16] hw/arm/iotkit: Wire up
 the lines for MSCs
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
X-TUID: p7OPl/KotcI1

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The IoTKit doesn't have any MSCs itself but it does need
> some wiring to connect the external signals from MSCs
> in the outer board model up to the registers and the
> NVIC IRQ line.
> 
> We also need to expose a MemoryRegion corresponding to
> the AHB bus, so that MSCs in the outer board model can
> use that as their downstream port. (In the FPGA this is
> the "AHB Slave Expansion" ports shown in the block
> diagram in the AN505 documentation.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h |  8 ++++++++
>  hw/arm/iotkit.c         | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 1ffa31d521b..5bb66b10468 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -28,6 +28,9 @@
>   *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts
>   *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts, which
>   *    are wired to the NVIC lines 32 .. n+32
> + *  + sysbus MMIO region 0 is the "AHB Slave Expansion" which allows
> + *    bus master devices in the board model to make transactions into
> + *    all the devices and memory areas in the IoTKit
>   * Controlling up to 4 AHB expansion PPBs which a system using the IoTKit
>   * might provide:
>   *  + named GPIO outputs apb_ppcexp{0,1,2,3}_nonsec[0..15]
> @@ -45,6 +48,11 @@
>   * Controlling each of the 16 expansion MPCs which a system using the IoTKit
>   * might provide:
>   *  + named GPIO inputs mpcexp_status[0..15]
> + * Controlling each of the 16 expansion MSCs which a system using the IoTKit
> + * might provide:
> + *  + named GPIO inputs mscexp_status[0..15]
> + *  + named GPIO outputs mscexp_clear[0..15]
> + *  + named GPIO outputs mscexp_ns[0..15]
>   */
>  
>  #ifndef IOTKIT_H
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 5d59ed5489f..8ae2a052517 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -660,6 +660,21 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>  
>      iotkit_forward_sec_resp_cfg(s);
>  
> +    /* Forward the MSC related signals */
> +    qdev_pass_gpios(dev_secctl, dev, "mscexp_status");
> +    qdev_pass_gpios(dev_secctl, dev, "mscexp_clear");
> +    qdev_pass_gpios(dev_secctl, dev, "mscexp_ns");
> +    qdev_connect_gpio_out_named(dev_secctl, "msc_irq", 0,
> +                                qdev_get_gpio_in(DEVICE(&s->armv7m), 11));
> +
> +    /*
> +     * Expose our container region to the board model; this corresponds
> +     * to the AHB Slave Expansion ports which allow bus master devices
> +     * (eg DMA controllers) in the board model to make transactions into
> +     * devices in the IoTKit.
> +     */
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
> +
>      system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
>  }
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
