Received: by 10.223.172.38 with SMTP id v35csp4848746wrc;
        Wed, 27 Sep 2017 08:44:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBUGX+6fW95G5KSw1AJ8qrm5gPHBywet67JhraHVoHSFK4CsQuNj59t+5YqRnBabolBWCL6
X-Received: by 10.55.129.135 with SMTP id c129mr3022679qkd.240.1506527082612;
        Wed, 27 Sep 2017 08:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506527082; cv=none;
        d=google.com; s=arc-20160816;
        b=Fo60rW4l3LrM4FzSxz91HrGdtsCrVSLM8R/zd8BFf0Zbbnq93n/uxG1GN99A+usk39
         z+TILC2v10vqEu2Ta7+9KhH1Hv8GfZ1Qck5rS+aa3vBHum/NHa/IKEeux4kIQSGc6tZE
         sk3wdY73SpV16JvzUjJZkQKlxwzqHDBVbLd7zXFIDa2lSDm9jQvdfpCu+zwihoc23dHx
         Wftvq6gCMG/Gex0NhVlzKs4+otqsVfQbn6lF6HYiSfiHTD5LSqILtdN9ZReuKeRWYwNc
         IvTpEjgZ3/dz//1+Y4A0PAGLhooyeT9SDQu/guM647f97MQttM2pvbpA0IAbFUbIIJeq
         TQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=EnwiPH4vy1QRFo5BQg7Izx3D8MF5em/PybHJtHekEEc=;
        b=Y2EfqqC7X3gDqw4e5OgLBnyiOqzMlM4NLTTil/L4VrxfNm+DDzRwVyXVZW510az/9Z
         Ma4CZ+Y2fbqF5w2VUFdKCa4qH/kQifRcKpLe6zTqcFQT2cng//I6c5HfzFdtiyAgESfU
         +MwFSV5R67VROhlz0T+4k33ys1PHIy9Sj4HQ6PNo1TDOupVqshBXGJWhdDdypx111/+L
         s9wlo48tq5dK8gH7iLa+uU/qOB6bfygdXFfCXWUDm6XNDYPAiZInWoarNs17f+QGPKld
         SMWnj/4dJejD70BiifvjwLAapwoVA9aEoqlObetIfsCJivWBwQ0YWNV0nKto9JkYKfGv
         e9aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si1750959qto.213.2017.09.27.08.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 08:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxEVs-00017W-DU
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 11:44:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxEVl-00017E-4S
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxEVh-00073N-QV
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 11:44:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxEVh-00072z-I2; Wed, 27 Sep 2017 11:44:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78A57B4C36;
	Wed, 27 Sep 2017 15:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 78A57B4C36
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBCFDE8181;
	Wed, 27 Sep 2017 15:44:15 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Tomasz Nowicki <tnowicki@caviumnetworks.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<1505807208-9063-11-git-send-email-eric.auger@redhat.com>
	<4cecfa75-c97a-586b-aadf-9b0bfd168960@caviumnetworks.com>
	<AM5PR0401MB254589AAAAC0DAC45861D05C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b2a49727-0a49-ed75-daec-a32b79ae6b2e@redhat.com>
Date: Wed, 27 Sep 2017 17:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB254589AAAAC0DAC45861D05C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 27 Sep 2017 15:44:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 10/16] virtio-iommu: Implement
 probe request
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MCZvyjEAUNW1

Hi Bharat,

