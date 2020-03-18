Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp718379lfe;
        Wed, 18 Mar 2020 05:01:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt7e25lv9+kYCJeEKPL0z25JCxAnqFeSOrhTehxMPOwBrmGH0oHMnd57Htzkb+F+ptOeb9r
X-Received: by 2002:aed:34e6:: with SMTP id x93mr3939805qtd.194.1584532869995;
        Wed, 18 Mar 2020 05:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584532869; cv=none;
        d=google.com; s=arc-20160816;
        b=ENN1KG2ubfNQ959jtofDTSgQ8hKR0HcCzh4ufk8Qm8wuDSRgZUZExN2CHW7CuQyLCZ
         kKiuG3M9qirowRg6Bt58RDeeont/bMfVvzQqZjoZJp87df4z08m7fiKf5SMI9D2ces8y
         1JLM1J5UOyR4ufbm/T4BupFAIf7z0Nky6uai0/JvV/ZS9pKNWI92qBliQCiI74GgPua/
         H8JD8J/PRYWoCxXjZpjot/qr3C7cPArruGJqYrbrmSu2YcqJKGfeYFkHrzz6A8cQmgsQ
         uzxyGwBhsEf/IcFGRcHRYRczyuDfK0gknweJYlX3suLs3gumL5ctGrPhi0zd4mL20M0Q
         vB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WA0dwpGGCV5bw7coKiunMLKDU9Xz8RVNcKzRXcBE5iw=;
        b=kt6nFCx6Uv5s1C0rayOCyQq6SvwKhQ3hn3kYI7SbJPnkbf54PLWUve7NXTfgIJzcB5
         7w/IQxcJVkN10Gdx3eMfDpwaVw3/4z8Vji6UYDYfW0Bqa3dlLOOmDN4WonJpRIcMnDBQ
         g60vOG/g+aOjaSes8fq0TxWfhALTwKBxnrunIAUJJ2ElpAwmDb8t9pYUPjVUU971jtYj
         rz2gi1lRJUX0Q0FOttGpNk3gXA+369mgy8qy9Xqz7KrFfQ22KID1S+EQsaHqxcKXx36y
         SAOlh0MW5h/lGDF8MU/ZI01NrqWwwEynyza+KacwB/dbEBIkPqqmFeOMWC8oCtMghyib
         S1fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YC1kdoV/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si3501074qtr.223.2020.03.18.05.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 05:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YC1kdoV/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEXNl-0003E5-Ai
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 08:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1jEXNW-0003As-4I
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 08:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1jEXNT-00036G-R7
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 08:00:53 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1jEXNT-0002zI-Gi
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 08:00:51 -0400
Received: by mail-wm1-x343.google.com with SMTP id n8so2975027wmc.4
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2020 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WA0dwpGGCV5bw7coKiunMLKDU9Xz8RVNcKzRXcBE5iw=;
 b=YC1kdoV/gCCcdtYEOvyJSgnwmkV1FX13FiyFrOuNLUwJ5bmoybMSAxZyxhKInglsxG
 X2gMPkNKo8vywiO/uhhPC2iMyrbeRwRH4gpf7WIOJjbs0eyOOEkUFgvSl2iFuBKQhq00
 iG0vfTOBDmGTKin61JHR9o6XgtasBcsRGz1OsjMrUQcT5u+g+ftjSixGMLTGyVF6sxYP
 xSkhpDjIwYmEed5n4rkuXcsqCjn0r1aP9l2OV1Ny5ZrU2sbAOEy8JRmNS83u5IryWumm
 O5lWfpHa4MY22n08PcF54bbYbdm9iKQ3k9e1jhzgHPzThZ+PC1rYpeEhE1jSQAo+eG0C
 WjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WA0dwpGGCV5bw7coKiunMLKDU9Xz8RVNcKzRXcBE5iw=;
 b=tlhUcTRYIPiwU658S/qCYrCLqGJVNqWk1k+9WEbF0MYnhLX32ZyuAQAgfeUgTXk6Ul
 O03O6vnxKr/AnSS70aoD+VBKCR23Rwq3n+8X5AJFnIU6AEHaiM9NorWS5zwGJiBij+F5
 wqwSv5HlkzcJt9Mg0Ym4RyL9lwxMESeb3aRFvd2tQa2bpT+RVtcCNjEnCc2J4bTGgvwG
 H9gYCFdOHrJrbUAhg7O7HryERhLZZWy61wCisgIVCYB2pdoFuFfp85KnbiJnwQboRSYz
 1QoqZ32zAgy5m27iRawQPSJEH0XCMNc/4JRejn1mNl+Ir/6fc26obu+yhxWJLH6OVmc7
 Rk5Q==
