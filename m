Received: by 10.28.91.67 with SMTP id p64csp3814995wmb;
        Tue, 6 Mar 2018 06:48:02 -0800 (PST)
X-Google-Smtp-Source: AG47ELvz1d068kqShEkTp6nTAjgjlI6Vx6PiyzQuYmjThlf9VCwJwalEtkSZ2IfUqLI0wblKqvMJ
X-Received: by 2002:a25:67c6:: with SMTP id b189-v6mr11447703ybc.199.1520347682156;
        Tue, 06 Mar 2018 06:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520347682; cv=none;
        d=google.com; s=arc-20160816;
        b=pjEQP+wxDjwVezow0bYR/fr1jgb24wETB9du5Ht6lS8uBuc/TJli7eoscqn6YXkRkL
         iVeb9iY7cBfWe/l+t8wbYOwP6xb38bTr5ryjNSxzwTpH53KshLPrALg1Nzuhy1REl8mi
         jpYCoDbbyTKcUcK2hcW9U0f1VQrAp6VRwFvMOObIFPEPJuT+BLFPspu7zirQEnCPQYTs
         s0zQk9rugB7jIDoCjSkzJd6j+Tf/AivQj2GxLVq17o0/4bTVZzSaqLe2ey02cCKyj/Fo
         ZEGgwO3zXcTGVAPxy25Iu1ctABAIcK2Nl3UleGVAMmzXbnE4IXjHaeiumIoSe1Qp+sq7
         ditw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=+xhu1f45zKFUva41217HFkxkC/JdvTp6r4Zsm+OXfwI=;
        b=G6qiifHKdWjgp+0qPZcvIXyvkMc2cYa92cYLtmAyAByWnZXg+lEuaEU+5VYGQ30RMQ
         G5VSg9sk7VoxiQdchaNX5qiCcH/HZN6DA/bsyqzVtVU+bhBUJ390qRVwKHHKdkMj+Y+W
         Y2PBxwq43ZSjf02xkpurNCt1lsFYzvw4FFg6qZCdVPDK2h8kXSVzYGFv9uXtq6V1u7Cs
         nkwGMsS3Lcd4HJRdkng+WxnvGvIIg1kYY+w0eO7ssb8e1spXw+Svvkilhvi1UHs2lH//
         n4yF2uA4mb6ZFi97Z6Zn/GCvh4+0rvnZBa9W5FsyZqMDl05qJ/HaxqSF5/oVYulQGatU
         7NmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si2641187ywe.31.2018.03.06.06.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 06:48:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etDsn-0000cL-Gm
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 09:48:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1etDsa-0000aV-3A
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1etDsW-0008F7-W0
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 09:47:48 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38356 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1etDsW-0008Ed-QV; Tue, 06 Mar 2018 09:47:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9C3D404008D;
	Tue,  6 Mar 2018 14:47:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF562026DFD;
	Tue,  6 Mar 2018 14:47:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-uMZwR8HfVDx0Rau9G2unMypWJEL0o3ACPHxCqZ+g=_Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e54bcea4-3b04-7409-89c1-b2a79010c969@redhat.com>
Date: Tue, 6 Mar 2018 15:47:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-uMZwR8HfVDx0Rau9G2unMypWJEL0o3ACPHxCqZ+g=_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 06 Mar 2018 14:47:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 06 Mar 2018 14:47:43 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 02/14] hw/arm/smmu-common:
 IOMMU memory region and address space setup
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
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o/5OreSorChA

Hi Peter,

