Received: by 10.80.166.35 with SMTP id d32csp548724edc;
        Mon, 17 Oct 2016 09:15:41 -0700 (PDT)
X-Received: by 10.200.34.145 with SMTP id f17mr26150795qta.149.1476720941624;
        Mon, 17 Oct 2016 09:15:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t185si7825082qkd.182.2016.10.17.09.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 09:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwAZf-0006zU-BI
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 12:15:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwAZZ-0006ys-Q8
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 12:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwAZZ-0004gS-0V
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 12:15:33 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36077)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwAZY-0004gB-Gj
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 12:15:32 -0400
Received: by mail-vk0-x234.google.com with SMTP id 2so182469284vkb.3
	for <qemu-arm@nongnu.org>; Mon, 17 Oct 2016 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pUC11f/z+8E7QZTdLIvZ5/uzvNOoC2qGZdGIzbwH1A0=;
	b=HNhUu4EVnGxAHHKJlTDDOPyxFS8f0kAviLYxc13APYA2WLh+WDDJNpp7edLjy+ZTIw
	fW09l+KcOwTXjyud+6leJtuqjqfesOSbASDKtQo8SIuXXheL4QUkR8zOKAjp32Goru5h
	CnEokbqKMEqtOwaJ97iXOqvfjQKtCbfh7y/W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pUC11f/z+8E7QZTdLIvZ5/uzvNOoC2qGZdGIzbwH1A0=;
	b=PNQb+1DI4C7TQBHXvV6hEJHxX+v+AIdBTg6vjNLNa3T8K0kk6QJODznZQGwUnRse0H
	/+Y9O8tIvCA7hsTPC7EHj37kInjJHjg51Hvqr9I8wLGHI/pvEf6gPscmkK9Y+nBaJoDa
	zMS22pDk+WsgVogxQVGSWx+v8EoDiIqGsFqjxe9rDXCF1o59fvNXVwL2+I6ztzLZP9Jr
	wECv1sfsHwm4QKsM5Gi/t0gYni50OF7Vdw3Xj38la+UQoOSwHQg3IcSuZrxL2ZDUbO25
	4eYByjhr/QtMN2bR4UeOr2Hysd+YJQiiIZLNmMiGXQ3IZRD/zzIMhK83e6KTRk55K/Rl
	WlPA==
X-Gm-Message-State: AA6/9RmD4Yl2lz6SY/TNXKwdlZNr5WNwHJ/pKpTl+UTytXAxkuRQsiSrZOQznm7pCEshJxxzC/XfUm2SKDbXLSeQ
X-Received: by 10.31.79.134 with SMTP id d128mr12100608vkb.165.1476720931835; 
	Mon, 17 Oct 2016 09:15:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 17 Oct 2016 09:15:11 -0700 (PDT)
In-Reply-To: <1476351885-8905-1-git-send-email-vijaykumar@zilogic.com>
References: <1476351885-8905-1-git-send-email-vijaykumar@zilogic.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2016 17:15:11 +0100
Message-ID: <CAFEAcA8asgLY+sLDoUx6KucRNDB6QTLDJ7fJ4o69rnkbAuXNjQ@mail.gmail.com>
To: Vijay Kumar B <vijaykumar@zilogic.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH] pxa2xx: Auto-assign name for i2c bus in
 i2c_init_bus.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jXNWxD532xJ2

On 13 October 2016 at 10:44, Vijay Kumar B <vijaykumar@zilogic.com> wrote:
> If a name is provided, the same name is assigned to both the I2C
> controllers. Leaving it NULL, causes names to be automatically
> assigned with an ID suffix, giving unique names to each
> controller. This helps us to uniquely identify each controller in the
> device tree, for example when adding an I2C device.
>
> Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>
> Reviewed-by: Deepak S. <deepak@zilogic.com>
> ---
>  hw/arm/pxa2xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 0241e07..9898287 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -1505,7 +1505,7 @@ static void pxa2xx_i2c_initfn(Object *obj)
>      PXA2xxI2CState *s = PXA2XX_I2C(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>
> -    s->bus = i2c_init_bus(dev, "i2c");
> +    s->bus = i2c_init_bus(dev, NULL);
>
>      memory_region_init_io(&s->iomem, obj, &pxa2xx_i2c_ops, s,
>                            "pxa2xx-i2c", s->region_size);



Applied to target-arm.next, thanks.

-- PMM
