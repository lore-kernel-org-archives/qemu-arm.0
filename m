Received: by 10.25.15.230 with SMTP id 99csp276207lfp;
        Mon, 3 Apr 2017 13:10:47 -0700 (PDT)
X-Received: by 10.200.40.178 with SMTP id i47mr18838421qti.259.1491250247320;
        Mon, 03 Apr 2017 13:10:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13si505262qkj.119.2017.04.03.13.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Apr 2017 13:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cv8JK-00074P-Qe
	for alex.bennee@linaro.org; Mon, 03 Apr 2017 16:10:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cv8JC-00072i-Ml
	for qemu-arm@nongnu.org; Mon, 03 Apr 2017 16:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cv8JB-0001Sr-Fw
	for qemu-arm@nongnu.org; Mon, 03 Apr 2017 16:10:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cv8JB-0001S8-7w; Mon, 03 Apr 2017 16:10:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06B72C00DDF0;
	Mon,  3 Apr 2017 20:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 06B72C00DDF0
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 06B72C00DDF0
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B73C5DD65;
	Mon,  3 Apr 2017 20:10:27 +0000 (UTC)
Date: Mon, 3 Apr 2017 17:10:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170403201026.GJ1910@thinpad.lan.raisama.net>
References: <20170401004624.30886-1-ehabkost@redhat.com>
	<20170401004624.30886-4-ehabkost@redhat.com>
	<CAFEAcA_uRHZR0N-=h=eWsDKjZpN4csua1j++wLVfZbsNVpaH5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_uRHZR0N-=h=eWsDKjZpN4csua1j++wLVfZbsNVpaH5Q@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 03 Apr 2017 20:10:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 03/19] sysbus: Set user_creatable=false by
 default on TYPE_SYS_BUS_DEVICE
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fezaqQa8EVdh

On Mon, Apr 03, 2017 at 08:49:16PM +0100, Peter Maydell wrote:
> On 1 April 2017 at 01:46, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > commit 33cd52b5d7b9adfd009e95f07e6c64dd88ae2a31 unset
> > cannot_instantiate_with_device_add_yet in TYPE_SYSBUS, making
> > all kinds of untested devices available to -device and
> > device_add.
> >
> > The problem with that is: setting has_dynamic_sysbus on a
> > machine-type lets it accept all the 288 sysbus device types we
> > have in QEMU, and most of them were never meant to be used with
> > -device. That's a lot of untested code.
> >
> > Fortunately today we have just a few has_dynamic_sysbus=1
> > machines: virt, pc-q35-*, ppce500, and spapr.
> >
> > virt, ppce500, and spapr have extra checks to ensure just a few
> > device types can be instantiated:
> >
> > * virt supports only TYPE_VFIO_CALXEDA_XGMAC, TYPE_VFIO_AMD_XGBE.
> > * ppce500 supports only TYPE_ETSEC_COMMON.
> > * spapr supports only TYPE_SPAPR_PCI_HOST_BRIDGE.
> >
> > q35 has no code to block unsupported sysbus devices, however, and
> > accepts all device types. Fortunately, only the following 20
> > device types are compiled into the qemu-system-x86_64 and
> > qemu-system-i386 binaries:
> >
> > * allwinner-ahci
> > * amd-iommu
> > * cfi.pflash01
> > * esp
> > * fw_cfg_io
> > * fw_cfg_mem
> > * generic-sdhci
> > * hpet
> > * intel-iommu
> > * ioapic
> > * isabus-bridge
> > * kvmclock
> > * kvm-ioapic
> > * kvmvapic
> > * SUNW,fdtwo
> > * sysbus-ahci
> > * sysbus-fdc
> > * sysbus-ohci
> > * unimplemented-device
> > * virtio-mmio
> >
> > Instead of requiring each machine-type with has_dynamic_sysbus=1
> > to implement its own mechanism to block unsupported devices, we
> > can use the user_creatable flag to ensure we won't let the user
> > plug anything that will never work.
> 
> How does this work? Which devices can be dynamically
> plugged is machine dependent. You can't dynamically-plug
> an intel-iommu on the ARM virt board, and you can't
> dynamically-plug the vfio-calxeda-xgmac on the spapr
> board, and so on. So I don't see how we can just have
> a flag on the device itself that controls whether
> it can be dynamically plugged.
> 
> So I'm definitely coming around to the opinion that
> it's just a bug in the q35 board that it doesn't have
> any device whitelisting, and we should fix that.

OK, let's assume q35 must implement a whitelist:

To build that whitelist, we need to be able to know what should
be in the whitelist, or not. And nobody knew for sure what was
user-creatable in q35 by accident, and what was really supposed
to be user-creatable in q35. See the "q35 and sysbus devices"
thread I started ~2 weeks ago.

Building a q35 whitelist will be much easier if make
sys-bus-devices non-user-creatable by default.

-- 
Eduardo
