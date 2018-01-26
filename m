Received: by 10.28.71.27 with SMTP id u27csp952612wma;
        Fri, 26 Jan 2018 09:25:05 -0800 (PST)
X-Google-Smtp-Source: AH8x226q/OsLZdrWoM4kiNy1ia8MY/sQUhqsMzKF4XIVr+c3W/MANm+BNaDKEmn9t3zDUXpgHNpM
X-Received: by 10.13.212.67 with SMTP id w64mr11237732ywd.82.1516987505478;
        Fri, 26 Jan 2018 09:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516987505; cv=none;
        d=google.com; s=arc-20160816;
        b=AdeV9YgY2sDIDZwhlVq7krTV3/BDFvmnHIf7WVuwPJ712uiwjOuHMsAUCTfMFh5qJZ
         hqMe+PYGs+XjH4En36c/sASVx45pQdaZLsanV78hmcIzARyLcOo0bEBgdCKBFk17QRTE
         oG9xa36dqtl9fCW/NHg+tFUP3VG/9P3ZVGfOkakQoGbavEWXeHEDu82keZZ79esxb2XS
         Gowimt4enPB/EyIMpkdKuTOX10xgJtGCwOVi7/YCc4+6rOAENIGOb7sRqbuqgTa00vrc
         Ehh97807gTiwJLAm46inZ/3w17X39dOGZ9/iWt3grHQuuc8m5pkkvzrbL4bhbt5T9c2M
         TrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uNifLND6RnDvKnLDQVYIXe/qUh9vNF7mMn4zbI4lNXk=;
        b=A1fbCKforIDXKl3JgAhD0UV3Lnj3wCI1BmzeChYE7qccLWPO+e477lEr/3KuxA9IJK
         Z22qi6qSPufiiL6K7SL2UbAmw076gaybkbWtNXtAaaG368uNo1I8KN8ndVs+a9Rky8BR
         2q0nKbXdVrIBPxRaeeO+TtIW1uzrvqf6i/beSQnkqQmD8yQOJMne/v/AlMdzrNn3V1nc
         W7fjM1Y6vC14mFbwBqhTa+/BILuSOGNi4rJGzvLuPxJHQOSj+d7gwWu0y1UmmDYkb8Hm
         wD4Me3BAdvSJlI89aVuJzdzmYUsdVs7ZqrX6aGFyN2i8NI+AMqPR8E2wD9Sk7c40Ja17
         JPAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AL3z7XSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4si980118ywa.413.2018.01.26.09.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 09:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AL3z7XSu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef7kO-00038p-SQ
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 12:25:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef7hH-0000bt-KL
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:21:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef7hG-0002Z8-KB
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:21:51 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:42641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef7hG-0002YM-FA
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 12:21:50 -0500
Received: by mail-oi0-x243.google.com with SMTP id c8so776653oiy.9
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uNifLND6RnDvKnLDQVYIXe/qUh9vNF7mMn4zbI4lNXk=;
	b=AL3z7XSumr9F9P6H1jK2Z2CpNDbim0Taj4NAF8OpFtV/xQLkMC6BmiU6ZXehzRbuX2
	B3wKROl6yPvJUaD0FWHo4vng3RDK8k5hYwVbHHX6NJs9qEf8YoWQ+NW+YFNLQzP73lnP
	y4TqPYjYCI/bh2u34il+4xnAcUHdL1MpYTl/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uNifLND6RnDvKnLDQVYIXe/qUh9vNF7mMn4zbI4lNXk=;
	b=J4fW8IwOC8IyjxfOr4IitIkTBWjzyBfgSmJhLYy0mgfGfbaGvnbXSNDZ8JhksHieqr
	C5s+GR7SN7fYQgbexbuSVTwa5+7o4xK3z89/YPedsvNj6h6tEx/+H/bwbelM5W23bZPt
	fE4rQ1XG92IQoMX/9nkuOrhp9IFemHGYJGz9lYEKqYx4MfPOF2IQSB1CRu9pqT0cKJYD
	6nFF9TiiAxhpx/cV7oaILmf4dx2YAl6gLV1lsPTtPk0n5FVOa/3LquR6Q0iqc+JcbA3B
	3S6WesrWMoDcUHF40YSzIpQICQmyJCPrDQiDUj2Ei3Y7H73h4RPmL1JsSHwH+kATtfRC
	7fcQ==
X-Gm-Message-State: AKwxytd3/AWP17m24DVELzWJUHsm4eW1k1PXGbkS/LqAqAoYFqcSGDkL
	daodUEiNY1psDG57G7hr4QnKCM0VOqZAAl6/uQLizQ==
X-Received: by 10.202.96.212 with SMTP id u203mr4150994oib.63.1516986937262;
	Fri, 26 Jan 2018 09:15:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 09:15:16 -0800 (PST)
In-Reply-To: <5A6B5FCA.2080009@hisilicon.com>
References: <5A6B5091.8030601@hisilicon.com>
	<CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
	<5A6B5FCA.2080009@hisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 17:15:16 +0000
Message-ID: <CAFEAcA-N-pjHwqrStf-qK+EOmGYyR-4dfY=sL5kLzeodgYUiRw@mail.gmail.com>
To: Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] pl011: do not put into fifo before enabled
 the interruption
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WzL9vRTqzu3T

On 26 January 2018 at 17:05, Wei Xu <xuwei5@hisilicon.com> wrote:
> On 2018/1/26 16:36, Peter Maydell wrote:
>> If the user presses keys before interrupts are enabled,
>> what ought to happen is:
>>  * we put the key in the FIFO, and update the int_level flags
>>  * when the FIFO is full, can_receive starts returning 0 and
>>    QEMU stops passing us new characters
>>  * when the guest driver for the pl011 initializes the
>>    device and enables interrupts then either:
>>     (a) it does something that clears the FIFO, which will
>>     mean can_receive starts allowing new chars again, or
>>     (b) it leaves the FIFO as it is, and we should thus
>>     immediately raise an interrupt for the characters still
>>     in the FIFO; when the guest handles this interrupt and
>>     gets the characters, can_receive will permit new ones
>>
>
> Yes, now it is handled like b.
>
>> What is happening in your situation that means this is not
>> working as expected ?
>
> But in the kernel side, the pll011 is triggered as a level interruption.
> During the booting, if any key is pressed ,the call stack is as below:
> QEMU side:
> pl011_update
> -->qemu_set_irq(level as 0)
> ---->kvm_arm_gic_set_irq
>
> Kernel side:
> kvm_vm_ioctl_irq_line
> -->kvm_vgic_inject_irq
> ---->vgic_validate_injection (if level did not change, return)
> ---->vgic_queue_irq_unlock
>
> Without above changes, in the vgic_validate_injection, because the
> interruption level is always 0, this irq will not be queued into vgic.
> And the guest will not read the pl011 fifo.

The pl011 code should call qemu_set_irq(..., 1) when the
guest enables interrupts on the device by writing to the int_enabled
(UARTIMSC) register. That will be a 0-to-1 level change and the KVM
VGIC should report the interrupt to the guest.

thanks
-- PMM
