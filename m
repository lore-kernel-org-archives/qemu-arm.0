Received: by 10.25.21.96 with SMTP id l93csp61257lfi;
        Tue, 14 Jun 2016 05:37:38 -0700 (PDT)
X-Received: by 10.200.38.120 with SMTP id v53mr12086838qtv.90.1465907858683;
        Tue, 14 Jun 2016 05:37:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f23si16503318qhf.84.2016.06.14.05.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 05:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCnb8-0004y0-2x
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 08:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCnPm-0002ql-JF
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 08:25:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCnPj-0005Bh-BH
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 08:25:53 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35957)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCnPj-0005BG-5W
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 08:25:51 -0400
Received: by mail-vk0-x236.google.com with SMTP id u64so107259387vkf.3
	for <qemu-devel@nongnu.org>; Tue, 14 Jun 2016 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1w5IqAFeojaSIkYBscXqfY30JpmDf0FyMplj4n+GJx4=;
	b=Jd3Qix0kKuN+PbLeFKDsga1yYt8AW/lKwWw3mWdEHgbIIprdNMlosVAlgumHwE9WDb
	UvF4mKV60VQVskdxn18tZb72YzAJKm2aGvT3mVfNq2yrMr7AG3m9y7uvXu5+CyoHhcTi
	vTTEB9lI9TUqANiyjsidU3mn4CmyEuP1uY/w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1w5IqAFeojaSIkYBscXqfY30JpmDf0FyMplj4n+GJx4=;
	b=OdAoQxgty6sHIy2We9jicu9+2lhid2j2w/nWH1I53ZIxsLHTLpCUhBJlMsqYEhG2ec
	A17wyuoOBj4BBsVzOcphGlLvule+BbDx0dz2X97ZrzePXp2hGjk/9zjvS8+fs9tnbI7a
	9tR9jsQxPqiClXZ/jcADaPG4SN4xFvtdiH6rwvFHjJ+y3MyqF7MLDqy3k48h+faOolEg
	zvJV501buo3QoRnGD2DnimEZIylkE9MjBdlAC2mpWupXUCD+VzGvgGqEeiTnG4zXGYzA
	dRJ592OhoKU3kVRzBzYQW+2qDOhz7Gfpu1d/tdHfwUf4adTh/Cqf5pTpOOKmqSpF7SXY
	SLKA==
X-Gm-Message-State: ALyK8tJd9tx9q+EGjWz5K4q9vY0noi0cdkbxtvVqcptWUPYUqSCfCVZhg1obDZpv5RUMXaPpNfv2e8nRcaY7tggp
X-Received: by 10.176.5.227 with SMTP id e90mr9069414uae.4.1465907150620; Tue,
	14 Jun 2016 05:25:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Tue, 14 Jun 2016 05:25:31 -0700 (PDT)
In-Reply-To: <575F7577.1020903@huawei.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-13-git-send-email-peter.maydell@linaro.org>
	<575F7577.1020903@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jun 2016 13:25:31 +0100
Message-ID: <CAFEAcA-HB57NGY=+8EeX4XFWoe8SSNJq66WGEPJsqTOQcG-WcA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-devel] [PATCH v2 12/22] hw/intc/arm_gicv3: Implement
 GICv3 redistributor registers
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rVrBqMpdNPop

On 14 June 2016 at 04:09, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/26 22:55, Peter Maydell wrote:
>> Implement the redistributor registers of a GICv3.

>> +    case GICR_ISENABLER0:
>> +    case GICR_ICENABLER0:
>> +        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_ienabler0);

> GICv3 SPEC says when GICD_CTLR.DS == 0, for GICD_ICENABLER<n> bits
> corresponding to Group 0 and Secure Group 1 interrupts are RAZ/WI to
> Non-secure accesses. But for GICR_ICENABLER0 all bits are RAZ/WI to
> Non-secure accesses. It doesn't care the interrupt Group. If so,
> gicr_read_bitmap_reg() wrongly uses the return value of mask_group() as
> the mask.

The spec says for GICR_ICENABLER0 "When GICD_CTLR.DS == 0, bits corresponding
to Secure SGIs and PPIs are RAZ/WI to Non-secure accesses". So we are
correct to look at the group bit I think.

>> +        return MEMTX_OK;
>> +    case GICR_ISPENDR0:
>> +    case GICR_ICPENDR0:
>> +    {
>> +        /* The pending register reads as the logical OR of the pending
>> +         * latch and the input line level for level-triggered interrupts.
>> +         */
>> +        uint32_t val = cs->gicr_ipendr0 | (~cs->edge_trigger & cs->level);
>> +        *data = gicr_read_bitmap_reg(cs, attrs, val);
>> +        return MEMTX_OK;
>> +    }
>> +    case GICR_ISACTIVER0:
>> +    case GICR_ICACTIVER0:
>> +        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_iactiver0);
>> +        return MEMTX_OK;
>> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
>> +    {
>> +        int i, irq = offset - GICR_IPRIORITYR;
>> +        uint32_t value = 0;
>> +
>> +        for (i = irq + 3; i >= irq; i--, value <<= 8) {
>> +            value |= gicr_read_ipriorityr(cs, attrs, i);
>> +        }
>> +        *data = value;
>> +        return MEMTX_OK;
>> +    }
>> +    case GICR_ICFGR0:
>> +    case GICR_ICFGR1:
>> +    {
>> +        /* Our edge_trigger bitmap is one bit per irq; take the correct
>> +         * half of it, and spread it out into the odd bits.
>> +         */
>> +        uint32_t value;
>> +
>> +        value = cs->edge_trigger & mask_group(cs, attrs);
> For GICR_ICFGR0, it doesn't need to use mask_group() as mask because the
> SPEC doesn't say it's RAZ/WI to a Group 0 or Secure Group 1 interrupt.

This is a bug in the GICv3 spec which will be fixed in a newer
rev of the document. GICR_ICFGR0 should say that "When GICD_CTLR.DS==0,
a register bit that corresponds to a Group 0 or Secure Group 1
interrupt is RAZ/WI to Non-secure accesses".

>> +        value = extract32(value, (offset == GICR_ICFGR1) ? 16 : 0, 16);
>> +        value = half_shuffle32(value) << 1;
>> +        *data = value;
>> +        return MEMTX_OK;
>> +    }
>> +    case GICR_IGRPMODR0:
>> +        if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
>> +            /* RAZ/WI if security disabled, or if
>> +             * security enabled and this is an NS access
>> +             */
>> +            *data = 0;
>> +            return MEMTX_OK;
>> +        }
>> +        *data = cs->gicr_igrpmodr0;
>> +        return MEMTX_OK;
>> +    case GICR_NSACR:
>> +        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
>> +            *data = 0;
>> +            return MEMTX_OK;
>> +        }
>> +        *data = cs->gicr_nsacr;
> Look like this is not consistent with the SPEC.
> The SPEC says
> "When GICD_CTLR.DS == 1, this register is RAZ/WI.
> When GICD_CTLR.DS == 0, this register is Secure, and is RAZ/WI to
> Non-secure accesses."
>
> So when GICD_CTLR.DS == 1, it should make *data = 0.

Agreed. This should have the same kind of condition as GICR_IGRPMODR0:

        if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
            /* RAZ/WI if security disabled, or if
             * security enabled and this is an NS access
             */
            *data = 0;
            return MEMTX_OK;

(similarly for writes)

thanks
-- PMM
