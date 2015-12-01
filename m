Received: by 10.182.158.201 with SMTP id ww9csp2136283obb;
        Mon, 30 Nov 2015 23:19:27 -0800 (PST)
X-Received: by 10.140.163.198 with SMTP id j189mr1282784qhj.36.1448954367187;
        Mon, 30 Nov 2015 23:19:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si33408256qgm.27.2015.11.30.23.19.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Nov 2015 23:19:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3fDi-0005QH-Vj
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 02:19:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1a3fDN-00059c-8o
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 02:19:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>) id 1a3fDM-0005DG-6n
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 02:19:05 -0500
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <p.fedin@samsung.com>)
	id 1a3fDF-00059I-QO; Tue, 01 Dec 2015 02:18:57 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout3.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0NYO00ASH4BHIU00@mailout3.w1.samsung.com>; Tue,
	01 Dec 2015 07:18:53 +0000 (GMT)
X-AuditID: cbfec7f5-f79b16d000005389-3a-565d49dd42aa
Received: from eusync2.samsung.com ( [203.254.199.212])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id EA.2F.21385.DD94D565;
	Tue, 1 Dec 2015 07:18:53 +0000 (GMT)
Received: from fedinw7x64 ([106.109.131.169])
	by eusync2.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTPA id <0NYO00GO24BGFV60@eusync2.samsung.com>; Tue,
	01 Dec 2015 07:18:53 +0000 (GMT)
From: Pavel Fedin <p.fedin@samsung.com>
To: qemu-devel@nongnu.org
Date: Tue, 01 Dec 2015 10:18:52 +0300
Message-id: <00fd01d12c08$889435b0$99bca110$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-index: AdEsB7g3cJ51ss1BRoOwb8A6hDvcXw==
Content-language: ru
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsVy+t/xK7p3PWPDDFonyFks6F7IZnG8dweL
	A5PHk2ubmQIYo7hsUlJzMstSi/TtErgylq5awF6wXaZi9SzHBsaV4l2MnBwSAiYSTU0vWSFs
	MYkL99azdTFycQgJLGWUmNDwkwkkISTwnVHi3fxyEJtNQF3i9NcPLCC2iICkxO+u08wgNrOA
	uMTEqSfB4sIC/hKL3+1jBLFZBFQlZl/dCxbnFbCU6HpynQnCFpT4MfkeC0SvlsT6nceZIGx5
	ic1r3jJDHKQgsePsa0aIXXoSb680sEHUiEhM+3ePeQKjwCwko2YhGTULyahZSFoWMLKsYhRN
	LU0uKE5KzzXSK07MLS7NS9dLzs/dxAgJ0a87GJceszrEKMDBqMTDK7E2JkyINbGsuDL3EKME
	B7OSCO8PqdgwId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwzd70PERJITyxJzU5NLUgtgskycXBK
	AYN8Rqa2w8Z8/zvO7+apOLXe7FfM1JMVbvxV8fd17m3Be5OPbZywLYxhGZ/ynMpNn/WWnixe
	HtWv/5rpqdpShTlrVZTN2S88CJ15S5h92wfZie+Cd7bM7N9Wfe2Z8wHpudlTw1u2Fk/l165U
	cTVR29C3aveOOfq8KZ0JvtZ/9stHrDwqXCT9/KsSS3FGoqEWc1FxIgCLafdwTQIAAA==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.13
Cc: qemu-arm@nongnu.org
Subject: [Qemu-devel] BUG ALERT: vexpress model + KVM does not boot up with
	default settings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uieQhxYvDOqt

 Hello!

 Unfortunately i don't have much time to investigate this and it is out of my project's scope, but from time to time i test vexpress
model on ARM32. And after the recent changes regarding TrustZone support vexpress model with direct kernel boot in KVM gets stuck at
this point:

--- cut ---
Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Initializing cgroup subsys cpuset
Linux version 4.1.4+ (p.fedin@fedinw7x64) (gcc version 4.8.3 (Linaro GCC 4.8-2014.04-1~dev) ) #5 SMP Wed Aug 5 18:47:36 MSK 2015
CPU: ARMv7 Processor [412fc0f3] revision 3 (ARMv7), cr=30c5387d
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
Machine model: V2P-CA15
bootconsole [earlycon0] enabled
Forcing write-allocate cache policy for SMP
Memory policy: Data cache writealloc
PERCPU: Embedded 12 pages/cpu @8fdd5000 s16704 r8192 d24256 u49152
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 65024
Kernel command line: console=ttyAMA0,115200n8 root=/dev/vda rw rootwait earlyprintk
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 252256K/262144K available (5374K kernel code, 158K rwdata, 1448K rodata, 272K init, 153K bss, 9888K reserved, 0K
cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0x90800000 - 0xff000000   (1768 MB)
    lowmem  : 0x80000000 - 0x90000000   ( 256 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .text : 0x80008000 - 0x806b1d28   (6824 kB)
      .init : 0x806b2000 - 0x806f6000   ( 272 kB)
      .data : 0x806f6000 - 0x8071dae0   ( 159 kB)
       .bss : 0x8071dae0 - 0x80743f78   ( 154 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
Hierarchical RCU implementation.
	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
NR_IRQS:16 nr_irqs:16 16
L2C: failed to init: -19
NO_HZ: Clearing 0 from nohz_full range for timekeeping
NO_HZ: Full dynticks CPUs: 1.
	Note: kernel parameter 'rcu_nocbs=' contains nonexistent CPUs.
	Offload RCU callbacks from CPUs: 1.
Architected cp15 timer(s) running at 24.00MHz (virt).
clocksource arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
Switching to timer-based delay loop, resolution 41ns
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
clocksource arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275 ns
Console: colour dummy device 80x30
Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=240000)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
/cpus/cpu@0 missing clock-frequency property
/cpus/cpu@1 missing clock-frequency property
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x80008300 - 0x80008358
--- cut ---

 The problem goes away if i add "secure=off" option. "virt" machine is not affected.
 By the way, is it legitimate to default to "secure=on" in KVM mode at all? We cannot have trustzone inside KVM.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia


