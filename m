Received: by 10.25.27.66 with SMTP id b63csp378496lfb;
        Thu, 9 Jun 2016 08:24:39 -0700 (PDT)
X-Received: by 10.140.153.135 with SMTP id 129mr10629935qhz.71.1465485879352;
        Thu, 09 Jun 2016 08:24:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si3652883qkl.235.2016.06.09.08.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 08:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB1p0-0004he-SB
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 11:24:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB1ox-0004hC-7X
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 11:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB1ov-0004DG-CX
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 11:24:35 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB1ou-0004CU-Kx
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 11:24:33 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e4so59698707vkb.1
	for <qemu-arm@nongnu.org>; Thu, 09 Jun 2016 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OeSPnyNRCXCTWBNwANcXsbnvoaFre0rnkqAJyBa1FKA=;
	b=N8ZL/QcKJYhGchAy7mdHg3FCuH/46MXLiixsXeSDUkOx8/om9BdCmRqCm68rHBeaIo
	92wZk2qE6MeNlpsDAqsz2/R14o37d1YZSNBXgxiP1VPQgzUZJCVzrVj/2SxjO4tECLnt
	Q/CJV2rSru/c5B3ELU8cQPK9AXoBusb3PXtAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OeSPnyNRCXCTWBNwANcXsbnvoaFre0rnkqAJyBa1FKA=;
	b=bbmVT0qRGlNnUuVOH2EhdCQsHp8YYCcTtVTJZbfmogj4vSiNfMjNnktzeRN+faRpsM
	0ESWj6iwcL06BmANkiW8HyDgBgNv3Ej4LQ+FRuPQGdECkqYo87ESFofZJPrvKQUW/WZI
	ngmqn2baSTk3mb+YTrNqrMwQ/N0j2kUElntjiAomAfZMfVqSfTqW7fJ40lrl0uJupxvv
	xsV0uhqLFxjM/AOAeQFxZeWT7xtQ5wynC/AIkBMY1xxOoNmIsjUdI3BKvsYOXNOyHQ/6
	iuVXQBmjiTfYVpaA3iFtjhRWm0ki+lpErKGfsIicWwpxTpg3B33+lx6LKByAMW91hxAj
	KLrg==
X-Gm-Message-State: ALyK8tK7bpp/ZJ+KNItULs+fMTlnKHXdLDrALFfpP+Y+2ybz/jWd7+iwJWjIc3Uu7WO4/VpncbF9XEX19VLjhJGg
X-Received: by 10.31.81.199 with SMTP id f190mr4055978vkb.139.1465485871591;
	Thu, 09 Jun 2016 08:24:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 08:24:12 -0700 (PDT)
In-Reply-To: <57577B92.90203@huawei.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-11-git-send-email-peter.maydell@linaro.org>
	<57577B92.90203@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 16:24:12 +0100
Message-ID: <CAFEAcA9KwtW55==xU2EYOWU3L2oq6R6BZsz5LGO-8w_FP9V-=Q@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 10/22] hw/intc/arm_gicv3:
 Implement functions to identify next pending irq
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0E0mIFbLEYdC

On 8 June 2016 at 02:57, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/26 22:55, Peter Maydell wrote:
>> Implement the GICv3 logic to recalculate the highest priority pending
>> interrupt for each CPU after some part of the GIC state has changed.
>> We avoid unnecessary full recalculation where possible.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +static uint32_t gicd_int_pending(GICv3State *s, int irq)
>> +{
>> +    /* Recalculate which redistributor interrupts are actually pending
> s/redistributor/distributor/

Fixed.

>> +static inline int gicv3_irq_group(GICv3State *s, GICv3CPUState *cs, int irq)
>> +{
>> +    bool grpbit, grpmodbit;
>> +
>> +    if (irq < GIC_INTERNAL) {
>> +        grpbit = extract32(cs->gicr_igroupr0, irq, 1);
>> +        grpmodbit = extract32(cs->gicr_igrpmodr0, irq, 1);
>> +    } else {
>> +        grpbit = gicv3_gicd_group_test(s, irq);
>> +        grpmodbit = gicv3_gicd_grpmod_test(s, irq);
>> +    }
>> +    if (grpbit) {
>> +        return GICV3_G1NS;
>> +    }
>> +    if (s->gicd_ctlr & GICD_CTLR_DS) {
>> +        return GICV3_G0;
>> +    }
>> +    return grpmodbit ? GICV3_G1 : GICV3_G0;
> Maybe it could be written like below:
>     if (s->gicd_ctlr & GICD_CTLR_DS || !grpmodbit) {
>         return GICV3_G0;
>     }
>     return GICV3_G1;

I think I prefer the way it is currently, as it better
matches what we're trying to say:
 * if security is disabled, there is no grpmodbit, so always G0
 * otherwise, look at grpmodbit to determine G1 vs G0

>> +static inline void gicv3_cache_target_cpustate(GICv3State *s, int irq)
>> +{
>> +    GICv3CPUState *cs = NULL;
>> +    int i;
>> +    uint32_t tgtaff = extract64(s->gicd_irouter[irq], 0, 24) |
>> +        extract64(s->gicd_irouter[irq], 32, 8);
> This should be extract64(s->gicd_irouter[irq], 32, 8) << 24

Oops. Fixed.

thanks
-- PMM
