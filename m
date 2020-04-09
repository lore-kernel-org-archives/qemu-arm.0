Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp788791lfm;
        Wed, 8 Apr 2020 23:32:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypL3+cKDlretuBwoDOFZgjt51pRCLFssdgR+Q7qMtBk5qBQuh57UQMR9tOWIHKCnPWmoLzLo
X-Received: by 2002:ac8:698d:: with SMTP id o13mr1301748qtq.2.1586413952864;
        Wed, 08 Apr 2020 23:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586413952; cv=none;
        d=google.com; s=arc-20160816;
        b=LgucTGhgEZgWPjjyk7tFMifcESaKsJBUbmDPTM4IMLwauKs1qHhcEsH/uWLtMzQbYY
         4TC5oCAcVAvUO+axxBJX4cPAvVtler7URDCzw2PCZ8fxgFKYRH5FK7tVQORb1UG9E4u5
         svLAk9Z7bdJnvI4E7FEu1oUWJr2+NcbarlJGPoGFSeKXPNpsK5uJxh+f6p4bY6yW4Hut
         nTL8bi0y+S6OwYuKYAG4r0nYf3owbO0yMSCXiBCPTEh5tr5YTAveF9NpuIlS5h1ayHWZ
         JQL5gUyJKWsW5LgAaoIwIQrUEy9boZ2GLD5ucrZB9k0r+Lx2yT06EjgKseyiWPoN+XWA
         4XRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZmE5h1aLZp027rDdE+g5gn6VrUy0NeUQFkvn4C15CGI=;
        b=olWWe+ekguyZPzOxJNy86//SlPXdEi/+oFnRn0ZBFHkkEYxoSYa/jafXlFu0NoUmyn
         wFBgiHEW6YFHuWZbrfGh40W6B2cCnsaFJGatLw/PvADRRdoRZlgGhXC7sWJUhqQt7JnP
         g0MDnvJQtS6DWuEdoegmjtulYHSzNT3EKnwEYPnU3gtsINMZS5zlb46dbRxFf3YOkExj
         1vOVztw5U79/deUGfhuaNCNLTXIRZDbXO81k/KzeYNw98LaD+sv/FKtdpfKu82QQzz5E
         cPhCsQcWqYpVU8KXz2cJUZE42TUl5FUUk92L4CI/NzoYO8B8xCEqiD4m/k36G+2PiEkg
         bYxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PSn70f78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si5105013qkv.290.2020.04.08.23.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 23:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PSn70f78;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMQjo-0002WR-3N
	for alex.bennee@linaro.org; Thu, 09 Apr 2020 02:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1jMQjG-0002WG-IS
 for qemu-arm@nongnu.org; Thu, 09 Apr 2020 02:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1jMQjF-0007qE-86
 for qemu-arm@nongnu.org; Thu, 09 Apr 2020 02:31:58 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44656)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1jMQjF-0007pn-0a; Thu, 09 Apr 2020 02:31:57 -0400
Received: by mail-pf1-x443.google.com with SMTP id b72so3653814pfb.11;
 Wed, 08 Apr 2020 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZmE5h1aLZp027rDdE+g5gn6VrUy0NeUQFkvn4C15CGI=;
 b=PSn70f78MyLH+mIrRZMoQInXo/Kt68ekT2UK8qYNFh2HdXvsNnCEQNqcTnsMMjtWFf
 dEj8/AP+/RTro/h8wNaSU0GwCG8RcMTTcycgyMO+24LuXR2ObBKyC2sE9Pn63lc09nve
 i/yGywstIyaPoUcYbp2SLSy0p3dkyY41wSl86JVAr+5TkFzy8ykp9VdbrPwbARvsU7Nt
 FR8kk90iM9ON0NDXLOUT6pzSm1zJUQRfuaSTVSLgBEja+RlCsJ6FF2Cb563NYzQDiDq+
 bZR4smpq3cwfhCZRpgT03MMMI2ajl4/eXAXvzcd95SfBL3HhP7QDNUdpMhpYEu1n+0DX
 RkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZmE5h1aLZp027rDdE+g5gn6VrUy0NeUQFkvn4C15CGI=;
 b=KaiAbmqy+xRozmHVkO9szGGucaJgd9CFG1AY+wZ30aO8BdL/8n35KD8DUcIu63DM6N
 WNJUGgEJd8HgI1onnFSbLVWmMHt5lAVm7EOcNmrl6aAViRzpfFMJDwJI4Zvip7981XNK
 TiNmsziK/wcbMsyXWcJFWf7QY3a+7/PVhOG3qoncXw5T6jZxV6/3lKrTKMuONhG32YTG
 PZquTEe1Cw0AP430Q40mh7rM23khDnVcXiEr7O/ma3wSo1X/2zobeFYbxAiOg3ZDjBl+
 zhTpkC+B6tlOiAHpOqXeiXRSHyRRax28+hOu59pByTacheIygwmoUHgLleSByZFe8VIH
 PZww==
X-Gm-Message-State: AGi0PubEqTb3uNCgw2A3c7jIILmrqVmM0n++omeXcjmlFEehFm5nKC2W
 EGM/3xYWMbzOZMlTN3ulzV0=
X-Received: by 2002:a63:e44f:: with SMTP id i15mr3392475pgk.310.1586413915747; 
 Wed, 08 Apr 2020 23:31:55 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id c126sm18681121pfb.83.2020.04.08.23.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 23:31:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] aspeed: Add boot stub for smp booting
Date: Thu,  9 Apr 2020 16:01:37 +0930
Message-Id: <20200409063137.803522-1-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IKPzffZmu1P9

