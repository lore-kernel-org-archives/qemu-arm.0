Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484938ejv;
        Wed, 3 Apr 2024 03:20:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb//za8wSSnBuEheyUnkhNcFo4EnuGpbX0nN1IjLSxGahjX4aZIwgVN9zfP1VNuJCcjIrI5Yu1kRvyhMF+HEnL3xWyBpVy
X-Google-Smtp-Source: AGHT+IGWoBt4Jr/vxXK9CFs206SCixg/bmUmpWbynXLE3100HthZ10S7HkCkSiofeX9S9XMibZuM
X-Received: by 2002:a0c:f98f:0:b0:699:1b4b:c63f with SMTP id t15-20020a0cf98f000000b006991b4bc63fmr3708524qvn.48.1712139627776;
        Wed, 03 Apr 2024 03:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139627; cv=none;
        d=google.com; s=arc-20160816;
        b=QFB/YVPkFIX9jTW/ruY/MlWKQ/8L86Pi4cJ+/SoA4MRKqgBcj5GfTbAkz3Yv/dvs4u
         6XzTqHLF48EjQV+Ek8mS9FhP2XJob9nWD/GcE8fVOfDIbUDLY2wx89UQ9CkWJMX5FWUP
         YJeYPTf7FdoG5nWq7AWZv4vXsh6TITKNhsZLsdnzMRVKqMxkUUZySKcMUssQd7wVV9CT
         h8aOXqG5fdYRhc0T5rzLiVq93530NhSV6opZiTjc3m1ZRbRCo0kqL4dlSkYFXVb53ziY
         2KaUdTD89vc3+S4eFGvnKjtCoOqJ3NcyO8bu8k60r45SAY4aLnlMSv8nwSQvhEGvMkQR
         KJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=55df/8Q3Ih0HtxhS+OjD+TDVvM0lFbuy4NtXuE3reTU=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=uftR5Co6EQdivJyhl3MmwdYXF6rqJF0nP454trV9SX3Un46rjE1pLRrG9hAflmMaaR
         +7pN1yBx6m90X17Ypp+DvhWvbEXE2QflwRiyOkvVyHWX+n14Pmn9w5RqyXI8DUsg2S5f
         QWVh/ASxOTJR9d/RHNR6M43iZ22Js15E1OrEpYLdBe8l48ku+V88g3csK0NCRj7Uweic
         BGGASwBeX5JJp5s/gUJ0RX2aEc1TM/7zrK1wiHclMoyJpcJIPvbjqw4n5+oIZDrIxEKD
         6E6qMIlfpe9VEpn1OfOruzvT60cTGiBx9UpGZ5pdHunBNLD4RJ1MDIosrZVNn949ecZL
         VMMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1-20020a05621414e100b006969ff20618si13753801qvw.351.2024.04.03.03.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxgt-0000rO-Ue; Wed, 03 Apr 2024 06:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgr-0000np-DD; Wed, 03 Apr 2024 06:17:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgm-0006cA-0h; Wed, 03 Apr 2024 06:17:57 -0400
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V8gbj65Kdz1h56X;
 Wed,  3 Apr 2024 18:14:57 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 5D29F140158;
 Wed,  3 Apr 2024 18:17:43 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:42 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 04/23] target/arm: Implement ALLINT MSR (immediate)
Date: Wed, 3 Apr 2024 10:15:52 +0000
Message-ID: <20240403101611.3204086-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: urVpnC7cFnVu

Add ALLINT MSR (immediate) to decodetree, in which the CRm is 0b000x. The
EL0 check is necessary to ALLINT, and the EL1 check is necessary when
imm == 1. So implement it inline for EL2/3, or EL1 with imm==0. Avoid the
unconditional write to pc and use raise_exception_ra to unwind.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v10:
- Correct the exception_target_el(env) to 2, since it is a hypervisor trap
  from EL1 to EL2.
v7:
- Add Reviewed-by.
v6:
- Fix DISAS_TOO_MANY to DISAS_UPDATE_EXIT and add the comment.
v5:
- Drop the & 1 in trans_MSR_i_ALLINT().
- Simplify and merge msr_i_allint() and allint_check().
- Rename msr_i_allint() to msr_set_allint_el1().
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
 target/arm/tcg/helper-a64.c    | 12 ++++++++++++
 target/arm/tcg/helper-a64.h    |  1 +
 target/arm/tcg/translate-a64.c | 19 +++++++++++++++++++
 4 files changed, 33 insertions(+)

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
index ebaa7f00df..673e949422 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -66,6 +66,18 @@ void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
     update_spsel(env, imm);
 }
 
+void HELPER(msr_set_allint_el1)(CPUARMState *env)
+{
+    /* ALLINT update to PSTATE. */
+    if (arm_hcrx_el2_eff(env) & HCRX_TALLINT) {
+        raise_exception_ra(env, EXCP_UDEF,
+                           syn_aa64_sysregtrap(0, 1, 0, 4, 1, 0x1f, 0), 2,
+                           GETPC());
+    }
+
+    env->pstate |= PSTATE_ALLINT;
+}
+
 static void daif_check(CPUARMState *env, uint32_t op,
                        uint32_t imm, uintptr_t ra)
 {
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 575a5dab7d..0518165399 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -22,6 +22,7 @@ DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_2(msr_i_spsel, void, env, i32)
 DEF_HELPER_2(msr_i_daifset, void, env, i32)
 DEF_HELPER_2(msr_i_daifclear, void, env, i32)
+DEF_HELPER_1(msr_set_allint_el1, void, env)
 DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 340265beb0..21758b290d 100644
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
+    if (a->imm == 0) {
+        clear_pstate_bits(PSTATE_ALLINT);
+    } else if (s->current_el > 1) {
+        set_pstate_bits(PSTATE_ALLINT);
+    } else {
+        gen_helper_msr_set_allint_el1(tcg_env);
+    }
+
+    /* Exit the cpu loop to re-evaluate pending IRQs. */
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
+    return true;
+}
+
 static bool trans_MSR_i_SVCR(DisasContext *s, arg_MSR_i_SVCR *a)
 {
     if (!dc_isar_feature(aa64_sme, s) || a->mask == 0) {
-- 
2.34.1

