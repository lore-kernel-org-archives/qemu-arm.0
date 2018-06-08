Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp752776wrq;
        Fri, 8 Jun 2018 04:24:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIBhMSbkR7caMrdOPISXOtZbto5JfXr31yu/KNiR3ySvin256szxl5DfzFpv+4wKQSgG/Hl
X-Received: by 2002:aed:2221:: with SMTP id n30-v6mr5584602qtc.416.1528457086434;
        Fri, 08 Jun 2018 04:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528457086; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTF6bJX/skmenWp9zcEFv+vAkn8jCJYecV7lEm0kp5+0p3P3OhRGFQf8GrLdKwKxeC
         1mmlNgY6plPORGByjNuZ4yjmKQb5VNiH5H/bNdFCKvzVGPylrVOgjWHW1QHAzQih6VKT
         2g2Ipk6C145IIO4h1xtBvJtK6+7Y/PSjrAR646893o3cFUp7SoGAP4AK0ECUfLX7dr1P
         q4r/tu/ALpYTqYA3jRVwUuu0ap9IyiBbkUyy1ehDiK1sLlFytCuC/x/LLG4jAx0XY1Y2
         w9SgvP0yl/tiUvrkz07CxS9kMBySd4s18cTvIisAGUiUMe+ML9ikyJ7z36SZVh+2dLdr
         TW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=jtcRUnEphkb3lwxWSTYoZ+sYDfkHA+eXscCqXVrK6ZI=;
        b=VzAMIAsEJmmT9eE4BePnPWl0CwpFVCaOElKfhd2XKh19Z4XzkXoPkwr0OUwIFCTYsS
         pW6gESpJJ7t7c2EpOuN24mblqtNMUR1BIAPQJQX5VJtGC0IPhKHacoXBce53e9KvkJi2
         lFXn5mmIpRGrjpRc85AHZwDhJya2ZaZDZA5HOa06cwv3yLfqG6QIjjr7SZXQEaToiTO3
         kAgT9iZxhB7Nw4S/9wnweHzDOwAsoNlygsI71l0vLIMyfZENExW/zXSUUkqB6SHF6+aC
         45lCXCTuf+mOfoIG6MA5H2t//EBsAbkAhkwu0tl4LmqqyYUnih9m/+XIMuEzCVJr0iqa
         dMwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r42-v6si496059qtc.401.2018.06.08.04.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFVe-0002vU-0C
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRH-000833-3I
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRF-0001mS-Q9
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36762 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fRFRF-0001mF-LP; Fri, 08 Jun 2018 07:20:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33E17401DEB2;
	Fri,  8 Jun 2018 11:20:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2CB71C73F;
	Fri,  8 Jun 2018 11:20:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id AE3F140DF6; Fri,  8 Jun 2018 13:20:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2018 13:19:55 +0200
Message-Id: <20180608112001.14729-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 08 Jun 2018 11:20:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 08 Jun 2018 11:20:13 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 0/6] ramfb: simple boot framebuffer,
 no legacy vga
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EvFpKWiGUFpc

  Hi,

Ok folks, here is a experimental patch series for a legacy free boot
framebuffer.  If you want play with it I recommend getting the bits from

	https://www.kraxel.org/cgit/qemu/log/?h=sirius/ramfb

because they come with an updated seabios and a new vgabios rom and an
experimental OVMF build.

Functional overview
-------------------

The boot framebuffer is expected to be configured by the firmware, so it
uses fw_cfg as interface.  Initialization goes as follows:

  (1) Check whenever etc/ramfb is present.
  (2) Allocate framebuffer from RAM.
  (3) Fill struct RAMFBCfg, write it to etc/ramfb.

Done.  You can write stuff to the framebuffer now, and it should appear
automagically on the screen.

Note that this isn't very efficient because it does a full display
update on each refresh.  No dirty tracking.  Dirty tracking would have
to be active for the whole ram slot, so that wouldn't be very efficient
either.

Firmware support -- seabios
---------------------------

seavgabios is able to emulate vga text mode on top of a framebuffer, for
coreboot native graphics initialialization.  Which works fine for
everything which writes text using the vgabios interface (basically
everyhing which works with sgabios).

So I hacked that up to work with ramfb (and, while being at it,
bochs-display too).  Right now it's proof-of-concept code with fwcfg
support being cut+paste, so it'll need cleanups before merging.
Look here:

	https://www.kraxe.org/cgit/seabios/log/?h=bochs

Firmware support -- edk2
------------------------

There is a EFI driver too.  Code is here:

	https://github.com/kraxel/edk2/commits/ramfb

Firmware blob is in pc-bios/OVMF-ramfb.fd, to be used with -bios.

So, how to play?
----------------

There is ramfb.  Standalone device.

There is virtio-ramfb.  Simliar to virtio-vga, but using ramfb instead of
adding vga compatibility.  Shows how you can wire up ramfb support to
some display device.  Unlike virtio-vga it should work fine on arm.  Use
"qemu -vga none -device virtio-ramfb" for this one.  Not clear whenever
this will be actually be merged, given that edk2 has a native virtio-gpu
driver.

There is virtio-pci-ramfb, which provides boot display support to vgpu
devices.

What works?
-----------

Both windows (x86 tested) and linux (x86 + arm tested) UEFI guests
handle the ramfb GOP just fine.

BIOS boot loaders for linux all use vgabios calls for text mode, so they
show up just fine.  Also ipxe, seabios itself of course.  So you can
boot up your linux guest.  vesafb works too.

Windows in BIOS mode doesn't use text mode and works fine too.

What doesn't work?
------------------

vgacon (direct vga hardware access).  Linux boots just fine
nevertheless, the only effect is that you don't see any boot messages
until the drm driver loads.

Known issues
------------

Handover from ramfb-backed efifb to the native linux driver is tricky.
Usually efifb gets kicked out when the native driver loads because of
overlapping ressources.  With efifb being in RAM instead of using a GPU
PCI bar this doesn't happen though, so you'll end up with two
framebuffer devices.

In case vgaarb classifies the GPU as primary display device fbcon will
switch all VTs over to the framebuffer device of the real GPU, so there
isn't a noticable difference.  Otherwise you'll end up with a
non-visible fbcon, because it continues to run on ramfb whereas qemu
switched over to the GPU because the native linux driver initialized the
display.

xorg/wayland will show up on the GPU in any case because they prefer drm
over fbdev, so they wouldn't run on efifb.

enjoy,
  Gerd

Gerd Hoffmann (6):
  hw/display: add ramfb, a simple boot framebuffer living in guest ram
  hw/display: add standalone ramfb device
  hw/display: add virtio-ramfb device
  hw/vfio/display: add ramfb support
  ramfb: enable vgabios
  bochs-display: enable vgabios

 include/hw/display/ramfb.h    |  12 ++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/arm/sysbus-fdt.c           |   7 ++
 hw/arm/virt.c                 |   2 +
 hw/display/bochs-display.c    |   1 +
 hw/display/ramfb-standalone.c |  62 ++++++++++++++++++
 hw/display/ramfb.c            |  96 +++++++++++++++++++++++++++
 hw/display/virtio-ramfb.c     | 149 ++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_piix.c             |   2 +
 hw/i386/pc_q35.c              |   2 +
 hw/vfio/display.c             |  10 +++
 hw/vfio/pci.c                 |  15 +++++
 hw/display/Makefile.objs      |   5 +-
 13 files changed, 364 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/display/ramfb.h
 create mode 100644 hw/display/ramfb-standalone.c
 create mode 100644 hw/display/ramfb.c
 create mode 100644 hw/display/virtio-ramfb.c

-- 
2.9.3

