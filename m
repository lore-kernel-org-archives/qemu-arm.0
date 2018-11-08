Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp331493wrw;
        Thu, 8 Nov 2018 08:23:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5dbeN1FabgFEQJLozw7wiBezckClzNxE9kgRlN72mzcyR3oHeTdpIwXURvAzitVSnwk2aA+
X-Received: by 2002:a37:a5d1:: with SMTP id o200mr4675307qke.328.1541694204211;
        Thu, 08 Nov 2018 08:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541694204; cv=none;
        d=google.com; s=arc-20160816;
        b=TCtd69HV+tKP2VHMuFvMnL5ZoB2Jv+I4NdYtjEIUQr7M6g4BovoCjD3iq7XvOjCXj2
         qV1jIggI9B6yF0JUSo//cfY1nrcSnq1/YGo2x69j8Npr2NF8l9bZme+QL40NBWiJal5H
         SE/zqzHqATs3VN5era5aepispETK64RXNsfhOZBG5TzZF6lZ3rNBZNTDTaQUrYNP6cG3
         n3xv1VcX+1LArAEON7Rnl/KU2uKdp2K/I6CWiSg2KRgFSXdULC/1HKbH4oj4ZbpGnYQx
         j0gcLAaXnF49w6I2j+iuhAyar96HK0GKVp/uWw8HYYnc7bMkqSmox6Tzs4LcrEFJLg7d
         qdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=RL5apdRVS7hBnuJ1TKsz4sz0CsE58dmMDBzAn7zSQoY=;
        b=EL2kcuAn1WDn8pk3v6HYyxwQRIqGwPZTd2q8O9kpACP29k3l4p7ByKh+Eg4LYpEe68
         jvXfhwbDEkh7JlK90BiLJNCC6UQjRfeqO94P0jw/qCswzC1zY/Bk8DM23hwN+HzUsJqf
         XZERINIMs7UBOvQPSkkDvgb3fo8GciwVtlrW3gUMXeB8Gv4bGoQeAeHIdln1y92F/HpC
         w2Lu86HAA2s2FOFTQKr7dRpZ9yceczwHra6G4s1IE06OyqtY+oWYm1I8QOa2byIxxmg5
         9+ZpZXj2s60Im9CYRCtTZytGyU4okV+K2Jr5etxKfLXpACpDAYEqv6ZXRNAel1xVSYwE
         dCug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u38si3462848qtk.133.2018.11.08.08.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 08:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKn5X-0005qU-I8
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 11:23:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gKmsT-0005X2-SF
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:09:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gKmsN-0000th-GK
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:09:53 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gKmsL-0000qK-Bl
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:09:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id y3-v6so21540394wrh.10
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 08:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RL5apdRVS7hBnuJ1TKsz4sz0CsE58dmMDBzAn7zSQoY=;
	b=ag9vmRHGBzpSkA8h0qwzvv4oxjuDe1RiRJ5djtEN7x4xlpmNOK4uk5/iQBanu//4qv
	grxE8Fy64SKbZlrEdZJFu5hzz9+pBb9wGMB+h8ChYCQLW7Tx3ATZsWXE8NHbdUrS8P5p
	M5Q3Xuxnyj8ydxYbfK9oA8tvfymzmTPzyylyIiMl+QcPs29gL0DdKHQg0O2R4XQJDAuL
	TAQGeg25ocaBbdjc19/WMforzJudUwgvK7XGyj68Ss5iUBNsCdNmRs20DH9VQ80oRXi8
	duxGiGhdUaHjRDXHpGDSJLpdj6FSssC7R5rJWpEECaj+y0dVPZL1KY5FiQu8kBLD8I7D
	quJA==
X-Gm-Message-State: AGRZ1gI1BvmqaETclkN3Y8eruq+MDOXztWoZHtCmLkd7tk832MoRAUGF
	9i3gO2oJaNxEJ9vfFprF6DQoiOxribzesQ==
X-Received: by 2002:adf:f6c3:: with SMTP id
	y3-v6mr4560459wrp.114.1541693381176; 
	Thu, 08 Nov 2018 08:09:41 -0800 (PST)
