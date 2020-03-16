Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp249511lfe;
        Mon, 16 Mar 2020 09:06:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvdFEJPVDoLVN2+WXh4A7UPiCPhNpfsKUwAjhD7cKzTEEzMwVPbeIvprW2cXT8Le9CSTQtv
X-Received: by 2002:a25:824e:: with SMTP id d14mr498742ybn.8.1584374803117;
        Mon, 16 Mar 2020 09:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374803; cv=none;
        d=google.com; s=arc-20160816;
        b=cyG4ZTECtrtpAnG5lVIrseI/fCtU+iHp7ptU0Qr3GOSXwcWE+MZLVnkgQ3qAjLWTxX
         X6JSn+TV86NkNydsr8Cri+NmxK1WoHtBq9lsI7TJtkQyWcaWHxVFI2YMQq/cDWjmWba3
         GARprnRxstKgIWgJeLZ+RPVqLrvRbjXN42zI9iPnnaiMxjEeZUFg6zaj9ASNcwNxkRd8
         pfNnL02uPpyoL0chNBnrX9DpBROOEs17ul0gkw0SASborGhmn20QrfDiLz8MAUNbMy6m
         rPyO3JxT61A/m3G2XQn7AmFOwZaU05IAd2SBeqiC9RMQZ5xZvnGMmHoAaHNNOJ93RdXw
         WiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3mVXcxmK2HMmKZLt5GH7gLyONl4hlaRDhaSU8yeP/yU=;
        b=s80t6D+cPtV5MmfRtcpiXwfl5VjYm8QHFAXVBIXoxMyOBbAbNBQZy9FurbazYhetoh
         ukNuvoZB8SMzvQsn8Po8D3UTcYKcVrw6QWgZ5bOOc/Ga5QnB0kAKg8Zt7YG4EpdjNuJ7
         zQ6Q8a/amWx20Tv5riZbbXZEP4wgaVEB+y7ykX88AzVRmHQcHnbyVtza7xS5UvyDIf+9
         2sUnZRc7rv3Sxy4ImpzGT8pdpbkyoTMjbwKPkTqqIRBB0qjkp2ddRRqVdgmuyLSmgPGz
         p6JTGfgyFRWpjFCcBYSDtnrdIu1+Lt30KFXaEmHJ5sz3pldhdQ0w5y0imiUc3luX1jmi
         QLQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWuj7Uvg;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id 137si129108ybf.114.2020.03.16.09.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWuj7Uvg;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3mVXcxmK2HMmKZLt5GH7gLyONl4hlaRDhaSU8yeP/yU=;
	b=LWuj7UvgdXeaVSlJmYRpqmHKwzvzWGKjAFr6Uub2HWNw5Crd1mUHFgdoPApGZISZGY3DTS
	12o7SPZeXajCrYYcu/8maTkt26RuhBa+6mcoZjntdFyT4+urqWhzl6/5ce7pdGfaMSh866
	vxl5GasB9Ivl/OKr5UXhQ5tH7itIcbM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-ILUij4PeOBamVCTr_KR2BA-1; Mon, 16 Mar 2020 12:06:38 -0400
X-MC-Unique: ILUij4PeOBamVCTr_KR2BA-1
Received: by mail-wr1-f71.google.com with SMTP id s4so3847979wrb.19
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5yP2gI3jZwVa/ROqUBqAiUPezN5j8lwPUWA/Pi42tY=;
        b=qbtkStUWyD1uLIETXp/5Z5+bpI/XU6W+uIrYza9BCN6p0KrtTDWWrtTwTlzZIsITFC
         5p74o2c9O2WidHZ2Mdzf7cCiikJt+KDWpelRu8pdWdnyGWJkvlXtYvkWk6FOrEfchzmx
         s+JO4I0GobzGiehYYJlADBx+UtlZdd+nWdZrMIkWvDqZrRBXj0Q4r5aw2BEd1uLVQgKv
         gtm3dEc9TqlrUjojg1XU4AapJ8Ew/YH9aCeoNqPcFPoppIJZ4iE9ru4Y3rq6j6VfM+K6
         +TAviuEoMDXwJH/xtMVFc/l0QU/o+byvuMM/XWaEpUc3I2/Esk0wk43Cydumd/ZHw2g9
         keOw==
