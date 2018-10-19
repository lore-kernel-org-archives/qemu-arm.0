Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3514388wrt;
        Fri, 19 Oct 2018 01:55:27 -0700 (PDT)
X-Received: by 2002:a65:47cb:: with SMTP id f11-v6mr32387914pgs.166.1539939327010;
        Fri, 19 Oct 2018 01:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539939327; cv=none;
        d=google.com; s=arc-20160816;
        b=gi8jixOFDZE6FdBAHSGL29fbNCeIMB36A5ZnGh0maXQoBeWM7JyXr0ZB3Yyq6XXaY0
         dYAaipAGRewFbqM+oIc97GzOnJnlZxAoDP6hIbcTO0pFdhRyHgmN9HslVtzFxwvJQAo3
         7oBOHBPN7XZQCorH12iIYqF6fWqjiDkILPCk5pV251SYlh2Byfto9YFYoXotmgywxGyq
         hcyeoFoZLEhqfu1w06LeJ6F7BquzV+ofmrhYuAMDqp2uJVg7UKdo/LTA1IMInQ94+0V5
         czeVnlsQPhCGo+trQ5w+P6myJT6LiHITzRzOlch2bvlwz2J3f+pLwDipCMIo1y78NctO
         RRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=s8pAzoNQqEqxlE9LdJ4WKpDxgUQdzL6rdpfVRqGWPik=;
        b=HeMHgnwXYqUN+F5V1qGEteduvK6AZHf5EoXdUXAtSpTj9L7m0ZESEI3VU8rDftmO6/
         4lmTJjKLVUr0HJZc5VyyecabJwkIX31Ek41fk4+/CEoIHghkRZhLwHJf08+rdQ24OoS3
         DK822VsbVJ8/vM8hlLs08JptgWjEvKe6f8iyx95pci+1xuA5TV4DR3dKEOZRrMawdcNh
         ElpISvxPJXU/NEXobVmwoB33X4yo8Rs6i8z6qJNMx8V9ZS29kfqmQ7LIJZES6/30Teua
         lMKOqzfgzR8MFnV61vlieP7OP9yQ9b7CElTR7Nk+VUepDQ8LZ1hUX8V1eNzUmhADPYUN
         LDog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QyZqdqK9;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o5-v6sor11846714plh.18.2018.10.19.01.55.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Oct 2018 01:55:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QyZqdqK9;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=s8pAzoNQqEqxlE9LdJ4WKpDxgUQdzL6rdpfVRqGWPik=;
        b=QyZqdqK9u5PuqYp7JwnPyMS2f3DpAYdzABILJH6c5K1n1BAGdoYod0Y6nCw9iLjFtH
         XUY2OxHN3sF2wYZodg0HOEN0075OWi08tnuPLkFX2CpGPj3aqi9+XBSYmDYKQmKpI9Lq
         1g6CTIDTRWrdKsR9E1o37ogdi7KybvI1Tvyhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=s8pAzoNQqEqxlE9LdJ4WKpDxgUQdzL6rdpfVRqGWPik=;
        b=hh/ooRCFrU6LjkKAY2JWngpSNIjWbFwRnTkEWtTrdR2e040W6ggozE/wbBbRarCGav
         cS9Zwun8U3tl/65bW8SWYjdoex4MMJZ/z1HormH6J1EcaSlN19BLfCOTobUjxGmEkZ8P
         ryos3QZ3qCq48CyBBorXlhtxuWDP/KnQ3C5SoelZ/VOcXZR6JgQZwxRHwHTgmaFx82f8
         IiPAiyw/luszn7kWbFm7RU1rygXJV3vbmceXMfpI5Y4jQ8B3baK48HkUANt3RBfxe35Q
         JvMYtA+l9TVorQKdzCpoSsO+07dVyD6dGsoi1pE6V8J1tdp/Vum+g1nBXSRtruBoZwQ2
         x6Nw==
X-Gm-Message-State: ABuFfohNngJqfmggPr5/oOD2u49D7LQi8EsiWmvoPZyCf0fcN2sDcqzp
	xNUGwtPrhdc1kLV8CABjLYRJGmPAESNb4SS4
X-Google-Smtp-Source: ACcGV61d0rHNVewxrzSvvwLO2GxWsgUSTl89SicvWvbWRKMKR/n/q7jR+Uz6uGU3FrRDzGZWkMCJNw==
X-Received: by 2002:a17:902:1104:: with SMTP id d4-v6mr27083178pla.289.1539939326451;
        Fri, 19 Oct 2018 01:55:26 -0700 (PDT)
Return-Path: <hongbo.zhang@linaro.org>
Received: from localhost.localdomain ([45.56.155.225])
        by smtp.gmail.com with ESMTPSA id q68-v6sm23758129pfb.160.2018.10.19.01.55.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 01:55:25 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: ard.biesheuvel@linaro.org,
	leif.lindholm@linaro.org,
	radoslaw.biernacki@linaro.org,
	Hongbo Zhang <hongbo.zhang@linaro.org>
