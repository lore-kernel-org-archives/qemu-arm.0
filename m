Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730101wrq;
        Fri, 29 Jun 2018 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcrpU44GzTKSyigdgt7UaqWWa3Uysnv1SYvZCLMaOv1aYC0qszG3i3/+F1mF2j3Axf46Ft/
X-Received: by 2002:aed:20e7:: with SMTP id 94-v6mr573058qtb.34.1530279080398;
        Fri, 29 Jun 2018 06:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279080; cv=none;
        d=google.com; s=arc-20160816;
        b=IqV0t5wSsSj1pmJjGSedaUw7/Mdb2W/4v48v+7kkrEgb0B+lSTXLKAndBmPareHA2x
         IKG337mih8DZvrvIX3P2LxAovs0MmHcHN25UpQ8Ej3fWxOZTIBiVtBDjdrw3OI/MYQBA
         i5uTo2H8G24KPT6/d0NOwraAADamhRsm1idu0MsPTK80TUyUL1lwPqeI2DoxtykV+49s
         HP8pqRnPX33XjlFDlogRTEosKSI+I+qY5g9KMDx2XdsZEmgTlhZAA+UH1iEKqF2+JC1S
         EwUUDiQIDNrqRv2UE6MnYfrXEkWBztl3ijQ+2cv+N4MqjR/5ipBMqtRvSZMqB+IRZ7tj
         5RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=XuGOIWAhBOYJm3hAMsRjjkh+fi6xgd5offjS2YR3dY8=;
        b=O5FOm1qfMLZuSTSLt09a2+AAirlLAHMKlaimtNjLh5CizcpXu770pxqucVwRjY6uY0
         5XJ1wolzDNpuLgDTEbt0rEzAWj7Eroc4bkK+RmVP3WiU8NfARg0j1WRe5fC0HsJuychE
         gX4LgW/J9JTYZpp6c3DiJR2KMhENyRA5G+QtGVeRF7kA+UtiEqb4ZyMfADZEz0jdwggX
         cNnDpTxUqdkpPG4YHDlv9l3xpMLgzL3KeWwKlkcIqTyDaJF9DrOe5CukVe+gisGt/mZI
         fmtlLfoi0YXYIAlGQjWgFfrwFGs8m79W3eE2CFAw/MEavrzAiNy+GPF+XiOcB999bv00
         4IVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=s4SjjUle;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZNE+t2JE;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZNE+t2JE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2-v6si4795003qto.294.2018.06.29.06.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=s4SjjUle;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZNE+t2JE;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ZNE+t2JE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUd-0007sL-PH
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007Zz-Ve
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU1-0006lY-V3
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU1-0006ZY-IN; Fri, 29 Jun 2018 09:30:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 982FA443495;
	Fri, 29 Jun 2018 15:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279031;
	bh=Rva9xfNGwWdw0LS+MNSXCEre2QA7WQ1QkFOSHHy2FfM=;
	h=From:To:Cc:Subject:Date;
	b=s4SjjUleb8MKzF0ZoNUarzKmRn6VX3flbqN6drqNQAuAfKmOZ3cXpfyQb6to+Pon2
	gCsEQwLVUAUPxTODZiTs4HyRXi7YDXjbZlcz7vEOHpwju2CnymckYeysnFT/TxIMzE
	IFB8ziCCZvniSsy+fIamhgj1kUNFG0ibYGghMsjI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ZNE+t2JE;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ZNE+t2JE
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59dhmOWDZpSY; Fri, 29 Jun 2018 15:30:30 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A6D3A4434A7; Fri, 29 Jun 2018 15:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279030;
	bh=Rva9xfNGwWdw0LS+MNSXCEre2QA7WQ1QkFOSHHy2FfM=;
	h=From:To:Cc:Subject:Date;
	b=ZNE+t2JEqItqclVdpKyX+CcPQluCpvEJU1soZJgEoel9x7vT1mbUk7DeTQcOK8b95
	WWm5XtDO8xBttELFyB4vHvFUtaqY/y1jk4Y7hmZfoo4pgBpkn2T5IDePMlrYwd0Uqc
	VIXfvHMqqJEMbEUHylvJ6D+paGuMWTNWEjUXfhJk=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EDC59443495;
	Fri, 29 Jun 2018 15:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279030;
	bh=Rva9xfNGwWdw0LS+MNSXCEre2QA7WQ1QkFOSHHy2FfM=;
	h=From:To:Cc:Subject:Date;
	b=ZNE+t2JEqItqclVdpKyX+CcPQluCpvEJU1soZJgEoel9x7vT1mbUk7DeTQcOK8b95
	WWm5XtDO8xBttELFyB4vHvFUtaqY/y1jk4Y7hmZfoo4pgBpkn2T5IDePMlrYwd0Uqc
	VIXfvHMqqJEMbEUHylvJ6D+paGuMWTNWEjUXfhJk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:34 +0200
