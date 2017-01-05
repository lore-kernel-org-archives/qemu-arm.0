Received: by 10.25.205.13 with SMTP id d13csp9814581lfg;
        Thu, 5 Jan 2017 07:52:00 -0800 (PST)
X-Received: by 10.55.20.22 with SMTP id e22mr6113869qkh.139.1483631520556;
        Thu, 05 Jan 2017 07:52:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v199si38049370qkb.327.2017.01.05.07.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jan 2017 07:52:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPAKb-00014d-Qh
	for alex.bennee@linaro.org; Thu, 05 Jan 2017 10:51:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPAKX-00014G-4r
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 10:51:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPAKW-0005Ov-9p
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 10:51:53 -0500
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:35568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPAKW-0005Oh-4o
	for qemu-arm@nongnu.org; Thu, 05 Jan 2017 10:51:52 -0500
Received: by mail-ua0-x22d.google.com with SMTP id y9so51167481uae.2
	for <qemu-arm@nongnu.org>; Thu, 05 Jan 2017 07:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2yw0VI0DwUlmxyXtr+DX74HbwsmegAXQ9YKHP9/jw9I=;
	b=DTaBpkj4RIpRZqqR1oH2Q19S/bJC/Zzq78k2VReooSvGnDmgHi5+l/k/hKZDdsGTnw
	aE6Aqhcd7zMeEkwiLxEqtqiVa3muj0ZSSGX17A+BTAPu8AzvMy0Z6hWdQbEgXx2GeygU
	4I02j58CvD90Hwrg/7tZW/2J4WQappP9pLEks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2yw0VI0DwUlmxyXtr+DX74HbwsmegAXQ9YKHP9/jw9I=;
	b=KdxPSAEK+3vNFD20QnV/Y4UENKrLUUnHnBt8s5SpIWy5W18sY8TNvLO7zEbh/4+nzJ
	zFPWK+BRea+9u2QHu9RbVM+eNXuEmGc/SZem1eAvLV39BydAk96CED/yQ61HAOnTuCEB
	AcaT5QrzucZWVwvedq0CJWmirqS6P9LIdxj9vKVDqcHyVsMrTOK2JOjrjvr9TVvevERx
	j3S6H6vu7rpC1OiF4ALTG2WVBZxpvBXWI2dBG3K/PcwfSVl3pHBfhkxSOpGd1YyJA0Rq
	ZZTDAQKDUfa1zVWx/ehT59kUaIEtxDtTdZkpsy4GKTXUuPVdZOqJm1MUhY09ay+qC+a5
	CsdA==
X-Gm-Message-State: AIkVDXLNckGzH9r3+LWnKL9eQzpBtKic1VCEL9dPk0vqqdU8Ulq5KNGL8NoVP3YWbxtG3JMuko9IgaYzuDpxEwbi
X-Received: by 10.176.67.132 with SMTP id l4mr46368355ual.164.1483631511354;
	Thu, 05 Jan 2017 07:51:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 5 Jan 2017 07:51:30 -0800 (PST)
In-Reply-To: <20161231011808.4037-3-zxq_yx_007@163.com>
References: <20161231011808.4037-1-zxq_yx_007@163.com>
	<20161231011808.4037-3-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2017 15:51:30 +0000
Message-ID: <CAFEAcA-+hbn_ktvWJx1i_tamCzPbm31y7M8zrCDs042h93QMFg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/char: QOM'ify
 grlib_apbuart.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vyz82yE29z+G

On 31 December 2016 at 01:18, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the old Sysbus init and use instance_init and
> DeviceClass::realize instead
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/char/grlib_apbuart.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
> index db686e6a6f..620b801f34 100644
> --- a/hw/char/grlib_apbuart.c
> +++ b/hw/char/grlib_apbuart.c
> @@ -239,24 +239,28 @@ static const MemoryRegionOps grlib_apbuart_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -static int grlib_apbuart_init(SysBusDevice *dev)
> +static void grlib_apbuart_init(Object *obj)
>  {
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>      UART *uart = GRLIB_APB_UART(dev);
>
> -    qemu_chr_fe_set_handlers(&uart->chr,
> -                             grlib_apbuart_can_receive,
> -                             grlib_apbuart_receive,
> -                             grlib_apbuart_event,
> -                             uart, NULL, true);
> -
>      sysbus_init_irq(dev, &uart->irq);
>
> -    memory_region_init_io(&uart->iomem, OBJECT(uart), &grlib_apbuart_ops, uart,
> +    memory_region_init_io(&uart->iomem, obj, &grlib_apbuart_ops, uart,
>                            "uart", UART_REG_SIZE);
>
>      sysbus_init_mmio(dev, &uart->iomem);
> +}
>
> -    return 0;
> +static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
> +{
> +    UART *uart = GRLIB_APB_UART(dev);
> +
> +    qemu_chr_fe_set_handlers(&uart->chr,
> +                             grlib_apbuart_can_receive,
> +                             grlib_apbuart_receive,
> +                             grlib_apbuart_event,
> +                             uart, NULL, true);
>  }
>
>  static void grlib_apbuart_reset(DeviceState *d)
> @@ -280,9 +284,8 @@ static Property grlib_apbuart_properties[] = {
>  static void grlib_apbuart_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
>
> -    k->init = grlib_apbuart_init;
> +    dc->realize = grlib_apbuart_realize;
>      dc->reset = grlib_apbuart_reset;
>      dc->props = grlib_apbuart_properties;
>  }
> @@ -291,6 +294,7 @@ static const TypeInfo grlib_apbuart_info = {
>      .name          = TYPE_GRLIB_APB_UART,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(UART),
> +    .instance_init = grlib_apbuart_init,
>      .class_init    = grlib_apbuart_class_init,
>  };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This is a SPARC board device so it should go via the sparc tree.

thanks
-- PMM
