Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1643351wre;
        Thu, 24 May 2018 02:22:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJRCpvG0cH4gFfGbRkWP6+A8GdNiZ5ui9q4Q3dq5xoiEeZQwDlbKTE+8R1IqPfESBFYUsop
X-Received: by 2002:ac8:4090:: with SMTP id p16-v6mr6337496qtl.191.1527153725647;
        Thu, 24 May 2018 02:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527153725; cv=none;
        d=google.com; s=arc-20160816;
        b=gW3VznBXrZhgrHQzbTEwVWzKaueMykQqHUV/5wbU9Ctx1lJ1GSWC7VIw2hDO+VZkxv
         31a5dKQq0RhdhN767Nv75+A97cjH0XbPx/BwVcahKPqR6Zr7jwd3FZ1/BORnesSUPnEj
         bv5ZW70TAYj4j5HTFX+S7dsSzZpGexVQA6u6UeUkRcR0BucMAnBKiaDg9h1HzxNFf4J1
         PqEJNhCOHgRYICyomkRhvcGPpFSaEuX2hqTOvQiP0rlYC0lArb71C62eCZHhBbYm7hir
         i+0trlkJn0DGNF3u38feTUwOcxlmQ/howVi6AsXaViHY3+qr/NzrOsURt+jNwDoO+5Gf
         qYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=bU9/8OWEAKVScgK2OXNVvWKLrIzh4V6nqZSuxefYxCs=;
        b=BSxNec6fXePJCsRZ6KLi/A84xZ7bQjIxDaT/iI4HFuuMUefvlThQUH1QiHlBk2Ut2s
         MLJZA0FflcMj4P81LZRsh2QqFMui8Qjg2mrzuDFnXOl9fU83YOOI/+ty6l7ql/LTIvZd
         zBjBHQBhfXpQgHCQbPOOhwBpYpGM16VOGZsQNCAgiLbv+kYyGOFCg0WtC1JaL83FhgB6
         D+olCmCXHnONBBtVRndHbRWOPndWHSqfBVWrAaxSpqvUhAxxYodRQSa+ZQUSRy3neYUL
         A8ah9qakpW4XrsufYdQNEc2Q/2BSOKkKQ/+xYI8fxisvUbK7CL1d0BFnstKuYyHg6/xK
         bAFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l65-v6si722474qkl.261.2018.05.24.02.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 02:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLmRh-0000kd-6N
	for alex.bennee@linaro.org; Thu, 24 May 2018 05:22:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLmRV-0000kI-QB
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLmRQ-0006Da-Nt
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:21:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2620 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fLmRQ-0006Cq-CO; Thu, 24 May 2018 05:21:48 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 3D43673E491DC;
	Thu, 24 May 2018 17:21:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.382.0; Thu, 24 May 2018
	17:21:27 +0800
Message-ID: <5B0683FB.4000602@huawei.com>
Date: Thu, 24 May 2018 17:20:59 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Auger Eric <eric.auger@redhat.com>, <qemu-arm@nongnu.org>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
In-Reply-To: <acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n5xajUBtvNda



On 2018/5/24 17:04, Auger Eric wrote:
> Hi Shannon,
> 
> On 05/23/2018 05:53 AM, Shannon Zhao wrote:
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
>> +    offset += (8 * sizeof(uint32_t));
> Now I am unclear about the semantics of the s->gicd_ipriority & friends.
> With that change, is it supposed to contain only the states of SPIs or
> contain the RAZ states of PPI/SGIs + states of SPIs. The array is
> dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
> shouldn't we also shift field?
> 
Yes, it should also shift the field. But not sure if this will affect
the new to old migration scenario. Let me think about this.

> Thanks
> 
> Eric
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
>> +
>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
>> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
>> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
>> +     * sync them.
>> +     */
>> +    offset += (8 * sizeof(uint32_t));
> in the old to new migration scenario, IIUC,
> bmp contains state of 32 internal PPI/SGI(RAZ) + s->num_irq-32 SPIs
> Here aren't you "putting" the RAZ state of the 32 PPI/SGIs into the
> first 32 SPIs here?
> 
Please see above code, this new version patch I add a flag for migration
compat suggested as Peter. If it migrates from old qemu, the
gicd_no_shift_bug will be 0, then it will shift the bmp, while that will
drop the data of PPI/SGI and also the last 32 SPIs info will be empty.
None of current machines use last 32 SPIs, so it's fine for the moment.

Thanks,
-- 
Shannon