This is a boot stub that is similar to the code u-boot runs, allowing
the kernel to boot the secondary CPU.

u-boot works as follows:

 1. Initialises the SMP mailbox area in the SCU at 0x1e6e2180 with default values

 2. Copies a stub named 'mailbox_insn' from flash to the SCU, just above the
    mailbox area

 3. Sets AST_SMP_MBOX_FIELD_READY to a magic value to indicate the
    secondary can begin execution from the stub

 4. The stub waits until the AST_SMP_MBOX_FIELD_GOSIGN register is set to
    a magic value

 5. Jumps to the address in AST_SMP_MBOX_FIELD_ENTRY, starting Linux

Linux indicates it is ready by writing the address of its entrypoint
function to AST_SMP_MBOX_FIELD_ENTRY and the 'go' magic number to
AST_SMP_MBOX_FIELD_GOSIGN. The secondary CPU sees this at step 4 and
breaks out of it's loop.

To be compatible, a fixed qemu stub is loaded into the mailbox area. As
qemu can ensure the stub is loaded before execution starts, we do not
need to emulate the AST_SMP_MBOX_FIELD_READY behaviour of u-boot. The
secondary CPU's program counter points to the beginning of the stub,
allowing qemu to start secondaries at step four.

Reboot behaviour is preserved by resetting AST_SMP_MBOX_FIELD_GOSIGN
when the secondaries are reset.

This is only configured when the system is booted with -kernel and qemu
does not execute u-boot first.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: test for number of CPUs
---
 hw/arm/aspeed.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 88bcd6ff3fbd..e363e495ef48 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -116,6 +116,58 @@ static const MemoryRegionOps max_ram_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+#define AST_SMP_MAILBOX_BASE            0x1e6e2180
+#define AST_SMP_MBOX_FIELD_ENTRY        (AST_SMP_MAILBOX_BASE + 0x0)
+#define AST_SMP_MBOX_FIELD_GOSIGN       (AST_SMP_MAILBOX_BASE + 0x4)
+#define AST_SMP_MBOX_FIELD_READY        (AST_SMP_MAILBOX_BASE + 0x8)
+#define AST_SMP_MBOX_FIELD_POLLINSN     (AST_SMP_MAILBOX_BASE + 0xc)
+#define AST_SMP_MBOX_CODE               (AST_SMP_MAILBOX_BASE + 0x10)
+#define AST_SMP_MBOX_GOSIGN             0xabbaab00
+
+static void aspeed_write_smpboot(ARMCPU *cpu,
+                                 const struct arm_boot_info *info)
+{
+    static const uint32_t poll_mailbox_ready[] = {
+        /*
+         * r2 = per-cpu go sign value
+         * r1 = AST_SMP_MBOX_FIELD_ENTRY
+         * r0 = AST_SMP_MBOX_FIELD_GOSIGN
+         */
+        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
+        0xe21000ff,  /* ands    r0, r0, #255          */
+        0xe59f201c,  /* ldr     r2, [pc, #28]         */
+        0xe1822000,  /* orr     r2, r2, r0            */
+
+        0xe59f1018,  /* ldr     r1, [pc, #24]         */
+        0xe59f0018,  /* ldr     r0, [pc, #24]         */
+
+        0xe320f002,  /* wfe                           */
+        0xe5904000,  /* ldr     r4, [r0]              */
+        0xe1520004,  /* cmp     r2, r4                */
+        0x1afffffb,  /* bne     <wfe>                 */
+        0xe591f000,  /* ldr     pc, [r1]              */
+        AST_SMP_MBOX_GOSIGN,
+        AST_SMP_MBOX_FIELD_ENTRY,
+        AST_SMP_MBOX_FIELD_GOSIGN,
+    };
+
+    rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
+                       sizeof(poll_mailbox_ready),
+                       info->smp_loader_start);
+}
+
+static void aspeed_reset_secondary(ARMCPU *cpu,
+                                   const struct arm_boot_info *info)
+{
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+    CPUState *cs = CPU(cpu);
+
+    /* info->smp_bootreg_addr */
+    address_space_stl_notdirty(as, AST_SMP_MBOX_FIELD_GOSIGN, 0,
+                               MEMTXATTRS_UNSPECIFIED, NULL);
+    cpu_set_pc(cs, info->smp_loader_start);
+}
+
 #define FIRMWARE_ADDR 0x0
 
 static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
@@ -270,6 +322,19 @@ static void aspeed_machine_init(MachineState *machine)
         }
     }
 
+    if (machine->kernel_filename && bmc->soc.num_cpus > 1) {
+        /* With no u-boot we must set up a boot stub for the secondary CPU */
+        MemoryRegion *smpboot = g_new(MemoryRegion, 1);
+        memory_region_init_ram(smpboot, OBJECT(bmc), "aspeed.smpboot",
+                               0x80, &error_abort);
+        memory_region_add_subregion(get_system_memory(),
+                                    AST_SMP_MAILBOX_BASE, smpboot);
+
+        aspeed_board_binfo.write_secondary_boot = aspeed_write_smpboot;
+        aspeed_board_binfo.secondary_cpu_reset_hook = aspeed_reset_secondary;
+        aspeed_board_binfo.smp_loader_start = AST_SMP_MBOX_CODE;
+    }
+
     aspeed_board_binfo.ram_size = ram_size;
     aspeed_board_binfo.loader_start = sc->memmap[ASPEED_SDRAM];
     aspeed_board_binfo.nb_cpus = bmc->soc.num_cpus;
-- 
2.25.1

