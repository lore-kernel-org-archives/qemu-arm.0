Received: by 10.28.71.27 with SMTP id u27csp1205147wma;
        Fri, 9 Feb 2018 09:42:26 -0800 (PST)
X-Google-Smtp-Source: AH8x2268oVt6xnN+rSuQxuCPEuQsJAIUwrqRw1bvBxAEHhMSL0aBBmQBkuqRi0tV70tg3VYtF2ZU
X-Received: by 10.37.88.193 with SMTP id m184mr2314789ybb.515.1518198146831;
        Fri, 09 Feb 2018 09:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518198146; cv=none;
        d=google.com; s=arc-20160816;
        b=NlUBHtIOzy3gtqoUxaTeLdI0Tp1PYJreC2jtb/ifURfMJgvn+Zp5eU3fdHwEQZSaYe
         gcH8xdcbBHlHO2QcYvG6gPdmXhvr9VoIxWQNXMoxZDWNMZGJOHStv6TDWCFyIOO/t8Lh
         xwvmUbzw5lP6Th9lKdR+vOsfpxs63dxMEEbyRIxgDq4R755etsbvQGhTbKb+R2CGBgKa
         xnq6KOBIPGQkt512RxjOJ96dsBgcn2GV14GKwHfwYWDQE6nMPWGWvcn4Yk+cTNyJREhn
         a1F1sQLLRk8IatS70cCoXu3mj/CC6VbS0lFAFlww7impdguf2tKdrPcQHL5J+CXkEhqs
         ISwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=I1wVHUMJWDPCb7Yt5b5TcLj1ylNEwvLOq9MDwl9hnJQ=;
        b=Lwg6qD3apshY8cjBtZzmO0e2j0cq5owJDMIqew4pMrBzJUBGwzg+wdWthCHicS+v+Z
         /KWROm+837cp/MtvcjcdrcnNdlwLeRyhkTEZKDHvYzrb+FWGqtEalJPCek+3XeLCr8s0
         D3tcDa3M5Hm4rqQi9GTt7YXt9W2VJozdiOnebpg4ujq39gbHuh5KKWF2ZTzxmhIa/wJw
         xEmpKccSBKmGeil7dFVwbLHHDY7xNyJu37SL4rNidMzURX8J+TRh4KpLgHwoPOCcWczS
         Mil27hbXhi/EdD65b2cGBsZmm1wiEuomrYmhFa/FssPK8CKJeuPFwiadfiYx9cFTGi5E
         fsCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16si197805ywg.537.2018.02.09.09.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekCgs-00052j-7J
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:42:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBHl-0002lO-38
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:12:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1ekBHh-00052D-Tr
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:12:25 -0500
Received: from newton.telenet-ops.be ([2a02:1800:120:4::f00:d]:60312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1ekBHh-00051Z-M6
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:12:21 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
	[IPv6:2a02:1800:120:4::f00:14])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 3zdJwf1tcPzMqgCb
	for <qemu-arm@nongnu.org>; Fri,  9 Feb 2018 16:32:50 +0100 (CET)
Received: from ayla.of.borg ([84.194.111.163])
	by xavier.telenet-ops.be with bizsmtp
	id 8fHm1x02u3XaVaC01fHmhG; Fri, 09 Feb 2018 16:17:50 +0100
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0003Rs-M9; Fri, 09 Feb 2018 16:17:46 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1ekAQs-0000lB-LL; Fri, 09 Feb 2018 16:17:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Fri,  9 Feb 2018 16:17:31 +0100
Message-Id: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a02:1800:120:4::f00:d
X-Mailman-Approved-At: Fri, 09 Feb 2018 12:38:06 -0500
Subject: [Qemu-arm] [PATCH/RFC 0/5] R-Car Gen3 GPIO Pass-Through Prototype
 (QEMU)
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQ6+6iWGYoHx

	Hi all,

This RFC patch series is the QEMU side of a GPIO Pass-Through prototype
for Renesas R-Car platforms using vfio-platform.  Together with its
counterpart for Linux, it provides direct access from a QEMU+KVM guest
to a GPIO controller in an R-Car Gen3 SoC.  This allows the guest to
control the LEDs on a Renesas Salvator-X(S) board.

This patch series is not meant to be upstreamed as-is.  Indeed, for
various reasons (e.g. security, as the different GPIOs on the same GPIO
controller may control different parts of the system) access to GPIOs is
better not implemented using Device Pass-Through, but by
paravirtualization.  Yet, this is still a simple and valuable
proof-of-concept, which can serve as a basis for the future development
of Pass-Through support for more complex platform devices on R-Car Gen3
SoCs.

  - Patches 1-2 (submitted before by Eric Auger) make the vfio-platform
    device non-abstract, incl. matching using a compatible string.
  - Patch 3 allows dynamic sysbus devices again, without needing to
    create device-specific vfio types for each and every new device.
  - Patch 4 (submitted before by Xiao Feng Ren) adds support for the
    VFIO No-IOMMU mode, which was added to Linux two years ago (in
    v4.4).
  - Patch 5 adds code to instantiate device nodes for Renesas R-Car Gen3
    GPIO controllers.

Several questions and TODOs are appended to the individual patches.

Please see https://elinux.org/R-Car/Virtualization/VFIO for full usage
instructions of this prototype.

Thanks for your comments!

Auger Eric (2):
  vfio/platform: make the vfio-platform device non abstract
  hw/arm/sysbus-fdt: Allow device matching with compat string

Geert Uytterhoeven (2):
  hw/arm/virt: Allow dynamic sysbus devices again
  hw/arm/sysbus-fdt: Enable rcar-gen3-gpio dynamic instatiation

Xiao Feng Ren (1):
  vfio: No-IOMMU mode support

 hw/arm/sysbus-fdt.c             | 108 +++++++++++++++++++++++++++++++++++-----
 hw/arm/virt.c                   |   1 +
 hw/vfio/common.c                |  61 ++++++++++++++++++-----
 hw/vfio/platform.c              |  20 +++++++-
 include/hw/vfio/vfio-common.h   |   2 +
 include/hw/vfio/vfio-platform.h |   2 +
 6 files changed, 166 insertions(+), 28 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
