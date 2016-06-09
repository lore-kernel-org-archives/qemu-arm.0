Received: by 10.25.27.66 with SMTP id b63csp384783lfb;
        Thu, 9 Jun 2016 08:37:36 -0700 (PDT)
X-Received: by 10.202.186.132 with SMTP id k126mr5189248oif.113.1465486656031;
        Thu, 09 Jun 2016 08:37:36 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com. [2607:f8b0:4001:c06::244])
        by mx.google.com with ESMTPS id x10si3302193oif.175.2016.06.09.08.37.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2016 08:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4001:c06::244 as permitted sender) client-ip=2607:f8b0:4001:c06::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4001:c06::244 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-io0-x244.google.com with SMTP id 5so5540259ioy.0;
        Thu, 09 Jun 2016 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:from:date:message-id:subject:to:cc;
        bh=oVQMbBWFkQyPIssKaCHiDqXQDX0+1i7WYYWCEHcIpTA=;
        b=KZaQk4yTU4DGzfzz+TxKIUjsC+nEH7W3WHGMc3aPLk5+p583iH1SrM3tek1GRlnUyB
         NQ5G3/4siIza5quSIbNcrywc4e9t2Mi+nUPqT02VstZRFeT2w4IO9BaM3Iwv+G/5dne3
         xtN02DnhBGN4rmcSsRxN1tPEjEksNFOpIQ9NLHa1qfu4CRrNxlUgM9+6MlHeNV64Z9g4
         /cK9nwn9M0ojMnfGMr/Jh7f6LqKEuvz8zpLiYwP7bBk9rrCaElomFcu2RKw2eQESqDBq
         wv5zTHoSOvSYNDRmZWk4NDi3htvhfkSEWI0Li+E5/xP4vdtu/PKmYWk8mX4+H42RPsrB
         NMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:cc;
        bh=oVQMbBWFkQyPIssKaCHiDqXQDX0+1i7WYYWCEHcIpTA=;
        b=Tyo5BKqyVRr2shW1uRvDzV/znBA/9kc2akr7JHfyr+g8xWiKdyC+0bB0eJV7oWmx8W
         K7aZLVxXrxp5ZkkEqN6lDy9Ox5a9rNRAE1ZLdAL/oWla2ThdttW7Ex6wFkVeOsc4GTBA
         tq+opeByIKIpEPmniyQp1pKsyBPfP69aI2B/naTWxPGO/Y8rk35hi02mXSdNyfZZh7mB
         qs7zX9VEy/n+qweaXO1oZo+utMA84ZnkiyWgT4/Hy4OADEhC0d+e0If1jAanw0AVTnIU
         n5bDbdNe1dfsPuzytL03uoB7SWofR5j1+uAGGA4ZDW7DB/mspdr2IvzTZPEcBkIwh/lA
         kSXw==
X-Gm-Message-State: ALyK8tL8UdTlBGzlkuys6/LG8Wq6bssXJyNk+Jq65gnR2WOYL9a8AEYhsRWmM0F6ri3xb6qspw2Fq7DMp705ag==
X-Received: by 10.107.20.79 with SMTP id 76mr17984537iou.155.1465486655477;
 Thu, 09 Jun 2016 08:37:35 -0700 (PDT)
MIME-Version: 1.0
Sender: bobby.prani@gmail.com
Received: by 10.107.62.4 with HTTP; Thu, 9 Jun 2016 08:37:06 -0700 (PDT)
From: Pranith Kumar <bobby.prani+qemu@gmail.com>
Date: Thu, 9 Jun 2016 11:37:06 -0400
X-Google-Sender-Auth: _JBrbPsLwkq7NllC1hsSjB2q4Ig
Message-ID: <CAJhHMCDgKZAuJ6Dg0Ee_ebkB=BbLXaFSS+7HgCT42ueFLo+KPQ@mail.gmail.com>
Subject: Introduces a regression (was: target-arm: Avoid unnecessary TLB flush
 on TCR_EL2, TCR_EL3 writes)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:ARM" <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, patches@linaro.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: oqN/YHIQdCIu

Hi Peter,

On Tue, May 10, 2016 at 6:11 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The TCR_EL2 and TCR_EL3 regdefs wer incorrectly using the
> vmsa_tcr_el1_write function for writes. Since these registers don't
> have the A1 bit that TCR_EL1 does, we don't need to do a tlb_flush()
> when they are written. Remove the unnecessary .writefn and also the
> harmless but unneeded .raw_writefn and .resetfn definitions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

This commit is causing a regression where a vexpress-a9 guest refuses
to boot. The guest boots fine with this commit reverted.

Here is the log:

