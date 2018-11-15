Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6797943wrw;
        Thu, 15 Nov 2018 01:43:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5cKEeGHqON1merBEA8Swyp2dhGGKnEvL7ZEGGsxb8f9/BN07AzBd5enzuPrMZVZnluSCsdk
X-Received: by 2002:a0c:e904:: with SMTP id a4mr5223873qvo.181.1542274988601;
        Thu, 15 Nov 2018 01:43:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542274988; cv=none;
        d=google.com; s=arc-20160816;
        b=UJSh99d039DkIGZZVs6bPHPCiZ4hVvyJO9ZrAUKoWAWpF0SXIYMvyW88SOmQmKMcjk
         0WlCM6hm7WOTBRF0nEd4LT+9vx9u3ByTKislrODJ+fv3skeib2kOCgQ7cLHGThGMAbLp
         gpViRv9e+50OC9k5LocR1Z584P4RxSzPJPx9UVo1lZZxc68IB9zG1zakLRX5cbHZjZS9
         mMgHltfFUONn/EdMT88F2FY6gbd4joyvKybZ7rtp7XfKZxzAsIZTFFVmIYiXlPBTg/A2
         aNvtuwG1nd2pEWyqDsRusM/cn27pG4ky8doihCZ2oB0hZceHhtxMSJ39E7lzu8LfbA8q
         RWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=GUPLMxpknX3Aouk6+CzOi1Yax0goNmZOjrI5jEHTXG4=;
        b=xxBGP0u43l5O92muoupnvkmvrc1DY4nkflElfo4Up2n/Wnz7jOQUVajYGpBmPHheHY
         pPlwm3PmRJpwA10LD6+DmJdTo9FREzgBjnwEKwAJlcxhW/AplsM3mR7kiXx8j6f0ZG93
         gO/O8RI164KO79WGNtSs5YJJV3bnKSbD2L1OY9Po3wLYCKvvP6v1/Q3fNwqdwTRjIcb4
         PRAn9kkXuDbzXBTZszr3Q5Ut22vR23xchiQpo5ELNUEuy3hvMJqUO3q7y+rMSQ36pw+Q
         gcPncRWAmCA4x2L1MH9DRRmG400UOLbm57FNGsnyMsq9l/Q7FdL0smZof/KhATwJ8LjX
         oSTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sWKyocaL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PEuPTdRa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PEuPTdRa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z202si4875746qkz.83.2018.11.15.01.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:43:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sWKyocaL;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PEuPTdRa;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=PEuPTdRa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEB1-0007QJ-Qf
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:43:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAU-0006mx-QH
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAH-0004Mo-ND
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:28 -0500
Received: from greensocs.com ([193.104.36.180]:41853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAH-0004Lj-0p; Thu, 15 Nov 2018 04:42:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1EA9F5BD1B9;
	Thu, 15 Nov 2018 10:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274933;
	bh=lmSccMDswOq7vhhD9j3ltyPu8io3kN/oabTxB+MM+HM=;
	h=From:To:Cc:Subject:Date;
	b=sWKyocaLbqWKaG9DXzznOcLbL5CdxJRQl+UyivaZabGovC7FWJe9EHyrM6Grf5i+T
	JBCQpoEWR2g/r3ZVH7YgtowNs780DK5J5rJ7oqb4w/L09ci0bZgoaDR+Fm7QV7EsLt
	SWpIofLkM0X7KPZtdh65ZVxR0leND3lcxM46b93k=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PEuPTdRa;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PEuPTdRa
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jP08G5nUhpUf; Thu, 15 Nov 2018 10:42:12 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 3576C6FD8A; Thu, 15 Nov 2018 10:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274932;
	bh=lmSccMDswOq7vhhD9j3ltyPu8io3kN/oabTxB+MM+HM=;
	h=From:To:Cc:Subject:Date;
	b=PEuPTdRa8kO6Kexq9E/PQWR0kUpZrUL5rXwymISp1nhKKVGi8QuPIkQ0PVHtCB+Qj
	4r9x4Au8LxXBav0m1eA4v2AGCptmWm5uVtS1v06TVphKgRa7qPgsORSUUG0BZ0u9xr
	/+1FSmaIaKWNWeSyXfH83POG0CJGDA8NGTgbXtvA=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id BCEE25BD180;
	Thu, 15 Nov 2018 10:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274932;
	bh=lmSccMDswOq7vhhD9j3ltyPu8io3kN/oabTxB+MM+HM=;
	h=From:To:Cc:Subject:Date;
	b=PEuPTdRa8kO6Kexq9E/PQWR0kUpZrUL5rXwymISp1nhKKVGi8QuPIkQ0PVHtCB+Qj
	4r9x4Au8LxXBav0m1eA4v2AGCptmWm5uVtS1v06TVphKgRa7qPgsORSUUG0BZ0u9xr
	/+1FSmaIaKWNWeSyXfH83POG0CJGDA8NGTgbXtvA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:51 +0100
Message-Id: <20181115094207.22846-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 00/16] gdbstub: support for the multiprocess
 extension
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /TdVjkRHgLHV

