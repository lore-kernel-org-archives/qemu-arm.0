Received: by 10.28.71.27 with SMTP id u27csp995737wma;
        Fri, 26 Jan 2018 10:07:25 -0800 (PST)
X-Google-Smtp-Source: AH8x226BnJ1y2FVRwo4BHyZEz4L59K5bZpj/07E2TPimnqkf24A5g+yRX8SimgFmxBVUZ3JinieR
X-Received: by 10.129.77.9 with SMTP id a9mr11538169ywb.439.1516990045716;
        Fri, 26 Jan 2018 10:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516990045; cv=none;
        d=google.com; s=arc-20160816;
        b=M0oatlcO6RMIPzrwFo7HoDXVQ2v0+SluAL1/Dmqt2HvABtI9qNc0u5EgQ/g6qJQ25b
         1I49eHi76r2p85/byipVt+4D311c1TSJds0wNOWG2UHz4U2UnHTypgny35I8NBY6fb49
         fY140moEaRryKIbHgiKiJZZxpgfHmIFLna/67sPwGqJH3LGaWiyKvWZnqWwczxxbiLp5
         RrGPIpNW/RUJpime960dAXfBvrxPA2zekLx5FdnBdJrobcy+TxweD1fRVkuHmJekk4sL
         CNQBAGEWohlWdbIRrFlscfc68mr3zccRNmaJdRQ/X+ishlrifNqhrwcxNzP4SAG0xvmf
         uSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=cdzCrsj9lTfcC4JWct8nVXTbB7+C5kiwVnAIb560ht4=;
        b=rkHkPKVoOnoevB7J27cCnyyhLN4kGSecLrX06EL00b2LxqE8/zgVLUGHLfmfrspsU7
         vhxLubEuEgE4QFnSXQ5OGHj+tLBqeM/oLU/Sso29cF42g6FBicXBKdDtbSW0crcy9NCY
         ysJ20ZHT+KsqnScbck9Um/P2rW3cRuN23YfPeyQ2ag/4z3gSzyf81cVQ2SF2G2xzwhLK
         c0HgPIozbHxBIWusc/1qskFAWWJPcCSEUFuFp2Sip2lcxZ0aEvRIP7A5pD4CzEFVdfZP
         zRDea5FVr24d0MhKe/iMvLRzwEQl2ha2c/adlnuF9pHP+KTgtUZyopqzbMMqCdhxX8m/
         3jyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si3617248ybm.286.2018.01.26.10.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 10:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8PN-0001KV-4n
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 13:07:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1ef7tA-0001l8-AF
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 12:34:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1ef7t9-0007Bj-Am
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 12:34:08 -0500
Received: from [45.249.212.35] (port=42810 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <xuwei5@huawei.com>)
	id 1ef7t3-000715-KU; Fri, 26 Jan 2018 12:34:01 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id EBEF42955377E;
	Sat, 27 Jan 2018 01:33:55 +0800 (CST)
Received: from [127.0.0.1] (10.202.226.123) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 27 Jan 2018 01:33:46 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
	<CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5A6B6671.8070408@hisilicon.com>
Date: Fri, 26 Jan 2018 17:33:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.123]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
X-Mailman-Approved-At: Fri, 26 Jan 2018 13:07:00 -0500
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
X-TUID: nlLr2pPgJyCX

Hi Peter,

On 2018/1/26 17:15, Peter Maydell wrote:
> On 26 January 2018 at 17:05, Wei Xu <xuwei5@hisilicon.com> wrote:
>> On 2018/1/26 16:36, Peter Maydell wrote:
>>> If the user presses keys before interrupts are enabled,
>>> what ought to happen is:
>>>  * we put the key in the FIFO, and update the int_level flags
>>>  * when the FIFO is full, can_receive starts returning 0 and
>>>    QEMU stops passing us new characters
>>>  * when the guest driver for the pl011 initializes the
>>>    device and enables interrupts then either:
>>>     (a) it does something that clears the FIFO, which will
>>>     mean can_receive starts allowing new chars again, or
>>>     (b) it leaves the FIFO as it is, and we should thus
>>>     immediately raise an interrupt for the characters still
>>>     in the FIFO; when the guest handles this interrupt and
>>>     gets the characters, can_receive will permit new ones
>>>
>>
>> Yes, now it is handled like b.
>>
>>> What is happening in your situation that means this is not
>>> working as expected ?
>>
>> But in the kernel side, the pll011 is triggered as a level interruption.
>> During the booting, if any key is pressed ,the call stack is as below:
>> QEMU side:
>> pl011_update
>> -->qemu_set_irq(level as 0)
>> ---->kvm_arm_gic_set_irq
>>
>> Kernel side:
>> kvm_vm_ioctl_irq_line
>> -->kvm_vgic_inject_irq
>> ---->vgic_validate_injection (if level did not change, return)
>> ---->vgic_queue_irq_unlock
>>
>> Without above changes, in the vgic_validate_injection, because the
>> interruption level is always 0, this irq will not be queued into vgic.
>> And the guest will not read the pl011 fifo.
> 
> The pl011 code should call qemu_set_irq(..., 1) when the
> guest enables interrupts on the device by writing to the int_enabled
> (UARTIMSC) register. That will be a 0-to-1 level change and the KVM
> VGIC should report the interrupt to the guest.
> 

Yes.
And in the pl011_update, the irq level is set by s->int_level & s->int_enabled.
When writing to the int_enabled, not sure why the int_level is set to
0x20(PL011_INT_TX) but int_enabled is 0x50.
It still call qemu_set_irq(..., 0).

I added "s->int_level |= PL011_INT_RX" before calling pl011_update
when writing to the int_enabled and tested it also works.
How do you think about like that?
Thanks!

Best Regards,
Wei

> thanks
> -- PMM
> 
> .
> 

