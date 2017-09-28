Received: by 10.223.173.107 with SMTP id p98csp449520wrc;
        Thu, 28 Sep 2017 02:23:37 -0700 (PDT)
X-Received: by 10.55.210.71 with SMTP id f68mr3903976qkj.150.1506590617481;
        Thu, 28 Sep 2017 02:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506590617; cv=none;
        d=google.com; s=arc-20160816;
        b=RZ2fMk8t1IBzhSgZTo6n05dWbkDkIMW9MBQ2aNoOIg8q/bbOt8LVMy62DpwFth3A54
         868G65VPdS2TIz5DhQyUKSz2T8if5OKXqSoQaAjmqY7BeoWd8UuO1SEXKi4Fod+yhl1o
         Sqb82M0NEPBDXoZs50tt8biAEBRBMkDGduKHAap90C1a6RG5RC2VU8BjtOn1t4RXm8HW
         8jd1EB2x1RLxqhn4nQ0iK7/lY8p7UWVHgLZzZm882FK0BfQgnyKnmjwaNNKF1LQY1Yhv
         Tt5tOIzvl33U7eNxI9pVVrGa5GK3t5+9WQacI/6G5RouHYyC2ZskILqUQeldpBf/Ov8C
         xwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=S+DvS8CnI8Eo08ptq7a9avxMwcBDuQpcm4dg7HYiN8g=;
        b=SMjhz7KCRdt/ygkIOP7oiqUKH6GFsBXPtjjFLK4+mtqv4S9qkfPUbt2PBUeSr8b8I3
         dNKl+kCiaw3XcGjllyGzKfxkeHofKc5EPZ4krO5k5+eKNgVx/OMDbgMzbdT4w3+a0Vd/
         QjeYZfD7SWngL1lcFcuSqcHSFM2CDg3+eL5Qpd5WEBDmn5NBiPpgqeS1m8QEyzsuympB
         ivtdfTWuXlRwofqA3t8h3bDyBN8Jcc8oA+bHMeICDtRo9v59hL9vI6RzSABHkHordQjA
         apSVay84O5CEIhruqqU0COROudWbkZiHzT3gJz8zMZ7rcGLMQtnVwjHni3/6EMTN5qKk
         +zeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EIP2eOEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e32si1219992qtf.142.2017.09.28.02.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 02:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EIP2eOEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxV2d-0004JJ-6S
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 05:23:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dxV0z-00031F-9c
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 05:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1dxV0x-0003B6-Jw
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 05:21:53 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38202)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1dxV0n-00034B-LQ; Thu, 28 Sep 2017 05:21:41 -0400
Received: by mail-pf0-x242.google.com with SMTP id a7so983717pfj.5;
	Thu, 28 Sep 2017 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=S+DvS8CnI8Eo08ptq7a9avxMwcBDuQpcm4dg7HYiN8g=;
	b=EIP2eOEN5sCouGG3KXjSd/tOQFQYxGOfWlaUs3loTBISPMN8MB3mi6k1+SNPMz0Ayj
	Y2H4etq0yM/qWkt92nfNhgo45p0bv8/mnvaJLOQIzQOo+6z4QZU9SZBIzkSMn44comf6
	s71J4oT9wklX3PdvOq3D2Pmy68nC2H+KRRAL1LjibYhWj8ofCjQ/+0u4VjSN05T3aWiO
	Fb4oCNXNIUrMdURyBGJC2fmq4W9tKErcPbBXLvj63Ti6tpsaE7wG0ynEH1gI+uB40q19
	Flz2OqHrrCa/EIm3aWCBM7rBk+R3UbLdWZz9F66MVRdD5J5XW6+eLx5JuaC35ECehZu7
	OhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=S+DvS8CnI8Eo08ptq7a9avxMwcBDuQpcm4dg7HYiN8g=;
	b=o8LkeJvQ+KUP11A9nijqL2yM4NMgqChuZdyPRKg+jTi/0ukvnwACpbW2nKijdRBPgM
	ouUXE/glQ9b3GWo4trSnizTr+SHg3w3WxUzxBHMnaWRxnztdnl1uNY2ldFH2Qe9B8XOb
	XdUdYTiy37JQLTuAJHzv09Jpm83ADOKH4FuvjSEuAK3/eT0V+xL/emR00lj8anXZsYUf
	QtzdehijAYbNqjo4MuuXKfj+Vqq6jZtoT72iTNRvm7pX1KmNgUj5aUlaZuZ93jVbpHiD
	tIiRDganPe5kaPeoP5p+tZcRfRP03uVJoQTRiB4krDTymVpl/ol5Qs8qsQLMHBGJK6Ce
	fLNQ==
