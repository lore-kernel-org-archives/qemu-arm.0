Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521965ejb;
        Mon, 18 Mar 2024 02:40:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXekrEXuJ/s4eDX1LeEO6Haeo5MqEWXLVd2kSdWyHEBI2AlBdQ+1JQSnw7cJEYurD0e2rc85nRlgn75ZpWHc0cmBoXfo+UK
X-Google-Smtp-Source: AGHT+IFwu0YTNLACVwWP/4eLvbmFq0yQK25WQ98CV8o0HLUynO13WxZ94RgvLoADdEl7aBXMtSdt
X-Received: by 2002:a05:6122:4702:b0:4d4:3fc:2869 with SMTP id ed2-20020a056122470200b004d403fc2869mr7554585vkb.15.1710754843702;
        Mon, 18 Mar 2024 02:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754843; cv=none;
        d=google.com; s=arc-20160816;
        b=iEyobbCHOoB0cx+0sR0jkh07KkRKBc7HKmbxPbuQL9fNoyPhtpc3/5c3IJ0qTeOKBe
         y2BntUkTJr1h0vHFdVQXeDh+AcOcQw51S+Z1TOWaYOixmoCGXeF6dPVT939VhESR9ay1
         zFP11qfy3az0RFdlfkZw34hkMVpJQFH6ISHDKQqOEWST22FejJoHUWpDAIHwuBnClKAn
         NouWsG6Bbpi2C3aM5BTFeQ+W/1ggkSG9tiULIyhoZ6VDYeqHUuU5+NvMkTyH5eEcuSIx
         aSKic8raIHQWXk8h5s/3XvzwH2kOge6tV3wibMp1txiC1ExlVnFsL32l27Z0btIKdOMv
         9Upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gId+eMF4ROtjQpmK6FSDNQTR35uimaU/8zXUsoMAu8s=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=Na5zMKqbOwaer0vnNpRkneM8zDs3TrXXA8zUngfXv72qB2zMKd//obrABvv++rPHX6
         WQzmrspB8BTNssl+PMe3vcLAja3vBncmdJQmCn+Zvqi2Ia17fUeHdgDknqRs+KL66o7U
         xLkQ4Z2TqgPXWrT11UsBkykVYH3R6kug78Dryl1NRfCvEFv9CMHPINvs174D//+Io5/O
         tyAQEcqkAjTJip9DbQlT/sooxr/EGB6fRGxc9hhqMkDRtOitDwxH1QXJmYQ0guj62PbW
         Udh4O1mD9H6bC1wyDj3/ygmFbtyw5K0tlC16beLjkrVFHwuxQ7tQuqmIZQRjq1sK3S9a
         ENoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020ad45769000000b00690b92e28ecsi8069899qvx.307.2024.03.18.02.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9R3-00041H-S3; Mon, 18 Mar 2024 05:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qs-0003vd-LA; Mon, 18 Mar 2024 05:37:26 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qi-0000uA-JZ; Mon, 18 Mar 2024 05:37:26 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TyqSQ2Yvxz1QBrV;
 Mon, 18 Mar 2024 17:34:30 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 4B68B1400CB;
 Mon, 18 Mar 2024 17:37:02 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:37:01 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 04/23] target/arm: Implement ALLINT MSR (immediate)
Date: Mon, 18 Mar 2024 09:35:26 +0000
Message-ID: <20240318093546.2786144-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: 7fKaT9FtdZv1

Add ALLINT MSR (immediate) to decodetree, in which the CRm is 0b000x. The
EL0 check is necessary to ALLINT, and the EL1 check is necessary when
imm == 1. So implement it inline for EL2/3, or EL1 with imm==0. Avoid the
unconditional write to pc and use raise_exception_ra to unwind.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
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
index ebaa7f00df..7818537890 100644
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
+                           syn_aa64_sysregtrap(0, 1, 0, 4, 1, 0x1f, 0),
+                           exception_target_el(env), GETPC());
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

