Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5657833wre;
        Thu, 31 May 2018 01:27:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJWtOAZxn3n2xqC9uF9gKagEA3ZBD2AZ34O/Sgtms5oQA+0izB0+g3WYS4RTQFF8Rfb7rnj
X-Received: by 2002:a37:8846:: with SMTP id k67-v6mr5419562qkd.250.1527755278399;
        Thu, 31 May 2018 01:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527755278; cv=none;
        d=google.com; s=arc-20160816;
        b=FZiyrHCAJn+jxkl7vS95W/gkpwfTS4ZSTfwBLRR1/QpwwDHei4n5O7eDJY2w71iCZF
         LtkWnRQiGg5/kXN8+a6Vp3TWmZlpBgpZPWKKNgX7gjj6CNQF+f8QGuZ6MtbVd6TLYtlD
         hUeZ30gyNY7+vX5pQ0nn8NfkR7nxS7xhMr/9pTnm72Nm75zqzv/d2FswymIq2bvOixty
         96WYgy8YEQLepsIcSuLBwXD1Nflyb5jAUJXQkDTuU4pDmirjWr268m8kqZOW0jrmX/oS
         xlu2w6nDs5Omh3FbQvqVHeTJmp6R13RTpFLlD+JXVn57FOHqvF2ZWPt8vwKRvuBmEppP
         gwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ZGf2mAux65uLrhu9msMHtX7A0k9Ko2Z2aUtjIAIuiYA=;
        b=IYJQUW2gadgi3imVKbwswjpOYAhrFK9NZmgroWUfh+x3WG9uRJsgyxauRSxc4TaTQt
         8bHr+YK2OXtaTbvyXKukup4wVS+NQAY7vbn9j9KDd7OyTMkGHsrAI6xkYqsNvQowsos0
         XEf/OVa9p6FPY2+eu622zl0lnJ3fA1AuXxQKgxRFamaxu3N7ZgJKbRRKXPep62dh4Yju
         Y6qE48+szQYMth4ZD3EN744QSTXRq4UhKzCDm5owJvFbLEvPlc3vlT/xnnIvl1gStFSV
         YekSAxBqbayVLtKNW8Rhrx1P2Caesi6t/DreMn6xJkzuKht7JnGVmv+hAJtBiyxXig0d
         EGSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b32-v6si609118qvh.18.2018.05.31.01.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 01:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOIw9-0007DD-TM
	for alex.bennee@linaro.org; Thu, 31 May 2018 04:27:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOIw1-0007D5-HA
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:27:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOIvy-0005x5-CX
	for qemu-arm@nongnu.org; Thu, 31 May 2018 04:27:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53978 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOIvy-0005tl-7G; Thu, 31 May 2018 04:27:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D19F76F91;
	Thu, 31 May 2018 08:27:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB5A20A8472;
	Thu, 31 May 2018 08:27:44 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
	<84171c12-e281-8de5-ec3d-ac0aaf3c3dbb@redhat.com>
	<5B0FAC9E.6090306@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a61f1fe2-a53a-f57a-34d9-1d1da907e635@redhat.com>
Date: Thu, 31 May 2018 10:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5B0FAC9E.6090306@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 31 May 2018 08:27:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 31 May 2018 08:27:45 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] KVM: GIC: Fix memory leak due
 to calling kvm_init_irq_routing twice
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
X-TUID: ML3bt053mJ+j

Hi Shannon,

On 05/31/2018 10:04 AM, Shannon Zhao wrote:
> 
> 
> On 2018/5/31 15:54, Auger Eric wrote:
>> Hi Shannon,
>>
>> On 05/31/2018 09:16 AM, Shannon Zhao wrote:
>>> kvm_irqchip_create called by kvm_init will call kvm_init_irq_routing to
>>> initialize global capability variables. If we call kvm_init_irq_routing in
>>> GIC realize function, previous allocated memory will leak.
>>>
>>> Fix this by deleting the unnecessary call.
>>>
>>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> openpic_kvm seems to suffer the same leak. Don't you want to fix it as
>> well?
>>
> I have a look at below patch of openpic_kvm which says on ppc it doesn't
> call kvm_irqchip_create. So no such issue for it.
> 
> commit d85937e683f6ff4d68293cb24c780fb1f6820d2c
> Author: Scott Wood <scottwood@freescale.com>
> Date:   Wed Jun 12 15:32:51 2013 -0500
> 
>     kvm/openpic: in-kernel mpic support

Ah OK. Thanks for the pointer.

Eric
> 
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
> Thanks.
> 
>> Thanks
>>
>> Eric
>>> ---
>>>  hw/intc/arm_gic_kvm.c   | 1 -
>>>  hw/intc/arm_gicv3_kvm.c | 1 -
>>>  2 files changed, 2 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
>>> index 6f467e6..204369d 100644
>>> --- a/hw/intc/arm_gic_kvm.c
>>> +++ b/hw/intc/arm_gic_kvm.c
>>> @@ -572,7 +572,6 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
>>>  
>>>      if (kvm_has_gsi_routing()) {
>>>          /* set up irq routing */
>>> -        kvm_init_irq_routing(kvm_state);
>>>          for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
>>>              kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
>>>          }
>>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>>> index 001d82b..aa4c7c5 100644
>>> --- a/hw/intc/arm_gicv3_kvm.c
>>> +++ b/hw/intc/arm_gicv3_kvm.c
>>> @@ -813,7 +813,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>>>  
>>>      if (kvm_has_gsi_routing()) {
>>>          /* set up irq routing */
>>> -        kvm_init_irq_routing(kvm_state);
>>>          for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
>>>              kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
>>>          }
>>>
>>
>> .
>>
> 
