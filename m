Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1358421ejf;
        Mon, 15 Aug 2022 12:03:06 -0700 (PDT)
X-Received: by 2002:a1c:ed05:0:b0:3a2:ebae:c5e7 with SMTP id l5-20020a1ced05000000b003a2ebaec5e7mr10646824wmh.78.1660590186851;
        Mon, 15 Aug 2022 12:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660590186; cv=none;
        d=google.com; s=arc-20160816;
        b=vX0DkuxmPEwdk2RGIMWb/9EsQnTUCAnjXgkvrd1ISKHAvYFt9mnh3Tn53FDmQ56hhS
         f4Q6rVbjv1d05HjBYdZ1w/B9oQUPbHvhxp73hfd8Rw2VXZSnoACz9SvVLTdUP7PvlK4e
         kkR3CnzwMuwu2eU4Morn9yovuq/iUR6FnVRTphiVGH9cnQBeZ/9Ow4keTaCST2Ggee3J
         gbHRmhE3hVIw/mdvy2KZTYwjDEPfdBO2g7M+4tOORvYqSysdIJRLs+MgKSH0CaE+Ro+2
         SMf6U3TQDwZgG4ig0ygVRLePm7jgR+NClJ5Ii98oZXBuhI/TBTXILQWlCEO2nWiVvotR
         aNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4Q67kU5Pa8qbKDq/p11cYTFwJU0Q6OYYwsmMELIDttI=;
        b=tUYvAc9xOU2tVpboQ6GeaIeBgV2X5oBR/qolY7xoMGUJs0wG4C3A7ODHCaie1Y1joT
         HA6Le+ZLBgedmjqm24R9wr8bNCbu8nzLHEn3U2ooGF6zwV+E8d/ONXVwX/avNfwbZWMO
         BZEywCvrTtILdkTY4dPd0rJI9uMSX1WmC8vyr+aIukGJecJbzwQ70MTPS7QOxZcFT3vC
         goe1zg2VEcC2982nR+NsFmENQmYGogKXdwk8TIDXI2unegEqnFByC3LXRrf8Z7FFxaVM
         tubpfuZ3yarH9OZrqzyHzltqP1kXoNw+0hr5L/OVdRK6t3RrXFagbpeIZwmFJ3G9J7/V
         45tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULEtzSDr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w19-20020adf8bd3000000b00222cff73b44sor2708006wra.76.2022.08.15.12.03.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 12:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULEtzSDr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=4Q67kU5Pa8qbKDq/p11cYTFwJU0Q6OYYwsmMELIDttI=;
        b=ULEtzSDrVV/7I099f4FZOktooS/YmI8a8LRkHckUIsJKCM2MWn5AwGB/CJq3J4Wiqr
         XmVzkFsXqqvBTwfDN9DEj6TnfTn+iqtt809xSh7N9fMMjGRoGNvVCkZlHd/GjUBY5gIc
         H8U8jakIiB2M/TlnuSskDz3b62wvWSv60fYcpDz9mvliI/cR64jaQNEBcg0shSzWLype
         YE2BJpVP/9zf6BKBv/+4IAf1Dv03QVKvLMeCBZ5or1K98zy3nvFHYKGsd1cWLnmwx8T4
         uZ+Kq+1WRMwP9cbL3OZg/7+aMaBUwEB7fLgHTqUuM44PpB73GUAwzv2rB662YEyVG0ow
         we5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=4Q67kU5Pa8qbKDq/p11cYTFwJU0Q6OYYwsmMELIDttI=;
        b=CzwWjfANcgxQcamKjgFNI5TJ26dDd0v5ChoDLisQAcK1Of6HvnijIAaXNTjmM/83/X
         chxmL9JFl6W6nHpUxt05ZrPFnH8zcVf7U2cDkE7y2K2iM11ADNQ+Lhkp8O2xQ8b7BjGL
         3dWcKy86GiqEvhO/pP3BPwycz/WERGJn7TMci9hnjsgTQfSdBwQUEUQHNleFmx0I+9BW
         3vVP5UpoMsvtDJ7jo8MGwp1gjZwI+km1YWpO6rReL0gbOS0jfLkkeInkQIzbRu90aiOJ
         fm8r3SVM7jLEU4gp0x35lZepxcH+7Q0f6ZlS+yBowXUJD8i4HF6ir2ChRWd/2lv+yZ/d
         uLDQ==
