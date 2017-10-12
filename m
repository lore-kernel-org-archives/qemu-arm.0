Received: by 10.223.197.9 with SMTP id q9csp1514204wrf;
        Thu, 12 Oct 2017 03:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S6uNycDWwbvjGsFus6EVGNTENQwQK7C0tgTr3sIHtfafMA4hDXhkSwVIXyeEcwE+Cl2Zhy
X-Received: by 10.200.45.28 with SMTP id n28mr2884918qta.100.1507803110968;
        Thu, 12 Oct 2017 03:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507803110; cv=none;
        d=google.com; s=arc-20160816;
        b=fT2Annlw5ASUaWC1Oi+IbTKfA1a1RqHpYqgHxXEuz91vzCqbm5AksAwoomr8DVIcEV
         URlGfg0UH3osyt/oeulYvTSOHy1rLlH8LUptM971s2k3mPB3IJuWkuuZSJ66ad4Iwgiz
         fhvYN/SQx/kf9PRow3nVoJiL3pqtPqGDuP8YsRESjHxXsE0uI23PBKS1lG3C8muNFmNM
         3pyNIO+CXKvpXYJ/+7UiR3R3c+AM96WMd2gTiQOmGFLdo4Wz3xHUJhv9QqQ7U5scu8f7
         2ILg3Qx/hESy8OmmyJGsRBD4CdqisFuY7qa6bX5nGfR4hvLf9T8NL/WBGjnmscdqW6kf
         M3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=g+vLSob49MRiOFRAColl1OryPW3sCi+nqx1hxxwGv7o=;
        b=SXlwZZhtk/Q2cdWM9o5T+XZgVWDAyL8/VFp08DiFOm97JigLnhsla5VAtU/mjpOOOf
         eNz1NFNA0KZxDKUOyeS9hDeikxS4eYupob0JZAURE+HOPmUBpX+N7/T4oCME4G6HTE8+
         veiNJ6mJ6HjHNqrUmoEGynKd+flEsH3U55DcyhEGyIj3hfvbgCO9iC0XM9FFmAI4lPk4
         daQ11mdRR9R0AYTFgWljNaZNysZLUBLnW1Ogc6ImWJICNXwp7rk64IPiV2WWZdJRnLGA
         q8TNuBl9SewXnsIFi0pr6AWN8Clt/Jl/fSCJNt9CUqPj7ehscNUFVvCvETHC9zcFR/It
         jg/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v37si1580489qtg.44.2017.10.12.03.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 03:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2aSy-0007Wg-Jr
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 06:11:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2aRK-0006Rv-MY
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 06:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2aRE-0004dk-L5
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 06:10:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e2aR7-0004Vz-NA; Thu, 12 Oct 2017 06:09:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5437081DE3;
	Thu, 12 Oct 2017 10:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5437081DE3
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-172.ams2.redhat.com
	[10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2896047B;
	Thu, 12 Oct 2017 10:09:41 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
	<f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
	<CAFEAcA_2RaRsvm_=V4iDNk_vMOtiWUZs3-SdMh+DSYqGyPE0PQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <08ce288c-610c-4dea-927d-262e7b75051f@redhat.com>
Date: Thu, 12 Oct 2017 12:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2RaRsvm_=V4iDNk_vMOtiWUZs3-SdMh+DSYqGyPE0PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 12 Oct 2017 10:09:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>,
	Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNu/LNNuOPbA

Hi Peter,

On 12/10/2017 11:54, Peter Maydell wrote:
> On 11 October 2017 at 17:08, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 11/10/2017 16:56, Peter Maydell wrote:
>>> On 19 September 2017 at 08:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>> This series implements the virtio-iommu device.
>>>>
>>>> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
>>>> - probe request support although no reserved region is returned at
>>>>   the moment
>>>> - unmap semantics less strict, as specified in v0.4
>>>> - device registration, attach/detach revisited
>>>> - split into smaller patches to ease review
>>>> - propose a way to inform the IOMMU mr about the page_size_mask
>>>>   of underlying HW IOMMU, if any
>>>> - remove warning associated with the translation of the MSI doorbell
>>>>
>>>> The device gets instantiated using the "-device virtio-iommu-device"
>>>> option. It currently works with ARM virt machine only, as the machine
>>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>>> the PCI host bridge node.
>>>
>>> Could this work on x86, or is it inherently arm-only?
>>
>> Yes this is the goal. At the moment the ACPI probing is not yet properly
>> specified but a Q35 prototype was developed in the Red Hat Virt team.
>> This will be presented at the KVM forum.
> 
> Since I have very little familiarity with virtio or iommu code,
> I'd be much happier if this was reviewed as a generic virtio-iommu
> by the x86/virtio devs and then the arm specific parts done second...

Understood. I was rather expecting you to review the smmuv3 emulation
code which you did, in a comprehensive manner ;-), and many thanks for that.

Note sure this is time yet to get this RFC reviewed as
- the v0.4 virtio-iommu driver it relies on was not officially submitted,
- the virtio-iommu specification review has not really been reviewed,
- the ACPI probing method has not been discussed yet.

Jean-Philippe, please correct me if I am wrong.

So to me, this is pure RFC at the moment.
> 
> I'm also not clear on what we're expecting the recommended or normal
> way to do device passthrough is going to be -- this virtio-mmio,
> or presenting the guest with an SMMUv3 interface? Do we really
> need to implement both ?

I think the KVM forum is the right place to sync as both approaches will
be presented and some pros/cons + performance figures will be given.

As we talk about choosing, there is one alternative that was suggested
on the ML by Alex & Michael but never really get considered yet and
maybe should be: using intel iommu emulation code for ARM. I aknowledge
this deserves a thorough impact study on kernel and FW side but I would
be happy to get your opinion about the QEMU side. Would you have a by-
principle rejection of this idea to instantiate such an Intel device in
mach virt or would it be something you would be ready to consider?

Thanks

Eric


> 
> thanks
> -- PMM
> 
