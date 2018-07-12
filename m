Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1466733wrq;
        Thu, 12 Jul 2018 07:57:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKyeYDXKdQol5sdovUBYjfdgHqOXm6PigHcYQz/fbmlfHvbf25KT8eFbdff7pyjY8QQunW
X-Received: by 2002:a0c:f002:: with SMTP id z2-v6mr2743178qvk.160.1531407468907;
        Thu, 12 Jul 2018 07:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531407468; cv=none;
        d=google.com; s=arc-20160816;
        b=o/luQmu9VcPOiTGp6Z+RCsbuiid8LY1FvhibuQQc/WP9xPHHP5fELagGccURO42MD2
         Hvy1PzhpR2l1oP6HpKTBJE1H+9l3dtiBa2ddgO3nNdSvrvsmMiVkZP6K8YvSVKEzXoi6
         zDAxBiXmzHXmb4oad4zefi/4WyFktO0o9tQ6f/CaBv+uqLop6hg8lq0QIRKoFb009FqK
         zMF9il+Hc+hU/6uozmQf+n7+uSYp65IzHjOYjvMiGO8r56JnwmJccMmE+csTFgfraHkv
         gLIWMUln3yufhKTG1wSJfB3BXM04W1GYj1m43VYGroEy3Vymhk7OqF67bTo2Br6IeTFz
         VQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=X78CaT80NlJ+c+KcZztil1vpu6yMejrnN9b/2FOgbzw=;
        b=lQgqU7tiWrbneNzyQzUMk5lFBDYFCsEySLImH99IX8TXN91Vby7OHc97/rZ0KnWc0V
         9Bl0MNAN07GGuFesIFUmliynZ+hRdD/RSbUhgWsXV0o/oBqKXAWKjgwmFlu3jbQF00cJ
         0mnBMfNwMXBh59J9UnD5nzVozI7Un028KQhl2j0rEe43vLltRbD1ezvILGGulNKYXuOW
         juKMH/poMKvggWnnRJDdatW6ZTkebQANGtSb09ODqBW9f09AbjngGgSyD1gyOH6afyNV
         p3oJBF7o1rKTTO9z1alJwB2rKgh1lTT+q3U/GECbBVCXp2+/54TqiTATAB0RRvOInBI6
         5cKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJmEiV8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j67-v6si12512406qkh.114.2018.07.12.07.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 07:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJmEiV8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdd2S-0002fV-FH
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 10:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdd2J-0002ek-DC
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdd2I-0000aF-A6
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:57:39 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdd2I-0000ZG-3J
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:57:38 -0400
Received: by mail-oi0-x243.google.com with SMTP id k12-v6so56291716oiw.8
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X78CaT80NlJ+c+KcZztil1vpu6yMejrnN9b/2FOgbzw=;
	b=JJmEiV8Kimw44tqirvVSI0ezovy373aofPpLmWXYqIGl1smQeXjnCYi5GsuoTBLap7
	zP6QOvV/Jj2e9Z/ZG/1n83sAa5TYLl0QNMuwbMmBGvVBO0rupBAA/syn6L1+TVE0a8J4
	S6oekAzwGpVsiIZ1hz9QT4g+wiJkk19VOLmNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X78CaT80NlJ+c+KcZztil1vpu6yMejrnN9b/2FOgbzw=;
	b=L9D8tmdHONGqaXpxQ8kmA6zo9QC3O7KheHsmsG/GVTbugaXqNTjgfUsRVAm+NYR17R
	WEJyEasoP1JZDdbd2KrRkcRp1z15htpBf/WWfaTefRtcRbpe2Oig36z00D8B57+wwYrr
	jlXOEP/IxPHKeDyeZvIY23Q3CjwTknlaWZtoimSuYY0l0or1bOGUv0sRniBIGiozhwgy
	xHPc0358Bhb7MA/OEAgBQ6VoFHS2/K3lTEpa46rVaeTUiEMLfzcsyvn+2MIADgAij8FC
	VugYKCc1dcGscELZ6FW/RH1NWECSz/PlKXtyOtW3afRCBydESfmp6PRW9zYTeZdvfYKl
	CEqg==
