Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538034lfg;
        Tue, 2 Mar 2021 06:58:23 -0800 (PST)
X-Received: by 2002:a17:906:3552:: with SMTP id s18mr21484302eja.497.1614697102932;
        Tue, 02 Mar 2021 06:58:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697102; cv=none;
        d=google.com; s=arc-20160816;
        b=TxNDyPFE/brUB5aZzwi+Dw1j5uCiLCHYOl2Zaml8/GBHGqAI/2MB92n0K+iQbeuhNI
         gBCrUr7xP2xh29GqT0e6GeiduAkslCazLc5LrjPtdBkZLgf9AtRBWR+XPQtORjcmIMyv
         Vhf5K5xpwxFQqCynRwHQPTjIE8nLpg5a/QLRrXPEKnLQpCZ5shzMc1Axdhv815AwWwTt
         nqPgwhoj1GqS65rIb67bOti+HhO7I1heeQxun/t8l+zTpx7rBeJBRqna14eQ2RV/W+EN
         VMM0WrnEACzHBvAuOvfuvZeKpk01lsuig+3gmznwMnd3J/xgrbdeJ8s4FWgxRe1DYKdy
         6z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=X7BSvPakL4puIi0CoiqZyLCwJwNfOFS64YEG3c6fEa0=;
        b=FkKebR1mtan7W6QCFJ6gcBTQGnpm34vj/bRc7NL1bwwmBIUifgO7pvdsiPJJGYVSoG
         w1tP6nJ+iJJshBCfPyaePMYBmMAQ1u3dKm3t3+G6ZuWMNMccUtejC/WiWtYisdFM3hy7
         xko3rhNY9jIvZ+Ewde5qr1BkrYGfW+IAfK7ottOMCOiR5vnCrm8N9s1cN6oeFNvH/kQ5
         WPN9cXN+rpB4hDoypNjwMivBYwCCZHBlEnIo159J1PPFXSEEVOdQXq0gItLVbLV7T0rQ
         +mU7N37X9V9fJc7sq2Zwz6za8Hch0xHNbD1Xis/o2hMhTZuGKk3uOd2W2RGCqvOYKDt1
         /Qxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=plXVyHI7;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id le1sor4905921ejc.37.2021.03.02.06.58.22
        (Google Transport Security);
        Tue, 02 Mar 2021 06:58:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=plXVyHI7;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X7BSvPakL4puIi0CoiqZyLCwJwNfOFS64YEG3c6fEa0=;
        b=plXVyHI7caz75vzYsoJ9jZDStp1Wud9Me/ydz371qOx8PEfPy13tRp7gEH+kVipbeI
         n+A35A06Z2Kovp1+Fu6E5O4kp6z5ARoDCH1xFO7Qcrx6FPR9SF1+OVHsKEPtT6HJASnr
         jvH4Om4MhxrCMbnUge8WWb/Z1ejhuHpUtP1MZAcqYd2AJS+Dpxv3y3n/BKQydp9ZQXt1
         N1Rjcbuk/VU5rIaw+FBozPG6GZRhsUjQ6F56S3e0hXXWkyQ+hMk9y0xXnGXH5roXab/U
         Hs23c4hIncOaWLIAhVvsb5kB6mRZbp2DoJBeZAHboMbTLBSY9ni0odlUAoOk94Oxm58/
         +urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=X7BSvPakL4puIi0CoiqZyLCwJwNfOFS64YEG3c6fEa0=;
        b=UMVyBZV8DEPLQNOe1Ym7UnJzUyBUQ9SI+5yyu7PN3t4D0oG8fKi8dogIJ71Nhg3+eu
         b/MnzFQElAq369PSpAmo5MHvPpkPzyhqXRu6ozwu2sR/TZ0vUla/XWN6fFMB+RDq9jhS
         VTN1Z6Qh/Qj2bxiYuZc1VLk1bnTq6zN4S6InUVf2XpTei14zziruWRXbzcEjdsjgfrjJ
         fIL3b4PEXTEwTFnjnRKY9zB+UW2Qy/3fBbRxgHsXzKVZUo0+ybYcWlGAYLo0EleNvBOg
         bbSK2uWw6zRzirGk/OTH46nSsUZLPi1103AFBKsH0hfv+geClyj3e8+Irq8oOSqGxaQI
         U+8A==
