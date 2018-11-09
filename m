Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp415718wrw;
        Fri, 9 Nov 2018 00:37:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5cq/92a/APVax9GGzbZk1gdQ7Wt4IahyHNbef29Y6TPaYuklqAiCHYdqbH+JMbw+NbeiPGH
X-Received: by 2002:a0c:9144:: with SMTP id q62mr7809609qvq.87.1541752631150;
        Fri, 09 Nov 2018 00:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541752631; cv=none;
        d=google.com; s=arc-20160816;
        b=UPpzSFtTUWYzNRzXJlTHKLRr0cfcsJ7KV2QK22S6DTl95AWO7puuuGuWBXXF5Wcnyu
         8TNKrDnWNXkaIsaoEdloy4STaopPu41YSwpf5Z1maeO8ryRPiNNcf9eLiBEfd8a20qR1
         aV9vN2btTRG5hjEnkE3U1GUJArYcsQ+Wqe7CnirsFHc2Qbqt+58ntH1C16fCk7XzxSjP
         RsQyw1nN+BvISK5HmOc33ySoGhfRLLaEc0imfLzckx8TEINn1arL3bgL8fghE5skfnGe
         zpVha5vCTtZrP8j6EUGSygct/9syRRX0RwupHyaEVnA/JADe2Y1G7sVLnV1EN9/bgt+t
         hcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=ur29vnHGrMHAlGphQ1cUBSg+HNTnU0jt5Qq4AteHR7Q=;
        b=UKX61LnVl3ZQ3ARAYyfGJUQMu16xD7aM98KcftBtA6+kl/NAzZTN2JSRiLwTLWywrH
         sWAPtNOIAtKT1uz8ib2Wpd1KTBE9eTnM50cxe5e4o4KpQLFfnL6b8FKS4Y+MGjnmfD/R
         LrwGjs1dkLad3kGCWBGgVk8g11PhqD6PlLNXRmd8yuZ8iOpvkeJMbDVJjEM+TIaszytb
         48U09NxZ3gGvlzvKAu69/LvrPNxHDfWQ8OD1JEpGn5K8VzDuxx5TDMOg9AINED12DB+q
         uvXHSDsuXzu3CVGUaOJWpC57fKiVpNMGR2bsunxcyt+LcjZbu8GRe+O7F8DflxB4vF4R
         oi/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TEk1OAeq;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bbKT6zmZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bbKT6zmZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h24si273417qve.162.2018.11.09.00.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 00:37:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TEk1OAeq;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bbKT6zmZ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bbKT6zmZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL2Hu-0000La-L4
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 03:37:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gL2Hk-0000LS-3j
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 03:37:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gL2Hg-0002D0-Rw
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 03:37:00 -0500
Received: from greensocs.com ([193.104.36.180]:57848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gL2Hg-000299-AL; Fri, 09 Nov 2018 03:36:56 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 518EE443245;
	Fri,  9 Nov 2018 09:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541752606;
	bh=rYdD0xW0Lyu0Lb2bzigYNx4jEKzEtbyb3YSwfx13fpg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=TEk1OAeqmK+tmlegVZjo760a2/mgFo/6VAhIr6+Tp/hmLTErjyJZ7rrqPsT98dmyK
	Q+8sytfhGeyxxqQr+oYV1QbndhsFUb94PYVnIXJ1FwbYQkFs+XFuZZzsL2pUU0VQgb
	Q3JDuFe95kCQcn13dRQKMHe9oOd4X7r4dB9cqhaY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bbKT6zmZ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bbKT6zmZ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukZmEC5k5vNp; Fri,  9 Nov 2018 09:36:45 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6F7BF443255; Fri,  9 Nov 2018 09:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541752605;
	bh=rYdD0xW0Lyu0Lb2bzigYNx4jEKzEtbyb3YSwfx13fpg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=bbKT6zmZguZ9W6PQI6BoWoPGxbQ+hMOiXeolCs+s4CnAop2JGuKrTxycLQl3y1zoz
	F4mBaUKuTwCHQ4revqzG1PKvlhO5G2GL0h3AXTf32KW1uCL/LiemJDIzWJ7gBAwp8k
	7laGA4SDgzRp5tCyt2UIM72LmOHM8A2s/hki0JFM=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0A764443245;
	Fri,  9 Nov 2018 09:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541752605;
	bh=rYdD0xW0Lyu0Lb2bzigYNx4jEKzEtbyb3YSwfx13fpg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=bbKT6zmZguZ9W6PQI6BoWoPGxbQ+hMOiXeolCs+s4CnAop2JGuKrTxycLQl3y1zoz
	F4mBaUKuTwCHQ4revqzG1PKvlhO5G2GL0h3AXTf32KW1uCL/LiemJDIzWJ7gBAwp8k
	7laGA4SDgzRp5tCyt2UIM72LmOHM8A2s/hki0JFM=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20181106110548.4209-1-luc.michel@greensocs.com>
	<af576b19-511c-f9e7-cc42-166d63ab6d39@redhat.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <49f7bcc1-b615-6889-0d13-b42b4f6686fc@greensocs.com>
Date: Fri, 9 Nov 2018 09:36:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <af576b19-511c-f9e7-cc42-166d63ab6d39@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
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
X-TUID: J2hzTz+vh6vG

On 11/8/18 5:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 6/11/18 12:05, Luc Michel wrote:
>> changes since v3:
>> =C2=A0=C2=A0 - patch 1=C2=A0=C2=A0=C2=A0 cpu_cluster.h: remove QEMU_ f=
rom the multiple includes
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 guard #ifdef/#define [Alistair]
>>
>> =C2=A0=C2=A0 - patch 1=C2=A0=C2=A0=C2=A0 cpu_cluster.c: include osdep.=
h first [Alistair]
>>
>> =C2=A0=C2=A0 - patch 1=C2=A0=C2=A0=C2=A0 use uint64_t for cluster ID f=
or prosperity :) [Philippe]
>=20
> Actually my comment about 32-bit had the opposite meaning, I suppose
> having 256 kind of cpu cores in the same SoC is probably enough for a
> long time IMHO.
Oops sorry about that :) I thought you were referring to an old quote
from a guy at Redmond about 640KiB of RAM ;)