On 06/03/18 15:08, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> We enumerate all the PCI devices attached to the SMMU and
>> initialize an associated IOMMU memory region and address space.
>> This happens on SMMU base instance init.
>>
>> Those info are stored in SMMUDevice objects. The devices are
>> grouped according to the PCIBus they belong to. A hash table
>> indexed by the PCIBus poinet is used. Also an array indexed by
> 
> "pointer".
OK
> 
>> the bus number allows to find the list of SMMUDevices.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v8 -> v9:
>> - fix key value for lookup
>>
>> v7 -> v8:
>> - introduce SMMU_MAX_VA_BITS
>> - use PCI bus handle as a key
>> - do not clear s->smmu_as_by_bus_num
>> - use g_new0 instead of g_malloc0
>> - use primary_bus field
>> ---
>>  hw/arm/smmu-common.c         | 59 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/arm/smmu-common.h |  6 +++++
>>  2 files changed, 65 insertions(+)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 86a5aab..d0516dc 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -28,12 +28,71 @@
>>  #include "qemu/error-report.h"
>>  #include "hw/arm/smmu-common.h"
>>
>> +SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
>> +{
>> +    SMMUPciBus *smmu_pci_bus = s->smmu_as_by_bus_num[bus_num];
> 
> Variable name suggests this is a table of AddressSpaces indexed by
> bus number, but the code says we're getting SMMUPCIBus objects from it?
Yes I can rename this variable. It stems from x86 naming (see
hw/intel_iommu.c vtd_find_as_from_bus_num). The code here does the same
functionality with arm smmu datatypes.
SMMUPciBus ~ VTDBus and smmu_as_by_bus_num ~ vtd_as_by_bus_num

purpose is to find the SMUPciBus which matches the bus number passed in
parameter.

> 
>> +
>> +    if (!smmu_pci_bus) {
>> +        GHashTableIter iter;
>> +
>> +        g_hash_table_iter_init(&iter, s->smmu_as_by_busptr);
>> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
>> +            if (pci_bus_num(smmu_pci_bus->bus) == bus_num) {
>> +                s->smmu_as_by_bus_num[bus_num] = smmu_pci_bus;
>> +                return smmu_pci_bus;
>> +            }
>> +        }
> 
> Why do we populate this hashtable lazily rather than when we
> put the SMMUPciBus in the smmu_as_by_busptr table? Do we
> expect this function not to ordinarily be called?

This function only is used when handling invalidations (vhost/vfio). I
can even remove it from this series at this stage and re-introduce
latter on. From the SID, you retrieve bus_num, retrieve the SMMUPciBus.
Andd from the function number you can then retrieve the IOMMU mr at
smmu_bus->pbdev[devfn]

That's the purpose of ths function. But I will remove it.
> 
>> +    }
>> +    return smmu_pci_bus;
>> +}
>> +
>> +static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>> +{
>> +    SMMUState *s = opaque;
>> +    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_as_by_busptr, bus);
>> +    SMMUDevice *sdev;
>> +
>> +    if (!sbus) {
>> +        sbus = g_malloc0(sizeof(SMMUPciBus) +
>> +                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
>> +        sbus->bus = bus;
>> +        g_hash_table_insert(s->smmu_as_by_busptr, bus, sbus);
>> +    }
>> +
>> +    sdev = sbus->pbdev[devfn];
>> +    if (!sdev) {
>> +        char *name = g_strdup_printf("%s-%d-%d",
>> +                                     s->mrtypename,
>> +                                     pci_bus_num(bus), devfn);
>> +        sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
>> +
>> +        sdev->smmu = s;
>> +        sdev->bus = bus;
>> +        sdev->devfn = devfn;
>> +
>> +        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
>> +                                 s->mrtypename,
>> +                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
>> +        address_space_init(&sdev->as,
>> +                           MEMORY_REGION(&sdev->iommu), name);
> 
> This leaks the memory pointed to by name, doesn't it?
> (address_space_init() takes a copy of the name string, so you want
> to g_free(name) here.)
Hum yes. Will free it.
> 
>> +    }
>> +
>> +    return &sdev->as;
>> +}
>> +
>>  static void smmu_base_realize(DeviceState *dev, Error **errp)
>>  {
>>      SMMUState *s = ARM_SMMU(dev);
>>
>>      s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>>      s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>> +    s->smmu_as_by_busptr = g_hash_table_new(NULL, NULL);
>> +
>> +    if (s->primary_bus) {
>> +        pci_setup_iommu(s->primary_bus, smmu_find_add_as, s);
>> +    } else {
>> +        error_setg(errp, "SMMU is not attached to any PCI bus!");
>> +    }
>>  }
>>
>>  static void smmu_base_reset(DeviceState *dev)
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index 8a9d931..aee96c2 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -121,4 +121,10 @@ typedef struct {
>>  #define ARM_SMMU_GET_CLASS(obj)                              \
>>      OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_ARM_SMMU)
>>
>> +SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
>> +
>> +static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>> +{
>> +    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
>> +}
> 
> Can we have at least brief documentation comments for any
> new functions or prototypes added to header files, please?
Sure.

Thanks

Eric
> 
>>  #endif  /* HW_ARM_SMMU_COMMON */
>> --
> 
> thanks
> -- PMM
> 
