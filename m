Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1087503qvm;
        Tue, 14 Apr 2020 10:01:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJB/phu1q3aGp3VrmppCHGbn4v4e0BxoOTpKNB07bzPsWPuHNS/ovND+gd29D/pSQPjwk/T
X-Received: by 2002:ac8:44d3:: with SMTP id b19mr3588359qto.27.1586883700523;
        Tue, 14 Apr 2020 10:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586883700; cv=none;
        d=google.com; s=arc-20160816;
        b=Jk3hH1Jbq+WqP7+2dW6nLgTpvJUmt406j6spSrxdtC1ajzE9xGSkak45cQ1v/yHNLG
         XHqbK7R03w541q/riMRaAhdDBy0NzwzOprlCDDjmRnKrfg06c7f0oPFPcC3SmYxnKRuo
         hLpynOsFWSOOvBF6EFxJuJUd0NF08/j9gEUHLaeWdkD/l5y9DYVLZe5b3/U1IfPj2Y+G
         2m+cG3n/bDHsb6UzdrAGx6xat+EJU8h6NCoByc8LKH7f/6vLp1cHWgm6nCgxiYG+9Z6n
         KsfYjSfZ6/Ue14r9soOzjowu9dd27SIlkFqn5UVuGVhRDVp7cD3nt95eQmg6HqCk8gAG
         28MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=TN8mZWCWbp3WHx1KCZ1uB2AcwUnZohgLirQxVAx2jq0=;
        b=VZVFTDKAmErPstC1SA4pKx+1xVFPGuyWn3O8TVyEXVatLOWWKNytyUTOaESLOaObTx
         xF9wWz0FOswDq9Gb/71yq4vBATfi0fKF7gK2zyWwSDmAVdRcbTcrAGX6h6K7XRTpdlr/
         6afpENejf14LbnzaftZPOBa3lfbY9A9CQi5p/tTzZOimbghY0s/CSCsQ/hJA4pkyEpu2
         s6dzcluPQ8Y2xCmZ0fOJzbfhTPmeR82izk9Pew+9KzuovUx84bpRi8FqUnFSMTy14MIR
         J1OL5k23z5cpEN9qgKq40dTDr86fl3ahGrZLJh4A7TdG2Qr+YJ6pKsWPpkqT7GXdBVVr
         QQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=lWrUXepa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si7477723qvb.171.2020.04.14.10.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 10:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=lWrUXepa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOwO-0006qX-0q
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 13:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOOlP-0006EB-2n
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:50:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOOlN-0002bc-E1
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:50:18 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jON5J-0003bw-85; Tue, 14 Apr 2020 11:02:45 -0400
Received: by mail-pl1-x644.google.com with SMTP id n24so15916plp.13;
 Tue, 14 Apr 2020 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TN8mZWCWbp3WHx1KCZ1uB2AcwUnZohgLirQxVAx2jq0=;
 b=lWrUXepaNHCTkGNRqPNnE6AHl5ZgiovyKtoJ1m7ENwt8lwqJfwU0aT044AP8GhE+Xp
 5qPWBahjTU1bmZzc0NWa87GE6EVddGJg+AEk46TmKBeUimYOYsAnGsu0TSNh6L/aJPx8
 LKsDasdvSp4KXxhsAwxUcO8sI9+gNChQf0k9Ris5vRebaFFvnErvnUm8QpoldACGOTEc
 OKjQDahPlV0KwtMExZC9nMR51Ak2mlURx9VSIea5Zj371E5iSkAT2Ju08fzQ2YhAi/Um
 Y5PuMWlAc+3pOUSzax7XuN7OZfO2RVdu2cPoLmJ46tacaYc2aFC8QNvTNAK1gumxs91v
 n+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TN8mZWCWbp3WHx1KCZ1uB2AcwUnZohgLirQxVAx2jq0=;
 b=nLW90fMMzHS2+vZM++URr/29dhftsuLqPRG5ZGpW/q8gTeJ4rqlAaiwxQfKHIKD2Ce
 CApogzlCeKtlqrzK4lb+G4ahEf4Ac9hEOzltY6fClbjYjJZH5aLwjc+IR2rcmtgoBjZT
 TFTVfiLxYOHhS0QvSqwYvuV6F3/OUvhj4NkRrCBDtIgTM/WesZd+BlmwmAB4njbNL8bu
 vLr591vt2qjqFGnz5lpe+mU0pJAmqgZkUCDDkdejZhUoV06iJhriaTvNZaEZRB/+Rkf6
 WYmq34LoZPD3We8tSDwCdu9S51hDoPD0/mO3gzckFN40tr/yTZAhT6ZVOdEoqHYL27n9
 CKqQ==
X-Gm-Message-State: AGi0PuaAQoCcu4b7SVURfrNNyzZYNIrg1by/+BLgNYIwbfl8naGjfTbQ
 oTxSvjclUEL0lx6HDlhqqPQ=
X-Received: by 2002:a17:902:7485:: with SMTP id
 h5mr362588pll.226.1586876563898; 
 Tue, 14 Apr 2020 08:02:43 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id f9sm12175240pjt.45.2020.04.14.08.02.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 08:02:43 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v5 0/3] Add SmartFusion2 EMAC block
Date: Tue, 14 Apr 2020 20:32:28 +0530
Message-Id: <1586876551-3695-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R9p/HT8Hzc2Q

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

