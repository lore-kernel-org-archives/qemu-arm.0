Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1686384dlj;
        Mon, 13 Jan 2025 05:09:07 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVH1ItRnyNKn4cnwbObJ2+Mz4sYCT40P9blTB1NwDmhKLLQJnyN5xppqt+eXY0Kz6iBA9QBgBASffdSSA==@linaro.org
X-Google-Smtp-Source: AGHT+IFEy4u6CimU/GTqGEM2vWcLfpxNYlmkhqcPQwc0wlhMoTxRPkR+LPrLysPWeI7T0qtVSfyb
X-Received: by 2002:a05:6e02:1d94:b0:3cd:dc7e:9236 with SMTP id e9e14a558f8ab-3ce3a87816cmr155356445ab.7.1736773747595;
        Mon, 13 Jan 2025 05:09:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736773747; cv=pass;
        d=google.com; s=arc-20240605;
        b=A9ybNNPkPRQx4vp348nSY7D591xmFbaOYJUEZG9R0HX5piVN7D3cRlYOrb4AWDwOSJ
         atoRuToRIrU7rlsqTo6mvPm3usHtv0Vkwxm5PmvsFjtxiiK0JZR0IDxvyc8x40NaZVMP
         RcaR0XEL+5ie+qXuoHHIcVngcCTKP56YGLomeNMQso1xM83lOVIrYoUdHEEZ7Fd/rjZ7
         4hkEEbPE0t5855K89aiX9LTqu9huraB5BAXUQDwxtOrOmgxTyy9AgIHUf1wUJF8tSACk
         cnawnCsDTe+cU32KWg/hdlzPZFm2mmQ0cKMGJEnBttB1Mt9jX2dALQffbQOt9qgVtGNp
         jT1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vyolnmjA1IuNoLwDfilBdbRVozbMMLvzcBhSO4lgJT0=;
        fh=8WKMlvHBit1egi9o2cK+ScoX/Z5fO36J0VVxubWVY0Q=;
        b=e0qZAMZ5hwHswrGxp7xXoMFov6m5vMFTQqgsZa2y7LZ+N9DGFSmKIiz8G9f83qiGf6
         FWxKwfj/YDUVkoth8kAcaO4J1D5kHG1rCIflb4qp9CCXAOodAZIa6kGukYycZ5NDixbr
         6lfAC6Ej4C6Ecuuqt1ZDdAdBT2Td3cg1sCna1wnnLkCD2ECQDwiDO7yfuIjKU62+XJP3
         nFfEcrGf8+DqFXqaEtw3KkTHmpFu5WvzzH8ZIpPbGRvTyqWhlfq0JtzWroZyiB/UxANu
         hd8sjahDMD1cJ919DMIsh/Mj8ybBFVV3haeMNCKKn/6bo+YaWzLj0j1IRMqlJ5znnndB
         Ob5A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eABLkmXo;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474010-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474010-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-474010-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4ea1b5f80desi5736982173.6.2025.01.13.05.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:09:07 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-474010-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=eABLkmXo;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474010-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474010-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4CC3A4D1E
	for <alex.bennee@linaro.org>; Mon, 13 Jan 2025 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C2B235BE2;
	Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eABLkmXo"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5222F15B
	for <linux-kernel@vger.kernel.org>; Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773739; cv=none; b=g4cUfBY7qKHOQsXf9yAe+XUwcoLB/sfUs7XzVm0+8QWqa15xh1lU3koL52q8uAq7JvOXFLcK2icMm8VB/TmPdXMr0chiDLtM2gtUa8wwlEprOq5ks3qgJghRiCe7cl1j70AxXPhzonY0awlfF0ZHMOqF5ZUtzfKqbqmApgWfZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773739; c=relaxed/simple;
	bh=G9AefVfbo2ddU34R7hJqCBaKTjnnsWnp240udDYJFgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCNzP9M2bZ4NWmHqngNyfAIkk3Zk98k9b5qxrjUqXcN5TuEh47zxCH95h9iXuNA7D+egFS+7wUsYQXggklZUG+JgKfUOzcidkrh+DvnfKI0EHn+OdUP1asSq/kbPE/rY8YfxWB3dZJ0cd/sAtJsajHI3HO76cxY8fAcMA55sPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eABLkmXo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5AAC4CED6;
	Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773738;
	bh=G9AefVfbo2ddU34R7hJqCBaKTjnnsWnp240udDYJFgg=;
	h=From:To:Cc:Subject:Date:From;
	b=eABLkmXoPuGJEqF+GmtErGeQSZliYFMSp6pSynHbiin7aglBJ2Z9SAnglP34J/14i
	 EGSCLEImmgRoDLieOrWVtRNY3klG9/BVzYVKS03FT4GvopnvkiMOrQ+ruICwHMLidH
	 Uw7H5ePpknYvAPevAtf3yyLx04Iq+1WdL4OFSuvxekSO/uM65w6k2/RUKOoXtM1CeM
	 nQIy1WAYulipFiV1kKVAxZMpTS6pdEuB5GPoSwVE6cyzqSzUf8DKGNUTmP4RHIacHY
	 +dItBW6yeNxpsRY6LtbJRhHdsR4SUwAT+H9yZOL3Y6rSl0hzfE8JY7BQoGGN2+mDED
	 6rbvoEWzr998Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tXKBc-00000003Ymq-39wO;
	Mon, 13 Jan 2025 14:08:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 0/5] Change ghes driver to use HEST-based offsets