changes since v5:
  - patch 1    Rebased on top of master

  - patch 2    Cluster ID handling hardening to ensure uint32_t overflow
               won't cause PID 0 to be used [Edgar]

  - patch 2    Fix the GDB process ordering function to avoid uint32_t
               overflow when comparing two cluster_ids [Edgar]

changes since v4:
  - patch 1    add cpu_cluster.[ch] files into MAINTAINERS Machine core
               section (thanks Eduardo!) [Philippe, Eduardo]

  - patch 1    revert to uint32_t for cluster IDs [Philippe]

  - patch 1    fixed a coding style issue [patchew]

changes since v3:
  - patch 1    cpu_cluster.h: remove QEMU_ from the multiple includes
               guard #ifdef/#define [Alistair]

  - patch 1    cpu_cluster.c: include osdep.h first [Alistair]

  - patch 1    use uint64_t for cluster ID for prosperity :) [Philippe]

  - patch 1    auto-assign a cluster ID to newly created clusters [Philip=
pe]

  - patch 2    fix mid-code variable declaration [Alistair]

  - patch 3    add a comment in gdb_get_cpu_pid() when retrieving CPU
               parent canonical path [Alistair]

  - patch 14   fix a typo in the commit message [Alistair]

changes since v2:
  - patch 1    introducing the cpu-cluster type. I didn't opt for an
               Interface, but I can add one if you think it's necessary.
               For now this class inherits from Device and has a
               cluster-id property, used by the GDB stub to compute a
               PID.

  - patch 2    removed GDB group related code as it has been replaced
               with CPU clusters

  - patch 2/8  moved GDBProcess target_xml field introduction into patch
               8 [Philippe]

  - patch 3    gdb_get_cpu_pid() now search for CPU being a child of a
               cpu-cluster object. Use the cluster-id to compute the PID.

  - patch 4    gdb_get_process() does not rely on s->processes array
               indices anymore as PIDs can now be sparse. Instead, iterat=
e
               over the array to find the process.

  - patch 3/4  removed Reviewed-by tags because of substantial changes.

  - patch 4/7  read_thread_id() hardening [Philippe]

  - patch 12   safer vAttach packet parsing [Phillipe]

  - patch 16   put APUs and RPUs in different clusters instead of GDB
               groups

changes since v1:
  - rename qemu_get_thread_id() to gdb_fmt_thread_id() [Philippe]
  - check qemu_strtoul() return value for 'D' packets [Philippe]


This series adds support for the multiprocess extension of the GDB
remote protocol in the QEMU GDB stub.

This extension is useful to split QEMU emulated CPUs in different
processes from the point of view of the GDB client. It adds the
possibility to debug different kind of processors (e.g. an AArch64 and
an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
expects an SMP view at the thread granularity.

CPUs are grouped using specially named QOM containers. CPUs that are
children of such a container are grouped under the same GDB process.

The last patch groups the CPUs of different model in the zynqmp machines
into separate processes.

To test this patchset, you can use the following commands:

(Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
Also, it must be compiled to support both ARM and AArch64 architectures)

Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
CPUs)

qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6

Run the following commands in GDB:

target extended :1234
add-inferior
inferior 2
attach 2
info threads

I want to thanks the Xilinx's QEMU team who sponsored this work for
their collaboration and their prototype implementation.

Luc Michel (16):
  hw/cpu: introduce CPU clusters
  gdbstub: introduce GDB processes
  gdbstub: add multiprocess support to '?' packets
  gdbstub: add multiprocess support to 'H' and 'T' packets
  gdbstub: add multiprocess support to vCont packets
  gdbstub: add multiprocess support to 'sC' packets
  gdbstub: add multiprocess support to (f|s)ThreadInfo and
    ThreadExtraInfo
  gdbstub: add multiprocess support to Xfer:features:read:
  gdbstub: add multiprocess support to gdb_vm_state_change()
  gdbstub: add multiprocess support to 'D' packets
  gdbstub: add support for extended mode packet
  gdbstub: add support for vAttach packets
  gdbstub: processes initialization on new peer connection
  gdbstub: gdb_set_stop_cpu: ignore request when process is not attached
  gdbstub: add multiprocess extension support
  arm/xlnx-zynqmp: put APUs and RPUs in separate CPU clusters

 include/hw/arm/xlnx-zynqmp.h |   3 +
 include/hw/cpu/cluster.h     |  38 +++
 gdbstub.c                    | 643 ++++++++++++++++++++++++++++++-----
 hw/arm/xlnx-zynqmp.c         |  21 +-
 hw/cpu/cluster.c             |  59 ++++
 MAINTAINERS                  |   2 +
 hw/cpu/Makefile.objs         |   2 +-
 7 files changed, 687 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

--
2.19.1

