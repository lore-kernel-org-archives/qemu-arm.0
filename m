Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1273589ejb;
        Fri, 16 Feb 2024 06:45:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQKKySyFozbBkk6NLc/0HF9teJdYku9/BRv+E5BS8/3ZMosEL4V205OC3A8JVvH4+hvuGQMFpNeHb3uHq0DRrcy9QKCQC/
X-Received: by 2002:a17:907:1011:b0:a37:7f72:574c with SMTP id ox17-20020a170907101100b00a377f72574cmr3901723ejb.68.1708094700350;
        Fri, 16 Feb 2024 06:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708094700; cv=none;
        d=google.com; s=arc-20160816;
        b=r7HtoXE47zrRwhu8Hor38MpdlVnJ/uYij6WSIfBEB1O59MjxZiuhfGFN+FFGpajb7+
         lZvhFOCnZLuwqMiY0jTnW7uyDAweqhE+lCxPubHADDhgoaz0crOpNlLaGX6Tji43miCL
         QN0H/7tfK1agSIIgPUVf8w18eDymutGvOL9ibzAORcg8KujD9qx5siGiyA+Y0meAs1Kz
         mvdfbNMumMr1OoDJR1mOgwWeLK6T/0BmnADDA9KLuPT4F9YmIDY0/M1x0pj+WKZTDtBj
         oM/V3Ud2+ZcuyG2mM4SIIYVSV03vNB5jiwgJQWAVIumi5EW6BtIGuy1IRIGt+MlE8T3h
         ERNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=izZ7GFiRNPUU3bhNZ21j7VeckCA00pqcpQqtEJmOCOU=;
        fh=kG8qPZcAAajn2EtpGj4BEilb8ZaJ4/skWg54AR/cORQ=;
        b=vC30gIChUvLTcXXGyNzmQNpr6dWINEm0pmaOPFincn2dPy1KM8YMvyVE86as1QWZfO
         +yyNJk/oDH6CYDKygLU4QuvkUxWiS1ILiOPq8/AeB1nISbucdU/T0cXwG9Ddt/ikFx8L
         vL10gh3zCgsSDM7sQcyBkriTT0rEz2fy0zkhK5z0WDjAWgtkZuPGID+rcrOQFf4Atv9x
         XeQf/UeQZqaIYUGmvOggM/5MwBTvxM53BQ1lSI3hdSkk5palODqb80xC8cMfmfW+9Rre
         xFYdxj1RT6nSjBujrayT94+6d6aH13LA7W3j3qr01KhoUvkZtyH5quKg6N3Tqxec8Dmu
         bC6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AM4G/6va";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n14-20020a170906118e00b00a3de73d1d2bsor407521eja.17.2024.02.16.06.45.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Feb 2024 06:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AM4G/6va";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094700; x=1708699500; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izZ7GFiRNPUU3bhNZ21j7VeckCA00pqcpQqtEJmOCOU=;
        b=AM4G/6vacj6y7NElampsQgRSDwPondqZGMQfRM56nfT5dPSKRMYcZ/Kam1weNC/CZB
         5hSTMZLgJuwfzePcLWqGkU49vZuCKcaa6SoDeB/In22YvaiBaqfD1T4qAobD0C82a0Zh
         oFr8O95FSls6UknzjJReupLGGH9Xb2wq47GL+nIseK64Owps/HsSmvFL4iKf48Nr13eQ
         NXVcmbIfDT8WzcXoNsmxJU8aNPO2/c3alW9R+DwkwBBrqJeYEDR+GQHR58h0zP2eztxA
         eaO4/85QeyOiRoL2QhVNJ5fcKQm9VO3oryhQy7lGtECpvmQxi7rfcj0UT8JthArENBsd
         s+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094700; x=1708699500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izZ7GFiRNPUU3bhNZ21j7VeckCA00pqcpQqtEJmOCOU=;
        b=ZVfRnkEVZTtU9cKcR07qWYWskM90deVYg9lxtSa2vIsURYAxDLPdAcu1EKWZk0CHCJ
         UvPC7YPTEdhA40Ep/SeJ+Cag+tiAauI34lgTIChC1qHQDja3CxiL+qCe0pkykQA9V9Jv
         22mgukW1D8qSfdXQDKdQf/Vh5MBRN6f+wVCT4XWx6n7l4kIjmxHG5WSBhL/5ZLzi6M0c
         g1Fg/g5OeMvg5SZqF8X9qyISIode9ubVd/FPrfmviLsWgeuxCd7ZS2DXUHxGuie7eDal
         31IpUQmXTkYx6x/E88/MTXzgKATH01TVSPvGwc54/4bytwlyoFZcY2qINnDdhP4GIO53
         J6qg==
