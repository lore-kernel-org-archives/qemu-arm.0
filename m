Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6871313lff;
        Mon, 23 Dec 2019 01:12:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVPU7nmIh0mT6TytAioxEjHQy4dfOhOP5AXvDzdJ6GwITvd8rY2m+Q9YL+PNFSQE/D0wLJ
X-Received: by 2002:a05:6830:1608:: with SMTP id g8mr29854718otr.169.1577092330381;
        Mon, 23 Dec 2019 01:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577092330; cv=none;
        d=google.com; s=arc-20160816;
        b=JIP/VHEo36973TRdpFE1YiFpZoE+E7ERvldDsnh91hXCDOx98pJLoq4nsJtawMDAPt
         ltQTjc8bo89XWSz9EnsTlyUF/AjLfAsYnrnbq6XwUnLssfPAYg84CFMOU1WX4afwBIRM
         2YejLYUNg5GZL2KAsn1Fo5Ptr8e0KejPfL0IOCbn9mrMiQqJkO9x1R0lR97mqgDYngb/
         DRYf5AB9L/u8x3HMe28RoDL32/B/7hOZNzV7fGUdQgD6TCsqVxHsWyDblqRXO6xjTzjm
         /UHHrt9vZBOhSg8s2kS5VVRPVC/MVsJlYp0DEduSUAX36I4cEZbS09E3dGDozXMarY1s
         enMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f/xlkTrstnlRNO4FHVwyPI1ENajclFfywGWkCwYYhL8=;
        b=dNnO+LI8BIBkGxgAkszQDOFrvWqAiA3AKiCqHiDLb2sb0UELgaNLWj//3vt1gOTKw4
         nBBhMHYTFvjxU3B5cxL2rIyLyrNelBwWDZ8dJ9v4EfP/yf9f8uMfCvbN8y9maFcQEAq1
         ewehFY1RQ7PYx664BAWG+vKAI5RfOe21p5MaZaqRvP990kYC8kei17lLyjQkwOehjFng
         vlsLuYavgEgCKnCXaoEFUV9FbFTUGvui54kV1qWGJQUxV+6QYPisjE4bVkt4BvmbKSa6
         ZLBBq2K/QzB1lhF531qZTDKQ0bthmvPxHz4FhLyE8FSkRrTaTGSavEOdhRbKXnxmZfKl
         09+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eit4hSy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si6376595otq.83.2019.12.23.01.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 01:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eit4hSy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ijJl3-00018m-IF
	for alex.bennee@linaro.org; Mon, 23 Dec 2019 04:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ijJks-00018I-Qu
 for qemu-arm@nongnu.org; Mon, 23 Dec 2019 04:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ijJkq-0003rd-A3
 for qemu-arm@nongnu.org; Mon, 23 Dec 2019 04:11:57 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24227
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ijJkp-0003kQ-QM
 for qemu-arm@nongnu.org; Mon, 23 Dec 2019 04:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577092314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/xlkTrstnlRNO4FHVwyPI1ENajclFfywGWkCwYYhL8=;
 b=Eit4hSy9tg++TF/RK5CnRU04vqMS9Cqn1XS1nZ8eI91j+zhPDdrB90ng4WXcX9PIYA3Cau
 ypAi3bPXMCoKAbvK3bbAkcAYhxTg7b1lmHBt23p3s3mTC94k1UboqS4kCDLg73YAFYXzO9
 NP8+01S8eZs19zaEOvY1WIk7sAopa/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-msKCyRmkPfiF8ozY0gdOAw-1; Mon, 23 Dec 2019 04:11:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA48D189DF40;
 Mon, 23 Dec 2019 09:11:51 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCED260BE0;
 Mon, 23 Dec 2019 09:11:41 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 05/20] virtio-iommu: Endpoint and domains
 structs and helpers
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-6-eric.auger@redhat.com>
 <20191210163716.GD277340@myrica>
 <28597404-b9ac-8c16-e9e8-ad5793f2f5a3@redhat.com>
 <20191220170028.GB2626852@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fe993994-1b69-cf47-4f9a-88572e275a3e@redhat.com>
Date: Mon, 23 Dec 2019 10:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191220170028.GB2626852@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: msKCyRmkPfiF8ozY0gdOAw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LL7A9XBgSHxq

Hi Jean,

On 12/20/19 6:00 PM, Jean-Philippe Brucker wrote:
> On Thu, Dec 19, 2019 at 07:31:08PM +0100, Auger Eric wrote:
>> Hi Jean,
>>
>> On 12/10/19 5:37 PM, Jean-Philippe Brucker wrote:
>>> On Fri, Nov 22, 2019 at 07:29:28PM +0100, Eric Auger wrote:
>>>> +typedef struct viommu_domain {
>>>> +    uint32_t id;
>>>> +    GTree *mappings;
>>>> +    QLIST_HEAD(, viommu_endpoint) endpoint_list;
>>>> +} viommu_domain;
>>>> +
>>>> +typedef struct viommu_endpoint {
>>>> +    uint32_t id;
>>>> +    viommu_domain *domain;
>>>> +    QLIST_ENTRY(viommu_endpoint) next;
>>>> +} viommu_endpoint;
>>>
>>> There might be a way to merge viommu_endpoint and the IOMMUDevice
>>> structure introduced in patch 4, since they both represent one endpoint.
>>> Maybe virtio_iommu_find_add_pci_as() could add the IOMMUDevice to
>>> s->endpoints, and IOMMUDevice could store the endpoint ID rather than bus
>>> and devfn.
>>
>> On PCI bus enumeration we locally store the PCI bus hierarchy under the
>> form of GHashTable of IOMMUDevice indexed by iommu_pci_bus pointer.
>> Those are all the devices attached to the downstream buses. We also use
>> an array of iommu pci bus pointers indexed by bus number that is lazily
>> populated due to the fact, at enumeration time we do know the bus number
>> yet. As you pointed, I haven't used the array of iommu pci bus pointers
>> indexed by bus number in this series and I should actually. Currently I
>> am not checking on attach that the sid effectively corresponds to a sid
>> protected by this iommu. I will add this in my next version. The above
>> structures are used in intel_iommu and smmu code as well and I think
>> eventually this may be factorized a common base class..
>>
>> on the other hand the gtree of viommu_endpoint - soon renamed in
>> CamelCase form ;-) - corresponds to the EPs that are actually attached
>> to any domain. It is indexed by sid and not by bus pointer. This is more
>> adapted to the virtio-iommu case.
>>
>> So, despite your suggestion, I am tempted to keep the different
>> structures as the first ones are common to all iommu emulation code and
>> the last is adapted to the virtio-iommu operations.
>>
>> Thoughts?
> 
> Makes sense, it seems better to keep them separate. I had missed that the
> PCI bus number is resolved later, and started to move the endpoint ID into
> IOMMUDevice when adding MMIO support, but I'll need to revisit this.
> 
> I'll be off for two weeks, have a nice holiday!

Thanks, you too.

Merry Christmas! :-)

Eric
> 
> Thanks,
> Jean
> 