X-Gm-Message-State: AOUpUlG/yBOVf1UQifMzKZz4/rwLveON9PjRzgWEE0J5xbyrnR8FkeWu
	3pp87pWIrB4pGIMBlPD2NXRXjkreIjSufoMv7XhfyQ==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr2863214oig.13.1531407457123; 
	Thu, 12 Jul 2018 07:57:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 07:57:16
	-0700 (PDT)
In-Reply-To: <d4a776fc-2022-979e-cc68-beb3123d35bd@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-21-luc.michel@greensocs.com>
	<d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
	<a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
	<d4a776fc-2022-979e-cc68-beb3123d35bd@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 15:57:16 +0100
Message-ID: <CAFEAcA8ZLzy22uJO07UMXmOTwMqLAggeM18NK8ofZg307OXhhQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ylQqaPZmoRtT

On 5 July 2018 at 09:46, Luc Michel <luc.michel@greensocs.com> wrote:
> On 07/05/2018 10:00 AM, Jan Kiszka wrote:
>> On 2018-07-05 08:51, Jan Kiszka wrote:
>>> But now I'm running into troubles with reading back GICD ITARGETSR.
>>> Maybe we are emulating an "early implementation" here?
>>>
>>> [from the related Jailhouse code [1]]
>>> /*
>>>  * Get the CPU interface ID for this cpu. It can be discovered by
>>>  * reading the banked value of the PPI and IPI TARGET registers
>>>  * Patch 2bb3135 in Linux explains why the probe may need to scans the
>>>  * first 8 registers: some early implementation returned 0 for the first
>>>  * ITARGETSR registers.
>>>  * Since those didn't have virtualization extensions, we can safely
>>>  * ignore that case.
>>>  */
>>>
>>> But maybe I'm just off with the configuration, checking...
>>>
>>
>> As suspected, it's a bug in QEMU, this resolves it, and I can run Linux
>> as root cell and a bare metal non-root cell:
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 7d24348d96..199f953ddb 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -965,7 +965,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>>              if (irq >= 29 && irq <= 31) {
>>                  res = cm;
>>              } else {
>> -                res = GIC_DIST_TARGET(irq);
>> +                if (irq < GIC_INTERNAL) {
>> +                    res = 1 << gic_get_current_cpu(s);

We already have the CPU number of the current cpu in the 'cpu'
local variable, so we don't need to call gic_get_current_cpu() again,
and we have 1 << cpu in "cm".

>> +                } else {
>> +                    res = GIC_DIST_TARGET(irq);
>> +                }
>>              }
>>          }
>>      } else if (offset < 0xf00) {
>>
>> Didn't test Linux as non-root cell (secondary guest) yet, but that
>> should work as well. I'm seeing issues in an error shutdown path, but
>> that might be the same on real hw, needs cross-checking.Hi Jan, thanks for your feedback!
>
> Yes I encountered the same issue with Xen in SMP (see my cover letter).
> Re-reading the GICv2 specs, it's now clear to me that a read to
> ITARGETSR0 to ITARGETSR7 should return "the number of the processor
> performing the read". Reading the message of commit 2bb3135 in Linux, it
> seems that older versions of the GIC exposed this value in IRQs 29, 30,
> 31, hence the
>    if (irq >= 29 && irq <= 31) { res = cm; }
> in the current QEMU implementation.
>
> I should probably add a patch to fix that. I'll have to dig in specs of
> older GIC revisions to see when this behaviour actually appeared.

The "29..31 give the current CPU and others are zero" behaviour is
specific to the 11MPCore:
http://arminfo.emea.arm.com/help/topic/com.arm.doc.ddi0360f/CCHBHJFH.html
The GICv1 spec matches the GICv2 here.

So what we want is probably to refactor this to pull the 11MPCore
code out as the top level special case (since it's weird for
uniprocessor setups too). I'll send a patch in a bit...

thanks
-- PMM
