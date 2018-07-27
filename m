Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp912099wru;
        Fri, 27 Jul 2018 09:44:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfiwrJV+IPfZBRbnw7zOLCashfW+sBZrhvtCW0Wxq9SREdQLwuCaCnA84f08V1rd5YbIvdz
X-Received: by 2002:ac8:32a:: with SMTP id q42-v6mr6867464qtg.343.1532709846955;
        Fri, 27 Jul 2018 09:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532709846; cv=none;
        d=google.com; s=arc-20160816;
        b=et9MdjcNTy5p/S4sqOLuzGsEBTbdU4FxNfmxNSEomTeWtIO32ve+HLogQo3CxNrykZ
         1WNtJE8DZRCeTocbCpt32H0uhu7qqN3ziYtTGxC20pUwOridxS0CioXxb+XbMb+JOTQR
         omlRwIwkjrdRYh2hKrhH7q+oeShs55WumSrvoS08RrY3KyRvgIsCTB+aLyS5tZsDY/66
         Lpw9BedwwraEf0FItFUdqi3nFv3/uIIcvm3m163QRQ2vx+0j4NRdZHbTqbbDM4xH56h8
         3eimUmISP6xoXZMhowkYxwyXNTbyjGVChg7r5F4j2ScPSEWGk/M1BumUXLZjZW9uALcq
         bnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=1+msFpDnkfvhSzdlkVz7BywSZFzfiAppIcsEwF2osYg=;
        b=gk/2iwTsx7hC5sAVOdk/XkNWw5OJxo80SY2P0jLIjkN+xLlQL5fYGFV0WIiN2unkdq
         VIgFJRB1/uEXcPJ17OigovlYAABAa1PnwENVbdiF1sWs56Z7BZ9sjwJFdtNCMxTNDhzX
         yuSrOtvKto6/nDllddic40hKmScRp/PJdzDOiiIdi5JIaWgovaKH5ChcicPYasp4xPwk
         v9f7fIhwI+JP0RGV2Bm+ug0qWIINnfYdHrDARDk8EbcTQxPtykVbtmAPX2gChtqEEgc9
         MQYO9o1kD2yC9pICB2820eUEQLUxPP2BcCVXqgs+R6A4JG0B47oXshqKHDE/AGWSBJYT
         yjPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nq2D+vD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o11-v6si4318578qkl.97.2018.07.27.09.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 09:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nq2D+vD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj5qY-0002yi-Es
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 12:44:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj5qQ-0002uj-IW
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 12:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj5qL-0000qa-JM
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 12:43:58 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:36393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj5qL-0000q4-C4; Fri, 27 Jul 2018 12:43:53 -0400
Received: by mail-vk0-x241.google.com with SMTP id y9-v6so2749589vky.3;
	Fri, 27 Jul 2018 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1+msFpDnkfvhSzdlkVz7BywSZFzfiAppIcsEwF2osYg=;
	b=Nq2D+vD1EY0CEzSyMz7HiAfD3WtVn8wM0hVFIirSgCInjTg3INtqbnN7tQDgGm1Nmh
	rx+RbsZEqlGKTFO1oWOLaQkVdCwfRXLaF4D7+jkzfdXx/EA/TFKu9FCRKiwR6biBI89E
	SDr5CedqA0Sb/sWNn7E/1mdReGnp4BifpWxBos+Nd9f+bLrA5L7XdSRjL4IL8+8yn1nG
	ZEr+VWWAs5N74Rpu4W6uduXNY0y3c9fvbWEx6swjAFHEMaq0C5C/y0+lAfj44QWRkEit
	dCQ7m8gpd2lbdUaVzeaB/xluTdds2eHRDMDgWQgs12T+ZZOSwH2M1qcQ3etVg1mo4yPm
	ETuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=1+msFpDnkfvhSzdlkVz7BywSZFzfiAppIcsEwF2osYg=;
	b=UPHB5+Ql+bC6FdvHgrd9apLZ+D9l06H1bnFOxrjD/C96tNfjbum6nF6LJvM3uYtvTY
	xfYYfURn/fyno+vg/vjGnDsFE7/1jarTAZj8+lOz7rSe3NdHYvUst+PyMdS1YSxH+8Bu
	MNPv6ymsgOidi6I7eKXlu3erv0TupiKqgOcIJ4DrUWibgvoM7/cAcjhWoU/0dXcY7/ZI
	01V6Kga6mBLx/th4NIwMLc5b2s6S8RSq2loRwaSFjxKxnT9kSI9AUU5CM1E0FJueIjOJ
	JE8D7vPG4StW1ew8NYV3J8nGD/msW8HNLABvG9i6Z/PZpA4M6ZcfwC7415bLqAEU0OhY
	ebzQ==
