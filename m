Received: by 10.25.44.15 with SMTP id s15csp4799803lfs;
        Tue, 11 Jul 2017 05:59:02 -0700 (PDT)
X-Received: by 10.200.49.73 with SMTP id h9mr11291356qtb.13.1499777942844;
        Tue, 11 Jul 2017 05:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499777942; cv=none;
        d=google.com; s=arc-20160816;
        b=BN9hPyZn6Iq54M2gbPsLuAtqDllSHIqizf9DeS1PJ/jsiay+8ED6SvgJp247o3dUsD
         4ML3AEuDH4m4GFgo98Y0PqaNO3HsE3MtSTF5tOgPlSNtI4PVM1Q6cibI64M7uNwP5ElM
         V7Aykk4cYrsyk+gInYvm29HqNYYfaQrSnb9ScjBUDRWcT9U4fOeLQ0XJZiJZpsu3j3mm
         m3HKRRRo3vmCsS6SY0O0CGy5bovtDF6vnhxv0yTo6TzaaJn39FennyX1AeeQgCjHNj1x
         t8IdcJzjjJd01G3tNdjTcFnaKoLiMTZKVeaeE3ZSnYTFZNKezQx2humYwJOOr71K8BQr
         gpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from
         :arc-authentication-results;
        bh=z99KkUvKJYbjXHkg/ZoZzR2l0khZv7UGn6PmdYuy1gI=;
        b=Og7M1czgV1znqf2+R5RllEVQnfHlPIbzQTVjFpY0iVqi6+jLNEd1iW3JhyRu9lXTyj
         q96Ddquw/sg4BmTEL5mbXX/neMBqT2gIr2V3hx4yfpuNLsSadYXx7HopozcKSgIz2xtZ
         TD7dbwT5mcAC4iTO8Q+nw834cuB8dHWa/EFBOTCEU6LA0l3T9A7S7i2TVxuA1Sx9foEf
         uY8F4Hfn4IWQq/cN+hQV1Yzq8RIX7X6jOuEjkHPp3sC1mTfrOvuG6sWii9oK6U52FtXZ
         OjuZibnKvyDtnng77v9qmKi6BRIciFnrShAMAYxnzw9DmJMeriYOcIUm88PXcu3mvY7J
         rk2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x24si13465245qtb.1.2017.07.11.05.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 05:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUukm-0000l3-9D
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 08:59:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dUuaI-0000Cd-CR
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 08:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dUuaE-0007K7-Ka
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 08:48:10 -0400
Received: from foss.arm.com ([217.140.101.70]:52006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dUuaE-0007K0-Ch; Tue, 11 Jul 2017 08:48:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E19D2B;
	Tue, 11 Jul 2017 05:48:04 -0700 (PDT)
Received: from [10.1.211.12] (e106794-lin.cambridge.arm.com [10.1.211.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCD6E3F577;
	Tue, 11 Jul 2017 05:48:01 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Auger Eric <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
	<AM5PR0401MB2545C23F66D6D0E096DCB0369AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<a67cb139-e1b6-02fc-d451-4001bcbfceb3@redhat.com>
	<AM5PR0401MB2545A78764598CD87827B14F9AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<615e22ce-80b3-b000-360f-7272a867cdf9@arm.com>
	<AM5PR0401MB2545F60CA898D23D5E2F1E6D9AAE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Message-ID: <9cdd8947-2c8a-4106-1a1a-56c2238843d6@arm.com>
Date: Tue, 11 Jul 2017 13:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB2545F60CA898D23D5E2F1E6D9AAE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
X-TUID: 5tfPB6rY0zBE

On 11/07/17 06:54, Bharat Bhushan wrote:
> Hi Jean,
> 
>> -----Original Message-----
>> From: Jean-Philippe Brucker [mailto:jean-philippe.brucker@arm.com]
>> Sent: Friday, July 07, 2017 8:50 PM
>> To: Bharat Bhushan <bharat.bhushan@nxp.com>; Auger Eric
>> <eric.auger@redhat.com>; eric.auger.pro@gmail.com;
>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>> qemu-arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
>> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
>> robin.murphy@arm.com; christoffer.dall@linaro.org
>> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
>>
>> On 07/07/17 12:36, Bharat Bhushan wrote:
>>>>> In this proposal, QEMU reserves a iova-range for guest (not host) and
>> guest
>>>> kernel will use this as msi-iova untranslated (IOMMU_RESV_MSI). While
>> this
>>>> does not change host interface and it will continue to use host reserved
>>>> mapping for actual interrupt generation, no?
>>>> But then userspace needs to provide IOMMU_RESV_MSI range to guest
>>>> kernel, right? What would be the proposed manner?
>>>
>>> Just an opinion, we can define feature
>> (VIRTIO_IOMMU_F_RES_MSI_RANGE) and provide this info via a command
>> (VIRTIO_IOMMU_T_MSI_RANGE). Guest iommu-driver will make this call
>> during initialization and store the value. This value will just replace
>> MSI_IOVA_BASE and MSI_IOVA_LENGHT hash define. Rest will remain same
>> in virtio-iommu driver.
>>
>> Yes I had something similar in mind, although more generic since we'll
>> need to get other bits of information from the device in future extensions
>> (fault handling, page table formats and dynamic reserves of memory for
>> SVM), and maybe also for finding out per-address-space page granularity
>> (see my reply of patch 3/8). These are per-endpoint properties that cannot
>> be advertise in the virtio config space.
>>
>>                                  ***
>>
>> So I propose to add a per-endpoint probing mechanism on the request
>> queue:
> 
> What is per-endpoint? Is it "per-pci/platform-device"?

Yes, it's a pci or platform device managed by the IOMMU. In the spec I'm
now using the term "endpoint" to easily differentiate from the
virtio-iommu device ("the device").

>> * The device advertises a new command VIRTIO_IOMMU_T_PROBE with
>> feature
>> bit VIRTIO_IOMMU_F_PROBE.
>> * When this feature is advertised, the device sets probe_size field in the
>> the config space.
> 
> Probably I did not get how virtio-iommu device emulation decides value of "probe_size", can you share more info?

The size of the virtio_iommu_req_probe structure is variable, and depends
what fields the device implements. So the device initially computes the
size it needs to fill virtio_iommu_req_probe, describes it in probe_size,
and the driver allocates that many bytes for virtio_iommu_req_probe.content[]

>> * When device offers VIRTIO_IOMMU_F_PROBE, the driver should send an
>> VIRTIO_IOMMU_T_PROBE request for each new endpoint.
>> * The driver allocates a device-writeable buffer of probe_size (plus
>> framing) and sends it as a VIRTIO_IOMMU_T_PROBE request.
>> * The device fills the buffer with various information.
>>
>> struct virtio_iommu_req_probe {
>> 	/* device-readable */
>> 	struct virtio_iommu_req_head head;
>> 	le32 device;
>> 	le32 flags;
>>
>> 	/* maybe also le32 content_size, but it must be equal to
>> 	   probe_size */
> 
> Can you please describe why we need to pass size of "probe_size" in probe request?

We don't. I don't think we should add this 'content_size' field unless
there is a compelling reason to do so.

>>
>> 	/* device-writeable */
>> 	u8 content[];
> 
> I assume content_size above is the size of array "content[]" and max value can be equal to probe_size advertised by device?

probe_size is exactly the size of array content[]. The driver must
allocate a buffer of this size (plus the space needed for head, device,
flags and tail).

Then the device is free to leave parts of content[] empty. Field 'type' 0
will be reserved and mark the end of the array.

>> 	struct virtio_iommu_req_tail tail;
>> };
>>
>> I'm still struggling with the content and layout of the probe request, and
>> would appreciate any feedback. To be easily extended, I think it should
>> contain a list of fields of variable size:
>>
>> 	|0           15|16           31|32               N|
>> 	|     type     |    length     |      values      |
>>
>> 'length' might be made optional if it can be deduced from type, but might
>> make driver-side parsing more robust.
>>
>> The probe could either be done for each endpoint, or for each address
>> space. I much prefer endpoint because it is the smallest granularity. The
>> driver can then decide what endpoints to put together in the same address
>> space based on their individual capabilities. The specification would
>> described how each endpoint property is combined when endpoints are put
>> in
>> the same address space. For example, take the minimum of all PASID size,
>> the maximum of all page granularities, combine doorbell addresses, etc.
>>
>> If we did the probe on address spaces instead, the driver would have to
>> re-send a probe request each time a new endpoint is attached to an
>> existing address space, to see if it is still capable of page table
>> handover or if the driver just combined a VFIO and an emulated endpoint by
>> accident.
>>
>>                                  ***
>>
>> Using this framework, the device can declare doorbell regions by adding
>> one or more RESV fields into the probe buffer:
>>
>> /* 'type' */
>> #define VIRTIO_IOMMU_PROBE_T_RESV 	0x1
>>
>> /* 'values'. 'length' is sizeof(struct virtio_iommu_probe_resv) */
>> struct virtio_iommu_probe_resv {
>> 	le64 gpa;
>> 	le64 size;
>>
>> #define VIRTIO_IOMMU_PROBE_RESV_MSI	0x1
>> 	u8 type;
> 
> type is 16 bit above?

Ah, the naming isn't great. This is not the same as above, and could be
called 'subtype' to avoid confusion. The above 16-bit type describes the
field type, e.g. struct virtio_iommu_probe_resv. I proposed 16-bit because
it seems easy to reach more than 255 kinds of endpoint properties, but
65535 should do.

This subtype describes which kind of resv region is described in the
structure. For the moment there only is VIRTIO_IOMMU_PROBE_RESV_MSI, but
we could for example add resv regions that the driver should never use or
that it should identity-map (equivalent to IOMMU_RESV_RESERVED/DIRECT in
Linux). I think 8 bits should be enough to contain any future types,
unless we make this a bitfield. For identity-map, there may be an
additional flags field describing the protection.

>> };
>>
>> Such a region would be subject to the following rules:
>>
>> * Driver should not use any IOVA declared as RESV_MSI in a mapping.
>> * Device should leave any transaction matching a RESV_MSI region pass
>> through untranslated.
>> * If the device does not advertise any RESV region, then the driver should
>> assume that MSI doorbells, like any other GPA, must be mapped with an
>> arbitrary IOVA in order for the endpoint to access them.
>> * Given that the driver *should* perform a probe request if available, and
>> it *should* understand the VIRTIO_IOMMU_PROBE_T_RESV field, then this
>> field tells the guest how it should handle MSI doorbells, and whether it
>> should map the address via MAP requests or not.
>>
>> Does this make sense and did I overlook something?
> 
> Overall it looks good to me. Do you have plans to implements this in virtio-iommu driver and kvmtool?

Yes, if there is no objection I'll try to formalize it and implement it
right away.

Thanks,
Jean
