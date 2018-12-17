Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2218722wrt;
        Mon, 17 Dec 2018 00:24:22 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UzBfVAwEeiTuux/k/c4zmOnom5Oagql0PSs/sCnR+4qbFLqavSRpC+S7ioE2DvF1dhTJOz
X-Received: by 2002:a37:8fc1:: with SMTP id r184mr11467055qkd.32.1545035062268;
        Mon, 17 Dec 2018 00:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545035062; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9AVa6WsWyhND1f7NKb16gTxPfuIdVU4cvSJjQmkbjjbbJ06dcZjfmWmbfyYV4zyzn
         ZOpYa6pLM7P5ATF2gmTpTzEDPT7dCajBoMCXSeedvfiarpkavnRV3TPr2FCGN5hdP4Hm
         9qZZsSkK4gwzjZ9TZpG+g7sTIMY1N6HDaffrGX6cQPd2aU7jXQ87co3CPMdUSTr53EFU
         oioArSzYopHZDOq55RFvFUxD60npaPc6gdN40f+Swg/FG1sY0ayUyanRkUwJwy5+0wFA
         qphPyUCqm2ar+P9Jku/Smp8A4z6bMoNCdmBkmyhVCzbRXT86QQOg9onURVjC/zfctxjj
         yCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=6yi/A5DapMLEQPzdpInY8EgAVLxejQgETHCDnXtKdIc=;
        b=D6xWdi+eakItVy21vFCwfmkrdkCgLPrdY/WRhDCjG3ukAx3lxhkUApEdBGQ7kG3h4f
         scekB7vVAHQCI1ZLnzJEToLiEOayVaFsEJAJksDdhNq26rNo8YoK4L6eL+eonfx+fb6U
         ZBt/LC2kFS5tWsfd1w5+zZ38oT+XWn+qrjDW9Hk9h9/wWPy4IxLIAjKFP+xUKHwS94ja
         Rwk4T2qlL/T6PUCUsunf4jxfnJqPU/O0IrqV37eSBC44h02lE0+aapc265iFPZ692K4U
         9o+n1UB17kusSci0oVNMtqvXsgwU/ZfUWKLpWilLzvb38DzaqEDlquQ9broIVnX+cRAl
         y64A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=o2ZK2KSt;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=XLNSqSM6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=XLNSqSM6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si2986152qtr.77.2018.12.17.00.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 00:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=o2ZK2KSt;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=XLNSqSM6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=XLNSqSM6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYoCL-0004T4-D2
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 03:24:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gYoC4-0004Hb-Hg
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 03:24:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gYoC0-0005n7-4E
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 03:24:04 -0500
Received: from greensocs.com ([193.104.36.180]:48251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gYoBw-0005Zt-7p; Mon, 17 Dec 2018 03:23:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4CC765DB9D6;
	Mon, 17 Dec 2018 09:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1545035023;
	bh=+kXKuCH7bxUkxF/JGHsw514o8v4L+7nWfxTllqROPhY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=o2ZK2KStP0QQM61aIkz++hF3e5uTpsIq+2amcXWzNuIhAVVSufLUPh2KzSkVCmtF8
	2RCM5m3xwpuHk3Bn/xuSyB1CrwyW2+ToVqqkUyJAXiB3YLqT0LZRUB8oSA4y3bM4Lq
	HLDhDv6q53JGjGDU3aJHHL+QiIGYIpItleQuUILw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=XLNSqSM6;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=XLNSqSM6
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWdj58fWv-GX; Mon, 17 Dec 2018 09:23:42 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 5C0945DB9D1; Mon, 17 Dec 2018 09:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1545035022;
	bh=+kXKuCH7bxUkxF/JGHsw514o8v4L+7nWfxTllqROPhY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=XLNSqSM6rz+56yhDtdMk0RA6UyhKRmYXbg2U7aGEZz9mumeUoWj65Wgc0spIyUsI9
	mZG2c3B7I8nUMd6K+fo7kOqDyOaugfxJ3olWbdlIETysCpt0FcNI3cjlgKP8st+4BJ
	KKYQtvAnwrCQ2tnHBp5dIom4p1XXyHk40lQp2S+4=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EC4F75DB9C6;
	Mon, 17 Dec 2018 09:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1545035022;
	bh=+kXKuCH7bxUkxF/JGHsw514o8v4L+7nWfxTllqROPhY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=XLNSqSM6rz+56yhDtdMk0RA6UyhKRmYXbg2U7aGEZz9mumeUoWj65Wgc0spIyUsI9
	mZG2c3B7I8nUMd6K+fo7kOqDyOaugfxJ3olWbdlIETysCpt0FcNI3cjlgKP8st+4BJ
	KKYQtvAnwrCQ2tnHBp5dIom4p1XXyHk40lQp2S+4=
To: qemu-devel@nongnu.org
References: <20181207090135.7651-1-luc.michel@greensocs.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <07b4fcad-0b6f-a69a-bbfe-41d4fa895480@greensocs.com>
Date: Mon, 17 Dec 2018 09:23:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v8 00/16] gdbstub: support for the
 multiprocess extension
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
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oMzA5/iRx7mZ