X-Gm-Message-State: AHPjjUjNAfaa8PNYMsIyM77Ux2Mtrk829ohfY74tZhGpGevYiG0GyV5V
	22MTgLSrejG+LCM6Yv7PI1Y=
X-Google-Smtp-Source: AOwi7QBiKTfWrmqoCfSONJwesIkZp9kGnwUy610KsAOW5/s4H/9cDuMjzVrBNuroB75QKEbf5ZW7Cg==
X-Received: by 10.84.132.4 with SMTP id 4mr3585023ple.449.1506590499402;
	Thu, 28 Sep 2017 02:21:39 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	x81sm2208938pfk.40.2017.09.28.02.21.32
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 02:21:38 -0700 (PDT)
Date: Thu, 28 Sep 2017 14:51:08 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170928092107.GA1813@virtx40>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<20170928064312.GA1544@virtx40>
	<20170928071359.GG17044@pxdev.xzpeter.org>
	<42a551e1-ccc4-f162-51d8-c61ca5f86790@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42a551e1-ccc4-f162-51d8-c61ca5f86790@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/20] ARM SMMUv3 Emulation
 Support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	prem.mallappa@gmail.com, linu.cherian@cavium.com,
	robin.murphy@arm.com, eric.auger.pro@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BVl079utAOsw

On Thu Sep 28, 2017 at 09:54:20AM +0200, Auger Eric wrote:
> Hi Linu, Peter,
> 
> On 28/09/2017 09:13, Peter Xu wrote:
> > On Thu, Sep 28, 2017 at 12:13:12PM +0530, Linu Cherian wrote:
> >> Hi Eric,
> >>
> >>
> >> On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
> >>> This series implements the emulation code for ARM SMMUv3.
> >>>
> >>> Changes since v6:
> >>> - DPDK testpmd now running on guest with 2 assigned VFs
> >>> - Changed the instantiation method: add the following option to
> >>>   the QEMU command line
> >>>   -device smmuv3 # for virtio/vhost use cases
> >>>   -device smmuv3,caching-mode # for vfio use cases (based on [1])
> >>> - splitted the series into smaller patches to allow the review
> >>> - the VFIO integration based on "tlbi-on-map" smmuv3 driver
> >>>   is isolated from the rest: last 2 patches, not for upstream.
> >>>   This is shipped for testing/bench until a better solution is found.
> >>> - Reworked permission flag checks and event generation
> >>> e testing:
> >>> - in dt and ACPI modes
> >>> - virtio-net-pci and vhost-net devices using dma ops with various
> >>>   guest page sizes [2]
> >>> - assigned VFs using dma ops [3]:
> >>>   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
> >>>   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
> >>> - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
> >>>   with guest and host page size equal (4kB)
> >>>
> >>> Known limitations:
> >>> - no VMSAv8-32 suport
> >>> - no nested stage support (S1 + S2)
> >>> - no support for HYP mappings
> >>> - register fine emulation, commands, interrupts and errors were
> >>>   not accurately tested. Handling is sufficient to run use cases
> >>>   described above though.
> >>> - interrupts and event generation not observed yet.
> >>
> >> While testing with vfio-pci, observed that the below two  Qemu command,
> >> results in two different behaviour. Is this expected by design ?
> >>
> >> Case 1:
> >> # -device vfio-pci,host=0002:01:00.3 -device smmuv3,caching-mode
> >>  Here iommu is not attached to the pci bus in Qemu backend, since
> >>  pci_setup_iommu is not called before vfio_realize.
> >>
> >> Case 2:
> >> # -device smmuv3,caching-mode -device vfio-pci,host=0002:01:00.3
> >> This works as expected, iommu is attached to the pci bus.
> > 
> > Not sure about SMMU, but VT-d should have similar issue - the vIOMMU
> > device needs to be created before the rest of the devices.
> 
> Yes this is an expected limitation right now. I should have documented
> it though. As you noticed, the pci_set_iommu() is called on virtio-iommu
> realize and it relies on the fact the PCIe devices already are realized.
> 
> Maybe we could relax this constraint by calling the pci_set_iommu in a
> machine init done notifier.
> 
> Thanks
> 
> Eric

Thanks for confirming. 

> 
> 
> > 
> > Now for VT-d the ordering of devices should be assured by Libvirt:
> > 
> > https://bugzilla.redhat.com/show_bug.cgi?id=1427005
> > 
> > For your reference only.  Thanks,
> > 

-- 
Linu cherian
