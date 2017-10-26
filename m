Received: by 10.223.161.27 with SMTP id o27csp784401wro;
        Thu, 26 Oct 2017 07:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QEbw87xLWMjZfM2fIe2e+zEOv2qsVPgRArMARc46icPj6XwU5GpnQM1ONM09SlxC5+Y5Sx
X-Received: by 10.13.201.66 with SMTP id l63mr6648779ywd.83.1509028894927;
        Thu, 26 Oct 2017 07:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509028894; cv=none;
        d=google.com; s=arc-20160816;
        b=tK3xS8L7S+ZSH0ZiJMSKpPUlDyTExEBBozqgCdy44omSKhY5QXhHOidCz9ZFVB7fBG
         GdSJMqLXg77kP7xCk9YAaMaCF5rOV53Qm3uVJEwCBCIE1HtJIYobh/Ov1HM/hDXJA6Zt
         dfteabNW7stQszaAWQnHFWeABtAsbQbntjDcZwPHxe49VuhouZBiLudIEGmlfjC3QiKX
         Aq24foLZ5Ig7jfQrEFABiLHq8jWkBnyWm3Dwa2IJrSS764LWpeQDee5Hv2oQRCuxLrGj
         HGI9pi7xqo8kOEs9HAN6bez6NYFZYM/+mmmQpk1UxXI9EeV+WjJCQDfH2ztdthrvey8s
         IWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=p5HXCrJU58GAHyGs0SeOJC+6JyYKJxgJg3wsV9BlzyM=;
        b=O25kux89vPUK1BZD4FLfhRw/Wrsfxav8Dts8HBlFXMN5JM/J/IlXYHDUulhaM7HLQ2
         ifSy9do0HOruL6bPITtIonaLoczoApsYjfdiR44IJBhZMcIWNhduEjDIgYUkDRFitOdD
         3Rpg290rXL8yIqUUNjmd4NSNuPIDimQfttA80Wt7XRn//ge0lxS1hoGAyb6CLYVYzDP6
         mP0/E2yMhICoBpGvOLjpgOz8y0IMuuB/EEKQ3tLRlZvC8jVGHdROyUXhW1d6a2gvuhDH
         nfmn0hXxMDWTk81wNY5iwrAECK60NDwJ2EqvGn3kcy32S3l4R7FP/OvuTirkHBTCcskF
         0LuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HsP8oWur;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o66si854986ywd.712.2017.10.26.07.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 07:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HsP8oWur;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7jLi-0000mj-8g
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 10:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIw-0007Gv-EO
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIs-0007dG-AE
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:42 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:45568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e7jIs-0007cU-3j; Thu, 26 Oct 2017 10:38:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id f199so4547043qke.2;
	Thu, 26 Oct 2017 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p5HXCrJU58GAHyGs0SeOJC+6JyYKJxgJg3wsV9BlzyM=;
	b=HsP8oWurUcjnTlIVnlu4F34OqcbOAnOMCueMAVYlwr+f4D6lw4QgXRI09EA5zNpvWH
	ZWsGrecacGk1IwC1dLsLP0NfvWHWMf5owp3Fpc5v+CEDmNbplHXooe+KDdFLUa9iMb4P
	9/IXkTtupRctl+PwAu1AbtHu7Zv6uVKr0jYTfrc6LOqrRZeN6BrK3Ogr1kX+qUltIequ
	XYSBIfNJZvcCGjMfSNcXFDWJpox/PbZd/+62WA4xWxLxDzVNrpNOvchqUBK7pjxUhFo7
	BUJdfMqY7TmTcxqsKgAGwFbvRgfg4SCbpfhBoQAZmgjFTgfRsF1QwhmBwruoHuITk9NU
	ff6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p5HXCrJU58GAHyGs0SeOJC+6JyYKJxgJg3wsV9BlzyM=;
	b=uOrphjlCjv3GXxcrgDlmfd3oXrefevnrnFCC8pvs+9lst1o1Jvmnp4dGKKoUhEERBc
	Ewcow5hu5tL24NEAhhX3/YCgoojUrBkGa564jKdGgom/sMsrSEttz0JA1wLpuU1fEx6Q
	f2A5Bcz48Upa9613GhszZB+26oumrqTNpY+cQ5acEl7mGnmMSNdOY40ggjqiaJGnx1R+
	673np8yfxWhz5tGInyIPg4th0dDwifwrw7NeKG6UFDOK9wxT6ZmhLsToBtd0LdxplOJS
	IX8ITEU3ZrP9LmRpxAnLQRuqInJgmFF6SmeE//KbBXrd2RSqxK9roStXPdnCviYfsItr
	X8tg==
