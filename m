Received: by 10.25.77.65 with SMTP id a62csp846334lfb;
        Mon, 13 Feb 2017 04:51:17 -0800 (PST)
X-Received: by 10.237.56.68 with SMTP id j62mr22241011qte.185.1486990277548;
        Mon, 13 Feb 2017 04:51:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29si1692981qkw.161.2017.02.13.04.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 04:51:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdG66-0008Qh-W6
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 07:51:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cdFZx-0004ZI-8R
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 07:18:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cdFZv-0004MK-63
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 07:18:01 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:35920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cdFZv-0004KS-00; Mon, 13 Feb 2017 07:17:59 -0500
Received: by mail-ot0-x243.google.com with SMTP id 36so11000944otx.3;
	Mon, 13 Feb 2017 04:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y5vMeDF+7oV9/1BEbG3XFR58H5lnu9mq/VN2QILZPko=;
	b=Qekn4pBtzXve6HP6xCAA25YvxVyBtKjvTwVcmaHGthTAq7vYlYkIuiSq5bS18Ii23r
	0p80CzAhDV2DKeA8jzjdC7SObBb7VaMCRwJeseb6ndH217x+L5+GaCjHfNGfolLWjfpE
	LZZRi7AO0A+tVuHvKDsl7JJS6/u8e2pu18enTzj3xNzabG55UvPRgMHViJcqUfIZG8Yd
	9MVabcjNvN2nDSNWSM4eLpfO7FLzMqKaL5X4y+3y21jo9hCAZWpQk1QSUFoe0YCjs1JV
	/rGo7Axk5SW9EysLLjkX35kl23N1SX2zoTrbJf5LIDy4qMWek+dvfkeqXV7gP9qOEXj7
	J+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y5vMeDF+7oV9/1BEbG3XFR58H5lnu9mq/VN2QILZPko=;
	b=a4Q8y9/CPQQltzoUWDdTqJBpnZdRAZvtelcMDag4BRIacQ1DYpkA/vbK+Sp2Zme7K4
	YT5OllUtSbwcrQWTZO2ndq6B9wQuoGQ4gznuBwsDE2GHTIYX5XzT0vP5x16h5Ubvelth
	YksUSeEKzK8uz9o7RuaDhzb8ZLfxu8VXtYkIaoreE17c1vBjT2k7la/5LDoSjTlG5rhj
	r7JZwLk1NjWZ0MeOLB6D+LHx7jaWMel54tEqZ8Ts3TeSyq1HbUkuEceuQ9vlwtQtHhlu
	55YozsjoivbrTOKlTced4Ak3Mb02SXm4B41E5ob2DLYenWC+MmZfRWat0onz0yDyz5T9
	yAAg==
X-Gm-Message-State: AMke39l8Mr7t5OA9k/uN3JqlLfZcPGHJsJUjWUNcnD8ZmtO2R2YWVjp7ASKCLP0htVyv+F29ai/6TG536++xOQ==
X-Received: by 10.157.1.196 with SMTP id e62mr13604090ote.177.1486988276780;
	Mon, 13 Feb 2017 04:17:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.37.84 with HTTP; Mon, 13 Feb 2017 04:17:56 -0800 (PST)
In-Reply-To: <CAFEAcA_K2TcihHTTrrr7kZ3pGZ3BNptDb0mt5Rc0YinkGD1eHQ@mail.gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_K2TcihHTTrrr7kZ3pGZ3BNptDb0mt5Rc0YinkGD1eHQ@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Mon, 13 Feb 2017 17:47:56 +0530
Message-ID: <CALicx6v7B3145pJXsOcgGass8xG4HHY7=iA6gEHKbMcHxqQD-A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v7 RESEND 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1I7Fy+DJAf5B

On Tue, Feb 7, 2017 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 31 January 2017 at 16:22,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> To Save and Restore ICC_SRE_EL1 register Add ICC_SRE_EL1 register
>> to vmstate and GICv3CPUState struct.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  hw/intc/arm_gicv3_common.c         | 1 +
>>  include/hw/intc/arm_gicv3_common.h | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 0f8c4b8..f3245d9 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -68,6 +68,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>>          VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
>>          VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
>>          VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
>> +        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
>>          VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
>>          VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
>>          VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 3),
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index 341a311..183c7f8 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>>
>>      /* CPU interface */
>> +    uint64_t icc_sre_el1;
>>      uint64_t icc_ctlr_el1[2];
>>      uint64_t icc_pmr_el1;
>>      uint64_t icc_bpr[3];
>
> This breaks migration compatibility for TCG using GICv3; you
> need to do something here with a VMState subsection so
> the new register is only transferred if it's non-zero.

So, you mean to put a check in kvm_arm_gicv3_put() and
kvm_arm_gicv3_get() to check for non-zero value?
icc_sre_el1 is always non-zero reset to 0xf in TCG and 0x7 in KVM mode.

>
> thanks
> -- PMM
