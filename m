Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2823324wre;
        Fri, 25 May 2018 02:16:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIQLlBRfHi0kUQy3P8ln3GpmuoDzp/mBreHWc9PalQzw1r4QCTPkhu/AtfsULyy/sL2ch+f
X-Received: by 2002:a0c:f182:: with SMTP id m2-v6mr1329617qvl.65.1527239782686;
        Fri, 25 May 2018 02:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527239782; cv=none;
        d=google.com; s=arc-20160816;
        b=RQDtmaMEckdL7uB4osyd6J0lDQCvO6nZYzl4usYDiDjxU4goD15upODU9b+m0aciU0
         wTImvaGzB2/sQHkZxUsug0mZQQ0TwmU69lij2pZjjiskiImlYwDS5w1hNekWSQAUkCge
         UsOlNXcXsrD2hxVjsYzoHr6orQuOtZdlbdVzKyUlFmm5T+aGBfCF9KniDw+kJ1udbiCP
         ZX2J8c1D+I/St5G2LUEStiq7+ifJ+x/tAnDYNhmzlQ5ErGeBOC/CHwoP6yYq9yHsalco
         P8kNoALmKWeFKD6/V/D4I8xkJrYXfLfr4b0M4IF0FzbOO6DumNibd2oR1WOxutmYFeM0
         T7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=2fU1aiD8OVJ865iD/9bwjq9Gm5WsVT2JzIfPHMaDG54=;
        b=kmPz9BJ/oba7Vf+nDqMP9zYeoYvBfMlST71eI2XS2n2LUYiQobGzahZ+DL8uUfkeSy
         wmsyEd8IvKxJAGGIjt1BvJW5o8xN7YzB4POEGfGgykj5BfN5JlFXuyNLYWD12Ks9s9If
         +y2eQSX2mJN7GKJuiFxuN8VfLNwyI1fAaDEyq034KGLauKxtOu/ua1qLVlHPi3ywz/Bf
         FZn2qiXp7BvaOkuLzTR8ewuQDBVyZ59FjvJozTPgNtPTMCNCJ5bulJWoYCuReqz/cl3G
         5lDR12EY+dMF45iKpjj9xFjgp2Q7qoOB1bBW0cNE+GsYot5pL5yZug82UIv+yvg80OcA
         PdVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o29-v6si860038qkl.169.2018.05.25.02.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 02:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fM8pi-0005YG-5Q
	for alex.bennee@linaro.org; Fri, 25 May 2018 05:16:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fM8pa-0005Y9-3Y
	for qemu-arm@nongnu.org; Fri, 25 May 2018 05:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fM8pV-0004oe-Ux
	for qemu-arm@nongnu.org; Fri, 25 May 2018 05:16:14 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2101 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fM8pV-0004ni-AB; Fri, 25 May 2018 05:16:09 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7AB8F86DB037F;
	Fri, 25 May 2018 17:15:52 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.382.0; Fri, 25 May 2018
	17:15:47 +0800
Message-ID: <5B07D43C.8090104@huawei.com>
Date: Fri, 25 May 2018 17:15:40 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_QWFQPi2fndeUqBNVWdgeKpfNoJL_amQC9aqpYoTbW6A@mail.gmail.com>
In-Reply-To: <CAFEAcA_QWFQPi2fndeUqBNVWdgeKpfNoJL_amQC9aqpYoTbW6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH V3 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, QEMU
	Developers <qemu-devel@nongnu.org>, Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNxTtOXMxDHI



