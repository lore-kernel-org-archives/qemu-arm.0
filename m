Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3349870wrt;
        Mon, 22 Oct 2018 10:36:43 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61cm2xF9pEDPkt7x6dUGXmmxJzSJmoYBRySlx/Wnxs2V3ADH0rRQsCW1sf8AhLC8GFZOtum
X-Received: by 2002:ac8:7153:: with SMTP id h19-v6mr45588366qtp.361.1540229803527;
        Mon, 22 Oct 2018 10:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540229803; cv=none;
        d=google.com; s=arc-20160816;
        b=VTv88+RhVSn8MhuPl/AE6N9V5/fuzG1h23Aju8zUlxA8I5P1HpjiW7kGGtUSGzFjdv
         LTFw0O92JM227q8SaYJWzF96NFgxRI0sJrVaOWm0NJ1DigeEh+UFmHrjDd5L9pvFfeGx
         75WYyJdrTj8G4Oawv5kMNz726Uv8Gzak2EVIUrnycpu0wphX5UGO9vXhqUgDE5Z7NSJu
         4Ny7fmQqAOwbtOV3UrMpAHX+Uk1VXIRc97uQ6tgyPQHj9Py5vtvIUd8IgcHJj374bsqN
         Avh5NoBJrn3vZV/jDcRzYBb5OwuvTpxhqWykqjq6Rhcrlx/G//BjHf+eta0bDSWd005m
         5eRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=/AbcxCeMAc1cfai+vFAtEsOUQ/38xXGm1I7PN7mkYZY=;
        b=kwE7VJ2Q2aY3eBEJMW1Al8ZyGF2ufhy0yhKBlrmXKayyqgXOrUmQsnf3rUY9KS6kV9
         h4IGD6qme3S6it0usVeJ0k7w1YSznZGm311NPKWAl6RzygEgx4pyVieddsMK5gQ747W0
         secZRohYYSZAiUPnODN4tkDPKWBR1tSfEKNKhlR++viwvz1RycJqZ+z7vrV0mfUgNOgL
         EY/A4cd71pbok7YDX/VkPI8InAMj4up/u35Ud6kIj8s7R+Df7KZ2cfdvJ2RB/BAI7j3h
         5+Ifa4UTrL0HKDSlnL5oMuRrUzxBWLnkT2Vjd8neqUoU+vHOdiAbcqpD+St5aKs/0l7W
         vf0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BU+cGjwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k19si2123069qvg.219.2018.10.22.10.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 10:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BU+cGjwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEe8B-00065b-0a
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 13:36:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7e-0005tR-1L
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 13:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7c-0002Xe-Kb
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 13:36:09 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:40167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gEe7Y-0002Sf-3i; Mon, 22 Oct 2018 13:36:04 -0400
Received: by mail-lf1-x142.google.com with SMTP id n3-v6so4205846lfe.7;
	Mon, 22 Oct 2018 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/AbcxCeMAc1cfai+vFAtEsOUQ/38xXGm1I7PN7mkYZY=;
	b=BU+cGjwe36BkOAFdpogbDz5KZdn5lJqT/VQAxVgNMSkMRCpCnBfFyYxsRwxUifCdx+
	wcDMT7bk5ZpSx2Wx6WYqaeNzv6SdmtFKrX4eF05nuJ/kKsdEUF6CLr8scMVQSgfICPoj
	phrxnPpkmQhIVR+Vr4FNskFeTkLn4PrIwW5SchJAvchQ7NOgu2QwZDpRNNwkNgjr32ah
	YqKy2TepJsQB5sAHEoxreSjLgzZqsrlpZHAQK45P6GfMmZ1PiVtHQNipbdoreu0TPhfD
	hvUvcvHmXNDM9D+/rE64KNLxM1LF/oEszxLFLKS362iRtDKxpKuQ+LgJ01q8FVS9kiNw
	olmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/AbcxCeMAc1cfai+vFAtEsOUQ/38xXGm1I7PN7mkYZY=;
	b=od+Kniu321IV08OjrIPL1acz9bRsBEXwYVt8Z8zmYppqMBYq0ifKeSQ4G/Cn0yLrzr
	SG+2BgYAW1MfUoyTApG0eptnP/sD06A/okMhdRc8rCyXahI4H79kSQ44OFaBZCv98TSw
	hz4ohY/oZPW8Bk0+pMM35EkRqdl0LGf7/NGOFuuQXSAKMWCaL/fNDkq77dXBs/ami7en
	2yCxCLrpwD0zairB5JGrMS+wLzQh3eGLlK6kPZqsAJppfW3G12NaC+cxigiFfpntap4q
	24fBHe9D2vEDk+a3qPAWl5Y8vz3/tYtb9IctP/FsQh9IivA937YT0mXVzckBsUvgj9lq
	WmuA==
