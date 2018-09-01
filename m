Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538950wrd;
        Sat, 1 Sep 2018 05:48:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZp5gXCfyL6l28uQSv/fbSZdfKWS1qvRMxpbzVmYZgAu8oEGdjBkivW8/IXE9vSnj1734pO
X-Received: by 2002:ae9:c109:: with SMTP id z9-v6mr18845867qki.290.1535806081476;
        Sat, 01 Sep 2018 05:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806081; cv=none;
        d=google.com; s=arc-20160816;
        b=d6NkXoiWEzQCAKB43veE1Wv95R759VKN0ranEoX5T9r/d5DGvnZBthLp+rvx64jGQM
         FzczALqrKtQZFM6XfHKwZEuWBiRclwm5hyVCtpYWCCsvRJXK7R850eVa+MIZJQQAc7am
         Ahunlrr3lO1yDKVRHSW07hdAoxHwYcpf3V7Jv9068hss9UciG68xnimvB9WYkmaN/Q1I
         tMJUC7quCKDhMP6CYRHIiV5T09amySDboJfkwX2apsVhSddQ4L8iLT8fqTuCK2g7YyDT
         hHEEjwVCK2UZZ5egT3oegPt5qrdK5BPotrZtStalfmw0WX6wqYAA5KqDUFvyUIu4ZItR
         XByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=MqftgHEzUjC8EVhRTtGPlKLKGmzb2SGJSIkSVB9XsGQ=;
        b=OmD6XF5g3r8GBqneoLt+CB1nf/W8aVHoVXJ+E+nRH8LVnFN0csUCQeserwSvWFEer3
         EtWgRLpFTtfADdj5NSyfDj1Lz98KafhDNoyNKnncrLhzTQTYjz84wef6aA0LqsygjtPn
         v43BKQCIvryBtjwvh6RFMzGP4wPglJ+zbrhHLwjQYdVJY0UWWt7in/NWBEG2k4l42AUg
         KLA0yq9jHhgiQ+JbQ/i/7H357CqhIudZWUxezzGh+2hu1jS3hXo1kv+sc5Roiab6FWjV
         YJ35pqD/6rRgPjvu3DjEtgnTJC3gKeDET4+Vo14awxR/Tp8Y+l70+7a/l9zNwWeubiwY
         7hCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=oOjJScln;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="V/wfnJBO";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="V/wfnJBO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a34-v6si3834403qtk.192.2018.09.01.05.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=oOjJScln;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="V/wfnJBO";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="V/wfnJBO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Jp-00066V-1G
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:48:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004g9-FB
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J6-0007jn-5Q
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J5-0007hS-Lx; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 16B4D521AB3;
	Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806025;
	bh=SxJ+P3Shu8JvHfqWoN5GPgmL2ptTLaABfMjruhHEDbM=;
	h=From:To:Cc:Subject:Date;
	b=oOjJSclnl5ukpkL/7ndvsFw91xdvUkb5/u8CAfSD+yNMvZ0m1oPWxdZAS4JFVjotq
	zKnMBEWqa6CtvmGSwIq4282+TdJAgXkx177Dsa0lXARA/HtYVgvXi0lbhqrzQ2rC/n
	RRoqX575bJ8cnDkpoXixVRVigW56h22G4Jz8rYVE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=V/wfnJBO;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=V/wfnJBO
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVGN7o-fCghE; Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 506E1521AAD; Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806024;
	bh=SxJ+P3Shu8JvHfqWoN5GPgmL2ptTLaABfMjruhHEDbM=;
	h=From:To:Cc:Subject:Date;
	b=V/wfnJBOPGsWvj9qo7s+eA/0mCV//YLTVRN0yKPKCfcNVHxtN3NiatofrarSwEsBS
	ucRaBZC8MZ7x9KHfJH0ts2aRc11GHP/QU18Z2KQeewbco2CtVCdfg3oK0l6XDAb1YA
	kNxoXV4gYSpgyYHxjWymd481FM+g4AXB8XiT9IlM=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D2144521A9F;
	Sat,  1 Sep 2018 14:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806024;
	bh=SxJ+P3Shu8JvHfqWoN5GPgmL2ptTLaABfMjruhHEDbM=;
	h=From:To:Cc:Subject:Date;
	b=V/wfnJBOPGsWvj9qo7s+eA/0mCV//YLTVRN0yKPKCfcNVHxtN3NiatofrarSwEsBS
	ucRaBZC8MZ7x9KHfJH0ts2aRc11GHP/QU18Z2KQeewbco2CtVCdfg3oK0l6XDAb1YA
	kNxoXV4gYSpgyYHxjWymd481FM+g4AXB8XiT9IlM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:24 +0200
Message-Id: <20180901124639.19735-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 00/15] gdbstub: support for the multiprocess
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FbizoiStUFjq

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

Luc Michel (15):
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
  arm/xlnx-zynqmp: put APUs and RPUs in separate GDB groups

 include/exec/gdbstub.h |   8 +
 gdbstub.c              | 584 +++++++++++++++++++++++++++++++++++------
 hw/arm/xlnx-zynqmp.c   |   7 +-
 3 files changed, 521 insertions(+), 78 deletions(-)

-- 
2.18.0

