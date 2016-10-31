Received: by 10.80.166.35 with SMTP id d32csp56271edc;
        Mon, 31 Oct 2016 03:15:28 -0700 (PDT)
X-Received: by 10.55.16.10 with SMTP id a10mr22605658qkh.66.1477908928572;
        Mon, 31 Oct 2016 03:15:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si17045935qtu.127.2016.10.31.03.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 03:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c19cm-0000sj-2m
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 06:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c19cf-0000px-Vz
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 06:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c19ce-0002LU-VS
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 06:15:21 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:35637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c19ce-0002LC-Is
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 06:15:20 -0400
Received: by mail-ua0-x231.google.com with SMTP id 12so100139111uas.2
	for <qemu-arm@nongnu.org>; Mon, 31 Oct 2016 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XQIca8Ve4IL5ZdGvyYds1/aJhBW4vmmCL03eHl7LEVs=;
	b=C2evbIoGRa3Fvy5eC3uNdZ6Y0oUJoRwny2jd1A/JTbNwO/akTWjxq0vRdlOA/aR6nB
	iiNX1rqnfC1aQiMeW3EDEAdJ3NnjS1smRxJfs7hKI0nFCmrn8Vg9kVyEjQ5y9oxP2w4l
	FaPrcu1jI763g/SUQIL3XECC5/di7HbkeebNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XQIca8Ve4IL5ZdGvyYds1/aJhBW4vmmCL03eHl7LEVs=;
	b=YiQmBZ8j9Sn7Xu0Wnt6lW/CgWBvDdswQ8K5pv3Vqb8lZ2/zVPD3UIF50jy97iqoV+5
	/LZdwp1w7TX9yDiKC1ubSTHqlD5e3vaF93LVxwuiU/oPFZ+j+/a7NJ6BYqB/zcoV5vLC
	A/p1c7wNx/TTEtQbYLRBWc9A0CUdLb5QK8vX/9zZeE3IfiOWo+mhn8Fx6C9bw2XE8rm2
	ZS5VBUKGgqBI3GA70p6VhXdiEjK9aJxJ/0nheAL92iz5TsbzAErhxOl7jdToxEr1XIRe
	NSwZPcoDtNJmPpGGTknDTESqxgNgtpJfOKukPbaEOYBFSsVxwXkciPdeQS7/3hvdz5AZ
	6Ehw==
X-Gm-Message-State: ABUngvckX+x8EtKBW0zEr1euc/Yftzdo2V2boijOwaUFM4nWap4RkifyBDeRvPsq2mN6Ba8k9J4GxngbGW3TEo0f
X-Received: by 10.176.3.137 with SMTP id 9mr13241151uau.120.1477908919913;
	Mon, 31 Oct 2016 03:15:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 31 Oct 2016 03:14:59 -0700 (PDT)
In-Reply-To: <AM4PR0701MB213042F89412D6561736F11FFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-QTUvqJvHwd11-UhGGiatH4PKkupthGh9Xzw3C1vHRGw@mail.gmail.com>
	<AM4PR0701MB213042F89412D6561736F11FFEAE0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 10:14:59 +0000
Message-ID: <CAFEAcA-KpYEiw3uCMh8gKMyP=OxX2Q35pQ8PCEHRFXkadcXYwQ@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [v2] nvic: set pending status for not active
 interrupts
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
Cc: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P91A+RCNAm8D

On 31 October 2016 at 09:11, Krzeminski, Marcin (Nokia - PL/Wroclaw)
<marcin.krzeminski@nokia.com> wrote:
> Peter,
>
>> -----Original Message-----
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> > +static void gic_set_irq_nvic(GICState *s, int irq, int level,
>> > +                                 int cm, int target) {
>> > +    if (level) {
>> > +        GIC_SET_LEVEL(irq, cm);
>> > +        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)
>> > +                || !GIC_TEST_ACTIVE(irq, cm)) {
>> > +            DPRINTF("Set %d pending mask %x\n", irq, target);
>> > +            GIC_SET_PENDING(irq, target);
>> > +        }
>>
>> Why is GIC_TEST_ENABLED() in this condition, when the idea is that we don't
>> care about the enabled status for whether we can pend the interrupt?
>>
>> I think this should actually just always do
>>    GIC_SET_PENDING(irq, target)
>> whenever level is high
>>
>> because:
>>  (1) pending status can be set for disabled interrupts
>>  (2) edge-triggered IRQs definitely always re-pend on rising edge
>>  (3) I think level-triggered IRQs do too (it's a bit
>>      less clear in the docs, but DUI0552A 4.2.9 says we pend on
>>      a rising edge and doesn't say that applies only to edge
>>      triggered IRQs)
>>
>> I don't have any real hardware to hand to test against, though.
>>
> Yes, it works exactly as you're saying (checked on HW), if level is still
> high after exit interrupt handler, interrupt is re-pend.

"after exiting interrupt handler" is the wrong condition to check.
You need to:
 * cause the interrupt line to be set
 * enter the interrupt handler as a result (int becomes active)
 * cause the interrupt line to be lowered (while in the handler)
 * cause the interrupt line to be set again (still in the handler)
 * check the interrupt pending state (still in the handler)

If you only check the pending state after exiting the handler,
then you can't tell whether it was pended on the rising edge
while active, or for the "re-pend if high when we leave the
interrupt handler". We know the hardware does the latter, it's
the former we're unsure about.

thanks
-- PMM