X-Gm-Message-State: ANhLgQ1zrZXrpXpSJZaSP7vUga5XMTXpxmhXWfqubJQOXno1Exp/UKzG
 NOcKI1DX/O5K+rP5anjV38h+yA==
X-Received: by 2002:a1c:a102:: with SMTP id k2mr4696134wme.125.1584532850255; 
 Wed, 18 Mar 2020 05:00:50 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id q11sm9203210wrp.53.2020.03.18.05.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 05:00:48 -0700 (PDT)
Date: Wed, 18 Mar 2020 13:00:41 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [EXT] Re: [PATCH v7 3/5] virtio-iommu: Call iommu notifier for
 attach/detach
Message-ID: <20200318120041.GA1501414@myrica>
References: <CAAeCc_mSobL4oGcK-J3WJJq8BCS6M_oyPTrzJ9bk8yFgsUDBUw@mail.gmail.com>
 <20200316101124.GA304669@myrica>
 <CAAeCc_kJq_TjbZxf3Un5rpwBrNrz-8gdL_SMS-gP_0=rARf0WQ@mail.gmail.com>
 <20200317085304.GA1057687@myrica>
 <CAAeCc_n8_sY0EJODeo_PrOZ22zp8nUMOmGx2tBewz8jLaU30kA@mail.gmail.com>
 <20200317155929.GB1057687@myrica>
 <CAAeCc_k_7Ny1Kf2ZiAAJe2xms2bdK-DqB1S2ro+omxp0EWi28g@mail.gmail.com>
 <20200318111751.GA1382151@myrica>
 <MWHPR1801MB19669B4653FC94E213B894C8E3F70@MWHPR1801MB1966.namprd18.prod.outlook.com>
 <4c3a1c68-384f-f351-7307-128022020084@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c3a1c68-384f-f351-7307-128022020084@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "Tomasz Nowicki \[C\]" <tnowicki@marvell.com>,
 "mst@redhat.com" <mst@redhat.com>, "drjones@redhat.com" <drjones@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Bharat Bhushan <bharatb.linux@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 "linuc.decode@gmail.com" <linuc.decode@gmail.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YHueGmBmbNH3

