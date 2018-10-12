Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp896193wrt;
        Fri, 12 Oct 2018 07:43:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62WNmAQvkIF4oj+lNI2TxkHIBPw3nUO0731RIDBqxwtntxctLGvO6ogx44B3Vj1Q+PyQKhn
X-Received: by 2002:ac8:1b87:: with SMTP id z7-v6mr6085058qtj.321.1539355384023;
        Fri, 12 Oct 2018 07:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355384; cv=none;
        d=google.com; s=arc-20160816;
        b=TUnYnnB8Ha/c0pKMyRyQoD4gfKcQWFkBTrPyZ4emupy9o0duC+KTTyox3/xiSZoYJ2
         6VkCeQXjy0PGtv2Hb2nBysazHB3meY0JE0iHWVrAe8zzspWm95TIAL+DDz7EMsiG+iNY
         Hr8Zg8S10wkj2t//DgokMOPAhmSCkzx01DKFrdoOOSeSlmndxGqhDnX6sBZQgcTbmpmT
         P2M/k1brsoi/qObBFZjlgZFWtJKw/5NqU2T/qYZxd5rC7tQ019Alu8xLcU5/wuYq5kQr
         5shsLCUEQpl2gI9OCtbaofIKpEQrgxk8R1rkEGljk9D8x7/lAuQjjjDX9sCLVW1zuCyx
         +Vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=tlEhyYUCyTMXDXN6Dfk2vDOyKXMM5OHd4tq4KG9hpTg=;
        b=bUx/toN53oU1WIUKtY5R69tHMCilX3zp1ylOMWLQwCNdKGeBT8sVK36H1xYOA8cyQ9
         xJL0TkNWo3JQ1hef+4VgNivRXKdmU6j+u1PPyVeQDBQxGu0EqS68Rpp6tn9chs6+mhY7
         EIeamJpgRHgIq8HgGO0xkGJdEyVvX059CixtDh3Swe1BAU26/ZkRMD6kA/UroeF+n9aP
         WdTtK+0VUyE1Cer9hjQD/3A39ZcBvWfwSbWh/u59j3jjR/wA9ueL1y62i9tVYrL+pHYP
         0I3YEXvpKFLy7sFNTx+Evs1FoKFrvnf3PounXXuQNE9ysOGpiLDAXPY8herx/jMdxpfd
         iFqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u61-v6si515633qtd.122.2018.10.12.07.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyec-0007xq-Pb
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:43:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeK-0007xL-D3
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeJ-0002q8-FD
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeJ-0002ix-6W; Fri, 12 Oct 2018 10:42:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeF-0000No-GA; Fri, 12 Oct 2018 15:42:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:26 +0100
Message-Id: <20181012144235.19646-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/10] target/arm: Improve debug logging of
 AArch32 exception return
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKAXrllMjNvV

For AArch32, exception return happens through certain kinds
of CPSR write. We don't currently have any CPU_LOG_INT logging
of these events (unlike AArch64, where we log in the ERET
instruction). Add some suitable logging.

This will log exception returns like this:
Exception return from AArch32 hyp to usr PC 0x80100374

paralleling the existing logging in the exception_return
helper for AArch64 exception returns:
Exception return from AArch64 EL2 to AArch64 EL0 PC 0x8003045c
Exception return from AArch64 EL2 to AArch32 EL0 PC 0x8003045c

(Note that an AArch32 exception return can only be
AArch32->AArch32, never to AArch64.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 18 ++++++++++++++++++
 target/arm/helper.c    | 10 ++++++++++
 target/arm/translate.c |  7 +------
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a4fc709bcc7..abe4d73b59c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -840,4 +840,22 @@ static inline uint32_t v7m_sp_limit(CPUARMState *env)
     }
 }
 
+/**
+ * aarch32_mode_name(): Return name of the AArch32 CPU mode
+ * @psr: Program Status Register indicating CPU mode
+ *
+ * Returns, for debug logging purposes, a printable representation
+ * of the AArch32 CPU mode ("svc", "usr", etc) as indicated by
+ * the low bits of the specified PSR.
+ */
+static inline const char *aarch32_mode_name(uint32_t psr)
+{
+    static const char * const cpu_mode_names[16] = {
+        "usr", "fiq", "irq", "svc", "???", "???", "mon", "abt",
+        "???", "???", "hyp", "und", "???", "???", "???", "sys"
+    };
+
+    return cpu_mode_names[psr & 0xf];
+}
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3368e7edc5..0fa5ac0450f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6205,7 +6205,17 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 mask |= CPSR_IL;
                 val |= CPSR_IL;
             }
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Illegal AArch32 mode switch attempt from %s to %s\n",
+                          aarch32_mode_name(env->uncached_cpsr),
+                          aarch32_mode_name(val));
         } else {
+            qemu_log_mask(CPU_LOG_INT, "%s %s to %s PC 0x%" PRIx32 "\n",
+                          write_type == CPSRWriteExceptionReturn ?
+                          "Exception return from AArch32" :
+                          "AArch32 mode switch from",
+                          aarch32_mode_name(env->uncached_cpsr),
+                          aarch32_mode_name(val), env->regs[15]);
             switch_mode(env, val & CPSR_M);
         }
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1b4bacb522b..7c7d920e331 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -13092,11 +13092,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     translator_loop(ops, &dc.base, cpu, tb);
 }
 
-static const char *cpu_mode_names[16] = {
-  "usr", "fiq", "irq", "svc", "???", "???", "mon", "abt",
-  "???", "???", "hyp", "und", "???", "???", "???", "sys"
-};
-
 void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
                         int flags)
 {
@@ -13162,7 +13157,7 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
                     psr & CPSR_V ? 'V' : '-',
                     psr & CPSR_T ? 'T' : 'A',
                     ns_status,
-                    cpu_mode_names[psr & 0xf], (psr & 0x10) ? 32 : 26);
+                    aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
     }
 
     if (flags & CPU_DUMP_FPU) {
-- 
2.19.0