X-Gm-Message-State: AOUpUlGl4SvEzoqk5lHhAwP1HxOywqt15zxd7OnyZDqHBT8sChBU3ri7
	p+xI3Pqv7f5eHYYOBCclYK4=
X-Received: by 2002:a1f:844e:: with SMTP id
	g75-v6mr4612684vkd.16.1532709832727; 
	Fri, 27 Jul 2018 09:43:52 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k16-v6sm906026uap.23.2018.07.27.09.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 09:43:52 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <cover.1532701430.git.damien.hedde@greensocs.com>
	<09041c553fbe1d78bf282513bffdb981e7a1d201.1532701430.git.damien.hedde@greensocs.com>
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
Message-ID: <9a1eb8a5-180c-8c62-4cff-0524e8b99889@amsat.org>
Date: Fri, 27 Jul 2018 13:43:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <09041c553fbe1d78bf282513bffdb981e7a1d201.1532701430.git.damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/6] sysbus: Specialize
 gating_update to enable/disable memory regions
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
X-TUID: OmA4/KUG94nM

On 07/27/2018 11:37 AM, Damien Hedde wrote:
> The default methods are overriden to add the activation/deactivation
> of the memory regions according to the gating state: Regions are
> enabled only when powered and clocked.
> As powering-up triggers a reset call, memory regions should
> be reset in specialized sysbus devices.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  include/hw/sysbus.h |  3 +++
>  hw/core/sysbus.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 0b59a3b8d6..e17165e78f 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -59,6 +59,9 @@ typedef struct SysBusDeviceClass {
>       */
>      char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
>      void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
> +
> +    DeviceGatingUpdate parent_power_update;
> +    DeviceGatingUpdate parent_clock_update;
>  } SysBusDeviceClass;
>  
>  struct SysBusDevice {
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 3c8e53b188..4a2dfbe907 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -325,6 +325,39 @@ MemoryRegion *sysbus_address_space(SysBusDevice *dev)
>      return get_system_memory();
>  }
>  
> +/*
> + * Action take on power or clock update.
> + */
> +static void sysbus_device_gating_update(DeviceState *dev)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    int i;
> +
> +    for (i = 0;; i++) {

i < QDEV_MAX_MMIO

> +        MemoryRegion *mr = sysbus_mmio_get_region(sbd, i);
> +        if (!mr) {
> +            break;
> +        }
> +        memory_region_set_enabled(mr, dev->powered && dev->clocked);
> +    }
> +}
> +
> +/*
> + * Action take on power update.
> + *
> + * Call parent method before doing local action.
> + * So that we override any action taken in parent method (eg if reset
> + * is called due to leaving OFF state)
> + */
> +static void sysbus_device_power_update(DeviceState *dev)
> +{
> +    SysBusDeviceClass *sbdk = SYS_BUS_DEVICE_GET_CLASS(dev);
> +
> +    sbdk->parent_power_update(dev);
> +
> +    sysbus_device_gating_update(dev);
> +}
> +
>  static void sysbus_device_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *k = DEVICE_CLASS(klass);
> @@ -341,6 +374,12 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
>       * subclass needs to override it and set user_creatable=true.
>       */
>      k->user_creatable = false;
> +
> +    SysBusDeviceClass *sbdk = SYS_BUS_DEVICE_CLASS(klass);
> +    device_class_set_parent_power_update(k,
> +            sysbus_device_power_update, &sbdk->parent_power_update);
> +    device_class_set_parent_clock_update(k,
> +            sysbus_device_gating_update, &sbdk->parent_clock_update);
>  }
>  
>  static const TypeInfo sysbus_device_type_info = {
> 
