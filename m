Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp777914lfb;
        Wed, 18 Nov 2020 10:55:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLdBlI9CtS051qYc/l05vdpmEM8/n6dz+r62SV6gdyHzZBr28E/qZ8pkAOoPjYqpCniTos
X-Received: by 2002:a25:1002:: with SMTP id 2mr4932278ybq.65.1605725724284;
        Wed, 18 Nov 2020 10:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605725724; cv=none;
        d=google.com; s=arc-20160816;
        b=XpXaTL3dPmka6H8pZPVfVUvBxwdSAzwT3+MUkRropSwFsFUniRtQejNoe8zGp0OWQd
         TOf9uJyFO04eYMQPSSn2LQb+lQYkm/PpX3um4SJmibQUQA/jFKSy9FTGnanZxbQIWpF4
         fAB8r/PPdgEvt+WbZnwe3pzofYuPqOpojpEg8OykadfynUcJDVEgPRSRsf8CZuB3jC06
         c3wgjUIIvktOBXz0In9H/q25ockYHgSxKy1tSD4Hat/CL0R5l0K+Di7MnTKSM6l5PCyw
         qL72oGvquyOwY+nF1s85r9Zt9W2bEBaGqx9qu4CrkCmnH7bSDDDsXhZYO3O3kC0IfkuY
         NQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=6IhYoBI3AgtKVJEuu260NXFbpgyvWfNx+vUTNBdCIz0=;
        b=lRdEkY1XBfy2M1fQzbt4dtszLsKmnqMGaR9my2v6Bgqr8bvZf+q6AC0pvumokgGXsY
         FeEoVpP2OYX+o8aYN2r2yCPD/NrAY/6Cq5U8AhKQHAeVC5njERaUSxNbYCP/kIh/26Td
         CZDXC+vTKdxA1jBxSbyxeAvpZ8scvn4g7eSwo/Ap+EY34gSz+cpUb7R55QBxx8gGoa7K
         f1p38iX+RdKEMFGFDwWeW6aD5SNgOH5lEUM1W/ZSy7oBBb7cKETFVWrvBlGwXhdUJXqZ
         1iCpV/h/bPzeHv1wIYC8jqPqT4yrMTn6J1pNcynuJAbo3BGTYsfv3jS4lQo0p2ZBLLbZ
         v0QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bXWmv06m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g67si17271281ybg.215.2020.11.18.10.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Nov 2020 10:55:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bXWmv06m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfSbz-0002KF-FB
	for alex.bennee@linaro.org; Wed, 18 Nov 2020 13:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwkozaczuk@gmail.com>)
 id 1kfRWr-0001CI-1d
 for qemu-arm@nongnu.org; Wed, 18 Nov 2020 12:46:01 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:34871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jwkozaczuk@gmail.com>)
 id 1kfRWn-0005fv-JN
 for qemu-arm@nongnu.org; Wed, 18 Nov 2020 12:46:00 -0500
Received: by mail-lf1-x131.google.com with SMTP id a9so4215764lfh.2
 for <qemu-arm@nongnu.org>; Wed, 18 Nov 2020 09:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6IhYoBI3AgtKVJEuu260NXFbpgyvWfNx+vUTNBdCIz0=;
 b=bXWmv06mlT4rkTgkUBf3dto6Z3nZcbDt/PGN9hbwWjGGiiKhkGvqtPu8uzGD34S8vY
 ymvBzfqjFEf+gWudAHzzw7pdpnUGjym/OnwSoTgZeNthjuf2isgG4edZWjLRUHVF0M8B
 IxFPgULixsiuVNiLIEIcqmA09x2XvdJXpGatuZfX6wVrlVRj5vz+LKXg+OMBNRyTNXDv
 bv6oC7ACF0zZ55Y6O4YwxMOEWJp0LiB1+UylR9mAGWoHeWRZ37mmo9ax7LyoiLzy1gZF
 o5a/cVtqRByobk5nDTcRovRtGnPCoFSTe542iJnYTctlmeup/j//1zSBB+WZxmRwad6M
 mMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6IhYoBI3AgtKVJEuu260NXFbpgyvWfNx+vUTNBdCIz0=;
 b=HBxQ/O2V7YQhWEuG9Dm3b2y+Fqg3k682r3NxZD8xAmJhkDHdKBbJJZXMeqiHi3CKyd
 h/bQL+5IGJSokEGNakYkv/2cAPhUqPohrVEebZmENO1R00l6ov7Ws1SU7jXNyhVuwLnf
 qJk/vQe0mgZVGeGY2nc7mfup05Sw6fNpKKZE2typ/qBnHDvqMLQD8xmTs7lAzF6/SXqD
 DD3HshgmQenYyvT5tqmqUL7xaEJzJh38Q7ukKZySttOchgbzNINqBysHqc7+YlT9y09D
 37N563u5gNyuShBQpea9TOp0+wmHm+LhzhhC2rdNsosQrfD2YcR9/jUYpJ0NGBM7xpFj
 qlPg==
X-Gm-Message-State: AOAM533jTR5rpab9YfWXQHVmNE8ckIiOcznxAGGbVjRkBk84grWTe7fJ
 1ol0csDdXfwgNej7kllUwVogJfH+e3KB1fr8bYU9k2qLAPI5GA==
X-Received: by 2002:a05:6512:3287:: with SMTP id
 p7mr4580554lfe.346.1605721552411; 
 Wed, 18 Nov 2020 09:45:52 -0800 (PST)
MIME-Version: 1.0
From: Waldek Kozaczuk <jwkozaczuk@gmail.com>
Date: Wed, 18 Nov 2020 12:45:39 -0500
Message-ID: <CAL9cFfPnmgvan+UvoxT-0SGNSp+hwkrQkftTkBTwPTgUGz5Exg@mail.gmail.com>
Subject: OSv guest encountering EC - "Unknown Reason" sync exception (ESR =
 0x2000000) on Raspberry PI 4B host with KVM on
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bd638905b4652ef3"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=jwkozaczuk@gmail.com; helo=mail-lf1-x131.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26, MANY_SPAN_IN_TEXT=1,
 NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Nov 2020 13:54:15 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5XKK6lSmJC+k

--000000000000bd638905b4652ef3
Content-Type: text/plain; charset="UTF-8"

Hi,

I am one of the OSv unikernel developers and I have been stuck trying to
figure out the problem described here -
https://github.com/cloudius-systems/osv/issues/1100 - for a long time now
to no avail. And I am looking for any more suggestions on how to debug it
further.

In essence, occasionally (20-30% of the time) OSv guest encounters "Unknown
Reason" (ESR_EL1 = 0x2000000) sync exception when running the same test
application (does not seem to be specific to any given application). It
seems that the longer the application runs the more frequently this
exception happens. Here is the state of the registers from the guest gdb
debug session captured when exception encountered and after saving
exception frame on the stack (sorted for convenience):

(gdb) info reg

ACTLR_EL1      0x0                 0

ACTLR_EL2      0x0                 0

ACTLR_EL3      0x0                 0

AFSR0_EL1      0x0                 0

AFSR1_EL1      0x0                 0

AIDR           0x0                 0

AMAIR0         0x0                 0

CLIDR          0x0                 0

CONTEXTIDR_EL1 0x0                 0

CPACR          0x300000            3145728

CSSELR         0x2                 2

CTR_EL0        0x0                 0

DACR32_EL2     0x1de7ec7edbadc0de  2154950976315703518

DBGBCR         0x0                 0

DBGBVR         0x0                 0

DBGWCR         0x0                 0

DBGWVR         0x0                 0

ELR_EL1        0x1000000311c0      17592186245568

ESR_EL1        0x2000000           33554432

FAR_EL1        0x1000000321b8      17592186249656

FPCR           0x0                 0

FPEXC32_EL2    0x700               1792

FPSR           0x14                20

ID_AA64AFR0_EL1 0x0                0

ID_AA64AFR1_EL1 0x0                0

ID_AA64AFR2_EL1_RESERVED 0x0       0

ID_AA64AFR3_EL1_RESERVED 0x0       0

ID_AA64DFR0_EL1 0x0                0

ID_AA64DFR1_EL1 0x0                0

ID_AA64DFR2_EL1_RESERVED 0x0       0

ID_AA64DFR3_EL1_RESERVED 0x0       0

ID_AA64ISAR0_EL1 0x10000           65536

ID_AA64ISAR1_EL1 0x0               0

ID_AA64ISAR2_EL1_RESERVED 0x0      0

ID_AA64ISAR3_EL1_RESERVED 0x0      0

ID_AA64ISAR4_EL1_RESERVED 0x0      0

ID_AA64ISAR5_EL1_RESERVED 0x0      0

ID_AA64ISAR6_EL1_RESERVED 0x0      0

ID_AA64ISAR7_EL1_RESERVED 0x0      0

ID_AA64MMFR0_EL1 0x1124            4388

ID_AA64MMFR1_EL1 0x0               0

ID_AA64MMFR2_EL1_RESERVED 0x0      0

ID_AA64MMFR3_EL1_RESERVED 0x0      0

ID_AA64MMFR4_EL1_RESERVED 0x0      0

ID_AA64MMFR5_EL1_RESERVED 0x0      0

ID_AA64MMFR6_EL1_RESERVED 0x0      0

ID_AA64MMFR7_EL1_RESERVED 0x0      0

ID_AA64PFR1_EL1 0x0                0

ID_AA64PFR2_EL1_RESERVED 0x0       0

ID_AA64PFR3_EL1_RESERVED 0x0       0

ID_AA64PFR5_EL1_RESERVED 0x0       0

ID_AA64PFR6_EL1_RESERVED 0x0       0

ID_AA64PFR7_EL1_RESERVED 0x0       0

ID_AA64ZFR0_EL1 0x0                0

ID_AFR0        0x0                 0

ID_DFR0        0x0                 0

ID_ISAR0       0x2101110           34607376

ID_ISAR1       0x13112111          319889681

ID_ISAR2       0x21232042          555950146

ID_ISAR3       0x1112131           17899825

ID_ISAR4       0x11142             69954

ID_ISAR5       0x10001             65537

ID_ISAR6       0x0                 0

ID_MMFR0       0x0                 0

ID_MMFR1       0x0                 0

ID_MMFR2       0x0                 0

ID_MMFR3       0x0                 0

ID_MMFR4       0x0                 0

ID_PFR0        0x0                 0

IFSR32_EL2     0x1de7ec7edbadc0de  2154950976315703518

MAIR_EL1       0xff440c0400        1096358298624

MAIR_EL3       0x0                 0

MDCCSR_EL0     0x0                 0

MDCR_EL3       0x0                 0

MDRAR_EL1      0x0                 0

MDSCR_EL1      0x0                 0

MVFR0_EL1      0x10110222          269550114

MVFR1_EL1      0x12111111          303108369

MVFR2_EL1      0x43                67

MVFR3_EL1_RESERVED 0x0             0

MVFR4_EL1_RESERVED 0x0             0

MVFR5_EL1_RESERVED 0x0             0

MVFR6_EL1_RESERVED 0x0             0

MVFR7_EL1_RESERVED 0x0             0

OSLSR_EL1      0xa                 10

PAR_EL1        0x1d000c7edbadc0de  2089683966090920158

PMCCFILTR_EL0  0x0                 0

PMCCNTR_EL0    0x1de7ec7edbadc0de  2154950976315703518

PMCEID0_EL0    0x20001             131073

PMCEID1_EL0    0x0                 0

PMCNTENCLR_EL0 0x5badc0c0          1538113728

PMCNTENSET_EL0 0x5badc0c0          1538113728

PMCR_EL0       0x4102302c          1090662444

PMEVCNTR0_EL0  0x1de7ec7edbadc0de  2154950976315703518

PMEVCNTR1_EL0  0x1de7ec7edbadc0de  2154950976315703518

PMEVCNTR2_EL0  0x1de7ec7edbadc0de  2154950976315703518

PMEVCNTR3_EL0  0x1de7ec7edbadc0de  2154950976315703518

PMEVTYPER0_EL0 0x1de7ec7edbadc0de  2154950976315703518

PMEVTYPER1_EL0 0x1de7ec7edbadc0de  2154950976315703518

PMEVTYPER2_EL0 0x1de7ec7edbadc0de  2154950976315703518

PMEVTYPER3_EL0 0x1de7ec7edbadc0de  2154950976315703518

PMINTENCLR_EL1 0x5badc0c0          1538113728

PMINTENSET_EL1 0x5badc0c0          1538113728

PMOVSCLR_EL0   0x1de7ec7edbadc0de  2154950976315703518

PMOVSSET_EL0   0x1de7ec7edbadc0de  2154950976315703518

PMSELR_EL0     0x1de7ec7edbadc0de  2154950976315703518

PMUSERENR_EL0  0x0                 0

REVIDR_EL1     0x0                 0

RVBAR_EL1      0x0                 0

SCTLR          0x30d0199d          818944413

SPSR_ABT       0x0                 0

SPSR_EL1       0x80000345          2147484485

SPSR_FIQ       0x0                 0

SPSR_IRQ       0x0                 0

SPSR_UND       0x0                 0

SP_EL0         0x0                 0

SP_EL1         0x200000200d60      35184374189408

TCR_EL1        0x15b5103510        93232051472

TPIDRRO_EL0    0x1de7ec7edbadc0de  2154950976315703518

TPIDR_EL0      0xffff900040f78000  -123144212348928

TPIDR_EL1      0x1de7ec7edbadc0de  2154950976315703518

TTBR0_EL1      0x407bf000          1081864192

TTBR1_EL1      0x407b5000          1081823232

VBAR           0x40207000          1075867648

cpsr           0x800003c5          -2147482683

fpcr           0x0                 0

fpsr           0x14                20

pc             0x402077a0          0x402077a0 <entry_invalid_from_sync>

sp             0x200000200d60      0x200000200d60

x0             0x1                 1

x1             0x2000000           33554432

x10            0xffffa00040ca9e00  -105552029245952

x11            0xffffa00040e1a600  -105552027736576

x12            0x100000032048      17592186249288

x13            0x1                 1

x14            0x4100000000        279172874240

x15            0x0                 0

x16            0x100000050000      17592186372096

