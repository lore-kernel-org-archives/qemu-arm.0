Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2001460ejb;
        Wed, 21 Feb 2024 07:49:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVBqkM9HTpfQzfiykWHY0dxlzY5GiWXj0WjivqratDpu22XSNzcSDsaQgxv+OehChZ4VIKHja9h66szw1MXf4zzyrGXRpd+
X-Google-Smtp-Source: AGHT+IHC6XlWGCCRSwiMyyL/ys2vtdH7J/SA89dsEIzi3SLpefb4F3guzUs6BD9y44w8mHvsD+xx
X-Received: by 2002:a67:fa55:0:b0:470:4de7:20a2 with SMTP id j21-20020a67fa55000000b004704de720a2mr8749831vsq.33.1708530592761;
        Wed, 21 Feb 2024 07:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708530592; cv=none;
        d=google.com; s=arc-20160816;
        b=VCn9D8vn/TSQ2sKtKSTZ5+C8gNUh9tNznl7pRz1PR0YUz6euceRjCyo+q5bnaucPjI
         xILTEMD2cUGsAGCGo/WNkbpR2BcJnaL9gX7kgkh3t6oIlVnj9uA2MjTsbtJN0LUWYZW2
         PReHlxViy0FFs+WmD9JRzXF6DLp4GQZrnnwWZZETF6i0cL7kEyli6aNG5RxfvMRWCuPH
         Nav3nJgsyfgoFZvU+Va/i0UOvvibioVbD7sNqy90sPHT27xfuVZxR3lOlllfMJqOFUCW
         v5RJnoXPc3xzVI22BrUBIYkJIZxk3h+VueoSgXiHLTsXzI/tRhBScfbo6DwwFRum1U4r
         pa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2W8mHaqmrMIZ3RNvo2p+wgm5lRPT6Am7LWfhqqNaeGk=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=jmFNrsNajDH6gkbWWWjYkttasi6E8IH/H8nkXQpYk7n+xt8LvsJg3IBcMGtiPGjhYh
         Kb+t8YKi1GxlhLdrl6YtiWUldATtOiV7INNepm4KEYAsoUrZUdOmCS5Du8o1Zo78w8rD
         hX5r8C9qabTly8OR6v68+CS9AnLcsc5Y11SqJbtC38idpIhEDly3rpsO1E4PIvAVeG+9
         9j+ux0Y1YzIbZwZtPfeD65vnxmfDDYEebJaJwIRzSmRDd/pg+SQYigjihFe8GmWfOPg1
         CDIChIRyaDggkgnC5cjknWsfflUo/g9AvNWUB4HmwB0Dh8v/prn778nq03Sp6UfMiBJo
         7JcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac86e89000000b0042c2f2b1e47si10743191qtv.296.2024.02.21.07.49.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcobv-0004tg-78; Wed, 21 Feb 2024 10:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoUP-0002Dm-0k; Wed, 21 Feb 2024 10:26:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLu-0004pA-AB; Wed, 21 Feb 2024 08:09:37 -0500
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxQp6YVQz1xnn0;
 Wed, 21 Feb 2024 21:08:02 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 9BA8A14011B;
 Wed, 21 Feb 2024 21:09:25 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:25 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 04/22] target/arm: Implement ALLINT MSR (immediate)
Date: Wed, 21 Feb 2024 13:08:05 +0000
Message-ID: <20240221130823.677762-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D6DNmK2UEROs

Add ALLINT MSR (immediate) to decodetree. And the EL0 check is necessary
to ALLINT. Avoid the unconditional write to pc and use raise_exception_ra
to unwind.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 target/arm/tcg/a64.decode      |  1 +
 target/arm/tcg/helper-a64.c    | 24 ++++++++++++++++++++++++
 target/arm/tcg/helper-a64.h    |  1 +
 target/arm/tcg/translate-a64.c | 10 ++++++++++
 4 files changed, 36 insertions(+)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8a20dce3c8..3588080024 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -207,6 +207,7 @@ MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010 11111 @msr_i
 MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
 MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
 MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
+MSR_i_ALLINT    1101 0101 0000 0 001 0100 .... 000 11111 @msr_i
 MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
 
 # MRS, MSR (register), SYS, SYSL. These are all essentially the
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index ebaa7f00df..3686926ada 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -66,6 +66,30 @@ void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
     update_spsel(env, imm);
 }
 
+static void allint_check(CPUARMState *env, uint32_t op,
+                       uint32_t imm, uintptr_t ra)
+{
+    /* ALLINT update to PSTATE. */
+    if (arm_current_el(env) == 0) {
+        raise_exception_ra(env, EXCP_UDEF,
+                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
+                                               extract32(op, 3, 3), 4,
+                                               imm, 0x1f, 0),
+                           exception_target_el(env), ra);
+    }
+}
+
+void HELPER(msr_i_allint)(CPUARMState *env, uint32_t imm)
+{
+    allint_check(env, 0x8, imm, GETPC());
+    if (imm == 1) {
+        env->allint |= PSTATE_ALLINT;
+    } else {
+        env->allint &= ~PSTATE_ALLINT;
+    }
+    arm_rebuild_hflags(env);
+}
+
 static void daif_check(CPUARMState *env, uint32_t op,
                        uint32_t imm, uintptr_t ra)
 {
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 575a5dab7d..3aec703d4a 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -22,6 +22,7 @@ DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_2(msr_i_spsel, void, env, i32)
 DEF_HELPER_2(msr_i_daifset, void, env, i32)
 DEF_HELPER_2(msr_i_daifclear, void, env, i32)
+DEF_HELPER_2(msr_i_allint, void, env, i32)
 DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 340265beb0..f1800f7c71 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2036,6 +2036,16 @@ static bool trans_MSR_i_DAIFCLEAR(DisasContext *s, arg_i *a)
     return true;
 }
 
+static bool trans_MSR_i_ALLINT(DisasContext *s, arg_i *a)
+{
+    if (!dc_isar_feature(aa64_nmi, s) || s->current_el == 0) {
+        return false;
+    }
+    gen_helper_msr_i_allint(tcg_env, tcg_constant_i32(a->imm));
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
 static bool trans_MSR_i_SVCR(DisasContext *s, arg_MSR_i_SVCR *a)
 {
     if (!dc_isar_feature(aa64_sme, s) || a->mask == 0) {
-- 
2.34.1

