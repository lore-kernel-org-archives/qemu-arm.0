Received: by 10.182.158.201 with SMTP id ww9csp2141857obb;
        Sun, 6 Dec 2015 23:40:35 -0800 (PST)
X-Received: by 10.55.79.207 with SMTP id d198mr33347858qkb.49.1449474033265;
        Sun, 06 Dec 2015 23:40:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si19506976qhw.121.2015.12.06.23.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:40:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qPQ-0001j9-Ur
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:40:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPM-0001Xz-Pv
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPJ-0004Lj-G7
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:28 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:51620)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qPI-0004L0-Pc; Mon, 07 Dec 2015 02:40:25 -0500
Received: from 172.24.1.49 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAJ28140; Mon, 07 Dec 2015 15:40:13 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:44 +0800
Message-ID: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.566537DE.0032, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ee47cec68a47fce98186407b86571ce6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 0/8] Add system_powerdown support on ARM for
	ACPI and DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9m2Y71gm0YQ3

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI SPEC 5.0 defines GPIO-signaled ACPI Events for Hardware-reduced
platforms(like ARM). It uses GPIO pin to trigger an event to the guest.
For QEMU, here we add PL061 GPIO controller and use PIN 3 for
system_powerdown, reserving PIN 0, 1, 2 for PCI hotplug, CPU hotplug and
memory hotplug.

This patchset adds system_powerdown support on ARM through both ACPI and
DT ways. It adds a GPIO controller(here is PL061) in machine virt and
uses GPIO-singled event for ACPI while gpio-keys for DT. It has been
tested for the guests starting by ACPI or DT while guests use systemd or
acpid.

a) ACPI way. Since Graeme send a patchset to make ACPI on ARM64 support
amba device[1], it could use PL061 directly without modification to its
kernel driver code. In addition, we should use ACPI to start VM,
referring to below script. QEMU_EFI.fd can be fetched from [2]. 

    qemu-system-aarch64 \
    -smp 1 -m 1024 -M virt \
    -cpu cortex-a57 -nographic \
    -monitor telnet::4444,server,nowait \
    -bios QEMU_EFI.fd \
    -kernel Image \
    -initrd guestfs.cpio.gz \
    -append "rdinit=/sbin/init console=ttyAMA0 mem=512M root=/dev/ram 
earlycon=pl011,0x9000000 rw acpi=force"

b) DT way. Start vm as usual.

    qemu-system-aarch64 \
    -smp 1 -m 1024 -M virt \
    -cpu cortex-a57 -nographic \
    -monitor telnet::4444,server,nowait \
    -kernel Image \
    -initrd guestfs.cpio.gz \
    -append "rdinit=/sbin/init console=ttyAMA0 mem=512M root=/dev/ram 
earlycon=pl011,0x9000000 rw"

Guest internal setup:
If your guest FS uses systemd, you should check file
/lib/udev/rules.d/70-power-switch.rules and add the following line in it
if it doesn't exist.

SUBSYSTEM=="input", KERNEL=="event*", SUBSYSTEMS=="platform",
ATTRS{keys}=="116", TAG+="power-switch"

If your guest FS uses acpid, you should check it has
/etc/acpi/powerbtn.sh and /etc/acpi/events/powerbtn. Refer to [3] for
the setup of acpid.

Thanks,
Shannon

[1] https://lkml.org/lkml/2015/9/30/392
[2] http://people.linaro.org/~shannon.zhao/ACPI_ARM/QEMU_EFI.fd
[3] https://wiki.linaro.org/LEG/Engineering/Kernel/ACPI/GPIOPowerButton

Changes since v3:
* address Igor's comments on ACPI part
* drop "autorepeat" for /gpio-keys

Changes since v2:
* rebased on upstream QEMU
* adjust irq signalling for PowerButton of PATCH 7/8 (Peter Maydell)
* Add several Reviewed-bys and Tested-bys from Wei Huang, thanks!

Changes since v1:
* rewrite GPIO Connection Descriptor (Michael)

Shannon Zhao (8):
  ARM: Virt: Add a GPIO controller
  ARM: ACPI: Add GPIO controller in ACPI DSDT table
  ARM: ACPI: Add power button device in ACPI DSDT table
  ACPI: Add GPIO Connection Descriptor
  ACPI: Add aml_gpio_int() wrapper for GPIO Interrupt Connection
  ARM: ACPI: Add _E03 for Power Button
  ARM: Virt: Add QEMU powerdown notifier and hook it to GPIO Pin 3
  ARM: Virt: Add gpio-keys node for Poweroff using DT

 hw/acpi/aml-build.c         | 88 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 44 +++++++++++++++++++++++
 hw/arm/virt.c               | 60 +++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 27 ++++++++++++++
 include/hw/arm/virt.h       |  1 +
 5 files changed, 220 insertions(+)

-- 
2.0.4