x17            0x402b0240          1076560448

x18            0x0                 0

x19            0x200000200ed0      35184374189776

x2             0x0                 0

x20            0xffff900040f78000  -123144212348928

x21            0x1                 1

x22            0x1                 1

x23            0xffff900040a2f090  -123144217890672

x24            0x12ca90abac        80707890092

x25            0x0                 0

x26            0xffffa00040f79200  -105552026299904

x27            0xffff8000407cd739  -140736406431943

x28            0xffffa00040f79278  -105552026299784

x29            0x200000200e80      35184374189696

x3             0x0                 0

x30            0x1000000311b8      17592186245560

x4             0x1000000321e2      17592186249698

x5             0x200000200ee2      35184374189794

x6             0x76                118

x7             0x34                52

x8             0x34                52

x9             0x1                 1

OSv, being unikernel runs its kernel and application in the same memory
space at EL1.

The most difficult issue is that I do not know why we occasionally
encounter this exception. The ARMV8 documentation gives many reasons (
https://developer.arm.com/docs/ddi0595/h/aarch64-system-registers/esr_el1#ISS_exceptionswithanunknownreason)
but none of the ones I tried to investigate seems to match what I am seeing.

One of the reasons could be unallocated instruction or instruction using
not-allowed system register (like MSR, MRS) but that does not seem to be
the case. The same application seems to encounter the Uknown Reason
exception (if it does) at various places in the code and there does not
seem to be anything consistent about it, except it is always the app code
and never the kernel part (see addresses above 0x0000100000000000). Here
are some examples of instructions per ELR_EL1 (ESR_EL1 is always 0x2000000):

Address,                                   Instruction
---------------------------------------

0x0000100000031000  d63f0020        blr     x1

0x0000100000031140  f9404c01        ldr     x1, [x0, #152]

0x00001000000311c0  94000182        bl      17c8 <*ABS*@plt+0x7b8>

0x0000100000031600  b4000040        cbz     x0, 1608 <*ABS*@plt+0x5f8>

0x0000100000031640  f00000e0        adrp    x0, 20000 <*ABS*@plt+0x1eff0>

0x0000100000031200  2a1503e0        mov     w0, w21


As you can see some instructions involve memory access but some do not
(last example) and they all seem to be valid instructions.

The existing OSv sync exception handler looks like that:

121 .global entry_invalid_from_sync

122 .type entry_invalid_from_sync, @function

123 entry_invalid_from_sync:

124         mrs     x20, elr_el1       // Exception Link Register -> X20

125         mrs     x21, spsr_el1      // Saved PSTATE -> X21

126         mrs     x22, esr_el1       // Exception Syndrome Register -> X22

127

128         ubfm    x23, x22, #ESR_EC_BEG, #ESR_EC_END   // Exception Class
-> X23

129         ubfm    x24, x22, #ESR_ISS_BEG, #ESR_ISS_END //
Instruction-Specific Syndrome -> X24

130

131 1:      wfi

132         b       1b

133

134 .global entry_sync

135 .type entry_sync, @function

136 entry_sync:

137         push_state_to_exception_frame

138         mrs     x1, esr_el1

139         ubfm    x2, x1, #ESR_EC_BEG, #ESR_EC_END // Exception Class ->
X2

140         ubfm    x3, x1, #ESR_FLT_BEG, #ESR_FLT_END // FLT -> X3

141         cmp     x2, #ESR_EC_DATA_ABORT

142         b.eq    handle_mem_abort

143         cmp     x2, #ESR_EC_INSN_ABORT

144         b.ne    entry_invalid_from_sync

145 handle_mem_abort:

146         cbz     x3, entry_invalid_from_mem_abort

147         cmp     x3, #3

148         b.hi    entry_invalid_from_mem_abort

149

150         mov     x0, sp  // save exception_frame to x0

151         bl      page_fault

152         pop_state_from_exception_frame

153         eret

which makes OSv hang when encountering the Uknown Reason exception (see
line 131,132).

Now I discovered that if I change the *entry_invalid_from_sync* routine to
ignore the exception, pop the frame and let processing continue (like in
the modified code below), the app and kernel continues and triggers the
exact same exception again in the exact same address (same ELR_EL1 value)
over and over again (~5,000 to ~20,000,000 times) UNTIL it eventually
ceases to happen and the app successfully completes and OSv terminates. As
I wrote at the very beginning of this email, the same app never encounters
the EC=0 exception in 70-80% of the runs.

121 .global entry_invalid_from_sync

122 .type entry_invalid_from_sync, @function

123 entry_invalid_from_sync:

124         mov     x0, sp  // save exception_frame to x0

125         bl      entry_sync_invalid_handler

126         pop_state_from_exception_frame

127         eret


Any ideas on what could be wrong or on how to further debug this problem? I
can not see anything interesting in the host kern.log nor in QEMU log
(qemu.log).

Please note that I have never been able to reproduce this issue with the
same code (kernel and app) in the emulated mode (TCG) so it always seems to
happen with KVM acceleration only.

Below is some information about specifics of the host, qemu, etc:

The host is Ubuntu 20.04.1 running Raspberry PI 4B with 4GB of RAM booting
from SSD:

qemu-system-aarch64 --version

QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.8)

Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

uname -a

Linux ubuntu 5.4.0-1022-raspi #25-Ubuntu SMP PREEMPT Thu Oct 15 13:31:49
UTC 2020 aarch64 aarch64 aarch64 GNU/Linux

lscpu

Architecture:                    aarch64

CPU op-mode(s):                  32-bit, 64-bit

Byte Order:                      Little Endian

CPU(s):                          4

On-line CPU(s) list:             0-3

Thread(s) per core:              1

Core(s) per socket:              4

Socket(s):                       1

Vendor ID:                       ARM

Model:                           3

Model name:                      Cortex-A72

Stepping:                        r0p3

CPU max MHz:                     1500.0000

CPU min MHz:                     600.0000

BogoMIPS:                        108.00

Vulnerability Itlb multihit:     Not affected

Vulnerability L1tf:              Not affected

Vulnerability Mds:               Not affected

Vulnerability Meltdown:          Not affected

Vulnerability Spec store bypass: Vulnerable

Vulnerability Spectre v1:        Mitigation; __user pointer sanitization

Vulnerability Spectre v2:        Vulnerable

Vulnerability Srbds:             Not affected

Vulnerability Tsx async abort:   Not affected

Flags:                           fp asimd evtstrm crc32 cpuid

The qemu comman line:

qemu-system-aarch64 \

-m 128M \

-smp 1 \

--nographic \

-gdb tcp::1234,server,nowait \

-kernel /home/wkozaczuk/projects/osv/build/last/loader.img \

-append "--disable_rofs_cache /tests/tst-tls.so" \

-machine virt \

-device virtio-blk-pci,id=blk0,drive=hd0,scsi=off \

-drive
file=/home/wkozaczuk/projects/osv/build/release/tests_disk.img,if=none,id=hd0,cache=none,aio=native
\

-netdev user,id=un0,net=192.168.122.0/24,host=192.168.122.1 \

-device virtio-net-pci,netdev=un0 \

-device virtio-rng-pci \

-enable-kvm \

-cpu host \

-d all \

-D ./qemu.log

Here is also the OSv guest memory layout of the kernel, application, and
app stacks just in case.

0x0000000040090000 0x00000000407ac000           [KERNEL]


0x0000100000000000 0x0000100000001000 [4.0 kB]         flags=fmF      perm=rx
  offset=0x00000000 path=/libvdso.so

0x000010000001f000 0x0000100000020000 [4.0 kB]         flags=fmF      perm=r
  offset=0x0000f000 path=/libvdso.so

0x0000100000020000 0x0000100000021000 [4.0 kB]         flags=fmF      perm=rw
  offset=0x00010000 path=/libvdso.so

0x0000100000030000 0x0000100000033000 [12.0 kB]        flags=fmF      perm=rx
  offset=0x00000000 path=/tests/tst-tls.so

0x000010000004f000 0x0000100000050000 [4.0 kB]         flags=fmF      perm=r
  offset=0x0000f000 path=/tests/tst-tls.so

0x0000100000050000 0x0000100000051000 [4.0 kB]         flags=fmF      perm=rw
  offset=0x00010000 path=/tests/tst-tls.so

0x0000100000060000 0x0000100000061000 [4.0 kB]         flags=fmF      perm=rx
  offset=0x00000000 path=/tests/libtls.so

0x000010000007f000 0x0000100000080000 [4.0 kB]         flags=fmF      perm=r
  offset=0x0000f000 path=/tests/libtls.so

0x0000100000080000 0x0000100000081000 [4.0 kB]         flags=fmF      perm=rw
  offset=0x00010000 path=/tests/libtls.so

0x0000100000090000 0x00001000000a3000 [76.0 kB]        flags=fmF      perm=rx
  offset=0x00000000 path=/usr/lib/libgcc_s.so.1

0x00001000000bf000 0x00001000000c0000 [4.0 kB]         flags=fmF      perm=r
  offset=0x0001f000 path=/usr/lib/libgcc_s.so.1

0x00001000000c0000 0x00001000000c1000 [4.0 kB]         flags=fmF      perm=rw
  offset=0x00020000 path=/usr/lib/libgcc_s.so.1


0x0000200000000000 0x0000200000001000 [4.0 kB]         flags=p
perm=none

0x0000200000001000 0x0000200000002000 [4.0 kB]         flags=p
perm=none

0x0000200000002000 0x0000200000101000 [1020.0 kB]      flags=p        perm=rw


0x0000200000101000 0x0000200000102000 [4.0 kB]         flags=p
perm=none

0x0000200000102000 0x0000200000201000 [1020.0 kB]      flags=p        perm=rw



My regards,
Waldemar Kozaczuk

--000000000000bd638905b4652ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am one of the OSv unikernel devel=
opers=C2=A0and I have been stuck trying to figure out the problem described=
 here -=C2=A0<a href=3D"https://github.com/cloudius-systems/osv/issues/1100=
">https://github.com/cloudius-systems/osv/issues/1100</a> - for a long time=
 now to no avail. And I am looking for any more suggestions on how to debug=
 it further.</div><div><br>In essence, occasionally (20-30% of the time) OS=
v guest encounters=C2=A0&quot;Unknown Reason&quot; (ESR_EL1 =3D 0x2000000) =
sync exception when running the same test application (does not seem to be =
specific to any given application). It seems that the longer the applicatio=
n runs the more frequently this exception happens. Here is the state of the=
 registers from the guest gdb debug session captured when exception encount=
ered and after saving exception frame on the stack (sorted for convenience)=
:</div><div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">(gdb) info reg</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ACTLR_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ACTLR_EL2<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ACTLR_EL3<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">AFSR0_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">AFSR1_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">AIDR <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">AMAIR0 <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CLIDR<span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CONTEXTIDR_EL1 0x0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CPACR<span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x300000<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>3145728</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CSSELR <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x2 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>2</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CTR_EL0<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">DACR32_EL2 <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x1de7ec7edbadc0de<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">DBGBCR <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">DBGBVR <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">DBGWCR <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">DBGWVR <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ELR_EL1<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1000000311c0<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>175921862=
45568</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ESR_EL1<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x2000000 <span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>33554432</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">FAR_EL1<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1000000321b8<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>175921862=
49656</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">FPCR <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">FPEXC32_EL2<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x700 <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>1792</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">FPSR <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x14<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64AFR0_EL1 0x0<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64AFR1_EL1 0x0<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64AFR2_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64AFR3_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64DFR0_EL1 0x0<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64DFR1_EL1 0x0<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64DFR2_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64DFR3_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR0_EL1 0x10000 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>65536</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR1_EL1 0x0 <span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR2_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR3_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR4_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR5_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR6_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ISAR7_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR0_EL1 0x1124<span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>4388</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR1_EL1 0x0 <span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR2_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR3_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR4_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR5_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR6_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64MMFR7_EL1_RESERVED 0x0<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64PFR1_EL1 0x0<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64PFR2_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64PFR3_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64PFR5_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64PFR6_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64PFR7_EL1_RESERVED 0x0 <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AA64ZFR0_EL1 0x0<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_AFR0<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_DFR0<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR0 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x2101110 <span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>3460=
7376</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR1 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x13112111<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>3198=
89681</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR2 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x21232042<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>5559=
50146</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR3 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x1112131 <span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1789=
9825</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR4 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x11142 <span class=3D"gm=
ail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>69954</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR5 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x10001 <span class=3D"gm=
ail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>65537</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_ISAR6 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_MMFR0 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_MMFR1 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_MMFR2 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_MMFR3 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_MMFR4 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">ID_PFR0<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">IFSR32_EL2 <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x1de7ec7edbadc0de<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MAIR_EL1 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0xff440c0400<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1096358=
298624</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MAIR_EL3 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MDCCSR_EL0 <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MDCR_EL3 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MDRAR_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MDSCR_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR0_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x10110222<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>2695=
50114</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR1_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x12111111<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>3031=
08369</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR2_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x43<span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>67</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR3_EL1_RESERVED 0x0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR4_EL1_RESERVED 0x0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR5_EL1_RESERVED 0x0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR6_EL1_RESERVED 0x0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">MVFR7_EL1_RESERVED 0x0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">OSLSR_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0xa <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>10</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PAR_EL1<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1d000c7edbadc0de<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 </span>2089683966090920158=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCCFILTR_EL0<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x0 <span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCCNTR_EL0<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x1de7ec7edbadc0de<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCEID0_EL0<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x20001 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1310=
73</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCEID1_EL0<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCNTENCLR_EL0 0x5badc0c0<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>1538113728</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCNTENSET_EL0 0x5badc0c0<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>1538113728</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMCR_EL0 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x4102302c<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1090=
662444</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVCNTR0_EL0<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x1de7ec7edbadc0de<span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVCNTR1_EL0<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x1de7ec7edbadc0de<span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVCNTR2_EL0<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x1de7ec7edbadc0de<span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVCNTR3_EL0<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x1de7ec7edbadc0de<span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVTYPER0_EL0 0x1de7ec7edbadc0=
de<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>215495097631570=
3518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVTYPER1_EL0 0x1de7ec7edbadc0=
de<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>215495097631570=
3518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVTYPER2_EL0 0x1de7ec7edbadc0=
de<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>215495097631570=
3518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMEVTYPER3_EL0 0x1de7ec7edbadc0=
de<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>215495097631570=
3518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMINTENCLR_EL1 0x5badc0c0<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>1538113728</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMINTENSET_EL1 0x5badc0c0<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>1538113728</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMOVSCLR_EL0 <span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x1de7ec7edbadc0de<span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMOVSSET_EL0 <span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x1de7ec7edbadc0de<span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMSELR_EL0 <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x1de7ec7edbadc0de<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">PMUSERENR_EL0<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>0x0 <span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">REVIDR_EL1 <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">RVBAR_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SCTLR<span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x30d0199d<span=
 class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>818944413</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SPSR_ABT <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SPSR_EL1 <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x80000345<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>2147=
484485</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SPSR_FIQ <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SPSR_IRQ <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SPSR_UND <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SP_EL0 <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">SP_EL1 <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x200000200d60<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>351843741=
89408</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">TCR_EL1<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x15b5103510<span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>9323=
2051472</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">TPIDRRO_EL0<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 </span>0x1de7ec7edbadc0de<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>2154950976315703518</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">TPIDR_EL0<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0xffff900040f78000<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0 </span>-123144212348928</span><=
/p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">TPIDR_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x1de7ec7edbadc0de<span c=
lass=3D"gmail-Apple-converted-space">=C2=A0 </span>2154950976315703518</spa=
n></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">TTBR0_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x407bf000<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1081=
864192</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">TTBR1_EL1<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0x407b5000<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1081=
823232</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">VBAR <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x40207000<span=
 class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>1075867648</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">cpsr <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x800003c5<span=
 class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>-2147482683</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">fpcr <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">fpsr <span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x14<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>20</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">pc <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x402077a0=
<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0x402077a0 &lt;entry_invalid_from_sync&gt;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">sp <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x20000020=
0d60<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>0x200000200d60</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x0 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x1 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x2000000 =
<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>33554432</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x10<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffffa000=
40ca9e00<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-10555202=
9245952</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x11<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffffa000=
40e1a600<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-10555202=
7736576</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x12<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x10000003=
2048<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>17592186249288</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x13<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x14<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x41000000=
00<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>279172874240</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x15<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x16<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x10000005=
0000<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>17592186372096</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x17<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x402b0240=
<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>1076560448</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x18<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x19<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x20000020=
0ed0<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>35184374189776</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x2 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x20<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffff9000=
40f78000<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-12314421=
2348928</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x21<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x22<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x23<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffff9000=
40a2f090<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-12314421=
7890672</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x24<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x12ca90ab=
ac<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>80707890092</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x25<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x26<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffffa000=
40f79200<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-10555202=
6299904</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x27<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffff8000=
407cd739<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-14073640=
6431943</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x28<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0xffffa000=
40f79278<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-10555202=
6299784</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x29<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x20000020=
0e80<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>35184374189696</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x3 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x0 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x30<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x10000003=
11b8<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>17592186245560</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x4 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x10000003=
21e2<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>17592186249698</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x5 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x20000020=
0ee2<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span=
>35184374189794</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x6 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x76<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>118</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x7 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x34<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>52</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x8 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x34<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>52</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">x9 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x1 <span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>1</span></p></div><div>=C2=A0=C2=A0</div><div>O=
Sv, being unikernel runs its kernel and application in the same memory spac=
e at EL1.=C2=A0</div><div><br></div><div>The most difficult issue is that I=
 do not know why we occasionally encounter this exception. The ARMV8 docume=
ntation gives many reasons (<a href=3D"https://developer.arm.com/docs/ddi05=
95/h/aarch64-system-registers/esr_el1#ISS_exceptionswithanunknownreason">ht=
tps://developer.arm.com/docs/ddi0595/h/aarch64-system-registers/esr_el1#ISS=
_exceptionswithanunknownreason</a>) but none of the ones I tried to investi=
gate seems to match what I am seeing.</div><div><br></div><div>One of the r=
easons could be unallocated instruction or instruction=C2=A0using not-allow=
ed system register (like MSR, MRS) but that does not seem to be the case. T=
he same application seems to encounter the Uknown Reason exception (if it d=
oes) at various places in the code and there does not seem to be anything c=
onsistent about it, except it is always the app code and never the kernel p=
art (see addresses above=C2=A00x0000100000000000). Here are some examples o=
f instructions=C2=A0per ELR_EL1 (ESR_EL1 is always=C2=A00x2000000):</div><d=
iv><br></div><div>Address,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Instruction</div><div>---------------------------------------</div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000031000=C2=A0</span>=
<span class=3D"gmail-Apple-converted-space" style=3D"font-variant-ligatures=
:no-common-ligatures">=C2=A0</span><span style=3D"font-variant-ligatures:no=
-common-ligatures">d63f0020</span><span class=3D"gmail-Apple-converted-spac=
e" style=3D"font-variant-ligatures:no-common-ligatures">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"font-variant-ligatures:no-common-ligatures=
">blr </span><span class=3D"gmail-Apple-converted-space" style=3D"font-vari=
ant-ligatures:no-common-ligatures">=C2=A0 =C2=A0 </span><span style=3D"font=
-variant-ligatures:no-common-ligatures">x1</span></p><p class=3D"gmail-p1" =
style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-stretch:normal;font-size:15px;line-height:normal;font-family:Menlo=
;color:rgb(0,0,0)">





</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:15px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">0x0000100000031140=C2=A0=C2=
=A0</span><span style=3D"font-variant-ligatures:no-common-ligatures">f9404c=
01</span><span class=3D"gmail-Apple-converted-space" style=3D"font-variant-=
ligatures:no-common-ligatures">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span sty=
le=3D"font-variant-ligatures:no-common-ligatures">ldr </span><span class=3D=
"gmail-Apple-converted-space" style=3D"font-variant-ligatures:no-common-lig=
atures">=C2=A0 =C2=A0 </span><span style=3D"font-variant-ligatures:no-commo=
n-ligatures">x1, [x0, #152]</span></p><p class=3D"gmail-p1" style=3D"margin=
:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretc=
h:normal;font-size:15px;line-height:normal;font-family:Menlo;color:rgb(0,0,=
0)">





</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:15px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">





</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-stretch:normal;font-size:15px;lin=
e-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1=
" style=3D"font-variant-ligatures:no-common-ligatures">0x00001000000311c0=
=C2=A0=C2=A0</span><span style=3D"font-variant-ligatures:no-common-ligature=
s">94000182</span><span class=3D"gmail-Apple-converted-space" style=3D"font=
-variant-ligatures:no-common-ligatures">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
<span style=3D"font-variant-ligatures:no-common-ligatures">bl</span><span c=
lass=3D"gmail-Apple-converted-space" style=3D"font-variant-ligatures:no-com=
mon-ligatures">=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"font-variant-liga=
tures:no-common-ligatures">17c8 &lt;*ABS*@plt+0x7b8&gt;</span></p>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000031600=C2=A0=C2=A0<=
/span><span style=3D"font-variant-ligatures:no-common-ligatures">b4000040</=
span><span class=3D"gmail-Apple-converted-space" style=3D"font-variant-liga=
tures:no-common-ligatures">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"font-variant-ligatures:no-common-ligatures">cbz </span><span class=3D"g=
mail-Apple-converted-space" style=3D"font-variant-ligatures:no-common-ligat=
ures">=C2=A0 =C2=A0 </span><span style=3D"font-variant-ligatures:no-common-=
ligatures">x0, 1608 &lt;*ABS*@plt+0x5f8&gt;</span></p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-stretch:normal;font-size:15px;line-height:normal;font-family:Menl=
o;color:rgb(0,0,0)">





</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:15px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">0x0000100000031640=C2=A0=C2=
=A0</span><span style=3D"font-variant-ligatures:no-common-ligatures">f00000=
e0</span><span class=3D"gmail-Apple-converted-space" style=3D"font-variant-=
ligatures:no-common-ligatures">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span sty=
le=3D"font-variant-ligatures:no-common-ligatures">adrp</span><span class=3D=
"gmail-Apple-converted-space" style=3D"font-variant-ligatures:no-common-lig=
atures">=C2=A0 =C2=A0 </span><span style=3D"font-variant-ligatures:no-commo=
n-ligatures">x0, 20000 &lt;*ABS*@plt+0x1eff0&gt;</span></p><p class=3D"gmai=
l-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-stretch:normal;font-size:15px;line-height:normal;font-family=
:Menlo;color:rgb(0,0,0)">





</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:15px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">0x0000100000031200=C2=A0=C2=
=A0</span><span style=3D"font-variant-ligatures:no-common-ligatures">2a1503=
e0</span><span class=3D"gmail-Apple-converted-space" style=3D"font-variant-=
ligatures:no-common-ligatures">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span sty=
le=3D"font-variant-ligatures:no-common-ligatures">mov </span><span class=3D=
"gmail-Apple-converted-space" style=3D"font-variant-ligatures:no-common-lig=
atures">=C2=A0 =C2=A0 </span><span style=3D"font-variant-ligatures:no-commo=
n-ligatures">w0, w21</span></p>

















<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant-ligatu=
res:no-common-ligatures">=C2=A0=C2=A0</span></p></div><div>As you can see s=
ome instructions involve memory access but some do not (last example) and t=
hey all seem to be valid instructions.</div><div><br></div><div>The existin=
g OSv sync exception handler looks like that:</div><div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">121 =
.global</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-c=
ommon-ligatures;color:rgb(0,0,0)"> </span><span class=3D"gmail-s3" style=3D=
"font-variant-ligatures:no-common-ligatures">entry_invalid_from_sync</span>=
</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">122 =
.type</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-com=
mon-ligatures;color:rgb(0,0,0)"> </span><span class=3D"gmail-s3" style=3D"f=
ont-variant-ligatures:no-common-ligatures">entry_invalid_from_sync</span><s=
pan class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;=
color:rgb(0,0,0)">, @</span><span class=3D"gmail-s3" style=3D"font-variant-=
ligatures:no-common-ligatures">function</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">123 =
</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-l=
igatures">entry_invalid_from_sync</span><span class=3D"gmail-s2" style=3D"f=
ont-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">:</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">124 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">mrs</span><=
span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures=
;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x20</span><span class=3D"gmail-s=
2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, =
</span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(46,174,187)">elr_el1</span><span class=3D"gmail-s2" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)"> <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span></span><spa=
n class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">/=
/ Exception Link Register -&gt; X20</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">125 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">mrs</span><=
span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures=
;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x21</span><span class=3D"gmail-s=
2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, =
</span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(46,174,187)">spsr_el1</span><span class=3D"gmail-s2" sty=
le=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)"><span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span></span><spa=
n class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">/=
/ Saved PSTATE -&gt; X21</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">126 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">mrs</span><=
span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures=
;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x22</span><span class=3D"gmail-s=
2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, =
</span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(46,174,187)">esr_el1</span><span class=3D"gmail-s2" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)"> <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span></span><spa=
n class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">/=
/ Exception Syndrome Register -&gt; X22</span></p>
<p class=3D"gmail-p3" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(193,101,28)"><span class=3D"gmail-s3" styl=
e=3D"font-variant-ligatures:no-common-ligatures">127<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">128 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">ubfm</span>=
<span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligature=
s;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x23</span><span class=3D"gmail-s=
2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, =
</span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(46,174,187)">x22</span><span class=3D"gmail-s2" style=3D=
"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, </span><spa=
n class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">#=
ESR_EC_BEG, #ESR_EC_END <span class=3D"gmail-Apple-converted-space">=C2=A0 =
</span>// Exception Class -&gt; X23</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">129 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">ubfm</span>=
<span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligature=
s;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x24</span><span class=3D"gmail-s=
2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, =
</span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(46,174,187)">x22</span><span class=3D"gmail-s2" style=3D=
"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, </span><spa=
n class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">#=
ESR_ISS_BEG, #ESR_ISS_END // Instruction-Specific Syndrome -&gt; X24</span>=
</p>
<p class=3D"gmail-p3" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(193,101,28)"><span class=3D"gmail-s3" styl=
e=3D"font-variant-ligatures:no-common-ligatures">130<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">131 </spa=
n><span class=3D"gmail-s5" style=3D"font-variant-ligatures:no-common-ligatu=
res;color:rgb(180,36,25)">1</span><span class=3D"gmail-s3" style=3D"font-va=
riant-ligatures:no-common-ligatures">:<span class=3D"gmail-Apple-converted-=
space">=C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D=
"font-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">wfi</spa=
n></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">132 </spa=
n><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatu=
res"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">b</span><span class=3D"gmail-s3"=
 style=3D"font-variant-ligatures:no-common-ligatures"> <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"g=
