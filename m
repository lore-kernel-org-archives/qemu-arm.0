Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1049889wrg;
        Fri, 14 Jun 2019 07:52:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwa+u5l7p+q6AM+1zIsbEeE0CBYZPgV0x+FrXJ/5w3tULjxmiPQQ7LS4vDJzJPuxCxIQJz
X-Received: by 2002:ac8:669a:: with SMTP id d26mr2452769qtp.162.1560523965948;
        Fri, 14 Jun 2019 07:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560523965; cv=none;
        d=google.com; s=arc-20160816;
        b=kzUZYD1XqXM6w9eJVgetvXLCOkwnycmycOxu4xBh88fOmT350TcLMTvk3LvEMpF2AR
         z8l1luE8fkTHFHNkOWuasI5OsSHZFjsyt8WVWsuCmK+TBlfO3SWjkujKyYtiI3PlvooQ
         Aja6mRSUBjdCR7UMuYJ44Qq/pygXiTFLeVS1cdJXHVvlScrvqumPaL+Ja0PghKqEAvIM
         8na6vWlyPWME3rpRZofsYaF+3OaBorbDd8RMDpV7UL4WzXp0iG2Qoyk7E++O5RNOcrqC
         X25XYWZ2WAlnDxUXYZodarB0wK7ODZ0f0rA9vZ+db7mfMYE+l2cn90eAOqci9A5leL/n
         /nSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=IsvEYNDb+znDDkkvHkdkUFIRCZA6HUFkCoo/t9gROcM=;
        b=HVsC43rdBxXCl+DUT8gdD+qG65sgCuQYbirIny8c0Dyl+Y3UE38f5kBp1m+CFzG3rM
         7Sy3OHw2c5DDDr6+HycbeVEYV6qQdRp+32zSZGl/UBX0XU2w2ggXReX+LUrOy6q1jM3A
         B2IS8oCY4X1SYh6Drv+5TnE8QFDL5wxfJ3kcnAwd0d8EAWEBLvV5YaUvB11UBoxcJ3g/
         5CvYVPqJ76uyvJCiMaMExRpAM42Obq7Q6DU0cvv5HtFxaUhUL7JD5rRKeIpTBcUaCF8O
         AnuH0TKdQHI+HkXHMqaaFu3PDxLCRw1v6NbGuYv3ej1HZnf0TqjnC908UHE3wdDJKKU9
         4ZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 46si1860141qts.221.2019.06.14.07.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 07:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbnZN-0001dL-Fh
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 10:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56067)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hbmts-0008Tu-IC
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hbmtr-0003yP-Gt
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:09:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hbmtn-0003ui-Vs; Fri, 14 Jun 2019 10:09:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BDDD3082A8F;
 Fri, 14 Jun 2019 14:09:44 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7D019700;
 Fri, 14 Jun 2019 14:09:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190611142821.3874-1-eric.auger@redhat.com>
 <20190611142821.3874-3-eric.auger@redhat.com>
 <CAFEAcA_OYdL1TPN+OTdkZ0J2fx_4vFiXCs0fUVdGjkkMURCfZA@mail.gmail.com>
 <ef87a46b-06fc-a66d-37ca-4499afc76663@redhat.com>
 <CAFEAcA-Zo_qSsRfjrr-ewRU5ozc083Lw_vxaR1DufVOmtw5mdA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <51a91dd1-1eab-afc5-a5c9-77a3f189f41f@redhat.com>
Date: Fri, 14 Jun 2019 16:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Zo_qSsRfjrr-ewRU5ozc083Lw_vxaR1DufVOmtw5mdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 14 Jun 2019 14:09:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] hw/arm/smmuv3: Implement dummy replay
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sGQudH8GhgDF

Hi Peter,

On 6/14/19 3:45 PM, Peter Maydell wrote:
> On Fri, 14 Jun 2019 at 14:40, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Peter,
>>
>> On 6/14/19 3:26 PM, Peter Maydell wrote:
>>> On Tue, 11 Jun 2019 at 15:29, Eric Auger <eric.auger@redhat.com> wrote:
>>>>
>>>> On ARM we currently do not support VFIO-PCI devices protected
>>>> by the IOMMU. Any attempt to run such use case results in this
>>>> kind of warning:
>>>>
>>>> "-device vfio-pci,host=0004:01:00.0,id=hostdev0,bus=pci.1,addr=0x0:
>>>> warning: SMMUv3 does not support notification on MAP: device vfio-pci
>>>> will not function properly".
> 
>>>> +static inline void
>>>> +smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>>>> +{
>>>> +}
>>>
>>> This doesn't seem like a valid implementation of the replay
>>> method to me. The API doc comment says
>>>      * The default implementation of memory_region_iommu_replay() is to
>>>      * call the IOMMU translate method for every page in the address space
>>>      * with flag == IOMMU_NONE and then call the notifier if translate
>>>      * returns a valid mapping. If this method is implemented then it
>>>      * overrides the default behaviour, and must provide the full semantics
>>>      * of memory_region_iommu_replay(), by calling @notifier for every
>>>      * translation present in the IOMMU.
>>>
>>> This empty function is definitely not going to call the notifier
>>> for every IOMMU translation...
>> The situation is a bit odd. SMMUv3 is not integrated with VFIO so VFIO
>> devices will not work anyway (we are not able to notify on MAP). There
>> is a warning already reporting the issue. However the default
>> implementation of memory_region_iommu_replay() prevents the guest from
>> booting. So what would you advise?
> 
> I dunno, but if the API isn't supposed to behave the way we've
> documented it to, we should fix the documentation...

fair enough

 Since
> the only user of memory_region_iommu_replay() is the vfio code
> I guess we can define it however is most convenient for vfio,
> but we should document what the method has to do to make things
> work.

OK I need to think about it. Maybe an alternative is to call
memory_region_iommu_replay() only when it makes sense.
> 
> PS: we have a memory_region_iommu_replay_all() which currently
> appears to be not used by anybody, could we get rid of it?

I will do that

Thanks

Eric
> 
> thanks
> -- PMM
> 
