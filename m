Received: by 10.25.159.19 with SMTP id i19csp863138lfe;
        Fri, 12 Feb 2016 06:47:02 -0800 (PST)
X-Received: by 10.140.169.9 with SMTP id p9mr2495314qhp.50.1455288422866;
        Fri, 12 Feb 2016 06:47:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u144si16058201qka.104.2016.02.12.06.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUEzu-000565-Ch
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:47:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz6-0003zv-Ns
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:46:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz5-0004ov-MY
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:46:12 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEz5-0004jw-Fg; Fri, 12 Feb 2016 09:46:11 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEyv-0007qJ-Dg; Fri, 12 Feb 2016 14:46:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 14:45:57 +0000
Message-Id: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-devel] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TCBRMfQchy+7

This patchset adds some more secure-only devices to the virt board:
 (1) a 16MB secure-only RAM
 (2) the first flash device is secure-only

The second of these is strictly speaking a breaking change, but I don't
expect it in practice to break anybody:
 (a) there's not much use of the secure support in virt yet
 (b) anything booting a rom image from that flash if TZ is enabled
  will be booting it in Secure mode anyway so will be able to access
  the code -- the only thing that would stop working would be if the
  guest flipped to NS and still expected to be able to access the flash

The second flash device remains NS-accessible (with the expectation that
it will be used for NS UEFI environment variable storage).

In particular, the ATF+OPTEE+UEFI+Linux stack still works fine with
these changes.


NOTE: to get the -bios option to correctly load to the secure-only
flash I had to implement a new function in loader.c. load_image_mr()
is just like load_image_targphys() except that it requests loading
to a MemoryRegion rather than a physaddr. I think we can also use this
to clean up the Sparc cg3 and tcx display devices, which currently take
a qdev property which is "the address I'm going to be mapped at"
purely so they can use load_image_targphys() to load their ROMs.

I have to say I found the loader.c code a bit confusing (it has some
support for "load image to MR" already, but it seems to be tangled
up with the fw_cfg and PC option rom support); review of that
patch in particular appreciated.

thanks
-- PMM

Peter Maydell (4):
  hw/arm/virt: Provide a secure-only RAM if booting in Secure mode
  loader: Add load_image_mr() to load ROM image to a MemoryRegion
  hw/arm/virt: Load bios image to MemoryRegion, not physaddr
  hw/arm/virt: Make first flash device Secure-only if booting secure

 hw/arm/virt.c         | 118 ++++++++++++++++++++++++++++++++++++++------------
 hw/core/loader.c      |  35 +++++++++++++--
 include/hw/arm/virt.h |   1 +
 include/hw/loader.h   |  18 +++++++-
 4 files changed, 138 insertions(+), 34 deletions(-)

-- 
1.9.1

