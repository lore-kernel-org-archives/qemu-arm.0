Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2563578ejb;
        Wed, 4 Oct 2023 03:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKxh309L0p2/frh/52kOs8UZmVHU+C3obAiDSMVdL3CD0Sqi/ewmmXtq2GoxaHBNjNPKb6
X-Received: by 2002:a05:620a:280d:b0:775:75ba:c098 with SMTP id f13-20020a05620a280d00b0077575bac098mr2290178qkp.11.1696416975808;
        Wed, 04 Oct 2023 03:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696416975; cv=none;
        d=google.com; s=arc-20160816;
        b=m18fqwswkNNWSsRRWbimp5eSdGlUt9Be3Pdjxtr6BK0z1oZoJ59cv7CMZpOD/U8eBT
         zkhNRC3Z92zBVYKNyFg31inZWASvHmPvuTaKFdbm3mxVULJdO8HGAmFJzjsDqK+yccVO
         uZxhErhUQDemtdRw4uae/vj8Z/GbLTukf+l90aRf5Jg9puchnWC5/BhRb9GGYEO9rwkt
         drPFOn1a0hYH6O3o8zks2fpaNkzUg0f4xW8z+66WOSDx3guFPRR60WpnZySWG7zT6qe4
         qsVZstqZ9f+u6tzNSBb+GYRRuEryOVzDU5bB0gKUX43Lan7cmPYftSXdrnKtl5B79yzt
         tYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9FD4BljU1sQ9YVkLSvJNSIqJH6jZqUEJOwphh36QCTU=;
        fh=y/CSi/JAupQN0XZveWYQlR/B/AL6K+UNC7/cHXs44zc=;
        b=kX4vUUgdY5PL0O4V6AXcp4Urq1R9h3ahvio1QBCutTQzJXdfS8b7YOlnLL9qwHjJ7C
         YdSYfn9iyEulFpb8CpV2igDkCeCCtcjCiotPfm9tNVddxvwOISK/5CH2VvyxuEe2IdIS
         zwPKLkVepNHs5O9Zf6gKUyQveEbKB83h/2ZNS6gVVITuACGgYVneGjd3NNEwAHBefwxn
         tflPkap+ZGQppRRTPwGXyjP/CcI4/VVISU/gU8SS4cPuUHUTUwI+7Zk0hxtikoNtxS4b
         607wuVNzIF24ScYARAKsuuwbhgSKXfC+ffEXXK8bQQE4bwcc1hM8porMpx1lqIYMssDJ
         eGUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bGsUADqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020a0cb44f000000b0065b1f75bf6esi1354558qvf.23.2023.10.04.03.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 03:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bGsUADqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnzXt-0005aH-UZ; Wed, 04 Oct 2023 06:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qnzXs-0005a9-Qi
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 06:56:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qnzXn-0006hQ-01
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 06:56:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so1944118f8f.3
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696416951; x=1697021751; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9FD4BljU1sQ9YVkLSvJNSIqJH6jZqUEJOwphh36QCTU=;
 b=bGsUADqkANUXL3CRgBQrL+KP7fNUCpiHaY7/TV+poSvU+bepztzolV2pn0OS6YWoLT
 sCOy1wmpdiw+X9owRuKWrxkXuUMDiP+sELotu3h01SMYtzWwqJoYdEEV0wCSd7RQE8vn
 AEbs/RaZ9H76VldD+6fPu/49HVbP+HZaDhOJWXma5HJb9LmQWOVaIXzlE7OKDdSY39tO
 m99My6K6jXoWXfNjtxk8KkHdq1ug9w0BM0VKNLiG75X+eQmDJbnSAiOntEJzNsys6s44
 FmrhZN7uCzFKU7ka51hKBAQliHSg7Mf5f0gEnH1CWlXhPxBeCch4t9YD+nu40yZHZPK9
 e8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696416951; x=1697021751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FD4BljU1sQ9YVkLSvJNSIqJH6jZqUEJOwphh36QCTU=;
 b=C4fIbYfQj5ddxbNVrWdgkZHDhFC3NODzt3wstG1THWVvX6qckAk9L/NHtsk9qawfl6
 92lk431z5VIRZ92o8NIANcSiJehVxB156ZNxFbXWVrOSpKtX6teRR1I56m8AZWWu6dBU
 qHkUIh2Jkdv5OiIvHEwvXaNvUlusoUp2gJHgY3ob9qXG4DW3VXfy9GlNhiAXKrg/Wol1
 +Gu2HEU4yzsmkLIfb8KV7slYi8VOHi35NMitkk7U147/eNwsCY9sl6nVp45UEdNfZpHy
 pp59ldy/liUcyDVjBQCt0illcu4XemZKPsK7gKIO2QyYwHfK2nwXWn3Jce1ulNh53lhU
 z4yA==
