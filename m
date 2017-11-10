Received: by 10.223.150.237 with SMTP id u100csp3629063wrb;
        Fri, 10 Nov 2017 03:14:37 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QmadxfvoJQa1FyUUmifq1tVj7wbAYqmMFHQCx14TZO+973KYZ7Mk3GSr3a2yZrLmS63K4y
X-Received: by 10.159.204.139 with SMTP id t11mr3956338plo.121.1510312477532;
        Fri, 10 Nov 2017 03:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312477; cv=none;
        d=google.com; s=arc-20160816;
        b=lWGRdRBu9J7esz7vtWViiMu/5o4Cqqz7cCJeNFD8OAhDcjRykGVS6itQVsHegMvpcH
         kzEXJRqHQ5HlRFb158Xw6ciQk2o4i3bsIMTzpWBLnopjJ40+8+MPLiMK6WkBff+bqu2W
         vgQPmk2Ed61xx1hI+LChfn2iaXXKCd+gLHsaC/Ggy9zhw8xMn0/FiRlpcWYpFtxLn29z
         9dflefecpFO0PNsCHJ6KLf17e/s1vwD2qLp+dfKluEtBe6b8CCPEB3q72THWxm3R6jeD
         ArkYRPzuzAmEWcRRn1muLgm4A7qrrOlNw+HduWI6hP3AATmMcRtYISG4VvroTicPb/ey
         Aa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:message-id:date:subject:to
         :from:arc-authentication-results;
        bh=QZFTc+gmcZFMEFCPLV0vppMRQyg03D+fJD6nmVUrFAc=;
        b=Tj33mvYuF2o3gUj1zIyJwu80vBE69XfWW9Ya94kdqkMUgCBhasqko9JcbdAaVNs15J
         /+RT8zkO1ZvikiuR81BDOXquwTvtKrVKU4fRNlIj41KAg00n02mMw13F1OffL143gobf
         T/yMg6soXO/laNgo4iZ/7KNPk/gai4dY77VLGMXzALUMD8e1OeSJ4IfBJBuctRBzQ76M
         8tAx8ad/QHZ7ieb7nOh99jSHwSuaXRuW9HJtEOhXWDinTGEvH8hgTt8JC5Kk295eCly+
         7pUxL33BfpoRPD1cNeDl4FMeT/hn0rRjnCEJoucIajGqkoYCka+rYttmOvfvYNSPwRxH
         saig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.37;
        Fri, 10 Nov 2017 03:14:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753028AbdKJLOg (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10439 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752844AbdKJLOc (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:32 -0500
Received: from 172.30.72.58 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKO46198;
        Fri, 10 Nov 2017 19:14:11 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:13:58 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v12 00/12] Add RAS virtualization support in QEMU
Date:   Sat, 11 Nov 2017 03:19:39 +0800
Message-ID: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.5A058A05.0101,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8f5e33848b9ab8cecb45ea266e70717c
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WTqkDkYTm9kS

In the ARMv8 platform, the CPU error type are synchronous external
abort(SEA) and SError Interrupt (SEI). If guest happen exception, 
sometimes  guest itself do the recovery is better, because host 
does not know guest's detailed info. For example, if a guest
user-space application happen exception, guest can kill this 
application, but host can not do that.

For the ARMv8 SEA/SEI, KVM or host kernel will deliver SIGBUS or
use other interface to notify user space. After user space gets 
the notification, it will record the CPER to guest GHES buffer
for guest and inject a exception or IRQ to KVM.

In the current implement, if the SIGBUS is BUS_MCEERR_AR, we will
treat it as synchronous exception, and use ARMv8 SEA notification type
to notify guest after recording CPER for guest; If the SIGBUS is
BUS_MCEERR_AO, we will use treat it as asynchronous exception, and
use GPIO-Signal to notify guest after recording CPER for guest.

If KVM wants userspace to do the recovery for the SError, it will return a error
status to Qemu. Then Qemu will specify the guest ESR value and inject a virtual
SError.

This series patches have three parts:
1. Generate APEI/GHES table and record CPER for guest in runtime.
2. Handle the SIGBUS signal, record the CPER and fill into guest memory,
   then according to SIGBUS type(BUS_MCEERR_AR or BUS_MCEERR_AO), using
   different ACPI notification type to notify guest.
3. Specify guest SError ESR value and inject a virtual SError 


About the whole solution we ever discussed here before:
https://lkml.org/lkml/2017/2/27/246
https://patchwork.kernel.org/patch/9633105/
https://patchwork.kernel.org/patch/9925227/


---
1. How to test ACPI table.
Note: the UEFI(QEMU_EFI.fd) is needed if guest want to use ACPI table.

After guest boot up, dump the APEI table, you can see whether the table is right.
(1) # iasl -p ./HEST -d /sys/firmware/acpi/tables/HEST
(2) # cat HEST.dsl
    /*
     * Intel ACPI Component Architecture
     * AML/ASL+ Disassembler version 20170728 (64-bit version)
     * Copyright (c) 2000 - 2017 Intel Corporation
     *
     * Disassembly of /sys/firmware/acpi/tables/HEST, Mon Sep  5 07:59:17 2016
     *
     * ACPI Data Table [HEST]
     *
     * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
     */

    ..................................................................................
    [308h 0776   2]                Subtable Type : 000A [Generic Hardware Error Source V2]
    [30Ah 0778   2]                    Source Id : 0008
    [30Ch 0780   2]            Related Source Id : FFFF
    [30Eh 0782   1]                     Reserved : 00
    [30Fh 0783   1]                      Enabled : 01
    [310h 0784   4]       Records To Preallocate : 00000001
    [314h 0788   4]      Max Sections Per Record : 00000001
    [318h 0792   4]          Max Raw Data Length : 00001000

    [31Ch 0796  12]         Error Status Address : [Generic Address Structure]
    [31Ch 0796   1]                     Space ID : 00 [SystemMemory]
    [31Dh 0797   1]                    Bit Width : 40
    [31Eh 0798   1]                   Bit Offset : 00
    [31Fh 0799   1]         Encoded Access Width : 04 [QWord Access:64]
    [320h 0800   8]                      Address : 00000000785D0040

    [328h 0808  28]                       Notify : [Hardware Error Notification Structure]
    [328h 0808   1]                  Notify Type : 08 [SEA]
    [329h 0809   1]                Notify Length : 1C
    [32Ah 0810   2]   Configuration Write Enable : 0000
    [32Ch 0812   4]                 PollInterval : 00000000
    [330h 0816   4]                       Vector : 00000000
    [334h 0820   4]      Polling Threshold Value : 00000000
    [338h 0824   4]     Polling Threshold Window : 00000000
    [33Ch 0828   4]        Error Threshold Value : 00000000
    [340h 0832   4]       Error Threshold Window : 00000000

    [344h 0836   4]    Error Status Block Length : 00001000
    [348h 0840  12]            Read Ack Register : [Generic Address Structure]
    [348h 0840   1]                     Space ID : 00 [SystemMemory]
    [349h 0841   1]                    Bit Width : 40
    [34Ah 0842   1]                   Bit Offset : 00
    [34Bh 0843   1]         Encoded Access Width : 04 [QWord Access:64]
    [34Ch 0844   8]                      Address : 00000000785D0098

    [354h 0852   8]            Read Ack Preserve : 00000000FFFFFFFE
    [35Ch 0860   8]               Read Ack Write : 0000000000000001

    [364h 0868   2]                Subtable Type : 000A [Generic Hardware Error Source V2]
    [366h 0870   2]                    Source Id : 0009
    [368h 0872   2]            Related Source Id : FFFF
    [36Ah 0874   1]                     Reserved : 00
    [36Bh 0875   1]                      Enabled : 01
    [36Ch 0876   4]       Records To Preallocate : 00000001
    [370h 0880   4]      Max Sections Per Record : 00000001
    [374h 0884   4]          Max Raw Data Length : 00001000

    [378h 0888  12]         Error Status Address : [Generic Address Structure]
    [378h 0888   1]                     Space ID : 00 [SystemMemory]
    [379h 0889   1]                    Bit Width : 40
    [37Ah 0890   1]                   Bit Offset : 00
    [37Bh 0891   1]         Encoded Access Width : 04 [QWord Access:64]
    [37Ch 0892   8]                      Address : 00000000785D0048

    [384h 0900  28]                       Notify : [Hardware Error Notification Structure]
    [384h 0900   1]                  Notify Type : 09 [SEI]
    [385h 0901   1]                Notify Length : 1C
    [386h 0902   2]   Configuration Write Enable : 0000
    [388h 0904   4]                 PollInterval : 00000000
    [38Ch 0908   4]                       Vector : 00000000
    [390h 0912   4]      Polling Threshold Value : 00000000
    [394h 0916   4]     Polling Threshold Window : 00000000
    [398h 0920   4]        Error Threshold Value : 00000000
    [39Ch 0924   4]       Error Threshold Window : 00000000

    [3A0h 0928   4]    Error Status Block Length : 00001000
    [3A4h 0932  12]            Read Ack Register : [Generic Address Structure]
    [3A4h 0932   1]                     Space ID : 00 [SystemMemory]
    [3A5h 0933   1]                    Bit Width : 40
    [3A6h 0934   1]                   Bit Offset : 00
    [3A7h 0935   1]         Encoded Access Width : 04 [QWord Access:64]
    [3A8h 0936   8]                      Address : 00000000785D00A0

    [3B0h 0944   8]            Read Ack Preserve : 00000000FFFFFFFE
    [3B8h 0952   8]               Read Ack Write : 0000000000000001
    .....................................................................................

(3) After a synchronous external abort(SEA) happen, Qemu receive a SIGBUS and 
    filled the CPER into guest GHES memory.  According to above table,
    the address that contains the physical address of a block of memory that holds
    the error status data for this abort is 0x00000000785D0040
(4) the address for SEA notification error source is 0x785d80b0
    (qemu) xp /1 0x00000000785D0040
    00000000785d0040: 0x785d80b0

(5) check the content of generic error status block and generic error data entry
    (qemu) xp /100x 0x785d80b0
    00000000785d80b0: 0x00000001 0x00000000 0x00000000 0x00000098
    00000000785d80c0: 0x00000000 0xa5bc1114 0x4ede6f64 0x833e63b8
    00000000785d80d0: 0xb1837ced 0x00000000 0x00000300 0x00000050
    00000000785d80e0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d80f0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8100: 0x00000000 0x00000000 0x00000000 0x00004002
    00000000785d8110: 0x00000000 0x00000000 0x00000000 0x00001111
    00000000785d8120: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8130: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8140: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8150: 0x00000000 0x00000003 0x00000000 0x00000000
    00000000785d8160: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8170: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8180: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8190: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d81a0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d81b0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d81c0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d81d0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d81e0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d81f0: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8200: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8210: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8220: 0x00000000 0x00000000 0x00000000 0x00000000
    00000000785d8230: 0x00000000 0x00000000 0x00000000 0x00000000
(6) check the OSPM's ACK value(for example SEA)
    /* Before OSPM acknowledges the error, check the ACK value */
    (qemu) xp /1 0x00000000785D0098
    00000000785d00f0: 0x00000000

    /* After OSPM acknowledges the error, check the ACK value, it change to 1 from 0 */
    (qemu) xp /1 0x00000000785D0098
    00000000785d00f0: 0x00000001


2. How to test the BUS_MCEERR_AR and BUS_MCEERR_AO SIGBUS handling
In the KVM or kernel, deliver SIGBUS. 
(1) If the SIBGUS is BUS_MCEERR_AR, we can see below abort which is
injected by QEMU to notify guest.

Unhandled fault: synchronous external abort (0x92000410) at 0x0000007fa234c12c
CPU: 0 PID: 536 Comm: devmem Not tainted 4.1.0+ #20
Hardware name: linux,dummy-virt (DT)
task: ffffffc019ab2b00 ti: ffffffc008134000 task.ti: ffffffc008134000
PC is at 0x40cf04
LR is at 0x40cdec
pc : [<000000000040cf04>] lr : [<000000000040cdec>] pstate: 60000000
sp : 0000007ff7b24130
x29: 0000007ff7b24260 x28: 0000000000000000
x27: 00000000000000ad x26: 000000000049c000
x25: 000000000048904b x24: 000000000049c000
x23: 0000000040600000 x22: 0000007ff7b243a0
x21: 0000000000000002 x20: 0000000000000000
x19: 0000000000000020 x18: 0000000000000000
x17: 000000000049c6d0 x16: 0000007fa22c85c0
x15: 0000000000005798 x14: 0000007fa2205f1c
x13: 0000007fa241ccb0 x12: 0000000000000137
x11: 0000000000000000 x10: 0000000000000000
x9 : 0000000000000000 x8 : 00000000000000de
x7 : 0000000000000000 x6 : 0000000000002000
x5 : 0000000040600000 x4 : 0000000000000003
x3 : 0000000000000001 x2 : 0000000000000000
x1 : 0000000000000000 x0 : 0000007fa2418000

(2) If the SIBGUS is BUS_MCEERR_AO, QEMU will generate an IRQ to notify guest kernel  APEI 
driver to do recovery.
[  504.164899] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 7
[  504.166970] {1}[Hardware Error]: event severity: recoverable
[  504.251650] {1}[Hardware Error]:  Error 0, type: recoverable
[  504.252974] {1}[Hardware Error]:   section_type: memory error
[  504.254380] {1}[Hardware Error]:   physical_address: 0x00000000000003ec
[  504.255879] {1}[Hardware Error]:   error_type: 3, multi-bit ECC


3. How to test Qemu set guest ESR and inject virtual SError

In the KVM,  return Error status to Qemu, Qemu will set the guest ESR and inject virtual SError.
As shown below, the ESR value 0xbe000c11 is set by Qemu

Bad mode in Error handler detected, code 0xbe000c11 -- SError
CPU: 0 PID: 539 Comm: devmem Tainted: G      D         4.1.0+ #20
Hardware name: linux,dummy-virt (DT)
task: ffffffc019aad600 ti: ffffffc008134000 task.ti: ffffffc008134000
PC is at 0x405cc0
LR is at 0x40ce80
pc : [<0000000000405cc0>] lr : [<000000000040ce80>] pstate: 60000000
sp : ffffffc008137ff0
x29: 0000007fd9e80790 x28: 0000000000000000
x27: 00000000000000ad x26: 000000000049c000
x25: 000000000048904b x24: 000000000049c000
x23: 0000000040600000 x22: 0000007fd9e808d0
x21: 0000000000000002 x20: 0000000000000000
x19: 0000000000000020 x18: 0000000000000000
x17: 0000000000405cc0 x16: 000000000049c698
x15: 0000000000005798 x14: 0000007f93875f1c
x13: 0000007f93a8ccb0 x12: 0000000000000137
x11: 0000000000000000 x10: 0000000000000000
x9 : 0000000000000000 x8 : 00000000000000de
x7 : 0000000000000000 x6 : 0000000000002000
x5 : 0000000040600000 x4 : 0000000000000003
x3 : 0000000000000001 x2 : 00000000000f123b
x1 : 0000000000000008 x0 : 000000000047a048


Dongjiu Geng (12):
  ACPI: add related GHES structures and macros definition
  ACPI: Add APEI GHES table generation and CPER record support
  docs: APEI GHES generation description
  ACPI: enable APEI GHES in the configure file and build it
  linux-headers: sync against Linux v4.14-rc8
  target-arm: kvm64: detect whether can set vsesr_el2
  target-arm: handle SError interrupt exception from the guest OS
  target-arm: kvm64: inject synchronous External Abort
  Move related hwpoison page function to accel/kvm/ folder
  ARM: ACPI: Add _E04 for hardware error device
  hw/arm/virt: Add RAS platform version for migration
  target-arm: kvm64: handle SIGBUS signal from kernel or KVM

 accel/kvm/kvm-all.c                                |  29 ++
 default-configs/arm-softmmu.mak                    |   1 +
 docs/specs/acpi_hest_ghes.txt                      |  98 ++++++
 hw/acpi/Makefile.objs                              |   1 +
 hw/acpi/aml-build.c                                |   2 +
 hw/acpi/hest_ghes.c                                | 360 +++++++++++++++++++++
 hw/arm/virt-acpi-build.c                           |  43 ++-
 hw/arm/virt.c                                      |  22 ++
 include/exec/ram_addr.h                            |  10 +
 include/hw/acpi/acpi-defs.h                        |  49 +++
 include/hw/acpi/aml-build.h                        |   1 +
 include/hw/acpi/hest_ghes.h                        |  84 +++++
 include/hw/arm/virt.h                              |   1 +
 include/standard-headers/asm-s390/kvm_virtio.h     |   1 +
 include/standard-headers/asm-s390/virtio-ccw.h     |   1 +
 include/standard-headers/asm-x86/hyperv.h          |   1 +
 include/standard-headers/linux/input-event-codes.h |   1 +
 include/standard-headers/linux/input.h             |   1 +
 include/standard-headers/linux/pci_regs.h          |   1 +
 include/sysemu/kvm.h                               |   2 +-
 include/sysemu/sysemu.h                            |   3 +
 linux-headers/asm-arm/kvm.h                        |   1 +
 linux-headers/asm-arm/kvm_para.h                   |   1 +
 linux-headers/asm-arm/unistd.h                     |   1 +
 linux-headers/asm-arm64/kvm.h                      |   1 +
 linux-headers/asm-arm64/unistd.h                   |   1 +
 linux-headers/asm-powerpc/epapr_hcalls.h           |   1 +
 linux-headers/asm-powerpc/kvm.h                    |   1 +
 linux-headers/asm-powerpc/kvm_para.h               |   1 +
 linux-headers/asm-powerpc/unistd.h                 |   1 +
 linux-headers/asm-s390/kvm.h                       |   1 +
 linux-headers/asm-s390/kvm_para.h                  |   1 +
 linux-headers/asm-s390/unistd.h                    |   1 +
 linux-headers/asm-x86/kvm.h                        |   1 +
 linux-headers/asm-x86/kvm_para.h                   |   1 +
 linux-headers/asm-x86/unistd.h                     |   1 +
 linux-headers/linux/kvm.h                          |   4 +
 linux-headers/linux/kvm_para.h                     |   1 +
 linux-headers/linux/psci.h                         |   1 +
 linux-headers/linux/userfaultfd.h                  |   1 +
 linux-headers/linux/vfio.h                         |   1 +
 linux-headers/linux/vfio_ccw.h                     |   1 +
 linux-headers/linux/vhost.h                        |   1 +
 target/arm/internals.h                             |   4 +
 target/arm/kvm.c                                   |   5 +
 target/arm/kvm32.c                                 |   6 +
 target/arm/kvm64.c                                 | 138 ++++++++
 target/arm/kvm_arm.h                               |   8 +
 target/i386/kvm.c                                  |  33 --
 vl.c                                               |  12 +
 50 files changed, 908 insertions(+), 35 deletions(-)
 create mode 100644 docs/specs/acpi_hest_ghes.txt
 create mode 100644 hw/acpi/hest_ghes.c
 create mode 100644 include/hw/acpi/hest_ghes.h

-- 
1.8.3.1