$ qemu-system-arm -M vexpress-a9 -m 1024M -kernel
after-copy/vmlinuz-3.2.0-4-vexpress -initrd
after-copy/initrd.img-3.2.0-4-vexpress -sd armdisk.img -append
"root=/dev/mmcblk0p2 console=tty0" -smp 4 -redir tcp:2222::22 -d
int,in_asm
qemu-system-arm: -redir tcp:2222::22: The -redir option is deprecated.
Please use '-netdev user,hostfwd=...' instead.
WARNING: Image format was not specified for 'armdisk.img' and probing
guessed raw.
         Automatically detecting the format is dangerous for raw
images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
audio: Could not init `oss' audio driver
----------------
IN:
0x60000000:  e3a00000      mov    r0, #0    ; 0x0
0x60000004:  e59f1004      ldr    r1, [pc, #4]    ; 0x60000010
0x60000008:  e59f2004      ldr    r2, [pc, #4]    ; 0x60000014
0x6000000c:  e59ff004      ldr    pc, [pc, #4]    ; 0x60000018

----------------
IN:
0x60010000:  e1a00000      nop            (mov r0,r0)
0x60010004:  e1a00000      nop            (mov r0,r0)
0x60010008:  e1a00000      nop            (mov r0,r0)
0x6001000c:  e1a00000      nop            (mov r0,r0)
0x60010010:  e1a00000      nop            (mov r0,r0)
0x60010014:  e1a00000      nop            (mov r0,r0)
0x60010018:  e1a00000      nop            (mov r0,r0)
0x6001001c:  e1a00000      nop            (mov r0,r0)
0x60010020:  ea000002      b    0x60010030

----------------
IN:
0x60010030:  e1a07001      mov    r7, r1
0x60010034:  e1a08002      mov    r8, r2
0x60010038:  e10f2000      mrs    r2, CPSR
0x6001003c:  e3120003      tst    r2, #3    ; 0x3
0x60010040:  1a000001      bne    0x6001004c

----------------
IN:
0x6001004c:  e10f2000      mrs    r2, CPSR
0x60010050:  e38220c0      orr    r2, r2, #192    ; 0xc0
0x60010054:  e121f002      msr    CPSR_c, r2

----------------
IN:
0x60010058:  00000000      andeq    r0, r0, r0
0x6001005c:  00000000      andeq    r0, r0, r0
0x60010060:  e59f4784      ldr    r4, [pc, #1924]    ; 0x600107ec
0x60010064:  eb000055      bl    0x600101c0

----------------
IN:
0x600101c0:  e3a03008      mov    r3, #8    ; 0x8
0x600101c4:  ea000080      b    0x600103cc

----------------
IN:
0x600103cc:  e28fc01c      add    ip, pc, #28    ; 0x1c
0x600103d0:  ee109f10      mrc    15, 0, r9, cr0, cr0, {0}
0x600103d4:  e59c1000      ldr    r1, [ip]
0x600103d8:  e59c2004      ldr    r2, [ip, #4]
0x600103dc:  e0211009      eor    r1, r1, r9
0x600103e0:  e1110002      tst    r1, r2
0x600103e4:  008cf003      addeq    pc, ip, r3

----------------
IN:
0x600103e8:  e28cc014      add    ip, ip, #20    ; 0x14
0x600103ec:  eafffff8      b    0x600103d4

----------------
IN:
0x600103d4:  e59c1000      ldr    r1, [ip]
0x600103d8:  e59c2004      ldr    r2, [ip, #4]
0x600103dc:  e0211009      eor    r1, r1, r9
0x600103e0:  e1110002      tst    r1, r2
0x600103e4:  008cf003      addeq    pc, ip, r3

----------------
IN:
0x60010560:  eaffff65      b    0x600102fc

----------------
IN:
0x600102fc:  e1a0c00e      mov    ip, lr
0x60010300:  ee10bf91      mrc    15, 0, fp, cr0, cr1, {4}
0x60010304:  e31b000f      tst    fp, #15    ; 0xf
0x60010308:  1bffffd3      blne    0x6001025c

----------------
IN:
0x6001025c:  e2443901      sub    r3, r4, #16384    ; 0x4000
0x60010260:  e3c330ff      bic    r3, r3, #255    ; 0xff
0x60010264:  e3c33c3f      bic    r3, r3, #16128    ; 0x3f00
0x60010268:  e1a00003      mov    r0, r3
0x6001026c:  e1a09920      lsr    r9, r0, #18
0x60010270:  e1a09909      lsl    r9, r9, #18
0x60010274:  e289a201      add    sl, r9, #268435456    ; 0x10000000
0x60010278:  e3a01012      mov    r1, #18    ; 0x12
0x6001027c:  e3811b03      orr    r1, r1, #3072    ; 0xc00
0x60010280:  e2832901      add    r2, r3, #16384    ; 0x4000
0x60010284:  e1510009      cmp    r1, r9
0x60010288:  2381100c      orrcs    r1, r1, #12    ; 0xc
0x6001028c:  e151000a      cmp    r1, sl
0x60010290:  23c1100c      biccs    r1, r1, #12    ; 0xc
0x60010294:  e4801004      str    r1, [r0], #4
0x60010298:  e2811601      add    r1, r1, #1048576    ; 0x100000
0x6001029c:  e1300002      teq    r0, r2
0x600102a0:  1afffff7      bne    0x60010284

----------------
IN:
0x60010284:  e1510009      cmp    r1, r9
0x60010288:  2381100c      orrcs    r1, r1, #12    ; 0xc
0x6001028c:  e151000a      cmp    r1, sl
0x60010290:  23c1100c      biccs    r1, r1, #12    ; 0xc
0x60010294:  e4801004      str    r1, [r0], #4
0x60010298:  e2811601      add    r1, r1, #1048576    ; 0x100000
0x6001029c:  e1300002      teq    r0, r2
0x600102a0:  1afffff7      bne    0x60010284

----------------
IN:
0x600102a4:  e3a0101e      mov    r1, #30    ; 0x1e
0x600102a8:  e3811b03      orr    r1, r1, #3072    ; 0xc00
0x600102ac:  e1a0200f      mov    r2, pc
0x600102b0:  e1a02a22      lsr    r2, r2, #20
0x600102b4:  e1811a02      orr    r1, r1, r2, lsl #20
0x600102b8:  e0830102      add    r0, r3, r2, lsl #2
0x600102bc:  e4801004      str    r1, [r0], #4
0x600102c0:  e2811601      add    r1, r1, #1048576    ; 0x100000
0x600102c4:  e5801000      str    r1, [r0]
0x600102c8:  e1a0f00e      mov    pc, lr

----------------
IN:
0x6001030c:  e3a00000      mov    r0, #0    ; 0x0
0x60010310:  ee070f9a      mcr    15, 0, r0, cr7, cr10, {4}
0x60010314:  e31b000f      tst    fp, #15    ; 0xf
0x60010318:  1e080f17      mcrne    15, 0, r0, cr8, cr7, {0}

----------------
IN:
0x6001031c:  ee110f10      mrc    15, 0, r0, cr1, cr0, {0}
0x60010320:  e3c00201      bic    r0, r0, #268435456    ; 0x10000000
0x60010324:  e3800a05      orr    r0, r0, #20480    ; 0x5000
0x60010328:  e380003c      orr    r0, r0, #60    ; 0x3c
0x6001032c:  13800001      orrne    r0, r0, #1    ; 0x1
0x60010330:  13e01000      mvnne    r1, #0    ; 0x0
0x60010334:  1e023f10      mcrne    15, 0, r3, cr2, cr0, {0}

----------------
IN:
0x60010338:  1e031f10      mcrne    15, 0, r1, cr3, cr0, {0}

----------------
IN:
0x6001033c:  ee010f10      mcr    15, 0, r0, cr1, cr0, {0}

----------------
IN:
0x48000000:  e59f2028      ldr    r2, [pc, #40]    ; 0x48000030
0x48000004:  e59f0028      ldr    r0, [pc, #40]    ; 0x48000034
0x48000008:  e3a01001      mov    r1, #1    ; 0x1
0x4800000c:  e5821000      str    r1, [r2]
0x48000010:  e3a010ff      mov    r1, #255    ; 0xff
0x48000014:  e5821004      str    r1, [r2, #4]
0x48000018:  f57ff04f      dsb    sy
0x4800001c:  e320f003      wfi

Taking exception 3 [Prefetch Abort]
...from EL3 to EL3
...with ESR 21/0x84000005
...with IFSR 0x5 IFAR 0x60010340
Taking exception 3 [Prefetch Abort]
...from EL3 to EL3
...with ESR 21/0x84000005
...with IFSR 0x5 IFAR 0xc
Taking exception 3 [Prefetch Abort]
...from EL3 to EL3
...with ESR 21/0x84000005
...with IFSR 0x5 IFAR 0xc
Taking exception 3 [Prefetch Abort]
...from EL3 to EL3
...with ESR 21/0x84000005
...with IFSR 0x5 IFAR 0xc

<continues>

> ---
> v1->v2 changes: extend to TCR_EL3 as suggested by Sergey.
>
>  target-arm/helper.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 09638b2..cbb9d92 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3559,8 +3559,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .resetvalue = 0 },
>      { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
> -      .access = PL2_RW, .writefn = vmsa_tcr_el1_write,
> -      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
> +      .access = PL2_RW,
> +      /* no .writefn needed as this can't cause an ASID change;
> +       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       */
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
>      { .name = "VTCR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
> @@ -3753,8 +3755,10 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[3]) },
>      { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
> -      .access = PL3_RW, .writefn = vmsa_tcr_el1_write,
> -      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
> +      .access = PL3_RW,
> +      /* no .writefn needed as this can't cause an ASID change;
> +       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       */
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
>      { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS,
> --
> 1.9.1
>
>
