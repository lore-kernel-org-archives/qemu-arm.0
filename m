Received: by 10.28.71.27 with SMTP id u27csp8702wma;
        Mon, 29 Jan 2018 03:37:42 -0800 (PST)
X-Google-Smtp-Source: AH8x224k1TxWYwXkB+GauneFktaqwGf1m5Bu6tXAIFpo2FmNyORT86kGIcFRlZQK4nJma68ZxhG9
X-Received: by 10.37.101.137 with SMTP id z131mr17366786ybb.270.1517225862640;
        Mon, 29 Jan 2018 03:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517225862; cv=none;
        d=google.com; s=arc-20160816;
        b=RGvKYI0KaLSozRKlhKtpU0n6dLv3OhHRm1tlC2+3e4GkECRa60nqnxNKCZh51og46l
         aAsv4hOl7/0OEbn8YPiAe2loHJf9Pvo9Qr5N4moW8PpJqvwAStGxWD0O52ZoFKpfbCu6
         u5Uu6L5LJBszN85xyNmanSnECIltJDxCS7RHaL470dovkl/dVXMJ8ffbL8fLvf/NWkh3
         5tdX2xt1UziHaPEZfNzC2lhGaQOA2vgRXIZXn7F716ZHqZizKzKehkPX1CnQAFNHLAkm
         8M21y2PgAlAnGtYsWaqOZoh3x+YQ24TjGCWjVxJS0EjVv+eIqbW0l1+AlaFC5hgc4y64
         TL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Khd7827R8bD621IBWZ0mXpwZJ29AN1u5TOKySkeXC7Q=;
        b=QyjwDvmu44PLQAljyj0LOwXYdcDLul4eCJZzs/Co4agYzgk1zjJ8SI55ld5f16Xo4t
         XNPzK6JYGIAJQOTwVK8mn/wMFYhXtKC56ic7o3gOl82dwd7h6LUVBXtqua0vD+bBB7LM
         3SQUPNu82qEQN4H+8Olr5V3oPkEbJSgclw15BlNwfg1/j482iYaRarsYqIasIAnrDvW5
         sdUvjtvgLWSXaPiGqjxAgpNUhARbdomsfREyxt7qXBqgLHsIoVi5wnG4mqdcUFqUsP/p
         QWXINOT/od4yTGgINxn8jpvNIA0SAj5ES0wmvKgWnEsC1qw2j1eYOBezsudvtywt02qs
         PB8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a15si4161331ybk.717.2018.01.29.03.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jan 2018 03:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eg7ks-00046V-4Z
	for alex.bennee@linaro.org; Mon, 29 Jan 2018 06:37:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1eg7kj-000464-Go
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 06:37:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1eg7kf-0002dI-4S
	for qemu-arm@nongnu.org; Mon, 29 Jan 2018 06:37:33 -0500
Received: from [45.249.212.35] (port=50124 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <xuwei5@huawei.com>)
	id 1eg7ke-0002YD-P5; Mon, 29 Jan 2018 06:37:29 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 86A39E27A1825;
	Mon, 29 Jan 2018 19:37:21 +0800 (CST)
Received: from [127.0.0.1] (10.202.226.123) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 29 Jan 2018 19:37:14 +0800
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
	<CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
	<20180129102917.3olxduibcwdqgqls@hawk.localdomain>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5A6F0761.2010305@hisilicon.com>
Date: Mon, 29 Jan 2018 11:37:05 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20180129102917.3olxduibcwdqgqls@hawk.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.123]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] pl011: do not put into fifo
 before enabled the interruption
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
Cc: Rob Herring <rob.herring@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
	"Chenxin \(Charles\)" <charles.chenxin@huawei.com>, Jonathan
	Cameron <Jonathan.Cameron@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"Liuxinliang \(Matthew Liu\)" <z.liuxinliang@hisilicon.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Daode Huang <huangdaode@hisilicon.com>, tiantao6@huawei.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qo1S0TqRSaus

Hi Andrew,

On 2018/1/29 10:29, Andrew Jones wrote:
> On Fri, Jan 26, 2018 at 06:01:33PM +0000, Peter Maydell wrote:
>> On 26 January 2018 at 17:33, Wei Xu <xuwei5@hisilicon.com> wrote:
>>> On 2018/1/26 17:15, Peter Maydell wrote:
>>>> The pl011 code should call qemu_set_irq(..., 1) when the
>>>> guest enables interrupts on the device by writing to the int_enabled
>>>> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
>>>> VGIC should report the interrupt to the guest.
>>>>
>>>
>>> Yes.
>>> And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
>>> When writing to the int_enabled, not sure why the int_level is set to
>>> 0x20(PL011_INT_TX) but int_enabled is 0x50.
>>>
>>> It still call qemu_set_irq(..., 0).
>>>
>>> I added "s->int_level |= PL011_INT_RX" before calling pl011_update
>>> when writing to the int_enabled and tested it also works.
>>
>> No, that's not right either. int_level should already have the
>> RX bit set, because pl011_put_fifo() sets that bit when it gets a
>> character from QEMU and puts it into the FIFO.
>>
>> Does something else clear the int_level between the character
>> going into the FIFO from QEMU and the guest enabling
>> interrupts?
> 
> As part of the boot process Linux restarts the UART a few times. When
> Linux drives the PL011 with the SBSA driver then the FIFO doesn't get
> reset prior to being used again, as the SBSA doesn't specify a way to
> do that. I'm not sure if this issue is due to the SBSA attempting to
> be overly simple, or something the Linux driver can deal with. See
> this thread for a discussion I started once.
> 
> https://www.spinics.net/lists/linux-serial/msg23163.html

I am not sure it is the same problem or not.
I will check that.
Thanks!

> 
> Wei,
> 
> I assume you're using UEFI/ACPI when booting, as I don't recall this
> problem occurring with the Linux PL011 driver which would be used
> when booting with DT.
>

I am using an ARM64 board, the guest is booted *without* UEFI but the
host is booted with UEFI/ACPI.
The command I am using is as below:
	"qemu-system-aarch64 -enable-kvm -m 1024 -cpu host -M virt \
	-nographic --kernel Image --initrd roofs.cpio.gz"

Thanks!

Best Regards,
Wei

> Thanks,
> drew
> 
> .
> 

