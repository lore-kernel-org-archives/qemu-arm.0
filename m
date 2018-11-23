Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2209122wrt;
        Fri, 23 Nov 2018 07:52:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XA7awQthNTxW127PzYECeXZl+AuRou3vUlasxVIjRn5TKYLErIwjn+QrM9azvwqQ7+GQ7B
X-Received: by 2002:a25:ba04:: with SMTP id t4-v6mr17046062ybg.251.1542988355325;
        Fri, 23 Nov 2018 07:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542988355; cv=none;
        d=google.com; s=arc-20160816;
        b=UX8SU8WRwrgLHuMEVErOV/nZB+H+TgVrWizO28n6q5sa70XkiMNytwkTL9QKvVv6jW
         /SlcMPLTeLtBWzidXBvYrUcjIFVqF2jAASlqShM/hHyuRLzNBd0Y7N0I+MzuDNBdwPoS
         3dTwj+tBsBTjiiddjkxtVpwv9o86lTdfRHmE0JfCKP/iiIx/+FodjzZy+F65FB5ScXTd
         J8BBeHXRkRPGlLEPd9vvun4huvlJgy8vMrdmXcrr+nj+vOxjMNPH4w/2LHEu3G/2BhP6
         6GGlfVfCvWEC4Z8BK1aaGl76fn6aqWcVLQabh43x0Roa5U9EOWaIBHLPB8LZTP+F5FEr
         AFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=7CfsFEMiluFUWoagD2iUrLjZOGr7LWORoCwbAIVErKw=;
        b=vyhU0H/HnurUXeUl9uFU+yMFum5nlU1fFESMjXk6odNrdvM7Ar++5MFwPTUtopZrrn
         rPMmYWJyHF8hmcD0l3vI6UJZzGUrnBS8Yh10amTn5L6pWYzA2iKulzHy7RkUoV8JJHFB
         rYek6AMBbq59AP196BzY8eLVuoIElfWNSHSvffcEVQumkvFVgeTQe2b1Q8ObC24f1Erj
         vtEHAeVnURuhDUUOs17V/z8dQRJ5ZBqaZTQk35yqk1eQhfwUQPHdmk1YkXEHVUdw6QoW
         qJkWmp5NFV5wCAISD8Rr+YfwQ5u073WYJZ6hoMNAcFCd6LC890z4w5Y3YzZk0edEHizn
         65Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h66-v6si26634134ybh.59.2018.11.23.07.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 07:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQDkw-0000PT-Kx
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 10:52:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gQDYw-0005OC-OU
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:40:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gQDYq-0002EK-FH
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:40:10 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gQDYq-0002Bu-8L
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 10:40:04 -0500
Received: by mail-wr1-f68.google.com with SMTP id j2so12773159wrw.1
	for <qemu-devel@nongnu.org>; Fri, 23 Nov 2018 07:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7CfsFEMiluFUWoagD2iUrLjZOGr7LWORoCwbAIVErKw=;
	b=dLJwK7udPmU1Ox1URF+H7t2Fx8+3L7T43tk+upXI4vgcu8pa9zjlncnOqkI02mT+zE
	/HWE+z+gCmhY8sr9xbtWM9DFrn/U2IXy1fSEXmV20+X8DFZhVvsNV2YZOb5Fx3jYIGjT
	gr1A6Vj5ZCC60vn++sjJ05Sf+EVUPiKdq91rzLp+HfZbPzb3sJNYJaHVHE/cw/oVO4/D
	i/mC9H8L546MEadG5UlVVnwdHO2/FbZRBxmI2EkLb6ohgquw+6xMzSjPiBmSU2Z68a/S
	l+TnUl/+YyS8O0b+zdFyTtk/rUYyGLN6PzqsOczYcMgOWMsxUsbkBH0gY767T0loeDNN
	DN3Q==
X-Gm-Message-State: AA+aEWYPKViUhe9Li4s/g4kl4on6TWXC5artP+GXdBD8eYYW01HayJuq
	sqE/dPlxiTUOzWG+BsEB8LaZsg==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr15696931wrn.185.1542987603105; 
	Fri, 23 Nov 2018 07:40:03 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	s66sm8134123wmf.34.2018.11.23.07.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:40:02 -0800 (PST)
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
References: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
	<20181123153040.18933-10-maozhongyi@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6d201235-0fbb-cf12-c002-7c6114d59926@redhat.com>
Date: Fri, 23 Nov 2018 16:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123153040.18933-10-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v2 09/21] input/pl050: Convert sysbus init
 function to realize function
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KRJPR8XZQ2AN

On 23/11/18 16:30, Mao Zhongyi wrote:
> Use DeviceClass rather than SysBusDeviceClass in
> pl050_class_init().
> 
> Cc: peter.maydell@linaro.org
> Cc: qemu-arm@nongnu.org
> 
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/input/pl050.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index be9cd57b17..15bffbfcad 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -139,19 +139,19 @@ static const MemoryRegionOps pl050_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -static int pl050_initfn(SysBusDevice *dev)
> +static void pl050_realize(DeviceState *dev, Error **errp)
>  {
>      PL050State *s = PL050(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>  
>      memory_region_init_io(&s->iomem, OBJECT(s), &pl050_ops, s, "pl050", 0x1000);
> -    sysbus_init_mmio(dev, &s->iomem);
> -    sysbus_init_irq(dev, &s->irq);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
>      if (s->is_mouse) {
>          s->dev = ps2_mouse_init(pl050_update, s);
>      } else {
>          s->dev = ps2_kbd_init(pl050_update, s);
>      }
> -    return 0;
>  }
>  
>  static void pl050_keyboard_init(Object *obj)
> @@ -183,9 +183,8 @@ static const TypeInfo pl050_mouse_info = {
>  static void pl050_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> -    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(oc);
>  
> -    sdc->init = pl050_initfn;
> +    dc->realize = pl050_realize;
>      dc->vmsd = &vmstate_pl050;
>  }
>  
> 
