Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp834115lfg;
        Tue, 17 Aug 2021 13:19:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2W9lvG+LgtXxJ0zueytT9xS8hLe3P3wfYemV67fm6Gye47vaFv7oDGx4F/8Ts7g80xwTS
X-Received: by 2002:a54:4392:: with SMTP id u18mr3899095oiv.149.1629231540363;
        Tue, 17 Aug 2021 13:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629231540; cv=none;
        d=google.com; s=arc-20160816;
        b=OnYBgkSfoW+EwWGjmcdTunenyG8fscapkyQOpVy80NIJjtPpAYVcgHpE5ID5V5Gc8N
         +K7ftaR7my3T9u+8ve4UjfOHuGx1u4EnsoqEMZ4+5TcUbHAGgC4TpE/ITde5mRR8t4g5
         yYx9njc8RLKdimbZD1m3K7/7PsszzKQGhpWFD+XKzZ4XYygT40WSHVPM6YYsyfwllYMA
         PnsMhFdQYgeZyN1b2vMN/GLmXyBEWDylFvbM5Q4lL+vDgsMOC15bFXBjSiu6/IBPG6Be
         4H/0adNBXQ1OKbE64EptAhkeJUXAvi9HLmm5aZOPPQK1MCuf/0lqDmbovUIEWwqJ1A3O
         s+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=X9+TtUOGOW4Kke6aYkw3DIDjY+8T0v70IdNRT7rgM7I=;
        b=HLxy1gqlXqQIL4cCkCbFAcRJl9qBmKI+TTs20PQTs2T/tm9YtAs+ek28LqcEQZXLwa
         Vn1vWiMl2tQDSnGAOUelG//InNnlarmkOcaRNvpypjYFVVh0dGs100qUb5Qv9QyKoquZ
         H2FaHF2ZxKvRzI6eoJYOHX58JcjXAD26bCwHEKupXjoJBbNH/UEHE+oI8XpJINhzG0b2
         MeE4hTbkLbJocaP1jZWSJVBoFaQp5vlUOqPDHVVV2yb0/t0IAmVnF9PjYyaojB5fmn6B
         EztiVXVBxSLkbCS9bjoyBTtFuZE/qJ+V5yM4TQwBpRU6BIfZaCVDjX9ht/vYzysU/Wnn
         ttxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPJFuFNT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si2471654oom.50.2021.08.17.13.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 13:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPJFuFNT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG5Y3-0002Nd-K9
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 16:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5Xu-0002N4-CO
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 16:18:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5Xs-0001lY-Ci
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 16:18:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 a201-20020a1c7fd2000000b002e6d33447f9so2327403wmd.0
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9+TtUOGOW4Kke6aYkw3DIDjY+8T0v70IdNRT7rgM7I=;
 b=pPJFuFNTeJ6OOOohE19+Rs2m2FR6yB+y4+0fmz2oaZpUQU0kgCsAarnTGPPK8lhCv1
 QfzFyL0hBJG6XJQH41I0/qBxSwjaVgMjVgh0Olj7DQQRX4MZQDK0KCFKrXqCWB2ZGT86
 XI4vldq+QDWS7o6KfxtjJe/JVuyycABVQwbCz89UNN2YIC8R1Hhd8UJAEwkOq/RyfWq9
 MwVzoIymlScdR5NLqB3lq+lDaZJM95fHdZMHJqQqsC51dcm89tdbOByXCei31cqGdfhJ
 hL62ZsWlgJsy0VoCb2HdvhITImYC7NmzvWszRS9c/cBwZvSg1vd9HVxBRCboftqI+p87
 vQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9+TtUOGOW4Kke6aYkw3DIDjY+8T0v70IdNRT7rgM7I=;
 b=RDFcdrSRkp+kIZPaTrrHDgv5oTPFt3b6RI5TFytgV4lCXrdosn9o0AQdfi3Y4WBTjh
 btmwIOQJouBJMrwe+IFOi0D71bNpmxS0yjwjoJPY7cJGTbc3hAuZzmD3rWcXO30D7i3P
 2oFF0is90Gq7Ma1OD/4Z3u/yudQZl3YGkDgeS9sD5VKiNAvIFTsveD6n3UBvGudPkT7w
 hOP8rtvvrVb5JjvctY4U6m+SVdcPptfvxE6hePFipwqKjaizWo3tC85L7uufbEI7CmT3
 ilhpyfSpYDr9rED1enoGiUioP4x5ASXyu0sW6ggWBYbfYFV08msXCbg10oWxMAM0ZNNf
 FjFg==
