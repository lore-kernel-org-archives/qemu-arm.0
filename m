Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp678920lfb;
        Fri, 15 May 2020 10:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz4f2hoFWQyldg9QXdbPHELoeHrzNr1ISxiWW60s+0CPawwN9whOL8bUaGOeRao8TB7FH9
X-Received: by 2002:a25:97c1:: with SMTP id j1mr6414827ybo.285.1589562496550;
        Fri, 15 May 2020 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562496; cv=none;
        d=google.com; s=arc-20160816;
        b=lYXNUDcHqCvpz0wEO8ezLbjnqUr6BNYOuvg8Num4iJQM/pz3b1wQX06+qgu96CTFxZ
         R9n2BxeVBI/zFMwLOwK1W7/ig1QzQwW9NDbYeWahrK4b32RUZHYmwdWKQhlL+B8zlDok
         xeFkHaEQ+VC+n+5GJ691XuyTJqIpWBOMraumfGax8u89Dhgzz/19ITN9p7Y2FIT9tH6z
         HXb7n2nPP4pWg1Al6rimN6R20sMOLXrfdbMEz9z0YrO1kXSBjDRQrkd0Ity4c3m0qEy0
         Jw0/ASUdg7tYZdRiCaA7WvbKchXQPePUGc7akIWDSC+5n3NB12IPnpjVNfyNRUxwSa5q
         flww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=26OkB+i/ad5joz/5qpHRwJv+k150oIYD4QiuOyitRcA=;
        b=SpjpKUSe1uvIauVDRwS8OoN9B55rqejVKblN0w6FsUvVvFFWe+/5FO8MSnU07+AJfu
         VG/Yt8Yoz2ngtVCg++UlODJmK2jEDBzTlojxGQBfnG5HAkjEmJgnhz/VoSEyo59a0laI
         9Dqu1y7Ab0nkWO0QmlApa3oSUg34HK6UwIXmyHPWxWvjfYj0t1Hm5fgAZZI+l5F6K7bQ
         R8sOlohT0WXVfkg1Lbw8s1kPDO7nw73YEXnVXnLm4w7QHcqh5GXwCuwAi2HSKKCe/fAb
         WSi2gxjldYbNbbL6U2LoDAMpZvBV79Y+isJv7mnyWEL9Wx4kIhrkglCsXxHG+It9HTEn
         7gvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bAig/OlK";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 66si1998274ybo.471.2020.05.15.10.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bAig/OlK";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=26OkB+i/ad5joz/5qpHRwJv+k150oIYD4QiuOyitRcA=;
	b=bAig/OlKldFd8oTQu5ujka9GAi8QrQGb2l6gkKIqvwW0dpeUL783RDJgVbnQQm4zCcNiOw
	LprLL2TvRjuywS1C1gHQ4mqL+aspA2SZxzO1K3dP5ZZ/1Vh+Ngo+AwPO5yMJPC9AbZEx2/
	5MidLb6jrJpzHXT5j8G/DJL/iu4LsH0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-BWgVlIAsNpOXODAu-ISZhQ-1; Fri, 15 May 2020 13:08:09 -0400
X-MC-Unique: BWgVlIAsNpOXODAu-ISZhQ-1
Received: by mail-wr1-f70.google.com with SMTP id h12so1469053wrr.19
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=26OkB+i/ad5joz/5qpHRwJv+k150oIYD4QiuOyitRcA=;
        b=tE/aYxiR/t2xgrUyllv65OE5fX+uykwT718AEcOQ3X5GWV7mflryF0XQkijGQFgH1p
         fT9/oYZ/EFa1Lur0ELsBm6StIxoFZOiTYlYrnWLPB3mfYIVF32C2fGfkpkkdbByOuvno
         M5PokotTndh8eTLz4wsOzkAX3plCfb15fsgikLcDieRDX0ZH+hph3m3mAsbJs4Syda7k
         mypfp+OcAmpng0o3o385/cSXj0icNBhIupGny+3SVXr72pHD6nGKQXBevPY8RiPp5wom
         fm2bGcf7ZTsL1DwTVcclKCN+rNlVHk6JKA75Hob7pArVF53oNwEb/HW6rVwBwGlS/uaB
         OvbA==