On Wed, Mar 18, 2020 at 12:42:25PM +0100, Auger Eric wrote:
> Hi Jean,
> 
> On 3/18/20 12:20 PM, Bharat Bhushan wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >> Sent: Wednesday, March 18, 2020 4:48 PM
> >> To: Bharat Bhushan <bharatb.linux@gmail.com>
> >> Cc: Auger Eric <eric.auger@redhat.com>; Peter Maydell
> >> <peter.maydell@linaro.org>; kevin.tian@intel.com; Tomasz Nowicki [C]
> >> <tnowicki@marvell.com>; mst@redhat.com; drjones@redhat.com;
> >> peterx@redhat.com; qemu-devel@nongnu.org; alex.williamson@redhat.com;
> >> qemu-arm@nongnu.org; Bharat Bhushan <bbhushan2@marvell.com>;
> >> linuc.decode@gmail.com; eric.auger.pro@gmail.com
> >> Subject: [EXT] Re: [PATCH v7 3/5] virtio-iommu: Call iommu notifier for
> >> attach/detach
> >>
> >> External Email
> >>
> >> ----------------------------------------------------------------------
> >> On Wed, Mar 18, 2020 at 03:47:44PM +0530, Bharat Bhushan wrote:
> >>> Hi Jean,
> >>>
> >>> On Tue, Mar 17, 2020 at 9:29 PM Jean-Philippe Brucker
> >>> <jean-philippe@linaro.org> wrote:
> >>>>
> >>>> On Tue, Mar 17, 2020 at 02:46:55PM +0530, Bharat Bhushan wrote:
> >>>>> Hi Jean,
> >>>>>
> >>>>> On Tue, Mar 17, 2020 at 2:23 PM Jean-Philippe Brucker
> >>>>> <jean-philippe@linaro.org> wrote:
> >>>>>>
> >>>>>> On Tue, Mar 17, 2020 at 12:40:39PM +0530, Bharat Bhushan wrote:
> >>>>>>> Hi Jean,
> >>>>>>>
> >>>>>>> On Mon, Mar 16, 2020 at 3:41 PM Jean-Philippe Brucker
> >>>>>>> <jean-philippe@linaro.org> wrote:
> >>>>>>>>
> >>>>>>>> Hi Bharat,
> >>>>>>>>
> >>>>>>>> Could you Cc me on your next posting?  Unfortunately I don't
> >>>>>>>> have much hardware for testing this at the moment, but I
> >>>>>>>> might be able to help a little on the review.
> >>>>>>>>
> >>>>>>>> On Mon, Mar 16, 2020 at 02:40:00PM +0530, Bharat Bhushan wrote:
> >>>>>>>>>>>>> First issue is: your guest can use 4K page and your
> >>>>>>>>>>>>> host can use 64KB pages. In that case VFIO_DMA_MAP
> >>>>>>>>>>>>> will fail with -EINVAL. We must devise a way to pass the host
> >> settings to the VIRTIO-IOMMU device.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Even with 64KB pages, it did not work for me. I have
> >>>>>>>>>>>>> obviously not the storm of VFIO_DMA_MAP failures but
> >>>>>>>>>>>>> I have some, most probably due to some wrong notifications
> >> somewhere. I will try to investigate on my side.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Did you test with VFIO on your side?
> >>>>>>>>>>>>
> >>>>>>>>>>>> I did not tried with different page sizes, only tested with 4K page
> >> size.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Yes it works, I tested with two n/w device assigned
> >>>>>>>>>>>> to VM, both interfaces works
> >>>>>>>>>>>>
> >>>>>>>>>>>> First I will try with 64k page size.
> >>>>>>>>>>>
> >>>>>>>>>>> 64K page size does not work for me as well,
> >>>>>>>>>>>
> >>>>>>>>>>> I think we are not passing correct page_size_mask here
> >>>>>>>>>>> (config.page_size_mask is set to TARGET_PAGE_MASK (
> >>>>>>>>>>> which is
> >>>>>>>>>>> 0xfffffffffffff000))
> >>>>>>>>>> I guess you mean with guest using 4K and host using 64K.
> >>>>>>>>>>>
> >>>>>>>>>>> We need to set this correctly as per host page size, correct?
> >>>>>>>>>> Yes that's correct. We need to put in place a control
> >>>>>>>>>> path to retrieve the page settings on host through VFIO to inform the
> >> virtio-iommu device.
> >>>>>>>>>>
> >>>>>>>>>> Besides this issue, did you try with 64kB on host and guest?
> >>>>>>>>>
> >>>>>>>>> I tried Followings
> >>>>>>>>>   - 4k host and 4k guest  - it works with v7 version
> >>>>>>>>>   - 64k host and 64k guest - it does not work with v7
> >>>>>>>>>     hard-coded config.page_size_mask to 0xffffffffffff0000
> >>>>>>>>> and it works
> >>>>>>>>
> >>>>>>>> You might get this from the iova_pgsize bitmap returned by
> >>>>>>>> VFIO_IOMMU_GET_INFO. The virtio config.page_size_mask is
> >>>>>>>> global so there is the usual problem of aggregating
> >>>>>>>> consistent properties, but I'm guessing using the host page size as a
> >> granule here is safe enough.
> >>>>>>>>
> >>>>>>>> If it is a problem, we can add a PROBE property for page
> >>>>>>>> size mask, allowing to define per-endpoint page masks. I
> >>>>>>>> have kernel patches somewhere to do just that.
> >>>>>>>
> >>>>>>> I do not see we need page size mask per endpoint.
> >>>>>>>
> >>>>>>> While I am trying to understand what "page-size-mask" guest
> >>>>>>> will work with
> >>>>>>>
> >>>>>>> - 4K page size host and 4k page size guest
> >>>>>>>   config.page_size_mask = 0xffffffffffff000 will work
> >>>>>>>
> >>>>>>> - 64K page size host and 64k page size guest
> >>>>>>>   config.page_size_mask = 0xfffffffffff0000 will work
> >>>>>>>
> >>>>>>> - 64K page size host and 4k page size guest
> >>>>>>>    1) config.page_size_mask = 0xffffffffffff000 will also not
> >>>>>>> work as VFIO in host expect iova and size to be aligned to 64k
> >>>>>>> (PAGE_SIZE in
> >>>>>>> host)
> >>>>>>>    2) config.page_size_mask = 0xfffffffffff0000 will not work,
> >>>>>>> iova initialization (in guest) expect minimum page-size
> >>>>>>> supported by h/w to be equal to 4k (PAGE_SIZE in guest)
> >>>>>>>        Should we look to relax this in iova allocation code?
> >>>>>>
> >>>>>> Oh right, that's not great. Maybe the BUG_ON() can be removed,
> >>>>>> I'll ask on the list.
> >>>>>
> >>>>> yes, the BUG_ON in iova_init.
> So you mean in init_iova_domain()?
> 
> I see the BUG_ON was introduced in
> 0fb5fe874c42942e16c450ae05da453e13a1c09e "iommu: Make IOVA domain page
> size explicit" but was it meant to remain?

