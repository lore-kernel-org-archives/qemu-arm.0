Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp177514ejb;
        Mon, 3 Apr 2023 12:16:55 -0700 (PDT)
X-Received: by 2002:a1c:f617:0:b0:3e2:1368:e395 with SMTP id w23-20020a1cf617000000b003e21368e395mr315791wmc.33.1680549414882;
        Mon, 03 Apr 2023 12:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680549414; cv=none;
        d=google.com; s=arc-20160816;
        b=Gmfddr0GSVKTBbYQ+bCbn8GADP6KjkfcD4wfdXgY5RCpaOzgDzw8BoLfsSEDbMTSaz
         dwpttevw+iXApOAIsNGQnxj7FUd9VKufEftFkHmjEzdIiMC3wwu9O9OdNh3/8xWt2Voy
         U2iJnizgNbkpsxhK2vBdn4HCzWOUYIzpoa+FkoOLNo4dQ0UEF7gx7WU2eotqOPdbqk0z
         ewntEojs3GpAmNQDS3/L04hd1j9rape9orvgjIOh6z+IDb+ijAbUYpgbwpYNlgrkXvOQ
         68hE86sGRo9Gy7va2y6IyEaGeI9olx1cdUxpLW2GXJx6I5jX/4P2g9R5VaAilW0ReVQT
         1eAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/IaMF1z6V/jRhyeloiSvMgMTWqtakKC7euM/1/ilCrA=;
        b=cNqjKz8utfRUFnqDepkfbXHO9lVugxnsfIuTJaDu+/8C+0xi55pC03jfvk0Ipf2ddB
         Ugt60+Def+CpHaVkpKchAGj8DyjeVLtlF8faEZE6+RRGVg6PAUieLBXPv9UmjkFVw8HC
         s5Yl+THWSRSYtEwVEyY4st66e9x1CZq/dLLuyiUI79CstWYQ91WliCpcyMdBRUFYC0c4
         sVS6aSN9QYYbR1WfTuavwpBqm4wOWJEgak9ZUMFLBa+vYWIvYs2d77B/OnF6KrDdOFDz
         HBe0O5tResijCoJiydCjL92inD7StaBUTiq9E/R+4TsuS+d0zlbj/FLq6Bgrtz6+HtZ4
         91Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=eaTra0vA;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t15-20020a1c770f000000b003dc49e01321sor3203997wmi.25.2023.04.03.12.16.54
        (Google Transport Security);
        Mon, 03 Apr 2023 12:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=eaTra0vA;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680549414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IaMF1z6V/jRhyeloiSvMgMTWqtakKC7euM/1/ilCrA=;
        b=eaTra0vApVo1x2Z4ySucguRESXXQNDITIWd4Fx99VvRSGXDgaQ0CI2KQH18JXm8y7e
         2wnu1VDJNCIwoZLmSAm1mbrokUBYk+S1qwYKRLtQBsYhKDV76f+MqXZVs5g6C9lH9cFK
         /jUCBDORUtNCwMP4TpbqO3xHhSashsGw4mvZd1pyCtJI8cf7LJ4jELiAYoyow8u9VrhR
         5rVWpWoUtvZxiUZUGOjKaxQ6ckaQ5dNARb1nuyUMJRRIumfheQldTOvvJAg4Sg3IvOF3
         QHZ6cZ5LMe7tlhMlIbbVaPaRyW/7db6NVyNNvAKy57wsEtTUwkmT2P+wZHlexbIvhRrK
         sFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IaMF1z6V/jRhyeloiSvMgMTWqtakKC7euM/1/ilCrA=;
        b=CP//E4fh/4RZnhascKq17OSKRI9UAUvbZ12pv1Z8W+pc1pw/xum56abxVXxmntdE2o
         9DZMz1ZXwKLqnIDwNkEBXzIyQw+Sw6IGsB2vPqi4y8tif3dM8l8Q2B5lEBvV6kYtPR+y
         ztDsIpLHKh15ljQT+KJ3+3v27XN8LT1Zr1ZMZY3CO6yr5DJwzYA9v4eEAZoKlxgRIPNI
         Lz0xH3iTp0GVaTPOONsfHU17jA2XTa6CSxp+oBz1Y1M4hOzIZpt67DIzKGcnLuLhJooi
         57XJKBVJKDJtLF0SlrqTHoRJ47zs++vMHRWsZE981Uqg9ggdM7m7bRMSHpAisUAkySlf
         Kibg==
