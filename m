Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4878484lfi;
        Tue, 7 Apr 2020 00:25:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypLOEYVASFL0s1R9HwdrivHzbh3k+VwVpoDHMrSJV/mwaxim5oIgVWnWFdrVLNkPpnmXTZGx
X-Received: by 2002:a37:7107:: with SMTP id m7mr855491qkc.90.1586244357922;
        Tue, 07 Apr 2020 00:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586244357; cv=none;
        d=google.com; s=arc-20160816;
        b=kdILWqkfh7j64+FrLLX/4uK3jpRUX6ZwFkqUPk/DwN8HWLcCU0kBqCiCc+0MWCek8E
         2a+jrsbzhi53XkIQzrzCmIfvbHKMyjWpF0dvnUXzsUt9c7Ji2LF+PNw4Y46L+KSl9LZL
         XFvNWxzi1orsvWrmSBTWZ1FiFOG3wwM0tNz7L7mo5h8gimjM0BfFdhOHS8wmzpMH0yL6
         CXI6uvCpLqEWK/tVYmwOlbQ74Pax/Yh7Hi5FhfgaajIWM0/UXz/VuJ3KBZL0UR8hK5y0
         1KbW6hHrhWYcddkbf2MMNHh8Sn7C+QQ8AN+ZBtbXhRCgGu1JZzzt/M8jH/1e1Cg6WEDi
         KqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xSQjae3iHp8vDRdLTBEjdVkFcRaIif/B6y8hlJTqhks=;
        b=l76yz+cn89o92akbwbffXCRd7MlV/i3NzjQsjcZElzVCzfLHZ9ueRUSl0yomr7ng78
         cQ1dD1K+JIsCr7pVu7A1xbIdPrNpxQiOcusd75JrLAIM0cI2VEq5jGxBCj27GLxlUWAp
         fGpKQrd3/Ngqgy6/aDTS/F7MznfaN2CCXLlVMpiOnaNE50QvF1rJ1hy+s8Zw4TyPgC1u
         SvLJrLE+1u8ICt4oSU38x6b9UIxYjOdCzsTruwzq3ofJ41ZJwF00dT3KQC3bK2zOTL8b
         u4GDSClEc9bwrX15UbqCueeFNwQ6SYkriTYQeX9GdskGdhzRYeGbaQdnWa5dqKQG37HY
         xwTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="W/3Bn1gT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x45si1362546qvf.6.2020.04.07.00.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 00:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="W/3Bn1gT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLicP-0005Oj-8u
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 03:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1jLic0-0005OS-Mm
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 03:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1jLibz-0003CH-FT
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 03:25:32 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38695)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1jLibz-0003AB-9o; Tue, 07 Apr 2020 03:25:31 -0400
Received: by mail-pg1-x543.google.com with SMTP id m17so1298316pgj.5;
 Tue, 07 Apr 2020 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xSQjae3iHp8vDRdLTBEjdVkFcRaIif/B6y8hlJTqhks=;
 b=W/3Bn1gTxVlm6EolmJPogDFtbHGj29NTffMytH1J0dkzzc4idq8uDlZJ6uFVPthMp1
 hoyjaXfksqCE+ixUmxa+/ZAHy9xkuib1qq5ZVMOuPmNuc90MjSO2J03MppN32auN4/zs
 +pjC+u6GuH74KtYqfwdvN+70vb1BUMS7yxxB18OLNLl+RKKjaINt0qm/gu4dv3fSb3m1
 P3ZTBxAQA5cLrb3KOfhgob6vZyXWnKKCszI9d1HRka57jaav6jUz31R1GotnBRHm6VQs
 LMnju+j83C9M8BxNs9pp/WtodNXtu17RXBSAqIZ0CrgZJosq8233/Hrz4/JY0fKAWdcv
 M0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xSQjae3iHp8vDRdLTBEjdVkFcRaIif/B6y8hlJTqhks=;
 b=SF080vFbGbc4F/zcPhnjJkRsoKsO2zUt/HoNlYFAV8/9eYGyjuXYsFgor0HbqW4U8Q
 vbubaM2AMx5bSb3WynkSh6e6aL7tvKpxUoBqey6sS02D/w54TSpVCkfTDff4W7wIwjjh
 D75vn/+yDAMex73lBhD4pOZ6RAabQO9roUiNom0RMAbSGI42M5SnpFFsInMzHkOPwzuT
 41G3ttq+dmVc5kuYCXcR2aZuHXxpv/eZ9znj85gnJ9qvqCXZypEV8lTM7UhkRKrOUGlT
 ZJGIlmp4FJ3A4p4PXBIPYEnByjziV6IO406ck5ywmCEPE+lpM9msTXABohR0VLC2g86S
 YxbA==
X-Gm-Message-State: AGi0PuaNc9WIopxbGTJ3sIpdnzh2WTEzzgNj4azPmdrbmmb9D4bD+OaV
 oNKX6nhbfidcFMOySlSBhyA=
X-Received: by 2002:a62:e515:: with SMTP id n21mr1291117pff.103.1586244329822; 
 Tue, 07 Apr 2020 00:25:29 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id 189sm13177249pfg.170.2020.04.07.00.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 00:25:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] aspeed: Add boot stub for smp booting
Date: Tue,  7 Apr 2020 16:55:17 +0930
Message-Id: <20200407072517.671521-1-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xw7+fFJwdYHK

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

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a6a2102a93cb..bc4386cc6174 100644
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
 
+    if (machine->kernel_filename) {
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