X-Gm-Message-State: AOAM533LDSekLajDeU/TrOp7MZvfbd3ZaZzKJNujcjEvQPbvf3/CZ+VQ
	xqUU5g/VNovAdOn3PMJBuSN+mxGJ0rJe7nZ3Pua9piajtK2Tj6v/5in3qovaN+uebeqO6FZDz3p
	X2/Jb+W08tSIpXlmO
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr5184230wrp.163.1589562487166;
        Fri, 15 May 2020 10:08:07 -0700 (PDT)
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr5184202wrp.163.1589562486916;
        Fri, 15 May 2020 10:08:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id g24sm4763681wrb.35.2020.05.15.10.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 00/10] accel: Allow targets to use Kconfig, disable semihosting by default
Date: Fri, 15 May 2020 19:07:54 +0200
Message-Id: <20200515170804.5707-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: RZTEyBMVbKs6

This series include generic patches I took of the KVM/ARM
specific series which will follow.

- List orphan accelerators in MAINTAINERS
- Add accel/Kconfig
- Allow targets to use their how Kconfig
- Enforce semihosting on architecture where required,
  disable it elsewhere

Since v1:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
- Drop HVF MAINTAINERS patch (merged elsewhere)
- Kconfig-select SEMIHOSTING (bonzini)
- Drop user-mode selection patches
- consider m68k/nios2/xtensa/riscv (pm215)
- reword Kconfig SEMIHOSTING description (pm215)
- reset some of rth R-b tags

Previous RFC for semihosting posted earlier:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg631218.html

$ git backport-diff -u v1 -r v2
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/10:[----] [--] 'MAINTAINERS: Fix KVM path expansion glob'
002/10:[----] [-C] 'MAINTAINERS: Add an 'overall' entry for accelerators'
003/10:[----] [-C] 'MAINTAINERS: Add an entry for the HAX accelerator'
004/10:[down] 'accel/tcg: Add stub for probe_access()'
005/10:[down] 'Makefile: Remove dangerous EOL trailing backslash'
006/10:[0003] [FC] 'Makefile: Write MINIKCONF variables as one entry per line'
007/10:[----] [--] 'accel/Kconfig: Extract accel selectors into their own config'
008/10:[----] [--] 'accel/Kconfig: Add the TCG selector'
009/10:[down] 'Makefile: Allow target-specific optional Kconfig'
010/10:[0028] [FC] 'hw/semihosting: Make the feature depend of TCG, and allow to disable it'

Philippe Mathieu-Daudé (10):
  MAINTAINERS: Fix KVM path expansion glob
  MAINTAINERS: Add an 'overall' entry for accelerators
  MAINTAINERS: Add an entry for the HAX accelerator
  accel/tcg: Add stub for probe_access()
  Makefile: Remove dangerous EOL trailing backslash
  Makefile: Write MINIKCONF variables as one entry per line
  accel/Kconfig: Extract accel selectors into their own config
  accel/Kconfig: Add the TCG selector
  Makefile: Allow target-specific optional Kconfig
  hw/semihosting: Make the feature depend of TCG, and allow to disable
    it

 Makefile                                | 15 +++++++++++----
 default-configs/arm-softmmu.mak         |  1 -
 default-configs/lm32-softmmu.mak        |  2 --
 default-configs/m68k-softmmu.mak        |  2 --
 default-configs/mips-softmmu-common.mak |  3 ---
 default-configs/nios2-softmmu.mak       |  2 --
 default-configs/xtensa-softmmu.mak      |  2 --
 accel/stubs/tcg-stub.c                  |  7 +++++++
 Kconfig.host                            |  7 -------
 MAINTAINERS                             | 17 ++++++++++++++++-
 accel/Kconfig                           |  9 +++++++++
 hw/semihosting/Kconfig                  |  4 +++-
 target/arm/Kconfig                      |  2 ++
 target/lm32/Kconfig                     |  2 ++
 target/m68k/Kconfig                     |  2 ++
 target/mips/Kconfig                     |  2 ++
 target/nios2/Kconfig                    |  2 ++
 target/riscv/Kconfig                    |  2 ++
 target/xtensa/Kconfig                   |  2 ++
 19 files changed, 60 insertions(+), 25 deletions(-)
 create mode 100644 accel/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/xtensa/Kconfig

-- 
2.21.3
