Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4636449lfp;
        Mon, 3 Feb 2020 16:49:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwmSbywsdGeyuMMMTHaMvKklK5Yqw17JbNIzBZ1oXpJogICI9Iqjk0Xx737s7Wx9BuYCFEc
X-Received: by 2002:a05:620a:9:: with SMTP id j9mr25664037qki.397.1580777391072;
        Mon, 03 Feb 2020 16:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580777391; cv=none;
        d=google.com; s=arc-20160816;
        b=l26xVwXJxTenA7esT8IvaP/nMntV/Oj/WsZE/hxi6cmglOZhxCWJgvdhpqw84Ue3Qw
         +zie7qrC4eui8VBSBf57e9nLUnshbTn69DAzVaVaBdUWF9juUD3sPjWD1Zi5CsXNQZJu
         52/hj8OxwW5mYN9dOvfXuGcW74Kvkusz2a/+7cfdX7FF/mc9/eV64ordVRl9Tyi1n7cL
         8XlZBx7/KgU6uyuqgvqxsS1F8LQlvCY0dBZFTqWhUL8lrVZcaAe5k+sJ36s7axTFFLXp
         mZJjZ+5lYWOvT/oPy5hfuITElcTUvNpzjZ/In9rqSLjfoNjcp2NG6VkX1zQgSEmsX+MX
         BUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=h/gbZJiyMzjbjUf0xcdN7BOvDSgw/aacGr+GWLl1MNw=;
        b=yVsqu0GDX9dF8jIWzsHy5r99vLtBjGvsDU/iixoURHZ6GMUXy6lhJli7ZC2ZlFVf/5
         PYWSXZ8nWIX7+MvDRoSXlxBXMxHM0/XDeafuwOaYHsXN8zUMyNOxTmzwRCN/9iUbBJwB
         vYhJhj3Yt2rRPYnzbBfZmo7Yc+2vvg1xJEmNpDRU5ko/0HPL5kIr/N/kr3PdBpC8cnGU
         +TjlSaLniLCHpA4oinVkGciVR5VXFXRPLp4po8ViOZ3+yUtJDXe/EChVZ4vv8HBBrr7b
         wUZ6xiB5UWTWSXNB0nKPzqLHTa6bxRXMsskILAnntaJ1u5NZRRnrSOupnXHUXkMFtd92
         du7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si13150088qkh.147.2020.02.03.16.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 16:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iymPW-0006kt-IL
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 19:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iymPN-0006kj-Rw
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 19:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iymPM-0008RE-Ia
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 19:49:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:59576 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iymPM-00084Y-6g; Mon, 03 Feb 2020 19:49:40 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BB60B54E231082D8A21F;
 Tue,  4 Feb 2020 08:49:33 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Feb 2020
 08:49:23 +0800
Subject: Re: [PATCH] pl031: add finalize function to avoid memleaks
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200203074718.37252-1-pannengyuan@huawei.com>
 <CAFEAcA_2XthfkcyNgQqoxo+Zt66pf7Te56nB8ZAQL948D=kqVw@mail.gmail.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <242974c9-9804-9080-0c5e-2bb4ab39fed7@huawei.com>
Date: Tue, 4 Feb 2020 08:49:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2XthfkcyNgQqoxo+Zt66pf7Te56nB8ZAQL948D=kqVw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: xuding42@huawei.com, Euler Robot <euler.robot@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VPvPVCoOID6g



On 2/3/2020 5:58 PM, Peter Maydell wrote:
> On Mon, 3 Feb 2020 at 07:47, <pannengyuan@huawei.com> wrote:
>>
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> There is a memory leak when we call 'device_list_properties' with
>> typename = pl031. It's easy to reproduce as follow:
>>
>>   virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-properties", "arguments": {"typename": "pl031"}}'
>>
>> The memory leak stack:
>>   Direct leak of 48 byte(s) in 1 object(s) allocated from:
>>     #0 0x7f6e0925a970 in __interceptor_calloc (/lib64/libasan.so.5+0xef970)
>>     #1 0x7f6e06f4d49d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>     #2 0x564a0f7654ea in timer_new_full /mnt/sdb/qemu/include/qemu/timer.h:530
>>     #3 0x564a0f76555d in timer_new /mnt/sdb/qemu/include/qemu/timer.h:551
>>     #4 0x564a0f765589 in timer_new_ns /mnt/sdb/qemu/include/qemu/timer.h:569
>>     #5 0x564a0f76747d in pl031_init /mnt/sdb/qemu/hw/rtc/pl031.c:198
>>     #6 0x564a0fd4a19d in object_init_with_type /mnt/sdb/qemu/qom/object.c:360
>>     #7 0x564a0fd4b166 in object_initialize_with_type /mnt/sdb/qemu/qom/object.c:467
>>     #8 0x564a0fd4c8e6 in object_new_with_type /mnt/sdb/qemu/qom/object.c:636
>>     #9 0x564a0fd4c98e in object_new /mnt/sdb/qemu/qom/object.c:646
>>     #10 0x564a0fc69d43 in qmp_device_list_properties /mnt/sdb/qemu/qom/qom-qmp-cmds.c:204
>>     #11 0x564a0ef18e64 in qdev_device_help /mnt/sdb/qemu/qdev-monitor.c:278
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>>  hw/rtc/pl031.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
>> index ae47f09635..50664ca000 100644
>> --- a/hw/rtc/pl031.c
>> +++ b/hw/rtc/pl031.c
>> @@ -194,6 +194,15 @@ static void pl031_init(Object *obj)
>>      s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
>>  }
>>
>> +static void pl031_finalize(Object *obj)
>> +{
>> +    PL031State *s = PL031(obj);
>> +    if (s->timer) {
>> +        timer_del(s->timer);
>> +        timer_free(s->timer);
>> +    }
>> +}
>> +
>>  static int pl031_pre_save(void *opaque)
>>  {
>>      PL031State *s = opaque;
>> @@ -329,6 +338,7 @@ static const TypeInfo pl031_info = {
>>      .parent        = TYPE_SYS_BUS_DEVICE,
>>      .instance_size = sizeof(PL031State),
>>      .instance_init = pl031_init,
>> +    .instance_finalize = pl031_finalize,
>>      .class_init    = pl031_class_init,
>>  };
> 
> The more usual way to fix this I think is to delay
> the timer_new until realize rather than putting it
> into instance_init, since the pl031 can't be
> hotplugged.

Hmm, you are right, I will change it in next version.

Thanks.

> 
> thanks
> -- PMM
> .
> 