X-Gm-Message-State: AOAM533qDy2pe6veN8toNm4quxqpX6PFrr1ciloUMkDsa/MOnX8PXxsm
	QuH+7U+fJiHlJH3PPlMKZXs=
X-Google-Smtp-Source: ABdhPJzc7ubKtC8GMptM7LM23zeMLtGm2caABUmtzRPLsK4gbQIaJ6ve8TTz6c/m6WxaPse5/2noQA==
X-Received: by 2002:a17:907:7684:: with SMTP id jv4mr1748700ejc.231.1614697102704;
        Tue, 02 Mar 2021 06:58:22 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id y11sm18000261ejd.72.2021.03.02.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:58:22 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 00/27] cpu: Introduce SysemuCPUOps structure, remove
 watchpoints from usermode
Date: Tue,  2 Mar 2021 15:57:51 +0100
Message-Id: <20210302145818.1161461-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 55ALDwDdFaRG

Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
Patches 1-6 are generic cleanups.=0D
Patches 7-15 move from CPUClass to SysemuCPUOps=0D
Patch   16 restricts SysemuCPUOps to sysemu=0D
Patches 17-25 remove watchpoint code from user emulation=0D
Patches 26-27 remove USER_ONLY #ifdef'ry from "cpu.h"=0D
=0D
Since v2:=0D
- fixed lm32/unicore32=0D
- remove USER_ONLY ifdef'ry from "cpu.h" (Claudio)=0D
=0D
Since v1:=0D
- Name 'sysemu' (Claudio)=0D
- change each field progressively (Richard)=0D
=0D
$ git backport-diff -u v2=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/27:[----] [--] 'target: Set CPUClass::vmsd instead of DeviceClass::vmsd=
'=0D
002/27:[----] [--] 'cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_fr=
om=3D=0D
_attrs'=0D
003/27:[----] [--] 'cpu: Introduce cpu_virtio_is_big_endian()'=0D
004/27:[----] [--] 'cpu: Directly use cpu_write_elf*() fallback handlers in=
 p=3D=0D
lace'=0D
005/27:[----] [--] 'cpu: Directly use get_paging_enabled() fallback handler=
s =3D=0D
in place'=0D
006/27:[----] [--] 'cpu: Directly use get_memory_mapping() fallback handler=
s =3D=0D
in place'=0D
007/27:[----] [--] 'cpu: Introduce SysemuCPUOps structure'=0D
008/27:[----] [--] 'cpu: Move CPUClass::vmsd to SysemuCPUOps'=0D
009/27:[----] [--] 'cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOp=
s'=0D
010/27:[----] [--] 'cpu: Move CPUClass::get_crash_info to SysemuCPUOps'=0D
011/27:[----] [--] 'cpu: Move CPUClass::write_elf* to SysemuCPUOps'=0D
012/27:[----] [--] 'cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps'=0D
013/27:[----] [--] 'cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=
'=0D
014/27:[----] [--] 'cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps'=
=0D
015/27:[----] [--] 'cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps'=
=0D
016/27:[0084] [FC] 'cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.=
c'=0D
017/27:[down] 'linux-user: Remove dead code'=0D
018/27:[down] 'gdbstub: Remove watchpoint dead code in gdbserver_fork()'=0D
019/27:[down] 'target/arm/internals: Fix code style for checkpatch.pl'=0D
020/27:[down] 'target/arm: Move code blocks around'=0D
021/27:[down] 'target/arm: Refactor some function bodies'=0D
022/27:[down] 'target/arm: Restrict watchpoint code to system emulation'=0D
023/27:[down] 'target/i386: Restrict watchpoint code to system emulation'=0D
024/27:[down] 'accel/tcg/cpu-exec: Restrict watchpoint code to system emula=
ti=3D=0D
on'=0D
025/27:[down] 'cpu: Remove watchpoint stubs for user emulation'=0D
026/27:[down] 'cpu: Fix code style for checkpatch.pl'=0D
027/27:[down] 'cpu: Move sysemu specific declarations to 'sysemu-cpu-ops.h'=
'=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Supersedes: <20210301215110.772346-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (27):=0D
  target: Set CPUClass::vmsd instead of DeviceClass::vmsd=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Introduce SysemuCPUOps structure=0D
  cpu: Move CPUClass::vmsd to SysemuCPUOps=0D
  cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps=0D
  cpu: Move CPUClass::get_crash_info to SysemuCPUOps=0D
  cpu: Move CPUClass::write_elf* to SysemuCPUOps=0D
  cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps=0D
  cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=0D
  cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps=0D
  cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps=0D
  cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c=0D
  linux-user: Remove dead code=0D
  gdbstub: Remove watchpoint dead code in gdbserver_fork()=0D
  target/arm/internals: Fix code style for checkpatch.pl=0D
  target/arm: Move code blocks around=0D
  target/arm: Refactor some function bodies=0D
  target/arm: Restrict watchpoint code to system emulation=0D
  target/i386: Restrict watchpoint code to system emulation=0D
  accel/tcg/cpu-exec: Restrict watchpoint code to system emulation=0D
  cpu: Remove watchpoint stubs for user emulation=0D
  cpu: Fix code style for checkpatch.pl=0D
  cpu: Move sysemu specific declarations to 'sysemu-cpu-ops.h'=0D
