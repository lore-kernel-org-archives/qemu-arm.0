Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1788656wre;
        Thu, 24 May 2018 05:10:32 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpKddCQ88nSY04KZTWfq1ZCVr9xGP1mFp2alkBmtLDcDmK9j+QZsjDWqKcehIzcB8DfDNYe
X-Received: by 2002:a0c:b61f:: with SMTP id f31-v6mr6409436qve.103.1527163832244;
        Thu, 24 May 2018 05:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527163832; cv=none;
        d=google.com; s=arc-20160816;
        b=CEIcRdqn9lAy+1IMnksHfrLGTFl81hVf8M7wFhDV4KG0UdmT5gRw1UjwTSP5yCe/Ao
         4cRsh1LlU+erHtR8JoR67acrB7jKuksq44Q0VfgCJqZk4hIS3n/ADCQxiqeLh+/k42g1
         vX0BqdHAEgeWFYk6nx7ODO4F53Wpl0ew4vQOBr4tu5qCPSR8tndzN/4yHWCPHMg9nQlL
         l6GWjHB05SSBu7WEVIUWgF6o1BZjR250MDEweufsgMkQPsJo43e4eEzPoSmGZLktWoiL
         jdNOme7hqOP/P6OcIyCx2K7iKMhlg/8XnqjUPq/RnNWrUoqsD1YDEG7B0rxAO8RhYBU1
         ad3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=KTDBq5eJA34JBNd9Ovptf7HophjaiKG4WdzZaq0Kgtc=;
        b=R36B1Ig/R39PUioRuC7GjDAJiaNPwrNXippcY1OOwNlr9uNU3iNvFmYnz/Kq+s7Q7n
         mvDmlf0gat+O3Xe0iNHVdjI4yErUHObWKveiR2xQXSE0HQxSJ5xZpgJ63n0bTn1P7Q/k
         +IMMKzxJ7mdqFQADULVBy3unoS4jDLZGhoUV0YRJOhwU7wrJW6986WRoeN/s/uAtWzhg
         ipxtUtb1Z+XA6vAZecnSJmDZ/ZCr3aiBV3XXor7cDIOFMTlGwEALy1u+S3EHqVMmFhAv
         uEwlkAQTiSYt02TAyPEPo9kkLJeFHRsH4Vm+InaMBHS6lGJmkH8KKH+hKW0RTaxeNn5M
         XkOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v189-v6si5760146qkc.379.2018.05.24.05.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 05:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLp4h-0006kO-Mm
	for alex.bennee@linaro.org; Thu, 24 May 2018 08:10:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLp4R-0006jl-Jz
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLp4N-0006Wo-2A
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:10:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56086 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLp4M-0006WU-Rp; Thu, 24 May 2018 08:10:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85B0C401EF0E;
	Thu, 24 May 2018 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A4EB2166BB2;
	Thu, 24 May 2018 12:10:08 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<5B0683FB.4000602@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b0b8a3b0-c55e-3aae-7fb6-28ea732a04f9@redhat.com>
Date: Thu, 24 May 2018 14:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5B0683FB.4000602@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 24 May 2018 12:10:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 24 May 2018 12:10:09 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V3 2/2] arm_gicv3_kvm:
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWtTI4fvhmIm

Hi Shannon,

