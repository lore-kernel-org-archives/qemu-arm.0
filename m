Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1368456lfb;
        Tue, 5 May 2020 02:25:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypLSDmWEOx/qEB0sHa0HD87wzj0peDt/M62dnQYCsh6iZyfcHeFz7XHlyu6Gzz2J+1x8nngs
X-Received: by 2002:a37:80c4:: with SMTP id b187mr2379717qkd.302.1588670731973;
        Tue, 05 May 2020 02:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588670731; cv=none;
        d=google.com; s=arc-20160816;
        b=bWkd0++g7OYzENGhWKiO6QokZ1inC72f82QhL1ZHRVJ1z+NR2EUFBZ+bSjZjVxCJfy
         0TKTpOKgU+qp6ud4AHyZu7ULm0VMGz+lkFmvRXd7sKexlboNqFXF9F40S4dM5UH5RDwN
         PyAI6pSLU3m7ll7d0hRZcNu4OOcUHUF7rIdAu7j4CfxHkW/9L/jodL7+pPYL7lwIiJXn
         /b2rF+uWa2CQ6OHPjANcWZg4DZi2fKq0uOFlKSbdL3Jp2mWuzMy+uUzR4et5QayygMcP
         E+anbNZ3Zkep7H61HrLxcC/TaMamEa0GdbbAi9HRrvcSO9jOSwfArB4c6ZYwFRnL26Qs
         T4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yl/pkfWaU0SioytiEHRJk0gXJ0+lNOh2aKwUH484DYo=;
        b=EIBfDk9oMR3h1/W5OQZVQi9pJixEuUq6og0rhin51VJOTF53y7DGLyzbwNQjlcKyIV
         EzWOHZh1upAQnum68tORsi4qOSUlQSd3rHMke+LHhm3iz5mdJKOucnuiWAgOe0IhDw2N
         qyx5CoPFFHw6ZSkV08924+rzdQ7hAvtGWuSErq4SV8SBuX62Q2qpgAISayvLlVmtnbxQ
         mFNrN/1FMpBqEOdwyPazp1luv9Lpqre87fVUmf8MdQz61vHetthc8RVGiqr3Ye+0nbDT
         NrEyObW9/jSX+dIoLVdnNiCJ7dX2lmxL69zEiEOH5bYVxARUpQgg6EDOgmqUffSSWLPu
         HPVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b1BMDI57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id q33si646306qtj.297.2020.05.05.02.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 02:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b1BMDI57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVtpT-0004sR-BM
	for alex.bennee@linaro.org; Tue, 05 May 2020 05:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharatb.linux@gmail.com>)
 id 1jVtpL-0004r1-TW; Tue, 05 May 2020 05:25:23 -0400
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:38259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bharatb.linux@gmail.com>)
 id 1jVtpI-0002uY-Qb; Tue, 05 May 2020 05:25:23 -0400
Received: by mail-qv1-xf43.google.com with SMTP id t8so655902qvw.5;
 Tue, 05 May 2020 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yl/pkfWaU0SioytiEHRJk0gXJ0+lNOh2aKwUH484DYo=;
 b=b1BMDI57Q4dw8epv2P0Z/7f2lxfwEBoIoJppErFyNCZybJcIaxkMq2fN7xDiZLafLV
 JZ1qm9uQdTasp5UB8fE7gXBKiE11D0GyUtzMamGpA6wVxvb2BrBx5nCnPLQh22T1SOse
 LJJfH99p42fiMgVbNIKfProVhUgfNo0+dsOv3vfiZt0BXGKGAc2OJgAWgytpKih1Wixh
 GSgdVMU2XdGMA0Rcjs7XZXwt2LC1GLwXR8nHMrGcbavsEOOtZDeNdg9pF8xRjrBweTmN
 SRMfChO3vC3TAoB6LrTDpdkxOgBE1VCF/zMyeH8nrtD/GyKfz8TFeCsoo1CoRx3KgROC
 jGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yl/pkfWaU0SioytiEHRJk0gXJ0+lNOh2aKwUH484DYo=;
 b=ajW0iDbaILfFgxHQC283RiCCJ6ITc5i6h1EfE53RFz9L4rGC2YNTpZgRwTgNarGMHW
 Sztw6lRjk+++oNZhpDDizShx9JvlaFIYilG1MnZTxMPxI1/6Q/tL3J4+nNBaqQfxpeVg
 AAFMwXzQ9pS6D7ispO9ENZLLEMflw1uVtrKdYg0c7PWZUj+wv1EXsV4YvK1scagQ/3BF
 8yx5EZAqkiaO8zHPmj8fKsTVze6Pkbtnh3Pdig+AYXWkHaAcgQeihrFXvjwlLvTumR2n
 QS+c08oRnJmF8ZMT2UWV9dtFYbKrBEe5AB2Mptzj6z7BTSbAdPvKTdWxgeSuemSphvon
 oIYA==