mail-s5" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(180,=
36,25)">1</span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no=
-common-ligatures;color:rgb(46,174,187)">b</span></p>
<p class=3D"gmail-p3" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(193,101,28)"><span class=3D"gmail-s3" styl=
e=3D"font-variant-ligatures:no-common-ligatures">133<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p3" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(193,101,28)"><span class=3D"gmail-s3" styl=
e=3D"font-variant-ligatures:no-common-ligatures">134 .global</span><span cl=
ass=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:=
rgb(0,0,0)"> </span><span class=3D"gmail-s4" style=3D"font-variant-ligature=
s:no-common-ligatures;color:rgb(46,174,187)">entry_sync</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">135 =
.type</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-com=
mon-ligatures;color:rgb(0,0,0)"> </span><span class=3D"gmail-s3" style=3D"f=
ont-variant-ligatures:no-common-ligatures">entry_sync</span><span class=3D"=
gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0=
,0)">, @</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-=
common-ligatures">function</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">136 =
</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-l=
igatures">entry_sync</span><span class=3D"gmail-s2" style=3D"font-variant-l=
igatures:no-common-ligatures;color:rgb(0,0,0)">:</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">137 =
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">push_state_to_exception_frame</sp=
an></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">138 </spa=
n><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatu=
res"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">mrs</span><span class=3D"gmail-s=
3" style=3D"font-variant-ligatures:no-common-ligatures"> <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 </span></span><span class=3D"gmail-=
s4" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(46,174,18=
7)">x1</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-co=
mmon-ligatures">, </span><span class=3D"gmail-s4" style=3D"font-variant-lig=
atures:no-common-ligatures;color:rgb(46,174,187)">esr_el1</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">139 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">ubfm</span>=
<span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligature=
s;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x2</span><span class=3D"gmail-s2=
" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, <=
/span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(46,174,187)">x1</span><span class=3D"gmail-s2" style=3D"f=
ont-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, </span><span =
class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">#ES=
R_EC_BEG, #ESR_EC_END // Exception Class -&gt; X2</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">140 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">ubfm</span>=
<span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligature=
s;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x3</span><span class=3D"gmail-s2=
" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, <=
/span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(46,174,187)">x1</span><span class=3D"gmail-s2" style=3D"f=
ont-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, </span><span =
class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">#ES=
R_FLT_BEG, #ESR_FLT_END // FLT -&gt; X3</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">141 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">cmp</span><=
span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures=
;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x2</span><span class=3D"gmail-s2=
" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, <=
/span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-li=
gatures">#ESR_EC_DATA_ABORT</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">142 =
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">b</span><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">=
.eq</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-commo=
n-ligatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"font-variant-=
ligatures:no-common-ligatures">handle_mem_abort</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">143 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">cmp</span><=
span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures=
;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x2</span><span class=3D"gmail-s2=
" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, <=
/span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-li=
gatures">#ESR_EC_INSN_ABORT</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">144 =
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">b</span><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">=
.ne</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-commo=
n-ligatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"font-variant-=
ligatures:no-common-ligatures">entry_invalid_from_sync</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">145 =
</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-l=
igatures">handle_mem_abort</span><span class=3D"gmail-s2" style=3D"font-var=
iant-ligatures:no-common-ligatures;color:rgb(0,0,0)">:</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">146 =
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">cbz</span><span class=3D"gmail-s2=
" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)"> <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span></span><span=
 class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures">x3=
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)">, </span><span class=3D"gmail-s3" style=3D"font-=
variant-ligatures:no-common-ligatures">entry_invalid_from_mem_abort</span><=
/p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">147 </spa=
n><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatu=
res"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">cmp</span><span class=3D"gmail-s=
3" style=3D"font-variant-ligatures:no-common-ligatures"> <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 </span></span><span class=3D"gmail-=
s4" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(46,174,18=
7)">x3</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-co=
mmon-ligatures">, </span><span class=3D"gmail-s6" style=3D"font-variant-lig=
atures:no-common-ligatures;color:rgb(64,11,217)">#3</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">148 =
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">b</span><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">=
.hi</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-commo=
n-ligatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"font-variant-=
ligatures:no-common-ligatures">entry_invalid_from_mem_abort</span></p>
<p class=3D"gmail-p3" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(193,101,28)"><span class=3D"gmail-s3" styl=
e=3D"font-variant-ligatures:no-common-ligatures">149<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">150 <=
/span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">mov</span><=
span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures=
;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">x0</span><span class=3D"gmail-s2=
" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">, <=
/span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-li=
gatures;color:rgb(46,174,187)">sp</span><span class=3D"gmail-s2" style=3D"f=
ont-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)"><span class=3D"=
gmail-Apple-converted-space">=C2=A0 </span></span><span class=3D"gmail-s3" =
style=3D"font-variant-ligatures:no-common-ligatures">// save exception_fram=
e to x0</span></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">151 </spa=
n><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatu=
res"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">bl</span><span class=3D"gmail-s3=
" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"g=
mail-s4" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(46,1=
74,187)">page_fault</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">152 =
</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-l=
igatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">pop_state_from_exception_frame</s=
pan></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">153 </spa=
n><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatu=
res"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(46,174,187)">eret</span></p></div><div><br></=
div><div>which makes OSv hang when encountering the=C2=A0Uknown Reason exce=
ption (see line 131,132).</div><div><br></div><div>Now I discovered that if=
 I change the=C2=A0<b>entry_invalid_from_sync</b> routine to ignore the exc=