On 05/24/2018 11:20 AM, Shannon Zhao wrote:
> 
> 
> On 2018/5/24 17:04, Auger Eric wrote:
>> Hi Shannon,
>>
>> On 05/23/2018 05:53 AM, Shannon Zhao wrote:
>>> While we skip the GIC_INTERNAL irqs, we don't change the register offset
>>> accordingly. This will overlap the GICR registers value and leave the
>>> last GIC_INTERNAL irq's registers out of update.
>>>
>>> Fix this by skipping the registers banked by GICR.
>>>
>>> Also for migration compatibility if the migration source (old version
>>> qemu) doesn't send gicd_no_shift_bug = 1 to destination, then we shift
>>> the data of PPI to get the right data for SPI.
>>>
>>> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>>> ---
>>> Changes in V3: add migration compatibility and fix code style
>>> ---
>>>  hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++
>>>  hw/intc/arm_gicv3_kvm.c            | 56 +++++++++++++++++++++++++++++++++++++-
>>>  include/hw/intc/arm_gicv3_common.h |  1 +
>>>  3 files changed, 92 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>>> index 7b54d52..f93e5d2 100644
>>> --- a/hw/intc/arm_gicv3_common.c
>>> +++ b/hw/intc/arm_gicv3_common.c
>>> @@ -141,6 +141,38 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>>>      }
>>>  };
>>>  
>>> +static int gicv3_gicd_no_shift_bug_pre_load(void *opaque)
>>> +{
>>> +    GICv3State *cs = opaque;
>>> +
>>> +   /*
>>> +    * If the gicd_no_shift_bug subsection is not transferred this
>>> +    * means gicd_no_shift_bug is 0x0 (which might not be the same as
>>> +    * our reset value).
>>> +    */
>>> +    cs->gicd_no_shift_bug = 0x0;
>>> +    return 0;
>>> +}
>>> +
>>> +static bool gicv3_gicd_no_shift_bug_needed(void *opaque)
>>> +{
>>> +    GICv3State *cs = opaque;
>>> +
>>> +    return cs->gicd_no_shift_bug;
>>> +}
>>> +
>>> +const VMStateDescription vmstate_gicv3_gicd_no_shift_bug = {
>>> +    .name = "arm_gicv3/gicd_no_shift_bug",
>>> +    .version_id = 1,
>>> +    .minimum_version_id = 1,
>>> +    .pre_load = gicv3_gicd_no_shift_bug_pre_load,
>>> +    .needed = gicv3_gicd_no_shift_bug_needed,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_BOOL(gicd_no_shift_bug, GICv3State),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>>  static const VMStateDescription vmstate_gicv3 = {
>>>      .name = "arm_gicv3",
>>>      .version_id = 1,
>>> @@ -165,6 +197,10 @@ static const VMStateDescription vmstate_gicv3 = {
>>>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
>>>                                               vmstate_gicv3_cpu, GICv3CPUState),
>>>          VMSTATE_END_OF_LIST()
>>> +    },
>>> +    .subsections = (const VMStateDescription * []) {
>>> +        &vmstate_gicv3_gicd_no_shift_bug,
>>> +        NULL
>>>      }
>>>  };
>>>  
>>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>>> index 3536795..bd961f1 100644
>>> --- a/hw/intc/arm_gicv3_kvm.c
>>> +++ b/hw/intc/arm_gicv3_kvm.c
>>> @@ -136,6 +136,12 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>>>      int irq;
>>>  
>>>      field = (uint32_t *)bmp;
>>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
>>> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
>>> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
>>> +     * sync them.
>>> +     */
>>> +    offset += (8 * sizeof(uint32_t));
>> Now I am unclear about the semantics of the s->gicd_ipriority & friends.
>> With that change, is it supposed to contain only the states of SPIs or
>> contain the RAZ states of PPI/SGIs + states of SPIs. The array is
>> dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
>> shouldn't we also shift field?
>>
> Yes, it should also shift the field. But not sure if this will affect
> the new to old migration scenario. Let me think about this.

Assuming we shift "field" and leave the space meant for PPI/SGI then my
understanding is we wouldn't need the subsection. We would just add the
last 32 SPI states in the array/bitmap.

Thanks

Eric
> 
>> Thanks
>>
>> Eric
>>>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>>>          kvm_gicd_access(s, offset, &reg, false);
>>>          *field = reg;
>>> @@ -149,7 +155,18 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>>>      uint32_t reg, *field;
>>>      int irq;
>>>  
>>> -    field = (uint32_t *)bmp;
>>> +    if (!s->gicd_no_shift_bug) {
>>> +        field = (uint32_t *)(bmp + 8 * sizeof(uint32_t));
>>> +    } else {
>>> +        field = (uint32_t *)bmp;
>>> +    }
>>> +
>>> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
>>> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
>>> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
>>> +     * sync them.
>>> +     */
>>> +    offset += (8 * sizeof(uint32_t));
>> in the old to new migration scenario, IIUC,
>> bmp contains state of 32 internal PPI/SGI(RAZ) + s->num_irq-32 SPIs
>> Here aren't you "putting" the RAZ state of the 32 PPI/SGIs into the
>> first 32 SPIs here?
>>
> Please see above code, this new version patch I add a flag for migration
> compat suggested as Peter. If it migrates from old qemu, the
> gicd_no_shift_bug will be 0, then it will shift the bmp, while that will
> drop the data of PPI/SGI and also the last 32 SPIs info will be empty.
> None of current machines use last 32 SPIs, so it's fine for the moment.
> 
> Thanks,
> 
