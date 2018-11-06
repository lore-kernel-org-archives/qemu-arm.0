Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp740071wrw;
        Tue, 6 Nov 2018 03:08:03 -0800 (PST)
X-Google-Smtp-Source: AJdET5c77hG97mk5SRJ0DrNfSOid2clbAEKANuk60uRlxcHL9B0xkm2f/2N3tks59MKKRmBOCohc
X-Received: by 2002:a37:4b44:: with SMTP id y65mr23291269qka.316.1541502483400;
        Tue, 06 Nov 2018 03:08:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502483; cv=none;
        d=google.com; s=arc-20160816;
        b=NTw1rjhaBACoA6B8981kRm/ruuyYmjSVRWvOSDpaznpW+yGDeI759w4IHryH9IO5ER
         SFLi+x92t9AYskvx5O/GscPk4fz/ogE6kLv7i3/cbJxKzBF/gL4uIfekaPWcICeflS40
         4XlXLT9FBzu4IJQZ5EAcAGwuIEJxP3rwg70tG0ebkNVPpy5/HDQqmXpmgJz0IN8pPpJH
         F8LbZo3vOXl7+0/7yxC/yuBXOqyXLU0lh0XUphoVAA0SbKg/8RV+IyTGJ7/tDBbG10aa
         3akK7DRKQNW3BbIEg2VfMyNYD3bdhX2gvlAH2Hpy69IWUsAptYrIKr4KVvtC1CQZi8PH
         UgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=PB13ogaxGHWrQfhEYujLOSNBlujhl1Y8GXWPBizRyXY=;
        b=THUZH/M927DBf58hqWVE82SRbs0rEGxnBa3npdaqAohTyVnp5bfUn0wNeV7PZ7Vzry
         Bi32fNBI/MMGDaRsqyvmErw16FtRgQE1FiD3i77EqKWvIPXV/ixNbacJdfGkYdyHC66A
         Rs76/HPBxkVdu5TIFpb+X+HIBPjPMxg+aGGYhswlsU2svIgAkpjMYGyL++HY3XZLIfHz
         /nhJq0F2YSLiITgPHYarQ+gM5EiRR5q4Z0z+1GBy1OWsyJ7qU/NtnK9efzPjeG7tv7o6
         BG2M66EXzlU0sCJkpUgW3F1jYs1BYZoKv3ZxH+EmnvXgYhFswzJaqu9134vVrOqKXAJ1
         AsqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mXL3A01R;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VIu6tGbO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VIu6tGbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si9910621qvj.9.2018.11.06.03.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mXL3A01R;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VIu6tGbO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VIu6tGbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzDG-0007cf-Oy
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:08:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006Es-Em
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBU-0000oi-4c
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBT-0000nM-HQ; Tue, 06 Nov 2018 06:06:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 903B05C025F;
	Tue,  6 Nov 2018 12:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502365;
	bh=FEViO2HLDytVym8S/yEuDaE7xosO7MjVi0QrgZ1exnQ=;
	h=From:To:Cc:Subject:Date;
	b=mXL3A01RV1a7AWfY0McJgAdvdB4GHbuNkj8Oj1KZh5R8uffgSvuQDJRKZt6xjDTkx
	toa2K3PUfqmqoszmWQ24sm5R0jOAGoyXI89lrTxkL3KCtI6GzokFNr9MTCfrYYhzUI
	RQUQ3Lu1FyD8UrxaszoGfhA4dfkOjW6XvgHt/5cE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VIu6tGbO;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=VIu6tGbO
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTE4tXF5FGSu; Tue,  6 Nov 2018 12:06:04 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id B267B5C024B; Tue,  6 Nov 2018 12:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502364;
	bh=FEViO2HLDytVym8S/yEuDaE7xosO7MjVi0QrgZ1exnQ=;
	h=From:To:Cc:Subject:Date;
	b=VIu6tGbOFvfy4KG7tpJXEQNyISLI3B0YHq844ovm9cEQfrBJaNzUeiZLS0ADTDiJw
	4AFu99B85rxjkSgk42JvR47DcW6s1ZCtNgAl/uB0mqXmy0Lf5ER+egrK/Qbo3S1NIV
	i2klx6SPDsgXKGIfU1UiYjzstaQ4Pu+/LYU+v80Y=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2C7BE441B53;
	Tue,  6 Nov 2018 12:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502364;
	bh=FEViO2HLDytVym8S/yEuDaE7xosO7MjVi0QrgZ1exnQ=;
	h=From:To:Cc:Subject:Date;
	b=VIu6tGbOFvfy4KG7tpJXEQNyISLI3B0YHq844ovm9cEQfrBJaNzUeiZLS0ADTDiJw
	4AFu99B85rxjkSgk42JvR47DcW6s1ZCtNgAl/uB0mqXmy0Lf5ER+egrK/Qbo3S1NIV
	i2klx6SPDsgXKGIfU1UiYjzstaQ4Pu+/LYU+v80Y=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:32 +0100
Message-Id: <20181106110548.4209-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 00/16] gdbstub: support for the multiprocess
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
X-TUID: sQ6niKWMCZPy

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
 hw/cpu/Makefile.objs         |   2 +-
 6 files changed, 674 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

--=20
2.19.1

