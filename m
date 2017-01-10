Received: by 10.25.205.13 with SMTP id d13csp274716lfg;
        Tue, 10 Jan 2017 07:06:13 -0800 (PST)
X-Received: by 10.55.149.134 with SMTP id x128mr2979614qkd.263.1484060773131;
        Tue, 10 Jan 2017 07:06:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si1526474qkl.24.2017.01.10.07.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 07:06:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQy04-0002tl-KH
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 10:06:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cQxzz-0002rb-5Q
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 10:06:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1cQxzv-0005It-TA
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 10:06:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1cQxzv-0005Il-KM; Tue, 10 Jan 2017 10:06:03 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AEB6F4DB9B;
	Tue, 10 Jan 2017 15:06:03 +0000 (UTC)
Received: from redhat.com (ovpn-118-216.rdu2.redhat.com [10.10.118.216])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id v0AF628w002632; Tue, 10 Jan 2017 10:06:02 -0500
Date: Tue, 10 Jan 2017 17:06:00 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20170110170453-mutt-send-email-mst@kernel.org>
References: <20161201170624.26496-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161201170624.26496-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 10 Jan 2017 15:06:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/7] q35: add negotiable broadcast SMI
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, "Gabriel L. Somlo" <somlo@cmu.edu>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu devel list <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8/V2brNY4LEk

On Thu, Dec 01, 2016 at 06:06:17PM +0100, Laszlo Ersek wrote:
> * This is version 4 of the series; the last version was at
>   <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg03582.html>.
> 
>   This version is practically a rewrite from scratch, seeking to address
>   the v3 feedback. Here's what the individual patches do:
> 
>   - Patch #1 rebases and extends Michael's "writeable fw_cfg blobs"
>     patch from Feb/March 2016. The changes relative to the original
>     patch are documented in the commit message (the code changes are
>     minimal).
> 
>   - Patches #2 and #3 turn the FW_CFG_FILE_SLOTS constant into a device
>     property, and expose the desired number of fw_cfg file slots to
>     board code. This is meant to address a concern raised by Paolo in
>     the v2 review
>     <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg03125.html>,
>     namely that we're about to run out of FW_CFG_FILE_SLOTS.
> 
>   - Patch #4 introduces the "pc-q35-2.9" and "pc-i440fx-2.9" machine
>     types, which are allowed to take advantage of the new default for
>     fw_cfg file slots (0x20 rather than 0x10).
> 
>   - Patch #5 introduces SMI feature negotiation via fw_cfg, with the
>     following new files:
> 
>     - etc/smi/host-features
>     - etc/smi/guest-features
>     - etc/smi/features-ok
> 
>     This is supposed to follow Michael's recommendation re: imitating
>     virtio
>     <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg03218.html>.
> 
>     The guest-features file is freely writeable by the guest (no write
>     callbacks in fw_cfg), and the feature validation & lockdown occurs
>     when the guest selects the features-ok file (for reading).
> 
>     Board code is allowed to choose the host feature bitmap to
>     advertise.
> 
>     This patch doesn't add any specific SMI features yet.
> 
>   - Patch #6 adds the ICH9_LPC_SMI_F_BROADCAST feature.
> 
>   - Patch #7 introduces the PCMachineClass.get_smi_host_features method,
>     and implements it for "pc-q35-2.9" and later. The idea is to tie the
>     SMI host features to machine types, and let the machine types
>     calculate their host features with code (i.e., not just a constant).
> 
>     In this patch, the "pc-q35-2.9" machine type exposes the
>     ICH9_LPC_SMI_F_BROADCAST feature iff (smp_cpus == max_cpus), that
>     is, when VCPU hotplug is not possible. (Also from Paolo's v3
>     feedback, in
>     <http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg04919.html>.)
> 
> * I've written the OVMF side patches too and tested them together
>   (including gdb / debug messages for "white box" testing).
> 
> * Note that this version depends on the following PULL req from Michael:
> 
>   [Qemu-devel] [PULL 0/5] virtio, vhost, pc: fixes
>   http://lists.nongnu.org/archive/html/qemu-devel/2016-11/msg05503.html
> 
>   In particular on the following patch:
>   "loader: fix handling of custom address spaces when adding ROM blobs"
> 
> Cc: "Gabriel L. Somlo" <somlo@cmu.edu>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Cc: qemu-arm@nongnu.org
> 
> Thanks
> Laszlo

So I reviewed fw cfg stuff, looks good to me. I'd prefer Paolo to review
and merge broadcast SMI stuff as appropriate.  Paolo, makes sense?


> Laszlo Ersek (6):
>   fw-cfg: turn FW_CFG_FILE_SLOTS into a device property
>   fw-cfg: expose "file_slots" parameter in fw_cfg_init_io_dma()
>   hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cfg file slots
>   hw/isa/lpc_ich9: add SMI feature negotiation via fw_cfg
>   hw/isa/lpc_ich9: add broadcast SMI feature
>   hw/i386/pc_q35: advertise broadcast SMI if VCPU hotplug is turned off
> 
> Michael S. Tsirkin (1):
>   fw-cfg: support writeable blobs
> 
>  docs/specs/fw_cfg.txt          |  36 +++++++++---
>  hw/lm32/lm32_hwsetup.h         |   2 +-
>  include/hw/compat.h            |  11 ++++
>  include/hw/i386/ich9.h         |  15 ++++-
>  include/hw/i386/pc.h           |   4 ++
>  include/hw/loader.h            |   7 ++-
>  include/hw/nvram/fw_cfg.h      |   5 +-
>  include/hw/nvram/fw_cfg_keys.h |   7 ++-
>  hw/arm/virt-acpi-build.c       |   2 +-
>  hw/core/loader.c               |  18 +++---
>  hw/i386/acpi-build.c           |   4 +-
>  hw/i386/pc.c                   |   3 +-
>  hw/i386/pc_piix.c              |  16 +++++-
>  hw/i386/pc_q35.c               |  37 ++++++++++++-
>  hw/isa/lpc_ich9.c              |  92 +++++++++++++++++++++++++++++-
>  hw/nvram/fw_cfg.c              | 123 +++++++++++++++++++++++++++++++++++------
>  16 files changed, 326 insertions(+), 56 deletions(-)
> 
> -- 
> 2.9.2