X-Gm-Message-State: AOAM533o3HjDTOakSJ6bF79JufXOymGw6NyuWIPSN+YYKy6xmE/M7iYR
 zGnVi7g/eO5xXdDNvYksJGAZzK1VkZBbxg==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr5119910wmp.146.1629231526559; 
 Tue, 17 Aug 2021 13:18:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w9sm2964785wmc.19.2021.08.17.13.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:18:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Do hflags rebuild in cpsr_write()
Date: Tue, 17 Aug 2021 21:18:43 +0100
Message-Id: <20210817201843.3829-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G/Nea2ogk1v/

Currently we rely on all the callsites of cpsr_write() to rebuild the
cached hflags if they change one of the CPSR bits which we use as a
TB flag and cache in hflags.  This is a bit awkward when we want to
change the set of CPSR bits that we cache, because it means we need
to re-audit all the cpsr_write() callsites to see which flags they
are writing and whether they now need to rebuild the hflags.

Switch instead to making cpsr_write() call arm_rebuild_hflags()
itself if one of the bits being changed is a cached bit.

We don't do the rebuild for the CPSRWriteRaw write type, because that
kind of write is generally doing something special anyway.  For the
CPSRWriteRaw callsites in the KVM code and inbound migration we
definitely don't want to recalculate the hflags; the callsites in
boot.c and arm-powerctl.c have to do a rebuild-hflags call themselves
anyway because of other CPU state changes they make.

This allows us to drop explicit arm_rebuild_hflags() calls in a
couple of places where the only reason we needed to call it was the
CPSR write.

This fixes a bug where we were incorrectly failing to rebuild hflags
in the code path for a gdbstub write to CPSR, which meant that you
could make QEMU assert by breaking into a running guest, altering the
CPSR to change the value of, for example, CPSR.E, and then
continuing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've included CPSR.IL on the list of "cached bits" on the assumption
that my "honour PSTATE.IL" patch is going in, but this patch doesn't
strictly depend on that one. Just in case, though:
Based-on: id:20210817162118.24319-1-peter.maydell@linaro.org
"[PATCH] target/arm: Take an exception if PSTATE.IL is set"

 target/arm/cpu.h        | 10 ++++++++--
 linux-user/arm/signal.c |  2 --
 target/arm/helper.c     |  4 ++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be557bf5d83..4c0568f85a8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1393,11 +1393,17 @@ uint32_t cpsr_read(CPUARMState *env);
 typedef enum CPSRWriteType {
     CPSRWriteByInstr = 0,         /* from guest MSR or CPS */
     CPSRWriteExceptionReturn = 1, /* from guest exception return insn */
-    CPSRWriteRaw = 2,             /* trust values, do not switch reg banks */
+    CPSRWriteRaw = 2,
+        /* trust values, no reg bank switch, no hflags rebuild */
     CPSRWriteByGDBStub = 3,       /* from the GDB stub */
 } CPSRWriteType;
 
-/* Set the CPSR.  Note that some bits of mask must be all-set or all-clear.*/
+/*
+ * Set the CPSR.  Note that some bits of mask must be all-set or all-clear.
+ * This will do an arm_rebuild_hflags() if any of the bits in @mask
+ * correspond to TB flags bits cached in the hflags, unless @write_type
+ * is CPSRWriteRaw.
+ */
 void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type);
 
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302b..1dfcfd2d57b 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -289,7 +289,6 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     env->regs[14] = retcode;
     env->regs[15] = handler & (thumb ? ~1 : ~3);
     cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
-    arm_rebuild_hflags(env);
 
     return 0;
 }
@@ -547,7 +546,6 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     __get_user(env->regs[15], &sc->arm_pc);
     __get_user(cpsr, &sc->arm_cpsr);
     cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
-    arm_rebuild_hflags(env);
 
     err |= !valid_user_regs(env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 201ecf8c67f..cdd6e0858fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9215,6 +9215,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type)
 {
     uint32_t changed_daif;
+    bool rebuild_hflags = mask & (CPSR_M | CPSR_E | CPSR_IL);
 
     if (mask & CPSR_NZCV) {
         env->ZF = (~val) & CPSR_Z;
@@ -9334,6 +9335,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
+    if (rebuild_hflags) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 /* Sign/zero extend */
-- 
2.20.1

