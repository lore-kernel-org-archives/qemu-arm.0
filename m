Received: by 10.28.91.67 with SMTP id p64csp784079wmb;
        Fri, 9 Mar 2018 05:20:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELt9V5QKoMFibZYLPr94etFoN2SG6zGkyJKeaIsWsO8fjPKCkAnQ4x6ldagh5fRgRgfhGkXn
X-Received: by 10.13.192.129 with SMTP id b123mr5630509ywd.491.1520601615350;
        Fri, 09 Mar 2018 05:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520601615; cv=none;
        d=google.com; s=arc-20160816;
        b=y2eedONaudpYYOxRbzrF5rFf0sZUW1hBKegoqPrvT1181aXI9cN1nERyuoOayVHqwu
         nQ4HQd+FD1a77Z//uwo5JqFABEbYwI0Yja7ozVDSbSi91NVfoveBZOHwjRdV07QTuW8T
         t0Nhcvduvd2UEwqALRe4yBT9jx24EvNKuQsZCYhZeUoyXdpGOHje4t2wi2wH+PNiqq2Y
         0v7w6Hz6z2w41dPQ2QGjtD6zcYya/gfvFN6EBoFDE/rKDKZdxGeYqIS50uFmyp+K9wv/
         iHtxAzKEV2dSiNjoA7sh3EJszzHPx38CQ5S1+fQrcO1OVI8Y8xCNPIyF5AikZy8KEnPt
         bzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=cNEdplkZBS8BeRYGOGSiQ+Kva9uOEDs/tzK+FsONfU8=;
        b=SWtfRdXJrd+ydc6EW/Xu11TQtgccn7paUfYjwIZdsPGYIhNITHTp/BnwRimgezeScS
         1WpIBeYPX1qEpPnY0YQa3SNysb1RmkAtJHoGUFlFsJdQKyTceDnHr08tw77g2uRTNaPM
         RzTg0k4MmH5oJKSOhM5i2UwigCtNoXDGwlrYoEHDqAQAW++7741KyHAJQXcAqd3vrf3p
         nbokRE+n/153dSXDqCtWQFcObO6GfjKFMTxfA/DNYaRXWrKW4EWGuv5E5Jr7Co4xKwgZ
         m2fBBsjMLy+cPkALseOsT1gOQxZq06wsh46A4YMeUE8O1Nn2MMtUZl0DCGqtV1MKcF0g
         08gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si147984ywi.542.2018.03.09.05.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 05:20:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euHwU-000119-OB
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 08:20:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euHwK-0000wo-Vo
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:20:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euHwD-0007LW-Qg
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:20:04 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48110 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euHwD-0007L2-LH; Fri, 09 Mar 2018 08:19:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9437CD142C;
	Fri,  9 Mar 2018 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 758A6202322A;
	Fri,  9 Mar 2018 13:19:47 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA871Ju5cV8EYiXEg65Rofh=Pn2=2h8wy4-QXj-wUzoj+g@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d8fbbd0d-3e15-92b2-9e26-fb0103abe65f@redhat.com>
Date: Fri, 9 Mar 2018 14:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA871Ju5cV8EYiXEg65Rofh=Pn2=2h8wy4-QXj-wUzoj+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 09 Mar 2018 13:19:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 09 Mar 2018 13:19:54 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 04/14] hw/arm/smmuv3: Skeleton
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hjly7MznyjBo

Hi Peter,