No I don't think iova.c is the problem, we could as well remove the
BUG_ON(). Now my concern is more with dma-iommu.c and VFIO which use the
PAGE_SIZE in some places and could have ingrained assumption about
iommu_pgsize <= PAGE_SIZE. We need a thorough audit of these drivers
before relaxing this. I started with dma-iommu yesterday but gave up after
seeing the VFIO WARN_ON.

I just sent the patch for virtio-iommu on the IOMMU list, we can continue
the discussion there

Thanks,
Jean

> 
> Logically when we allocate buffer IOVAs for DMA accesses, later on,
> shouldn't it be possible to use the actual granule set on init() and
> make sure the allocated size is properly aligned.
> 
> Reading the commit msg it explicitly says that "the systems may contain
> heterogeneous IOMMUs supporting differing minimum page sizes, which may
> also not be common with the CPU page size".
> 
> Thanks
> 
> Eric
> 
> 
> >>>>> I tried with removing same and it worked, but not analyzed side effects.
> >>>>
> >>>> It might break the assumption from device drivers that mapping a
> >>>> page is safe. For example they call alloc_page() followed by
> >>>> dma_map_page(). In our situation dma-iommu.c will oblige and create
> >>>> one 64k mapping to one 4k physical page. As a result the endpoint
> >>>> can access the neighbouring 60k of memory.
> >>>>
> >>>> This isn't too terrible. After all, even when the page sizes match,
> >>>> device drivers can call dma_map_single() on sub-page buffers, which
> >>>> will also let the endpoint access a whole page. The solution, if you
> >>>> don't trust the endpoint, is to use bounce buffers.
> >>>>
> >>>> But I suspect it's not as simple as removing the BUG_ON(), we'll
> >>>> need to go over dma-iommu.c first. And it seems like assigning
> >>>> endpoints to guest userspace won't work either in this config. In
> >> vfio_dma_do_map():
> >>>>
> >>>>         mask = ((uint64_t)1 << __ffs(vfio_pgsize_bitmap(iommu))) -
> >>>> 1;
> >>>>
> >>>>         WARN_ON(mask & PAGE_MASK);
> >>>
> >>> Yes, Agree
> >>>
> >>>>
> >>>> If I read this correctly the WARN will trigger in a 4k guest under
> >>>> 64k host, right?  So maybe we can just say that this config isn't
> >>>> supported, unless it's an important use-case for virtio-iommu?
> >>>
> >>> I sent v8 version of patch and with that guest and host with same page
> >>> size should work.
> >>> While i have not yet added analyzed how to mark 4k guest and 64k host
> >>> as un-supported configuration, will analyze and send patch.
> >>
> >> I don't think there is anything to do for QEMU, it's Linux that doesn't support the
> >> configuration. We could add something like the attached patch, in the virtio-
> >> iommu driver, to abort more gracefully than with a BUG_ON().
> > 
> > Yes agree, we need to have change in Linux side.
> > 
> > Thanks
> > -Bharat
> > 
> >>
> >> Thanks,
> >> Jean
> > 
> 