X-Gm-Message-State: AAQBX9djjeEktCFqWUn5sZ07afU5o37kysensNXYFJMAWQYQ/nOrSJpO
	g4ObTHkD02g5zytxWNHqTrI=
X-Google-Smtp-Source: AKy350aes5WhElE49SYAFjkBO7ZMndzGgY1IGdaaW3hjrIuUHitGdsp/fTxb+N6jtwGXeEQ/C3bcjA==
X-Received: by 2002:a7b:c384:0:b0:3e9:f15b:935b with SMTP id s4-20020a7bc384000000b003e9f15b935bmr330078wmj.32.1680549414129;
        Mon, 03 Apr 2023 12:16:54 -0700 (PDT)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.lan (233.87.95.79.rev.sfr.net. [79.95.87.233])
        by smtp.gmail.com with ESMTPSA id t6-20020a7bc3c6000000b003ee1b2ab9a0sm12801051wmj.11.2023.04.03.12.16.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Apr 2023 12:16:53 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v4 1/2] arm: move KVM breakpoints helpers
Date: Mon,  3 Apr 2023 21:15:59 +0200
Message-Id: <20230403191600.43487-2-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403191600.43487-1-fcagnin@quarkslab.com>
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hNwtbdA0akEC

From: Francesco Cagnin <fcagnin@quarkslab.com>

These helpers will be also used for HVF. Aside from reformatting a
couple of comments for 'checkpatch.pl' and updating meson to compile
'hyp_gdbstub.c', this is just code motion.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/hyp_gdbstub.c | 253 +++++++++++++++++++++++++++++++++++
 target/arm/internals.h   |  50 +++++++
 target/arm/kvm64.c       | 276 ---------------------------------------
 target/arm/meson.build   |   3 +-
 4 files changed, 305 insertions(+), 277 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