X-Gm-Message-State: AOJu0Yxrh+gAqOm7o22WqkfeeLbRcomhzSeXZRw80Ul2KUzt9aArqt0f
 KblXR5oIqsjzNho370bkpd/GPm83YhMOEdx3UQg=
X-Received: by 2002:a5d:5591:0:b0:323:1d06:38e5 with SMTP id
 i17-20020a5d5591000000b003231d0638e5mr1866424wrv.55.1696416951333; 
 Wed, 04 Oct 2023 03:55:51 -0700 (PDT)
Received: from myrica ([2a02:c7c:7290:b00:fd32:2b31:6755:400c])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a5d5083000000b003143cb109d5sm3709230wrt.14.2023.10.04.03.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 03:55:51 -0700 (PDT)
Date: Wed, 4 Oct 2023 11:55:58 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Cc: qemu-arm@nongnu.org, mathieu.poirier@linaro.org
Subject: Re: Quick start guide on RME emulation
Message-ID: <20231004105558.GA1454132@myrica>
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7cz7os78l1VL

On Mon, Oct 02, 2023 at 07:52:28PM +0900, Itaru Kitayama wrote:
> Jean,
> It is indeed the latter. Itd be good if we could test how far we can go in
> terms of launching a Realm guest via the CCA aware KVM.

Here is a draft doc that explains how to build and run the whole stack.
I'm not sure where such a document should go. Maybe the QEMU wiki would be
best, since these instructions will change frequently.

Note:

