Received: by 10.223.173.107 with SMTP id p98csp355673wrc;
        Thu, 28 Sep 2017 00:14:35 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDhV9HfZuvsHv0tF/0mJEAPUm5LD0Xrqo4g3taOEQwjdOcCm3a2JWsU+sVyn4YoqRr4tiRw
X-Received: by 10.55.161.216 with SMTP id k207mr5756904qke.108.1506582875015;
        Thu, 28 Sep 2017 00:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506582875; cv=none;
        d=google.com; s=arc-20160816;
        b=DcF0FWyHlXz/Cu6ROGitqtJfCzQAeQ2LNPIOHmuVCgx6O4aYLPh7HD56k3cJSOsJtG
         rwugyrA3q/sm8pTltyavJMA16XUzvdi8V2YaVkdMQD+dDh2vhKJq04cBBAXEywxUFN+5
         fKv9UMimUDPmecPaYNgqEX+9Qm/2S2qfXyOfSJsRjXPNzB1hyuUe/Z0jFs067Cu2wo8y
         i2aP2r5wuP7f7Nz/rp3CKROOwwUC65rIlOv/ketYP+QG0B153hfUymhBcnmaR39EhKJq
         N/jHRjnGT2/Mj6bXc8IePWYemW8dzPfMEft+SofocJrafBfwW3HYBw2pj2ccZm23ggjm
         TmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=KDIIextPwBFKr+uV6p2UJJ/jwlWQPTCCSswFwo2jmMs=;
        b=pSmImp+yGUsyXKA1joiWY1iOXT3Y0IhQeWVhwFYnXLEVyZsdbOeUxELht49iKGhqz3
         BZ1U0wFrUDSwbxryqGPV1nA662op0ilsN583swgH1iy/EcaghK0l9k+JbKj1l6631A1t
         fIy7Hq7S0KKuJ6rxJwmIHiLR/lTVSAU5rlI38Wd9ri9v6DOxojD10qYYiJZBxAMBBFKi
         JuY2lRZuCPcK1CIM9H8wr76tFq8IPkmka2IU5unQuXlkbzlZG5YN30cadY41n2QRYKYf
         UhifZQgzAQvXjbOToDQ1loJ1xD4VQk+dz+Z3r+7ezWasoAtacSM7eozBJnrla8jog0bL
         s13Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66si945094qkc.239.2017.09.28.00.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 00:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxT1k-0007eg-OR
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 03:14:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dxT1a-0007dY-Ot
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 03:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dxT1V-0002vs-1q
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 03:14:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1dxT1U-0002vX-OK; Thu, 28 Sep 2017 03:14:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27E6151D2A;
	Thu, 28 Sep 2017 07:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 27E6151D2A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=peterx@redhat.com
Received: from pxdev.xzpeter.org (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C975D9CA;
	Thu, 28 Sep 2017 07:14:01 +0000 (UTC)
Date: Thu, 28 Sep 2017 15:13:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Linu Cherian <linuc.decode@gmail.com>
Message-ID: <20170928071359.GG17044@pxdev.xzpeter.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<20170928064312.GA1544@virtx40>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170928064312.GA1544@virtx40>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 28 Sep 2017 07:14:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	will.deacon@arm.com, qemu-devel@nongnu.org,
	Eric Auger <eric.auger@redhat.com>, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, christoffer.dall@linaro.org,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7YrfEwQ0Onw

On Thu, Sep 28, 2017 at 12:13:12PM +0530, Linu Cherian wrote:
> Hi Eric,
> 
> 
> On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
> > This series implements the emulation code for ARM SMMUv3.
> > 
> > Changes since v6:
> > - DPDK testpmd now running on guest with 2 assigned VFs
> > - Changed the instantiation method: add the following option to
> >   the QEMU command line
> >   -device smmuv3 # for virtio/vhost use cases
> >   -device smmuv3,caching-mode # for vfio use cases (based on [1])
> > - splitted the series into smaller patches to allow the review
> > - the VFIO integration based on "tlbi-on-map" smmuv3 driver
> >   is isolated from the rest: last 2 patches, not for upstream.
> >   This is shipped for testing/bench until a better solution is found.
> > - Reworked permission flag checks and event generation
> > e testing:
> > - in dt and ACPI modes
> > - virtio-net-pci and vhost-net devices using dma ops with various
> >   guest page sizes [2]
> > - assigned VFs using dma ops [3]:
> >   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
> >   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
> > - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
> >   with guest and host page size equal (4kB)
> > 
> > Known limitations:
> > - no VMSAv8-32 suport
> > - no nested stage support (S1 + S2)
> > - no support for HYP mappings
> > - register fine emulation, commands, interrupts and errors were
> >   not accurately tested. Handling is sufficient to run use cases
> >   described above though.
> > - interrupts and event generation not observed yet.
> 
> While testing with vfio-pci, observed that the below two  Qemu command,
> results in two different behaviour. Is this expected by design ?
> 
> Case 1:
> # -device vfio-pci,host=0002:01:00.3 -device smmuv3,caching-mode
>  Here iommu is not attached to the pci bus in Qemu backend, since
>  pci_setup_iommu is not called before vfio_realize.
> 
> Case 2:
> # -device smmuv3,caching-mode -device vfio-pci,host=0002:01:00.3
> This works as expected, iommu is attached to the pci bus.

Not sure about SMMU, but VT-d should have similar issue - the vIOMMU
device needs to be created before the rest of the devices.

Now for VT-d the ordering of devices should be assured by Libvirt:

https://bugzilla.redhat.com/show_bug.cgi?id=1427005

For your reference only.  Thanks,

-- 
Peter Xu
