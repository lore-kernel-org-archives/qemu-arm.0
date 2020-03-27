Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2935290lfi;
        Fri, 27 Mar 2020 01:27:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuKcCdL18/DZ2WFG4AGL4BKFivYyiGwo+NhrKbbTWATqhAVZv8xhaMmN0ZQyRH1XN7HbaEX
X-Received: by 2002:a37:715:: with SMTP id 21mr13164130qkh.435.1585297675365;
        Fri, 27 Mar 2020 01:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585297675; cv=none;
        d=google.com; s=arc-20160816;
        b=HxE8mOF9ZMRkeZs/doZJJch/v4sWSMar4tXhK/rFUdeJSlrzvBK/2cUFQv34EYALuF
         Vak84y2JgCv5Cl7yFJDMHq62v0Suu54YZNfox/IPfbYDt1/huwMGpwhYt1HCDACayBw2
         /TWIY6sS4faz+hpp7O8TYoRbQ9GtnmgQ/6ZM/1NQvnIpaQJKDMJ8KiuBHo5bzyY7yhlJ
         VXQNcN4W61kcbBCIjqXtomACgMhUQqLFiFqTd4+Ay3xQyb6BxiUL3urel6BVNMghpnJa
         +77Yy6nsjtXu0e+DoQMB25M0DUrsx1e8prZRfKHp4M0y+C62dIWl6LxX5Dd4WjSklM8/
         DFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nsPQj0YCzXCqH70y7QKEykTLKK0R9rSMGdc7ugINK5o=;
        b=rJz+7tH8gqrN6YR5fAuY5GXgH/+AxmrSgn5gw3A/3TVKUO9yWS0v/deaHM9zcjbuNX
         NK0++rdYgwuaIqteAX9cFW2XiXok2rIIU9eg3ktsrXlnmuwMuTAms4CTEIJNyeMJeUef
         PGdbcxf5qgPVBXv0a1lF2XOysL1jwApM5fUyGThJwL9yxqxynzKxy5gzwnBHTtQy6sm9
         MgYRdFio/pQWVcS3B51OdhpqpoDq3V1nEGoIsK5njbzwywBRB87+wjg/avPyS2jl/Gyr
         lt73Ntk3KmOcN7Hl/+aCIH45fhf2ny4T9sDSxoMgrXTK1c7wC2Af3mPDOs6nzLb4n7cL
         lbKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J5ItcOL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si3008012qti.280.2020.03.27.01.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 01:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J5ItcOL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHkLK-0004gh-Ol
	for alex.bennee@linaro.org; Fri, 27 Mar 2020 04:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jHkKy-0004c6-WA
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jHkKw-00087n-TN
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:27:32 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:44962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jHkKw-00086E-Nl
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585297650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsPQj0YCzXCqH70y7QKEykTLKK0R9rSMGdc7ugINK5o=;
 b=J5ItcOL9LTN5E3GggfifjFP03kB5oPvWBEe/vim+O2kr3roYdX4k0KORGQzOmxvYM/2Hxq
 J665EQeAAoMmb4JJGud6HDpFvate5v/laEo+a3elp9bgfyQR5i2B1YRkd7A/KI+OkRswbj
 axlhQb6yN5y6xMq4o8yppsGKNjbYc8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-IaDpAuOGObmWDfB9Mfo4GA-1; Fri, 27 Mar 2020 04:27:28 -0400
X-MC-Unique: IaDpAuOGObmWDfB9Mfo4GA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13FE3107ACCA;
 Fri, 27 Mar 2020 08:27:26 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C6275DA75;
 Fri, 27 Mar 2020 08:27:11 +0000 (UTC)
Subject: Re: [EXT] Re: [PATCH v9 2/9] memory: Add interface to set iommu page
 size mask
To: Bharat Bhushan <bbhushan2@marvell.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "mst@redhat.com" <mst@redhat.com>, "Tomasz Nowicki [C]"
 <tnowicki@marvell.com>, "drjones@redhat.com" <drjones@redhat.com>,
 "linuc.decode@gmail.com" <linuc.decode@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bharatb.linux@gmail.com" <bharatb.linux@gmail.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "yang.zhong@intel.com" <yang.zhong@intel.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-3-bbhushan2@marvell.com>
 <325b9322-54b9-e0ea-a67c-52fa91082173@redhat.com>
 <MWHPR1801MB1966CDAEEB7C76ED465C10B2E3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <606c2790-b3be-5501-386b-bc5a33ba7584@redhat.com>
Date: Fri, 27 Mar 2020 09:27:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR1801MB1966CDAEEB7C76ED465C10B2E3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5b/Dxv0iQJ7i

Hi Bharat,

