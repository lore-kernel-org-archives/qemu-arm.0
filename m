Received: by 10.182.158.201 with SMTP id ww9csp320227obb;
        Mon, 16 Nov 2015 12:31:19 -0800 (PST)
X-Received: by 10.13.222.194 with SMTP id h185mr29879500ywe.39.1447705879168;
        Mon, 16 Nov 2015 12:31:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k184si7994077ywd.279.2015.11.16.12.31.19
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 12:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:48977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyQQo-00011j-DV
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 15:31:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJkl-0008S1-4b
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJki-0007Dg-IG
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:27 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJki-00079o-AI
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:24 -0500
Received: by wmww144 with SMTP id w144so118886911wmw.0
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fwaqUKrEciFKGyzwpdC4Ew58jfBN1whW69OXpn1GIZM=;
	b=utDtfm7C8bODqHmU3im0OQkZui5ZQOPD63os95Y1N3u1+FkdmUIaEsrGCck1R2qVQ3
	I4Een3aprReeRSyJ1w1ZLAxNdrxKo90gwMWVhfEGjlAbd2uwVc5CIU1L8Z1yHnxj9GEb
	5yVo05JECtkYIWdrNEw6cYxCL9rP61/6FrXqylbe8xOQv1jXdXGgaDoktPjlo8V3wFHo
	r67XXKE417bemxrWVVOVqXSwXXAyrh7ekL5+9TxJU3vhukUL/KZlkZHY6o+LGwbPYozq
	btGDDy+/HH+JbdjIbjex4c6ZS312mG7h6V/tF6mCHHxi7u8bbwPdU3pZ9VPShP/Beazt
	vg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fwaqUKrEciFKGyzwpdC4Ew58jfBN1whW69OXpn1GIZM=;
	b=FKOxpicmdvrb1uv+vhQo84zodPSEVqzolbJvMI24mcSWLKdDTSpoEPoTXxr08q94FX
	eGrQYu4/c+iOULdnXiOPhCDvEAEGX+z0XVvAV4tLaJ3aykZLqaJuYBwPJT2KStr6Sstc
	Z4kaKbucJYT8qIt5MXo88wby+d7c3PIqe0ySQb6NLfUZ6hsdFGioFDSweA8fWqkHBRER
	SP425N45HlokQjD7QqILnzGXxumPeIPm5tQYFJAy9/KPV1paVAEGX4ds2OFh8zSy/jMT
	iAHwG3Yxfn5anfGTeiipaJoriMcDcaCFDwtN7fxeTIefqobzfXJL0zxeWwWaIkXWWc2d
	NUJw==
X-Gm-Message-State: ALoCoQn92veidGxQ7bAFuie7UnKG1W/n7gFZWDQ0bsCupYw6FcLlIxMGoxGgjCV+9CJgR7lSYKcp
X-Received: by 10.194.78.15 with SMTP id x15mr41514639wjw.144.1447680202771;
	Mon, 16 Nov 2015 05:23:22 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	pn6sm30361050wjb.15.2015.11.16.05.23.19
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:23:21 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:01 +0800
Message-Id: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22d
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 0/8] Add system_powerdown support on ARM for
	ACPI and DT
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
X-TUID: hGWu8Ot/fA+Y

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI SPEC 5.0 defines GPIO-signaled ACPI Events for Hardware-reduced
platforms(like ARM). It uses GPIO pin to trigger an event to the guest.
For QEMU, here we add PL061 GPIO controller and use PIN 3 for
system_powerdown, reserving PIN 0, 1, 2 for PCI hotplug, CPU hotplug and
memory hotplug.

This patchset adds system_powerdown support on ARM through both ACPI and
DT ways. It adds a GPIO controller(here is PL061) in machine virt and
uses GPIO-singled event for ACPI while gpio-keys for DT. It can be
fetched from [1] and has been tested for the guests starting by ACPI or
DT while guests use systemd or acpid.

a) ACPI way. Since Graeme send a patchset to make ACPI on ARM64 support
amba device[2], it could use PL061 directly without modification to its
kernel driver code. In addition, we should use ACPI to start VM,
referring to below script. QEMU_EFI.fd can be fetched from [3]. 

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
/etc/acpi/powerbtn.sh and /etc/acpi/events/powerbtn. Refer to [4] for
the setup of acpid.

Thanks,
Shannon

[1] https://git.linaro.org/people/shannon.zhao/qemu.git/shortlog/refs/heads/PowerButton_v2
[2] https://lkml.org/lkml/2015/9/30/392
[3] http://people.linaro.org/~shannon.zhao/ACPI_ARM/QEMU_EFI.fd
[4] https://wiki.linaro.org/LEG/Engineering/Kernel/ACPI/GPIOPowerButton

Changes since v2:
* rebased on upstream QEMU
* adjust irq signalling for PowerButton of PATCH 7/8 (Peter Maydell)
* Add several Reviewed-bys and Tested-bys from Wei Huang, thanks!

Changes since v1:
* rewrite GPIO Connection Descriptor (Michael)

Shannon Zhao (8):
  hw/arm/virt: Add a GPIO controller
  hw/arm/virt-acpi-build: Add GPIO controller in ACPI DSDT table
  hw/arm/virt-acpi-build: Add power button device in ACPI DSDT table
  hw/acpi/aml-build: Add GPIO Connection Descriptor
  hw/acpi/aml-build: Add a wrapper for GPIO Interrupt Connection
  hw/arm/virt-acpi-build: Add _E03 for Power Button
  hw/arm/virt: Add QEMU powerdown notifier and hook it to GPIO Pin 3
  hw/arm/virt: Add gpio-keys node for Poweroff using DT

 hw/acpi/aml-build.c         | 79 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 45 ++++++++++++++++++++++++++
 hw/arm/virt.c               | 59 +++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 26 +++++++++++++++
 include/hw/arm/virt.h       |  1 +
 5 files changed, 210 insertions(+)

-- 
2.1.0