eption, pop the frame and let processing continue (like in the modified cod=
e below), the app and kernel continues and triggers the exact same exceptio=
n again in the exact same address (same ELR_EL1 value) over and over again =
(~5,000 to ~20,000,000 times) UNTIL it eventually ceases to happen and the =
app successfully completes and OSv terminates. As I wrote at the very begin=
ning of this email, the same app never encounters the EC=3D0 exception in 7=
0-80% of the runs.</div><div><br></div><div><p class=3D"gmail-p1" style=3D"=
margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
stretch:normal;font-size:15px;line-height:normal;font-family:Menlo;color:rg=
b(46,174,187)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-=
common-ligatures;color:rgb(193,101,28)">121 .global</span><span class=3D"gm=
ail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0=
)"> </span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-comm=
on-ligatures">entry_invalid_from_sync</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">122 =
.type</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-com=
mon-ligatures;color:rgb(0,0,0)"> </span><span class=3D"gmail-s3" style=3D"f=
ont-variant-ligatures:no-common-ligatures">entry_invalid_from_sync</span><s=
pan class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;=
color:rgb(0,0,0)">, @</span><span class=3D"gmail-s3" style=3D"font-variant-=
ligatures:no-common-ligatures">function</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">123 =
</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-l=
igatures">entry_invalid_from_sync</span><span class=3D"gmail-s2" style=3D"f=
ont-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)">:</span></p><p =
class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:norma=
l;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s2" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(0,0,0)"></span></p=
><div></div><p></p><div><p class=3D"gmail-p2" style=3D"margin:0px;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-=
size:15px;line-height:normal;font-family:Menlo;color:rgb(64,11,217)"><span =
class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures;colo=
r:rgb(193,101,28)">124=C2=A0</span><span class=3D"gmail-s2" style=3D"font-v=
ariant-ligatures:no-common-ligatures;color:rgb(0,0,0)"><span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span cla=
ss=3D"gmail-s4" style=3D"font-variant-ligatures:no-common-ligatures;color:r=
gb(46,174,187)">mov</span><span class=3D"gmail-s2" style=3D"font-variant-li=
gatures:no-common-ligatures;color:rgb(0,0,0)"> <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 </span></span><span class=3D"gmail-s4" style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">x0</s=
pan><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-liga=
tures;color:rgb(0,0,0)">, </span><span class=3D"gmail-s4" style=3D"font-var=
iant-ligatures:no-common-ligatures;color:rgb(46,174,187)">sp</span><span cl=
ass=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color:=
rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space">=C2=A0 </span></spa=
n><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatu=
res">// save exception_frame to x0</span></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">125=C2=A0=
</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-l=
igatures"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatur=
es:no-common-ligatures;color:rgb(46,174,187)">bl</span><span class=3D"gmail=
-s3" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gm=
ail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0=C2=A0</span></span><span st=
yle=3D"font-variant-ligatures:no-common-ligatures;color:rgb(46,174,187)">en=
try_sync_invalid_handler</span></p>