Message-Id: <20180629132954.24269-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 00/20] arm_gic: add virtualization extensions
 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YAd9i09nhfAy

This patch series add support for the virtualization extensions in the
ARM GICv2 interrupt controller.

The first commit implements two missing registers in the distributor
because they are used by KVM. Commits 2 and 3 do some refactoring to
prepare for the implementation. Commits 3 and 4 adds the virtualization
extensions to the GIC state. Commits 5 to 16 are the actual
implementation. The last commits updates the ZynqMP and virt machine to
support GICv2 virtualization extensions.

The current state allows to boot Xen (tested with 4.8 and 4.10) with
Linux Dom0 guest properly.
It also works fine with a inner Linux guest in an outer simulated
Linux/KVM host uses the GICv2 virtualization extensions (tested with the
virt machine, with a 4.17.3 Linux kernel).=20

I also tested in SMP. It works fine with KVM but not out-of-the-box with
Xen because Xen expects to find CPU IDs in the GIC ITARGETSR0 register.
This behavior is not documented in the GICv2 specification, and is not
implemented in QEMU.  By hacking this register, I was able to get the
whole thing to boot in SMP properly. This hack is not part of those
patches though.

I also tested migration, it works fine AFAIK. I had to add the HYP and
SEC timers in the ARM CPU VMState though (Xen uses the HYP one) (not
part of those patches).

I want to thanks the Xilinx's QEMU team who sponsored this work for
their collaboration.

v2:
  - Add VMSTATE_UINT16_SUB_ARRAY to vmstate.h
  - Keep backward compatibility on the GIC VMState by storing vCPUs
    state in the virt VMState subsection.
  - Use h_apr to store APR value for vCPUs, instead of increasing apr 2D
    array. This adds a little complexity to the implementation (a bunch
    of `if (gic_is_vcpu(cpu))'), but avoid ugly VMState description for
    the apr array.

v3:
  - Remove the LR caching mechanism as it is probably not worse it.
  - Remove the forced secure access hack and replace it with a proper
    check (commit 8, function gic_cpu_ns_access()).
  - Split the Implementation patch for easier review.
  - Misc modifications following the review from Peter on v2.
  - Add GICv2 virt extensions support to the arm virt machine.
  - Fix vCPU running prio not being recomputed after a write to H_APR.
  - Fix group0 hw interrupts deactivation request not being forwarded to
    distributor when the GIC is not secure.
  - Implement GICD_ISACTIVERn and GICD_ICACTIVERn because KVM uses them.

Luc Michel (20):
  intc/arm_gic: Implement write to GICD_ISACTIVERn and GICD_ICACTIVERn
    registers
  intc/arm_gic: Refactor operations on the distributor
  intc/arm_gic: Remove some dead code and put some functions static
  vmstate.h: Provide VMSTATE_UINT16_SUB_ARRAY
  intc/arm_gic: Add the virtualization extensions to the GIC state
  intc/arm_gic: Add virtual interface register definitions
  intc/arm_gic: Add virtualization extensions helper macros and
    functions
  intc/arm_gic: Refactor secure/ns access check in the CPU interface
  intc/arm_gic: Add virtualization enabled IRQ helper functions
  intc/arm_gic: Implement virtualization extensions in
    gic_(activate_irq|drop_prio)
  intc/arm_gic: Implement virtualization extensions in
    gic_acknowledge_irq
  intc/arm_gic: Implement virtualization extensions in gic_complete_irq
  intc/arm_gic: Implement virtualization extensions in
    gic_cpu_(read|write)
  intc/arm_gic: Wire the vCPU interface
  intc/arm_gic: Implement the virtual interface registers
  intc/arm_gic: Implement gic_update_virt() function
  intc/arm_gic: Implement maintenance interrupt generation
  intc/arm_gic: Improve traces
  xlnx-zynqmp: Improve GIC wiring and MMIO mapping
  arm/virt: Add support for GICv2 virtualization extensions

 hw/arm/virt-acpi-build.c         |   4 +
 hw/arm/virt.c                    |  50 +-
 hw/arm/xlnx-zynqmp.c             |  92 +++-
 hw/intc/arm_gic.c                | 869 ++++++++++++++++++++++++-------
 hw/intc/arm_gic_common.c         | 154 +++++-
 hw/intc/arm_gic_kvm.c            |  31 +-
 hw/intc/gic_internal.h           | 268 ++++++++--
 hw/intc/trace-events             |  12 +-
 include/hw/arm/virt.h            |   3 +
 include/hw/arm/xlnx-zynqmp.h     |   4 +-
 include/hw/intc/arm_gic_common.h |  43 +-
 include/migration/vmstate.h      |   3 +
 12 files changed, 1262 insertions(+), 271 deletions(-)

--=20
2.17.1

