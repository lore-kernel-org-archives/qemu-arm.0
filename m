Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp973953wrg;
        Fri, 14 Jun 2019 06:41:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwto3ZJ5epUtUwtysCJ7Wf/Wa6H3JkWwOmTZcKBkRaTkP75okNQeK/Opdu3+tphJghdWU1i
X-Received: by 2002:a37:6282:: with SMTP id w124mr32892544qkb.33.1560519668990;
        Fri, 14 Jun 2019 06:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560519668; cv=none;
        d=google.com; s=arc-20160816;
        b=wAuYrafNs+b9EzAvAFVK1H+8ERsWynw0D+kN5k7ItwBJD6GdpcQcLbcyH7UeJ8CXJS
         pdKqMhu2srzEymVxeRsa5bLBirJbueXuN8bJ6zGlOr4PH67z1GKDA1EASQkqfGYrxPZh
         32hXslNDLpkFtyrX910MdUw6Nidq8TDLUWTbxv36FRZnK29bBymvIAXUIjHi5B4zG7PV
         K6Q86YehfYJ7iTcjPUsLxL+TAd68+eZbB4aw9dh45XVjnjBx83QpF5MDP4azjSpMin4T
         3QhDdb4n0m3LcibpJ5cr0YzrVjat+v9OdTKXULkutuZ0/DCW3bTMr/J0FXYlIy3WF5X/
         pNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=yAjeQ57jqEitKtoklHCR/f6Hzjxu5n1P/UqXIYvU8rU=;
        b=OtnUabeEiDaI8/s+Hab0wIqqbxRcraG7iUo5YxFZD/UscOBXwP2f/2Ekny3zJQ6OG0
         Ftm0HztjNhu26hcsyhvfDwtxxJVnyHHjDu7+lyc6lFUUSt4kN/DiQbIpmg0+G8zn/pWq
         S9wKpAvuJpRjZZtKNm1pvTXYRCsiIO5AIn526XC7sCo02pHjXWnEVerxEUExprh6MC3n
         /up/KYaJ86lwOdv9rGX+i53ETk8G2eAYV5SC6g9RuNiW3pC/bGf/XyrYLQa5a1VQ4Zlg
         oaT+16vZdOb6cqSyLCWCy3wuxrampwA8AaeicUXNAiWxXnwuD1MWupOjKMHrxmD3fm9F
         UlgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si1691671qtt.296.2019.06.14.06.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 06:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbmS3-0001Vs-VJ
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 09:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46139)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hbmRR-0001UD-Je
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 09:40:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hbmRQ-0005bU-BG
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 09:40:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hbmRQ-0005aD-1V; Fri, 14 Jun 2019 09:40:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DD63316290D;
 Fri, 14 Jun 2019 13:40:22 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A732F1001B1A;
 Fri, 14 Jun 2019 13:40:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190611142821.3874-1-eric.auger@redhat.com>
 <20190611142821.3874-3-eric.auger@redhat.com>
 <CAFEAcA_OYdL1TPN+OTdkZ0J2fx_4vFiXCs0fUVdGjkkMURCfZA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ef87a46b-06fc-a66d-37ca-4499afc76663@redhat.com>
Date: Fri, 14 Jun 2019 15:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_OYdL1TPN+OTdkZ0J2fx_4vFiXCs0fUVdGjkkMURCfZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 14 Jun 2019 13:40:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/smmuv3: Implement dummy replay
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d0NWV6aNwZ1z

Hi Peter,

On 6/14/19 3:26 PM, Peter Maydell wrote:
> On Tue, 11 Jun 2019 at 15:29, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> On ARM we currently do not support VFIO-PCI devices protected
>> by the IOMMU. Any attempt to run such use case results in this
>> kind of warning:
>>
>> "-device vfio-pci,host=0004:01:00.0,id=hostdev0,bus=pci.1,addr=0x0:
>> warning: SMMUv3 does not support notification on MAP: device vfio-pci
>> will not function properly".
>>
>> However this is just a warning and this should not prevent the
>> guest from booting in a reasonable amount of time. This does not
>> happen currently.
>>
>> This is due to the fact the VFIO vfio_listener_region_add() calls
>> memory_region_iommu_replay(). As the SMMUv3 IOMMUMemoryRegionClass
>> currently does not implement the replay() callback, the default
>> memory_region_iommu_replay() implementation is used. This latter
>> loops on the whole notifier's range (48b address space), translates
>> each page and call the notifier on the resulting entry. This totally
>> freezes the guest.
>>
>> The Intel IOMMU implements the replay() function which only
>> notifies valid page table entries.
>>
>> In the looming SMMUv3 nested stage VFIO integration, there will be
>> no need to replay() anything as there will not be any shadow page
>> tables: the stage 1 page tables are owned by the guest.
>>
>> So let's implement a void replay() which satisfies both cases.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index e2f07d2864..1f578365ef 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -1489,6 +1489,11 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>      }
>>  }
>>
>> +static inline void
>> +smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>> +{
>> +}
> 
> This doesn't seem like a valid implementation of the replay
> method to me. The API doc comment says
>      * The default implementation of memory_region_iommu_replay() is to
>      * call the IOMMU translate method for every page in the address space
>      * with flag == IOMMU_NONE and then call the notifier if translate
>      * returns a valid mapping. If this method is implemented then it
>      * overrides the default behaviour, and must provide the full semantics
>      * of memory_region_iommu_replay(), by calling @notifier for every
>      * translation present in the IOMMU.
> 
> This empty function is definitely not going to call the notifier
> for every IOMMU translation...
The situation is a bit odd. SMMUv3 is not integrated with VFIO so VFIO
devices will not work anyway (we are not able to notify on MAP). There
is a warning already reporting the issue. However the default
implementation of memory_region_iommu_replay() prevents the guest from
booting. So what would you advise?

Thanks

Eric
> 
> thanks
> -- PMM
> 
