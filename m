Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3448043lfq;
        Tue, 12 Jan 2021 03:06:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx85wVAuNXzpixSmpfIeyvgoQJ7GjOYH5gSf8L/jOtv3lN/YXHJde9AJP9QKweCaae2moNp
X-Received: by 2002:a25:afca:: with SMTP id d10mr5667533ybj.508.1610449582550;
        Tue, 12 Jan 2021 03:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610449582; cv=none;
        d=google.com; s=arc-20160816;
        b=o8dvdfrN59WjPxfxRZwVOc9uM4L/qd4klxPl8xYp/jC6j2fE4WuOSjzHpysVM5ql+1
         IvG1Y+v4efFfTW7wqCJG1uFZ6Y3FeEE4PjJgVooGOdXwBL/1TKoi6GlQDHvztis7R2w9
         9obvU6u4d6o6lhN4LFoQvPjDWUmhGwfdgyW/9GQKlSK9tVwHq3qFruZEJlsKNMkcT2Zg
         NVVIrY1RW8lL2E6sqM0pKf+Cb0q4ILzC/KsRGV77dOa1ZAZ8Y/6JUtg7b+FgwIL+NHZ1
         DXcTBofLR5hpjh/nDpIjdr/+35TSBTQ3ZpjJ/dh0IDZUP7oQGFGjG48S/4K0dvPeXgkv
         yk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Vudw5YgETz5RvuCdOuT4HMMAakdsp22k4p1QfattiBU=;
        b=oWTpvaLGQjZgm6ZfPifRLsM65rkrdEs2GGYNlJ1l7Bo9X4TMIJQDxt12lY5xR8FXDi
         1NjQX7vKP5JdWXRKWmF/2rtfGKtq3Tnb/LUzYYKw+0ASgrAe6vJvPSbQWEphXGFcIyFZ
         fDWjoaG8IBurl9OJVzsepkEUbmzQYpusEmTsdVJfx1viS02EtJns/UX1QUKvQrtaPMiz
         sFtwkXaSAyOae7mhv68LBJuh7qVMKOsyo/pvoQ9HJlH/3Pg/gXc2OD7ja3tw64vhB0lH
         P336ti4JHBBu31D34UyN+KEtOWVPHeXPKkcBnruwNZvRw/48CXU5BZguQ57rTFb1D8wH
         iYUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o139si2582281ybg.432.2021.01.12.03.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHVF-0007tY-UM
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBV-0003w5-OS; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56720
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBQ-0003Su-VH; Tue, 12 Jan 2021 05:45:56 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id A087B60604;
 Tue, 12 Jan 2021 11:45:15 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 16/19] target/arm: revector to run-time pick target EL
Date: Tue, 12 Jan 2021 12:45:08 +0200
Message-Id: <20210112104511.36576-16-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7pNeoo8pteO

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

On ARMv8-A, accesses by 32-bit secure EL1 to monitor registers trap to
the upper (64-bit) EL. With Secure EL2 support, we can no longer assume
that that is always EL3, so make room for the value to be computed at
run-time.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/translate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76..8b6b7355c9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1094,6 +1094,22 @@ static void unallocated_encoding(DisasContext *s)
                        default_exception_el(s));
 }
 
+static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
+                             TCGv_i32 tcg_el)
+{
+    TCGv_i32 tcg_excp;
+    TCGv_i32 tcg_syn;
+
+    gen_set_condexec(s);
+    gen_set_pc_im(s, s->pc_curr);
+    tcg_excp = tcg_const_i32(excp);
+    tcg_syn = tcg_const_i32(syn);
+    gen_helper_exception_with_syndrome(cpu_env, tcg_excp, tcg_syn, tcg_el);
+    tcg_temp_free_i32(tcg_syn);
+    tcg_temp_free_i32(tcg_excp);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -2818,8 +2834,11 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
              * then accesses to Mon registers trap to EL3
              */
-            exc_target = 3;
-            goto undef;
+            TCGv_i32 tcg_el = tcg_const_i32(3);
+
+            gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
+            tcg_temp_free_i32(tcg_el);
+            return false;
         }
         break;
     case ARM_CPU_MODE_HYP:
-- 
2.30.0

