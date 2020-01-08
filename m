Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp984413lff;
        Wed, 8 Jan 2020 08:56:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5JCy3DX569oaXe1R5BQ+01DWoiEMFJxo0YLdZFMHjZKNBGVYZWyob0Xl2QoRYro8Qr7hp
X-Received: by 2002:a17:906:a84a:: with SMTP id dx10mr5823959ejb.61.1578502586070;
        Wed, 08 Jan 2020 08:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578502586; cv=none;
        d=google.com; s=arc-20160816;
        b=zlGMhYpsVpHBfE4pA8UQB91fiHiQ03UtPKzq/LGsp/PsH5BAYs1dEQ/FryLBT9UUHF
         RoVKlYXYb3DkOupjA9uF/ZbDdGCFYAeS0m2YXT8Oz6Dl8ZedGhNk1yMJdpYukyQ0ayd3
         YJEt5AK8+Rs3tyk6sgjDedsK/8F5miNbK5NAnQ3t7UJYQVdBK2HAm+EFJz7yCXAB4s6c
         Cf5pMGWZUFvGfsB2MMnLTZh8NqM7PuDoYPEO/x9ySHy7bUmDTaJGJxS4b1+MD6IEfToz
         NrelvjZJyjSDkoFBdyMV9v4RuBumVv4kx3LF/PQotIpYqL02u4RbEKXIIFjvZe+v/b0C
         dVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1EeQR5hcog9bh201qcNsKJ+awWSBsyweYZbtBmxV7/4=;
        b=l7B0Fz6kXSPeWFgZfhOAuIhaSpPOpX07/mDCPoHjXHzkwxWVe8DdrugSpxZCvU3ja5
         PBk9NNVtL9CLNLPEeDwrF1waU8JBczpms5w5OVJ1K9Ndw98kd+6ekUygx6yb410GWfuI
         VMs6XohoCovfj8oVlV+9QL+GcBD3KkIVIDXrRxsC4JO3JbgZtXcmgx/kiQn3yh++zan5
         liOahwQGHGNyGSr9f5g2WrIs6X9nLlObPxTYZiRC22Dq2wu3yIpRBo6hTLu9xo5F+757
         /400cXogg1KR0Xjaw+vGp85FcP0LDD7Oe57ZOdtl/hvQuJvJvJZU7lRRRoemzg4lx9Ae
         kxNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zu4IxOXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox3si2642668ejb.165.2020.01.08.08.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zu4IxOXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipEd6-00028z-KD
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipEcu-0001zY-U5
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:56:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipEcr-00079r-Pt
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:56:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54223
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipEcq-00074y-Lu
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578502567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EeQR5hcog9bh201qcNsKJ+awWSBsyweYZbtBmxV7/4=;
 b=Zu4IxOXQmVYhnTbGAT1aWnOwDE6ss/K8f69hncqj99G1fWxm/4ftoGkKwEje16JuMUDcXU
 sEkcsnJ9+xPCsD4KF5YLbiWRBbEZWh7pgoY2Qhxlu0AnJP5MXzIdHreE1nDB7NbszAt8U7
 OXtx9V8qxSGSzC3CYAweXOqQ2etW+gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-0gi4Ex3TNY29WPq_H32XwQ-1; Wed, 08 Jan 2020 11:56:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 457B3DB21;
 Wed,  8 Jan 2020 16:56:02 +0000 (UTC)