On 2018/5/24 21:11, Peter Maydell wrote:
> On 23 May 2018 at 04:53, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> While we skip the GIC_INTERNAL irqs, we don't change the register offset
>> accordingly. This will overlap the GICR registers value and leave the
>> last GIC_INTERNAL irq's registers out of update.
>>
>> Fix this by skipping the registers banked by GICR.
>>
>> Also for migration compatibility if the migration source (old version
>> qemu) doesn't send gicd_no_shift_bug = 1 to destination, then we shift
>> the data of PPI to get the right data for SPI.
>>
>> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> ---
>> Changes in V3: add migration compatibility and fix code style
>> ---
>>  hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++
>>  hw/intc/arm_gicv3_kvm.c            | 56 +++++++++++++++++++++++++++++++++++++-
>>  include/hw/intc/arm_gicv3_common.h |  1 +
>>  3 files changed, 92 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 7b54d52..f93e5d2 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -141,6 +141,38 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>>      }
>>  };
>>
>> +static int gicv3_gicd_no_shift_bug_pre_load(void *opaque)
>> +{
>> +    GICv3State *cs = opaque;
>> +
>> +   /*
>> +    * If the gicd_no_shift_bug subsection is not transferred this
>> +    * means gicd_no_shift_bug is 0x0 (which might not be the same as
>> +    * our reset value).
>> +    */
> 
> This comment seems to have been copied from a similar one about
> SRE_EL1, and I think it's a bit misleading here. For icc_sre_el1,
> that is a guest-visible struct value which we set to something in the
> device's reset function. This gicd_no_shift_bug field is
> only for the benefit of migration.
> 
> This comment is the ideal place to explain the semantics of gicd_no_shift_bug
> and why we have to use it.
> 
> You should also only set this if KVM is enabled, because the TCG
> GIC gets the semantics of the data structure right.
> 
ok

>> +    cs->gicd_no_shift_bug = 0x0;
>> +    return 0;
>> +}
>> +
>> +static bool gicv3_gicd_no_shift_bug_needed(void *opaque)
>> +{
>> +    GICv3State *cs = opaque;
>> +
>> +    return cs->gicd_no_shift_bug;
>> +}
>> +
>> +const VMStateDescription vmstate_gicv3_gicd_no_shift_bug = {
>> +    .name = "arm_gicv3/gicd_no_shift_bug",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .pre_load = gicv3_gicd_no_shift_bug_pre_load,
>> +    .needed = gicv3_gicd_no_shift_bug_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_BOOL(gicd_no_shift_bug, GICv3State),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
> 
> You also need a post-load function, because that is where you want
> to fix up the incoming data (by memcpy'ing it into the right place).
> 
Ok.

>> +
>>  static const VMStateDescription vmstate_gicv3 = {
>>      .name = "arm_gicv3",
>>      .version_id = 1,
>> @@ -165,6 +197,10 @@ static const VMStateDescription vmstate_gicv3 = {
>>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
>>                                               vmstate_gicv3_cpu, GICv3CPUState),
>>          VMSTATE_END_OF_LIST()
>> +    },
>> +    .subsections = (const VMStateDescription * []) {
>> +        &vmstate_gicv3_gicd_no_shift_bug,
>> +        NULL
>>      }
>>  };
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index 3536795..bd961f1 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -136,6 +136,12 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>>      int irq;
>>
>>      field = (uint32_t *)bmp;
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
>> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
>> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
>> +     * sync them.
>> +     */
> 
> This is true, but not why we need to add to the offset. We need
> to add to the offset because for_each_dist_irq_reg()'s loop
> handles irq numbers starting from GIC_INTERNAL, but the offset
> we have is for the start of the GICD_IPRIORITYR<n> register range,
> which includes space for the irqs 0..GIC_INTERNAL-1.
> 
>> +    offset += (8 * sizeof(uint32_t));
> 
> Possibly these offset changes would be clearer written as
> 
>      offset += (GIC_INTERNAL * bits-per-irq) / 8;
> 
> where bits-per-irq is the same as the last argument to for_each_dist_irq_reg()?
> 
>>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>>          kvm_gicd_access(s, offset, &reg, false);
>>          *field = reg;
>> @@ -149,7 +155,18 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>>      uint32_t reg, *field;
>>      int irq;
>>
>> -    field = (uint32_t *)bmp;
>> +    if (!s->gicd_no_shift_bug) {
>> +        field = (uint32_t *)(bmp + 8 * sizeof(uint32_t));
>> +    } else {
>> +        field = (uint32_t *)bmp;
>> +    }
> 
> As noted above, don't try to fix the migration compat problem up here.
> The code for syncing registers should just assume the data structure
> is being used correctly.
> 
>> @@ -235,6 +274,20 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>>      uint32_t reg;
>>      int irq;
>>
>> +    if (!s->gicd_no_shift_bug) {
>> +        bmp += (1 * sizeof(uint32_t));
>> +    }
> 
> As noted above, don't try to fix the migration compat problem up here.
> The code for syncing registers should just assume the data structure
> is being used correctly.
> 
>> +
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the
>> +     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
>> +     * are always RAZ/WI. The corresponding functionality is replaced by the
>> +     * GICR registers. So it doesn't need to sync them.
>> +     */
>> +    offset += (1 * sizeof(uint32_t));
>> +    if (clroffset != 0) {
>> +        clroffset += (1 * sizeof(uint32_t));
>> +    }
>> +
>>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>>          /* If this bitmap is a set/clear register pair, first write to the
>>           * clear-reg to clear all bits before using the set-reg to write
>> @@ -651,6 +704,7 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
>>          return;
>>      }
>>
>> +    s->gicd_no_shift_bug = 1;
> 
> This is the wrong place to do this reset, because then it won't
> be in effect for the TCG GIC.
> 
>>      kvm_arm_gicv3_put(s);
>>  }
>>
>> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
>> index bccdfe1..13c28c0 100644
>> --- a/include/hw/intc/arm_gicv3_common.h
>> +++ b/include/hw/intc/arm_gicv3_common.h
>> @@ -217,6 +217,7 @@ struct GICv3State {
>>      uint32_t revision;
>>      bool security_extn;
>>      bool irq_reset_nonsecure;
>> +    bool gicd_no_shift_bug;
> 
> Probably putting 'migration' in the field name will help to indicate
> that it's only a migration compat fixup.
> 
How about gicd_no_migration_shift_bug?

>>
>>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>>      Error *migration_blocker;
>> --
>> 2.0.4
> 
> thanks
> -- PMM
> 
> .
> 

Thanks,
-- 
Shannon