<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(46,174,187)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">126=
=C2=A0</span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:no-co=
mmon-ligatures;color:rgb(0,0,0)"><span class=3D"gmail-Apple-converted-space=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span class=3D"gmail-s3" style=
=3D"font-variant-ligatures:no-common-ligatures">pop_state_from_exception_fr=
ame</span></p>
<p class=3D"gmail-p4" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures;color:rgb(193,101,28)">127=C2=A0=
</span><span class=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-l=
igatures"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span></span><span class=3D"gmail-s4" style=3D"font-variant-ligatur=
es:no-common-ligatures;color:rgb(46,174,187)">eret</span></p></div>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(64,11,217)"></p></div><div><br></div><div>=
Any ideas on what could be wrong or on how to further debug this problem? I=
 can not see anything interesting in the host kern.log nor in QEMU log (qem=
u.log).=C2=A0</div><div><br></div><div>Please note that I have never been a=
ble to reproduce this issue with the same code (kernel and app) in the emul=
ated mode (TCG) so it always seems to happen with KVM acceleration only.</d=
iv><div><br></div><div>Below is some information about specifics of the hos=
t, qemu, etc:</div><div><br></div><div>The host is Ubuntu 20.04.1 running R=
aspberry PI 4B with 4GB of RAM booting from SSD:</div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">qemu-system-aarch64 --version</=
span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">QEMU emulator version 4.2.1 (De=
bian 1:4.2-3ubuntu6.8)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Copyright (c) 2003-2019 Fabrice=
 Bellard and the QEMU Project developers</span></p></div><div><br></div><di=