* The following instructions are for QEMU virt machine (just because it's
  the one I'm familiar with). The sbsa-ref machine will be supported.

* I haven't tried to run a secure payload yet, there might be some
  outstanding bugs. Secure payload such as optee would be packaged with
  TF-A as BL32.

* I need to rebase the guest edk2 support, so didn't include instructions
  for that.

Software components:

           |              |              |
           |    REALM     |  NON-SECURE  |
           |              |              |
    -------+--------------+--------------+
           |              |              |
      EL0  | Guest Rootfs |  Host Rootfs |
           |              |  VMM         |
           |              |              |
    -------+--------------+--------------+
           |              |              |
      EL1  |        EDK2  |              |
           | Linux Guest  |              |
           |              |  EDK2        |
    -------+--------------+  Linux Host  |
           |              |    (KVM)     |
      EL2  |      TF-RMM  |              |
           |              |              |
    -------+--------------+--------------+
           |                             |
      EL3  |            TF-A             |
           |                             |
    -------+-----------------------------+
           |                             |
      HW   |            QEMU             |
           |                             |
    -------+-----------------------------+


TF-RMM
------

The Realm Management Monitor (RMM) connects KVM and the Realm guest.

RMM gets loaded into NS DRAM (because there isn't enough space in Secure
RAM). TF-A carves out 24MB of memory for the RMM, and tells other software
about it using a device-tree reserved memory node.

Status: QEMU support is currently under review. Additional patches are
  needed until QEMU supports a couple additional features that are
  mandatory for RME (PMUv3p7 and ECV).

Repo: currently at https://jpbrucker.net/git/rmm/ branch qemu-rme
      official is https://git.trustedfirmware.org/TF-RMM/tf-rmm.git/

Build:	git submodule update --init --recursive
	export CROSS_COMPILE=aarch64-linux-gnu-
	cmake -DCMAKE_BUILD_TYPE=Debug -DRMM_CONFIG=qemu_virt_defcfg -DRMM_TOOLCHAIN=llvm -B build-qemu
	cmake --build build-qemu


Host EDK2
---------

Works out of the box, although it doesn't properly account for reserved
RMM memory yet.

Repo: https://github.com/tianocore/edk2.git

Build:	git submodule update --init --recursive
	source edksetup.sh
	make -j -C BaseTools
	export GCC5_AARCH64_PREFIX=aarch64-linux-gnu-
	build -b RELEASE -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc


TF-A
----

TF-A loads the RMM as well as the Non-secure firmware, and bridges RMM and
KVM. It also owns the Granule Protection Table (GPT).

Status: QEMU support is currently under review.

Repo: currently at https://jpbrucker.net/git/tf-a/ branch qemu-rme
      official is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/

Build:	# Embed the RMM image and edk2 into the Final Image Package (FIP)
	make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu
		ENABLE_RME=1 DEBUG=1 LOG_LEVEL=40
		RMM=rmm/build-qemu/Debug/rmm.img
		BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
		all fip

	# Pack whole image into flash.bin
	dd if=tfa/build/qemu/debug/bl1.bin of=flash.bin
	dd if=tfa/build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096


Host & Guest Linux
------------------

Both host and guest need extra patches

Status: https://lore.kernel.org/linux-arm-kernel/20231002124311.204614-1-suzuki.poulose@arm.com/

Repo: https://gitlab.arm.com/linux-arm/linux-cca cca-full/rmm-v1.0-eac2

Build: arm64 defconfig


VMM
---

Kvmtool and QEMU can be used to launch Realm guests. For kvmtool, see the
cover letter for the Linux support above.

Status: In development

Repo: for now https://jpbrucker.net/git/qemu/ branch cca/rmm-v1.0-eac2

Build:	git submodule update --init --recursive
	# to download the missing subprojects because buildroot won't do it:
	./configure --target-list=aarch64-softmmu
	# Note: when buildroot is configured to use this tree (see below),
	# it will rsync the whole tree including binary files. Therefore,
	# use a separate build directory to make the system emulation
	# QEMU, to avoid conflicts between native binary files and
	# buildroot's cross-build.


Rootfs
------

Buildroot provides a convenient way to build lightweight root filesystems.
It can also embed the VMM into the rootfs if you specify the path to
kvmtool or QEMU source in a local.mk file in the build directory.

Repo: https://gitlab.com/buildroot.org/buildroot.git

local.mk
	KVMTOOL_OVERRIDE_SRCDIR = path/to/kvmtool/
	QEMU_OVERRIDE_SRCDIR = path/to/qemu/

Build:	make qemu_aarch64_virt_defconfig
	# then change some options
	  # BR2_LINUX_KERNEL is not set
	  BR2_PACKAGE_KVMTOOL=y
	  BR2_PACKAGE_QEMU=y
	  BR2_PACKAGE_QEMU_SYSTEM=y
	  # BR2_PACKAGE_QEMU_BLOBS is not set
	  BR2_PACKAGE_QEMU_SLIRP=y
	  BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
	  BR2_PACKAGE_QEMU_TARGET_AARCH64=y
	  BR2_TARGET_ROOTFS_EXT2_SIZE=256M

	  # Generate an initrd for the guest
	  BR2_TARGET_ROOTFS_CPIO=y

	make


QEMU system emulation
---------------------

Repo: https://gitlab.com/qemu-project/qemu.git

Run with:

	qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3
		-M acpi=off -cpu max,x-rme=on,sme=off -m 3G -smp 8
		-nographic
		-bios tf-a/flash.bin
		-kernel linux/arch/arm64/boot/Image
		-drive format=raw,if=none,file=buildroot/output/images/rootfs.ext4,id=hd0
		-device virtio-blk-pci,drive=hd0
		-append root=/dev/vda

To use separate consoles for FW (port 54320), secure payload (54321), host
(54322) and guest (54323):

		-nodefaults
		-serial tcp:localhost:54320
		-serial tcp:localhost:54321
		-chardev socket,mux=on,id=hvc0,port=54322,host=localhost
		-device virtio-serial-device
		-device virtconsole,chardev=hvc0
		-chardev socket,mux=on,id=hvc1,port=54323,host=localhost
		-device virtio-serial-device
		-device virtconsole,chardev=hvc1
		-append "root=/dev/vda console=hvc0"
		-device virtio-net-pci,netdev=net0 -net user,id=net0

  And connect with 'socat -,rawer TCP-LISTEN:5432x' 

To share the files needed for booting the guest:

		-device virtio-9p-device,fsdev=shr0,mount_tag=shr0	
		-fsdev local,security_model=none,path=.,id=shr0

  And 'mount -t 9p shr0 /mnt' in the host.


Then in the host, launch a Realm guest:

	qemu-system-aarch64 -M virt,acpi=off,gic-version=3 -nographic 
		-cpu host -enable-kvm -smp 2 -m 512M -overcommit mem-lock=on
		-kernel /mnt/linux/arch/arm64/boot/Image
		-initrd /mnt/buildroot/output/images/rootfs.cpio
		-append "console=hvc0 root=/dev/vda"
		-M confidential-guest-support=rme0
		-object rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256
		-nodefaults -chardev stdio,mux=on,id=hvc0,signal=off
		-device virtio-serial-pci -device virtconsole,chardev=hvc0
		-device virtio-net-pci,netdev=net0,romfile= -netdev user,id=net0
		</dev/hvc1 >/dev/hvc1 &
	...
	[    0.000000] RME: RSI version 13.0 advertised