X-Gm-Message-State: AGi0Puab3ElspqcLcDHNdYrIJu0dyz3MvkcC3uxlCXVfBeJe9dhA45a7
 5FzuYwdOeD1OC4zP1DTYzlFl/ooywBpS6QtUELU=
X-Received: by 2002:a0c:8262:: with SMTP id h89mr1625074qva.173.1588670719115; 
 Tue, 05 May 2020 02:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-2-bbhushan2@marvell.com>
 <20200323170835.5021f845@w520.home>
 <8ec6af3c-6bd7-a3dc-c531-16db6b2089c5@redhat.com>
 <20200326115318.094ab79a@x1.home>
 <MWHPR1801MB196612966851882A99A6D3F3E3C60@MWHPR1801MB1966.namprd18.prod.outlook.com>
 <72e3ea5c-c98c-3e02-26d1-b956ee81e30f@redhat.com>
In-Reply-To: <72e3ea5c-c98c-3e02-26d1-b956ee81e30f@redhat.com>
From: Bharat Bhushan <bharatb.linux@gmail.com>
Date: Tue, 5 May 2020 14:55:06 +0530
Message-ID: <CAAeCc_nnE2FBo2wW+NkJX-vOP3FF_wSvLg0KngND4HhFUAGf9Q@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v9 1/9] hw/vfio/common: Remove error print on
 mmio region translation by viommu
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f43;
 envelope-from=bharatb.linux@gmail.com; helo=mail-qv1-xf43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: "yang.zhong@intel.com" <yang.zhong@intel.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "Tomasz Nowicki \[C\]" <tnowicki@marvell.com>,
 "mst@redhat.com" <mst@redhat.com>, "drjones@redhat.com" <drjones@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "linuc.decode@gmail.com" <linuc.decode@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJsGdrmooah1

Hi Eric,

