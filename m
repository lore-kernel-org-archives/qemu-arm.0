Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749425wrt;
        Fri, 23 Nov 2018 01:18:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UQ02oSFZYUEbZ1/Zu4Wc6yJtRwbhub1gHhtEkJDP7sopP447giPxGhYcUSmizjzSEkLssn
X-Received: by 2002:a25:9d0f:: with SMTP id i15-v6mr14732553ybp.388.1542964721280;
        Fri, 23 Nov 2018 01:18:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964721; cv=none;
        d=google.com; s=arc-20160816;
        b=ACO48yu4ghdUFTNVInT3vAp1F1zHQowlKMZBQEH/7tZjEb7J5Dj73IBdAVaN7Wi/Qb
         nKHxjLtzAQLTSUSiaGMxqk9jRBDsskI7/QD7pMcUd0ZWjAyBWym/ROu5k07D1bUqdFRn
         uOugo6cfWRT770/kdaWKaQma6uj7wnOV7o4JaoN/tqIJ5sjh0pRv9uXbXylwBRelSxNw
         qQGDAnkR0xhbUCNvz9KZa7Fxbiu9rLTnAp+Yp34aXvSSqU50cmqxNovGuFgIVkEDzAiR
         7KbER31itgCd5SYM9lxcxl+7ELtW0O/7HmsPmEiUtnI7IQXNqax9L+7e5mzQbHmO7bX4
         QY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=h8jlOhzWmPCtX8IQycbmperqbGuOfxY0lL9dybqq/UM=;
        b=uRstG3r1AyDX+RqxthnZZv/TBV4coB37NKTi4OKWXfiHpF2wLQqQb7GF12u+wtcjpY
         WapIoWzd3l9Q8E3OFGrmjAI3R71B1VgZ/A0d4ZhejeNc7mFGyHC+mZ4g7U64KQsHkBFS
         J8cYNMHQiEqBSuHe1759M5cNpygCMk+rOXMT94XXKmsveCD4xbTZ/d1kEGaIQMiMQ0IG
         0PBJ5ILvBYKOO4MB84bUYCvj4CpO72v0XdQQ+HO1HJHeQ5rKZt14Hwg0iexGF1YOcWdL
         Hm4Qi3WFSgJTZaUnIiavE0LpIPsxsr75pakjMr1INsNSq4RPREJCwcogFXRHZu3d8iS0
         im/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DZk4DlSM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CNqdmBfe;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CNqdmBfe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si12740830ywd.212.2018.11.23.01.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DZk4DlSM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CNqdmBfe;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CNqdmBfe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bj-0008Ua-P2
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007od-MR
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7at-0000Wx-IB
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7ar-0000Li-2n; Fri, 23 Nov 2018 04:17:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9120044688F;
	Fri, 23 Nov 2018 10:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964652;
	bh=3/NKPKkgy0xkkaYgYMq8VefhtaxrTQtAp2KWh6fQcr0=;
	h=From:To:Cc:Subject:Date;
	b=DZk4DlSMpdgjWBHX22QCZu2NPL/YxW4ptVIb+lnvWQkw2wXC8/WEkumEKrXB7M3Mq
	GMSJSGmhQVAcCXgNr0Kb72cetybFQqDR8w7FAYiD3MrbdVOGkeurfiC/1qfBNmzTgf
	/7JR35JtPCl4N4aahxLsjsaLBBTsbTjXXzCMW7N0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CNqdmBfe;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CNqdmBfe
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1laiC6gmSHg; Fri, 23 Nov 2018 10:17:31 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id B34845BD1A0; Fri, 23 Nov 2018 10:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964651;
	bh=3/NKPKkgy0xkkaYgYMq8VefhtaxrTQtAp2KWh6fQcr0=;
	h=From:To:Cc:Subject:Date;
	b=CNqdmBfe8eYMwycHbALRjR6MsQuyFYXOPZJSpVQYaRm90de3BScEtWEByTd45Jx3D
	G82NqM3VvtWxpojfDp9oE51FU37WoLJ1PKXQcMMfO/o9BvaXS7espxcM8eo4SeYHDN
	gidovoXYx5ma8qNnFDZU2nYIrRgw9DNqBEXWRBW0=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4FF7D44688F;
	Fri, 23 Nov 2018 10:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964651;
	bh=3/NKPKkgy0xkkaYgYMq8VefhtaxrTQtAp2KWh6fQcr0=;
	h=From:To:Cc:Subject:Date;
	b=CNqdmBfe8eYMwycHbALRjR6MsQuyFYXOPZJSpVQYaRm90de3BScEtWEByTd45Jx3D
	G82NqM3VvtWxpojfDp9oE51FU37WoLJ1PKXQcMMfO/o9BvaXS7espxcM8eo4SeYHDN
	gidovoXYx5ma8qNnFDZU2nYIrRgw9DNqBEXWRBW0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:13 +0100
Message-Id: <20181123091729.29921-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 00/16] gdbstub: support for the multiprocess
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
X-TUID: AJ5YVmlh64+n

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
 include/hw/cpu/cluster.h     |  38 ++
 gdbstub.c                    | 647 +++++++++++++++++++++++++++++++----
 hw/arm/xlnx-zynqmp.c         |  21 +-
 hw/cpu/cluster.c             |  59 ++++
 MAINTAINERS                  |   2 +
 hw/cpu/Makefile.objs         |   2 +-
 7 files changed, 691 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

--=20
2.19.1