X-Gm-Message-State: AMCzsaW6LbRHf+76jv5U8x62QTnva++NhKugE++65gid4JB6jkakhfRj
	/mCOOFbah0jR+tuB2FyKjqdcY9yy
X-Received: by 10.55.214.199 with SMTP id p68mr2828640qkl.21.1509028716984;
	Thu, 26 Oct 2017 07:38:36 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	l126sm3352746qkf.96.2017.10.26.07.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Oct 2017 07:38:36 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Thu, 26 Oct 2017 06:34:07 -0400
Message-Id: <1509014053-28134-1-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v5 0/5]arm: kinetis_k64
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7urApwtYpwc/

From: Gabriel Augusto Costa <gabriel291075@gmail.com>

Hi everyone,

I made a new arm machine with some peripherals.
The machine is mk64fn1m0, a cortex-m4 microcontroller from NXP Kinetis family.
I have prepared a series of patchs to include this machine:

PATCH v5 n/5: It adds the machine and peripherals devices;
PATCH v6: It changes the Makes files to compile this machine.

This machine has been created based on K64P144M120SF5RM.pdf, stellaris and
stm32f205 machines, and reading the code of the other devices. Also, the
comments from community and special thanks to Peter Maydell, Philippe
Mathieu-Daude and Eric Blake.

The initial propose of this machine is execute a simple example, only
with UART0 in polling mode, and gradually adding other devices/peripherals to
this machine to allow execute an operating system like FreeRTOS or MQX.
Next step:
	-Execute an example of UART0 working with interruption.
	-Add a timer with interruption.

The code to test can be generated using MCUXpresso IDE v10.0.2_411, with the
option "Import SDK Examples", selecting "frdmk64f" family, driver_examples,
uart, polling.
The binary file generated is frdmk64f_driver_examples_uart_polling.axf and
can be executed in QEmu with this patch using the following command:
$qemu-system-arm -M mk64fn1m0 -kernel frdmk64f_driver_examples_uart_polling.axf
obs: I can send the file if someone want to test!

History:

PATCH V1: First try. Many errors, the patch is long with code style
	issues, change the files to executable. 
PATCH V2: the same mistakes.

PATCH V3: The patch was splitted in series of patch, without code style
 errors. I receive some tips about QEmu functions and others tips.
PATCH V4: Not send.
	
regards,

Gabriel Augusto Costa (6):
  arm: kinetis_k64_mcg
  arm: kinetis_k64_pmux
  arm: kinetis_k64_system.c
  arm: kinetis_k64_uart
  arm: mk64fn1m0
  arm: Added kinetis k64 platform

 default-configs/arm-softmmu.mak      |   1 +
 hw/arm/Makefile.objs                 |   1 +
 hw/arm/mk64fn1m0.c                   | 136 ++++++++++++++
 hw/char/Makefile.objs                |   1 +
 hw/char/kinetis_k64_uart.c           | 342 +++++++++++++++++++++++++++++++++++
 hw/misc/Makefile.objs                |   3 +
 hw/misc/kinetis_k64_mcg.c            | 208 +++++++++++++++++++++
 hw/misc/kinetis_k64_pmux.c           | 159 ++++++++++++++++
 hw/misc/kinetis_k64_system.c         | 274 ++++++++++++++++++++++++++++
 include/hw/char/kinetis_k64_uart.h   |  79 ++++++++
 include/hw/misc/kinetis_k64_mcg.h    |  43 +++++
 include/hw/misc/kinetis_k64_pmux.h   |  38 ++++
 include/hw/misc/kinetis_k64_system.h |  52 ++++++
 13 files changed, 1337 insertions(+)
 mode change 100644 => 100755 default-configs/arm-softmmu.mak
 mode change 100644 => 100755 hw/arm/Makefile.objs
 create mode 100755 hw/arm/mk64fn1m0.c
 mode change 100644 => 100755 hw/char/Makefile.objs
 create mode 100755 hw/char/kinetis_k64_uart.c
 mode change 100644 => 100755 hw/misc/Makefile.objs
 create mode 100755 hw/misc/kinetis_k64_mcg.c
 create mode 100755 hw/misc/kinetis_k64_pmux.c
 create mode 100755 hw/misc/kinetis_k64_system.c
 create mode 100755 include/hw/char/kinetis_k64_uart.h
 create mode 100755 include/hw/misc/kinetis_k64_mcg.h
 create mode 100755 include/hw/misc/kinetis_k64_pmux.h
 create mode 100755 include/hw/misc/kinetis_k64_system.h

-- 
2.1.4

