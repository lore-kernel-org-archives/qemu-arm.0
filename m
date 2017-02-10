Received: by 10.25.77.65 with SMTP id a62csp524538lfb;
        Fri, 10 Feb 2017 07:03:51 -0800 (PST)
X-Received: by 10.55.12.14 with SMTP id 14mr8613612qkm.308.1486739031738;
        Fri, 10 Feb 2017 07:03:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m65si1407593qtd.323.2017.02.10.07.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 07:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccCjl-0005OS-7W
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 10:03:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCjF-000528-Lr
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 10:03:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCjE-0001eh-SZ
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 10:03:17 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:37437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ccCjE-0001do-MY
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 10:03:16 -0500
Received: by mail-wm0-x22a.google.com with SMTP id v77so50503216wmv.0
	for <qemu-arm@nongnu.org>; Fri, 10 Feb 2017 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zD/yY6hn1re23DWKqAZew0q7QbZ51cBJOQmEThtDsbU=;
	b=OooSs3FXqbeSzH3RPTudxefeDw5KFsRpPnwnhC4jsO+Lm/uS/bNxHX0Vd6kZR59Nbs
	YjsVdhH1mhS+0iVUJacc6HUfZy5zQHYN+jnYxUnKhERILV5uIswAbjr2DNoLhdtwZwuU
	Z2do8RKz0MBoQaglzw02azQyWoswraUUUXVFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zD/yY6hn1re23DWKqAZew0q7QbZ51cBJOQmEThtDsbU=;
	b=gTV7PoSLWpTE6pnD0wsAiKTqwLhwSggybJ0MFu95KwhgoKFw2jBjXWJjVSP0gLUqt1
	DFvZTc6Zzv/0Y9hrOG0S3v9im25Nv0s0I6PjYWK7nmsNaF464IPTNUhHm/yPN/jp1FCd
	AROqs1J6hXnwdpguDlsZQQ8ZuQ6JqFtjQK7AUt+/hvici0z84MJ1PiSTc1/lrayeyDrH
	ztzZ059/osaYt0k5gkWUJgt77yFrn5Ek12cApbNEJc6IPO0v8eFhanc99McyTavKlPeK
	RxGJYmyWEPsx7pqhZHT7GmXOIPqrUoAZnSnPcOWftu1PTIJbIsX+yn8p1+nlijFvPK10
	64TA==
X-Gm-Message-State: AMke39n15bAvv1DlWlM4+kfKG7rivpgCYSR+15J3+RPuhjCFuHKtPe3cCIbCZG/YGszoFq5ibrXs07q8PUxODQKY
X-Received: by 10.28.91.16 with SMTP id p16mr7681566wmb.111.1486738995450;
	Fri, 10 Feb 2017 07:03:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 07:02:54 -0800 (PST)
In-Reply-To: <1486644810-33181-1-git-send-email-agraf@suse.de>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 15:02:54 +0000
Message-ID: <CAFEAcA-m+gKBg69xBSe4NTVkEhpdBKMDT-6+qECh=ARH6v9fyw@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH v2 0/4] target-arm: Add some omitted dma
 cache coherency flags
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fvsPP+c8FBW7

On 9 February 2017 at 12:53, Alexander Graf <agraf@suse.de> wrote:
> ARM is amazing when it comes to cache coherency and VMs. While any sane
> architecture allows the host to override the guest's caching attributes,
> that's very hard to do on ARM.
>
> That means that the guest may directly access guest memory bypassing the
> cache while QEMU happily writes to / reads from cache. The end result is
> very nasty, because both sides see very different views of the world.
>
> That means that we need to be very cautious to tell guests that devices
> that QEMU emulates are going to use data in the cache rather than directly
> on memory.
>
> We added this to PCI a while back for DT (5d636e21 "hw/arm/virt: mark the PCIe
> host controller as DMA coherent in the DT") and ACPI (bc64b96 "hw/arm/virt-
> acpi-build: _CCA attribute is compulsory") but never updated virtio-mmio or
> fw-cfg in DT or ACPI tables.
>
> This patch set adds the respective cache coherency flags for them in both DT and
> ACPI.
>
> Fortunately, no guests except for Linux 4.9.7 and 4.9.8 are broken because of
> this. Upstream realized quickly enough that every user of virtio-mmio out there
> describes its cache coherency incorrectly and reverted the patch that would
> require said dma coherency flag. But we should be safe for the future and "do
> the right thing".
>
> Alexander Graf (4):
>   target-arm: Declare virtio-mmio as dma-coherent in dt
>   hw/arm/virt: Declare virtio-mmio as dma cache coherent in ACPI
>   hw/arm/virt: Declare fwcfg as dma cache coherent in ACPI
>   hw/arm/virt: Declare fwcfg as dma cache coherent in dt
>
>  hw/arm/vexpress.c        | 1 +
>  hw/arm/virt-acpi-build.c | 2 ++
>  hw/arm/virt.c            | 2 ++
>  3 files changed, 5 insertions(+)

The patches in this series have more lines of Reviewed-by: tags than
they do actual code changes :-)

Thanks, applied to target-arm.next.

-- PMM
