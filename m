Received: by 10.25.15.230 with SMTP id 99csp1569869lfp;
        Tue, 28 Mar 2017 04:22:56 -0700 (PDT)
X-Received: by 10.55.126.195 with SMTP id z186mr1535585qkc.144.1490700176748;
        Tue, 28 Mar 2017 04:22:56 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v41si3193076qtc.81.2017.03.28.04.22.56;
        Tue, 28 Mar 2017 04:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0936940C2F;
	Tue, 28 Mar 2017 07:20:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.911
X-Spam-Level: 
X-Spam-Status: No, score=0.911 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_ADSP_CUSTOM_MED=0.001, DKIM_SIGNED=0.1,
	DNS_FROM_AHBL_RHSBL=2.699, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@gmail.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EyUBjeBC41ih; Tue, 28 Mar 2017 07:20:56 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0046C40B3E;
	Tue, 28 Mar 2017 07:20:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 51FBF40B3E
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 07:20:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjxdLBVHazOJ for <kvmarm@lists.cs.columbia.edu>;
 Tue, 28 Mar 2017 07:20:53 -0400 (EDT)
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
 [209.85.216.195])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 612F640AE8
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 07:20:53 -0400 (EDT)
Received: by mail-qt0-f195.google.com with SMTP id n37so11557211qtb.3
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 04:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=myrHAJ8cYD4rZcqMWRz5AEf/5ZUrWctRYWwuO2UJ8W0=;
 b=V1x0bgUYtbI17UWFDHelLoyZdB0sNKZVFGGLYYOUjmGYC04tIuw1lijICYwKj+xDKT
 sh2NBnipJZJ01o2yiNg/ImTiF496mRtcxvNMPW8UX8ovl/82CDvsOc72IVtp7DFI+P2Y
 ivluqRTgwnoIY4PRLHSYBKm9pPaGUp5zHwBRVt0AS4iTSICrUuvaBacRTjOt72p8k+I0
 Z8qwYVcJcOd0KVftKAvplepTSCGMF38KoV5GstsPZITqUH8uhVZaZqByeHe0oLaJGg8T
 T4m0oZkWB4gAHwmUNaAUNn1MtWOX+Ns/Z8rW0a/1tk1Vblj00R95ORqnPHznCxn17UcF
 xw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=myrHAJ8cYD4rZcqMWRz5AEf/5ZUrWctRYWwuO2UJ8W0=;
 b=Puz4s9kTEVUZUBucN82xboT0+3S+Vs/V96apDFlDI1Q4DgQuE/yZx7+D6p6V/oEtDE
 Ch1I2DWVOjmdOE/eZwHtTChBTLJEuryxXzRH1SEIegQXFgSXmmYtOJzJFzSsyOaEQijK
 8FZGg5fyC5CJUsxq1s4PAJK/ECIrnjKVnF67/jlNZXSDEMJD/O9T8FqWddeWdNTNq+vT
 xvvuMsLBzFhWJzQkwHafmSClhiJo2PVgHBXAOCO8r5MidwN6jy8Trav4FpsEkugdD0v7
 YkfukjgKuL0Dey/D6dCwoMaEAtzrmIZnYA748jA1UB0wroK70JYIcUDdpHGue97IK2+/
 RPiA==
X-Gm-Message-State: AFeK/H3i+1AHC6JXrj2TH05d2dli13OA9+UQM90my86HHm4iJyolZ5VALRi2FUJi0CJfY/Ivpw6BRfNM2dADfg==
X-Received: by 10.200.45.59 with SMTP id n56mr25696433qta.137.1490700172045;
 Tue, 28 Mar 2017 04:22:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.173.211 with HTTP; Tue, 28 Mar 2017 04:22:51 -0700 (PDT)
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Tue, 28 Mar 2017 16:52:51 +0530
Message-ID: <CACJhumejPG6s_dewyHH=e5=QLcOUCzvzhakA7oSqm2Ms5cQvRA@mail.gmail.com>
Subject: Aarch64: Qemu master or 2.9.0-rc1 breaks compatibility with 4.10
 kernel.
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 Eric Auger <eric.auger@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>, 
 Christoffer Dall <christoffer.dall@linaro.org>, kvmarm@lists.cs.columbia.edu, 
 Vijaya.Kumar@cavium.com
Cc: bprakash@caviumnetworks.com, sgoutham@cavium.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: M3vvDDIzV6UK

Hi ,

Qemu master or v2.9.0-rc1 doesn't launch guest  when host kernel
version 4.10 or  lower on Aarch64 (cavium ThunderX), its failing with
abort  "qemu-system-aarch64: KVM_GET_DEVICE_ATTR failed: No such
device or address"

"GICv3 live migration support"  patch breaks the  compatibility b/w
kernel and qemu.

Is this expected behaviour,  can we provide a fix without  breaking
compatibility b/w kernel and qemu .

For  more information  below is gdb back trace .
-------------------------------------------------------------------

Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
0x0000ffffa4bd7528 in __GI_raise (sig=sig@entry=6) at
../sysdeps/unix/sysv/linux/raise.c:54
54    ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  0x0000ffffa4bd7528 in __GI_raise (sig=sig@entry=6) at
../sysdeps/unix/sysv/linux/raise.c:54
#1  0x0000ffffa4bd89e0 in __GI_abort () at abort.c:89
#2  0x0000000000479d3c in kvm_device_access (fd=23, group=6, attr=50788,
val=0x15c80d8, write=false)
    at /home/ubuntu/workarea/sources/qemu-stable/qemu-2.9/kvm-all.c:2225
#3  0x00000000004ed948 in arm_gicv3_icc_reset (env=0x13a8ff8, ri=0x1629ed0) at
/home/ubuntu/workarea/sources/qemu-stable/qemu-2.9/hw/intc/arm_gicv3_kvm.c:618
#4  0x0000000000610414 in cp_reg_reset (key=0x1629cf0, value=0x1629ed0,
opaque=0x13a0cf0) at
/home/ubuntu/workarea/sources/qemu-stable/qemu-2.9/target/arm/cpu.c:75
#5  0x0000ffffa4fb0878 in g_hash_table_foreach () from
/lib/aarch64-linux-gnu/libglib-2.0.so.0
Backtrace stopped: previous frame identical to this frame (corrupt stack?)



Verified guest  booting on host 4.10 kernel by reverting "GICv3:
support state save/restore" patches  and  guest booted without issues.

Regards,
Prakash B
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