A case I was thinking about that would require more than 8- or 16-bit ID
is if for whatever reason we need to model a SoC with sparse
(non-continuous) cluster IDs.

Anyway, I can put back the uint32_t for the next re-roll, I think it's a
good compromise.

Thanks.

Luc

>=20
>>
>> =C2=A0=C2=A0 - patch 1=C2=A0=C2=A0=C2=A0 auto-assign a cluster ID to n=
ewly created clusters
>> [Philippe]
>>
>> =C2=A0=C2=A0 - patch 2=C2=A0=C2=A0=C2=A0 fix mid-code variable declara=
tion [Alistair]
>>
>> =C2=A0=C2=A0 - patch 3=C2=A0=C2=A0=C2=A0 add a comment in gdb_get_cpu_=
pid() when retrieving CPU
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 parent canonical path [Alistair]
>>
>> =C2=A0=C2=A0 - patch 14=C2=A0=C2=A0 fix a typo in the commit message [=
Alistair]
>>
>> changes since v2:
>> =C2=A0=C2=A0 - patch 1=C2=A0=C2=A0=C2=A0 introducing the cpu-cluster t=
ype. I didn't opt for an
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Interface, but I can add one if you think it's necessa=
ry.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 For now this class inherits from Device and has a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cluster-id property, used by the GDB stub to compute a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PID.
>>
>> =C2=A0=C2=A0 - patch 2=C2=A0=C2=A0=C2=A0 removed GDB group related cod=
e as it has been replaced
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 with CPU clusters
>>
>> =C2=A0=C2=A0 - patch 2/8=C2=A0 moved GDBProcess target_xml field intro=
duction into patch
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 8 [Philippe]
>>
>> =C2=A0=C2=A0 - patch 3=C2=A0=C2=A0=C2=A0 gdb_get_cpu_pid() now search =
for CPU being a child of a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cpu-cluster object. Use the cluster-id to compute the
>> PID.
>>
>> =C2=A0=C2=A0 - patch 4=C2=A0=C2=A0=C2=A0 gdb_get_process() does not re=
ly on s->processes array
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 indices anymore as PIDs can now be sparse. Instead,
>> iterate
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 over the array to find the process.
>>
>> =C2=A0=C2=A0 - patch 3/4=C2=A0 removed Reviewed-by tags because of sub=
stantial changes.
>>
>> =C2=A0=C2=A0 - patch 4/7=C2=A0 read_thread_id() hardening [Philippe]
>>
>> =C2=A0=C2=A0 - patch 12=C2=A0=C2=A0 safer vAttach packet parsing [Phil=
lipe]
>>
>> =C2=A0=C2=A0 - patch 16=C2=A0=C2=A0 put APUs and RPUs in different clu=
sters instead of GDB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 groups
>>
>> changes since v1:
>> =C2=A0=C2=A0 - rename qemu_get_thread_id() to gdb_fmt_thread_id() [Phi=
lippe]
>> =C2=A0=C2=A0 - check qemu_strtoul() return value for 'D' packets [Phil=
ippe]
>>
>>
>> This series adds support for the multiprocess extension of the GDB
>> remote protocol in the QEMU GDB stub.
>>
>> This extension is useful to split QEMU emulated CPUs in different
>> processes from the point of view of the GDB client. It adds the
>> possibility to debug different kind of processors (e.g. an AArch64 and
>> an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
>> expects an SMP view at the thread granularity.
>>
>> CPUs are grouped using specially named QOM containers. CPUs that are
>> children of such a container are grouped under the same GDB process.
>>
>> The last patch groups the CPUs of different model in the zynqmp machin=
es
>> into separate processes.
>>
>> To test this patchset, you can use the following commands:
>>
>> (Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
>> Also, it must be compiled to support both ARM and AArch64 architecture=
s)
>>
>> Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
>> CPUs)
>>
>> qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6
>>
>> Run the following commands in GDB:
>>
>> target extended :1234
>> add-inferior
>> inferior 2
>> attach 2
>> info threads
>>
>> I want to thanks the Xilinx's QEMU team who sponsored this work for
>> their collaboration and their prototype implementation.
>>
>> Luc Michel (16):
>> =C2=A0=C2=A0 hw/cpu: introduce CPU clusters
>> =C2=A0=C2=A0 gdbstub: introduce GDB processes
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to '?' packets
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to 'H' and 'T' packets
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to vCont packets
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to 'sC' packets
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to (f|s)ThreadInfo and
>> =C2=A0=C2=A0=C2=A0=C2=A0 ThreadExtraInfo
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to Xfer:features:read:
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to gdb_vm_state_change(=
)
>> =C2=A0=C2=A0 gdbstub: add multiprocess support to 'D' packets
>> =C2=A0=C2=A0 gdbstub: add support for extended mode packet
>> =C2=A0=C2=A0 gdbstub: add support for vAttach packets
>> =C2=A0=C2=A0 gdbstub: processes initialization on new peer connection
>> =C2=A0=C2=A0 gdbstub: gdb_set_stop_cpu: ignore request when process is=
 not attached
>> =C2=A0=C2=A0 gdbstub: add multiprocess extension support
>> =C2=A0=C2=A0 arm/xlnx-zynqmp: put APUs and RPUs in separate CPU cluste=
rs
>>
>> =C2=A0 include/hw/arm/xlnx-zynqmp.h |=C2=A0=C2=A0 3 +
>> =C2=A0 include/hw/cpu/cluster.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 38 +++
>> =C2=A0 gdbstub.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 632 ++++++=
++++++++++++++++++++++++-----
>> =C2=A0 hw/arm/xlnx-zynqmp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 21 +-
>> =C2=A0 hw/cpu/cluster.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 59 ++++
>> =C2=A0 hw/cpu/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 6 files changed, 674 insertions(+), 81 deletions(-)
>> =C2=A0 create mode 100644 include/hw/cpu/cluster.h
>> =C2=A0 create mode 100644 hw/cpu/cluster.c
>>