X-Gm-Message-State: ACgBeo3AS15xsxZBKLAtBuek2Z5kDQMBlVbeTHP9OyJNjwVMlezVNLkK
	ERsO2a0WmnDg5bCUj1FijdGrkaXC
X-Google-Smtp-Source: AA6agR686UYwqSFydtFEb6BIZHoBm6o2H+eBG9yToKIoNk3se1D/z4jlhfgUZitVhszq6vRf9kuSHA==
X-Received: by 2002:a05:6000:18a1:b0:222:c477:e919 with SMTP id b1-20020a05600018a100b00222c477e919mr9521126wri.301.1660590186535;
        Mon, 15 Aug 2022 12:03:06 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:03:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stefan Pejic <stefan.pejic@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 0/7] Allow semihosting from user mode
Date: Mon, 15 Aug 2022 20:02:56 +0100
Message-Id: <20220815190303.2061559-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QdwGBpsVaVj3

Currently our semihosting implementations usually prohibit use of
semihosting calls in system emulation from the guest userspace.  This
is a very long standing behaviour justified originally "to provide
some semblance of security" (since code with access to the semihosting
ABI can do things like read and write arbitrary files on the host
system).  However, it is sometimes useful to be able to run trusted
guest code which performs semihosting calls from guest userspace,
notably for test code.

This patchset adds a command line suboption to the existing
semihosting-config option group so that you can explicitly opt in to
semihosting from guest userspace with "-semihosting-config
userspace=on".

It also brings all our target architectures into line about
how they handle semihosting. Currently these fall into three
different groups:

 * semihosting permitted only in privileged mode and only
   if enabled on the command line:
   - arm
   - m68k
 * semihosting permitted in any mode, if enabled on the command line:
   - mips
   - nios2
   - xtensa
 * semihosting permitted only in privileged mode, but fails
   to honour the existing "enable semihosting" option, instead
   enabling it all the time:
   - riscv

The effect of the new option for group 1 is:
 * user can now optionally also allow semihosting in usermode

For group 2 it is:
 * usermode semihosting used to be permitted, but now changes
   to default-disabled, needing explicit enablement

For group 3 it is:
 * semihosting overall used to be default-enabled and is
   now default-disabled, needing explicit enablement.
   Semihosting in usermode can also be enabled.

That means this is a "things that used to work no longer do
unless you change your commandline" change for groups 2 and 3
(so, mips, nios2. xtensa, riscv). In this patchset I've opted
to just make the change (with the intention of releasenoting
it) but I'm open to arguments that we ought to put it through
the deprecate-and-delete cycle. (I suspect this probably most
affects riscv.)

The patchset structure adds the option first and then updates
each target architecture in turn to honour it. It didn't seem
to me worth the extra patch-splitting to put the underlying
infrastructure in first, then the target changes and finally
exposing the option to the user only once it's honoured
everywhere.

NB: I haven't really tested this much, just 'make check'
and 'make check-avocado'; I wanted to get it out to the
mailing list for discussion, anyway.

thanks
-- PMM

Peter Maydell (7):
  semihosting: Allow optional use of semihosting from userspace
  target/arm: Honour -semihosting-config userspace=on
  target/m68k: Honour -semihosting-config userspace=on
  target/mips: Honour -semihosting-config userspace=on
  target/nios2: Honour -semihosting-config userspace=on
  target/xtensa: Honour -semihosting-config userspace=on
  target/riscv: Honour -semihosting-config userspace=on and enable=on

 include/semihosting/semihost.h            | 10 ++++++++--
 semihosting/config.c                      | 10 ++++++++--
 softmmu/vl.c                              |  2 +-
 stubs/semihost.c                          |  2 +-
 target/arm/translate-a64.c                | 12 +-----------
 target/arm/translate.c                    | 16 ++++------------
 target/m68k/op_helper.c                   |  3 +--
 target/mips/tcg/translate.c               |  9 +++++----
 target/nios2/translate.c                  |  3 ++-
 target/riscv/cpu_helper.c                 |  3 ++-
 target/xtensa/translate.c                 |  7 ++++---
 target/mips/tcg/micromips_translate.c.inc |  6 +++---
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
 qemu-options.hx                           | 11 +++++++++--
 15 files changed, 52 insertions(+), 48 deletions(-)

-- 
2.25.1
