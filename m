Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2059413wrq;
        Thu, 14 Jun 2018 06:49:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKOHXl5KrxedanQbBFIZ5lSohCZ4X0PfhLB8olqgoIx8047sGuDzB5P1pcOIneyjL/bYTxJ
X-Received: by 2002:a37:65c5:: with SMTP id z188-v6mr2245605qkb.410.1528984147725;
        Thu, 14 Jun 2018 06:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528984147; cv=none;
        d=google.com; s=arc-20160816;
        b=NDUbduDmgFY6lTIx025kpZ8wcw8RHeEPD6r8FdvEcnX/F/O0cRwuPIRS5tr88/jFaU
         /jAKh9ye/5I4RHhEl7f9y0AXbetom/wcIAb7dSYpPfy+YkhPB6On9hdxgoM0xNZPQU5X
         /oz3f3eA8OUionj4DnJD5rbOQDzxUUj7RIgcupdDu2Yk9auaAFXUTw00HM85R6GBN3q3
         CFmbKJjSLoyrF1gjgEIEyfGMwzO1I3gM31Zl+0TU81+EDiVWVGrQ/D8sxbFdkqRtKR7W
         JLG9bIqMNze9ST45UnJqmv3BI55c+98/oghqycxFNF8QF6Kunl6bdivrNxtsPhF9kn1p
         GECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=RhqRQuZCWzgpkU4JupaQapW62HHQuVEKpNSz/J+etyA=;
        b=j/UPeCopR51gFnB8JG+oj45pEOnTy9+4xawdHlJscCV1wRuC5Qx93o9AAv0Krh7QfI
         wzGDnOkMrbntAgg7wr2uoJrwVtQ2r8BxQiImbkNdJtWX3dIbqA+mAre0WolsazPfBBhv
         FrGe2AVUfTswyDURAy124U/8wkNmjLrtShanZ5SBgTHv2a7lpiAEWND+KgB0NoZsc33i
         aSQT1qvjZPUM2dnfwV6NsAGeROtPRoAzfXmL0Bc/ky7XYJxKH0e9ewkayQYYe5ASQ6CC
         239A+4GOSAs2DZ8lTmD/2kDLBsjBxng/xXPwCKX/IbspLPDSf+zNUF/LZfT3E0AKZX+E
         6Feg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1-v6si4935064qka.174.2018.06.14.06.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 06:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTScd-0002nM-85
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 09:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTScW-0002n2-HV
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:49:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTScR-0004ci-Or
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:49:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50126 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTScR-0004cY-JX; Thu, 14 Jun 2018 09:48:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14EC68A70B;
	Thu, 14 Jun 2018 13:48:55 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 706A320244E2;
	Thu, 14 Jun 2018 13:48:53 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-5-git-send-email-eric.auger@redhat.com>
	<20180614133904.bic4wwjeed4ybu2u@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <29a2642b-87e4-b4c3-b7b9-632a3c0adc87@redhat.com>
Date: Thu, 14 Jun 2018 15:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180614133904.bic4wwjeed4ybu2u@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 14 Jun 2018 13:48:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 14 Jun 2018 13:48:55 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/9] hw/intc/arm_gicv3_kvm: Get
 prepared to handle multiple redist regions
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, christoffer.dall@arm.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a2qjJlBbs6Vj

Hi Drew,

On 06/14/2018 03:39 PM, Andrew Jones wrote:
> On Wed, Jun 13, 2018 at 10:48:38AM +0200, Eric Auger wrote:
>> Let's check if KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION is supported.
>> If not, we check the number of redist region is equal to 1 and use the
>> legacy KVM_VGIC_V3_ADDR_TYPE_REDIST attribute. Otherwise we use
>> the new attribute and allow to register multiple regions to the
>> KVM device.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> ---
>>
>> v2 -> v3:
>> - In kvm_arm_gicv3_realize rename val into add_ormask local variable and
>>   add a comment
>> - start the redist region registration  from s->nb_redist_regions - 1
>>   downwards
>> ---
>>  hw/intc/arm_gicv3_kvm.c | 33 ++++++++++++++++++++++++++++++---
>>  1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index ed7b719..52e6e70 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -753,6 +753,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>  {
>>      GICv3State *s = KVM_ARM_GICV3(dev);
>>      KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
>> +    bool multiple_redist_region_allowed;
>>      Error *local_err = NULL;
>>      int i;
>>  
>> @@ -789,6 +790,18 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>  
>> +    multiple_redist_region_allowed =
>> +        kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
>> +                              KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION);
>> +
>> +    if (!multiple_redist_region_allowed && s->nb_redist_regions > 1) {
>> +        error_setg(errp, "Multiple VGICv3 redistributor regions are not "
>> +                   "supported by this host kernel");
>> +        error_append_hint(errp, "A maximum of %d VCPUs can be used",
>> +                          s->redist_region_count[0]);
>> +        return;
>> +    }
>> +
>>      kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_NR_IRQS,
>>                        0, &s->num_irq, true, &error_abort);
>>  
>> @@ -798,9 +811,23 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>  
>>      kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>>                              KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
>> -    kvm_arm_register_device(&s->iomem_redist[0], -1,
>> -                            KVM_DEV_ARM_VGIC_GRP_ADDR,
>> -                            KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
>> +
>> +    if (!multiple_redist_region_allowed) {
>> +        kvm_arm_register_device(&s->iomem_redist[0], -1,
>> +                                KVM_DEV_ARM_VGIC_GRP_ADDR,
>> +                                KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd, 0);
>> +    } else {
>> +        for (i = s->nb_redist_regions - 1; i >= 0; i--) {
> 
> So we register in reverse-index order? Looking at your update to Linux doc
> Documentation/virtual/kvm/devices/arm-vgic-v3.txt, shouldn't they be
> registered in index-order? The doc says "Redistributor regions must be
> registered in the incremental index order, starting from index 0."
kvm_arm_register_device adds the device in a QSLIST using
QSLIST_INSERT_HEAD. Then the list is read by kvm_arm_machine_init_done
from the HEAD. So we need to register in reversed order.

Thanks

Eric
> 
> Thanks,
> drew
> 
>> +            /* Address mask made of the rdist region index and count */
>> +            uint64_t addr_ormask =
>> +                        i | ((uint64_t)s->redist_region_count[i] << 52);
>> +
>> +            kvm_arm_register_device(&s->iomem_redist[i], -1,
>> +                                    KVM_DEV_ARM_VGIC_GRP_ADDR,
>> +                                    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
>> +                                    s->dev_fd, addr_ormask);
>> +        }
>> +    }
>>  
>>      if (kvm_has_gsi_routing()) {
>>          /* set up irq routing */
>> -- 
>> 2.5.5
>>
>>
