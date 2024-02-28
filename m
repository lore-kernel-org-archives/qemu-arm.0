Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110749dlb;
        Wed, 28 Feb 2024 01:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWD3RC24dt7It7DYJyP8pxpItTqHnT7+xR49oc7qHJqxUaa6p1NRFhRLGCvRSIcwlL87p/xQGAM9lgHaQhA3NQRVAERdlwO
X-Google-Smtp-Source: AGHT+IHtTj82KvAxw3UQVkszVqMaRRFkI/QCedzNuB1m0vdq5TrN4aNyjoon3OcYjHmciUGWKUwx
X-Received: by 2002:a05:620a:1a8b:b0:787:680b:120b with SMTP id bl11-20020a05620a1a8b00b00787680b120bmr5639723qkb.23.1709112868933;
        Wed, 28 Feb 2024 01:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112868; cv=none;
        d=google.com; s=arc-20160816;
        b=FuoRPMycJPZypBJqPR0FZfcHcFC+BTbmUjg6w7k3b+a6jySwq/tN4KhfWEvqOTS5wy
         JJH//g8u/0JbtfIWk4xcBRXw4jaBy9cQ9rG6mGbFY6xcJ9Zq1h+d49BF2gTMwZtSc2/R
         QT3a+hULQakX3pDrcIymOsoDvtZP/tI0QBo3VVgwZap7om2/lvhl6cBifYoPGe2DAkSM
         pPdOjZzhUhB4isywM2gsByR05gV7K/tviq6YtB5pL6NWIIJ1fQigRz/HLOex6Wv3J+KJ
         mxnV6epzhR179rMNIKb0SqKbW2jo34VmdtZFz2UTgvZVgaLxYEYyoKz8GsOTm/mFnrhu
         6NeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=VhD4s8MWVDgyxHwL8a48rXOflTjJAsYYSkXk+I959Bg=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=IERKXcBB79e8fJRFEw43iwAO75lbaQN48Jd1d6bx+2GUVzEUDVJiRnouzSTvgkEN5q
         P2zm2B17u9BAbij3jKdqM5Zr+R4ucBf3e725jSLvnvahq4U5rjqZksVsO4Fj+i5orZT+
         3FoqKcQWvos0S5zKp0NkNBPz84n3MwQD8NKTxzzVImfSmNL8N0I36ebsCGO4/ntHUTcV
         YBZ3Ia+sTBfjUVRaao1q56Aa44DGR/JquqxsoCoZ1SoyuOU2I4Hs3jtsy7kzzI7gCngN
         Bwl0W7wzPg5aO0jzI6A1TlN8Hh6EvtTkCeR4UWOiz91ruiikAGblVq3bcbzXCzYlGvDP
         9jFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05620a0b0d00b00787ae629248si9035381qkg.316.2024.02.28.01.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:34:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHY-00019j-60; Wed, 28 Feb 2024 04:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHP-000145-NF; Wed, 28 Feb 2024 04:31:12 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHL-0001So-DZ; Wed, 28 Feb 2024 04:31:10 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DQ71hYz1h0w9;
 Wed, 28 Feb 2024 17:28:38 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id B8EB31402DE;
 Wed, 28 Feb 2024 17:30:53 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:53 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 04/22] target/arm: Implement ALLINT MSR (immediate)
Date: Wed, 28 Feb 2024 09:29:28 +0000
Message-ID: <20240228092946.1768728-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t+0wATcPxnRs

Add ALLINT MSR (immediate) to decodetree, in which the CRm is 0b000x. The
EL0 check is necessary to ALLINT, and the EL1 check is necessary when
imm == 1. So implement it inline for EL2/3, or EL1 with imm==0. Avoid the
unconditional write to pc and use raise_exception_ra to unwind.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Fix the ALLINT MSR (immediate) decodetree implementation.
- Remove arm_is_el2_enabled() check in allint_check().
- Update env->allint to env->pstate.
- Only call allint_check() when imm == 1.
- Simplify the allint_check() to not pass "op" and extract.
- Implement it inline for EL2/3, or EL1 with imm==0.
- Pass (a->imm & 1) * PSTATE_ALLINT (i64) to simplfy the ALLINT set/clear.
v3:
- Remove EL0 check in allint_check().
- Add TALLINT check for EL1 in allint_check().
- Remove unnecessarily arm_rebuild_hflags() in msr_i_allint helper.
---
 target/arm/tcg/a64.decode      |  1 +
 target/arm/tcg/helper-a64.c    | 16 ++++++++++++++++
 target/arm/tcg/helper-a64.h    |  1 +
 target/arm/tcg/translate-a64.c | 19 +++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8a20dce3c8..0e7656fd15 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -207,6 +207,7 @@ MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010 11111 @msr_i
 MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
 MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
 MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
+MSR_i_ALLINT    1101 0101 0000 0 001 0100 000 imm:1 000 11111
 MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
 
 # MRS, MSR (register), SYS, SYSL. These are all essentially the
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index ebaa7f00df..3d912febc3 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -66,6 +66,22 @@ void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
     update_spsel(env, imm);
 }
 
+static void allint_check(CPUARMState *env, uintptr_t ra)
+{
+    /* ALLINT update to PSTATE. */
+    if (arm_current_el(env) == 1 && (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
+        raise_exception_ra(env, EXCP_UDEF,
+                           syn_aa64_sysregtrap(0, 1, 0, 4, 1, 0x1f, 0),
+                           exception_target_el(env), ra);
+    }
+}
+
+void HELPER(msr_i_allint)(CPUARMState *env, uint64_t val)
+{
+    allint_check(env, GETPC());
+    env->pstate = (env->pstate & ~PSTATE_ALLINT) | (val & PSTATE_ALLINT);
+}
+
 static void daif_check(CPUARMState *env, uint32_t op,
                        uint32_t imm, uintptr_t ra)
 {
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 575a5dab7d..64351f20f3 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -22,6 +22,7 @@ DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_2(msr_i_spsel, void, env, i32)
 DEF_HELPER_2(msr_i_daifset, void, env, i32)
 DEF_HELPER_2(msr_i_daifclear, void, env, i32)
+DEF_HELPER_2(msr_i_allint, void, env, i64)
 DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 340265beb0..9ef2ba912d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2036,6 +2036,25 @@ static bool trans_MSR_i_DAIFCLEAR(DisasContext *s, arg_i *a)
     return true;
 }
 
+static bool trans_MSR_i_ALLINT(DisasContext *s, arg_i *a)
+{
+    if (!dc_isar_feature(aa64_nmi, s) || s->current_el == 0) {
+        return false;
+    }
+
+    if ((a->imm & 1) == 0) {
+        clear_pstate_bits(PSTATE_ALLINT);
+    } else if (s->current_el > 1) {
+        set_pstate_bits(PSTATE_ALLINT);
+    } else {
+        gen_helper_msr_i_allint(tcg_env,
+                                tcg_constant_tl((a->imm & 1) * PSTATE_ALLINT));
+    }
+
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
 static bool trans_MSR_i_SVCR(DisasContext *s, arg_MSR_i_SVCR *a)
 {
     if (!dc_isar_feature(aa64_sme, s) || a->mask == 0) {
-- 
2.34.1

