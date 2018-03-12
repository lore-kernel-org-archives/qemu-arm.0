Received: by 10.28.91.67 with SMTP id p64csp883243wmb;
        Mon, 12 Mar 2018 08:16:56 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvMbvDyuMhOo++MYD7/2X/D7t8fgAFQxE9os3IGogrIrzfEYSRTHC39MRoahoVpLgfobd4g
X-Received: by 10.129.73.133 with SMTP id w127mr4772718ywa.320.1520867816638;
        Mon, 12 Mar 2018 08:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520867816; cv=none;
        d=google.com; s=arc-20160816;
        b=XlUVemp9xjrU5GPhNB6qfyThsnlJhp/HeECuJJHtmIXyJ18YAVfN9i5aCckLE8ciL4
         Ux16HwbrHDcnTZRGgRzx+k4JIX/69z8Gq7hqFiFE/wm/erG6N437jPzoVePbkkfC+tfW
         Gr//cB6a4lhg5sELm7nS/O7aMiL/fAiokPtf8sVAzGgviUhVQpGrSUCXDcY670dKk2pE
         II/fpR6o2SaOjRg6tjB6eF6yADpvFJJJCkP6+0ixqdLRCbnWIMBQC3ZTuU3mOyYBADNf
         wppsQbndJrKZAp6Vyi2JVHQ0v/eSoMs0e65PCmHyKlL7BO6e1BzCu0dwkfcgHJwg/Wzv
         SitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=7cf+Gr97mZXBfKNDnTxIqYJChe7Ue69HSaog+8gm83Q=;
        b=X1OdlbaIq5UdvcARxVouJdoSV6ZG7qARZ7qR29dFuMW7QJq/0FQVJQVmEzS3Km1FVV
         BVSnjOPPFnHHvp4Y3wLsohSnh1eLO5gQuya7eTm5rpAAae573QWgXnTErwtONNoHAQ0N
         I8MFGBgwWjsSdZj7VcD1WmbNFyIDQqU34ZQ+kHuLOPhSDLPO+JY1WmzzjsdGY7bOIhm3
         wgCUIISAX7WSa4dF0Zpu9asCOFwMuSFtzBxxNV6TJRwmyl7PQRxWIP0oEhyC3McfmNqK
         tCsM8zLQtm99vFj5RfBjTaXKukpIRYwhhvSo0qEBMaQwMr/hLDU/B1/hu+3ETQjSBx53
         XDLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 206si970651ywn.399.2018.03.12.08.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 08:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evPC3-0007cy-Us
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 11:16:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evPBw-0007cp-Vf
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evPBs-00011r-US
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:16:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33724 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1evPBs-00010L-MW; Mon, 12 Mar 2018 11:16:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 767D2C33F;
	Mon, 12 Mar 2018 15:16:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 512257C53;
	Mon, 12 Mar 2018 15:16:27 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-12-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_9cmK9gebqE9997fzhTzKT6Ky9q4jn=fxwziopDyK9Ew@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cc6029a1-c177-ee8c-d09b-0ed2af81c897@redhat.com>
Date: Mon, 12 Mar 2018 16:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9cmK9gebqE9997fzhTzKT6Ky9q4jn=fxwziopDyK9Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 12 Mar 2018 15:16:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 12 Mar 2018 15:16:40 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 11/14] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
	Paolo Bonzini <pbonzini@redhat.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlykVvpjtvro

Hi Peter,
On 12/03/18 12:59, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> In case the MSI is translated by an IOMMU we need to fixup the
>> MSI route with the translated address.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v5 -> v6:
>> - use IOMMUMemoryRegionClass API
>>
>> It is still unclear to me if we need to register an IOMMUNotifier
>> to handle any change in the MSI doorbell which would occur behind
>> the scene and would not lead to any call to kvm_arch_fixup_msi_route().
> 
> Paolo, do you know the answer to this question ?
> 
>> ---
>>  target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
>>  target/arm/trace-events |  3 +++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 1219d00..9f5976a 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -20,8 +20,13 @@
>>  #include "sysemu/kvm.h"
>>  #include "kvm_arm.h"
>>  #include "cpu.h"
>> +#include "trace.h"
>>  #include "internals.h"
>>  #include "hw/arm/arm.h"
>> +#include "hw/pci/pci.h"
>> +#include "hw/pci/msi.h"
>> +#include "hw/arm/smmu-common.h"
>> +#include "hw/arm/smmuv3.h"
>>  #include "exec/memattrs.h"
>>  #include "exec/address-spaces.h"
>>  #include "hw/boards.h"
>> @@ -666,6 +671,28 @@ int kvm_arm_vgic_probe(void)
>>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>>                               uint64_t address, uint32_t data, PCIDevice *dev)
>>  {
>> +    AddressSpace *as = pci_device_iommu_address_space(dev);
>> +    IOMMUMemoryRegionClass *imrc;
>> +    IOMMUTLBEntry entry;
>> +    SMMUDevice *sdev;
>> +
>> +    if (as == &address_space_memory) {
>> +        return 0;
>> +    }
>> +
>> +    /* MSI doorbell address is translated by an IOMMU */
>> +    sdev = container_of(as, SMMUDevice, as);
>> +    imrc = IOMMU_MEMORY_REGION_GET_CLASS(&sdev->iommu);
>> +
>> +    entry = imrc->translate(&sdev->iommu, address, IOMMU_WO);
>> +
>> +    route->u.msi.address_lo = entry.translated_addr;
>> +    route->u.msi.address_hi = entry.translated_addr >> 32;
>> +
>> +    trace_kvm_arm_fixup_msi_route(address, sdev->devfn,
>> +                                  sdev->iommu.parent_obj.name,
>> +                                  entry.translated_addr);
>> +
>>      return 0;
>>  }
> 
> It seems a bit odd that:
>  * the code for arm for "PCI devices behind IOMMU need to have
>    the MSI doorbell writes go through the IOMMU" looks rather
>    different from the code for x86 for the same thing
ARM SMMU translates MSIs whereas Intel/AMD IOMMU do not translate them.
Hence this implementation
>  * the code here needs to know specifically that this is an SMMU
>    and not some other kind of IOMMU
Yes when introducing virtio-iommu we will need to get this fixed. We
need a way to retrieve the iommu mr from the as. I will work on this
concurrently.
> 
> I would have expected this to be more generic-to-all-IOMMU
> APIs and maybe even implemented in the generic KVM support code...
> 
> The x86 code seems to be similarly x86-specific though, so
> this is more of a "perhaps there is a cleanup opportunity here"
> observation I guess.

OK

Thanks

Eric
> 
> thanks
> -- PMM
> 
