Received: by 10.25.208.211 with SMTP id h202csp1088133lfg;
        Fri, 19 Feb 2016 03:04:15 -0800 (PST)
X-Received: by 10.55.74.141 with SMTP id x135mr14728118qka.20.1455879855305;
        Fri, 19 Feb 2016 03:04:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si2835347qgz.58.2016.02.19.03.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 03:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:51007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWir8-0003Z9-Lt
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 06:04:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWir6-0003Z0-HR
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:04:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWir2-00075Y-GA
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:04:12 -0500
Received: from m12-17.163.com ([220.181.12.17]:57884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aWir1-000752-R9; Fri, 19 Feb 2016 06:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=PPtfF
	BQcX6g1ngI/5xTkATffhWihud4uTJg6xa1XoJo=; b=ASIZHbL7EeQGKMYMeK1KG
	geH27mFUeY0KMXUo23p5EjOGVotVHei9yxvv28t9qQJQkj8IMW8XAaEpeICMzEyj
	o3vDArn/1RpVDgV4Wk3dZmWhOY1f8W6bjaLccNdIOCTQLhlCXjdNz3u+6xHeWSRl
	7cjpTclm9H0Zgr1LwfOPFQ=
Received: from [192.168.31.184] (unknown [101.254.142.162])
	by smtp13 (Coremail) with SMTP id EcCowACHOdF49sZWub7iBg--.55609S2;
	Fri, 19 Feb 2016 19:03:30 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-7-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98eqLbA863L-t3y7wFFO8eiXgZZvaSge0e6cUTu8S0-A@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56C6F63A.9060907@163.com>
Date: Fri, 19 Feb 2016 19:02:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA98eqLbA863L-t3y7wFFO8eiXgZZvaSge0e6cUTu8S0-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACHOdF49sZWub7iBg--.55609S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1ftrW5ur1DXry8KF4fGrg_yoW5Ar4UpF
	yxZanFyw48tayDJF42qFsF9F18Cwn2ga4Fqr1kJr1F9rnrC3s8GF18Aw4rAayDZF4Y9Fyf
	Aay8ta4fWF15Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9BMtUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0gEUxlUL9i1OIwAAsp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
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
X-TUID: uA4mleJv6Pmp



在 2016年02月18日 21:48, Peter Maydell 写道:
> On 16 February 2016 at 11:10, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> assign tusb6010_init to tusb6010_info.instance_init and drop
>> the SysBusDeviceClass::init
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> (Again, I didn't review this patch.)
>
>> ---
>>   hw/timer/tusb6010.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
>> index 9f6af90..205127c 100644
>> --- a/hw/timer/tusb6010.c
>> +++ b/hw/timer/tusb6010.c
>> @@ -776,29 +776,27 @@ static void tusb6010_reset(DeviceState *dev)
>>       musb_reset(s->musb);
>>   }
>>
>> -static int tusb6010_init(SysBusDevice *sbd)
>> +static void tusb6010_init(Object *obj)
>>   {
>> -    DeviceState *dev = DEVICE(sbd);
>> -    TUSBState *s = TUSB(dev);
>> +    DeviceState *dev = DEVICE(obj);
>> +    TUSBState *s = TUSB(obj);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>>
>>       s->otg_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_otg_tick, s);
>>       s->pwr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_power_tick, s);
>> -    memory_region_init_io(&s->iomem[1], OBJECT(s), &tusb_async_ops, s,
>> +    memory_region_init_io(&s->iomem[1], obj, &tusb_async_ops, s,
>>                             "tusb-async", UINT32_MAX);
>>       sysbus_init_mmio(sbd, &s->iomem[0]);
>>       sysbus_init_mmio(sbd, &s->iomem[1]);
>>       sysbus_init_irq(sbd, &s->irq);
>>       qdev_init_gpio_in(dev, tusb6010_irq, musb_irq_max + 1);
>>       s->musb = musb_init(dev, 1);
>> -    return 0;
>>   }
>>
>>   static void tusb6010_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> -    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
>>
>> -    k->init = tusb6010_init;
>>       dc->reset = tusb6010_reset;
>>   }
>>
>> @@ -806,6 +804,7 @@ static const TypeInfo tusb6010_info = {
>>       .name          = TYPE_TUSB6010,
>>       .parent        = TYPE_SYS_BUS_DEVICE,
>>       .instance_size = sizeof(TUSBState),
>> +    .instance_init = tusb6010_init,
>>       .class_init    = tusb6010_class_init,
>>   };
> This patch seems to break "make check":
>
> TEST: tests/device-introspect-test... (pid=6070)
>    /arm/device/introspect/list:                                         OK
>    /arm/device/introspect/none:                                         OK
>    /arm/device/introspect/abstract:                                     OK
>    /arm/device/introspect/concrete:                                     **
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:1576:object_get_canonical_path_component:
> assertion failed: (obj->parent != NULL)
> Broken pipe
> FAIL
> GTester: last random seed: R02S57c9475befd55374bcf61f6f190cd8ad
> (pid=6093)
> FAIL: tests/device-introspect-test
>
> thanks
> -- PMM
Hi: peter
After some debug, I found

  s->musb = musb_init(dev, 1);

must be called in SysBus' init. Otherwise it will break the
  "/arm/device/introspect/concrete" check test.


