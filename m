Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp241478wrt;
        Fri, 7 Dec 2018 01:07:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VU54U05Kxjv6C+8YiguITUaqYGr0+HKd+xSbKMjlNnG22dZ+RqjppSuO2dVy0AYOfMueJj
X-Received: by 2002:a0c:ad16:: with SMTP id u22mr1193039qvc.240.1544173623978;
        Fri, 07 Dec 2018 01:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173623; cv=none;
        d=google.com; s=arc-20160816;
        b=iMu+0FuPcJ4N19jlqKiwXgkl6vDFj5sfXMotyOghJW+rwV9eocPAM6fPksbKLEhgrw
         vqvypCeLsuhmnTd4KlslrAy4yotcqKkCm4cE+Zg4U3HFWfQufLEri+MIPcE7NQesyiDi
         qXnlBFCpeponcYJCboABoQ6SVwqVz/a4Cxz2o/Stk0XTf3YZ41anGfKl8xkcUHYwAjiw
         0GIjPlTpsPJDyyYd3u1wjIEvDA9Aq0iUoKGVvJJLhTTEyaVgwmN7x8+iRw+ADQ472r/h
         vsav2xWxkrQ7P8bKFPcoIytO0IlhFkrPYcXR8j4oZ9OkBsN+GS0v9eEXsOsy8xUdHmEr
         sDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=X3gxP8tI/fHqOToVZzRdNLVSThFRNegS5KGelfv+AzY=;
        b=yLFRACENqK8P36namEyrebWUwBeV4KK3h4OqcaauceI66eELmTUZrIEBezAGEHjBxu
         Jf83XxR1IF5qzqaLdOOvRRUXD6TO+DzAM0cuZMfd0BPcA+twJmrzfQvlIsn+TReGDP/l
         C9UTBihLXWelrgUyPwWBBuja/SVUKszzjnfhEgFrEMRWawyxzb510KkqkcNcYJ2TCq1P
         IUPehbyNJoIml8sutdpnbGekCJag/waXFe8z2P1M+oeQRaHCBnycuo4i4iQ4vEMBV55p
         0JhHWPq0uV3xXvz77cXZlxkklikPbF6kiW6QSZs7bY7McU/RvsFUwJbIivPypfRYsZrn
         HSgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=61ggYn5X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=61ggYn5X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gs0Ag2Y8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si360991qto.196.2018.12.07.01.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=61ggYn5X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=61ggYn5X;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gs0Ag2Y8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC6B-0004XA-E4
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:07:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1N-00081P-TH
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1H-0005Wi-3u
	for qemu-devel@nongnu.org; Fri, 07 Dec 2018 04:02:05 -0500
Received: from greensocs.com ([193.104.36.180]:52152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1A-0005OK-4k; Fri, 07 Dec 2018 04:01:52 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DFD45480018;
	Fri,  7 Dec 2018 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173301;
	bh=yIS7TVcw1th1rY5wxFRzGkf+yEUseWqTZfLnmVMnXIA=;
	h=From:To:Cc:Subject:Date;
	b=61ggYn5XNT7zuMGj62/tFEmw+R4kjDUKB6XYUFFZinNdrOgVL+T1XSd8iO00FccDb
	aiafcIp8lkmoJ/D+hniHy++30sLgLf3Qn1C5zqUkpnggfRo6Nq7Jpr+mR2huCWr4fN
	LVecuueC8NgxiE5L6xkU8q91XubUUON31l+SO8ow=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=61ggYn5X;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gs0Ag2Y8
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsR5wQhqUaI8; Fri,  7 Dec 2018 10:01:41 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 102EC480011; Fri,  7 Dec 2018 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173301;
	bh=yIS7TVcw1th1rY5wxFRzGkf+yEUseWqTZfLnmVMnXIA=;
	h=From:To:Cc:Subject:Date;
	b=61ggYn5XNT7zuMGj62/tFEmw+R4kjDUKB6XYUFFZinNdrOgVL+T1XSd8iO00FccDb
	aiafcIp8lkmoJ/D+hniHy++30sLgLf3Qn1C5zqUkpnggfRo6Nq7Jpr+mR2huCWr4fN
	LVecuueC8NgxiE5L6xkU8q91XubUUON31l+SO8ow=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9F730441B53;
	Fri,  7 Dec 2018 10:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173300;
	bh=yIS7TVcw1th1rY5wxFRzGkf+yEUseWqTZfLnmVMnXIA=;
	h=From:To:Cc:Subject:Date;
	b=gs0Ag2Y80jl6kpDMwYD+PeqbhuEFdYxSkESlIqF/4qfrWSPxWHuA0D+f5/s4+RhaH
	mf+temrXJLB/AQsecEaNY+Ayn112vQ/m3nqY4oYOWCSYO9YCCp36EIPVv3wyb4O8RB
	Lbi3gtFSgNnuqO9QLVKj8DvVvc5c54TdjSciDzVk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:18 +0100
Message-Id: <20181207090135.7651-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v8 00/16] gdbstub: support for the multiprocess
 extension
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vnGndBSEGa7/

changes since v7:
  - patch 1    Add documentation about cpu-cluster [Eduardo, Peter]

  - patch 1    Remove the cluster-id auto-assign mechanism [Eduardo]

  - patch 2    Replace create_unique_process() with
               create_default_process() that is now called even if some
               clusters are found. This default process is used for
               CPUs that are not in a cluster [Eduardo, Peter]

  - patch 3    Refactor and harden gdb_get_cpu_pid() [Philippe]

  - patch 16   Go back to cluster-id manual assignment [Eduardo]

changes since v6:
  - patch 4    Fix a refactoring issue in gdb_get_cpu [Edgar]

  - patch 5    Renamed gdb_first_cpu/gdb_next_cpu to
               gdb_first_attached_cpu/gdb_next_attached_cpu [Edgar]

  - patch 7    Added the CPU name and removed the CPU index in the
               ThreadInfo packet in multiprocess mode [Edgar]

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
 include/hw/cpu/cluster.h     |  58 +++
 gdbstub.c                    | 662 +++++++++++++++++++++++++++++++----
 hw/arm/xlnx-zynqmp.c         |  23 +-
 hw/cpu/cluster.c             |  50 +++
 MAINTAINERS                  |   2 +
 hw/cpu/Makefile.objs         |   2 +-
 7 files changed, 719 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

--=20
2.19.2