Received: from [10.201.33.126] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	t82-v6sm5596797wme.30.2018.11.08.08.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 08:09:40 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181106110548.4209-1-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <af576b19-511c-f9e7-cc42-166d63ab6d39@redhat.com>
Date: Thu, 8 Nov 2018 17:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 00/16] gdbstub: support for
 the multiprocess extension
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
X-TUID: T1qjDeM+F6pL

On 6/11/18 12:05, Luc Michel wrote:
> changes since v3:
>    - patch 1    cpu_cluster.h: remove QEMU_ from the multiple includes
>                 guard #ifdef/#define [Alistair]
> 
>    - patch 1    cpu_cluster.c: include osdep.h first [Alistair]
> 
>    - patch 1    use uint64_t for cluster ID for prosperity :) [Philippe]

Actually my comment about 32-bit had the opposite meaning, I suppose 
having 256 kind of cpu cores in the same SoC is probably enough for a 
long time IMHO.

> 
>    - patch 1    auto-assign a cluster ID to newly created clusters [Philippe]
> 
>    - patch 2    fix mid-code variable declaration [Alistair]
> 
>    - patch 3    add a comment in gdb_get_cpu_pid() when retrieving CPU
>                 parent canonical path [Alistair]
> 
>    - patch 14   fix a typo in the commit message [Alistair]
> 
> changes since v2:
>    - patch 1    introducing the cpu-cluster type. I didn't opt for an
>                 Interface, but I can add one if you think it's necessary.
>                 For now this class inherits from Device and has a
>                 cluster-id property, used by the GDB stub to compute a
>                 PID.
> 
>    - patch 2    removed GDB group related code as it has been replaced
>                 with CPU clusters
> 
>    - patch 2/8  moved GDBProcess target_xml field introduction into patch
>                 8 [Philippe]
> 
>    - patch 3    gdb_get_cpu_pid() now search for CPU being a child of a
>                 cpu-cluster object. Use the cluster-id to compute the PID.
> 
>    - patch 4    gdb_get_process() does not rely on s->processes array
>                 indices anymore as PIDs can now be sparse. Instead, iterate
>                 over the array to find the process.
> 
>    - patch 3/4  removed Reviewed-by tags because of substantial changes.
> 
>    - patch 4/7  read_thread_id() hardening [Philippe]
> 
>    - patch 12   safer vAttach packet parsing [Phillipe]
> 
>    - patch 16   put APUs and RPUs in different clusters instead of GDB
>                 groups
> 
> changes since v1:
>    - rename qemu_get_thread_id() to gdb_fmt_thread_id() [Philippe]
>    - check qemu_strtoul() return value for 'D' packets [Philippe]
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
> Luc Michel (16):
>    hw/cpu: introduce CPU clusters
>    gdbstub: introduce GDB processes
>    gdbstub: add multiprocess support to '?' packets
>    gdbstub: add multiprocess support to 'H' and 'T' packets
>    gdbstub: add multiprocess support to vCont packets
>    gdbstub: add multiprocess support to 'sC' packets
>    gdbstub: add multiprocess support to (f|s)ThreadInfo and
>      ThreadExtraInfo
>    gdbstub: add multiprocess support to Xfer:features:read:
>    gdbstub: add multiprocess support to gdb_vm_state_change()
>    gdbstub: add multiprocess support to 'D' packets
>    gdbstub: add support for extended mode packet
>    gdbstub: add support for vAttach packets
>    gdbstub: processes initialization on new peer connection
>    gdbstub: gdb_set_stop_cpu: ignore request when process is not attached
>    gdbstub: add multiprocess extension support
>    arm/xlnx-zynqmp: put APUs and RPUs in separate CPU clusters
> 
>   include/hw/arm/xlnx-zynqmp.h |   3 +
>   include/hw/cpu/cluster.h     |  38 +++
>   gdbstub.c                    | 632 ++++++++++++++++++++++++++++++-----
>   hw/arm/xlnx-zynqmp.c         |  21 +-
>   hw/cpu/cluster.c             |  59 ++++
>   hw/cpu/Makefile.objs         |   2 +-
>   6 files changed, 674 insertions(+), 81 deletions(-)
>   create mode 100644 include/hw/cpu/cluster.h
>   create mode 100644 hw/cpu/cluster.c
> 
