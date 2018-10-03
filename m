Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6431520wrt;
        Wed, 3 Oct 2018 08:09:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62MrO2Op7Ti+SjeZ7u7RU91wLpwHVcSauXLbFmQFEOG1r1Qatl0b3dONyGwMAKMeeLiLjX9
X-Received: by 2002:ac8:2b1a:: with SMTP id 26-v6mr1573322qtu.119.1538579361187;
        Wed, 03 Oct 2018 08:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579361; cv=none;
        d=google.com; s=arc-20160816;
        b=rFmqmpx7ozzhP2gXeZ2SfzHG6o7jFhZ4bIImW0paX+CoazUzKFJaZnzQ8ZgdOvG0Vg
         neRDNURzGp34NS4uT0w3t02XVwMpZY/bTAMR8mpOJk5VlB4Rlgjjns5kGi8/SCjssROd
         pq2gtzPzNc29dbKM1l5BtR3FZWQVO97H1vcYm8JKB14gzEIvzlG1r9TxdIC2P1eta87Z
         85ryNa6Lb3yF5Mr46xMfJB0XULqjjMoeBjc2OWh/8ptDjjfMFd2CgFoaBBs7S9YzFfsI
         lgDpBzTUgLl0DtobZ4oWMfNZVowwoSfycqAC8ZrYjPtAjHRcLZoORcM+vJzHjq/q/Fqn
         LGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=TSu7TXLosXbMGYJPt97EmFJsS+4b2RXVTpVkuO3j0OU=;
        b=IaSaRyEkTGYCAL3Pw5oeREdddZu+dx0MotdP5IXMX6GE/ceB2xLz5uZOSA/ck90Dl8
         /HeT1W/kBmTGPENi9VkHPfwkiqVNsJz0RrY3327WeRZ3dDaqVU1/+j45hXfK1ghOisJn
         0/ugEKzYKBWrZWQljbpg3U7n9U0+aw29oxeTAlTYCv3v0vQejPaaTPOL8hH8D0go16Qt
         2TQ+paro5zgEcFi9LS6M1xaRWWOojhCCES51g12l7XxARbQ80SQ7owgvCP4owFbHgSae
         +8uBLPh/3lfBlB9oOkQY/HGyU/mHShsg6Fs1KpUCSPczqD9SZNgvSj9Q5ePx1U/5Dxwd
         /YMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=szuXZ3Ou;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 133-v6si1083209qki.150.2018.10.03.08.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=szuXZ3Ou;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7im8-0003kB-KM
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:09:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ilM-0003ik-DM
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 11:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ilJ-0003t6-9T
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 11:08:32 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7ilE-0003rO-8A; Wed, 03 Oct 2018 11:08:25 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a23-v6so1813120pfi.12;
	Wed, 03 Oct 2018 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TSu7TXLosXbMGYJPt97EmFJsS+4b2RXVTpVkuO3j0OU=;
	b=szuXZ3OuZnVOV/m7sG+cG3J9K19DW/fbbfh9BDoI+ssZkeudrjPw6nVFwTst0e1aw6
	odq74zPPnMH4Gsg0FnkrHtkpblRCxo2vtpX4cGBqdaCkvSHjx74uuIEi97ZBJ3MIpRO7
	gL1TwLuluZGSzXbsByuB6hU0A2Frek79UoUeTbsXYxMD5OCprwD9/Su/0DjQikj9/n0u
	w3XWRlbldlp2UzKO7Ovo1Du5StG09cDMxIctvCv/iLRYe9otLh/OCfWjwhKuEkkuTLLV
	OJx5tj3zIhe54c80Xv1mVxnQOXcw8hk87OG/P9enopQFVy/8QjL0Ret5fhhVCc91k3tp
	Z63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TSu7TXLosXbMGYJPt97EmFJsS+4b2RXVTpVkuO3j0OU=;
	b=aeuYE2HtYum1+XKKy59Q9oywtF7QMDx9Tzv2OpEW76jrJALgMyMniFzqL0duUS3HJ9
	xGl3NbQVVTCDNj2Xj8jBbmrjpPl2Sxj0FExKTvVQ8voyWPttOiKckTv2zv5tchD9BZQS
	jENIMXXAI5jqDFP6qOgDNqVhriaBlw1ZWC4FdWIjsjgojwLyNRf9arHSGbzbCBBZRjTw
	8fgieVzsjoQMdSWYGmvDwEGhEbnyQN7Rnj3cTCrj2je5uRixuJlugym0CrlRcboeGUq/
	60bLW1MY+FYvzGZR8B6WxsjePyWv4tFTCahZPbNwZMBkDLlRWWVgmAKPSEceXigZRHIA
	ENDQ==
X-Gm-Message-State: ABuFfoijlSvvR7cWv9NSIH80ub1L1tcxqWFxajPUU3nlRXJhsHCWTtwA
	Tfwh722ieuaT0/r8J9lrUyA9qH7oYjA=
X-Received: by 2002:a62:9ec7:: with SMTP id
	f68-v6mr2103435pfk.206.1538579300475; 
	Wed, 03 Oct 2018 08:08:20 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	k13-v6sm2738237pff.30.2018.10.03.08.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:08:19 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:34 +0700
Message-Id: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: [Qemu-devel] [PATCH v1 00/12] arm: Add first models of Xilinx
 Versal SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKocg15xumvh

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

Edgar E. Iglesias (12):
  net: cadence_gem: Disable TSU feature bit
  net: cadence_gem: Announce availability of priority queues
  net: cadence_gem: Use uint32_t for 32bit descriptor words
  net: cadence_gem: Add macro with max number of descriptor words
  net: cadence_gem: Add support for extended descriptors
  net: cadence_gem: Add support for selecting the DMA MemoryRegion
  net: cadence_gem: Implement support for 64bit descriptor addresses
  net: cadence_gem: Announce 64bit addressing support
  target-arm: powerctl: Enable HVC when starting CPUs to EL2
  target/arm: Add the Cortex-A72
  hw/arm: versal: Add a model of Xilinx Versal SoC
  hw/arm: versal: Add a virtual Xilinx Versal board

 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/xlnx-versal-virt.c           | 494 ++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c                | 339 +++++++++++++++++++++++++
 hw/net/cadence_gem.c                | 196 ++++++++++----
 include/hw/arm/xlnx-versal.h        | 122 +++++++++
 include/hw/net/cadence_gem.h        |   7 +-
 target/arm/arm-powerctl.c           |  11 +
 target/arm/cpu64.c                  |  59 +++++
 9 files changed, 1175 insertions(+), 55 deletions(-)
 create mode 100644 hw/arm/xlnx-versal-virt.c
 create mode 100644 hw/arm/xlnx-versal.c
 create mode 100644 include/hw/arm/xlnx-versal.h

-- 
2.7.4