On 08/03/18 15:27, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> This patch implements a skeleton for the smmuv3 device.
>> Datatypes and register definitions are introduced. The MMIO
>> region, the interrupts and the queue are initialized.
>>
>> Only the MMIO read operation is implemented here.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> 
> I just have a few minor nits on this one...
> 
> 
>> +static inline int smmu_enabled(SMMUv3State *s)
>> +{
>> +    return FIELD_EX32(s->cr[0], CR0, SMMU_ENABLE);
>> +}
>> +
>> +typedef struct Cmd {
>> +    uint32_t word[4];
>> +} Cmd;
>> +
>> +typedef struct Evt  {
>> +    uint32_t word[8];
>> +} Evt;
> 
> Some one-liner comments noting what these structs are for
> would be helpful.
sure
> 
>> +
>> +static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
>> +                                   unsigned size)
> 
> A doc comment here would help in describing what the purpose of
> this utility function is.
done
> 
>> +{
>> +    if (size == 8 && !offset) {
>> +        return r;
> 
> If you take my advice a bit further down about just checking
> up front that 8-byte accesses are to definitely permitted 64
> bit register offsets, you won't need the check on offset.
OK. I created a readl and readll to check this as done in gic. So
eventually removed smmu_read64().
> 
>> +    }
>> +
>> +    /* 32 bit access */
>> +
>> +    if (offset && offset != 4)  {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "SMMUv3 MMIO read: bad offset/size %u/%u\n",
>> +                      offset, size);
> 
> This isn't a guest error, because the function is only ever called
> with constant values for the 'offset' parameter. You should just
> assert that the offset is 0 or 4.
indeed
> 
>> +        return 0;
>> +    }
>> +
>> +    return extract64(r, offset << 3, 32);
>> +}
>> +
>> +#endif
> 
>> +static void smmuv3_init_regs(SMMUv3State *s)
>> +{
>> +    /**
>> +     * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>> +     *       multi-level stream table
>> +     */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
>> +    /* terminated transaction will always be aborted/error returned */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TERM_MODEL, 1);
>> +    /* 2-level stream table supported */
>> +    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, 1);
>> +
>> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZE);
>> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, 19);
>> +    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   19);
>> +
>> +   /* 4K and 64K granule support */
>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>> +
>> +    s->cmdq.base = deposit64(s->cmdq.base, 0, 5, 19); /* LOG2SIZE = 19 */
>> +    s->cmdq.prod = 0;
>> +    s->cmdq.cons = 0;
>> +    s->cmdq.entry_size = sizeof(struct Cmd);
>> +    s->eventq.base = deposit64(s->eventq.base, 0, 5, 19); /* LOG2SIZE = 19 */
> 
> Have some #defines for max cmd queue and event queue size, since
> we use them here and also above in filling in the IDR fields ?
done
> 
>> +    s->eventq.prod = 0;
>> +    s->eventq.cons = 0;
>> +    s->eventq.entry_size = sizeof(struct Evt);
>> +
>> +    s->features = 0;
>> +    s->sid_split = 0;
>> +}
>> +
>> +static void smmu_write_mmio(void *opaque, hwaddr addr,
>> +                            uint64_t val, unsigned size)
>> +{
>> +    /* not yet implemented */
>> +}
>> +
>> +static uint64_t smmu_read_mmio(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    SMMUState *sys = opaque;
>> +    SMMUv3State *s = ARM_SMMUV3(sys);
>> +    uint64_t val;
>> +
>> +    /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>> +    addr &= ~0x10000;
>> +
>> +    if (size != 4 && size != 8) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 MMIO read: bad size %u\n", size);
> 
> Your MemoryRegionOps settings mean this can never happen, so you
> don't need to check it at runtime.
OK
> 
>> +        return 0;
>> +    }
> 
> Consider specifically catching 8-byte accesses to non-64-bit registers?
> This is CONSTRAINED UNPREDICTABLE (see spec section 6.2), and "one
> of the registers is read/written and other half is RAZ/WI" is permitted
> behaviour, but it does mean you need to be a little careful about not
> letting the top 32 bits of val become non-zero for the 32-bit register
> codepaths. Logging bad 64-bit accesses as LOG_GUEST_ERROR and making
> them RAZ/WI might be nicer for guest software developers.
I moved to ops with attrs and if a 64-bit access is attempted on
something not a 64b reg base, I return an error + log a guest error.
> 
>> +
>> +    /* Primecell/Corelink ID registers */
>> +    switch (addr) {
>> +    case A_CIDR0:
>> +        val = 0x0D;
>> +        break;
>> +    case A_CIDR1:
>> +        val = 0xF0;
>> +        break;
>> +    case A_CIDR2:
>> +        val = 0x05;
>> +        break;
>> +    case A_CIDR3:
>> +        val = 0xB1;
>> +        break;
>> +    case A_PIDR0:
>> +        val = 0x84; /* Part Number */
>> +        break;
>> +    case A_PIDR1:
>> +        val = 0xB4; /* JEP106 ID code[3:0] for Arm and Part numver[11:8] */
>> +        break;
>> +    case A_PIDR3:
>> +        val = 0x10; /* MMU600 p1 */
>> +        break;
>> +    case A_PIDR4:
>> +        val = 0x4; /* 4KB region count, JEP106 continuation code for Arm */
>> +        break;
>> +    case 0xFD4 ... 0xFDC: /* SMMU_PDIR 5-7 */
>> +        val = 0;
>> +        break;
> 
> I usually put all the const CIDR/PIDR values in a const array, since
> there are always 12 of them next to each other, but since you already
> have this code it's fine.
Switched to the array as suggested.
> 
>> +    case A_IDR0 ... A_IDR5:
>> +        val = s->idr[(addr - A_IDR0) / 4];
>> +        break;
>> +    case A_IIDR:
>> +        val = s->iidr;
>> +        break;
>> +    case A_CR0:
>> +        val = s->cr[0];
>> +        break;
>> +    case A_CR0ACK:
>> +        val = s->cr0ack;
>> +        break;
>> +    case A_CR1:
>> +        val = s->cr[1];
>> +        break;
>> +    case A_CR2:
>> +        val = s->cr[2];
>> +        break;
>> +    case A_STATUSR:
>> +        val = s->statusr;
>> +        break;
>> +    case A_IRQ_CTRL:
>> +        val = s->irq_ctrl;
>> +        break;
>> +    case A_IRQ_CTRL_ACK:
>> +        val = s->irq_ctrl_ack;
>> +        break;
>> +    case A_GERROR:
>> +        val = s->gerror;
>> +        break;
>> +    case A_GERRORN:
>> +        val = s->gerrorn;
>> +        break;
>> +    case A_GERROR_IRQ_CFG0: /* 64b */
>> +        val = smmu_read64(s->gerror_irq_cfg0, 0, size);
>> +        break;
>> +    case A_GERROR_IRQ_CFG0 + 4:
>> +        val = smmu_read64(s->gerror_irq_cfg0, 4, size);
>> +        break;
>> +    case A_GERROR_IRQ_CFG1:
>> +        val = s->gerror_irq_cfg1;
>> +        break;
>> +    case A_GERROR_IRQ_CFG2:
>> +        val = s->gerror_irq_cfg2;
>> +        break;
>> +    case A_STRTAB_BASE: /* 64b */
>> +        val = smmu_read64(s->strtab_base, 0, size);
>> +        break;
>> +    case A_STRTAB_BASE + 4: /* 64b */
>> +        val = smmu_read64(s->strtab_base, 4, size);
>> +        break;
>> +    case A_STRTAB_BASE_CFG:
>> +        val = s->strtab_base_cfg;
>> +        break;
>> +    case A_CMDQ_BASE: /* 64b */
>> +        val = smmu_read64(s->cmdq.base, 0, size);
>> +        break;
>> +    case A_CMDQ_BASE + 4:
>> +        val = smmu_read64(s->cmdq.base, 4, size);
>> +        break;
>> +    case A_CMDQ_PROD:
>> +        val = s->cmdq.prod;
>> +        break;
>> +    case A_CMDQ_CONS:
>> +        val = s->cmdq.cons;
>> +        break;
>> +    case A_EVENTQ_BASE: /* 64b */
>> +        val = smmu_read64(s->eventq.base, 0, size);
>> +        break;
>> +    case A_EVENTQ_BASE + 4: /* 64b */
>> +        val = smmu_read64(s->eventq.base, 4, size);
>> +        break;
>> +    case A_EVENTQ_PROD:
>> +        val = s->eventq.prod;
>> +        break;
>> +    case A_EVENTQ_CONS:
>> +        val = s->eventq.cons;
>> +        break;
>> +    default:
>> +        error_report("%s unhandled access at 0x%"PRIx64, __func__, addr);
> 
> This should be a LOG_GUEST_ERROR (if there are registers we don't
> implement, you can define the A_* constants for them and have those
> do a LOG_UNIMP.)
changed to LOG_GUEST_ERROR
> 
>> +        break;
>> +    }
>> +
>> +    trace_smmuv3_read_mmio(addr, val, size);
>> +    return val;
>> +}
>> +
> 
>> +static void smmu_realize(DeviceState *d, Error **errp)
>> +{
>> +    SMMUState *sys = ARM_SMMU(d);
>> +    SMMUv3State *s = ARM_SMMUV3(sys);
>> +    SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>> +    SysBusDevice *dev = SYS_BUS_DEVICE(d);
>> +    Error *local_err = NULL;
>> +
>> +    c->parent_realize(d, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    memory_region_init_io(&sys->iomem, OBJECT(s),
>> +                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, 0x20000);
>> +
>> +    sys->mrtypename = g_strdup(TYPE_SMMUV3_IOMMU_MEMORY_REGION);
> 
> Nothing ever modifies this later, so I don't think you nede to
> do the g_strdup() ?  (The declaration of the struct field should
> probably have a 'const'.)
done
> 
>> +
>> +    sysbus_init_mmio(dev, &sys->iomem);
>> +
>> +    smmu_init_irq(s, dev);
>> +}
>> +
>> +static const VMStateDescription vmstate_smmuv3 = {
>> +    .name = "smmuv3",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(features, SMMUv3State),
>> +        VMSTATE_UINT8(sid_size, SMMUv3State),
>> +        VMSTATE_UINT8(sid_split, SMMUv3State),
>> +
>> +        VMSTATE_UINT32_ARRAY(idr, SMMUv3State, 6),
> 
> These are constant ID registers, right? You don't need to
> migrate anything that's a fixed value set when the device
> is created and never modified.
yes correct, removed idr and iidr
> 
>> +        VMSTATE_UINT32(iidr, SMMUv3State),
>> +        VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
>> +        VMSTATE_UINT32(cr0ack, SMMUv3State),
>> +        VMSTATE_UINT32(statusr, SMMUv3State),
>> +        VMSTATE_UINT32(irq_ctrl, SMMUv3State),
>> +        VMSTATE_UINT32(irq_ctrl_ack, SMMUv3State),
>> +        VMSTATE_UINT32(gerror, SMMUv3State),
>> +        VMSTATE_UINT32(gerrorn, SMMUv3State),
>> +        VMSTATE_UINT64(gerror_irq_cfg0, SMMUv3State),
>> +        VMSTATE_UINT32(gerror_irq_cfg1, SMMUv3State),
>> +        VMSTATE_UINT32(gerror_irq_cfg2, SMMUv3State),
>> +        VMSTATE_UINT64(strtab_base, SMMUv3State),
>> +        VMSTATE_UINT32(strtab_base_cfg, SMMUv3State),
>> +        VMSTATE_UINT64(eventq_irq_cfg0, SMMUv3State),
>> +        VMSTATE_UINT32(eventq_irq_cfg1, SMMUv3State),
>> +        VMSTATE_UINT32(eventq_irq_cfg2, SMMUv3State),
>> +
>> +        VMSTATE_UINT64(cmdq.base, SMMUv3State),
>> +        VMSTATE_UINT32(cmdq.prod, SMMUv3State),
>> +        VMSTATE_UINT32(cmdq.cons, SMMUv3State),
>> +        VMSTATE_UINT8(cmdq.entry_size, SMMUv3State),
>> +        VMSTATE_UINT64(eventq.base, SMMUv3State),
>> +        VMSTATE_UINT32(eventq.prod, SMMUv3State),
>> +        VMSTATE_UINT32(eventq.cons, SMMUv3State),
>> +        VMSTATE_UINT8(eventq.entry_size, SMMUv3State),
> 
> It's a little neater to define a separate VMStateDescription
> for the SMMUQueue struct and then just use it twice here with
> VMSTATE_STRUCT. (Example in hw/dma/pl330.c for vmstate_pl330_chan.)
done.
> 
> Also, isn't the entry_size constant and fixed at device creation?
> If so, you don't need to migrate it.
yes, removed
> 
>> +
>> +        VMSTATE_END_OF_LIST(),
>> +    },
>> +};
>> +
>> +static void smmuv3_instance_init(Object *obj)
>> +{
>> +    /* Nothing much to do here as of now */
>> +}
>> +
>> +static void smmuv3_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
>> +
>> +    dc->vmsd    = &vmstate_smmuv3;
> 
> It would be nice to go through the patchset and remove these
> unnecessary extra spaces in various assignments and declarations.
attempted ;-)
> 
>> +    device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
>> +    c->parent_realize = dc->realize;
>> +    dc->realize = smmu_realize;
>> +}
> 
> 
>> +type_init(smmuv3_register_types)
>> +
> 
> Stray blank line at end of file.
> 
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 3584974..64d2b9b 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -12,3 +12,6 @@ smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr,
>>  smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
>>  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
>>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
>> +
>> +#hw/arm/smmuv3.c
>> +smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
> 
> "hwaddr" isn't valid as a type for trace event parameters. This should
> be uint64_t; otherwise trace backends like 'ust' won't build. (There's a
> patch on list to tracetool that will make this mistake a compile error
> for all backends, so it's easier to catch.)
Yes changed all of those to uint64_t.
> 
> 
>> +#ifndef HW_ARM_SMMUV3_H
>> +#define HW_ARM_SMMUV3_H
>> +
>> +#include "hw/arm/smmu-common.h"
>> +#include "hw/registerfields.h"
>> +
>> +#define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
>> +
>> +#define SMMU_NREGS            0x200
>> +
>> +typedef struct SMMUQueue {
>> +     hwaddr base;
>> +     uint32_t prod;
>> +     uint32_t cons;
>> +     uint8_t entry_size;
>> +} SMMUQueue;
>> +
>> +typedef struct SMMUv3State {
>> +    SMMUState     smmu_state;
>> +
>> +    /* Local cache of most-frequently used registers */
>> +#define SMMU_FEATURE_2LVL_STE (1 << 0)
> 
> Minor thing, I think it would be better for this define to
> not be in the middle of the struct definition.
OK moved to smmuv3-internal in patch adding write ops.

Thanks

Eric
> 
>> +    uint32_t features;
>> +    uint8_t sid_size;
>> +    uint8_t sid_split;
>> +
>> +    uint32_t idr[6];
>> +    uint32_t iidr;
>> +    uint32_t cr[3];
>> +    uint32_t cr0ack;
>> +    uint32_t statusr;
>> +    uint32_t irq_ctrl;
>> +    uint32_t irq_ctrl_ack;
>> +    uint32_t gerror;
>> +    uint32_t gerrorn;
>> +    uint64_t gerror_irq_cfg0;
>> +    uint32_t gerror_irq_cfg1;
>> +    uint32_t gerror_irq_cfg2;
>> +    uint64_t strtab_base;
>> +    uint32_t strtab_base_cfg;
>> +    uint64_t eventq_irq_cfg0;
>> +    uint32_t eventq_irq_cfg1;
>> +    uint32_t eventq_irq_cfg2;
>> +
>> +    SMMUQueue eventq, cmdq;
>> +
>> +    qemu_irq     irq[4];
>> +} SMMUv3State;
>> +
>> +typedef enum {
>> +    SMMU_IRQ_EVTQ,
>> +    SMMU_IRQ_PRIQ,
>> +    SMMU_IRQ_CMD_SYNC,
>> +    SMMU_IRQ_GERROR,
>> +} SMMUIrq;
>> +
>> +typedef struct {
>> +    /*< private >*/
>> +    SMMUBaseClass smmu_base_class;
>> +    /*< public >*/
>> +
>> +    DeviceRealize parent_realize;
>> +    DeviceReset   parent_reset;
>> +} SMMUv3Class;
>> +
>> +#define TYPE_ARM_SMMUV3   "arm-smmuv3"
>> +#define ARM_SMMUV3(obj) OBJECT_CHECK(SMMUv3State, (obj), TYPE_ARM_SMMUV3)
>> +#define ARM_SMMUV3_CLASS(klass)                              \
>> +    OBJECT_CLASS_CHECK(SMMUv3Class, (klass), TYPE_ARM_SMMUV3)
>> +#define ARM_SMMUV3_GET_CLASS(obj) \
>> +     OBJECT_GET_CLASS(SMMUv3Class, (obj), TYPE_ARM_SMMUV3)
>> +
>> +#endif
> 
> thanks
> -- PMM
> 