X-Gm-Message-State: ABuFfohwOlu48ID7UqZEODQOMPclFEDZMp+hIgv6HcC4nxL59xxm89+w
	PEpOldtGU1UvY5j2OzjnWobpGdXN
X-Received: by 2002:a19:8c1a:: with SMTP id
	o26-v6mr9772304lfd.90.1540229761837; 
	Mon, 22 Oct 2018 10:36:01 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm7180035ljf.0.2018.10.22.10.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Oct 2018 10:36:00 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 22 Oct 2018 19:35:55 +0200
Message-Id: <20181022173559.17111-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: [Qemu-arm] [PATCH v4 0/4] arm: Add first models of Xilinx Versal SoC
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iGgck211HkOZ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This patch series adds initial support for Xilinx's Versal SoC.
Xilinx is introducing Versal, an adaptive compute acceleration platform
(ACAP), built on 7nm FinFET process technology. Versal ACAPs combine Scalar
Processing Engines, Adaptable Hardware Engines, and Intelligent Engines with
leading-edge memory and interfacing technologies to deliver powerful
heterogeneous acceleration for any application. The Versal AI Core series has
five devices, offering 128 to 400 AI Engines. The series includes dual-core Arm
Cortex-A72 application processors, dual-core Arm Cortex-R5 real-time
processors, 256KB of on-chip memory with ECC, more than 1,900 DSP engines
optimized for high-precision floating point with low latency.

More info can be found here:
https://www.xilinx.com/news/press/2018/xilinx-unveils-versal-the-first-in-a-new-category-of-platforms-delivering-rapid-innovation-with-software-programmability-and-scalable-ai-inference.html


In QEMU we'd like to have a virtual developer board with the Versal SoC
and a selected set of peripherals under the control of QEMU.
We'd like to gradually extend this board as QEMU gains more support
for Versal hardware components. QEMU will generate a device-tree
describing only the components it supports and includes in the virtual
dev board.

Before adding Versal support, this series starts with a few fixes to the
GEM that I ran into when running recent kernels on the Versal and ZynqMP
models.

I also noticed a problem with HVC insns not being enabled when using
QEMU's PSCI implementation on CPU's with EL2 and EL3 enabled. This causes
problems for Linux/KVM guests, also fixed in this series.

Best regards,
Edgar

ChangeLog:

v3 -> v4:
* Improve error handling for CPU and GIC creation
* Remove KVM checks in GIC creation

v2 -> v3:
* Fix DESCONF6 queue mask generation for GEMs with only one queue.

v1 -> v2:
* Spell out OCM as On Chip Memory
* apperture -> aperture
* Remove copy+pasted virt board comment
* Remove VMSD for Versal SoC (with a comment on why it's not needed)
* Embedd AddressSpace dma object in GEM
* Remove debug left-overs in arm-powerctl
* Enable PMU in Cortex-A72
* Rename cortex_a57_a53_cp_reginfo -> cortex_a72_a57_a53_cp_reginfo


Edgar E. Iglesias (4):
  net: cadence_gem: Announce availability of priority queues
  net: cadence_gem: Announce 64bit addressing support
  hw/arm: versal: Add a model of Xilinx Versal SoC
  hw/arm: versal: Add a virtual Xilinx Versal board

 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/xlnx-versal-virt.c           | 494 ++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c                | 323 ++++++++++++++++++
 hw/net/cadence_gem.c                |   9 +-
 include/hw/arm/xlnx-versal.h        | 122 +++++++
 6 files changed, 949 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/xlnx-versal-virt.c
 create mode 100644 hw/arm/xlnx-versal.c
 create mode 100644 include/hw/arm/xlnx-versal.h

-- 
2.17.1

