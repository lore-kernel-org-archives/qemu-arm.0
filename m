Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2936165lfi;
        Fri, 27 Mar 2020 01:29:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs/+pz+3krDJBozXes6ntE5YF5X6aXzoC5QqTp04kbQppzd5ix2FkByRd2oSkS0JL1Ayrv1
X-Received: by 2002:ac8:23ed:: with SMTP id r42mr12940091qtr.372.1585297747308;
        Fri, 27 Mar 2020 01:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585297747; cv=none;
        d=google.com; s=arc-20160816;
        b=rEc//DCld7CzALnmvZxdJljIUUfZPmgTMI6SR8Y1YQEkiOWofI7sH67BRVGRCVLoit
         7+kalGhmmyIYtkhw8osf/MwhNbIX9S/DX1FeN5y9Wd3RgrIYuSxtg6dcoa2itqtUlzJa
         WSYQ4/ty5pnWaEg79h9jKMNCdTyIClCl1l4B4baQycVCqU9YNrrVNWlN8CDOBtlbeTEC
         f3FQk33mRmp0yXUqerasn+CInH/nnXlOe3f1ZLxhVxrgI6d9CHr+io/r+Arcv1020L68
         b2H1ZwoKfPBXJYzTJPvDSm41rBQgzXG737l6cJqIuoFfF+w44dcspYiBQbim40Tv/hLM
         q4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=20Y4zlJaNBnfNuuKPoWhp+FJmNwDi/MeDM40fcn1rQM=;
        b=pZk0YjSbNVTGFLyynLLZLzaTpeu7tA8k6vaReRsodKIhPepXvTjvO8BCV0448cUxg8
         USE376qWMAjDz2ixlRVhJ/s4LW2DeuDEipAvFYDwdU5GdW3XVpq8xc7d4vInuhLECd88
         NUaspOT5qKNH4XOn9AcnySgoaj0Q9UbjFQXB8nG351vIqf3BrvVy0ECxqE3L3nsCDS3U
         EmVWlO9T7V1GNZD+Q1v18r8tKiO5Cc1X1gKA3vooRCunEBREG0DAxVIKRzWTeG0ch6M4
         e4GKcqG1wp3mqSEMWlXGdBBygt8KoiGutosTIfGSWYesV858c1Pz50Qyx4TyW2FUlW7G
         z/OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JUA85n9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si3004276qkg.320.2020.03.27.01.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 01:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JUA85n9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHkMU-0005uH-Ng
	for alex.bennee@linaro.org; Fri, 27 Mar 2020 04:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jHkML-0005tP-RL
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jHkMK-00049P-DU
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:28:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:50022)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jHkMK-000485-9R
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 04:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585297735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20Y4zlJaNBnfNuuKPoWhp+FJmNwDi/MeDM40fcn1rQM=;
 b=JUA85n9gtDbixyhfO/rdVEMXtBKVNpwQ+MBPeIIbKwcsDnAFw9lmVLnPXrwMcmKXZiK4dG
 WFurLfYltUEcfp++8jfrwQYFLiaus9EjmUyN5yDyJEq6l8wIaE2BgPXDbv7g4z6dwzzpPs
 WHzVFgd0jidy/vvc3GgFJh5QSnYfPtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-rmVpEUTCNqSu8GjkXpE1AQ-1; Fri, 27 Mar 2020 04:28:52 -0400
X-MC-Unique: rmVpEUTCNqSu8GjkXpE1AQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337E5107ACCC;
 Fri, 27 Mar 2020 08:28:50 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBCE19C69;
 Fri, 27 Mar 2020 08:28:36 +0000 (UTC)
Subject: Re: [EXT] Re: [PATCH v9 4/9] virtio-iommu: set supported page size
 mask
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
 <20200323084617.1782-5-bbhushan2@marvell.com>
 <994d9a4f-b8a8-7bda-f5a2-81d65711f580@redhat.com>
 <MWHPR1801MB1966FFC12887DFDA34B2D5D8E3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f21bd15c-50ca-024a-2836-015fbfe38e61@redhat.com>
