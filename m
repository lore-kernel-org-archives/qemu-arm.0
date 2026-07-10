Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3994EC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIF2-0001bG-Al; Fri, 10 Jul 2026 16:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF1-0001Z9-GF
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:35 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEo-0000kh-HU
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:34 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-84864b41100so1173799b3a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716861; x=1784321661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9b7zTETWU90o56GcX57svy4revXN3qZdBYXrx4oYXfA=;
 b=YNqTHRTdrERMIIJfD8UxOqF0hYvmFQ64eCYxJy05/PSJB6sPhbguUY7SVCdrGMXFyB
 zz8WTZnxn9GNNGnpLnG0QyNY6LbFc3oi3sccENFYyu4hISfztHWTtWBtZEli31mJa3g+
 aM2zwmrNq1PGu2whbavryzv2H2gyt8i3YOSb0XsaU4Zm8JrA3HVFf056o05JWH3a7VO9
 eNX92ugdo2042ifgCbL2Ud83NqgN/UHZ1jXgDIsyaBWSkVHBpO6NABTC8HdqYTsrhO5i
 49J7VDydY/mKGI9nzauFY/oVmJv82mI0Hz2+MwZpLlF2y4+Nn/PxgA/M5y87hyk99vgc
 YAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716861; x=1784321661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9b7zTETWU90o56GcX57svy4revXN3qZdBYXrx4oYXfA=;
 b=JhUga9qmz45Jg7qoBvROFzPJEuzae5BXu9t/+ECMCaX/SI8MmRPv9JZvdGMjzsIbrw
 PZfLmsPwB3joCeN1r07fJi424dEqG+sEW20AliVE0wSAkDq5z5mCUuE1bq3+ahvoT4V5
 uqlxbCLkR0e26FF9XvaCfw60BSfacGiAo7er0aGdlGSTV2OMt7fpFYSYoqcdwY6dZdRu
 Ms/c8QeIkc3wJUoDVB57cbZwZAwvcU9anGDnYIwIJ+L7jLnE/g+K4YAY5zjDD4SQGSMm
 nqGTwLKOlaVj793fENxBffaem+WIjVd3NfaafPKRUBBz2uqNbiQ0EmCnKRvYbk7CO8L5
 Rdsg==
X-Gm-Message-State: AOJu0YxmXnmUyL4hIrnSXeF/7vGaqUW43Iiyb0P7T6WpP/hYwtdCnwcF
 qamtMOkV6FEWJhWaTDsL575pZWVK/mZIANQWf+ofsvOyA8g+q449KTYpNkHb6lqISpI=
X-Gm-Gg: AfdE7clJjak1Uc7gbVgle7PXqHHs6MfIN8E5aQC7ZB2/yFpzvbFILG9X0xadqmyWpUC
 JQClqhJ8CZqrgYdS0BWOsYplTY3BT0bAg6FIlptXVUCAyYubssYx7p2BBCHrhnGhnK9eG+RWe8n
 +QSkbjyJwh6NYPt2o+/Mq88orNPf2SYop89ckuoVSPknbckJGO8llBUTldbsvUssrSNb1TCzY7A
 YNOydze0Rdbt/tz+pyJEM0QT7wM9/k6sOWP5bJk6VZtEr17ZIj8MCnyLI9KeMY7NL6MF77DrRSo
 j3kBAl6Q6hkQqi2zz4S7gqp4SmOY+YHcbxXPa71l515ZQUXFxLVUywMyOjrENljZv+kmOYYVlbv
 1cBe8rnLFs6ctG+fmrbTnA3Rp9dZ7Y3ZSxFn9tcRqkVqhk5781AWIK7KCQ4NEtclHWVxdJOhR1k
 DCc45qK3EmVjagF3crDw==
X-Received: by 2002:a05:6a00:b47:b0:837:e9cc:d474 with SMTP id
 d2e1a72fcca58-8488974f808mr577808b3a.2.1783716861043; 
 Fri, 10 Jul 2026 13:54:21 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 17/51] gdbstub: Report actual watchpoint trigger address
Date: Fri, 10 Jul 2026 13:53:27 -0700
Message-ID: <20260710205401.836304-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