v>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">uname -a</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Linux ubuntu 5.4.0-1022-raspi #=
25-Ubuntu SMP PREEMPT Thu Oct 15 13:31:49 UTC 2020 aarch64 aarch64 aarch64 =
GNU/Linux</span></p></div><div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">lscpu</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Architecture:<span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>aarch64</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CPU op-mode(s):<span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>32-bit, 64-bit</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Byte Order:<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Little Endian</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CPU(s):<span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>4</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">On-line CPU(s) list: <span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 </span>0-3</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Thread(s) per core:<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Core(s) per socket:<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>4</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Socket(s): <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vendor ID: <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>ARM</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Model: <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>3</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Model name:<span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Cortex-A72</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Stepping:<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>r0p3</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CPU max MHz: <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>1500.0000</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">CPU min MHz: <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>600.0000</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">BogoMIPS:<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>108.00</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Itlb multihit: <s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>Not affected=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability L1tf:<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>Not affected</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Mds: <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>Not affected</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Meltdown:<span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </sp=
an>Not affected</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Spec store bypass=
: Vulnerable</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Spectre v1:<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Mi=
tigation; __user pointer sanitization</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Spectre v2:<span =
class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Vu=
lnerable</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Srbds: <span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 </span>Not affected</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Vulnerability Tsx async abort: =
<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>Not affected</spa=
n></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Flags: <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>fp asimd evtstrm crc32 cpuid</sp=
an></p></div><div><br></div><div>The qemu comman line:</div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">qemu-system-aarch64 \</span></p=
>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-m 128M \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-smp 1 \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">--nographic \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-gdb tcp::1234,server,nowait \<=
/span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-kernel /home/wkozaczuk/project=
s/osv/build/last/loader.img \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-append &quot;--disable_rofs_ca=
che /tests/tst-tls.so&quot; \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-machine virt \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-device virtio-blk-pci,id=3Dblk=
0,drive=3Dhd0,scsi=3Doff \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-drive file=3D/home/wkozaczuk/p=
rojects/osv/build/release/tests_disk.img,if=3Dnone,id=3Dhd0,cache=3Dnone,ai=
o=3Dnative \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-netdev user,id=3Dun0,net=3D<a =
href=3D"http://192.168.122.0/24,host=3D192.168.122.1">192.168.122.0/24,host=
=3D192.168.122.1</a> \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-device virtio-net-pci,netdev=
=3Dun0 \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-device virtio-rng-pci \</span>=
</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-enable-kvm \</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-cpu host \</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:15px;line-height:normal;fon=
t-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant-ligatures:no-c=
ommon-ligatures">-d all \</span></p>






