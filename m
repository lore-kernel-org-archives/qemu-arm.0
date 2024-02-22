Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp230510ejf;
        Thu, 22 Feb 2024 14:24:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCvMSl04+S1UzKRmd0zTW2ve3ZgNexu71ytNcTzG+3KISX08o6z9Y1/iaSjRGSG8PfT8jvrnVDCSKaYwGOCUKxB28h9izZ
X-Received: by 2002:a17:902:a502:b0:1db:e792:bb38 with SMTP id s2-20020a170902a50200b001dbe792bb38mr168406plq.63.1708640657739;
        Thu, 22 Feb 2024 14:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708640657; cv=none;
        d=google.com; s=arc-20160816;
        b=k4fzSB/sTYqufPtMsztdbv+d+q3G2Ax52THVV/Dhx9NVLHyUWJSSSRdjSM7L0hgOh6
         zQsBe+5BqHmtc+jnuzKhApjFuio3MyPukltbNGCAWF52c1phPxd1n06rYEsFdhu6YU5i
         ri9GnRWQ5TSyBx9fD7/Fl5pM6Dpu38y/zMp+a9EERDrnEiYj4A1KEivokZh35eoy2CiN
         jMNm96iq/msU/UGVUmzB5ic3xe7eOmd0ZlxzcesibGIoA2xP4H72jomuIRPo0IXDDsbq
         B+u3fGY/t5CIrJq9BXHcgiFacRUy4/v99c8Ne9KDgFexMG6CZCtufyus2qDPPd3riHYX
         qmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=odmBrfxrVJqhwVA+IUSN99OoFSVOcM+f5audJj2ZfrI=;
        fh=KbXrFzt0uLmGywcD+4CLGlJxnh1oUQ6VbgHItiac3ZM=;
        b=bnLQbs2C7QN9q1qUkwg3pmEFZTRSB8SGcspd+0cr/icVeR9wprvxwb0ncWSgoI+oWD
         OTQIYn9sYL1p4VAJtYcO9Up9zKQcuUleChCphPxO77/btqI/IPUBNJokwBALIeKKtGjg
         VMPLyK1zgbMZjk0yKyYbH6TOGPw4iWT49XDpEyWlxbL/4LMUlPqi6yZmvtXThyq2wHF0
         0gjQXXaS8O6U77yeUlPG5vFJ3CAZ4uKCEQ74JMTVgmZ0NYAcHe0+KoISUzCic9kY+z3m
         BGnmxLiZgOfVOjVlmM24pLZsQwcdtroguuQuc7jWJT/XUnz59NoF2K32NDx6AOKmqo6m
         PWsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUSyBVAd;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15-20020a170902650f00b001dbb1379e2csor5878282plk.12.2024.02.22.14.24.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Feb 2024 14:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wUSyBVAd;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708640657; x=1709245457; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odmBrfxrVJqhwVA+IUSN99OoFSVOcM+f5audJj2ZfrI=;
        b=wUSyBVAdyYM7Rc7FqsjEj6oqb6dtHwX2fFaSAXEUEfW7GvxtnHGihpuxgqC0bxMTcW
         cG+PPS6w+KmSfzTf0s0wz+48aCI6TrZb/scJmQwP0au7Qi4AnTg6LIPeAZOd/m9eLr8B
         V2Yhet7k7HCsptItZTtKDttBr0QR6IWTI7dKdi8F8xgvwUFX4u8ZwgvPh1SnIszUmJXh
         iDQbu2UJrt6ONZ+68OAq7uoWJj+HWWj76aTHExMDZ9jmtQwmF6rkOppa5lzwBRaEEhEp
         jfcGCPRrmWUJTDm3j0U/vKjCMd6LfYt3e9WQKvjvJJMCIajY/4SrbCEqGzplseUq3M0+
         KB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640657; x=1709245457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odmBrfxrVJqhwVA+IUSN99OoFSVOcM+f5audJj2ZfrI=;
        b=Y1aZB4fbMWwZ/TV1HvKef18ec7/qN6QtnHflphG5yKjmpnhvuaknLo5m/wlDO8sE/3
         ewv7BVwqdVtQ5tejzON0N9ZTYFURqgqtxnktvSGIzuro1Jq40GcGJK5d5b5bn81fxv7e
         7jWG9Csy2cIVccj8cdkExATCJEuoPlDAOm5GHiO1Fj5ywrYnWgo8YDfnnd7F/dC0mvqa
         9b+q5GqcTd/JBGSCg4Oo7dMF/cKRvWMK4sCe0vC5PvtVrjd1ky/EOLyq10m0MRwwhrW4
         uaMaDQMY8ub88IzoAP7al0JUcTtyThqK9PV4B/+3qdguQzi39NVQOF8h+KKvuImQAHWz
         cw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdEpzHGPBr/LCypX7eRxqDsWM0ZJzZT/zuq5Dx5/mz9eb66LFYiKkWpBeGSx9BcrWSd4hQNjruNY4Tz3XAnZmcdf0sHifN
