Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2598008ejb;
        Wed, 25 Oct 2023 02:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk5kCAN8KQs1w8GGfVc+QPOCTDt/6cZuVETvfwnuQUFOHhH0oovr3dYpHAIOGL7+kB2JAA
X-Received: by 2002:a5d:4dcd:0:b0:32d:baf4:e56f with SMTP id f13-20020a5d4dcd000000b0032dbaf4e56fmr11373783wru.12.1698225034041;
        Wed, 25 Oct 2023 02:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698225034; cv=none;
        d=google.com; s=arc-20160816;
        b=gkXoKGpwOw7lrEtaxE+hQ+c6SzIwVeYFDu0PrRWdoOcWN6BnohOKZuQ1kAgeqKYMiy
         +TSMIXKZz+pAMw2u8Qgfp3qekBdMpo4HUt+0iK/2QuHNvYvdWxYlzmQZSX9TdgOxGYiK
         k6tmmeSpIUiJ85GvhM7Z1dotxhngVGC+FX86Pu/wNfUn+7FFvsu2zdh2C2qGcIuZ8n3H
         uF/wypZMn2HdeSSCXhwbcJ8Oc876x8heyHgicCPv6lBYjcLL9kiqZ4jxpbh2rcV4bp0I
         qIyjzezo6xlWLWI4eOxvP2O1PZKSQD3oL2u/hxtBNACdjyjtobND1cLGZBT0zLJWL0vb
         uVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:cc:to
         :from;
        bh=/O7DEt0WI+pQ5UStUGvRIMVrMS5IptNrAL0a1H7Nc/U=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=chSzjEBuHA8w1jU+ARFJlNMhF+bAKmkQACWoYWKd57SVPvGZjchSd5VVAXxFclw151
         AdCeU1uV2R6gFLWjRpHG0t47yku8PrtCRKah8B5F2Em7HgbNyI2Iy27qenA8/b+Mw9cN
         EoVUqW7syhUK3iKlV4S5wIRXvdAbd0bLApNhKPTSKj+QM9D1GqGYG4pqV+doDqpbwAw7
         ySC1/LKYjeZdWfhbE8cCotWqja0zS4fYfnLBf88Ws8rGLl3a8Bmunp3rgm5avLCNHbYa
         uB3Eg7mq5chhptEkxn37jFDhDbx4pWdkWqoAQYlZVAK6mm17mSSqvFdkeV9QEzypXN4b
         zCKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020adff40b000000b003231a9ac715si7077507wro.561.2023.10.25.02.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvZt2-000582-JH; Wed, 25 Oct 2023 05:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <duchao@eswincomputing.com>)
 id 1qvZPF-0008Rd-Iy; Wed, 25 Oct 2023 04:38:25 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <duchao@eswincomputing.com>)
 id 1qvZOy-0000i2-EJ; Wed, 25 Oct 2023 04:38:25 -0400
Received: from localhost.localdomain (unknown [10.12.130.31])
 by app1 (Coremail) with SMTP id TAJkCgCXCkfe0zhlwOwAAA--.8143S4;
 Wed, 25 Oct 2023 16:37:50 +0800 (CST)
From: Chao Du <duchao@eswincomputing.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: kvm64: remove a redundant KVM_CAP_SET_GUEST_DEBUG
 probe
Date: Wed, 25 Oct 2023 08:37:35 +0000
Message-Id: <20231025083735.25684-1-duchao@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: TAJkCgCXCkfe0zhlwOwAAA--.8143S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4DKw1DAw4fur4Uur17ZFb_yoW8tr1fp3
 Z3Crs3Jr4ktasxJw1xArsrZr13JrWkKwnFy34FvryrGasxKw15AFWvkrZ5CFyrurWI9r15
 tF4vyF4Sva1kXr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k20xvY
 0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-CM-SenderInfo: xgxfxt3r6h245lqf0zpsxwx03jof0z/
Received-SPF: permerror client-ip=129.150.39.64;
 envelope-from=duchao@eswincomputing.com; helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Oct 2023 05:09:10 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b8UbJ6+r6m+I

The KVM_CAP_SET_GUEST_DEBUG is probed during kvm_init().
gdbserver will fail to start if the CAP is not supported.
So no need to make another probe here, like other targets.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
---
 target/arm/kvm64.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4bb68646e4..b0bf59b5a1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -31,13 +31,9 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
 
-static bool have_guest_debug;
 
 void kvm_arm_init_debug(KVMState *s)
 {
-    have_guest_debug = kvm_check_extension(s,
-                                           KVM_CAP_SET_GUEST_DEBUG);
-
     max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
@@ -1140,33 +1136,23 @@ static const uint32_t brk_insn = 0xd4200000;
 
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
-    if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
-            return -EINVAL;
-        }
-        return 0;
-    } else {
-        error_report("guest debug not supported on this kernel");
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
         return -EINVAL;
     }
+    return 0;
 }
 
 int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static uint32_t brk;
 
-    if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
-            brk != brk_insn ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
-            return -EINVAL;
-        }
-        return 0;
-    } else {
-        error_report("guest debug not supported on this kernel");
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        brk != brk_insn ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
         return -EINVAL;
     }
+    return 0;
 }
 
 /* See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
-- 
2.17.1

