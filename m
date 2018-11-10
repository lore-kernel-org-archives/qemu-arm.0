Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp808353wrw;
        Sat, 10 Nov 2018 00:14:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5cr+j5OD11k1PGrP8CmeQ4p0XiSlEFkiEkVAd7sN7H737c71dTTl6koDQh92SeO94sDF/p6
X-Received: by 2002:ac8:28d2:: with SMTP id j18mr11484530qtj.191.1541837683535;
        Sat, 10 Nov 2018 00:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837683; cv=none;
        d=google.com; s=arc-20160816;
        b=HE7fH7AIKvWuQyaoQrNY//I5d8L0jUtvKhHxMj7DkWqC1yf/UEETszDFri3pwD2CKq
         aAxPN8wmRarQYcZKgOMZ4cC6AqVM4n8uPCZRH/fT99tvYqYaWet7eZ61aDc3XiThPN+3
         3YgLlpq9V3jpehCitLmGn3Hgg9bleo37XP66yKZFVeSB/AeQBGWQzV+Sz88bDulpGA/R
         KpCt4VuAY6t+Ky4JVv2IVnPxEmmrcL08bWPdTocAJFauuY4jzSW4yAMMYecz2ffr/icg
         oMU5rioRZ+s0PsmiulYLV2W8CcRjTTTAusjAI97yID0t62+kMgRhDCda8ydzELYgtOFg
         zjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=8eOSAYwos3Qx5UrPlfrUK/2ENX0Ij85r2uxJJZ70CZo=;
        b=fsLoWgSIPb1epAoI1bzkym7x5sm7wL9TgYS3n5Y7lqYHg6l1g5oPsSBdrPNt4wKsu+
         NUez9eV+bnAHx4v01/Dsgc5r6s+NZV4mF85wjuIvTB6C0kCwemEpocWn82YLLGFZ/BY7
         d7R7n1nh3DRRXXs9PdhS1KKEyFDnEK5V5F6ZD20Lz0IafFpriUanJioJgO+5NCSU60Ab
         wPxAM7ZEtgy8iiX64Tkw4jdoU6lAAH71jR2A1NxZJeir81pXP4zGyDReReE6LC4JaJ/b
         n81T1yvlS/u7+avAPRVTMdXQqVTQkHiq5bXbvrYLdZ1nqD0x7lyIeb8sPC6WEmo5GwBK
         Nz+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YnoIcrsb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=otpUoYSb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=otpUoYSb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f20si1727200qto.316.2018.11.10.00.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=YnoIcrsb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=otpUoYSb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=otpUoYSb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOPj-0004MZ-0p
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lH-7P
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOY-0000Sm-JM
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOX-0000QG-Uw; Sat, 10 Nov 2018 03:13:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 626AE6FDA6;
	Sat, 10 Nov 2018 09:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837601;
	bh=99FBigtOR0qoZLA4C7LVHTLrC6QUApq4Gmdvo1FmlBY=;
	h=From:To:Cc:Subject:Date;
	b=YnoIcrsbxFGLYU2TJDI+FcSyCXYOis6N8EhNZngqzs3eTf0vPghqi4YxMRZXOkkr9
	09Sf2g0Vv7iUwUdE0TeUM59H+KhFnJJ6Sj7Lm+Z7DG+l/sqYiYcDWFJ+jXXXT3gRRv
	qUbiTIkt0Er3sPlBR+Lfm1kTupcXnijWZ99xlHb0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=otpUoYSb;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=otpUoYSb
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6P47u9By4swZ; Sat, 10 Nov 2018 09:13:20 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 860036FD86; Sat, 10 Nov 2018 09:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837600;
	bh=99FBigtOR0qoZLA4C7LVHTLrC6QUApq4Gmdvo1FmlBY=;
	h=From:To:Cc:Subject:Date;
	b=otpUoYSb/TXcZ52mohiKY1RXY7WsId+rM0NLs3N5j2mndgiB31dXe1lKZX7soooAL
	kYGO43NINZbBP8FfbRy9bjEVmGcwt5WesJxq9MozmCUPWYFBztEnkU9R9cZ2pQhSAR
	rTb/lI/z97TVQkAnZANj0o6nvyULcLKzMyDmE4kY=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0E9085E2E3;
	Sat, 10 Nov 2018 09:13:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837600;
	bh=99FBigtOR0qoZLA4C7LVHTLrC6QUApq4Gmdvo1FmlBY=;
	h=From:To:Cc:Subject:Date;
	b=otpUoYSb/TXcZ52mohiKY1RXY7WsId+rM0NLs3N5j2mndgiB31dXe1lKZX7soooAL
	kYGO43NINZbBP8FfbRy9bjEVmGcwt5WesJxq9MozmCUPWYFBztEnkU9R9cZ2pQhSAR
	rTb/lI/z97TVQkAnZANj0o6nvyULcLKzMyDmE4kY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:31 +0100
Message-Id: <20181110081147.4027-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 00/16] gdbstub: support for the multiprocess
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
X-TUID: CKbHL3YxGVdm

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
 gdbstub.c                    | 632 ++++++++++++++++++++++++++++++-----
 hw/arm/xlnx-zynqmp.c         |  21 +-
 hw/cpu/cluster.c             |  59 ++++
 MAINTAINERS                  |   2 +
 hw/cpu/Makefile.objs         |   2 +-
 7 files changed, 676 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

--
2.19.1