Hi all,

What do you think of this re-roll? Is it in good shape for upstreaming?

Thanks!

-- 
Luc

On 12/7/18 10:01 AM, Luc Michel wrote:
> changes since v7:
>   - patch 1    Add documentation about cpu-cluster [Eduardo, Peter]
> 
>   - patch 1    Remove the cluster-id auto-assign mechanism [Eduardo]
> 
>   - patch 2    Replace create_unique_process() with
>                create_default_process() that is now called even if some
>                clusters are found. This default process is used for
>                CPUs that are not in a cluster [Eduardo, Peter]
> 
>   - patch 3    Refactor and harden gdb_get_cpu_pid() [Philippe]
> 
>   - patch 16   Go back to cluster-id manual assignment [Eduardo]
> 
> changes since v6:
>   - patch 4    Fix a refactoring issue in gdb_get_cpu [Edgar]
> 
>   - patch 5    Renamed gdb_first_cpu/gdb_next_cpu to
>                gdb_first_attached_cpu/gdb_next_attached_cpu [Edgar]
> 
>   - patch 7    Added the CPU name and removed the CPU index in the
>                ThreadInfo packet in multiprocess mode [Edgar]
> 
> changes since v5:
>   - patch 1    Rebased on top of master
> 
>   - patch 2    Cluster ID handling hardening to ensure uint32_t overflow
>                won't cause PID 0 to be used [Edgar]
> 
>   - patch 2    Fix the GDB process ordering function to avoid uint32_t
>                overflow when comparing two cluster_ids [Edgar]
> 
> changes since v4:
>   - patch 1    add cpu_cluster.[ch] files into MAINTAINERS Machine core
>                section (thanks Eduardo!) [Philippe, Eduardo]
> 
>   - patch 1    revert to uint32_t for cluster IDs [Philippe]
> 
>   - patch 1    fixed a coding style issue [patchew]
> 
> changes since v3:
>   - patch 1    cpu_cluster.h: remove QEMU_ from the multiple includes
>                guard #ifdef/#define [Alistair]
> 
>   - patch 1    cpu_cluster.c: include osdep.h first [Alistair]
> 
>   - patch 1    use uint64_t for cluster ID for prosperity :) [Philippe]
> 
>   - patch 1    auto-assign a cluster ID to newly created clusters [Philippe]
> 
>   - patch 2    fix mid-code variable declaration [Alistair]
> 
>   - patch 3    add a comment in gdb_get_cpu_pid() when retrieving CPU
>                parent canonical path [Alistair]
> 
>   - patch 14   fix a typo in the commit message [Alistair]
> 
> changes since v2:
>   - patch 1    introducing the cpu-cluster type. I didn't opt for an
>                Interface, but I can add one if you think it's necessary.
>                For now this class inherits from Device and has a
>                cluster-id property, used by the GDB stub to compute a
>                PID.
> 
>   - patch 2    removed GDB group related code as it has been replaced
>                with CPU clusters
> 
>   - patch 2/8  moved GDBProcess target_xml field introduction into patch
>                8 [Philippe]
> 
>   - patch 3    gdb_get_cpu_pid() now search for CPU being a child of a
>                cpu-cluster object. Use the cluster-id to compute the PID.
> 
>   - patch 4    gdb_get_process() does not rely on s->processes array
>                indices anymore as PIDs can now be sparse. Instead, iterate
>                over the array to find the process.
> 
>   - patch 3/4  removed Reviewed-by tags because of substantial changes.
> 
>   - patch 4/7  read_thread_id() hardening [Philippe]
> 
>   - patch 12   safer vAttach packet parsing [Phillipe]
> 
>   - patch 16   put APUs and RPUs in different clusters instead of GDB
>                groups
> 
> changes since v1:
>   - rename qemu_get_thread_id() to gdb_fmt_thread_id() [Philippe]
>   - check qemu_strtoul() return value for 'D' packets [Philippe]
> 
> 
> This series adds support for the multiprocess extension of the GDB
> remote protocol in the QEMU GDB stub.
> 
> This extension is useful to split QEMU emulated CPUs in different
> processes from the point of view of the GDB client. It adds the
> possibility to debug different kind of processors (e.g. an AArch64 and
> an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
> expects an SMP view at the thread granularity.
> 
> CPUs are grouped using specially named QOM containers. CPUs that are
> children of such a container are grouped under the same GDB process.
> 
> The last patch groups the CPUs of different model in the zynqmp machines
> into separate processes.
> 
> To test this patchset, you can use the following commands:
> 
> (Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
> Also, it must be compiled to support both ARM and AArch64 architectures)
> 
> Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
> CPUs)
> 
> qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6
> 
> Run the following commands in GDB:
> 
> target extended :1234
> add-inferior
> inferior 2
> attach 2
> info threads
> 
> I want to thanks the Xilinx's QEMU team who sponsored this work for
> their collaboration and their prototype implementation.
> 
> 
> Luc Michel (16):
>   hw/cpu: introduce CPU clusters
>   gdbstub: introduce GDB processes
>   gdbstub: add multiprocess support to '?' packets
>   gdbstub: add multiprocess support to 'H' and 'T' packets
>   gdbstub: add multiprocess support to vCont packets
>   gdbstub: add multiprocess support to 'sC' packets
>   gdbstub: add multiprocess support to (f|s)ThreadInfo and
>     ThreadExtraInfo
>   gdbstub: add multiprocess support to Xfer:features:read:
>   gdbstub: add multiprocess support to gdb_vm_state_change()
>   gdbstub: add multiprocess support to 'D' packets
>   gdbstub: add support for extended mode packet
>   gdbstub: add support for vAttach packets
>   gdbstub: processes initialization on new peer connection
>   gdbstub: gdb_set_stop_cpu: ignore request when process is not attached
>   gdbstub: add multiprocess extension support
>   arm/xlnx-zynqmp: put APUs and RPUs in separate CPU clusters
> 
>  include/hw/arm/xlnx-zynqmp.h |   3 +
>  include/hw/cpu/cluster.h     |  58 +++
>  gdbstub.c                    | 662 +++++++++++++++++++++++++++++++----
>  hw/arm/xlnx-zynqmp.c         |  23 +-
>  hw/cpu/cluster.c             |  50 +++
>  MAINTAINERS                  |   2 +
>  hw/cpu/Makefile.objs         |   2 +-
>  7 files changed, 719 insertions(+), 81 deletions(-)
>  create mode 100644 include/hw/cpu/cluster.h
>  create mode 100644 hw/cpu/cluster.c
> 
