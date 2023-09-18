Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010199ejb;
        Mon, 18 Sep 2023 09:02:59 -0700 (PDT)
X-Received: by 2002:a2e:a179:0:b0:2b6:a08d:e142 with SMTP id u25-20020a2ea179000000b002b6a08de142mr7689041ljl.7.1695052979456;
        Mon, 18 Sep 2023 09:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695052979; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZrkrQc246X75wWKc0/bT6v48LUYfn0g/+C9iHkTzSlPM3w/L/GxHrM0iKDcc3lOUN
         z5j2zXtL0peoUUpb8teRNlELAdfgK175ily/RsO9in4r8YUU2VREAs5v3OMTrpOH/3ll
         R7MB9wsIhfeZ8J71/NR9RosidasUI466uQOUFngWcwH0A+VDc929jzKLlZvu0mrGJRpC
         gPmDX7iSqlQmMl1W20D2s98rWRIWCMvcrfeE11un3MKMOb85jLUSxH2hfH2cxrjCjgMl
         zEwIOtZm61mHJSrLV/zlsgKwvPkSMiiMojqSsMXKn7hs6KRDbbkX8kPVdlWeOol/yA0E
         S4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=R37K2a/Smepsc2iyIaDJqnazCMcEJOOAaYAXmsK0XT0=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=Mi3xKqcYX5Gtw6hp+CSbrPBIJHNhaUh0tN+IdiB2KnoOUzMitJvgCS1QLi/FDo3jJJ
         ngCZiNrBdjVEtjImEfbrB7Q2lzmqOiCIu/aKvCcdAzJyb0//8KvWokFekAmlMF+hT/sD
         5blYYwUf5Jq7JHsNHXoAnKcT6vDni9mpdMRGCs/r5VpPrQq8GcT8VffZiqNI5fRgU2zK
         cBeUTNdrQCOeV0Qq690ztJnOjHkBl8+bAtKKWWmpGU4EQJVgvI83E/RaP43a9+n53oce
         CzxEVSz0F+k8aBhfvXT/8+DNIZfCYvJoZZoO/jIWwYQkfVI07oaUJtW1EkFF/hFB4roT
         Ygfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcxZp3K9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ml13-20020a170906cc0d00b009a1af6ed402sor2840765ejb.0.2023.09.18.09.02.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcxZp3K9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695052979; x=1695657779; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R37K2a/Smepsc2iyIaDJqnazCMcEJOOAaYAXmsK0XT0=;
        b=hcxZp3K9uKUzpVyRtdE5UWboxcxLxMxptMUQsNhWqjCo6mJkmFKDdkAuch7x/toTsa
         BX0bcw6tySvy31SRvTxqduqUAybhuh9CtFU1LcvZE1DbwO1qKOw8KY2dT3L9moRTGNhU
         h5OXcWvObx7vxrbOIGYrQOQDU4b+cgOrBN6E3r0Rkv2jX0BXmafWm+nKTQ4/WmnJ++GW
         dSowqQnzMl6nX6OTy5xCGhcMKSo2lJ6t72hGtzlmjVRckanhE2bWZhHGXy3iSLBULRsZ
         mhDCSv71e/Q210zyoocZO3MdC+6FfxPnizNsL8lueVp/uulKHc0FW+ECuukehfHfF6/f
         1+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052979; x=1695657779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R37K2a/Smepsc2iyIaDJqnazCMcEJOOAaYAXmsK0XT0=;
        b=RD1HtVPCIp3I9cf50VYUZb6E1ha0c1N3m7F6+8dzpois6Pq2Bp7Cds+BKXgHFCAPAh
         QbDZslFb6VVI1zLfy3OIpJza0prOFX9dw60T67RwFduSh5wqrEnVdlucmh3pbs2uJ+mJ
         AT2+J7UW3aORKXs328eKrmU06MF2jJyzrWiMXiI3hfM69tCAV63+tpJpEIkpc6vSHqvK
         xoVMKImtZ74fewxGHQIsesPsQszrh9UAPL69oeQNeVZAICUHYhFlqUOjySK8oyEa9x24
         nPym39lbnwPXcUvqsdHSMVQcmCb+Ujv+o+OO2/3AoA9LAd5PAfTiOLH+1z/yxhdL92eK
         3nhw==
X-Gm-Message-State: AOJu0YxLJR/En62CQ5h22VddBkRKzWUqSGrHoPv7hFaP6PiWoBRBxFYs
	OqJiuVJN4qxF+xV91HjtceKpewya
X-Google-Smtp-Source: AGHT+IHGtyYBQwLAMwFhSgR4DVjVUaGUpdsvPj2BatAS0H6me1yGIyefW0SsMEvxluQ7CDP796y45Q==
X-Received: by 2002:a17:907:a0c6:b0:9a1:cb2c:b55c with SMTP id hw6-20020a170907a0c600b009a1cb2cb55cmr6526293ejc.35.1695052978973;
        Mon, 18 Sep 2023 09:02:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id rl20-20020a1709076c1400b009adc81c0c7esm5428731ejc.107.2023.09.18.09.02.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:02:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Claudio Fontana <cfontana@suse.de>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-ppc@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Luc Michel <luc@lmichel.fr>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Bin Meng <bin.meng@windriver.com>,
	Stafford Horne <shorne@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 00/22] exec/cpu: Call cpu_exec_realizefn() once in cpu_common_realize()
