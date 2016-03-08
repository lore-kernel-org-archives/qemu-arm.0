Received: by 10.25.208.211 with SMTP id h202csp1679713lfg;
        Mon, 7 Mar 2016 17:52:11 -0800 (PST)
X-Received: by 10.140.235.137 with SMTP id g131mr34680201qhc.43.1457401931161;
        Mon, 07 Mar 2016 17:52:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k22si601675qhk.83.2016.03.07.17.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 17:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:59573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad6ok-0005Yf-Kc
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 20:52:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ad6oi-0005YS-Go
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 20:52:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ad6of-0004h1-Au
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 20:52:08 -0500
Received: from m12-17.163.com ([220.181.12.17]:60269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ad6oe-0004ft-Kx; Mon, 07 Mar 2016 20:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BIwFo
	5kEXDx4eYKxeTjGNrIYAwkofOwzoU18OzkClfE=; b=olJhE+wRthPLCQ227rvn1
	TPubTWnicjeHddbmQrsYZwPh1yPzFEkLd+I1qU0BiM3D//EfukWdT77QR7vEgvV0
	lfFdhwfsnhqdwHxtypnZmqfNXld6opj4xszN5UVXxxpoJJRrXmYTRQxz1Zyd3jH2
	Dg19KDQelk4iPQR9xLt7tE=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowAAXddIgMN5WC+pWAQ--.7106S2;
	Tue, 08 Mar 2016 09:51:29 +0800 (CST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-3-git-send-email-zxq_yx_007@163.com>
	<CAPokK=rjX4k9JXnJH8Fv1-0rEaV4JRADv5xGDh8TY8Mf6upoAA@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56DE2FDC.3020807@163.com>
Date: Tue, 8 Mar 2016 09:50:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=rjX4k9JXnJH8Fv1-0rEaV4JRADv5xGDh8TY8Mf6upoAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowAAXddIgMN5WC+pWAQ--.7106S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4xGF4fXw43Jw4UXF4xWFg_yoW8Zw1xp3
	s7uFs0kF45tF4kXF42qF9YvFWjva1Ikr1xWr4kA3WSyasFkryDCF1UGryfCrWq9r48AF1r
	tr48t3Z7XF4fCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQsqXUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFgAmxlWBPf8LKgAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/9] hw/arm: QOM'ify highbank.c
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
X-TUID: RxFAct9zeOPo



在 2016年03月08日 01:40, Peter Crosthwaite 写道:
> On Sun, Mar 6, 2016 at 11:05 PM, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> Drop the use of old SysBus init function and use instance_init
>>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>
> (just this one as I have done some highbank work recently - I cant do
> the whole series).
>
> Regards,
> Peter
>
>> ---
>>   hw/arm/highbank.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
>> index e25cf5e..8f38dff 100644
>> --- a/hw/arm/highbank.c
>> +++ b/hw/arm/highbank.c
>> @@ -167,23 +167,20 @@ static void highbank_regs_reset(DeviceState *dev)
>>       s->regs[0x43] = 0x05F40121;
>>   }
>>
>> -static int highbank_regs_init(SysBusDevice *dev)
>> +static void highbank_regs_init(Object *obj)
>>   {
>> -    HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
>> +    HighbankRegsState *s = HIGHBANK_REGISTERS(obj);
>> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>>
>> -    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
>> +    memory_region_init_io(&s->iomem, obj, &hb_mem_ops, s->regs,
>>                             "highbank_regs", 0x1000);
>>       sysbus_init_mmio(dev, &s->iomem);
>> -
>> -    return 0;
>>   }
>>
>>   static void highbank_regs_class_init(ObjectClass *klass, void *data)
>>   {
>> -    SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>>
>> -    sbc->init = highbank_regs_init;
>>       dc->desc = "Calxeda Highbank registers";
>>       dc->vmsd = &vmstate_highbank_regs;
>>       dc->reset = highbank_regs_reset;
>> @@ -193,6 +190,7 @@ static const TypeInfo highbank_regs_info = {
>>       .name          = TYPE_HIGHBANK_REGISTERS,
>>       .parent        = TYPE_SYS_BUS_DEVICE,
>>       .instance_size = sizeof(HighbankRegsState),
>> +    .instance_init = highbank_regs_init,
>>       .class_init    = highbank_regs_class_init,
>>   };
>>
>> --
>> 2.1.4
>>
>>
>>
Thanks for your reply, Peter !