On Fri, Apr 24, 2020 at 7:47 PM Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Bharat,
>
> On 4/2/20 11:01 AM, Bharat Bhushan wrote:
> > Hi Eric/Alex,
> >
> >> -----Original Message-----
> >> From: Alex Williamson <alex.williamson@redhat.com>
> >> Sent: Thursday, March 26, 2020 11:23 PM
> >> To: Auger Eric <eric.auger@redhat.com>
> >> Cc: Bharat Bhushan <bbhushan2@marvell.com>; peter.maydell@linaro.org;
> >> peterx@redhat.com; eric.auger.pro@gmail.com; kevin.tian@intel.com;
> >> mst@redhat.com; Tomasz Nowicki [C] <tnowicki@marvell.com>;
> >> drjones@redhat.com; linuc.decode@gmail.com; qemu-devel@nongnu.org; qemu-
> >> arm@nongnu.org; bharatb.linux@gmail.com; jean-philippe@linaro.org;
> >> yang.zhong@intel.com; David Gibson <david@gibson.dropbear.id.au>
> >> Subject: [EXT] Re: [PATCH v9 1/9] hw/vfio/common: Remove error print on mmio
> >> region translation by viommu
> >>
> >> External Email
> >>
> >> ----------------------------------------------------------------------
> >> On Thu, 26 Mar 2020 18:35:48 +0100
> >> Auger Eric <eric.auger@redhat.com> wrote:
> >>
> >>> Hi Alex,
> >>>
> >>> On 3/24/20 12:08 AM, Alex Williamson wrote:
> >>>> [Cc +dwg who originated this warning]
> >>>>
> >>>> On Mon, 23 Mar 2020 14:16:09 +0530
> >>>> Bharat Bhushan <bbhushan2@marvell.com> wrote:
> >>>>
> >>>>> On ARM, the MSI doorbell is translated by the virtual IOMMU.
> >>>>> As such address_space_translate() returns the MSI controller MMIO
> >>>>> region and we get an "iommu map to non memory area"
> >>>>> message. Let's remove this latter.
> >>>>>
> >>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> >>>>> ---
> >>>>>  hw/vfio/common.c | 2 --
> >>>>>  1 file changed, 2 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c index
> >>>>> 5ca11488d6..c586edf47a 100644
> >>>>> --- a/hw/vfio/common.c
> >>>>> +++ b/hw/vfio/common.c
> >>>>> @@ -426,8 +426,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb,
> >> void **vaddr,
> >>>>>                                   &xlat, &len, writable,
> >>>>>                                   MEMTXATTRS_UNSPECIFIED);
> >>>>>      if (!memory_region_is_ram(mr)) {
> >>>>> -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> >>>>> -                     xlat);
> >>>>>          return false;
> >>>>>      }
> >>>>>
> >>>>
> >>>> I'm a bit confused here, I think we need more justification beyond
> >>>> "we hit this warning and we don't want to because it's ok in this
> >>>> one special case, therefore remove it".  I assume the special case
> >>>> is that the device MSI address is managed via the SET_IRQS ioctl and
> >>>> therefore we won't actually get DMAs to this range.
> >>> Yes exactly. The guest creates a mapping between one giova and this
> >>> gpa (corresponding to the MSI controller doorbell) because MSIs are
> >>> mapped on ARM. But practically the physical device is programmed with
> >>> an host chosen iova that maps onto the physical MSI controller's
> >>> doorbell. so the device never performs DMA accesses to this range.
> >>>
> >>>   But I imagine the case that
> >>>> was in mind when adding this warning was general peer-to-peer
> >>>> between and assigned and emulated device.
> >>> yes makes sense.
> >>>
> >>>   Maybe there's an argument to be made
> >>>> that such a p2p mapping might also be used in a non-vIOMMU case.  We
> >>>> skip creating those mappings and drivers continue to work, maybe
> >>>> because nobody attempts to do p2p DMA with the types of devices we
> >>>> emulate, maybe because p2p DMA is not absolutely reliable on bare
> >>>> metal and drivers test it before using it.
> >>> MSI doorbells are mapped using the IOMMU_MMIO flag (dma-iommu.c
> >>> iommu_dma_get_msi_page).
> >>> One idea could be to pass that flag through the IOMMU Notifier
> >>> mechanism into the iotlb->perm. Eventually when we get this in
> >>> vfio_get_vaddr() we would not print the warning. Could that make sense?
> >>
> >> Yeah, if we can identify a valid case that doesn't need a warning, that's fine by me.
> >> Thanks,
> >
> > Let me know if I understood the proposal correctly:
> >
> > virtio-iommu driver in guest will make map (VIRTIO_IOMMU_T_MAP) with VIRTIO_IOMMU_MAP_F_MMIO flag for MSI mapping.
> > In qemu, virtio-iommu device will set a new defined flag (say IOMMU_MMIO) in iotlb->perm in memory_region_notify_iommu(). vfio_get_vaddr() will check same flag and will not print the warning.>
> > Is above correct?
> Yes that's what I had in mind.

In that case virtio-iommu driver in guest should not make map
(VIRTIO_IOMMU_T_MAP) call as it known nothing to be mapped.

Stay Safe

Thanks
-Bharat

>
> Thanks
>
> Eric
> >
> > Thanks
> > -Bharat
> >
> >>
> >> Alex
> >
> >
>
