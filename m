Received: by 10.28.91.67 with SMTP id p64csp4797252wmb;
        Wed, 21 Mar 2018 01:34:28 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsLb3PRpGWAEivdju5yOokj2VmCfhN1AXyOy3AYsm0rsD8/aLF6AVJ1N6lsotJ82et/M5gz
X-Received: by 10.55.156.79 with SMTP id f76mr27469888qke.36.1521621268700;
        Wed, 21 Mar 2018 01:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521621268; cv=none;
        d=google.com; s=arc-20160816;
        b=l1L9KtF6Bb5Oyx2cXC+G5jwj5JJ2E9JJiZARChrMtu99MjQo8s/aVP5L+nFBeJlBCs
         FX+NEfu/l3gqX5plWAl7I+xlyO0yCsv7lo+0D4y0fOKs8ZBlfslLpB1ZSn1uCzxEKTPZ
         /y3nEf3A1a2LJ1ci0P2S7qHp1+ouTkwRQN9VLs5Z5M3BTGdZ0myjB2LoPd/mAt7scjhc
         XxJN7H4x7XWvYXxc8SHh2YqPTU2r0FNht5lQFoTn7NYNEXKEOIVc+2ZWriSr9PDIfehp
         4iMfQInW78n9tOykkGwRguT5te6A7M05HnWOA4t6Bgp/6cfD8/T0OS6icALlm/arBIdj
         SCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=sbAerH9Yy7gXU6XNe+PEEDEVKGXpITRimchhDMwVeY0=;
        b=HytY1418RkiSVQeJQPm1POPYRoqbvvNNzrBtnxjO65oSRLl6S219w+x30Sb8ktuOm0
         7crMS9fsKMkPKDviPEj/N8EAWmiDS4ZZPeVbZL/Oqa/nnjBUn7zV/bvlt63Z2IBuRf8K
         byIMux0M6x1KOxyVx3JDzSItKmmHIh0k1LaKjp0fPAFpxI6bKpOFnuChLqIG4fZ6SMSL
         R/I+8BTW1jgfT2oOxcNGIWaJku6XOn9lE+2+UvIzwl4Zk6xFce/u7UlU0Ytdf4YLB8Xh
         r3PM6Yiy7LW9gDzbWxT+hvZ2evaYeuoMmX96Xd+YmD7ybKSn7eMOY4gLGhCESftHIO8G
         XwfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y28si2653650qtm.465.2018.03.21.01.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 01:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyZCW-0004AG-5t
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 04:34:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyZCM-0004A6-Vp
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 04:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyZCJ-0003ys-Od
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 04:34:18 -0400
Received: from [45.249.212.35] (port=59998 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eyZCJ-0003xW-De; Wed, 21 Mar 2018 04:34:15 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id AB521D3F2D357;
	Wed, 21 Mar 2018 16:34:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.361.1; Wed, 21 Mar 2018
	16:34:03 +0800
Message-ID: <5AB218CE.1050000@huawei.com>
Date: Wed, 21 Mar 2018 16:33:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Auger Eric <eric.auger@redhat.com>, <qemu-arm@nongnu.org>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<33a7bc59-c457-03d0-90bf-ab5b2d2d46cd@redhat.com>
In-Reply-To: <33a7bc59-c457-03d0-90bf-ab5b2d2d46cd@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] arm_gicv3_kvm:
 kvm_dist_get/put: skip the registers banked by GICR
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lEpxtJ8aI0sL



On 2018/3/20 16:42, Auger Eric wrote:
> Hi Shannon,
> On 20/03/18 08:26, Shannon Zhao wrote:
>> While we skip the GIC_INTERNAL irqs, we don't change the register offset
>> accordingly. This will overlap the GICR registers value and leave the
>> last GIC_INTERNAL irq's registers out of update.
>>
>> Fix this by skipping the registers banked by GICR.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> ---
>>  hw/intc/arm_gicv3_kvm.c | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index 3536795..d423cba 100644
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
>> +    offset += (8 * sizeof(uint32_t));
>>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>>          kvm_gicd_access(s, offset, &reg, false);
>>          *field = reg;
>> @@ -150,6 +156,12 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>>      int irq;
>>  
>>      field = (uint32_t *)bmp;
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
>> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
>> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
>> +     * sync them.
>> +     */
>> +    offset += (8 * sizeof(uint32_t));
>>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>>          reg = *field;
>>          kvm_gicd_access(s, offset, &reg, true);
>> @@ -164,6 +176,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
>>      uint32_t reg;
>>      int irq;
>>  
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
>> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
>> +     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
>> +     * them.
>> +     */
>> +    offset += (2 * sizeof(uint32_t));
>>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>>          kvm_gicd_access(s, offset, &reg, false);
>>          reg = half_unshuffle32(reg >> 1);
>> @@ -181,6 +199,12 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
>>      uint32_t reg;
>>      int irq;
>>  
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
>> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
>> +     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
>> +     * them.
>> +     */
>> +    offset += (2 * sizeof(uint32_t));
>>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>>          reg = *gic_bmp_ptr32(bmp, irq);
>>          if (irq % 32 != 0) {
>> @@ -222,6 +246,12 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
>>      uint32_t reg;
>>      int irq;
>>  
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the
>> +     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
>> +     * are always RAZ/WI. The corresponding functionality is replaced by the
>> +     * GICR registers. So it doesn't need to sync them.
>> +     */
>> +    offset += (1 * sizeof(uint32_t));
>>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>>          kvm_gicd_access(s, offset, &reg, false);
>>          *gic_bmp_ptr32(bmp, irq) = reg;
>> @@ -235,6 +265,14 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>>      uint32_t reg;
>>      int irq;
>>  
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the
>> +     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
>> +     * are always RAZ/WI. The corresponding functionality is replaced by the
>> +     * GICR registers. So it doesn't need to sync them.
>> +     */
>> +    offset += (1 * sizeof(uint32_t));
> I wonder we couldn't create a new for_each_dist_irq_reg() macro taking
> the offset and clroffset and integrating that shift inside?
> 
Peter, what's your opinion?

>> +    if (clroffset != 0)
> nit style issue: brace needed here
>
OK

> Besides Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
Thanks!

> Thanks
> 
> Eric
> 
>> +        clroffset += (1 * sizeof(uint32_t));
>>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>>          /* If this bitmap is a set/clear register pair, first write to the
>>           * clear-reg to clear all bits before using the set-reg to write
>>
> 
> .
> 

-- 
Shannon

