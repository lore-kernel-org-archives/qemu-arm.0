Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1505174wru;
        Sun, 30 Jun 2019 03:21:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRzKatpygngJ9S9fikWAglypDLYAWMmzEexa5U/+W4/oHnuTx44Lve6tRnO0WVxQhyiQnw
X-Received: by 2002:a17:906:15d0:: with SMTP id l16mr17780150ejd.234.1561890107328;
        Sun, 30 Jun 2019 03:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561890107; cv=none;
        d=google.com; s=arc-20160816;
        b=v+znu8uMlfSb83I7gw/NRElYZ/Pdp4X1oa+Mmp47Hb/Mc2RG2Gm1pxmXlFOP9vEQSC
         GANUSwczbuecC7Qgzw3sllzPopzJ8Ne9Yqfstlk6AT5hFzNj8644qLFlBQjRZWYb9AYY
         e9MV7TfwvrG/ZWYkuFITAOGg5QRdxubzZl1ZGGXC51TmPS0FOh/QkUTFUth1gdnij1O4
         igOxqrglbY4N32wTnAfBS6hv3ENRzFy6YJiF5aFIheFoJ2Sd/vjXS/v89U49yBeyeEn2
         rYIxTYj2Uu3Kq/gtjnSfKetsHC35atiRoiKYDVCVpEVUSgI7oH+hQ2NcsEXG/O6QFY+q
         M+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=2UYQ3yYYDlDIP0MsyiA7Zdsuo4ukrQD2ytHAxPp6tug=;
        b=nNhswqrQkAU/9VzUKnTzqYNWQVuMFDYeRc5gFfa1IiwWbAHnTpel0dom6qh29U9JmT
         sjTMW415iydvWJ3icF6ErLLiy6ydwqEEdpzIQKnii2p408ZxVjh+Z4xQLpVMgiEMrRLB
         fnN7dwcQF8vE5mh486dAeNuyJE6K2WKJoHfu1CEUF54Xlv7Xqe4bwWZbK1Gn7u9Wlln6
         nfjxR0yNmQ4GGpurjwOpBAOb/EgcOqVzmmL1b492FHOBwJkU78e1hSjS+FOvZY6p2obF
         OSeiqZIa7bgK0t5wbcmBjIjV0U6ga2mSvPs8auX8UoABh9J6mIt8HZOMisG+DeS4vuCK
         adig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dp7n7Gl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si6825868ede.393.2019.06.30.03.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jun 2019 03:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dp7n7Gl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhWxu-0001St-Eu
	for alex.bennee@linaro.org; Sun, 30 Jun 2019 06:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hongbo.zhang@linaro.org>) id 1hhWxN-0001Sg-2D
 for qemu-arm@nongnu.org; Sun, 30 Jun 2019 06:21:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hongbo.zhang@linaro.org>) id 1hhWxL-0004CR-F3
 for qemu-arm@nongnu.org; Sun, 30 Jun 2019 06:21:12 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35779)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
 id 1hhWxL-0004Aw-8O
 for qemu-arm@nongnu.org; Sun, 30 Jun 2019 06:21:11 -0400
Received: by mail-pg1-x542.google.com with SMTP id s27so4608055pgl.2
 for <qemu-arm@nongnu.org>; Sun, 30 Jun 2019 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=2UYQ3yYYDlDIP0MsyiA7Zdsuo4ukrQD2ytHAxPp6tug=;
 b=Dp7n7Gl1mhsB89QHdQW1gMl+Mgw0Zk+x1v9rjtqU38XFdKVZNxuJpDrEitJOmWbq4M
 pIYtKAKwy5/NTB2dRxLlrD2rpDyii3sgehaU6ZASBkeKuMPnpeXcxODbxZ9vdvC5FvkX
 +S0R/8uLWe3hxKPAM/eYC8/c0x/MUUgZCAp4UkBNgUNo+xJd9GPqLZy/u4UqUE3X73YA
 yWnQ52rUkHF8LLkdhd+Z+lqHsSb8LnPJinVzm4baiEyrXOe48y3qu1CWBQPUhy8Fc9F2
 d0lIDMvv9avMzUP44jiXKqGlpcxsDT40sGGN5HYCt9+2cYuTCxloXBBRGn2yNkA67mRV
 +flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2UYQ3yYYDlDIP0MsyiA7Zdsuo4ukrQD2ytHAxPp6tug=;
 b=TNKs3GhIn8AO8+9ZIjME18uNNVzlvGPW4eDfmpyrauMv2L9djk0eTvOkX/OUi8ltFg
 /lvtz/4nKzqeV4w5n7gXodF9Xnp4KR6shp/9t29DzgIEn2lB+vFs82vkAuMvoeyu8PBX
 yn6F/5GHYboiNtrNfMHXykpgLNcb3R0rFtZKvndmYwnEyQ6RtyCn0m6JZpwKXYPMVIhR
 xyUpr0sKq7ZMaC8jbeSzF8gl3CXEoniFjPo3LES1ESZUAt/LunZ2bxANke/GD2jUWkgu
 pWiXzRIitA5i59GYai1Jh/2QVYA+qYboaq6FVvUFSw5Nwg+9i/etrcI1yidTpaiy9f0c
 pYyg==
