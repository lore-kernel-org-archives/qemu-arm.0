Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1733194ejb;
        Fri, 16 Dec 2022 13:55:23 -0800 (PST)
X-Received: by 2002:a17:906:bc1:b0:7f7:a4ed:f2d4 with SMTP id y1-20020a1709060bc100b007f7a4edf2d4mr772671ejg.77.1671227723194;
        Fri, 16 Dec 2022 13:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671227723; cv=none;
        d=google.com; s=arc-20160816;
        b=o8VaNNdWTG2tr+Hz1y2II5I5jp6wtlRHyJA/JgPdh0oQ3vv3VyXEuMVWpRkpvworaI
         Nd/XYprZGlkSOLOpCM/OwNarKLf+n+Jld+W6NApd61CJH1IIzgrMqWsB0ihad4/KnhNw
         uDffs0ER8aWxo1VaXNYkKqu3u1AWwtjYnxfGE6znTjR4bk3y/0edXU01QtGw0sPzFIrn
         iTGmQaAmmLx7dUNUJTtDDRxlP1n3gpqdporYs0q6RSp/va82Wgx7CDW4sWIc6oeVxtAG
         o8HE8JTRz+VYS2eobLarFmjP6mg3TptAv++8agsn9ejDpHaFY+hVnv/LKDMolsyXD5NY
         wQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=hDjaN8eJVHHHAcFnMzr9A5qx6nMta47BhVSDkoRkjiY=;
        b=WvkOSCpZDveBoIy09IETMJhGQkpnziaNPkSz8iJyDCq9rAUmkeWEZFhD/O0DoSvRwy
         3drVLR+/pPm3wDlYFoZcbaF3EcdXpR96Itrx7O3/bzpnlGnaCWchB+gnvv2URxZtoxUO
         oDcyz/fvLtlF2mEKoL3HwJh1kv0fWzlRNuCRqDuIMKT/xIbySjf9GFJBDajGXyksSj6g
         xCo0fzaZl0Z2EgCQfCxPU6MzfaUWNZ14oSLYqTAVY9jv7SZDomabn+nuQPG9azGSQqfr
         32gOk1IPjBqfUiNyIVE//FgPceFo/R/YcXNTsdkjRa97lB1Thi+QuBBCwwhzj5WPgmDv
         wx2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=koVIL3cK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15-20020a170906950f00b007bfd6014f23sor1845854ejx.72.2022.12.16.13.55.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 13:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=koVIL3cK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDjaN8eJVHHHAcFnMzr9A5qx6nMta47BhVSDkoRkjiY=;
        b=koVIL3cKjIUh0I9iexsK0DqWfQr49gTESlxiAo8T9vnX2CJ4QixeCzMydRIRBOKWbx
         +R5klEOuw0jjsMOseiyYra2DmM7xugL01wBlJceq+pr1ETQMYuEF+l2nrxerxSyoOukk
         EE8047bs8JQBm+dUp3FUQQC1qnfqTHK47keip65hJwdx3mwendQAsAQLaIBR2pRzqlvf
         NqOH4fAeX01aJpH0nqGWNSKzukViznSJY7eNEFluBWjQzNLupunEjytyMWUMkkzTPBA2
         KPTKjr9ShUXrdrTne0thHjnLliuX8/iEm2579930rtW//wgEDKCU8+iqi5HVgULV6x0O
         iFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDjaN8eJVHHHAcFnMzr9A5qx6nMta47BhVSDkoRkjiY=;
        b=bTlXGt/7P+5qr1xdxUWezXevitGwfcoPkTWjc33Gs6vkIyTArU5a3VChCQfWAJVn1S
         KSJA2JWnRSCntjkKLFu8yPf9KByv9SNePLJc+V1h7bkSIr80P3Whd94MDTt5AQFnHRhY
         mNxIWVHdl8OjaUezz+sVBB5Unu6T/E1+/qtJ53DnGOV+FxQT6F+T/z2yxe549QaFwjxT
         5GfIPNcmkTZvb9TTqMnHiXJPTMhgiSPaKkGEb1k84XJPN7AHFNuduP6WjOo/krISV4Ai
         pfxKheFqOGlXisFK6Y9Q+CWrAmDO6/7atm7eAS8jjKERY0qHqSYipoUbqQZTHjXc+hjS
         1+Ww==
X-Gm-Message-State: ANoB5pkc5PzTM7pNQ6zQKRAPA6K8Wwkl2I1kLKQGGvk3uol8f+inXYGI
	ujl9J3X+8RxqpyBDPNpOx0xrQvLS
X-Google-Smtp-Source: AA0mqf44m9uRz2q1p7VXh76chobt7pep0KjNv3fyOdRMxmPyqai4zHyqi15eXjf/Z+1BI3Gb+0JNtQ==
X-Received: by 2002:a17:906:8385:b0:7c4:f348:3b1f with SMTP id p5-20020a170906838500b007c4f3483b1fmr10710690ejx.44.1671227722936;
        Fri, 16 Dec 2022 13:55:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b007aece68483csm1261840ejf.193.2022.12.16.13.55.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Dec 2022 13:55:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 0/5] target/cpu: System/User cleanups around hwaddr/vaddr
Date: Fri, 16 Dec 2022 22:55:14 +0100
Message-Id: <20221216215519.5522-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 7JmKl1jy8AZW

Missing review: #1

We are not supposed to use the 'hwaddr' type on user emulation.

This series is a preparatory cleanup before few refactors to
isolate further System vs User code.

Since v1:
- only restrict SavedIOTLB in header (Alex)
- convert insert/remove_breakpoint implementations (Peter)

Since v2:
- added 'dump' patch
- collected R-b tags

Philippe Mathieu-Daudé (5):
  dump: Include missing "cpu.h" header for tswap32/tswap64()
    declarations
  cputlb: Restrict SavedIOTLB to system emulation
  gdbstub: Use vaddr type for generic insert/remove_breakpoint() API
  target/cpu: Restrict cpu_get_phys_page_debug() handlers to sysemu
  target/cpu: Restrict do_transaction_failed() handlers to sysemu

 accel/kvm/kvm-all.c        |  4 ++--
 accel/kvm/kvm-cpus.h       |  4 ++--
 accel/tcg/tcg-accel-ops.c  |  4 ++--
 dump/dump.c                |  1 +
 gdbstub/gdbstub.c          |  1 -
 gdbstub/internals.h        |  6 ++++--
 gdbstub/softmmu.c          |  5 ++---
 gdbstub/user.c             |  5 ++---
 include/hw/core/cpu.h      |  6 ++++--
 include/sysemu/accel-ops.h |  6 +++---
 target/alpha/cpu.h         |  2 +-
 target/arm/cpu.h           |  2 +-
 target/arm/internals.h     |  2 ++
 target/cris/cpu.h          |  3 +--
 target/hppa/cpu.h          |  2 +-
 target/i386/cpu.h          |  5 ++---
 target/m68k/cpu.h          |  4 +++-
 target/microblaze/cpu.h    |  4 ++--
 target/nios2/cpu.h         |  2 +-
 target/openrisc/cpu.h      |  3 ++-
 target/ppc/cpu.h           |  2 +-
 target/riscv/cpu.h         | 12 ++++++------
 target/rx/cpu.h            |  2 +-
 target/rx/helper.c         |  4 ++--
 target/sh4/cpu.h           |  2 +-
 target/sparc/cpu.h         |  3 ++-
 target/xtensa/cpu.h        |  2 +-
 27 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.38.1
