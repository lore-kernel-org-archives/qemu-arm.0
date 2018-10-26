Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp450870wro;
        Fri, 26 Oct 2018 01:42:32 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dtwPH0mQ1ghpSNLV1ZstKsRdZpTHxQwatiXygp9gB+HAvHJWeyhiaDHOfb/QuOzAgFbLXF
X-Received: by 2002:a0c:a9da:: with SMTP id c26mr2305978qvb.140.1540543352801;
        Fri, 26 Oct 2018 01:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543352; cv=none;
        d=google.com; s=arc-20160816;
        b=jjFhq8v3FRnfLfhFLq8KNn/B8TtGNchrh1hb4XM8aBw+kTX4Xe2VL1J1T42igR3g8Z
         F2zOAAn2/JyjXrjdbji4grssYmLMr+gYti/I7Wi3QWSA/27kyYzb1ShUUQfyzGG3h0uc
         jsMXtsebQN3cA5R/4aXwC4zaHbpseBpj+CQWgpGLxKqCSKfp6FVjzYOpSZppDchJuU2U
         o/3OKS6FrT5eGN+tBXeWDvOA+R1yulk5LmskRGbUV1SBeUo0nzSrMA+KHYuLAYfex5bF
         V+ftf9LPc345aOFkwbZi9JT+WF0/QgpKbnKojluP4KcpoSMmqUc7c7PfkBtvwyHD4ORM
         07wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=GfjW5wthA+wnCr/SdqtCk8aVCGBBm+ULhd8yVWBUqkY=;
        b=LBijPkguvC3XZsv6YS3deycmdvZKAGb2leiZY1uKFWUCH/p6/doPdETCDnivwdATNR
         Ee5kaUAV6PtAlvWsTelrH/YqyDI39+nR3cEZMAPp4RkXzqu7J7eyMEtptmlM+TR0B040
         ImhpAijbll0vkK0HDGhRUczaycLYUVtYm4o2AP5ifSS/NVYq/EQs4m9RF0kbSI+CP7gW
         /vtamgmA/v3OEeshA7Tc8ZKZLrflfCEjOAWQLLszVWdLKHK+7Z90hmHiWe1PBHtBXkZ/
         2vSSEuah4z9DPYlqTEYq5m33NDIV2QXZ5CsjM54X1EoFEp7tv7fG2+vJLUmZVtqfl78a
         tYVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CJdd3iS0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Yo4rUDFb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Yo4rUDFb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y62-v6si6990qtd.172.2018.10.26.01.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CJdd3iS0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Yo4rUDFb;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Yo4rUDFb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxhQ-0006xT-9D
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUK-0002m7-W5
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJD-0004oU-J4
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:33 -0400
Received: from greensocs.com ([193.104.36.180]:45293)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ7-0004hb-Us; Fri, 26 Oct 2018 04:17:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6545D441B46;
	Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541832;
	bh=vMEupsw/0MfAu44ZgjU8MOtwa1h57n9aWIfiNBuTW24=;
	h=From:To:Cc:Subject:Date;
	b=CJdd3iS0RzRebztVrshTrYi9e162wKi8TExf6zNiMY9xlGKKDxUxV5JTnsLezJgCU
	08CqGl6feG/+BEqViKv15y5KqH12jyc35uHDKT9ZzhMFGowNCPJGH9BNVfpeQpAGEO
	p774mGY2Ww+viLFkyq5sh3CuAlBnCZbbhPM/OaqY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Yo4rUDFb;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Yo4rUDFb
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13VH1s3l-_rd; Fri, 26 Oct 2018 10:17:11 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9503F441B42; Fri, 26 Oct 2018 10:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541831;
	bh=vMEupsw/0MfAu44ZgjU8MOtwa1h57n9aWIfiNBuTW24=;
	h=From:To:Cc:Subject:Date;
	b=Yo4rUDFbeYXQ4byQ7ZUXnVywiZmJL8PyA+BAKyRU68YtVZVpXACmeyWQf9jSXlGme
	guI7aTZAGmQNL1/wsYfAXsmrj5vvRzNe8pHs0fUJkWYm8i1vuHUlSFhqXZNvMwXOtl
	Uhw78f8cV2E8c+o0ZBuMcEm6CUxqsFBogwyrtrBo=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 29BB9441B41;
	Fri, 26 Oct 2018 10:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541831;
	bh=vMEupsw/0MfAu44ZgjU8MOtwa1h57n9aWIfiNBuTW24=;
	h=From:To:Cc:Subject:Date;
	b=Yo4rUDFbeYXQ4byQ7ZUXnVywiZmJL8PyA+BAKyRU68YtVZVpXACmeyWQf9jSXlGme
	guI7aTZAGmQNL1/wsYfAXsmrj5vvRzNe8pHs0fUJkWYm8i1vuHUlSFhqXZNvMwXOtl
	Uhw78f8cV2E8c+o0ZBuMcEm6CUxqsFBogwyrtrBo=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:37 +0200
Message-Id: <20181026081653.24602-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 00/16] gdbstub: support for the multiprocess
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
X-TUID: JdnsFE3g4bZS

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
  arm/xlnx-zynqmp: put APUs and RPUs in separate GDB groups

 include/hw/arm/xlnx-zynqmp.h |   3 +
 include/hw/cpu/cluster.h     |  38 +++
 gdbstub.c                    | 628 ++++++++++++++++++++++++++++++-----
 hw/arm/xlnx-zynqmp.c         |  23 +-
 hw/cpu/cluster.c             |  49 +++
 hw/cpu/Makefile.objs         |   2 +-
 6 files changed, 662 insertions(+), 81 deletions(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

--=20
2.19.1