X-Gm-Message-State: AOJu0Yxo6UP+z6Lk9G6NjLAsod0WRCBqXZKWSc15Lhx8Uyuah1fe9BYC
	nPWHI8lTirVG0Q+ClmD7abrBKQNGdFEVo9O3rleIf15pj6Ki0b8vCyQg66c6wUOnuQ==
X-Google-Smtp-Source: AGHT+IHFqLrcw/KANkMAQvECqMQhVS7dpdsPVJlM2RLEIlbDAoquX2rq27vi8H8SzxBqVZJ7wpykAg==
X-Received: by 2002:a17:902:6548:b0:1d5:f36c:8737 with SMTP id d8-20020a170902654800b001d5f36c8737mr168930pln.68.1708640657196;
        Thu, 22 Feb 2024 14:24:17 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from amd.. ([2804:7f0:b400:285a:3e7c:3fff:fe7a:e83b])
        by smtp.gmail.com with ESMTPSA id ji7-20020a170903324700b001d7057c2fbasm10457210plb.100.2024.02.22.14.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 14:24:16 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	philmd@linaro.org
Cc: thuth@redhat.com,
	lvivier@redhat.com,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	anton.kochkov@proton.me,
	richard.henderson@linaro.org,
	peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 0/6] Add ivshmem-flat device
Date: Thu, 22 Feb 2024 22:22:12 +0000
Message-Id: <20240222222218.2261956-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nSPEktxxYo7B

Since v1:
- Correct code style
- Correct trace event format strings
- Include minimum headers in ivshmem-flat.h
- Allow ivshmem_flat_recv_msg() take NULL
- Factored ivshmem_flat_connect_server() out
- Split sysbus-auto-wire controversial code in different patch
- Document QDev interface

Since v2:
- Addressed all comments from Thomas Huth about qtest:
  1) Use of g_usleep + number of attemps for timeout
  2) Use of g_get_tmp_dir instead of hard-coded /tmp
  3) Test if machine lm3s6965evb is available, if not skip test
- Use of qemu_irq_pulse instead of 2x qemu_set_irq
- Fixed all tests for new device options and IRQ name change
- Updated doc and commit messages regarding new/deleted device options
- Turned device options 'x-bus-address-iomem' and 'x-bus-address-shmem' mandatory

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

 docs/system/devices/ivshmem-flat.rst |  90 +++++
 hw/arm/mps2.c                        |   3 +
 hw/arm/stellaris.c                   |   3 +
 hw/arm/virt.c                        |   2 +
 hw/core/sysbus-fdt.c                 |   2 +
 hw/misc/Kconfig                      |   5 +
 hw/misc/ivshmem-flat.c               | 531 +++++++++++++++++++++++++++
 hw/misc/{ivshmem.c => ivshmem-pci.c} |   0
 hw/misc/meson.build                  |   4 +-
 hw/misc/trace-events                 |  17 +
 include/hw/misc/ivshmem-flat.h       |  94 +++++
 tests/qtest/ivshmem-flat-test.c      | 338 +++++++++++++++++
 tests/qtest/ivshmem-test.c           | 113 +-----
 tests/qtest/ivshmem-utils.c          | 156 ++++++++
 tests/qtest/ivshmem-utils.h          |  56 +++
 tests/qtest/meson.build              |   8 +-
 16 files changed, 1312 insertions(+), 110 deletions(-)
 create mode 100644 docs/system/devices/ivshmem-flat.rst
 create mode 100644 hw/misc/ivshmem-flat.c
 rename hw/misc/{ivshmem.c => ivshmem-pci.c} (100%)
 create mode 100644 include/hw/misc/ivshmem-flat.h
 create mode 100644 tests/qtest/ivshmem-flat-test.c
 create mode 100644 tests/qtest/ivshmem-utils.c
 create mode 100644 tests/qtest/ivshmem-utils.h

-- 
2.34.1