On 27/09/2017 13:00, Bharat Bhushan wrote:
> 
> 
>> -----Original Message-----
>> From: Tomasz Nowicki [mailto:tnowicki@caviumnetworks.com]
>> Sent: Wednesday, September 27, 2017 4:23 PM
>> To: Eric Auger <eric.auger@redhat.com>; eric.auger.pro@gmail.com;
>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
>> philippe.brucker@arm.com
>> Cc: will.deacon@arm.com; kevin.tian@intel.com; marc.zyngier@arm.com;
>> christoffer.dall@linaro.org; drjones@redhat.com; wei@redhat.com; Bharat
>> Bhushan <bharat.bhushan@nxp.com>; peterx@redhat.com;
>> linuc.decode@gmail.com
>> Subject: Re: [RFC v4 10/16] virtio-iommu: Implement probe request
>>
>> Hi Eric,
>>
>> On 19.09.2017 09:46, Eric Auger wrote:
>>> This patch implements the PROBE request. At the moment, no reserved
>>> regions are returned.
>>>
>>> At the moment reserved regions are stored per device.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>>
>>
>> [...]
>>
>>> +
>>> +static int virtio_iommu_fill_property(int devid, int type,
>>> +                                      viommu_property_buffer
>>> +*bufstate) {
>>> +    int ret = -ENOSPC;
>>> +
>>> +    if (bufstate->filled + 4 >= VIOMMU_PROBE_SIZE) {
>>> +        bufstate->error = true;
>>> +        goto out;
>>> +    }
>>> +
>>> +    switch (type) {
>>> +    case VIRTIO_IOMMU_PROBE_T_NONE:
>>> +        ret = virtio_iommu_fill_none_prop(bufstate);
>>> +        break;
>>> +    case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
>>> +    {
>>> +        viommu_dev *dev = bufstate->dev;
>>> +
>>> +        g_tree_foreach(dev->reserved_regions,
>>> +                       virtio_iommu_fill_resv_mem_prop,
>>> +                       bufstate);
>>> +        if (!bufstate->error) {
>>> +            ret = 0;
>>> +        }
>>> +        break;
>>> +    }
>>> +    default:
>>> +        ret = -ENOENT;
>>> +        break;
>>> +    }
>>> +out:
>>> +    if (ret) {
>>> +        error_report("%s property of type=%d could not be filled (%d),"
>>> +                     " remaining size = 0x%lx",
>>> +                     __func__, type, ret, bufstate->filled);
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +static int virtio_iommu_probe(VirtIOIOMMU *s,
>>> +                              struct virtio_iommu_req_probe *req,
>>> +                              uint8_t *buf) {
>>> +    uint32_t devid = le32_to_cpu(req->device);
>>> +    int16_t prop_types = SUPPORTED_PROBE_PROPERTIES, type;
>>> +    viommu_property_buffer bufstate;
>>> +    viommu_dev *dev;
>>> +    int ret;
>>> +
>>> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
>>> +    if (!dev) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    bufstate.start = buf;
>>> +    bufstate.filled = 0;
>>> +    bufstate.dev = dev;
>>
>> bufstate.error is not initialized which may cause false alarm in
>> virtio_iommu_fill_property()
> 
> I observed below prints 
> 	 "qemu-system-aarch64: virtio_iommu_fill_property property of type=2 could not be filled (-28), remaining size = 0x0 "
> 
> When I initialized the bufstate.error = 0,it goes.

Sure, I will fix that soon.

Best Regards

Eric
> 
> Thanks
> -Bharat
> 
>>
>>> +
>>> +    while ((type = ctz32(prop_types)) != 32) {
>>> +        ret = virtio_iommu_fill_property(devid, 1 << type, &bufstate);
>>> +        if (ret) {
>>> +            break;
>>> +        }
>>> +        prop_types &= ~(1 << type);
>>> +    }
>>> +    virtio_iommu_fill_property(devid, VIRTIO_IOMMU_PROBE_T_NONE,
>>> + &bufstate);
>>> +
>>> +    return VIRTIO_IOMMU_S_OK;
>>> +}
>>> +
>>>   #define get_payload_size(req) (\
>>>   sizeof((req)) - sizeof(struct virtio_iommu_req_tail))
>>>
>>> @@ -433,6 +567,24 @@ static int
>> virtio_iommu_handle_unmap(VirtIOIOMMU *s,
>>>       return virtio_iommu_unmap(s, &req);
>>>   }
>>
>> Thanks,
>> Tomasz
