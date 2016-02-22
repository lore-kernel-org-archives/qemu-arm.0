Received: by 10.25.208.211 with SMTP id h202csp1104418lfg;
        Mon, 22 Feb 2016 02:30:51 -0800 (PST)
X-Received: by 10.140.92.146 with SMTP id b18mr32612903qge.88.1456137051012;
        Mon, 22 Feb 2016 02:30:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y83si28971448qka.43.2016.02.22.02.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 02:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:48305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXnlS-0001pf-7u
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 05:30:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXnlM-0001pL-GH
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 05:30:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXnlI-0007Bl-FA
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 05:30:44 -0500
Received: from m12-16.163.com ([220.181.12.16]:55584)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXnlH-0007Aq-Ad; Mon, 22 Feb 2016 05:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BDaYM
	XOi4N376iGXU6etVBcszc0J/N441IP8YvSWULo=; b=C8H7MhOUN678w7pX7Mser
	49XqJ7eIbWXe+CEAUtTE9daDHmnnRCxvheUE3sj48cQc9rDBE4o5NvAKBcF6rHKd
	/XyWVP2B++de66ADkK0zKkZKuhGPLK6nVucSQmKW/64YNaGAzzX10/59a8AU1NCj
	mzGY9Q6dkzbao6zSOtYCuo=
Received: from [192.168.31.184] (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowECZmUQc48pWrzMHAA--.2054S2;
	Mon, 22 Feb 2016 18:29:49 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56CAE2DB.3080702@163.com>
Date: Mon, 22 Feb 2016 18:28:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowECZmUQc48pWrzMHAA--.2054S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWkuF4kWF1DtrWkKrWDCFg_yoW8urWfpF
	Z3WF1kuF4qqF1DWrsxKryvqa98XFn8tr17J3WDG3Wxua4Dtrn5JF1qv34a9rWDCFZI9r4k
	Zay0kF9xurs8Cr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9L05UUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOx0XxlXlR8KQ1wAAsF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
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
X-TUID: tqSStuBX3oRD



在 2016年02月22日 17:24, Peter Maydell 写道:
> On 22 February 2016 at 09:11, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> assign DeviceClass::vmsd instead of using vmstate_register function
>>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>> ---
>>   hw/timer/m48t59.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
>> index 3c683aa..b0cf79d 100644
>> --- a/hw/timer/m48t59.c
>> +++ b/hw/timer/m48t59.c
>> @@ -742,8 +742,6 @@ static void m48t59_realize_common(M48t59State *s, Error **errp)
>>           s->wd_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &watchdog_cb, s);
>>       }
>>       qemu_get_timedate(&s->alarm, 0);
>> -
>> -    vmstate_register(NULL, -1, &vmstate_m48t59, s);
>>   }
>>
>>   static void m48t59_isa_realize(DeviceState *dev, Error **errp)
>> @@ -822,6 +820,7 @@ static void m48txx_isa_class_init(ObjectClass *klass, void *data)
>>       dc->realize = m48t59_isa_realize;
>>       dc->reset = m48t59_reset_isa;
>>       dc->props = m48t59_isa_properties;
>> +    dc->vmsd = &vmstate_m48t59;
>>       nc->read = m48txx_isa_read;
>>       nc->write = m48txx_isa_write;
>>       nc->toggle_lock = m48txx_isa_toggle_lock;
>> @@ -866,6 +865,7 @@ static void m48txx_sysbus_class_init(ObjectClass *klass, void *data)
>>       dc->realize = m48t59_realize;
>>       dc->reset = m48t59_reset_sysbus;
>>       dc->props = m48t59_sysbus_properties;
>> +    dc->vmsd = &vmstate_m48t59;
>>       nc->read = m48txx_sysbus_read;
>>       nc->write = m48txx_sysbus_write;
>>       nc->toggle_lock = m48txx_sysbus_toggle_lock;
>> --
>> 2.1.4
>>
> Just noticed this won't work as it is -- the vmstate
> struct is for the M48t59State*, but the ISA and
> Sysbus wrappers have their own structs which are
> what the dc->vmsd will be wanting to operate on.
> You'd need extra VMState structs I think and
> somebody who knows migration better than me to say
> whether that is a migration compat break.
>
> thanks
> -- PMM
It seems that the old code also use the same vmstate structure. Maybe 
it's a common structure which will not be used at the same time.

