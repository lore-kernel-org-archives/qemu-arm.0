Received: by 10.25.15.197 with SMTP id 66csp1268858lfp;
        Mon, 26 Jun 2017 01:22:47 -0700 (PDT)
X-Received: by 10.55.197.2 with SMTP id p2mr21467864qki.217.1498465366948;
        Mon, 26 Jun 2017 01:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498465366; cv=none;
        d=google.com; s=arc-20160816;
        b=DEQwGz80JhEZvgewaUxaJ7r8mlfd6LDtFE/gYu/+5P/OP9gWPSPF/TrIN2zHoW+x3Y
         lyrdTDNiF6KAkhaAhuAFJOOKDTwhOfw2sfyCX7fSkTQhZVrs3OYfF7RNSqTFxEfErZQ9
         +DEpf80TkYJY8LvK5T4TgWedHT0BFZAh1BFqypBf2D9XI2XNWxcH3KV1kWrdjO/CoG8e
         WGSriQjcYfN6s85RuKiGZPW6mTw0efzdvqs+cI+Ck8XrHWiT2qjTBQRgB3cuYcJ2lGsC
         xpvQUlDgculX19Uhg1UUjwsu01M+ZN0iVcHv/MLKECwC0hya/2bJpXZdJTuc0noCqkdJ
         2Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=a3qMC5e9fb4O7XGM/xKuZIScedHfenxa0uWYnXa23EM=;
        b=eCxGtUHVWZWTj5Zi6DzJQXKwdYbDvHuSBfgigyyGfC6jDAsf4nuvMawMg652gpPzVh
         upPChLA1Bn6HspeTcW5KqhS9o/DhLE5ThZuAK8NuKZMxRsWXNcQZJEUeyZM+sEAMta/k
         M2VldZBs8DDMkuq0XvXVvUtYcH6fnHd95LqbAZAyRX3d//lhnsiYk3RmUwfRo44aqsND
         rQcB0dKSIC2hSGfaTxQLZIJRwZJkAhN0PkP7QSiS7JapnmlYdcDsx54YW69cJYOWuw2L
         qJzUL7c++ZCTlqh8gtkWkNaOaSQpI1cldA4+7aeYV6Itf2uVqj/nmb/QooQJo3Mt3gZk
         BacQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si957353qti.6.2017.06.26.01.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 01:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPPIC-0004ok-A3
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 04:22:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPPHn-0004cf-U2
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 04:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dPPHi-0007XZ-Uq
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 04:22:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dPPHi-0007Wr-Kz; Mon, 26 Jun 2017 04:22:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25448C0467C5;
	Mon, 26 Jun 2017 08:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 25448C0467C5
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 25448C0467C5
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0FB35170A;
	Mon, 26 Jun 2017 08:22:02 +0000 (UTC)
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
Date: Mon, 26 Jun 2017 10:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <589f1642-775c-4805-74ac-bf67eb504733@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 26 Jun 2017 08:22:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: JLOwcotXoMmb

Hi Jean-Philippe,

On 19/06/2017 12:15, Jean-Philippe Brucker wrote:
> On 19/06/17 08:54, Bharat Bhushan wrote:
>> Hi Eric,
>>
>> I started added replay in virtio-iommu and came across how MSI interrupts with work with VFIO. 
>> I understand that on intel this works differently but vsmmu will have same requirement. 
>> kvm-msi-irq-route are added using the msi-address to be translated by viommu and not the final translated address.
>> While currently the irqfd framework does not know about emulated iommus (virtio-iommu, vsmmuv3/vintel-iommu).
>> So in my view we have following options:
>> - Programming with translated address when setting up kvm-msi-irq-route
>> - Route the interrupts via QEMU, which is bad from performance
>> - vhost-virtio-iommu may solve the problem in long term
>>
>> Is there any other better option I am missing?
> 
> Since we're on the topic of MSIs... I'm currently trying to figure out how
> we'll handle MSIs in the nested translation mode, where the guest manages
> S1 page tables and the host doesn't know about GVA->GPA translation.

I have a question about the "nested translation mode" terminology. Do
you mean in that case you use stage 1 + stage 2 of the physical IOMMU
(which the ARM spec normally advises or was meant for) or do you mean
stage 1 implemented in vIOMMU and stage 2 implemented in pIOMMU. At the
moment my understanding is for VFIO integration the pIOMMU uses a single
stage combining both the stage 1 and stage2 mappings but the host is not
aware of those 2 stages.
> 
> I'm also wondering about the benefits of having SW-mapped MSIs in the
> guest. It seems unavoidable for vSMMU since that's what a physical system
> would do. But in a paravirtualized solution there doesn't seem to be any
> compelling reason for having the guest map MSI doorbells.

If I understand correctly the virtio-iommu would not expose MSI reserved
regions (saying it does not translates MSIs). In that case he VFIO
kernel code will not check the irq_domain_check_msi_remap() but will
check iommu_capable(bus, IOMMU_CAP_INTR_REMAP) instead. Would the
virtio-iommu expose this capability? How would it isolate MSI
transactions from different devices?

Thanks

Eric


 These addresses
> are never accessed directly, they are only used for setting up IRQ routing
> (at least on kvmtool). So here's what I'd like to have. Note that I
> haven't investigated the feasibility in Qemu yet, I don't know how it
> deals with MSIs.
> 
> (1) Guest uses the guest-physical MSI doorbell when setting up MSIs. For
> ARM with GICv3 this would be GITS_TRANSLATER, for x86 it would be the
> fixed MSI doorbell. This way the host wouldn't need to inspect IOMMU
> mappings when handling writes to PCI MSI-X tables.
> 
> (2) In nested mode (with VFIO) on ARM, the pSMMU will still translate MSIs
> via S1+S2. Therefore the host needs to map MSIs at stage-1, and I'd like
> to use the (currently unused) TTB1 tables in that case. In addition, using
> TTB1 would be useful for SVM, when endpoints write MSIs with PASIDs and we
> don't want to map them in user address space.
> 
> This means that the host needs to use different doorbell addresses in
> nested mode, since it would be unable to map at S1 the same IOVA as S2
> (TTB1 manages negative addresses - 0xffff............, which are not
> representable as GPAs.) It also requires to use 32-bit page tables for
> endpoints that are not capable of using 64-bit MSI addresses.
> 
> 
> Now (2) is entirely handled in the host kernel, so it's more a Linux
> question. But does (1) seem acceptable for virtio-iommu in Qemu?
> 
> Thanks,
> Jean
> 