Date: Mon, 13 Jan 2025 14:08:46 +0100
Message-ID: <20250113130854.848688-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: S2tMSz4QFZgS

(patch resent as c/c ML was missing)

This series was part of the previous PR to add generic error injection
support on GHES. It depends on a cleanup patch series sent in December,
pending merge:

    https://lore.kernel.org/qemu-devel/cover.1733297707.git.mchehab+huawei@kernel.org/T/#t

It contains the changes of the math used to calculate offsets at HEST table
and hardware_error firmware file. It prepares for the addition of GHES
error injection.

The first patch was previously at the cleanup series. It prepares
the logic to support multiple sources.

The second patch adds a new firmware file to store HEST address.

The third patch use the new firmware to calculate offsets using
HEST table.

Patches 4 and 5 add migration support. They assume that this
series will be merged for qemu devel (maybe it is too late for that,
as QEMU is now on soft freeze).

Tested the following scenarios:

1. migration: QEMU 9.2 -> new QEMU with -M virt-9.2,nvdimm=on,ras=on
2. migration: new QEMU -> QEMU 9.2 -M with virt-9.2,nvdimm=on,ras=on
3. migration: new QEMU -> new QEMU with -M virt,nvdimm=on,ras=on
4. without migration with -M virt,nvdimm=on,ras=on

(virt is now an alias to virt-10.0)

Regards,
Mauro

-

The full qemu command when test backward-compatibility when running virt-9.2 is:

1) migration: QEMU 9.2 -> new QEMU with -M virt-9.2,nvdimm=on,ras=on

qemu 9.2:
	$ ../old_qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd \
	-monitor stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt-9.2,nvdimm=on,ras=on -cpu \
	cortex-a57 -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"

	(qemu) stop
	(qemu) migrate "exec:gzip -c > STATEFILE.gz"
	(qemu) quit

qemu devel:

	$ ../qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd -monitor \
	stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt-9.2,nvdimm=on,ras=on -cpu \
	cortex-a57 -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -incoming \
	"exec: gzip -c -d ../emulator/STATEFILE.gz" -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"

	(qemu) cont

	$ scripts/ghes_inject.py arm

	<error properly injected using Using old GHES lookup>

2. migration: new QEMU -> QEMU 9.2 -M with virt-9.2,nvdimm=on,ras=on

qemu devel:

	$ ../qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd -monitor \
	stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt-9.2,nvdimm=on,ras=on -cpu \
	cortex-a57 -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"

	(qemu) stop
	(qemu) migrate "exec:gzip -c > STATEFILE.gz"
	(qemu) quit

qemu 9.2:

	$ ../old_qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd \
	-monitor stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt-9.2,nvdimm=on,ras=on -cpu \
	cortex-a57 -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -incoming \
	"exec: gzip -c -d ../emulator/STATEFILE.gz" -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"
	QEMU 9.2.0 monitor - type 'help' for more information

	(qemu) cont

	$ scripts/ghes_inject.py arm

	<error properly injected using Using old GHES lookup>

3) migration: new QEMU -> new QEMU with -M virt,nvdimm=on,ras=on

	$ ./qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd -monitor \
	stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt,nvdimm=on,ras=on -cpu cortex-a57 \
	-smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"
	QEMU 9.2.50 monitor - type 'help' for more information
	(qemu) stop
	(qemu) migrate "exec:gzip -c > STATEFILE.gz"
	(qemu) quit


	$ ../qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd -monitor \
	stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt,nvdimm=on,ras=on -cpu cortex-a57 \
	-smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -incoming \
	"exec: gzip -c -d ../emulator/STATEFILE.gz" -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"

	(qemu) cont

	$ scripts/ghes_inject.py arm

	<error properly injected using Using new GHES lookup>

4. without migration with -M virt,nvdimm=on,ras=on

	$ ../qemu/build/qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd -monitor \
	stdio -m 4g,maxmem=8G,slots=8 -no-reboot -kernel \
	../work/arm64_build/arch/arm64/boot/Image.gz -device \
	pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device \
	virtio-net-pci,netdev=mynet,id=bob -drive \
	if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd -object \
	memory-backend-ram,size=4G,id=mem0 -netdev \
	type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
	tcp:localhost:4445,server=on,wait=off -M virt,nvdimm=on,ras=on -cpu cortex-a57 \
	-smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -append \
	"earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4"

	$ scripts/ghes_inject.py arm

	<error properly injected using Using new GHES lookup>

---

v4:
  - migration changed from 9.1 to devel and series are rebased on the top of
    upstream master

v3: did some minor cleanups at the code, as suggested by Jonathan Cameron.

v2:
  - some whitespace and comment changes
  - patch 3/6 (acpi/ghes: rename the function which gets hw error offsets)
    was merged on the cleanup series.

*** BLURB HERE ***

Mauro Carvalho Chehab (5):
  acpi/ghes: Prepare to support multiple sources on ghes
  acpi/ghes: add a firmware file with HEST address
  acpi/ghes: Use HEST table offsets when preparing GHES records
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/generic_event_device: add logic to detect if HEST addr is
    available

 hw/acpi/generic_event_device.c |  30 +++++++
 hw/acpi/ghes.c                 | 156 +++++++++++++++++++++++++++++----
 hw/arm/virt-acpi-build.c       |  33 ++++++-
 hw/core/machine.c              |   5 +-
 include/hw/acpi/ghes.h         |  23 +++--
 5 files changed, 218 insertions(+), 29 deletions(-)

-- 
2.47.1