Received: from [10.36.116.16] (ovpn-116-16.ams2.redhat.com [10.36.116.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B59B7C3E2;
 Wed,  8 Jan 2020 16:55:53 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Xu <peterx@redhat.com>
References: <20191210193342.GJ3352@xz-x1>
 <44c0041d-68ad-796f-16cc-4bab7ba0f164@redhat.com>
 <20191219133308.GA4246@xz-x1>
 <9d58b293-ada0-353e-bba2-ad1f538dfc62@redhat.com>
 <20191219144936.GB50561@xz-x1>
 <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
 <20191220162642.GA2626852@myrica> <20191220165100.GA3780@xz-x1>
 <20200106170634.GF2062@myrica> <20200106175850.GC219677@xz-x1>
 <20200107101024.GB832497@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <aa5fa9e6-6efd-e1a3-96c6-d02ba8eab4c8@redhat.com>
Date: Wed, 8 Jan 2020 17:55:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200107101024.GB832497@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0gi4Ex3TNY29WPq_H32XwQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXa6RdnT0APr

Hi Jean-Philippe, Peter,

On 1/7/20 11:10 AM, Jean-Philippe Brucker wrote:
> On Mon, Jan 06, 2020 at 12:58:50PM -0500, Peter Xu wrote:
>> On Mon, Jan 06, 2020 at 06:06:34PM +0100, Jean-Philippe Brucker wrote:
>>> On Fri, Dec 20, 2019 at 11:51:00AM -0500, Peter Xu wrote:
>>>> On Fri, Dec 20, 2019 at 05:26:42PM +0100, Jean-Philippe Brucker wrote:
>>>>> There is at the virtio transport level: the driver sets status to
>>>>> FEATURES_OK once it accepted the feature bits, and to DRIVER_OK once its
>>>>> fully operational. The virtio-iommu spec says:
>>>>>
>>>>>   If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
>>>>>   device SHOULD NOT let endpoints access the guest-physical address space.
>>>>>
>>>>> So before features negotiation, there is no access. Afterwards it depends
>>>>> if the VIRTIO_IOMMU_F_BYPASS has been accepted by the driver.
>>>>
>>>> Before enabling virtio-iommu device, should we still let the devices
>>>> to access the whole system address space?  I believe that's at least
>>>> what Intel IOMMUs are doing.  From code-wise, its:
>>>>
>>>>     if (likely(s->dmar_enabled)) {
>>>>         success = vtd_do_iommu_translate(vtd_as, vtd_as->bus, vtd_as->devfn,
>>>>                                          addr, flag & IOMMU_WO, &iotlb);
>>>>     } else {
>>>>         /* DMAR disabled, passthrough, use 4k-page*/
>>>>         iotlb.iova = addr & VTD_PAGE_MASK_4K;
>>>>         iotlb.translated_addr = addr & VTD_PAGE_MASK_4K;
>>>>         iotlb.addr_mask = ~VTD_PAGE_MASK_4K;
>>>>         iotlb.perm = IOMMU_RW;
>>>>         success = true;
>>>>     }
>>>>
>>>> From hardware-wise, an IOMMU should be close to transparent if you
>>>> never enable it, imho.
>>>
>>> For hardware that's not necessarily the best choice. As cited in my
>>> previous reply it has been shown to introduce vulnerabilities since
>>> malicious devices can DMA during boot, before the OS takes control of the
>>> IOMMU. The Arm SMMU allows an implementation to adopt a deny policy by
>>> default.
>>
>> I see.  But then how to read a sector from the block to at least boot
>> an OS if we use a default-deny policy?  Does it still need a mapping
>> that is established somehow by someone before hand?
> 
> Yes, it looks like EDK II uses IOMMU operations in order to access those
> devices on platforms where the IOMMU isn't default-bypass (AMD SEV support
> is provided by edk2, and a VT-d driver seems provided by edk2-platforms).
> However for OVMF we could just set the bypass feature bit in virtio-iommu
> device, which doesn't even requires setting up the virtqueue.
> 
> I'm missing a piece of the puzzle for Arm platforms though, because it
> looks like Trusted Firmware-A sets up the default-deny policy on reset
> even when it wasn't hardwired, but doesn't provide a service to create
> SMMUv3 mappings for the bootloader.
> 
> Thanks,
> Jean
> 

I think we have a concrete example for the above discussion. The AHCI.
When running the virtio-iommu on x86 I get messages like:

virtio_iommu_translate sid=250 is not known!!
no buffer available in event queue to report event

and a bunch of "AHCI: Failed to start FIS receive engine: bad FIS
receive buffer address" messages (For each port)

This was reported in my cover letter (*). This happens very early in the
boot process, before the OS get the hand and before the virtio-iommu
driver creates any mapping. It does not prevent the guest from booting
though.

Currently the virtio-iommu device checks the VIRTIO_IOMMU_F_BYPASS. If I
overwrite it to true in the device, then, the guest boots without those
messages.

I share Peter's concern about having a different default policy than x86.

Thanks

Eric

Note the migration issue reported in the cover letter is fixed now and
was due to the migration priority unset.



