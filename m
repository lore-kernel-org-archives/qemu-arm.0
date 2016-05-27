Received: by 10.25.30.65 with SMTP id e62csp786564lfe;
        Thu, 26 May 2016 19:14:54 -0700 (PDT)
X-Received: by 10.237.36.56 with SMTP id r53mr11527424qtc.47.1464315293921;
        Thu, 26 May 2016 19:14:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p53si15579910qtp.20.2016.05.26.19.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 19:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b67Ib-0003GN-BZ
	for alex.bennee@linaro.org; Thu, 26 May 2016 22:14:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b67HR-0002cj-MN
	for qemu-devel@nongnu.org; Thu, 26 May 2016 22:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b67HP-0003Vz-Lb
	for qemu-devel@nongnu.org; Thu, 26 May 2016 22:13:40 -0400
Received: from m12-15.163.com ([220.181.12.15]:60852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b67HI-0003U2-PH; Thu, 26 May 2016 22:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=+vkOI
	tUFisNzO/Db0iof8+/NxZOFajlzWiIndNhFGvQ=; b=iSAZHhXa7Nd1xGpGy0Sz+
	w/OH0siP+HplAIh9vB1lk3G4EROpd2nbhvEo6pN6OqGenm4zG1fQmRKNapGBNLiM
	KoU5N9Jpsy7I1BLEbCt4u9bP6Kp7DeQs3HusFt0YkTMrx9EEMT8Bs3X9CZAr8r0A
	ZYgLQT3bfjshBKG4XiAG2U=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp11 (Coremail) with SMTP id D8CowAC3zrBDrUdXBs8aCA--.47485S2;
	Fri, 27 May 2016 10:13:23 +0800 (CST)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
	<963b4bae-1f00-7406-6de7-f0bd3be8d2bb@redhat.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <5747AD41.9050007@163.com>
Date: Fri, 27 May 2016 10:13:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <963b4bae-1f00-7406-6de7-f0bd3be8d2bb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAC3zrBDrUdXBs8aCA--.47485S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw17ArWfZFWxuF4fuw4xtFb_yoWDXwc_XF
	yFkry2gr1rC3WxK39xWrnxWr1kKr1DKF4rX348K3Z29395Ca98Ary7A3WSvFWfWw17Gr13
	Wwn7Xa4xGasrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUen2-UUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgN2xlZXyB1yWQAAse
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.15
Subject: Re: [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUy7HmkkSntL



在 2016年05月25日 21:15, Paolo Bonzini 写道:
>>>> @@ -310,8 +312,7 @@ static void pl011_class_init(ObjectClass *oc, void *data)
>>>> >> >
>>>> >> >      dc->realize = pl011_realize;
>>>> >> >      dc->vmsd = &vmstate_pl011;
>>>> >> >-    /* Reason: realize() method uses qemu_char_get_next_serial() */
>>>> >> >-    dc->cannot_instantiate_with_device_add_yet = true;
>> >Why does instantiating with device_add work now? There's
>> >still no way to wire up interrupt lines or map mmio regions.
>> >(This has never made much sense to me -- Markus?)
> You can create it with -device if your board provides a platform bus and
> there's an FDT creator function.  If you don't, you get an error.
>
> Regarding device_add, it's disabled anyway because sysbus is not
> hotpluggable.
>
> Eiter way it's safe to remove this line, which is for outliers that
> otherwise would not give any error message.
Paolo: Do I need to send a new version to keep the

"dc->cannot_instantiate_with_device_add_yet = true"
untouched ?


