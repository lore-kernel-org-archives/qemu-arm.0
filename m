Received: by 10.25.208.211 with SMTP id h202csp1508703lfg;
        Mon, 7 Mar 2016 09:41:57 -0800 (PST)
X-Received: by 10.140.236.68 with SMTP id h65mr31551354qhc.13.1457372515632;
        Mon, 07 Mar 2016 09:41:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3si17825003qkh.18.2016.03.07.09.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 09:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aczAJ-0002bQ-3z
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 12:41:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1acz9N-0001TT-3N
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 12:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1acz9H-0003wY-Dy
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 12:40:56 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1acz9E-0003vt-SM; Mon, 07 Mar 2016 12:40:49 -0500
Received: by mail-wm0-x244.google.com with SMTP id p65so12054288wmp.1;
	Mon, 07 Mar 2016 09:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=/psmIKhMof6XM4KJG7fOvOGKZen45HYUcn9z/h5IFWI=;
	b=KoEz7WptCr92PVTTUFJUhTXSrofZiS3XEbO/bLaly+7hiQpxi/fiGKVE73XN21jrlt
	8jFwOrZVKX8tW0O2Cq+ZXxBWFesYIuoMpxvJnVWBjToLc7Cgeu5sOWFxmFBZpiw5oJd1
	jwexDreSrgoXD3drGF7R1K724ytwSY9Ie0t6afSLafpN77NI4DPW94MaIzgBZCdmxsv1
	cbP0lo4HlHnZrc/gd6LSv3GaBjMthwxBy73Ev8x/288FsbjpJzE0WpKYYJzKmwTzk7QB
	QPREoY7QpEMtPQTnbHCD7oGxyJ8Sf1L7xbef1Ud/d9VgVAeuwrwMf/94OWNKyu3ldl7D
	NS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=/psmIKhMof6XM4KJG7fOvOGKZen45HYUcn9z/h5IFWI=;
	b=Sy2vGKiB3SbciY6WunIj4d5saKlbFND7JKmw1LIAbGeGC0rpcw/s1Zd4nn3RUE3Xzv
	v6mjq4RQikC1hegRpHQcsjZjKfm/3UpfFL1YFlIuncu0JEJ6WY5tPa/uK6HtZg0II8g8
	u3dh2F4mXuhxTwJKc06sXer9DTVOmTaN5LY0RPkxMzDaiwV1YNHeVd0bnv8Qh7eG4EhV
	NwWFGMSeaDsfSQmUKn88EG1S03YWsS4uNsU1aD/ykzoxBUy8nPYsj1vTrZbCADMNuakc
	ZJEtK0gtDkO/8cVGGM1zoRyP5UphbFFtmrqbrMLLoNKe+PtfSRczFjh4Ly/qw+wBd5qz
	woqw==
X-Gm-Message-State: AD7BkJIcj++PweoLdnyZVr+fvdj7dozbxb1mmnJcw2OfuapRkb654Lv1XG4JLU/KfFsx8Zwy8p5RpVuZLmA06A==
MIME-Version: 1.0
X-Received: by 10.28.107.216 with SMTP id a85mr304501wmi.96.1457372447718;
	Mon, 07 Mar 2016 09:40:47 -0800 (PST)
Received: by 10.28.157.21 with HTTP; Mon, 7 Mar 2016 09:40:47 -0800 (PST)
In-Reply-To: <1457334350-5675-3-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-3-git-send-email-zxq_yx_007@163.com>
Date: Mon, 7 Mar 2016 09:40:47 -0800
Message-ID: <CAPokK=rjX4k9JXnJH8Fv1-0rEaV4JRADv5xGDh8TY8Mf6upoAA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 2/9] hw/arm: QOM'ify highbank.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C/yQTV5vGfpP

On Sun, Mar 6, 2016 at 11:05 PM, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the use of old SysBus init function and use instance_init
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

(just this one as I have done some highbank work recently - I cant do
the whole series).

Regards,
Peter

> ---
>  hw/arm/highbank.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index e25cf5e..8f38dff 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -167,23 +167,20 @@ static void highbank_regs_reset(DeviceState *dev)
>      s->regs[0x43] = 0x05F40121;
>  }
>
> -static int highbank_regs_init(SysBusDevice *dev)
> +static void highbank_regs_init(Object *obj)
>  {
> -    HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
> +    HighbankRegsState *s = HIGHBANK_REGISTERS(obj);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>
> -    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
> +    memory_region_init_io(&s->iomem, obj, &hb_mem_ops, s->regs,
>                            "highbank_regs", 0x1000);
>      sysbus_init_mmio(dev, &s->iomem);
> -
> -    return 0;
>  }
>
>  static void highbank_regs_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> -    sbc->init = highbank_regs_init;
>      dc->desc = "Calxeda Highbank registers";
>      dc->vmsd = &vmstate_highbank_regs;
>      dc->reset = highbank_regs_reset;
> @@ -193,6 +190,7 @@ static const TypeInfo highbank_regs_info = {
>      .name          = TYPE_HIGHBANK_REGISTERS,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(HighbankRegsState),
> +    .instance_init = highbank_regs_init,
>      .class_init    = highbank_regs_class_init,
>  };
>
> --
> 2.1.4
>
>
>