<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-D ./qemu.log</span></p></div><=
div><br></div><div>Here is also the OSv guest memory layout of the kernel, =
application, and app stacks just in case.</div><div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000000040090000 0x0000000040=
7ac000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0[KERNEL]</span></span></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;font-size:15px;line-height:normal;font-family:Menlo;colo=
r:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-c=
ommon-ligatures"><span class=3D"gmail-Apple-converted-space"><br></span></s=
pan></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000000000 0x0000100000=
001000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drx <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00000000 path=3D/libvdso.so</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x000010000001f000 0x0000100000=
020000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Dr<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 </span>offset=3D0x0000f000 path=3D/libvdso.so</span></p=
>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000020000 0x0000100000=
021000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drw <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00010000 path=3D/libvdso.so</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000030000 0x0000100000=
033000 [12.0 kB]<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drx <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00000000 path=3D/tests/tst-tls.so</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x000010000004f000 0x0000100000=
050000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Dr<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 </span>offset=3D0x0000f000 path=3D/tests/tst-tls.so</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000050000 0x0000100000=
051000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drw <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00010000 path=3D/tests/tst-tls.so</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000060000 0x0000100000=
061000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drx <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00000000 path=3D/tests/libtls.so</span></p=
>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x000010000007f000 0x0000100000=
080000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Dr<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 </span>offset=3D0x0000f000 path=3D/tests/libtls.so</spa=
n></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000080000 0x0000100000=
081000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drw <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00010000 path=3D/tests/libtls.so</span></p=
>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000100000090000 0x0000100000=
0a3000 [76.0 kB]<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drx <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00000000 path=3D/usr/lib/libgcc_s.so.1</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x00001000000bf000 0x0000100000=
0c0000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Dr<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 </span>offset=3D0x0001f000 path=3D/usr/lib/libgcc_s.so.=
1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x00001000000c0000 0x0000100000=
0c1000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3DfmF<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drw <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>offset=3D0x00020000 path=3D/usr/lib/libgcc_s.so.1</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><br></span></p><p class=3D"gmai=
l-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-stretch:normal;font-size:15px;line-height:normal;font-family=
:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">0x0000200000000000 0x0000200000001000 [4.0 kB] =
<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </s=
pan>flags=3Dp<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>perm=3Dnone</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000200000001000 0x0000200000=
002000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3Dp<span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>perm=3Dnone</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000200000002000 0x0000200000=
101000 [1020.0 kB]<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0=
 =C2=A0 </span>flags=3Dp<span class=3D"gmail-Apple-converted-space">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drw <span class=3D"gmail-Apple-converted-=
space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000200000101000 0x0000200000=
102000 [4.0 kB] <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>flags=3Dp<span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>perm=3Dnone</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">0x0000200000102000 0x0000200000=
201000 [1020.0 kB]<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0=
 =C2=A0 </span>flags=3Dp<span class=3D"gmail-Apple-converted-space">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>perm=3Drw <span class=3D"gmail-Apple-converted-=
space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:15px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><br></p></div><div>My regards,</di=
v><div>Waldemar Kozaczuk</div><div><br></div></div>

--000000000000bd638905b4652ef3--