new file mode 100644
index 0000000000..ebde2899cd
--- /dev/null
+++ b/target/arm/hyp_gdbstub.c
@@ -0,0 +1,253 @@
+/*
+ * ARM implementation of KVM and HVF hooks, 64 bit specific code
+ *
+ * Copyright Mian-M. Hamayun 2013, Virtual Open Systems
+ * Copyright Alex Bennée 2014, Linaro
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/gdbstub.h"
+
+/* Maximum and current break/watch point counts */
+int max_hw_bps, max_hw_wps;
+GArray *hw_breakpoints, *hw_watchpoints;
+
+/**
+ * insert_hw_breakpoint()
+ * @addr: address of breakpoint
+ *
+ * See ARM ARM D2.9.1 for details but here we are only going to create
+ * simple un-linked breakpoints (i.e. we don't chain breakpoints
+ * together to match address and context or vmid). The hardware is
+ * capable of fancier matching but that will require exposing that
+ * fanciness to GDB's interface
+ *
+ * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
+ *
+ *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
+ * +------+------+-------+-----+----+------+-----+------+-----+---+
+ * | RES0 |  BT  |  LBN  | SSC | HMC| RES0 | BAS | RES0 | PMC | E |
+ * +------+------+-------+-----+----+------+-----+------+-----+---+
+ *
+ * BT: Breakpoint type (0 = unlinked address match)
+ * LBN: Linked BP number (0 = unused)
+ * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
+ * BAS: Byte Address Select (RES1 for AArch64)
+ * E: Enable bit
+ *
+ * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
+ *
+ *  63  53 52       49 48       2  1 0
+ * +------+-----------+----------+-----+
+ * | RESS | VA[52:49] | VA[48:2] | 0 0 |
+ * +------+-----------+----------+-----+
+ *
+ * Depending on the addressing mode bits the top bits of the register
+ * are a sign extension of the highest applicable VA bit. Some
+ * versions of GDB don't do it correctly so we ensure they are correct
+ * here so future PC comparisons will work properly.
+ */
+
+int insert_hw_breakpoint(target_ulong addr)
+{
+    HWBreakpoint brk = {
+        .bcr = 0x1,                             /* BCR E=1, enable */
+        .bvr = sextract64(addr, 0, 53)
+    };
+
+    if (cur_hw_bps >= max_hw_bps) {
+        return -ENOBUFS;
+    }
+
+    brk.bcr = deposit32(brk.bcr, 1, 2, 0x3);   /* PMC = 11 */
+    brk.bcr = deposit32(brk.bcr, 5, 4, 0xf);   /* BAS = RES1 */
+
+    g_array_append_val(hw_breakpoints, brk);
+
+    return 0;
+}
+
+/**
+ * delete_hw_breakpoint()
+ * @pc: address of breakpoint
+ *
+ * Delete a breakpoint and shuffle any above down
+ */
+
+int delete_hw_breakpoint(target_ulong pc)
+{
+    int i;
+    for (i = 0; i < hw_breakpoints->len; i++) {
+        HWBreakpoint *brk = get_hw_bp(i);
+        if (brk->bvr == pc) {
+            g_array_remove_index(hw_breakpoints, i);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+/**
+ * insert_hw_watchpoint()
+ * @addr: address of watch point
+ * @len: size of area
+ * @type: type of watch point
+ *
+ * See ARM ARM D2.10. As with the breakpoints we can do some advanced
+ * stuff if we want to. The watch points can be linked with the break
+ * points above to make them context aware. However for simplicity
+ * currently we only deal with simple read/write watch points.
+ *
+ * D7.3.11 DBGWCR<n>_EL1, Debug Watchpoint Control Registers
+ *
+ *  31  29 28   24 23  21  20  19 16 15 14  13   12  5 4   3 2   1  0
+ * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
+ * | RES0 |  MASK | RES0 | WT | LBN | SSC | HMC | BAS | LSC | PAC | E |
+ * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
+ *
+ * MASK: num bits addr mask (0=none,01/10=res,11=3 bits (8 bytes))
+ * WT: 0 - unlinked, 1 - linked (not currently used)
+ * LBN: Linked BP number (not currently used)
+ * SSC/HMC/PAC: Security, Higher and Priv access control (Table D2-11)
+ * BAS: Byte Address Select
+ * LSC: Load/Store control (01: load, 10: store, 11: both)
+ * E: Enable
+ *
+ * The bottom 2 bits of the value register are masked. Therefore to
+ * break on any sizes smaller than an unaligned word you need to set
+ * MASK=0, BAS=bit per byte in question. For larger regions (^2) you
+ * need to ensure you mask the address as required and set BAS=0xff
+ */
+
+int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
+{
+    HWWatchpoint wp = {
+        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
+        .wvr = addr & (~0x7ULL),
+        .details = { .vaddr = addr, .len = len }
+    };
+
+    if (cur_hw_wps >= max_hw_wps) {
+        return -ENOBUFS;
+    }
+
+    /*
+     * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
+     * valid whether EL3 is implemented or not
+     */
+    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
+
+    switch (type) {
+    case GDB_WATCHPOINT_READ:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
+        wp.details.flags = BP_MEM_READ;
+        break;
+    case GDB_WATCHPOINT_WRITE:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
+        wp.details.flags = BP_MEM_WRITE;
+        break;
+    case GDB_WATCHPOINT_ACCESS:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
+        wp.details.flags = BP_MEM_ACCESS;
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    if (len <= 8) {
+        /* we align the address and set the bits in BAS */
+        int off = addr & 0x7;
+        int bas = (1 << len) - 1;
+
+        wp.wcr = deposit32(wp.wcr, 5 + off, 8 - off, bas);
+    } else {
+        /* For ranges above 8 bytes we need to be a power of 2 */
+        if (is_power_of_2(len)) {
+            int bits = ctz64(len);
+
+            wp.wvr &= ~((1 << bits) - 1);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
+        } else {
+            return -ENOBUFS;
+        }
+    }
+
+    g_array_append_val(hw_watchpoints, wp);
+    return 0;
+}
+
+bool check_watchpoint_in_range(int i, target_ulong addr)
+{
+    HWWatchpoint *wp = get_hw_wp(i);
+    uint64_t addr_top, addr_bottom = wp->wvr;
+    int bas = extract32(wp->wcr, 5, 8);
+    int mask = extract32(wp->wcr, 24, 4);
+
+    if (mask) {
+        addr_top = addr_bottom + (1 << mask);
+    } else {
+        /*
+         * BAS must be contiguous but can offset against the base
+         * address in DBGWVR
+         */
+        addr_bottom = addr_bottom + ctz32(bas);
+        addr_top = addr_bottom + clo32(bas);
+    }
+
+    if (addr >= addr_bottom && addr <= addr_top) {
+        return true;
+    }
+
+    return false;
+}
+
+/**
+ * delete_hw_watchpoint()
+ * @addr: address of breakpoint
+ *
+ * Delete a breakpoint and shuffle any above down
+ */
+
+int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type)
+{
+    int i;
+    for (i = 0; i < cur_hw_wps; i++) {
+        if (check_watchpoint_in_range(i, addr)) {
+            g_array_remove_index(hw_watchpoints, i);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+{
+    int i;
+
+    for (i = 0; i < cur_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        if (bp->bvr == pc) {
+            return true;
+        }
+    }
+    return false;
+}
+
+CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
+{
+    int i;
+
+    for (i = 0; i < cur_hw_wps; i++) {
+        if (check_watchpoint_in_range(i, addr)) {
+            return &get_hw_wp(i)->details;
+        }
+    }
+    return NULL;
+}
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 673519a24a..e0878a6329 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1434,4 +1434,54 @@ static inline bool arm_fgt_active(CPUARMState *env, int el)
 }
 
 void assert_hflags_rebuild_correctly(CPUARMState *env);
+
+/*
+ * Although the ARM implementation of hardware assisted debugging
+ * allows for different breakpoints per-core, the current GDB
+ * interface treats them as a global pool of registers (which seems to
+ * be the case for x86, ppc and s390). As a result we store one copy
+ * of registers which is used for all active cores.
+ *
+ * Write access is serialised by virtue of the GDB protocol which
+ * updates things. Read access (i.e. when the values are copied to the
+ * vCPU) is also gated by GDB's run control.
+ *
+ * This is not unreasonable as most of the time debugging kernels you
+ * never know which core will eventually execute your function.
+ */
+
+typedef struct {
+    uint64_t bcr;
+    uint64_t bvr;
+} HWBreakpoint;
+
+/*
+ * The watchpoint registers can cover more area than the requested
+ * watchpoint so we need to store the additional information
+ * somewhere. We also need to supply a CPUWatchpoint to the GDB stub
+ * when the watchpoint is hit.
+ */
+typedef struct {
+    uint64_t wcr;
+    uint64_t wvr;
+    CPUWatchpoint details;
+} HWWatchpoint;
+
+/* Maximum and current break/watch point counts */
+extern int max_hw_bps, max_hw_wps;
+extern GArray *hw_breakpoints, *hw_watchpoints;
+
+#define cur_hw_wps      (hw_watchpoints->len)
+#define cur_hw_bps      (hw_breakpoints->len)
+#define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
+#define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
+
+bool find_hw_breakpoint(CPUState *cpu, target_ulong pc);
+int insert_hw_breakpoint(target_ulong pc);
+int delete_hw_breakpoint(target_ulong pc);
+
+bool check_watchpoint_in_range(int i, target_ulong addr);
+CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr);
+int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type);
+int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type);
 #endif
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..fb7bb65947 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -34,46 +34,6 @@
 
 static bool have_guest_debug;
 
-/*
- * Although the ARM implementation of hardware assisted debugging
- * allows for different breakpoints per-core, the current GDB
- * interface treats them as a global pool of registers (which seems to
- * be the case for x86, ppc and s390). As a result we store one copy
- * of registers which is used for all active cores.
- *
- * Write access is serialised by virtue of the GDB protocol which
- * updates things. Read access (i.e. when the values are copied to the
- * vCPU) is also gated by GDB's run control.
- *
- * This is not unreasonable as most of the time debugging kernels you
- * never know which core will eventually execute your function.
- */
-
-typedef struct {
-    uint64_t bcr;
-    uint64_t bvr;
-} HWBreakpoint;
-
-/* The watchpoint registers can cover more area than the requested
- * watchpoint so we need to store the additional information
- * somewhere. We also need to supply a CPUWatchpoint to the GDB stub
- * when the watchpoint is hit.
- */
-typedef struct {
-    uint64_t wcr;
-    uint64_t wvr;
-    CPUWatchpoint details;
-} HWWatchpoint;
-
-/* Maximum and current break/watch point counts */
-int max_hw_bps, max_hw_wps;
-GArray *hw_breakpoints, *hw_watchpoints;
-
-#define cur_hw_wps      (hw_watchpoints->len)
-#define cur_hw_bps      (hw_breakpoints->len)
-#define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
-#define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
-
 /**
  * kvm_arm_init_debug() - check for guest debug capabilities
  * @cs: CPUState
@@ -97,217 +57,6 @@ static void kvm_arm_init_debug(CPUState *cs)
     return;
 }
 
-/**
- * insert_hw_breakpoint()
- * @addr: address of breakpoint
- *
- * See ARM ARM D2.9.1 for details but here we are only going to create
- * simple un-linked breakpoints (i.e. we don't chain breakpoints
- * together to match address and context or vmid). The hardware is
- * capable of fancier matching but that will require exposing that
- * fanciness to GDB's interface
- *
- * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
- *
- *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
- * +------+------+-------+-----+----+------+-----+------+-----+---+
- * | RES0 |  BT  |  LBN  | SSC | HMC| RES0 | BAS | RES0 | PMC | E |
- * +------+------+-------+-----+----+------+-----+------+-----+---+
- *
- * BT: Breakpoint type (0 = unlinked address match)
- * LBN: Linked BP number (0 = unused)
- * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
- * BAS: Byte Address Select (RES1 for AArch64)
- * E: Enable bit
- *
- * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
- *
- *  63  53 52       49 48       2  1 0
- * +------+-----------+----------+-----+
- * | RESS | VA[52:49] | VA[48:2] | 0 0 |
- * +------+-----------+----------+-----+
- *
- * Depending on the addressing mode bits the top bits of the register
- * are a sign extension of the highest applicable VA bit. Some
- * versions of GDB don't do it correctly so we ensure they are correct
- * here so future PC comparisons will work properly.
- */
-
-static int insert_hw_breakpoint(target_ulong addr)
-{
-    HWBreakpoint brk = {
-        .bcr = 0x1,                             /* BCR E=1, enable */
-        .bvr = sextract64(addr, 0, 53)
-    };
-
-    if (cur_hw_bps >= max_hw_bps) {
-        return -ENOBUFS;
-    }
-
-    brk.bcr = deposit32(brk.bcr, 1, 2, 0x3);   /* PMC = 11 */
-    brk.bcr = deposit32(brk.bcr, 5, 4, 0xf);   /* BAS = RES1 */
-
-    g_array_append_val(hw_breakpoints, brk);
-
-    return 0;
-}
-
-/**
- * delete_hw_breakpoint()
- * @pc: address of breakpoint
- *
- * Delete a breakpoint and shuffle any above down
- */
-
-static int delete_hw_breakpoint(target_ulong pc)
-{
-    int i;
-    for (i = 0; i < hw_breakpoints->len; i++) {
-        HWBreakpoint *brk = get_hw_bp(i);
-        if (brk->bvr == pc) {
-            g_array_remove_index(hw_breakpoints, i);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-/**
- * insert_hw_watchpoint()
- * @addr: address of watch point
- * @len: size of area
- * @type: type of watch point
- *
- * See ARM ARM D2.10. As with the breakpoints we can do some advanced
- * stuff if we want to. The watch points can be linked with the break
- * points above to make them context aware. However for simplicity
- * currently we only deal with simple read/write watch points.
- *
- * D7.3.11 DBGWCR<n>_EL1, Debug Watchpoint Control Registers
- *
- *  31  29 28   24 23  21  20  19 16 15 14  13   12  5 4   3 2   1  0
- * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
- * | RES0 |  MASK | RES0 | WT | LBN | SSC | HMC | BAS | LSC | PAC | E |
- * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
- *
- * MASK: num bits addr mask (0=none,01/10=res,11=3 bits (8 bytes))
- * WT: 0 - unlinked, 1 - linked (not currently used)
- * LBN: Linked BP number (not currently used)
- * SSC/HMC/PAC: Security, Higher and Priv access control (Table D2-11)
- * BAS: Byte Address Select
- * LSC: Load/Store control (01: load, 10: store, 11: both)
- * E: Enable
- *
- * The bottom 2 bits of the value register are masked. Therefore to
- * break on any sizes smaller than an unaligned word you need to set
- * MASK=0, BAS=bit per byte in question. For larger regions (^2) you
- * need to ensure you mask the address as required and set BAS=0xff
- */
-
-static int insert_hw_watchpoint(target_ulong addr,
-                                target_ulong len, int type)
-{
-    HWWatchpoint wp = {
-        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
-        .wvr = addr & (~0x7ULL),
-        .details = { .vaddr = addr, .len = len }
-    };
-
-    if (cur_hw_wps >= max_hw_wps) {
-        return -ENOBUFS;
-    }
-
-    /*
-     * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
-     * valid whether EL3 is implemented or not
-     */
-    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
-
-    switch (type) {
-    case GDB_WATCHPOINT_READ:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
-        wp.details.flags = BP_MEM_READ;
-        break;
-    case GDB_WATCHPOINT_WRITE:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
-        wp.details.flags = BP_MEM_WRITE;
-        break;
-    case GDB_WATCHPOINT_ACCESS:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
-        wp.details.flags = BP_MEM_ACCESS;
-        break;
-    default:
-        g_assert_not_reached();
-        break;
-    }
-    if (len <= 8) {
-        /* we align the address and set the bits in BAS */
-        int off = addr & 0x7;
-        int bas = (1 << len) - 1;
-
-        wp.wcr = deposit32(wp.wcr, 5 + off, 8 - off, bas);
-    } else {
-        /* For ranges above 8 bytes we need to be a power of 2 */
-        if (is_power_of_2(len)) {
-            int bits = ctz64(len);
-
-            wp.wvr &= ~((1 << bits) - 1);
-            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
-            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
-        } else {
-            return -ENOBUFS;
-        }
-    }
-
-    g_array_append_val(hw_watchpoints, wp);
-    return 0;
-}
-
-
-static bool check_watchpoint_in_range(int i, target_ulong addr)
-{
-    HWWatchpoint *wp = get_hw_wp(i);
-    uint64_t addr_top, addr_bottom = wp->wvr;
-    int bas = extract32(wp->wcr, 5, 8);
-    int mask = extract32(wp->wcr, 24, 4);
-
-    if (mask) {
-        addr_top = addr_bottom + (1 << mask);
-    } else {
-        /* BAS must be contiguous but can offset against the base
-         * address in DBGWVR */
-        addr_bottom = addr_bottom + ctz32(bas);
-        addr_top = addr_bottom + clo32(bas);
-    }
-
-    if (addr >= addr_bottom && addr <= addr_top) {
-        return true;
-    }
-
-    return false;
-}
-
-/**
- * delete_hw_watchpoint()
- * @addr: address of breakpoint
- *
- * Delete a breakpoint and shuffle any above down
- */
-
-static int delete_hw_watchpoint(target_ulong addr,
-                                target_ulong len, int type)
-{
-    int i;
-    for (i = 0; i < cur_hw_wps; i++) {
-        if (check_watchpoint_in_range(i, addr)) {
-            g_array_remove_index(hw_watchpoints, i);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-
 int kvm_arch_insert_hw_breakpoint(target_ulong addr,
                                   target_ulong len, int type)
 {
@@ -372,31 +121,6 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
 
-static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
-{
-    int i;
-
-    for (i = 0; i < cur_hw_bps; i++) {
-        HWBreakpoint *bp = get_hw_bp(i);
-        if (bp->bvr == pc) {
-            return true;
-        }
-    }
-    return false;
-}
-
-static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
-{
-    int i;
-
-    for (i = 0; i < cur_hw_wps; i++) {
-        if (check_watchpoint_in_range(i, addr)) {
-            return &get_hw_wp(i)->details;
-        }
-    }
-    return NULL;
-}
-
 static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
                                     const char *name)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6226098ad5..a21f349b59 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -9,7 +9,8 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-- 
2.40.0
