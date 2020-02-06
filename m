Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp809686lfp;
        Wed, 5 Feb 2020 17:18:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4vz/Zv1ZCPgAUXZbYqjQTp/NsDyQtr2z1jukCxO+wrlwRRnCIKVBFAn4go5GsutsiW/NB
X-Received: by 2002:a37:9e12:: with SMTP id h18mr452490qke.420.1580951905005;
        Wed, 05 Feb 2020 17:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580951905; cv=none;
        d=google.com; s=arc-20160816;
        b=fuTuioUQ9FfAKVFrAOlWnT99gfts0uRh9HbWnvrdxlwX7MGjiW7xykyW8gyU2LqbGP
         AWxsjoTC3ZdfM+1JeOVHPSwIeDXcRxx24AGsR8YDvAvV7LCrQ/alCMvdojmSoZtmdILs
         TWq982AhAEjIg0j3hyDFIO018xxxqUtPP2L+VqG2K9iTHliPkjQ/9eTMxbUWnVdn3WSv
         a9UTGVJEkn+Xwq+/hHJaAyLl72LtIltkGSfqGluX9jJ8RXOiRiUsSCq1zK3HdYBxvhib
         6ERkuD3gtmi6zX/gea5ZX95cZ2jNB8BLMmeQOB0cFyxV5p3CQm1eWVsaRzjhVUos0ltw
         faFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=z1xR+0C5iuS2wN0NuNjbYnlECeDv4TSFHvruaFSgWQ8=;
        b=UtOPI+1ElakOClQHMYVXhLXTVsUtXCKFHr17Z0UiYsgTGsna7n4szmv/Yx4WbBKS8x
         IKfeSYfFFJC636yIDKy2kRCZhPV/xr8kwY5dpZYCJrj/FgTHLqaqOX7gpjwa71gpHdvE
         6pegYA8DVlOPYQSzDcyPqhjSwWzSr91hkZJ4TRae5v4SUPmxhOg81+hFVD0qD4FVqu5B
         Mp1mDeiZih7QcqvJR2qKoMvo9RFfn4SB538X7zKf7rsMVCT24XuU2P8Igq5rCIBzqb9j
         6gUqCNVumzkwXB0TsPRke/ZSW9DhVrV2u57cxacey202MtmGy2+JC84dlbSySzvn/42V
         6JqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rCCx5r18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y138si834660qkb.319.2020.02.05.17.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:18:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rCCx5r18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVoG-0000CJ-Cz
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo2-00007f-6V
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo0-0001eT-Ta
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:10 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43363)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVnt-00014z-Pn; Wed, 05 Feb 2020 20:18:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id z9so5097032wrs.10;
 Wed, 05 Feb 2020 17:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1xR+0C5iuS2wN0NuNjbYnlECeDv4TSFHvruaFSgWQ8=;
 b=rCCx5r18dNcTT2f6Jbau+M/SsPO+FkV0V3R2FgN1AKZzWzD7RruZRXAnlOAbUfwxoi
 3IbD4WoEG6NmV1JrW7yWjYp+tXRlSqAW1jPjZq9x8rerqah3+Rsg8rMu97NBEn0KqUoX
 BdGFNg0Q872sEGINoX8n3egtPS7f+dikGQO8zPwssILGaMFaSC1JVkCV5AFsCCQ5KpZH
 EBn+VQcWOzlOjKETMCGMWtzV73lyD1C10lqK+CRQvnzC0L/IhN+h7bagfZzKruicxO+x
 BOs3jnReB7Um/9jyextxigsmjMAMWkgkYmyEPCWTj8/JplMrfbwRPA+K/x37YuMI/mwY
 XLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z1xR+0C5iuS2wN0NuNjbYnlECeDv4TSFHvruaFSgWQ8=;
 b=ksDKChMD7IfSKi5GBZx67mien/onaUnYw8vdpgClQ4ZC2jiXUKgiFqTKvKHHn7ET4/
 9fGkb38lD9j4UD1ptDzqicynFgopURm243+UTZ6Sd9nZaChHkDrwW1xchEZVHFYZASPP
 i2Jqr3iyeM5BlbMYINVfKoEcX3eUZetIiTaD5DjfmKsFEONr8VV5x0GD6qh4MHIq2hWq
 WYkksMJoNxqfOx+ZQqA2tKayR/ViDrp1iCAj/d08ZVRkcoCdVWSSpHGkefAellqnZAtS
 WmsQM6bQuC1K7/ltcdR1vSqwDh+PVJdsTe/gzT2e4trsy0gYAOT2hvWfr52juRIpfC7S
 Ol5Q==
