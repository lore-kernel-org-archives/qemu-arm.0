Received: by 10.25.15.197 with SMTP id 66csp233552lfp;
        Fri, 23 Jun 2017 09:09:23 -0700 (PDT)
X-Received: by 10.200.53.243 with SMTP id l48mr10691968qtb.7.1498234163502;
        Fri, 23 Jun 2017 09:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498234163; cv=none;
        d=google.com; s=arc-20160816;
        b=Vlk21qyVDcNmQhuJVIc7V18vXjxeZA+2raxuLXfS9o4Zdj3ckoNgdpUPlJ6IFf24Xc
         8E4VXhBRgK4ME6bvxzQCGy1cm9vF6Xc2XxBhvE6rfwVvUkN5nE9SJcmxkDv7xV9Xr5yD
         h58SvVXjw4h6Fdz6cAzfWkU/GVjrYEnASGHy/wRbAy43Dhnu6XOF8U0vkiRP6tBoNUkW
         080WK5C18NmlnEihzOckjtB8BSb0grV2veCrszXOx5xU4/KbixA5aUMoM4d6eTrRQBNj
         qdijWrKoEysERtROG2yxpfYNd5g3+39YekTOQRwPNVtWggNZKh1CCscyIJxD2kIPiuP7
         g/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=z8SifYplHH5BoSca8g7TJlZ1c+pLh6luwt7x+Azi9IE=;
        b=g2YbUm8mfz1me0q7qWhDACyVMVxtyl0RgxylDbqH3kwHXn50dhdNduWGoEI0ll6qI4
         tJZt08SsXxEGEOn7QEzDvnsO4wBGrorD4VTx+w0HXAqcLojcVIj7PxPgB/tTAC0plhPA
         izbWIQ/u8lh5q9IOVblGl1TbCH2AkMbd9VuJd5PKa5gFrjPtl0vVYSB2TGs3srGVUTr4
         Ksu2m/sW5aJYBPLdO/+gjBiee1bxSsTwq5RUYc7QmD0MyViTicgZox4fxMbY0srQLoRm
         TtbI5O+9BATD3aqQdRD8dJ9SECZwm/hqvV85Lmd15PBM8KSMlxbtrjWU74dQIAfJe21A
         b/6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j22si4403589qtf.25.2017.06.23.09.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Jun 2017 09:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dOR96-0001oG-J7
	for alex.bennee@linaro.org; Fri, 23 Jun 2017 12:09:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dOR8w-0001mv-0h
	for qemu-arm@nongnu.org; Fri, 23 Jun 2017 12:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dOR8s-0001hP-7N
	for qemu-arm@nongnu.org; Fri, 23 Jun 2017 12:09:09 -0400
Received: from foss.arm.com ([217.140.101.70]:33308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dOR8s-0001gI-1L; Fri, 23 Jun 2017 12:09:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00ECB2B;
	Fri, 23 Jun 2017 09:09:04 -0700 (PDT)
Received: from [10.37.10.32] (unknown [10.37.10.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77C3C3F557;
	Fri, 23 Jun 2017 09:09:00 -0700 (PDT)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Eric Auger <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-4-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB25454D8F945071D6AC96749D9AC90@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <70e2df1c-573b-2ba0-70ca-77b166a81863@arm.com>
Date: Fri, 23 Jun 2017 17:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB25454D8F945071D6AC96749D9AC90@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v2 3/8] virtio_iommu: add skeleton
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
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hvZUls2784eK

On 06/08/2017 12:09 PM, Bharat Bhushan wrote:
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Wednesday, June 07, 2017 9:31 PM
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
>> philippe.brucker@arm.com
>> Cc: will.deacon@arm.com; robin.murphy@arm.com; kevin.tian@intel.com;
>> marc.zyngier@arm.com; christoffer.dall@linaro.org; drjones@redhat.com;
>> wei@redhat.com; tn@semihalf.com; Bharat Bhushan
>> <bharat.bhushan@nxp.com>
>> Subject: [RFC v2 3/8] virtio_iommu: add skeleton
>>
>> This patchs adds the skeleton for the virtio-iommu device.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> +static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>> +{
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>> +
>> +    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
>> +                sizeof(struct virtio_iommu_config));
>> +
>> +    s->vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
>> +                             virtio_iommu_handle_command);
>> +
>> +    s->config.page_sizes = ~((1ULL << 12) - 1);
> 
> This is hardcoded to 4K, Should this be aligned to Host-page size ?

I wonder if we should introduce per-address-space page sizes, to cater
for emulated and VFIO devices being managed by the same IOMMU.

For an emulated device, it seems that the page granularity can be
arbitrary, so maybe TARGET_PAGE_MASK would be more convenient. But for
VFIO, the page granularity is a property of the physical IOMMU.

In kvmtool I instantiate two virtio-iommus for vfio and virtio devices,
so the page size issue hasn't come up, but here things won't work if the
page granularity advertised in config.page_sizes is smaller than the
pIOMMU page size.

Adding address space properties is tricky because they change when
attaching devices, and I wanted to avoid this complication. In nested
mode I have to add one AS state, where the AS is active and properties
are freezed (attaching an incompatible device is then rejected). Maybe
we need to do the same for map/unmap.

A simpler solution (for me, that is), would be to put the greatest page
granularity of all VFIO devices into page_sizes, but it doesn't take
hotplug into account.

Thanks,
Jean
