Received: by 10.25.15.230 with SMTP id 99csp269338lfp;
        Mon, 3 Apr 2017 12:51:38 -0700 (PDT)
X-Received: by 10.55.214.71 with SMTP id t68mr7823563qki.211.1491249098023;
        Mon, 03 Apr 2017 12:51:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i58si12837049qti.175.2017.04.03.12.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Apr 2017 12:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cv80n-0002hr-IE
	for alex.bennee@linaro.org; Mon, 03 Apr 2017 15:51:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cv7yt-0001HH-Fj
	for qemu-devel@nongnu.org; Mon, 03 Apr 2017 15:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cv7ys-0005f3-F4
	for qemu-devel@nongnu.org; Mon, 03 Apr 2017 15:49:39 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:34193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cv7ys-0005eb-7K
	for qemu-devel@nongnu.org; Mon, 03 Apr 2017 15:49:38 -0400
Received: by mail-wr0-x233.google.com with SMTP id t20so5486948wra.1
	for <qemu-devel@nongnu.org>; Mon, 03 Apr 2017 12:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PLMpw+1FahCDsjIqtsNRivImRbK42nWQaPlj2o4tlic=;
	b=f2L6SHPu3iW7zweUw2yQcht1hQAb0KUOu2+AbKUEK6MgtoS/9mbsCwvJMXAIb/7g7c
	L143U5AijPatWCi9GTbkY2/P4DQOnJvLYl7s8v4kOqyAZ6P63gK+c5DuBDdapVqC0kOT
	VHtn6STzqYT6If1vtELmRDfrlZra9NmYAeinI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PLMpw+1FahCDsjIqtsNRivImRbK42nWQaPlj2o4tlic=;
	b=JfQsoEQz8N1TYSrKSup7LNk8CGFE1gd+gEdBAN5GHvxeqVYZ8XM21BtA5QLbx308M5
	CNZh7JkMBAEe6xAH5P9nAj06eai/fVp5yIH8XGQGA5VQhiBDpcr4EPMV5UJOefr8TT/5
	adUCnDAVjlH2GL6KZQ1dCOYeX4XGMHEig6X9q2Sn8rzZtK3q+gVdx3/tR1tbCI61Me1L
	8b/5d+9D9ArjWK5ql3c63jBKgcmAw/fKrvZ/eVLVfOo0hgFLeOKQLR/PW3nac3RI3Zc6
	9/++aSAmRF6Ur5q1Dj0qhaNEkBFRhpWQle+3uaE5YLbn1v3JuIYctwmXi/umQ36KTxwD
	0Rig==
X-Gm-Message-State: AFeK/H1wIDf73ZXmDnQtBa16aJEf5IG5TybBPMcsuSmMG7SqZztxVMbR
	lHmFisu2+TfnMCg1cJe39AiuUNcyIXM3
X-Received: by 10.28.167.203 with SMTP id q194mr10990615wme.111.1491248976916; 
	Mon, 03 Apr 2017 12:49:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Mon, 3 Apr 2017 12:49:16 -0700 (PDT)
In-Reply-To: <20170401004624.30886-4-ehabkost@redhat.com>
References: <20170401004624.30886-1-ehabkost@redhat.com>
	<20170401004624.30886-4-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Apr 2017 20:49:16 +0100
Message-ID: <CAFEAcA_uRHZR0N-=h=eWsDKjZpN4csua1j++wLVfZbsNVpaH5Q@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-devel] [RFC 03/19] sysbus: Set user_creatable=false by
 default on TYPE_SYS_BUS_DEVICE
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Qemu-block <qemu-block@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Gabriel L . Somlo" <somlo@cmu.edu>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Scott Wood <scottwood@freescale.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>, Max Reitz <mreitz@redhat.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KjJy3YnBebeb

On 1 April 2017 at 01:46, Eduardo Habkost <ehabkost@redhat.com> wrote:
> commit 33cd52b5d7b9adfd009e95f07e6c64dd88ae2a31 unset
> cannot_instantiate_with_device_add_yet in TYPE_SYSBUS, making
> all kinds of untested devices available to -device and
> device_add.
>
> The problem with that is: setting has_dynamic_sysbus on a
> machine-type lets it accept all the 288 sysbus device types we
> have in QEMU, and most of them were never meant to be used with
> -device. That's a lot of untested code.
>
> Fortunately today we have just a few has_dynamic_sysbus=1
> machines: virt, pc-q35-*, ppce500, and spapr.
>
> virt, ppce500, and spapr have extra checks to ensure just a few
> device types can be instantiated:
>
> * virt supports only TYPE_VFIO_CALXEDA_XGMAC, TYPE_VFIO_AMD_XGBE.
> * ppce500 supports only TYPE_ETSEC_COMMON.
> * spapr supports only TYPE_SPAPR_PCI_HOST_BRIDGE.
>
> q35 has no code to block unsupported sysbus devices, however, and
> accepts all device types. Fortunately, only the following 20
> device types are compiled into the qemu-system-x86_64 and
> qemu-system-i386 binaries:
>
> * allwinner-ahci
> * amd-iommu
> * cfi.pflash01
> * esp
> * fw_cfg_io
> * fw_cfg_mem
> * generic-sdhci
> * hpet
> * intel-iommu
> * ioapic
> * isabus-bridge
> * kvmclock
> * kvm-ioapic
> * kvmvapic
> * SUNW,fdtwo
> * sysbus-ahci
> * sysbus-fdc
> * sysbus-ohci
> * unimplemented-device
> * virtio-mmio
>
> Instead of requiring each machine-type with has_dynamic_sysbus=1
> to implement its own mechanism to block unsupported devices, we
> can use the user_creatable flag to ensure we won't let the user
> plug anything that will never work.

How does this work? Which devices can be dynamically
plugged is machine dependent. You can't dynamically-plug
an intel-iommu on the ARM virt board, and you can't
dynamically-plug the vfio-calxeda-xgmac on the spapr
board, and so on. So I don't see how we can just have
a flag on the device itself that controls whether
it can be dynamically plugged.

So I'm definitely coming around to the opinion that
it's just a bug in the q35 board that it doesn't have
any device whitelisting, and we should fix that.

thanks
-- PMM