Date: Mon, 18 Sep 2023 18:02:33 +0200
Message-ID: <20230918160257.30127-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 42/jAH2k2P4C

Hi,

TL;DR: This series factor duplicated common code in CPUs
DeviceRealize() handlers out, moving as a single call in
cpu_common_realize().

In an effort to have most of:
- CPU core code independant of accelerators
- CPU core code target agnostic
- CPU target code independant of accelerators
- and cpu_reset() called automatically without having to
  rely on global QEMUResetHandler,
I'm working on the core CPU code, unfortunately touching
files in all targets.

I suppose them term "exec" used in various areas of QEMU
started from what we call today "accel[erators]" [*]. So
cpu_exec_realizefn() can be read as cpu_accel_realize(),
or "generic code where an accelerator realizes its internal
fields on an abstract (target independent) CPU".

This series moves a common pattern used in all target's
cpu_realize() handlers to the common cpu_exec_realizefn().

Some optional code is used to check CPU requested features
are compatible with the accelerator possibilities. We
extracted this code as CPUClass::verify_accel_features()
handler. Better name welcomed :)

Some targets were calling cpu_reset() *before*
cpu_common_realizefn(), we moved it *after* (since RESET
shouldn't happen before REALIZE). I still have to audit
each target to confirm there are no side effects.
Besides this cpu_reset() change, the rest should be
relatively trivial to review, still I'd like feedback
from the respective target maintainers for the "move HW
creation after vCPU one" patches.

Regards,

Phil.

Follow-up: Make cpu_reset() accel-agnostic and move it
           to cpu_common_realize() (not trivial due to
           KVM run_on_cpu() calls).

[*] If Paolo/Richard confirm, I might post series renaming
    various APIs s/exec/accel/, because various headers
    meaning aren't clear to me.

Philippe Mathieu-Daudé (21):
  target/i386: Only realize existing APIC device
  hw/intc/apic: Pass CPU using QOM link property
  target/i386/kvm: Correct comment in kvm_cpu_realize()
  exec/cpu: Never call cpu_reset() before cpu_realize()
  exec/cpu: Call qemu_init_vcpu() once in cpu_common_realize()
  exec/cpu: Call cpu_remove_sync() once in cpu_common_unrealize()
  exec/cpu: RFC Destroy vCPU address spaces in cpu_common_unrealize()
  target/arm: Create timers *after* accelerator vCPU is realized
  target/hppa: Create timer *after* accelerator vCPU is realized
  target/nios2: Create IRQs *after* accelerator vCPU is realized
  target/mips: Create clock *after* accelerator vCPU is realized
  target/xtensa: Create IRQs *after* accelerator vCPU is realized
  target/sparc: Init CPU environment *after* accelerator vCPU is
    realized
  exec/cpu: Introduce CPUClass::verify_accel_features()
  target/arm: Extract verify_accel_features() from cpu_realize()
  target/i386: Extract verify_accel_features() from cpu_realize()
  target/s390x: Call s390_cpu_realize_sysemu from s390_realize_cpu_model
  target/s390x: Have s390_realize_cpu_model() return a boolean
  target/s390x: Use s390_realize_cpu_model() as verify_accel_features()
  exec/cpu: Have cpu_exec_realize() return a boolean
  exec/cpu: Call cpu_exec_realizefn() once in cpu_common_realize()

xianglai li (1):
  exec/cpu: Introduce the CPU address space destruction function

 include/exec/cpu-common.h     |  8 ++++
 include/hw/core/cpu.h         |  7 +++-
 target/s390x/s390x-internal.h |  4 +-
 cpu.c                         | 11 ++++-
 hw/core/cpu-common.c          | 15 +++++++
 hw/intc/apic_common.c         |  2 +
 softmmu/physmem.c             | 24 +++++++++++
 target/alpha/cpu.c            | 10 -----
 target/arm/cpu.c              | 53 ++++++++++++------------
 target/avr/cpu.c              | 10 +----
 target/cris/cpu.c             | 11 +----
 target/hexagon/cpu.c          | 11 +----
 target/hppa/cpu.c             | 20 ++-------
 target/i386/cpu-sysemu.c      | 20 ++++-----
 target/i386/cpu.c             | 77 ++++++++++++++++++-----------------
 target/i386/kvm/kvm-cpu.c     |  3 +-
 target/loongarch/cpu.c        | 11 +----
 target/m68k/cpu.c             | 11 +----
 target/microblaze/cpu.c       |  9 ----
 target/mips/cpu.c             | 27 ++++--------
 target/nios2/cpu.c            | 20 +++------
 target/openrisc/cpu.c         | 11 +----
 target/ppc/cpu_init.c         |  8 ----
 target/riscv/cpu.c            | 10 +----
 target/rx/cpu.c               | 11 +----
 target/s390x/cpu-sysemu.c     |  3 +-
 target/s390x/cpu.c            | 21 +---------
 target/s390x/cpu_models.c     | 16 +++++---
 target/sh4/cpu.c              | 11 +----
 target/sparc/cpu.c            | 10 -----
 target/tricore/cpu.c          | 10 +----
 target/xtensa/cpu.c           | 13 +-----
 32 files changed, 189 insertions(+), 299 deletions(-)

-- 
2.41.0