X-Gm-Message-State: APjAAAVdb5UhZrTjFxWHo+mDGujX/9xKMDDFa4SOIGm0T4IkuqrwE6fw
 6aDuiCCLAq0VG8xi67yV4Mo0BheD
X-Received: by 2002:adf:e692:: with SMTP id r18mr305949wrm.413.1580951880165; 
 Wed, 05 Feb 2020 17:18:00 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:17:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] hw/arm/raspi: Dynamically create machines based on
 the board revision
Date: Thu,  6 Feb 2020 02:17:26 +0100
Message-Id: <20200206011756.2413-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5bhFusExjJiQ

Hi,

These patches simplify adding the raspi0/raspi1/raspi4 boards.

Igor has been working in his "refactor main RAM allocation to use
hostmem backend" series, and now v4 [1] is almost reviewed.

His raspi patch [2] clashes with my work, Since it is easier for
him to apply his on top of mine, I am sending these patches first.

Only the 4 first patches matter regarding Igor's refactor, to
include "Extract the RAM size from the board revision" which
should solve the problem he has to fix in [2].

I finally finished the SoC code, so can add the raspi0/1.
Avocado tests also include to demostrate the boards work.
I will probably move the raspi tests out of boot_linux_console.py,
but that is another series.

Latest patches NOTFORMERGE are mostly to justify this refactor,
like the raspi0 and 1, it is easy to add a new soc/board.
However other bcm peripherals patches need to get merged first
(on the list but old so I need to rebase/repost them).

Please review, at least up to patch 21 (before the tests).

Phil.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675738.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675752.html
Supersedes: <20200203082619.7426-1-f4bug@amsat.org>
https://www.mail-archive.com/qemu-devel@nongnu.org/msg676154.html

Philippe Mathieu-Daudé (30):
  hw/arm/raspi: Use BCM2708 machine type with pre Device Tree kernels
  hw/arm/raspi: Correct the board descriptions
  hw/arm/raspi: Extract the version from the board revision
  hw/arm/raspi: Extract the RAM size from the board revision
  hw/arm/raspi: Extract the processor type from the board revision
  hw/arm/raspi: Trivial code movement
  hw/arm/raspi: Make machines children of abstract RaspiMachineClass
  hw/arm/raspi: Make board_rev a field of RaspiMachineClass
  hw/arm/raspi: Let class_init() directly call raspi_machine_init()
  hw/arm/raspi: Set default RAM size to size encoded in board revision
  hw/arm/raspi: Extract the board model from the board revision
  hw/arm/raspi: Use a unique raspi_machine_class_init() method
  hw/arm/raspi: Extract the cores count from the board revision
  hw/arm/bcm2836: Restrict BCM283XClass declaration to C source
  hw/arm/bcm2836: QOM'ify more by adding class_init() to each SoC type
  hw/arm/bcm2836: Introduce BCM283XClass::core_count
  hw/arm/bcm2836: Only provide "enabled-cpus" property to multicore SoCs
  hw/arm/bcm2836: Split out common realize() code
  hw/arm/bcm2836: Introduce the BCM2835 SoC
  hw/arm/raspi: Add the Raspberry Pi Zero machine
  hw/arm/raspi: Add the Raspberry Pi B+ machine
  tests/acceptance/boot_linux_console: Use raspi console model as key
  tests/acceptance/boot_linux_console: Add raspi version=2 parameter
  tests/acceptance/boot_linux_console: Test the raspi1 console
  tests/acceptance/boot_linux_console: Test the raspi0 console
  python/qemu/machine: Allow to use other serial consoles than default
  tests/acceptance/boot_linux_console: Test the raspi1 AUX console
  tests/acceptance: Count Raspberry Pi logos displayed on framebuffer
  hw/arm/bcm2836: Add the ARMv8 BCM2838
  hw/arm/raspi: Add the Raspberry Pi 4

 include/hw/arm/bcm2836.h               |  16 +-
 hw/arm/bcm2836.c                       | 396 +++++++++++++++++++++----
 hw/arm/raspi.c                         | 204 ++++++++++---
 python/qemu/machine.py                 |  10 +-
 tests/acceptance/boot_linux_console.py | 154 +++++++++-
 5 files changed, 645 insertions(+), 135 deletions(-)

-- 
2.21.1

