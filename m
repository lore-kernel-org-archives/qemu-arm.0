Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026265lfb;
        Sat, 9 May 2020 06:09:15 -0700 (PDT)
X-Received: by 2002:a1c:2089:: with SMTP id g131mr2667986wmg.47.1589029755524;
        Sat, 09 May 2020 06:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029755; cv=none;
        d=google.com; s=arc-20160816;
        b=gGj9wbh/YylsfnsO7pVYiQIFqIk+TAEixb+mfhIq8UF5oYnI4HDZRuA9c4lFVoYgqz
         I7RKmXRGLnxWk0RGCGPf1tfW5mCJgNI0Goj+PsNFWuQGTNpnS5RurHZMsmb5LLYJFm7D
         IVFIIGxt4QbKxz0QTYeripcQh52zYzkgK3bnpUrRL+N2c0PhKw+Nj/cOjvd5JHkW3SrL
         tI3RnjJqtljtelpYRdKhIbjOtLFnGjAgmv3uM61M6NwjUceRGG/fcPhFt5mkdg5MEj26
         Rj6OE+2b9VcKFj0GsOvc5qOeVOGPC8u1pBVi0h0cX8/L07FUzLFzgGnYSEwX6VJnemPH
         s5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=iE1+mJklc9qKRY36HjqMYuwaM8rzjkNP3yQiEBI2qQE=;
        b=0xUiaOci1vqLMclPSLIGOBqfQ7pVe6Kt6+pSvFhtBOWwQ/iJQM4wW76bm3F6NvhCcZ
         +ut2R39uJ2lrXCvM+OnMRvvaStdR5+H/M9I6EW9Uld7qPpvuqHQe9onYjde2qwxYiBeZ
         7S8GL/65oM0utTEdbFfwpzxSgtt+IeGFDMQc7WDGvWBGCX1bnupi9vK8cKWxj2Tk1yNt
         goRKWTWaqqNOKwL2q1hhJbM4DhjSAn9/fg5ZJSQi3giBhQQH5UuXhgePeNPIRjbe/Qa0
         FeDYCGjUeCYMFtMHW2MPqgLeQlC528aulTfOUCdI9icmiym7/DVdPTiCzJwzGLWoBPDJ
         wr/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gfp9lMbR;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k2sor7857582wmi.20.2020.05.09.06.09.15
        (Google Transport Security);
        Sat, 09 May 2020 06:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gfp9lMbR;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iE1+mJklc9qKRY36HjqMYuwaM8rzjkNP3yQiEBI2qQE=;
        b=Gfp9lMbRlEqlUHuwAcIsNoFH99uSEOdkZZhVlXMQ7cyBLO1xcqqhkPG1yDHH82cj3i
         QYYh2RjNRr0wzlukYDiCw8B1S77cQQYGby3dna5vxspS+rXNGxHMzme+dtjlteb3F2WQ
         kckjhnnHULfUeGJMtBSWqTyrLYh/UcxdwT7+MFsTHUrh0Fz0OVujeNPZib/OIvuLpEDE
         IVwy7MuAjCAbEYfUfUMJHCxXpNAKEfOd8GL6nL+396vTBmPyr4uxBpp0KB34h7owFKNe
         DtbaRAp67mLJYmQay+4r6DKx6KNXJKYJz6suluGN5ZmDT9abA6HAtwjxjgLonrCHy9Z0
         Ok0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=iE1+mJklc9qKRY36HjqMYuwaM8rzjkNP3yQiEBI2qQE=;
        b=WAHb79ZspdrXtah6lchM42zKirlFErHdyXIXVKKOTskqdHjLnPOIpHrVHBD+q4xAAu
         zMLedcEFeu4q1IHbeVyB2W78TpxFVvMQZDG3VLm4BI8n7+QL0r7CzpHom7fV4BDWb4SP
         /JZZBviSPuXAduJxBnMu/Y5kE0swvu7ksHtPQwbl9/Um1xwWdnx6qjtoniEQ5KasHcKa
         9mAK7K34buWdEM9Zr26486WdEHMtlQbty3uUTTXf2RqPCkxex0xgeSiylsiEi5/10gW4
         vSOSAoa4lc8jAxeHlnrBjFDny5hMTjB+s3WrXWws0/minK7DT19W6sBZQJmpzDB9z4C1
         zjmQ==
X-Gm-Message-State: AGi0PubjW7fgjS8v21sU24adzXDASxk8s6DUmvXmEuuO5AmVMzyShY8o
	cTGYtpFf1uoK2QpLjlFz3N4=
X-Google-Smtp-Source: APiQypIxSoJQrCineHduqmVzQFO86f/7GWszhtwChBJzs41MjCoAXBeO4O9AtUOwuPvrK3uUqfQyaA==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr21875192wmc.67.1589029755117;
        Sat, 09 May 2020 06:09:15 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 00/11] exec/cpu: Poison 'hwaddr' type in user-mode emulation
Date: Sat,  9 May 2020 15:08:59 +0200
Message-Id: <20200509130910.26335-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: D9qzi29+4352

The 'hwaddr' type declared in "exec/hwaddr.h" is meant for
system-mode emulation only. Poison it in user-mode code.

Philippe Mathieu-Daudé (11):
  plugins: Restrict functions handling hwaddr to system-mode
  sysemu/accel: Restrict machine methods to system-mode
  sysemu/tcg: Only declare tcg_allowed when TCG is available
  sysemu/hvf: Only declare hvf_allowed when HVF is available
  target/ppc: Restrict PPCVirtualHypervisorClass to system-mode
  target/s390x: Only compile decode_basedisp() on system-mode
  target/s390x/helper: Clean ifdef'ry
  target/s390x: Restrict system-mode declarations
  target/cpu: Restrict handlers using hwaddr type to system-mode
  exec: Use 'cpu-common.h' instead of system-mode specific 'hwaddr.h'
  exec/cpu-common: Poison hwaddr type in user-mode emulation

 include/disas/disas.h           |  2 +-
 include/exec/cpu-common.h       |  8 ++++++--
 include/hw/core/cpu.h           | 10 ++++++----
 include/qemu/qemu-plugin.h      |  2 ++
 include/sysemu/accel.h          |  4 +++-
 include/sysemu/hvf.h            |  6 +++---
 include/sysemu/tcg.h            |  2 +-
 target/alpha/cpu.h              |  4 +++-
 target/arm/cpu.h                |  6 +++---
 target/arm/internals.h          |  4 ++++
 target/cris/cpu.h               |  2 ++
 target/hppa/cpu.h               |  2 +-
 target/i386/cpu.h               |  2 ++
 target/m68k/cpu.h               |  7 ++++++-
 target/microblaze/cpu.h         |  5 ++++-
 target/mips/internal.h          |  2 +-
 target/nios2/cpu.h              |  5 ++++-
 target/openrisc/cpu.h           |  3 ++-
 target/ppc/cpu.h                |  6 +++---
 target/ppc/kvm_ppc.h            | 22 +++++++++++-----------
 target/riscv/cpu.h              | 20 ++++++++++----------
 target/s390x/internal.h         | 15 ++++++++++-----
 target/sh4/cpu.h                |  2 +-
 target/sparc/cpu.h              |  2 ++
 target/xtensa/cpu.h             | 12 +++++++-----
 plugins/api.c                   | 17 ++---------------
 target/hppa/cpu.c               |  4 +++-
 target/ppc/translate_init.inc.c |  6 +++++-
 target/s390x/helper.c           |  7 ++-----
 29 files changed, 110 insertions(+), 79 deletions(-)

-- 
2.21.3