X-Gm-Message-State: APjAAAWwyVGWh/Jmxyld0eQ9qtBoqv7mn+aa5kbg1rLR1AF5Pq3meIlG
 QTGlxeZaJSoJZ4JRvUWCVtAQHg==
X-Received: by 2002:a65:5a44:: with SMTP id z4mr5183482pgs.41.1561890068923;
 Sun, 30 Jun 2019 03:21:08 -0700 (PDT)
Received: from localhost.localdomain ([114.246.94.159])
 by smtp.gmail.com with ESMTPSA id m100sm8714549pje.12.2019.06.30.03.21.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 03:21:08 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 30 Jun 2019 18:20:32 +0800
Message-Id: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v9 0/2] Add Arm SBSA Reference Machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
 leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RhuAJ5TV5UAD

For the Aarch64, there is one machine 'virt', it is primarily meant to
run on KVM and execute virtualization workloads, but we need an
environment as faithful as possible to physical hardware,  to support
firmware and OS development for pysical Aarch64 machines.

This machine comes with:
 - Re-designed memory map.
 - CPU cortex-a57.
 - EL2 and EL3 enabled.
 - GIC version 3.
 - System bus AHCI controller.
 - System bus XHCI controller.
 - CDROM and hard disc on AHCI bus.
 - E1000E ethernet card on PCIE bus.
 - VGA display adaptor on PCIE bus.
 - Only minimal device tree nodes.
And without:
 - virtio deivces.
 - fw_cfg device.
 - ACPI tables.

Arm Trusted Firmware and UEFI porting to this are done accordingly, and
it should supply ACPI tables to load OS, the minimal device tree nodes
supplied from this platform are only to pass the dynamic info reflecting
command line input to firmware, not for loading OS.

v9 changes:
 - only a few lines update to refine the patch format, while the final
   sbsa-ref.c is kept same with v8

v8 changes:
 - rebase to latest QEMU tree
 - use new way of creating flash as in 'virt' machine
 - other minor typos and comments update

v7 changes:
 - edit memory map for PCIE slightly
 - add another secure UART which can be used for RAS and MM from EL0.

v6 changes:
 - rebased to the latest QEMU tree
 - rechecked all the header files included
 - added the newly introduced system bus EHCI controller
 - removed the machine_done callback due to commit 5614ca80
 - updated block comments styles according to checkpatch.pl
 - use Kconfig to add new file
 - use private SBSA* types defination instead of VIRT* in virt.h
   since nobody else using them so they are in the .c file instead
   of a new .h file

v5 changes:
 - removed more lines derived from virt.c
 - designed a new memory map
 - splitted former one patch into two for easier review
 - cancled previous EHCI and new HXCI coming later separately

V4 changes:
 - rebased to v3.0.0
 - removed timer, uart, rtc, *hci device tree nodes
   (others were removerd in v3)
 - other minore codes clean up, mainly unsed header files, comments etc.

V3 changes:
 - rename the platform 'sbsa-ref'
 - move all the codes to a separate file sbsa-ref.c
 - remove paravirtualized fw_cfg device
 - do not supply ACPI tables, since firmware will do it
 - supply only necessary DT nodes
 - and other minor code clean up

Hongbo Zhang (2):
  hw/arm: Add arm SBSA reference machine, skeleton part
  hw/arm: Add arm SBSA reference machine, devices part

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Kconfig                  |  16 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/sbsa-ref.c               | 806 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 824 insertions(+)
 create mode 100644 hw/arm/sbsa-ref.c

-- 
2.7.4