X-Gm-Message-State: ANhLgQ0BBVSZhdMXuNyT4SB3+0xVqG4gN5fzcLseZNXKQZ95R3TzZO+U
	1Z9Ia680n7nNobVmE5ZDMoj4dHggAeEzkQ3vBJyx3L+j7U2Y/rnm58C/G4ZH4ewhcv185PXoTsM
	eIJ32zMIUnZxCXNfn
X-Received: by 2002:adf:a343:: with SMTP id d3mr105733wrb.50.1584374797652;
        Mon, 16 Mar 2020 09:06:37 -0700 (PDT)
X-Received: by 2002:adf:a343:: with SMTP id d3mr105710wrb.50.1584374797395;
        Mon, 16 Mar 2020 09:06:37 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id s7sm478457wri.61.2020.03.16.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:06:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 00/19] Support disabling TCG on ARM (part 2)
Date: Mon, 16 Mar 2020 17:06:15 +0100
Message-Id: <20200316160634.3386-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: odDdS2OaPUbK

Cover from Samuel Ortiz from (part 1) [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. [...]

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

v3 almost 18 months later:
- Rebased
- Addressed Thomas review comments
- Added Travis-CI job to keep building --disable-tcg on ARM

v2 [2]:
- Addressed review comments from Richard and Thomas from v1 [3]

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
[3]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html

Based-on: <20200316120049.11225-1-philmd@redhat.com>
"accel: Allow targets to use Kconfig, disable semihosting by default"
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg04653.html

Philippe Mathieu-Daud=C3=A9 (15):
  target/arm: Rename KVM set_feature() as kvm_set_feature()
  target/arm: Restrict DC-CVAP instruction to TCG accel
  target/arm: Restric the Address Translate operations to TCG accel
  target/arm: Restrict Virtualization Host Extensions instructions to
    TCG
  target/arm: Move Makefile variable restricted to CONFIG_TCG
  target/arm: Add semihosting stub to allow building without TCG
  target/arm: Move ARM_V7M Kconfig from hw/ to target/
  target/arm: Restrict ARMv4 cpus to TCG accel
  target/arm: Restrict ARMv5 cpus to TCG accel
  target/arm: Restrict ARMv6 cpus to TCG accel
  target/arm: Restrict ARMv7 R-profile cpus to TCG accel
  target/arm: Restrict ARMv7 M-profile cpus to TCG accel
  hw/arm: Automatically select the 'virt' machine on KVM
  hw/arm: Do not build to 'virt' machine on Xen
  .travis.yml: Add a KVM-only Aarch64 job

Samuel Ortiz (1):
  target/arm: Do not build TCG objects when TCG is off

Thomas Huth (3):
  target/arm: Make set_feature() available for other files
  target/arm: Make cpu_register() available for other files
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M

 default-configs/aarch64-softmmu.mak |   1 -
 default-configs/arm-softmmu.mak     |  30 --
 target/arm/cpu-qom.h                |   9 +-
 target/arm/cpu.h                    |   7 +
 target/arm/internals.h              |  10 +
 target/arm/arm-semi-stub.c          |  13 +
 target/arm/cpu.c                    | 651 +---------------------------
 target/arm/cpu64.c                  |  19 +-
 target/arm/cpu_v4.c                 |  65 +++
 target/arm/cpu_v5.c                 | 266 ++++++++++++
 target/arm/cpu_v6.c                 | 171 ++++++++
 target/arm/cpu_v7m.c                | 207 +++++++++
 target/arm/cpu_v7r.c                |  83 ++++
 target/arm/helper.c                 |  54 +--
 target/arm/kvm32.c                  |  10 +-
 target/arm/kvm64.c                  |  16 +-
 target/arm/m_helper-stub.c          |  59 +++
 .travis.yml                         |  32 ++
 hw/arm/Kconfig                      |  17 +-
 target/Kconfig                      |   2 +-
 target/arm/Kconfig                  |  19 +
 target/arm/Makefile.objs            |  17 +-
 22 files changed, 1016 insertions(+), 742 deletions(-)
 create mode 100644 target/arm/arm-semi-stub.c
 create mode 100644 target/arm/cpu_v4.c
 create mode 100644 target/arm/cpu_v5.c
 create mode 100644 target/arm/cpu_v6.c
 create mode 100644 target/arm/cpu_v7m.c
 create mode 100644 target/arm/cpu_v7r.c
 create mode 100644 target/arm/m_helper-stub.c
 create mode 100644 target/arm/Kconfig

--=20
2.21.1