=0D
 include/hw/core/cpu.h            | 258 +------------------------------=0D
 include/hw/core/sysemu-cpu-ops.h | 244 +++++++++++++++++++++++++++++=0D
 target/alpha/cpu.h               |   3 +=0D
 target/arm/cpu.h                 |   3 +=0D
 target/arm/internals.h           |  34 ++--=0D
 target/avr/cpu.h                 |   1 +=0D
 target/cris/cpu.h                |   3 +=0D
 target/hexagon/cpu.h             |   3 +=0D
 target/hppa/cpu.h                |   3 +=0D
 target/i386/cpu.h                |   3 +=0D
 target/lm32/cpu.h                |   3 +=0D
 target/m68k/cpu.h                |   3 +=0D
 target/microblaze/cpu.h          |   1 +=0D
 target/mips/cpu.h                |   3 +=0D
 target/moxie/cpu.h               |   3 +=0D
 target/nios2/cpu.h               |   1 +=0D
 target/openrisc/cpu.h            |   3 +=0D
 target/ppc/cpu.h                 |   3 +=0D
 target/riscv/cpu.h               |   3 +=0D
 target/rx/cpu.h                  |   1 +=0D
 target/s390x/cpu.h               |   3 +=0D
 target/sh4/cpu.h                 |   3 +=0D
 target/sparc/cpu.h               |   3 +=0D
 target/tilegx/cpu.h              |   3 +=0D
 target/tricore/cpu.h             |   3 +=0D
 target/unicore32/cpu.h           |   3 +=0D
 target/xtensa/cpu.h              |   3 +=0D
 accel/tcg/cpu-exec.c             |   5 +-=0D
 cpu.c                            |  19 ++-=0D
 gdbstub.c                        |   2 +-=0D
 hw/core/cpu.c                    | 113 ++++++++------=0D
 hw/virtio/virtio.c               |   4 +-=0D
 linux-user/main.c                |   5 -=0D
 softmmu/physmem.c                |   1 +=0D
 target/alpha/cpu.c               |  10 +-=0D
 target/arm/cpu.c                 |  22 ++-=0D
 target/arm/debug_helper.c        | 102 ++++++------=0D
 target/arm/helper.c              |   9 +-=0D
 target/avr/cpu.c                 |   8 +-=0D
 target/cris/cpu.c                |  10 +-=0D
 target/hppa/cpu.c                |  10 +-=0D
 target/i386/cpu.c                |  31 ++--=0D
 target/lm32/cpu.c                |  10 +-=0D
 target/m68k/cpu.c                |  10 +-=0D
 target/microblaze/cpu.c          |  10 +-=0D
 target/mips/cpu.c                |  10 +-=0D
 target/moxie/cpu.c               |  10 +-=0D
 target/nios2/cpu.c               |  15 +-=0D
 target/openrisc/cpu.c            |  10 +-=0D
 target/riscv/cpu.c               |  12 +-=0D
 target/rx/cpu.c                  |  16 +-=0D
 target/s390x/cpu.c               |  14 +-=0D
 target/sh4/cpu.c                 |  10 +-=0D
 target/sparc/cpu.c               |  10 +-=0D
 target/tricore/cpu.c             |  13 +-=0D
 target/unicore32/cpu.c           |   8 +-=0D
 target/xtensa/cpu.c              |  10 +-=0D
 target/ppc/translate_init.c.inc  |  20 +--=0D
 58 files changed, 686 insertions(+), 453 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
=0D
--=3D20=0D
2.26.2=0D
=0D
