Received: by 10.223.197.9 with SMTP id q9csp1508578wrf;
        Thu, 12 Oct 2017 03:05:22 -0700 (PDT)
X-Received: by 10.233.235.138 with SMTP id b132mr2572110qkg.41.1507802722277;
        Thu, 12 Oct 2017 03:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507802722; cv=none;
        d=google.com; s=arc-20160816;
        b=EFgeWaBsi41EjZHBz2rbXDbud4Uu8Y793jVSy59KfRUIrfi//hF1ctj+ymuGCTKaCw
         /4zRJnzNnZMqocCdXiFv7V7ffIb9fzJcYB/B0I68gjEY57905O9vtpmjKNZJx+b1Usdo
         ZvWpFkGWoHnsz9JOiuuw9MXWp+YXV82Kvbrc+WgZz5/QHRzYAlSc6TBBqEpLbUqbpGeA
         ZIid+wycaDLNwLS+m82qLoUqTG41KZ72zMg2rwbTUDSAAT7016lXL8t7U/D8WwiqzY/7
         +b0t/7L7eQTmmnJHYkfPiFyeqN9k+HDb7P8XfEOoJQn1418ToOySWBmmgCqIWS3rpZqo
         YZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SdL/5k4cQ4dOWZpu8dduUoTE6KcqaN0X5ZEKPwBp+gw=;
        b=UA2ILqS8KvrsiTVNVnGUw/zuIL+gEZQPVGBp7TOOkkQQ0r3nOnKj+IdEYKSRKk8IP2
         CPSq//rjn7EinOmJEQeH1voCCjOoO826Erbq+outnB9bkz1ekxEgcOXU/uIFI7ZMBTS/
         ezhUGGWpkryEZcstWCMHvrVJC1P6aETeSOw+MUlOxbwyQcASknkuCkzUxXb0/ze7DVPU
         MhZMxZe48hJmo94k6rcEZRu+jXsc2pXZRoiwvLG1zf8T8wluM8mA9KgrrSHklL7atKUl
         TQs9DE6//FtaircvhV6/mLDgSxWs+2iFTSPS3NBjs4rj2SvVEN6NP0TVMiLcGYhBrexd
         PqfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GB3xI2Pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g123si1368875qkg.36.2017.10.12.03.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 03:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GB3xI2Pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2aMh-0002Wj-Ts
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 06:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2aCW-0002IV-Lf
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 05:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2aCV-0001O3-Ot
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 05:54:48 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:53762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2aCV-0001NJ-J7
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 05:54:47 -0400
Received: by mail-wm0-x229.google.com with SMTP id q132so11725500wmd.2
	for <qemu-arm@nongnu.org>; Thu, 12 Oct 2017 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SdL/5k4cQ4dOWZpu8dduUoTE6KcqaN0X5ZEKPwBp+gw=;
	b=GB3xI2Pmbsbw52yGknnuesGao3UB72amVlVyBOVWDmMEzMGTlXtUP6tT7KNDNpiXLF
	RWgzBlTBJhzQe+xUQVlTn1Ab0wsyaYAhlJUwKuSqruTt8V2RBWeFfHwiH3HF1NxyIcKz
	znF0dNC/n1mHJwB+NUrDmEcga+zGbEGYSDYJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SdL/5k4cQ4dOWZpu8dduUoTE6KcqaN0X5ZEKPwBp+gw=;
	b=Fgnmh8FAMQHJ8JX6B3agIK7FpG2u5PghZXlDlseKXVGQiWj35z5q9wMetRE38r222W
	viuMHk9lVg74WHGZBKTkwnKsbgcNSGM82ywqvU/U8mSvLwjkgoKqOlJzneK3cNX2CFD8
	6z+vkXILkIwx4tNIu/rymuoCHuQP7/aJopj4FXB4lKuQiLckzNHS4UozUvtkAKi8q4me
	0vgGop+7JNFgQNLYm+ZYMsQVlzaKHOznUXMPT6uQDy6Bt2bhuOas4gRh6bd7yRlT4RVn
	tROlnkaTTAosEB+5ghQXk4aRLBVTxRcRxjKau3GTGHbFhZFb0I+i+Gz2FCbVMIOGYx/P
	vvaA==
X-Gm-Message-State: AMCzsaVsW6LS7d4wW44zvMXdpOB0vLMhBCArng5O502l/gED3ohKZE0m
	G6Toqzeu1Vh+/KjoyOBVh4EcCA13VV6y7V8B1X3uXg==
X-Google-Smtp-Source: ABhQp+S4XYbHWbS+uRGrM+ieGBQA1340Pacr35g9y2e4AazcWkTywJTwXJgUPPVlLG7jfLBscIhGe8bPDfw3z/SVa3o=
X-Received: by 10.28.23.3 with SMTP id 3mr1343419wmx.62.1507802086416; Thu, 12
	Oct 2017 02:54:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Thu, 12 Oct 2017 02:54:25 -0700 (PDT)
In-Reply-To: <f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
	<f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Oct 2017 10:54:25 +0100
Message-ID: <CAFEAcA_2RaRsvm_=V4iDNk_vMOtiWUZs3-SdMh+DSYqGyPE0PQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>,
	Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rtGwIjvgSJxm

On 11 October 2017 at 17:08, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 11/10/2017 16:56, Peter Maydell wrote:
>> On 19 September 2017 at 08:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> This series implements the virtio-iommu device.
>>>
>>> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
>>> - probe request support although no reserved region is returned at
>>>   the moment
>>> - unmap semantics less strict, as specified in v0.4
>>> - device registration, attach/detach revisited
>>> - split into smaller patches to ease review
>>> - propose a way to inform the IOMMU mr about the page_size_mask
>>>   of underlying HW IOMMU, if any
>>> - remove warning associated with the translation of the MSI doorbell
>>>
>>> The device gets instantiated using the "-device virtio-iommu-device"
>>> option. It currently works with ARM virt machine only, as the machine
>>> must handle the dt binding between the virtio-mmio "iommu" node and
>>> the PCI host bridge node.
>>
>> Could this work on x86, or is it inherently arm-only?
>
> Yes this is the goal. At the moment the ACPI probing is not yet properly
> specified but a Q35 prototype was developed in the Red Hat Virt team.
> This will be presented at the KVM forum.

Since I have very little familiarity with virtio or iommu code,
I'd be much happier if this was reviewed as a generic virtio-iommu
by the x86/virtio devs and then the arm specific parts done second...

I'm also not clear on what we're expecting the recommended or normal
way to do device passthrough is going to be -- this virtio-mmio,
or presenting the guest with an SMMUv3 interface? Do we really
need to implement both ?

thanks
-- PMM
