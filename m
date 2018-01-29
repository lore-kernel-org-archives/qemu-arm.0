Received: by 10.28.71.27 with SMTP id u27csp54028wma;
        Mon, 29 Jan 2018 04:26:13 -0800 (PST)
X-Google-Smtp-Source: AH8x2272hSj81FkG48SMRbb3AzXFdz0iqaYdSGF1RCiquIM6e+CZtjbqU++6wNmJkPdOXbZwHSeS
X-Received: by 10.129.76.22 with SMTP id z22mr16829645ywa.32.1517228773819;
        Mon, 29 Jan 2018 04:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517228773; cv=none;
        d=google.com; s=arc-20160816;
        b=K/2xM9lR7gcC7OR/GcZQJUzdkdaa6UgySKoygGVbZa6MGjIbYBBYPy2BGCENOe/9ly
         Gp6uDOjmlGxTn+9ly2pCJj8W9tZAZTDpvNMGz+3bk5rWAOufL4xLcPVH5TYlMWSWRDeB
         b+Yw4FJQgfRNeBdxJ6XM85XG6ghWlAUEA9L5EzlsqHGcffxOP+VBqMGhc95ox88iS0n9
         Zdv47XOeYOY2a69QfIHyzw29mN8KpIeZatD8OBmBdq0l+XSzE3jxVw+hF7Em4e8TxD8s
         NGN1em4WSRE7wCo5kRhLWSd6dXUAeBYfsMFTMSoptbRMDzkLat1Ed1twvwxyw6vD/8CM
         P50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=+wmAxaxIpftKWv9TpQPdxVuOiDsCwvluQTffcea864Q=;
        b=KHdgROY4WQUlzV2z3uiaoD+f+WVLlV51rhnpqggSzEczvAyc+6BIWqpfpemGhPr8Ia
         KT1v4QhT4Sl7Yrmy/4RKpjPVoD2Q8zyQUxWs66T2KvZkJUXwI2LNopaRbtIA01Lds6Hx
         gcsVc39dbzhw9FndzbvySWkRVCveLTupszp48b6WTMLclW/GaYmPiwoGxrkLPqIEPhlZ
         f+qRpVeriwuYZ20a7E5V0btH/rxvjW8eD1DpaZBUbLVysXgyhaB2nSvrsCnoj4HGxNJ4
         SIezi0lr1XiFV2KU1RG+vveyF6HH+uNZtLAyJaoLdKUZ/JZ0AvQPbtMvL1I9ueQxJVMV
         BN2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si2085275ywg.196.2018.01.29.04.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jan 2018 04:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eg8Vp-0002gs-7X
	for alex.bennee@linaro.org; Mon, 29 Jan 2018 07:26:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1eg8Oc-00051N-Kz
	for qemu-devel@nongnu.org; Mon, 29 Jan 2018 07:18:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1eg8OY-0001Sn-8t
	for qemu-devel@nongnu.org; Mon, 29 Jan 2018 07:18:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2083 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <xuwei5@huawei.com>)
	id 1eg8ON-0001Jo-9N; Mon, 29 Jan 2018 07:18:31 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E2F62CF98C5A2;
	Mon, 29 Jan 2018 20:18:15 +0800 (CST)
Received: from [127.0.0.1] (10.202.226.123) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 29 Jan 2018 20:18:09 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
	<5A6B6671.8070408@hisilicon.com>
	<CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5A6F10F8.7000904@hisilicon.com>
Date: Mon, 29 Jan 2018 12:18:00 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_vYgDYofx61rmCL7sZKOVSBHfw0k3us1=SHzD+TEnGw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.123]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] pl011: do not put into fifo
 before enabled the interruption
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
Cc: Rob Herring <rob.herring@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
	"Chenxin \(Charles\)" <charles.chenxin@huawei.com>,
	tiantao6@huawei.com, QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"Liuxinliang \(Matthew Liu\)" <z.liuxinliang@hisilicon.com>,
	qemu-arm <qemu-arm@nongnu.org>, Daode Huang <huangdaode@hisilicon.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7oe6zFltymMV

Hi Peter,

On 2018/1/26 18:01, Peter Maydell wrote:
> On 26 January 2018 at 17:33, Wei Xu <xuwei5@hisilicon.com> wrote:
>> On 2018/1/26 17:15, Peter Maydell wrote:
>>> The pl011 code should call qemu_set_irq(..., 1) when the
>>> guest enables interrupts on the device by writing to the int_enabled
>>> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
>>> VGIC should report the interrupt to the guest.
>>>
>>
>> Yes.
>> And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
>> When writing to the int_enabled, not sure why the int_level is set to
>> 0x20(PL011_INT_TX) but int_enabled is 0x50.
>>
>> It still call qemu_set_irq(..., 0).
>>
>> I added "s->int_level |= PL011_INT_RX" before calling pl011_update
>> when writing to the int_enabled and tested it also works.
> 
> No, that's not right either. int_level should already have the
> RX bit set, because pl011_put_fifo() sets that bit when it gets a
> character from QEMU and puts it into the FIFO.
> 
> Does something else clear the int_level between the character
> going into the FIFO from QEMU and the guest enabling
> interrupts?

Yes. When the guest enabling the interrupts, the pl011 driver in
the kernel will clear the RX interrupts[1].
And pasted the code below to make it easy to read.

	static void pl011_enable_interrupts(struct uart_amba_port *uap)
	{
		spin_lock_irq(&uap->port.lock);

		/* Clear out any spuriously appearing RX interrupts */
		pl011_write(UART011_RTIS | UART011_RXIS, uap, REG_ICR);
		uap->im = UART011_RTIM;
		if (!pl011_dma_rx_running(uap))
		uap->im |= UART011_RXIM;
		pl011_write(uap->im, uap, REG_IMSC);
		spin_unlock_irq(&uap->port.lock);
	}

I tried kept the RXIS in the kernel side to test and found the issue is still there.
A little confused now :(

[1]: https://elixir.free-electrons.com/linux/latest/source/drivers/tty/serial/amba-pl011.c#L1732

Best Regards,
Wei

> 
> thanks
> -- PMM
> 
> .
> 