Subject: [PATCH v4] Add arm SBSA reference machine
Date: Fri, 19 Oct 2018 16:55:11 +0800
Message-Id: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: zfW6lYj0v9xl

For the Aarch64, there is one machine 'virt', it is primarily meant to
run on KVM and execute virtualization workloads, but we need an
environment as faithful as possible to physical hardware,  to support
firmware and OS development for pysical Aarch64 machines.

See the patch commit comments for the features description.

V4 changes:
 - rebased to v3.0.0
 - removed timer, uart, rtc, *hci device tree nodes
   (others were removerd in v3)
 - other minore codes clean up, mainly unsed header files, comments etc.

V3 changes:
 - rename the platform 'sbsa-ref'
 - move all the codes to a separate file sbsa-ref.c
 - remove paravirtualized fw_cfg device
 - do not supply ACPI tables, since firmware will do it
 - supply only necessary DT nodes
 - and other minor code clean up


Well, there are still pending issues, you can find my whole tree here:
http://git.linaro.org/people/hongbo.zhang/qemu-enterprise.git/log/?h=sbsa-v3.0.0

 workaround: add fw_cfg, smbios and acpi
 workaround: add device tree nodes back
 hw/arm: Add arm SBSA reference machine
 Revert "target/arm: Implement new do_transaction_failed hook"
 Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"

there are two commit reverts I have to do to boot system currently, these block not only my new 'sbsa-ref', but also the 'virt'.
(other two workarounds can be ignored, they are just for temp using before firmware porting is fully finished)

I am not saying the comments themselves have problem, maybe firmware need to be adapted accordingly too. But before they are fixed, I just simply revert them to not block my run.
(And, I've mentioned in v3 list that there are still problem of booting SMP too, but I won't mention it here this time, otherwise this patch/cover letter becomes too complicated -- at least we can boot one core, I can fix/discuss it later separately.)

Steps to reproduce issues:
1. Compile ARMTF
make CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu all DEBUG=1

2. Compile edk2
make -C BaseTools
. edksetup.sh
export GCC49_AARCH64_PREFIX=aarch64-linux-gnu-
build -a AARCH64 -t GCC49 -p ArmVirtPkg/ArmVirtQemuKernel.dsc

3. Run QEMU
3a. copy or link ARMTF and edk2 images to the directory where you want to launch QEMU
bl1.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl1.bin*
bl2.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl2.bin*
bl31.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl31.bin*
bl33.bin -> /home/hongbo/work/edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC49/FV/QEMU_EFI.fd

3b. command to launch QEMU
command1 to load a whole system
qemu-system-aarch64 -machine virt,secure=on,virtualization=on -cpu cortex-a57 -m 1024 -bios bl1.bin -semihosting -serial stdio -device virtio-scsi-device,id=scsi -drive file=../qemu-imgs/deb9_arm64_netinst_uefi.raw,id=rootimg,if=none -device scsi-hd,drive=rootimg -netdev user,id=unet -device virtio-net-device,netdev=unet -net user

or command2 simply load a kernel
qemu-system-aarch64 -machine virt,secure=on,virtualization=on -cpu cortex-a57 -m 1024 -bios bl1.bin -semihosting -serial stdio -kernel Image -initrd xxx -append "root=/dev/xxx console=ttyAMA0"

4a. system halt with error message
ASSERT_EFI_ERROR (Status = Not Found)
ASSERT [ResetSystemRuntimeDxe] /home/hongbo/work/edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC49/AARCH64/MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe/DEBUG/AutoGen.c(370): !EFI_ERROR (Status)

4b. Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"
command1 can run further to halt at nother place, see 5a and 5b
command2 can load kernel successfully

5a. 2nd system halt with message
Synchronous Exception at 0x0000000078A152F0
PC 0x000078A152F0 (0x000078A00000+0x000152F0) [ 0] ArmVeNorFlashDxe.dll
PC 0x000078A152A0 (0x000078A00000+0x000152A0) [ 0] ArmVeNorFlashDxe.dll
PC 0x000078A11DF0 (0x000078A00000+0x00011DF0) [ 0] ArmVeNorFlashDxe.dll
[...snip...]
PC 0x0000600088C4
PC 0x000060008230
PC 0x580B24C2580B24A1

Recursive exception occurred while dumping the CPU state

5b Revert "target/arm: Implement new do_transaction_failed hook"
then no halt, command1 can boot OS successfully

Hongbo Zhang (1):
  hw/arm: Add arm SBSA reference machine

 hw/arm/Makefile.objs  |   2 +-
 hw/arm/sbsa-ref.c     | 937 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |   2 +
 3 files changed, 940 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/sbsa-ref.c

-- 
2.7.4
