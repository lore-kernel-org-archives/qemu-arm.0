Received: by 10.25.44.15 with SMTP id s15csp3604290lfs;
        Mon, 31 Jul 2017 06:17:35 -0700 (PDT)
X-Received: by 10.55.55.7 with SMTP id e7mr20453692qka.294.1501507055018;
        Mon, 31 Jul 2017 06:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501507055; cv=none;
        d=google.com; s=arc-20160816;
        b=pfJc1DjF+oc+CIZ5vyYW1t0AwgocOvDiJ5V+OqObxwkDM2L4iZCJqaqAl5Wz0kESVx
         dJjbayszyyAN1uH3F+VqgTRymAB2re/n9ezEIEpERj0RtIh4q3fiqk7+V6lE+eWOTUqP
         y4Z5ZJup98lSg8QWPcyFeQ0lWZPu0teaLgH+N4r0CLJlgFt31ZiHhtPGs6kjZN6vHjSQ
         vdOcRjUqbwxI0eKl06Fi2a8mO/HhbXxLAZOr2hBbHb0sF0hybkG9IbTgObN1aD2w3qsB
         OLyEd1E7B8RFgdmAmn3fbiOrMrvpFWszCBv0y70N9GARe0nActl58+Gz5GqhB2umQMkD
         2PHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=fH+nP6vydzOl66mbW8VwF1JLnB07mcP/A7Vp1eqdtBs=;
        b=qY7j6AzVF276VcvKFNEAHFkN1z0h8N7H81hUGO8/Dvw38pu3NaZ0TN619txSpaOo5E
         nputx9BJcCwmZtXTRS5oKnUCe6cvSgQCvU1n1HZrY7NKXPPSFuY5s2ZjZ/4G1nvfcgJs
         IHmWzcEt+C/S6o1LblhEv09vO6vUoPhkOipZIaPIpxoo/iqVL7wE7cvN4IymXoxNeSMI
         02fSfbHe3SI8SS2DMvEG/DqS4dntBH0aDD06V/WjoTto+jngE+E38RUtZOzgLvB2Ieko
         dPX6stZhSFCOdBJFrDzHL0uWIL6g/uJCt5nJGgkFvXq+1zhpFd4hFEd/0m7RchtL3elK
         tPzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si23114134qkb.55.2017.07.31.06.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 06:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcAZg-00010S-9c
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 09:17:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcAZ6-0000ar-J5
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 09:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcAZ3-0008P3-8v
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 09:16:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcAZ2-0008NL-V4; Mon, 31 Jul 2017 09:16:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F39465DD82;
	Mon, 31 Jul 2017 13:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F39465DD82
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-118.ams2.redhat.com
	[10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6079B5D9C1;
	Mon, 31 Jul 2017 13:08:28 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>, Bharat Bhushan <bharat.bhushan@nxp.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<20170714021733.GA27284@pxdev.xzpeter.org>
	<AM5PR0401MB2545B52A31CCA827DB3EE5A79AAD0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<20170717012809.GO27284@pxdev.xzpeter.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <45e202fa-2b6b-bc17-9200-b0eaa1879c78@redhat.com>
Date: Mon, 31 Jul 2017 15:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170717012809.GO27284@pxdev.xzpeter.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 31 Jul 2017 13:08:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement
 the translation and commands
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hNFH4kbkt08G

Hi Peter, Bharat,

On 17/07/2017 03:28, Peter Xu wrote:
> On Fri, Jul 14, 2017 at 06:40:34AM +0000, Bharat Bhushan wrote:
>> Hi Peter,
>>
>>> -----Original Message-----
>>> From: Peter Xu [mailto:peterx@redhat.com]
>>> Sent: Friday, July 14, 2017 7:48 AM
>>> To: Eric Auger <eric.auger@redhat.com>
>>> Cc: eric.auger.pro@gmail.com; peter.maydell@linaro.org;
>>> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
>>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com;
>>> wei@redhat.com; kevin.tian@intel.com; Bharat Bhushan
>>> <bharat.bhushan@nxp.com>; marc.zyngier@arm.com; tn@semihalf.com;
>>> will.deacon@arm.com; drjones@redhat.com; robin.murphy@arm.com;
>>> christoffer.dall@linaro.org
>>> Subject: Re: [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement the
>>> translation and commands
>>>
>>> On Wed, Jun 07, 2017 at 06:01:25PM +0200, Eric Auger wrote:
>>>> This patch adds the actual implementation for the translation routine
>>>> and the virtio-iommu commands.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> [...]
>>>
>>>>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>>>>                                 struct virtio_iommu_req_attach *req)
>>>> @@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>>>>      uint32_t asid = le32_to_cpu(req->address_space);
>>>>      uint32_t devid = le32_to_cpu(req->device);
>>>>      uint32_t reserved = le32_to_cpu(req->reserved);
>>>> +    viommu_as *as;
>>>> +    viommu_dev *dev;
>>>>
>>>>      trace_virtio_iommu_attach(asid, devid, reserved);
>>>>
>>>> -    return VIRTIO_IOMMU_S_UNSUPP;
>>>> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
>>>> +    if (dev) {
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
>>>> +    if (!as) {
>>>> +        as = g_malloc0(sizeof(*as));
>>>> +        as->id = asid;
>>>> +        as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
>>>> +                                         NULL, NULL, (GDestroyNotify)g_free);
>>>> +        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
>>>> +        trace_virtio_iommu_new_asid(asid);
>>>> +    }
>>>> +
>>>> +    dev = g_malloc0(sizeof(*dev));
>>>> +    dev->as = as;
>>>> +    dev->id = devid;
>>>> +    as->nr_devices++;
>>>> +    trace_virtio_iommu_new_devid(devid);
>>>> +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
>>>
>>> Here do we need to record something like a refcount for address space?
>>> Since...
>>
>> We are using "nr_devices" as number of devices attached to an address-space
>>
>>>
>>>> +
>>>> +    return VIRTIO_IOMMU_S_OK;
>>>>  }
>>>>
>>>>  static int virtio_iommu_detach(VirtIOIOMMU *s, @@ -106,10 +170,13 @@
>>>> static int virtio_iommu_detach(VirtIOIOMMU *s,  {
>>>>      uint32_t devid = le32_to_cpu(req->device);
>>>>      uint32_t reserved = le32_to_cpu(req->reserved);
>>>> +    int ret;
>>>>
>>>>      trace_virtio_iommu_detach(devid, reserved);
>>>>
>>>> -    return VIRTIO_IOMMU_S_UNSUPP;
>>>> +    ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
>>>
>>> ... here when detach, imho we should check the refcount: if there is no
>>> device using specific address space, we should release the address space as
>>> well.
>>>
>>> Otherwise there would have no way to destroy an address space?
>>
>>
>> Here if nr_devices == 0 then release the address space, is that ok? 
>>
>> This is how I implemented as part of VFIO integration over this patch series.
>> 	"[RFC PATCH 2/2] virtio-iommu: vfio integration with virtio-iommu"

glib provides g_tree_ref/g_tree_unref. I think the most elegant is to
use g_tree_ref when adding a device and decrementing when removing a
device, as suggested by Peter.

"if the reference count drops to 0, all keys and values will be
destroyed (if destroy functions were specified) and all memory allocated
by tree will be released."

That way we should be able to remove nr_devices from viommu_as

Bharat, if this breaks your implementation I will let you re-introduce
nr_devices as part of the VFIO patch.

Thanks

Eric
> 
> Sorry I didn't read that when posting. It is what I mean.  Thanks,
> 
