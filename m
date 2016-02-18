Received: by 10.25.208.211 with SMTP id h202csp617582lfg;
        Thu, 18 Feb 2016 05:48:26 -0800 (PST)
X-Received: by 10.140.177.71 with SMTP id x68mr9440424qhx.39.1455803306210;
        Thu, 18 Feb 2016 05:48:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e127si8096646qkb.26.2016.02.18.05.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 05:48:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWOwT-0006Os-Nq
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 08:48:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWOwQ-0006Na-Qo
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 08:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWOwP-0005By-Ad
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 08:48:22 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWOwP-0005Bs-5d
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 08:48:21 -0500
Received: by mail-vk0-x235.google.com with SMTP id e6so44366184vkh.2
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 05:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=866PtSPJggWRMKs109Syy44JbEJkGSJ9kkBocLTFA0A=;
	b=aai2msZx53fAOFlyRijqJ1+bZseSn7i9mGyBGT8VdeiE6V4c55bVpPpE3X71otRO7X
	KL98zBqG7Nxaw89ZDTBbF51TkEa2vSAbmAFzEY6to8808Wpa9QwMruyrnEdIZYsDWAsi
	DbuVQfDnoXfTK70vzjpHjjeIyWwHNqIWjMhsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=866PtSPJggWRMKs109Syy44JbEJkGSJ9kkBocLTFA0A=;
	b=AzXPu0MgLDzBUGNN9txYlqJqt80uJf8DjZLzC7kDU2qk89L5O8xKjWy5ZfdXw5hytz
	N+qh5yifGxe/oe+3vWJwY80mEiESkv5DTBSPFb5Hw1eV0cNhKYw/tZQqzRyPa9vdOsH7
	MjDabP+ILo+V4LO5+C3McGuAu3BixgKN01QDmZwj3PEMWrgrTxYXM+h1mWldqBB+2U6X
	Ax3pkUwKV8b1rV8XNA0Fgcw1ti0wijajCWNVdo28Rm+vTGyBk0f6NsCc7MuZmzngETie
	cBLh9E1zTdRFVNRGJcD2InSce/wiqQL2ZyUsdOn/oYHmHHOykGaPlhigyyfY+s0AAei1
	aHdw==
X-Gm-Message-State: AG10YOTanZOke9nEdyNZLI4n303mH0oys4c/g2QG+KFxZTqyBXDRLBZaJYs/zv2hNwp8rzikU7FsVd4t95KzrXI0
X-Received: by 10.31.131.199 with SMTP id f190mr6200757vkd.90.1455803300386;
	Thu, 18 Feb 2016 05:48:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 18 Feb 2016 05:48:01 -0800 (PST)
In-Reply-To: <1455621027-13927-7-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-7-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2016 13:48:01 +0000
Message-ID: <CAFEAcA98eqLbA863L-t3y7wFFO8eiXgZZvaSge0e6cUTu8S0-A@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v3 16/16] hw/timer: QOM'ify tusb6010
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h9xJX1Ba9NF6

On 16 February 2016 at 11:10, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> assign tusb6010_init to tusb6010_info.instance_init and drop
> the SysBusDeviceClass::init
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

(Again, I didn't review this patch.)

> ---
>  hw/timer/tusb6010.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
> index 9f6af90..205127c 100644
> --- a/hw/timer/tusb6010.c
> +++ b/hw/timer/tusb6010.c
> @@ -776,29 +776,27 @@ static void tusb6010_reset(DeviceState *dev)
>      musb_reset(s->musb);
>  }
>
> -static int tusb6010_init(SysBusDevice *sbd)
> +static void tusb6010_init(Object *obj)
>  {
> -    DeviceState *dev = DEVICE(sbd);
> -    TUSBState *s = TUSB(dev);
> +    DeviceState *dev = DEVICE(obj);
> +    TUSBState *s = TUSB(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>
>      s->otg_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_otg_tick, s);
>      s->pwr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_power_tick, s);
> -    memory_region_init_io(&s->iomem[1], OBJECT(s), &tusb_async_ops, s,
> +    memory_region_init_io(&s->iomem[1], obj, &tusb_async_ops, s,
>                            "tusb-async", UINT32_MAX);
>      sysbus_init_mmio(sbd, &s->iomem[0]);
>      sysbus_init_mmio(sbd, &s->iomem[1]);
>      sysbus_init_irq(sbd, &s->irq);
>      qdev_init_gpio_in(dev, tusb6010_irq, musb_irq_max + 1);
>      s->musb = musb_init(dev, 1);
> -    return 0;
>  }
>
>  static void tusb6010_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
>
> -    k->init = tusb6010_init;
>      dc->reset = tusb6010_reset;
>  }
>
> @@ -806,6 +804,7 @@ static const TypeInfo tusb6010_info = {
>      .name          = TYPE_TUSB6010,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(TUSBState),
> +    .instance_init = tusb6010_init,
>      .class_init    = tusb6010_class_init,
>  };

This patch seems to break "make check":

TEST: tests/device-introspect-test... (pid=6070)
  /arm/device/introspect/list:                                         OK
  /arm/device/introspect/none:                                         OK
  /arm/device/introspect/abstract:                                     OK
  /arm/device/introspect/concrete:                                     **
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1576:object_get_canonical_path_component:
assertion failed: (obj->parent != NULL)
Broken pipe
FAIL
GTester: last random seed: R02S57c9475befd55374bcf61f6f190cd8ad
(pid=6093)
FAIL: tests/device-introspect-test

thanks
-- PMM
