Received: by 10.25.0.23 with SMTP id 23csp2473878lfa;
        Thu, 8 Jun 2017 01:36:33 -0700 (PDT)
X-Received: by 10.55.21.230 with SMTP id 99mr43073418qkv.212.1496910993468;
        Thu, 08 Jun 2017 01:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496910993; cv=none;
        d=google.com; s=arc-20160816;
        b=Gxp65eC1t90frt65uA30rS8zN4L+iG1LgFfsZ1//9e0vs2bhi5IgX4HcpjWg+1Sjyp
         nCTTAAZSLd4wUj2u3Y60mJy1bhcyU+6/fMS0vDnLDghhZ8jQMM1ksNYxEkniVvkM0Nuz
         G82CBAb3C7Ge1410PKFHT0QlkY6UqY/4V1/ugo5srHwmztxVW3MaQyrhK2bGzAjE+qI6
         wft9izxyLiWkRdxNDrVmxUfF3uA+JZswupQ5DQczcjJGwW99Z1TIwGCWz8swjV5k1J+e
         snNIg1ViaXV25Po5SqEH8MMz8TyNljYF1PsaHzi3+pyWJ6dJCyecz99WGggsj+xccV3g
         iMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=zFbWEoQJGsD0c06MuO3NgWCCDeDEbR7QQ6p0AigNxrc=;
        b=xpj03FU7T8pEaR4BRtKyX42Sr/C6x/09fvw/PxXuFw3gH2jIMAl0l9yo2SCIAVh4vB
         ZLDttu3IQQusSP6znSznPsvKjIJadeCcNo1wmTjCTEe+pvow8fwfzoGWs2u7X6OHL/Y7
         13PVoMwbh/E/xSijMScptc55fPtnYlE5ob7T9FmMCK4PUaManNZN0u7K61MZj3Pi84RU
         dOA4Xo6mmHINXXG6/hzHwYkGt/knrQ0sT5usAq7g5lyKUyf9gBKsHX0kvnbx+bT6XSt7
         8MhKmJARQ1OXIE7DIj4s4mfxkglU04CxEU4htvOejcARlsj2Dh/rlTJsTmnkwsnadqqX
         Tecg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128si2709098qke.78.2017.06.08.01.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 01:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIsve-0005xf-V1
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 04:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dIsvU-0005xW-A9
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 04:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dIsvQ-0007PW-8A
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 04:36:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1dIsvQ-0007Ov-0F; Thu, 08 Jun 2017 04:36:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7598C04B310;
	Thu,  8 Jun 2017 08:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D7598C04B310
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jasowang@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D7598C04B310
Received: from [10.72.12.28] (ovpn-12-28.pek2.redhat.com [10.72.12.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E628CC62;
	Thu,  8 Jun 2017 08:35:58 +0000 (UTC)
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
	<03f4d3b6-a678-56b8-4320-ac002dfeeb8d@redhat.com>
	<8bd10202-75a2-2dee-1d75-9070217f65e0@arm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <60346d98-362d-a7ca-10ca-c150e842d51b@redhat.com>
Date: Thu, 8 Jun 2017 16:35:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <8bd10202-75a2-2dee-1d75-9070217f65e0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 08 Jun 2017 08:36:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/8] VIRTIO-IOMMU device
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, robin.murphy@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/sWjpnV1EXH



On 2017=E5=B9=B406=E6=9C=8807=E6=97=A5 18:19, Jean-Philippe Brucker wrote=
:
> Hi Jason,
>
> On 07/06/17 10:17, Jason Wang wrote:
>> On 2017=E5=B9=B406=E6=9C=8807=E6=97=A5 16:35, Eric Auger wrote:
>>> This series implements the virtio-iommu device. This is a proof
>>> of concept based on the virtio-iommu specification written by
>>> Jean-Philippe Brucker [1]. This was tested with a guest using
>>> the virtio-iommu driver [2] and exposed with a virtio-net-pci
>>> using dma ops.
>>>
>>> The device gets instantiated using the "-device virtio-iommu-device"
>>> option. It currently works with ARM virt machine only as the machine
>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>> the PCI host bridge node. ACPI booting is not yet supported.
>>>
>>> This should allow to start some benchmarking activities against
>>> pure emulated IOMMU (especially ARM SMMU).
>> Yes, it would be also interesting to compare it with intel IOMMU. Actu=
ally
>> the core function is similar to the subset of intel one with CM enable=
d.
>> Since each map and unmap requires a command, it would be very slow for
>> dynamic mappings. I wonder whether or not we can do any optimization o=
n this.
> In general we will have to send the same number of map/unmap requests t=
han
> the number of invalidations needed for an emulated IOMMU such as the In=
tel
> one (if I understand correctly with CM there are invalidations both on =
map
> and unmap, to avoid trapping the page tables). Using virtio allows to
> reduce the number of round-trips to the host, by batching map/unmap
> requests where possible.

When QI is enabled, intel IOMMU can also support batching. And it can=20
even allow asynchronous completion of the operation by noting using wait=20
descriptor.

> Adding vhost-iommu in the host could further
> reduce the latency of map/unmap requests.

Probably but then we need a way to co-operate with userspace device=20
emulation codes.

>
> To actually reduce the number of requests, I see two possible
> optimizations (loosely described in [1]), both requiring invasive chang=
es.
>
> * Relaxed (insecure) mode, where the guest batches unmap request or
> doesn't send them at all. Map will override existing mappings if
> necessary. You end up sending far less unmap requests, but there is a
> vulnerability window where devices can access stale mappings, so you ha=
ve
> to trust your peripherals. I believe the x86 IOMMU drivers in Linux
> already allow this.

Yes and actually it's the default behavior.  What's more, it will try to=20
do a domain invalidation if there's too many pending invalidation.

>
> * Page table handover, which is a new mode orthogonal to map/unmap. Thi=
s
> uses nested translation - the guest has one set of page tables for
> gva->gpa and the host has one set for gpa->hpa. After setup, the guest
> populates the page tables and only sends invalidation requests, no map.=
 I
> think that with the Intel IOMMU this would only be possible with PASID
> traffic. But nested translation will inherently be slower than "classic=
"
> mode, so it might end up being overall slower than map/unmap, if there =
is
> a lot of TLB invalidation and trashing. This mode is mostly useful for =
SVM
> virtualization.

An advantage for page table is that its searching is faster than current=20
tree based algorithm, this can help in the case of dynamic mappings more=20
or less.

Thanks

>
> Thanks,
> Jean
>
>

