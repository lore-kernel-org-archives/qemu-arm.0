Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2194016lfi;
        Thu, 26 Mar 2020 10:53:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt6VVXisgTMRFjLrMU3kwjlF0ahF7vR13XPtUSd0Z5iNKdJbV6AMgAThPiuz2ufSDm1ePaY
X-Received: by 2002:ac8:3141:: with SMTP id h1mr4963273qtb.108.1585245224043;
        Thu, 26 Mar 2020 10:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585245224; cv=none;
        d=google.com; s=arc-20160816;
        b=qvSUgCArA+ATOwBw8x0Tk8px2Y2CND8rPpZumIdjJ3+7TvuzGSMBS04948wsSSx77y
         wS4gVik9W3pGLwu+pjMhjyFaiZjPizCEU2U8qEdAFqZ+IweM0/v9VfbQObzv6isVlvwp
         N73GDCgD8UysIaWfmOqiVZXufHETYU7Ag5QVIaJxsvS5W2cOj9P1gyqRU4MadRh1+yri
         g23dNu/UjMPXBvbBJ4vo+goG9VI3qWpX/l6t8FBTrYeMNPPhuG7wcdhpbDdmLra80tOz
         7VMm/LC4yvwRjaN6aRk0dH8QPVR6X5Oc+bim5umYc8GwNiwP4ZeiVoBUfygFKEPxBe6x
         YouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=pf/m2qnKfyy71JqIpzwDroIzfyq2zjHgeDvoNvbs/P4=;
        b=cpaY+ltTNVUweYg9fGvanD06Ls8havNrH/9K2f3t6bGPXGWFjcrsU9xPC4eEpwX7Sr
         ikl9KL5qjPHXlX0+8jlcxb3nmGShSRw0v+e5ZfWBJPhCVEBcB3dRYTT5k8IA12uAEG0n
         RIbaxXxcSGvJzgiTAOpPRt8sPzrNjpQRUp9kqoy/Z+POCuOfYBIuTQV1HcScIeFRyimz
         T5p6TeS3DmP/QhVZvZAjlLN7hYdf16otpOzwfwl4U5cDxNj/l+g2csoCG9DWBIvjpAK5
         5BXRAAQ8dH6H5auErEKAkhCYrS05I4zNAV72gfOCQctsj1XXfKST1IFVEOGyVV2LjF7Q
         fHXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="FJWUmj/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z46si1745230qtb.24.2020.03.26.10.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 10:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="FJWUmj/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHWhL-0006eo-97
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 13:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jHWhC-0006ZP-18
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 13:53:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jHWhA-0000tn-O4
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 13:53:33 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:29605)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jHWhA-0000ta-K4
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 13:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585245212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pf/m2qnKfyy71JqIpzwDroIzfyq2zjHgeDvoNvbs/P4=;
 b=FJWUmj/MRlJxH+h6j70uX4GgW4OkHwqoS3FPueQcqQR+Duav8DKEledka+NjkuWx9ChuS3
 vLt2yOcRuC+y0biPeh7H+Bq74GpbLcVTrHmg3ioU0jrJhJ7GNKkvj4dD8iNvtXN+/ZCPoz
 3Zds/RyqATFfNcmGVRDa/hEnBVOwxFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-0s8kvOVHOfi_xefGDC4X9g-1; Thu, 26 Mar 2020 13:53:30 -0400
X-MC-Unique: 0s8kvOVHOfi_xefGDC4X9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA4ADB85;
 Thu, 26 Mar 2020 17:53:28 +0000 (UTC)
Received: from x1.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04F3B9CA3;
 Thu, 26 Mar 2020 17:53:19 +0000 (UTC)
Date: Thu, 26 Mar 2020 11:53:18 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v9 1/9] hw/vfio/common: Remove error print on mmio
 region translation by viommu
Message-ID: <20200326115318.094ab79a@x1.home>
In-Reply-To: <8ec6af3c-6bd7-a3dc-c531-16db6b2089c5@redhat.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-2-bbhushan2@marvell.com>
 <20200323170835.5021f845@w520.home>
 <8ec6af3c-6bd7-a3dc-c531-16db6b2089c5@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
 tnowicki@marvell.com, mst@redhat.com, drjones@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, Bharat Bhushan <bbhushan2@marvell.com>,
 David Gibson <david@gibson.dropbear.id.au>, linuc.decode@gmail.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V032vcxjblj/

On Thu, 26 Mar 2020 18:35:48 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Alex,
> 
> On 3/24/20 12:08 AM, Alex Williamson wrote:
> > [Cc +dwg who originated this warning]
> > 
> > On Mon, 23 Mar 2020 14:16:09 +0530
> > Bharat Bhushan <bbhushan2@marvell.com> wrote:
> >   
> >> On ARM, the MSI doorbell is translated by the virtual IOMMU.
> >> As such address_space_translate() returns the MSI controller
> >> MMIO region and we get an "iommu map to non memory area"
> >> message. Let's remove this latter.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> >> ---
> >>  hw/vfio/common.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 5ca11488d6..c586edf47a 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -426,8 +426,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
> >>                                   &xlat, &len, writable,
> >>                                   MEMTXATTRS_UNSPECIFIED);
> >>      if (!memory_region_is_ram(mr)) {
> >> -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> >> -                     xlat);
> >>          return false;
> >>      }
> >>    
> > 
> > I'm a bit confused here, I think we need more justification beyond "we
> > hit this warning and we don't want to because it's ok in this one
> > special case, therefore remove it".  I assume the special case is that
> > the device MSI address is managed via the SET_IRQS ioctl and therefore
> > we won't actually get DMAs to this range.  
> Yes exactly. The guest creates a mapping between one giova and this gpa
> (corresponding to the MSI controller doorbell) because MSIs are mapped
> on ARM. But practically the physical device is programmed with an host
> chosen iova that maps onto the physical MSI controller's doorbell. so
> the device never performs DMA accesses to this range.
> 
>   But I imagine the case that
> > was in mind when adding this warning was general peer-to-peer between
> > and assigned and emulated device.  
> yes makes sense.
> 
>   Maybe there's an argument to be made
> > that such a p2p mapping might also be used in a non-vIOMMU case.  We
> > skip creating those mappings and drivers continue to work, maybe
> > because nobody attempts to do p2p DMA with the types of devices we
> > emulate, maybe because p2p DMA is not absolutely reliable on bare metal
> > and drivers test it before using it.  
> MSI doorbells are mapped using the IOMMU_MMIO flag (dma-iommu.c
> iommu_dma_get_msi_page).
> One idea could be to pass that flag through the IOMMU Notifier mechanism
> into the iotlb->perm. Eventually when we get this in vfio_get_vaddr() we
> would not print the warning. Could that make sense?

Yeah, if we can identify a valid case that doesn't need a warning,
that's fine by me.  Thanks,

Alex

