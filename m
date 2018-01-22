Received: by 10.28.71.27 with SMTP id u27csp3197754wma;
        Mon, 22 Jan 2018 11:49:15 -0800 (PST)
X-Google-Smtp-Source: AH8x224BMpUDq2ooSEezPizmT53644obDrEy+//cIHjurh7RDP/OxDALQx9pytwKYon9hLk4/XCB
X-Received: by 10.37.79.130 with SMTP id d124mr13673ybb.150.1516650555143;
        Mon, 22 Jan 2018 11:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516650555; cv=none;
        d=google.com; s=arc-20160816;
        b=zHgfN2rqmRM8KQn4KzBkhh4C4caGf/zNjTXT4xcWORwivigkE1VwbfWmR+W/hH0ZSJ
         e2qdccAPYkz+StfTZwm57apnT1TAQIhQBNfWvkhl9KOKUdtb0Gd7tNmWKlGbgKw7+LpH
         FE3KxcQ/FFP/ME4xOqILZr0xc0C7QDrDHI2fARuzwnDilL7o33YGtgBeAIFKzmbh7G0i
         JyuSqWZEBWy2Ht95rzqWUDw+hwEJIs9UboHsnAu4NGMJSRa+5RFA4bmdx+oWuo1uwYdn
         QqGU+VNFJsYG2box4FNHzh2HQ4NrI353uaX9seTC/F/V7pV9jNsNfjsaIlfKO3YqUpF4
         VYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=SBOROAj8Z7DxT/TEh/cSKb3L28WULAI/Hd5V41wgQi0=;
        b=VDkzQZFdk8tlHj1cAnYcnmBBAee367zjUEQPvF3VuyjmSBhcIXlDlDJndE4teEVvaN
         pcmYj8Ps9GSuKsB8V/6cZq7vD+o/1wHYZRV1pirZsoptPwUvNeyEJIWKqHmWdYdDpwGq
         s6FZsGyafzCfQaxQ28azjuB2T0WnVlRhMmGTvnkUggEHa3HRXypLpxVR/VEvN232m8iT
         R7WvhgMWJviR2um8JVrS0lBA/+wuhwpBcCD9MXZY/6/uOxWmelv+iqofzJPeS0qTwuES
         YcVSLrAhg/03VOAYJ8zEqtg3u6ThcJ4Du09b+Ob3xd1K2mrEPMqSCZVF/FA/O+wWrpo1
         /NVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nxzDO8iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si2081308ybk.279.2018.01.22.11.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 11:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nxzDO8iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edi5i-0007o2-EQ
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 14:49:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4G-0006m1-AU
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 14:47:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1edi4F-0005mB-E3
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 14:47:44 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1edi4A-0005h4-3A; Mon, 22 Jan 2018 14:47:38 -0500
Received: by mail-pf0-x244.google.com with SMTP id e76so7897270pfk.1;
	Mon, 22 Jan 2018 11:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SBOROAj8Z7DxT/TEh/cSKb3L28WULAI/Hd5V41wgQi0=;
	b=nxzDO8iq6EC0F78DZhjk/23GU7CmZII5LE75NIo0CGE5BGO/GopEzdk7clIA0mhIZy
	YJgt67IgpE6bY3W3OFaKPEvQ+jj4HCLlXz/dCQK6a2iN21kTkhNKQK2GZI1W1YHo1i9N
	7cv6AabRLArs6YOHAEYV/tVhxuYIayEi9Z+XUN6U9St5U0bul79LMDRUn80d2AWnMMrI
	O7vtQzKdES6aT2Q8h0T8dPTVkuaT7TttMjy/A7oBkwYUbG2KOUuIin8bDPxWwhF3J/zg
	6EnKUGJ0C6pmaIJgscumfcDYsl+IEdJQgp3FFExkTydjy4fufHJJufaCzp7qk6KxpbRC
	lQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=SBOROAj8Z7DxT/TEh/cSKb3L28WULAI/Hd5V41wgQi0=;
	b=YlAcbh3YLo/igjXvyJrEDp9pIozbvXTKXZVOpwoEMOmEa1zU8I7W7PFUeUI8qqHi/P
	vtW2IdZ83b0Jw3mQKnpuQv3tvPnAPkoo5qnypz1VkrULSsmWi44pjD6Ym6T4VCAtL55G
	4cSFq/kD/OMfpPpxvW9nyuzq7AyvHQLKEMbYJYMNCc104It6oLmPtaG46x4qoVpyzTth
	bkrLMD+sjCzTp+nDWp8SeaRwcqdjgXqTCLkZZp7A5yIK0d6YT1dqhIigzs0cvx7Sy54e
	36phi1ji29ZvqU0Uvfq4/Zutn2InbB9JGv/DQQw2M2ALd0v6F7G3qHBJnrFATW/l5iZ7
	Y29g==
X-Gm-Message-State: AKwxytdkIvKV8cP5XYTrbifN2LkWmyKwL/h+3adN3FC+9+TkxwlwB+it
	dZ/BhxrfXoAuVy2Ywg5/0RLwJIND
X-Received: by 10.101.80.204 with SMTP id s12mr7728044pgp.185.1516650456196;
	Mon, 22 Jan 2018 11:47:36 -0800 (PST)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	b69sm2802004pfk.128.2018.01.22.11.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Jan 2018 11:47:34 -0800 (PST)
From: Alistair Francis <alistair.francis@xilinx.com>
To: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
Date: Mon, 22 Jan 2018 11:43:11 -0800
Message-Id: <cover.1516650109.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v7 0/9]  Add the ZynqMP PMU and IPI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7soqih9/KSOl


This series adds the ZynqMP Power Management Unit (PMU) machine with basic
functionality.

The machine only has the
 - CPU
 - Memory
 - Interrupt controller
 - IPI device

connected, but that is enough to run some of the ROM and firmware
code on the machine

The series also adds the IPI device and connects it to the ZynqMP ARM
side and the ZynqMP PMU. These IPI devices don't connect between the ARM
and MicroBlaze instances though.

V7:
 - Fix Phipippe's comments
V6:
 - Pass initrd instead of kernel to microblaze_load_kernel()
V5:
 - Fix clang makecheck error
 - Rebase on master
V4:
 - Rename the ZCU102 machine to just ZynqMP
 - Rename the PMC SoC to "xlnx,zynqmp-pmu-soc"
 - Move the IPI device to the machine instead of the SoC
V3:
 - Add the interrupt controller
 - Replace some of the error_fatals with errp
 - Fix the PMU CPU name



Alistair Francis (9):
  microblaze: boot.c: Don't try to find NULL file
  xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
  xlnx-zynqmp-pmu: Add the CPU and memory
  aarch64-softmmu.mak: Use an ARM specific config
  xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
  xlnx-zynqmp-pmu: Connect the PMU interrupt controller
  xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
  xlnx-zynqmp-pmu: Connect the IPI device to the PMU
  xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC

 default-configs/aarch64-softmmu.mak    |   1 +
 default-configs/microblaze-softmmu.mak |   1 +
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
 hw/arm/xlnx-zynqmp.c                   |  14 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
 hw/microblaze/boot.c                   |   2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c        | 204 ++++++++++++
 hw/arm/Makefile.objs                   |   2 +-
 hw/display/Makefile.objs               |   2 +-
 hw/dma/Makefile.objs                   |   1 +
 hw/intc/Makefile.objs                  |   2 +
 hw/microblaze/Makefile.objs            |   1 +
 15 files changed, 1275 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

-- 
2.14.1