This patch set emulates Ethernet MAC block
present in Microsemi SmartFusion2 SoC.

v5:
 As per Philippe comments:
	Returned size in receive function
	Added link property to pass DMA memory
    Used FIELD() APIs
    Added mac_addr in emac state
    Used FIELD_EX32 and FIELD_DP32 APIs
    Simplified if else logics in emac_write/read
v4:
  Added loop back as per Jason's comment 
v3:
  Added SmartFusion2 ethernet test to tests/acceptance
v2:
  No changes. Fixed Signed-off mail id in patch 2/2

Testing:

1. Download u-boot.bin, uImage and msf2-devkit.dtb from
   https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
2. Copy uImage and msf2-devkit.dtb to suitable Qemu tftp directory
3. Launch Qemu by
   ./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio -kernel \
   u-boot.bin -display none -nic user,tftp=<qemu tftp directory>

Example:
./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio -kernel u-boot -display none -nic user,tftp=/home/hyd1358/qemu_tftp

U-Boot 2010.03-00000-ga7695d6 (Apr 04 2020 - 15:07:27)

CPU  : SmartFusion2 SoC (Cortex-M3 Hard IP)
Freqs: CORTEX-M3=142MHz,PCLK0=71MHz,PCLK1=71MHz
Board: M2S-FG484-SOM Rev 1A, www.emcraft.com
DRAM:  64 MB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   M2S_MAC

Hit any key to stop autoboot:  3  0 

M2S-FG484-SOM> run netboot
Using M2S_MAC device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'uImage'.
Load address: 0xa0007fc0
Loading: *#################################################################
 #################################################################
 #################################################################
 ###############################################################
done
Bytes transferred = 3681568 (382d20 hex)
Using M2S_MAC device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'msf2-devkit.dtb'.
Load address: 0xa0000200
Loading: *#
done
Bytes transferred = 1712 (6b0 hex)
## Booting kernel from Legacy Image at a0007fc0 ...
   Image Name:   
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3681504 Bytes =  3.5 MB
   Load Address: a0008000
   Entry Point:  a0008001
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.5.0-gb0e5502-dirty (hyd1358@hyd1358) (gcc version 4.4.1 (Sourcery G++ Lite 2010q1-189) ) #85 PREEMPT Sat Apr 4 23:26:40 IST 2020
[    0.000000] CPU: ARMv7-M [410fc231] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] Machine model: Microsemi SmartFusion 2 development board
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
[    0.000000] Kernel command line: console=ttyS0,115200n8 panic=10 mem=64M@0xa0000000 earlyprintk
[    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 61212K/65536K available (1612K kernel code, 75K rwdata, 680K rodata, 1224K init, 120K bss, 4324K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x00000000 - 0x00001000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MB)
[    0.000000]     lowmem  : 0xa0000000 - 0xa4000000   (  64 MB)
[    0.000000]     modules : 0xa0000000 - 0xa0800000   (   8 MB)
[    0.000000]       .text : 0xa0008000 - 0xa02453e8   (2293 kB)
[    0.000000]       .init : 0xa0246000 - 0xa0378000   (1224 kB)
[    0.000000]       .data : 0xa0378000 - 0xa038ace0   (  76 kB)
[    0.000000]        .bss : 0xa038ace0 - 0xa03a8ea0   ( 121 kB)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
.
.
.
[    0.445184] Found M2S MAC at 0x40041000, irq 18
[    0.448810] libphy: msf2 MII bus: probed
[    0.527047] ipip: IPv4 over IPv4 tunneling driver
[    0.532367] NET: Registered protocol family 10
[    0.542307] sit: IPv6 over IPv4 tunneling driver
[    0.544655] NET: Registered protocol family 17
[    0.565395] Freeing unused kernel memory: 1224K (a0246000 - a0378000)
init started: BusyBox v1.31.1 (2020-01-25 20:01:06 IST)
starting pid 26, tty '': '/etc/rc'
starting pid 31, tty '/dev/ttyS0': '/bin/hush -i'


BusyBox v1.31.1 (2020-01-25 20:01:06 IST) hush - the humble shell
Enter 'help' for a list of built-in commands.

/ # ifconfig eth0 10.0.2.15
[   11.116091] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
/ # [   11.653634] eth0: link up (100/full)
[   11.655246] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

/ # ls
dev   proc  sys   etc   usr   bin   tmp   sbin  mnt   init
/ # tftp -gr uImage 10.0.2.2
[   40.780983] random: nonblocking pool is initialized
/ # ls
dev     sys     usr     tmp     mnt     uImage
proc    etc     bin     sbin    init
/ #    


Subbaraya Sundeep (3):
  hw/net: Add Smartfusion2 emac block
  msf2: Add EMAC block to SmartFusion2 SoC
  tests/boot_linux_console: Add ethernet test to SmartFusion2

 MAINTAINERS                            |   2 +
 hw/arm/msf2-soc.c                      |  26 +-
 hw/net/Makefile.objs                   |   1 +
 hw/net/msf2-emac.c                     | 566 +++++++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h              |   2 +
 include/hw/net/msf2-emac.h             |  53 +++
 tests/acceptance/boot_linux_console.py |  15 +-
 7 files changed, 658 insertions(+), 7 deletions(-)
 create mode 100644 hw/net/msf2-emac.c
 create mode 100644 include/hw/net/msf2-emac.h

-- 
2.7.4