Date: Fri, 27 Mar 2020 09:28:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR1801MB1966FFC12887DFDA34B2D5D8E3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-TUID: yYsDBiXuN4zJ

Hi Bharat,
On 3/27/20 6:13 AM, Bharat Bhushan wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric <eric.auger@redhat.com>
>> Sent: Thursday, March 26, 2020 9:22 PM
>> To: Bharat Bhushan <bbhushan2@marvell.com>; peter.maydell@linaro.org;
>> peterx@redhat.com; eric.auger.pro@gmail.com; alex.williamson@redhat.com;
>> kevin.tian@intel.com; mst@redhat.com; Tomasz Nowicki [C]
>> <tnowicki@marvell.com>; drjones@redhat.com; linuc.decode@gmail.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; bharatb.linux@gmail.com; jean-
>> philippe@linaro.org; yang.zhong@intel.com
>> Subject: [EXT] Re: [PATCH v9 4/9] virtio-iommu: set supported page size mask
>>
>> External Email
>>
>> ----------------------------------------------------------------------
>> Hi Bharat,
>>
>> On 3/23/20 9:46 AM, Bharat Bhushan wrote:
>>> Add optional interface to set page size mask.
>>> Currently this is set global configuration and not per endpoint.
>> This allows to override the page size mask per end-point?
> 
> This patch adds per endpoint page-size-mask configuration in addition to global page-size-mask.
> endpoint page-size-mask will override global page-size-mask configuration for that endpoint.
Yes my comment was a suggestion for commit msg rephrasing. Sorry if it
was unclear. The above text sounds clearer.

thanks

Eric
> 
> Thanks
> -Bharat
> 
>>>
>>> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
>>> ---
>>>  include/hw/virtio/virtio-iommu.h | 1 +
>>>  hw/virtio/virtio-iommu.c         | 9 +++++++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/include/hw/virtio/virtio-iommu.h
>>> b/include/hw/virtio/virtio-iommu.h
>>> index 6f67f1020a..4efa09610a 100644
>>> --- a/include/hw/virtio/virtio-iommu.h
>>> +++ b/include/hw/virtio/virtio-iommu.h
>>> @@ -35,6 +35,7 @@ typedef struct IOMMUDevice {
>>>      void         *viommu;
>>>      PCIBus       *bus;
>>>      int           devfn;
>>> +    uint64_t      page_size_mask;
>>>      IOMMUMemoryRegion  iommu_mr;
>>>      AddressSpace  as;
>>>  } IOMMUDevice;
>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
>>> 4cee8083bc..a28818202c 100644
>>> --- a/hw/virtio/virtio-iommu.c
>>> +++ b/hw/virtio/virtio-iommu.c
>>> @@ -650,6 +650,14 @@ static gint int_cmp(gconstpointer a, gconstpointer b,
>> gpointer user_data)
>>>      return (ua > ub) - (ua < ub);
>>>  }
>>>
>>> +static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>> +                                            uint64_t page_size_mask)
>>> +{
>>> +    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
>>> +
>>> +    sdev->page_size_mask = page_size_mask; }
>>> +
>>>  static void virtio_iommu_device_realize(DeviceState *dev, Error
>>> **errp)  {
>>>      VirtIODevice *vdev = VIRTIO_DEVICE(dev); @@ -865,6 +873,7 @@
>>> static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
>>>      IOMMUMemoryRegionClass *imrc =
>> IOMMU_MEMORY_REGION_CLASS(klass);
>>>
>>>      imrc->translate = virtio_iommu_translate;
>>> +    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
>>>  }
>>>
>>>  static const TypeInfo virtio_iommu_info = {
>>>
>> Thanks
>>
>> Eric
> 
> 

