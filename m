Received: by 10.28.71.27 with SMTP id u27csp997456wma;
        Fri, 26 Jan 2018 10:08:58 -0800 (PST)
X-Google-Smtp-Source: AH8x225wdaa4rHpZRd4jH9N02D8wHdSxNgl35xJhSOHPG/DsgLXDl+nTcxxEiFn7DxBapQYL4hWc
X-Received: by 10.37.209.206 with SMTP id i197mr11945028ybg.471.1516990138593;
        Fri, 26 Jan 2018 10:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516990138; cv=none;
        d=google.com; s=arc-20160816;
        b=r2P/5hu++LjVMIP2ZlCqR+6i1p14b7JB5CV7SGdAnylleSxtNtnKCTYnbm2Gw4wFMB
         jYdvjRuhhcq+bWoL3mySIcpPnsdc7qIg/L9DeYciYvwNrt8zaI1LlRb5MShhRZVbXerD
         pjzskgVhuTGiA+wz5bCcdOlI48LRZciA/4WeW/VLmB71zNAI7Lxc3R5YuNbbnIUrnALP
         rI/T0Ne/DgLIE8xfbXc4PsVrorh5MPy2/iprDrHaXEUsmkOR4TW/LJVUesdlzOC2eiTU
         UhzA4xEt9hRG8Z3xVjsqQr9UmUHNHZvFRoSV5rOrKO3bbOwPmzxXl7fv1eytvylhaVTD
         2vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ZNBUGVoktsr8pOVjIpbaU5FIHaWgaGtY5jv26m0a8FY=;
        b=viGwcF2enXSKApZb0g/KoGu6+kMpkhVbg6eNKce6rGiMQ8JFTsloFPTQz7GpPpUNge
         UK/Z5lcjyoZTPsL/gsm1aWKpwK9NClRy9QnfBwPzLoszxos6Ruzl11NpuULY1+zlLIml
         Xs2dzCzATMfxO2yi1JolLLZ8ywHPlBnAFciEOvBiSelG3RzxXkX6LlR9nPJ9DDz7EGpE
         3Q1Thz93Pd4srO5VLkkyf+Tiu3KMoBLgIIJwMHVbGOXBxisygV3hAM/hucgYBxkJ8n0+
         /5rBZ+G7DjRT7r5PTDwz96BtG1Dy59uiFmmOCGVo4BRu3y2ZP+2QfjJOPIXJm/l8eGTC
         AI0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si993501ywl.438.2018.01.26.10.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 10:08:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8Qs-00028c-1s
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 13:08:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1ef8BD-0002vY-Go
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 12:52:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xuwei5@huawei.com>) id 1ef8BC-0006mm-HH
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 12:52:47 -0500
Received: from [45.249.212.35] (port=47477 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <xuwei5@huawei.com>)
	id 1ef8B6-0006iX-JM; Fri, 26 Jan 2018 12:52:40 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 0F276C67ACECF;
	Sat, 27 Jan 2018 01:05:33 +0800 (CST)
Received: from [127.0.0.1] (10.202.226.123) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 27 Jan 2018 01:05:23 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5A6B5FCA.2080009@hisilicon.com>
Date: Fri, 26 Jan 2018 17:05:14 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
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
X-TUID: NUUZ2+GM8zVv

Hi Peter,

On 2018/1/26 16:36, Peter Maydell wrote:
> On 26 January 2018 at 16:00, Wei Xu <xuwei5@hisilicon.com> wrote:
>> If the user pressed some keys in the console during the guest booting,
>> the console will be hanged after entering the shell.
>> Because in the above case the pl011_can_receive will return 0 that
>> the pl011_receive will not be called. That means no interruption will
>> be injected in to the kernel and the pl011 state could not be driven
>> further.
>>
>> This patch fixed that issue by checking the interruption is enabled or
>> not before putting into the fifo.
>>
>> Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
>> ---
>>  hw/char/pl011.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index 2aa277fc4f..6296de9527 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -229,6 +229,8 @@ static int pl011_can_receive(void *opaque)
>>      PL011State *s = (PL011State *)opaque;
>>      int r;
>>
>> +    if (!s->int_enabled)
>> +       return 0;
>>      if (s->lcr & 0x10) {
>>          r = s->read_count < 16;
>>      } else {
>> --
> 
> This doesn't look right. You should be able to use the PL011
> in a strictly polling mode, without ever enabling interrupts.
> Returning false in can_receive if interrupts are disabled
> would break that.
> 
> If the user presses keys before interrupts are enabled,
> what ought to happen is:
>  * we put the key in the FIFO, and update the int_level flags
>  * when the FIFO is full, can_receive starts returning 0 and
>    QEMU stops passing us new characters
>  * when the guest driver for the pl011 initializes the
>    device and enables interrupts then either:
>     (a) it does something that clears the FIFO, which will
>     mean can_receive starts allowing new chars again, or
>     (b) it leaves the FIFO as it is, and we should thus
>     immediately raise an interrupt for the characters still
>     in the FIFO; when the guest handles this interrupt and
>     gets the characters, can_receive will permit new ones
>

Yes, now it is handled like b.

> What is happening in your situation that means this is not
> working as expected ?

But in the kernel side, the pll011 is triggered as a level interruption.
During the booting, if any key is pressed ,the call stack is as below:
QEMU side:
pl011_update
-->qemu_set_irq(level as 0)
---->kvm_arm_gic_set_irq

Kernel side:
kvm_vm_ioctl_irq_line
-->kvm_vgic_inject_irq
---->vgic_validate_injection (if level did not change, return)
---->vgic_queue_irq_unlock

Without above changes, in the vgic_validate_injection, because the
interruption level is always 0, this irq will not be queued into vgic.
And the guest will not read the pl011 fifo.

Best Regards,
Wei

> 
> thanks
> -- PMM
> 
> .
> 