On 3/27/20 6:33 AM, Bharat Bhushan wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric <eric.auger@redhat.com>
>> Sent: Thursday, March 26, 2020 9:36 PM
>> To: Bharat Bhushan <bbhushan2@marvell.com>; peter.maydell@linaro.org;
>> peterx@redhat.com; eric.auger.pro@gmail.com; alex.williamson@redhat.com;
>> kevin.tian@intel.com; mst@redhat.com; Tomasz Nowicki [C]
>> <tnowicki@marvell.com>; drjones@redhat.com; linuc.decode@gmail.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; bharatb.linux@gmail.com; jean-
>> philippe@linaro.org; yang.zhong@intel.com
>> Subject: [EXT] Re: [PATCH v9 2/9] memory: Add interface to set iommu page size
>> mask
>>
>> External Email
>>
>> ----------------------------------------------------------------------
>> Hi Bharat,
>> On 3/23/20 9:46 AM, Bharat Bhushan wrote:
>>> Allow to set page size mask to be supported by iommu.
>> by iommu memory region. I mean this is not global to the IOMMU.
> 
> Yes.
> 
>>> This is required to expose page size mask compatible with host with
>>> virtio-iommu.
>>>
>>> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
>>> ---
>>>  include/exec/memory.h | 20 ++++++++++++++++++++
>>>  memory.c              | 10 ++++++++++
>>>  2 files changed, 30 insertions(+)
>>>
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h index
>>> e85b7de99a..063c424854 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -355,6 +355,16 @@ typedef struct IOMMUMemoryRegionClass {
>>>       * @iommu: the IOMMUMemoryRegion
>>>       */
>>>      int (*num_indexes)(IOMMUMemoryRegion *iommu);
>>> +
>>> +    /*
>>> +     * Set supported IOMMU page size
>>> +     *
>>> +     * Optional method: if this is supported then set page size that
>>> +     * can be supported by IOMMU. This is called to set supported page
>>> +     * size as per host Linux.
>> What about: If supported, allows to restrict the page size mask that can be
>> supported with a given IOMMU memory region. For example, this allows to
>> propagate host physical IOMMU page size mask limitations to the virtual IOMMU
>> (vfio assignment with virtual iommu).
> 
> Much better 
> 
>>> +     */
>>> +     void (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
>>> +                                      uint64_t page_size_mask);
>>>  } IOMMUMemoryRegionClass;
>>>
>>>  typedef struct CoalescedMemoryRange CoalescedMemoryRange; @@ -1363,6
>>> +1373,16 @@ int
>> memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
>>>   */
>>>  int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
>>>
>>> +/**
>>> + * memory_region_iommu_set_page_size_mask: set the supported pages
>>> + * size by iommu.
>> supported page sizes for a given IOMMU memory region
>>> + *
>>> + * @iommu_mr: the memory region
>> IOMMU memory region
>>> + * @page_size_mask: supported page size mask  */ void
>>> +memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion
>> *iommu_mr,
>>> +                                            uint64_t page_size_mask);
>>> +
>>>  /**
>>>   * memory_region_name: get a memory region's name
>>>   *
>>> diff --git a/memory.c b/memory.c
>>> index aeaa8dcc9e..14c8783084 100644
>>> --- a/memory.c
>>> +++ b/memory.c
>>> @@ -1833,6 +1833,16 @@ static int
>> memory_region_update_iommu_notify_flags(IOMMUMemoryRegion
>> *iommu_mr,
>>>      return ret;
>>>  }
>>>
>>> +void memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion
>> *iommu_mr,
>>> +                                            uint64_t page_size_mask)
>>> +{
>>> +    IOMMUMemoryRegionClass *imrc =
>>> +IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
>>> +
>>> +    if (imrc->iommu_set_page_size_mask) {
>>> +        imrc->iommu_set_page_size_mask(iommu_mr, page_size_mask);
>> Shouldn't it return an int in case the setting cannot be applied?
> 
> iommu_set_page_size_mask() is setting page-size-mask for endpoint. Below function from code
> 
> 	static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>               	                              uint64_t page_size_mask)
> 	{
>     		IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> 
> 	              sdev->page_size_mask = page_size_mask;
> 	}
> 
> Do you see any reason it cannot be applied, am I missing something?
maybe the function can be called several times and one setting is
already in place. In other contexts, maybe the setting we try to apply
is not compatible with other settings enforced?

Thanks

Eric
> 
> Thanks
> -Bharat
> 
>>> +    }
>>> +}
>>> +
>>>  int memory_region_register_iommu_notifier(MemoryRegion *mr,
>>>                                            IOMMUNotifier *n, Error
>>> **errp)  {
>>>
>> Thanks
>> Eric
> 