X-Forwarded-Encrypted: i=1; AJvYcCU4o3jci1CbbGCJGzqt9Ert4PJH9OD4Jx9QY8xwUdm7CAEe7knenk1zEDYQ+FXsgmmKAJanrIE0uO3+6XuKQ2CYydhQzGNw
X-Gm-Message-State: AOJu0YyjlFwIe4jOq0neBmfsF1r1GV256WVfulXZyTLh5R4z8wKx2thR
	y83pKSnsZ3yUQp/BMyEPr/twgZ4YCQOgRaH2tUAIWPWtQu96mYYJnxwDbLgeik31BH5t5sc8bbi
	Pu64=
X-Google-Smtp-Source: AGHT+IGTTB7FUbnPcxEzCXrOvkB6bHLFk4PYXCWySL0/rdc/UxmaF5ZylBXlt1RG/jLejil3hYCWDQ==
X-Received: by 2002:a17:906:5f89:b0:a3d:5e44:83aa with SMTP id a9-20020a1709065f8900b00a3d5e4483aamr3683435eju.20.1708094699909;
        Fri, 16 Feb 2024 06:44:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.210.246])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906199000b00a3d3205c6f9sm1619889ejd.129.2024.02.16.06.44.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Feb 2024 06:44:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Kochkov <anton.kochkov@proton.me>,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/6] Add ivshmem-flat device
Date: Fri, 16 Feb 2024 15:44:50 +0100
Message-ID: <20240216144456.34992-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: mUpwC1+xknwo

This is a respin of Gustavo's v1 [3].

Since v1:
- Respin splitting controversial code in another patch
- For minor changes see notes in patch #1

--

This patchset introduces a new device, ivshmem-flat, which is similar to the
current ivshmem device but does not require a PCI bus. It implements the ivshmem
status and control registers as MMRs and the shared memory as a directly
accessible memory region in the VM memory layout. It's meant to be used on
machines like those with Cortex-M MCUs, which usually lack a PCI bus, e.g.,
lm3s6965evb and mps2-an385. Additionally, it has the benefit of requiring a tiny
'device driver,' which is helpful on some RTOSes, like Zephyr, that run on
memory-constrained resource targets.

The patchset includes a QTest for the ivshmem-flat device, however, it's also
possible to experiment with it in two ways:

(a) using two Cortex-M VMs running Zephyr; or
(b) using one aarch64 VM running Linux with the ivshmem PCI device and another
    arm (Cortex-M) VM running Zephyr with the new ivshmem-flat device.

Please note that for running the ivshmem-flat QTests the following patch, which
is not committed to the tree yet, must be applied:

https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg03176.html

--

To experiment with (a), clone this Zephyr repo [0], set the Zephyr build
environment [1], and follow the instructions in the 'ivshmem' sample main.c [2].

[0] https://github.com/gromero/zephyr/tree/ivshmem
[1] https://docs.zephyrproject.org/latest/develop/getting_started/index.html
[2] https://github.com/gromero/zephyr/commit/73fbd481e352b25ae5483ba5048a2182b90b7f00#diff-16fa1f481a49b995d0d1a62da37b9f33033f5ee477035e73465e7208521ddbe0R9-R70
[3] https://lore.kernel.org/qemu-devel/20231127052024.435743-1-gustavo.romero@linaro.org/

To experiment with (b):

$ git clone -b uio_ivshmem --single-branch https://github.com/gromero/linux.git
$ cd linux
$ wget https://people.linaro.org/~gustavo.romero/ivshmem/arm64_uio_ivshmem.config -O .config

If in an x86_64 machine, cross compile the kernel, for instance:

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j 36

Install image in some directory, let's say, in ~/linux:

$ mkdir ~/linux
$ export INSTALL_PATH=~/linux
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j 36 install

or, if you prefer, download the compiled image from:

$ wget https://people.linaro.org/~gustavo.romero/ivshmem/vmlinuz-6.6.0-rc1-g28f3f88ee261

... and then the rootfs:

$ wget https://people.linaro.org/~gustavo.romero/ivshmem/rootfs.qcow2

Now, build QEMU with this patchset applied:

$ mkdir build && cd build
$ ../configure --target-list=arm-softmmu,aarch64-softmmu
$ make -j 36

Start the ivshmem server:

$ contrib/ivshmem-server/ivshmem-server -F

Start the aarch64 VM + Linux + ivshmem PCI device:

$ ./qemu-system-aarch64 -kernel ~/linux/vmlinuz-6.6.0-rc1-g28f3f88ee261 -append "root=/dev/vda initrd=/bin/bash console=ttyAMA0,115200" -drive file=~/linux/rootfs.qcow2,media=disk,if=virtio -machine virt-6.2 -nographic -accel tcg -cpu cortex-a57 -m 8192 -netdev bridge,id=hostnet0,br=virbr0,helper=/usr/lib/qemu/qemu-bridge-helper -device pcie-root-port,port=8,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x1 -device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:d9:d1:12,bus=pci.1,addr=0x0 -device ivshmem-doorbell,vectors=2,chardev=ivshmem -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem

Log into the VM with user/pass: root/abc123

should show:

[    2.656367] uio_ivshmem 0000:00:02.0: ivshmem-mmr at 0x0000000010203000, size 0x0000000000001000
[    2.656931] uio_ivshmem 0000:00:02.0: ivshmem-shmem at 0x0000008000000000, size 0x0000000000400000
[    2.662554] uio_ivshmem 0000:00:02.0: module successfully loaded

In another console, clone and build Zephyr image from 'uio_ivhsmem' branch:

$ git clone -b uio_ivshmem --single-branch https://github.com/gromero/zephyr
$ west -v --verbose build -p always -b qemu_cortex_m3 ./samples/uio_ivshmem/

... and then start the arm VM + Zephyr image + ivshmem-flat device:

$ ./qemu-system-arm -machine lm3s6965evb -nographic -net none -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem_flat -device ivshmem-flat,chardev=ivshmem_flat,x-irq-qompath='/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]',x-bus-qompath='/sysbus' -kernel ~/zephyrproject/zephyr/build/qemu_cortex_m3/uio_ivshmem/zephyr/zephyr.elf

You should see something like:

*** Booting Zephyr OS build zephyr-v3.3.0-8350-gfb003e583600 ***
*** Board: qemu_cortex_m3
*** Installing direct IRQ handler for external IRQ0 (Exception #16)...
*** Enabling IRQ0 in the NVIC logic...
*** Received IVSHMEM PEER ID: 7
*** Waiting notification from peers to start...

Now, from the Linux terminal, notify the arm VM (use the "IVSHMEM PEER ID"
reported by Zephyr as the third arg, in this example: 7):

MMRs mapped at 0xffff8fb28000 in VMA.
shmem mapped at 0xffff8f728000 in VMA.
mmr0: 0 0
mmr1: 0 0
mmr2: 6 6
mmr3: 0 0
Data ok. 4194304 byte(s) checked.

The arm VM should report something like:

*** Got interrupt at vector 0!
*** Writting constant 0xb5b5b5b5 to shmem... done!
*** Notifying back peer ID 6 at vector 0...

Cheers,
Gustavo

Gustavo Romero (6):
  hw/misc/ivshmem: Add ivshmem-flat device
  hw/misc/ivshmem-flat: Allow device to wire itself on sysbus
  hw/arm: Allow some machines to use the ivshmem-flat device
  hw/misc/ivshmem: Rename ivshmem to ivshmem-pci
  tests/qtest: Reorganize common code in ivshmem-test
  tests/qtest: Add ivshmem-flat test

 docs/system/devices/ivshmem-flat.rst |  89 +++++
 include/hw/misc/ivshmem-flat.h       |  94 +++++
 tests/qtest/ivshmem-utils.h          |  56 +++
 hw/arm/mps2.c                        |   3 +
 hw/arm/stellaris.c                   |   3 +
 hw/arm/virt.c                        |   2 +
 hw/core/sysbus-fdt.c                 |   2 +
 hw/misc/ivshmem-flat.c               | 521 +++++++++++++++++++++++++++
 hw/misc/{ivshmem.c => ivshmem-pci.c} |   0
 tests/qtest/ivshmem-flat-test.c      | 320 ++++++++++++++++
 tests/qtest/ivshmem-test.c           | 113 +-----
 tests/qtest/ivshmem-utils.c          | 155 ++++++++
 hw/misc/Kconfig                      |   5 +
 hw/misc/meson.build                  |   4 +-
 hw/misc/trace-events                 |  17 +
 tests/qtest/meson.build              |   8 +-
 16 files changed, 1282 insertions(+), 110 deletions(-)
 create mode 100644 docs/system/devices/ivshmem-flat.rst
 create mode 100644 include/hw/misc/ivshmem-flat.h
 create mode 100644 tests/qtest/ivshmem-utils.h
 create mode 100644 hw/misc/ivshmem-flat.c
 rename hw/misc/{ivshmem.c => ivshmem-pci.c} (100%)
 create mode 100644 tests/qtest/ivshmem-flat-test.c
 create mode 100644 tests/qtest/ivshmem-utils.c

-- 
2.41.0