While gdb doesn't care either way, it seems more correct to
report the address of the watchpoint hit, rather than the
beginning of the watchpoint region.

Adjust all virtualization hosts which construct a dummy
CPUWatchpoint structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/system.c       | 4 ++--
 target/arm/hvf/hvf.c   | 1 +
 target/arm/kvm.c       | 1 +
 target/i386/kvm/kvm.c  | 4 ++--
 target/ppc/kvm.c       | 4 ++--
 target/s390x/kvm/kvm.c | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/gdbstub/system.c b/gdbstub/system.c
index 724fd24c00..b36e957b95 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -166,10 +166,10 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
             }
             trace_gdbstub_hit_watchpoint(type,
                                          gdb_get_cpu_index(cpu),
-                                         cpu->watchpoint_hit->vaddr);
+                                         cpu->watchpoint_hit->hitaddr);
             g_string_printf(buf, "T%02xthread:%s;%swatch:%" VADDR_PRIx ";",
                             GDB_SIGNAL_TRAP, tid->str, type,
-                            cpu->watchpoint_hit->vaddr);
+                            cpu->watchpoint_hit->hitaddr);
             cpu->watchpoint_hit = NULL;
             goto send_packet;
         } else {
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index da3ec521fc..70edb2f219 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2375,6 +2375,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         if (!wp) {
             error_report("EXCP_DEBUG but unknown hw watchpoint");
         }
+        wp->hitaddr = excp->virtual_address;
         cpu->watchpoint_hit = wp;
         break;
     }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d40a6a9859..ebe4ecbb77 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1519,6 +1519,7 @@ static bool kvm_arm_handle_debug(ARMCPU *cpu,
     {
         CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
         if (wp) {
+            wp->hitaddr = debug_exit->far;
             cs->watchpoint_hit = wp;
             return true;
         }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 8161831de2..51ff5cd767 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -6264,13 +6264,13 @@ static int kvm_handle_debug(X86CPU *cpu,
                     case 0x1:
                         ret = EXCP_DEBUG;
                         cs->watchpoint_hit = &hw_watchpoint;
-                        hw_watchpoint.vaddr = hw_breakpoint[n].addr;
+                        hw_watchpoint.hitaddr = hw_breakpoint[n].addr;
                         hw_watchpoint.flags = BP_MEM_WRITE;
                         break;
                     case 0x3:
                         ret = EXCP_DEBUG;
                         cs->watchpoint_hit = &hw_watchpoint;
-                        hw_watchpoint.vaddr = hw_breakpoint[n].addr;
+                        hw_watchpoint.hitaddr = hw_breakpoint[n].addr;
                         hw_watchpoint.flags = BP_MEM_ACCESS;
                         break;
                     }
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 1a093e1f83..2a98ed89c8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1589,11 +1589,11 @@ static int kvm_handle_hw_breakpoint(CPUState *cs,
                                         KVMPPC_DEBUG_WATCH_WRITE)) {
             BreakpointFlags flag = 0;
 
-            n = find_hw_watchpoint(arch_info->address,  &flag);
+            n = find_hw_watchpoint(arch_info->address, &flag);
             if (n >= 0) {
                 handle = DEBUG_RETURN_GDB;
                 cs->watchpoint_hit = &hw_watchpoint;
-                hw_watchpoint.vaddr = hw_debug_points[n].addr;
+                hw_watchpoint.hitaddr = arch_info->address;
                 hw_watchpoint.flags = flag;
             }
         }
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6f7f75f601..89e90a84ec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1864,7 +1864,7 @@ static int kvm_arch_handle_debug_exit(S390CPU *cpu)
     case KVM_HW_WP_WRITE:
         if (find_hw_breakpoint(arch_info->addr, -1, arch_info->type)) {
             cs->watchpoint_hit = &hw_watchpoint;
-            hw_watchpoint.vaddr = arch_info->addr;
+            hw_watchpoint.hitaddr = arch_info->addr;
             hw_watchpoint.flags = BP_MEM_WRITE;
             ret = EXCP_DEBUG;
         }
-- 
2.43.0


