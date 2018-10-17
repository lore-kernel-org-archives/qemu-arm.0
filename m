Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1305089wrt;
        Wed, 17 Oct 2018 14:40:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62DKmyeZ96CZzfKPO+pCl7z4elE0bZLmQeHnRKsDubWRIHZhtT2eMrKfqnZ0XpyS9sXdPOE
X-Received: by 2002:a0c:8950:: with SMTP id 16mr22233914qvq.56.1539812403630;
        Wed, 17 Oct 2018 14:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539812403; cv=none;
        d=google.com; s=arc-20160816;
        b=eP0s7usA6XtM/gbqU7QHMyh1VsbFeGz6Cvxd/ee9ZJKmzhlI+6Tv5+9EAwH+rHmBRG
         9hR0dRN19IcqYwhUvo58Azkj0hPwrnQSGGjB80gd7cglzQEIsCg94ni6mR5Agmh0WWqq
         CI3uR8XIpkEnhOKucNi97MfUyGRkKBjC3iLi7knr5Kg3Vg+4Peh4AiYkSRNUrDUgATEi
         nyX6aoRiJgPMEllm7ZAuXDjibqqmXjRP0e7QIVCt7eMZU0azD+Pr6EPuEQWKyjkN2LcU
         Kvb3288cC3HNV0vm9qE1SfyVXEIQlWpr/drnIuyatXAYTWoZ666WEMTSY6+2HzZoz2av
         0HIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=rPcIZlxKm3/18DLiAG5aTqK/iiP50srRilbHJAJW0Hc=;
        b=YsGfpjTSpKbAlkxxF0tKB3Ges+nbLRNGgiycAIjS5JBt3/hrvobQ3hRwHsZrg6H9NA
         I85l6zeo0flgN6dbERn79UMxrqM5nawQFLNlBLNvhfV53WvA5cGjrnEtNC0SHrozssmL
         hL7p/k7ej3hbKLlvXji42Ss1l4TeaQFyYjBUIPgsumkrklIwouxUm2XGPRa2zIFbwKxr
         rhVRxcPMFl6VgJF1cqucoC/BOClmYPE7rbHjowfcFqbM51r3At0yMyziFlEimiSS6hI9
         VWw2i9mUGUNJ2bQBv4T1a1xkopSKao/slxE/Uf8wr5Z7n/ys8HG1I8FlFLAdt9DHIWmR
         s51A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=psBX6o1z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11si7491622qvh.109.2018.10.17.14.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 14:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=psBX6o1z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCtXv-0007EK-2i
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 17:40:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gCtXc-0007E4-7g
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gCtXW-0007tK-OC
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:39:42 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:40813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gCtXW-0007rw-2B; Wed, 17 Oct 2018 17:39:38 -0400
Received: by mail-lj1-x243.google.com with SMTP id r83-v6so25746993ljr.7;
	Wed, 17 Oct 2018 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rPcIZlxKm3/18DLiAG5aTqK/iiP50srRilbHJAJW0Hc=;
	b=psBX6o1zReBDWpy/0v9+Bm21Dc2HYt8R59iFKJHBtt7Ngd416rBTAFMMHgqGKlvP/h
	/A9RZvM0+HPgNQ/52Xcnncvfh6N4HX02cJdc5zQ8rDld38ZnCh2qlyB5he4W9hhI34p0
	sw4Ryu1ULCDCJFdoxK9guUvT8mNdfN0vG2hgNzUSGdU/q6A0QcLPIuLdXmNoMgj4OAs8
	+MiQvXwmKE6ViOyYPA0hOqnLEFTlqr9awohtazL3XeL0p9XhTBs+OlKrwZMCyVNaByO4
	kqn7HQVgdLKXrWXYyJ/Ui6pio775xcQGG6AEaK1LO/42IzlnNXEiJwQNuetao2QUe3j3
	Qdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rPcIZlxKm3/18DLiAG5aTqK/iiP50srRilbHJAJW0Hc=;
	b=QnPi70wbbTl3ux7mqNDQms05Mvya9ZztYduf7OLJKh/70toaSfXjPeBEZi+bhC1NaV
	Vz72m5Vo8T+EVs8ol6jrGbGNEIyIS2KlCaBk2m3DlaCjAukPz5o/b9HxOSQK+HkoImAG
	V+dAzPbytgQmkfMlHewUVGAByCHgM9Y2XpeLBJz//c6DCY1N+1tAWfxZ4rx2nR9EcxgY
	W7xpw2Jpu57O330PPU/Lox8qM0iLH1ZBkyKyyJtr9upFZeswMOhsY/OReZAw+xpJL+uP
	rlYDzgNyG8Jo0yumyesWF1VrABD8IvOK5LjKhgWOVvxxKHpqAVQ+xV2ssi1lOTfRZvat
	DOUw==
X-Gm-Message-State: ABuFfohYMqG8ZoFyBbQ3QCqoltJ3XN/abj7H3PwloSrjiXYGO1bq1mwy
	rh2/1iI738xYAa7TktOJF9JEmjWj
X-Received: by 2002:a2e:9d05:: with SMTP id t5-v6mr5426881lji.57.1539812374445;
	Wed, 17 Oct 2018 14:39:34 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	71-v6sm4382526lja.90.2018.10.17.14.39.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:39:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Oct 2018 23:39:28 +0200
Message-Id: <20181017213932.19973-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-devel] [PATCH v3 0/4] arm: Add first models of Xilinx Versal
 SoC
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eHNYU7hS4+iD

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
 hw/arm/xlnx-versal.c                | 324 ++++++++++++++++++
 hw/net/cadence_gem.c                |   9 +-
 include/hw/arm/xlnx-versal.h        | 122 +++++++
 6 files changed, 950 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/xlnx-versal-virt.c
 create mode 100644 hw/arm/xlnx-versal.c
 create mode 100644 include/hw/arm/xlnx-versal.h

-- 
2.17.1

