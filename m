Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475141ejf;
        Fri, 23 Feb 2024 02:34:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAWfds7IoI6/X2Kpm2W0P3tr9Zhf5FBMPBJBTGSkzP27r/OL6A2uGKJjsiw7ouoYQYsv2YaEQ6gW9AJu7JxQnafCdpOL9W
X-Google-Smtp-Source: AGHT+IHpPQjSuoEDuq5I4JyaDoeb5pO/YtOrZ+izmG5sevvYtqtnxd1Jj8+evqY9zwvahlMLwMQW
X-Received: by 2002:ad4:5c64:0:b0:68f:b9b7:9c53 with SMTP id i4-20020ad45c64000000b0068fb9b79c53mr2600210qvh.28.1708684475109;
        Fri, 23 Feb 2024 02:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684475; cv=none;
        d=google.com; s=arc-20160816;
        b=ySvBJAtNf0p0/wXSq8JDcFpz0cWIZg4UI4L5byOgQoZ+CJQicZHqgdkWjQvw+cuRcv
         auK8YbQ5eAW+qZGyYLcE83zpOZQSfwUdj8f71E/LAyOZrM9hmOBmBvBHPGLTBC1OUSd2
         XvlioS1ka7p+b/fdo0/kSscziWuKLeasPhyXwc8O/FROUJ7JZ3bOKFjAncdS5jFxMdnG
         zEGJdHG8saIBrqVOK/TkSsokN4nkJTSgukjNneOOTj7CY9uM2SCNWTSoN+gqYz0NjRVh
         9fUMDyYU8kQMV6UtvN1ihWvS5rU1Uag9cvDq/98fbRHMnJiPQE+RN58kPt+bqAAQ69vC
         jLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=FoTJc8r8rk+NTZ+YjdTb1SmxGq3N0pMLLvQmtbe5Juk=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=u/UWFrelpLn2Xm/HQozp/74/1qD8FAvbhNAv9I8T6H280qEutmYYifKlS8xik8Lc8M
         KIdHna2UEiianzxzz8GlLEuImlX+jxg0b7ZIxEw6OgzNB35x9EGeXM/wtCnNGgoxrXay
         30GIQ0YdigtKw9yx1hXhSQ4L5WtXbpoFW+BkTty4EeEeAEabjh1iT5Ag4/LEXR5ER2SQ
         WkQezZYeP9iPp+PoSqCNh7ZB1FhME47zXQDhFy5xG61T02zs4ncpNqNaHo4bk/rev045
         SzTM5E3cVXaLfq80jhqamJbSZyeEigp8B25o7+zzjttFDAq43d3QrrYX0jzJncXoeetp
         U8zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv10-20020ad45cea000000b0068f5ba650bdsi12847016qvb.238.2024.02.23.02.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdSsw-0003rB-2A; Fri, 23 Feb 2024 05:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsY-0003e0-40; Fri, 23 Feb 2024 05:34:06 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001vt-Q9; Fri, 23 Feb 2024 05:34:05 -0500
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Th5t50Z78zNlmk;
 Fri, 23 Feb 2024 18:32:13 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 456B914011A;
 Fri, 23 Feb 2024 18:33:38 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:37 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 04/21] target/arm: Implement ALLINT MSR (immediate)
Date: Fri, 23 Feb 2024 10:32:04 +0000
Message-ID: <20240223103221.1142518-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6A7Va16pPLI6

Add ALLINT MSR (immediate) to decodetree. And the EL0 check is necessary
to ALLINT. Avoid the unconditional write to pc and use raise_exception_ra
to unwind.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Remove EL0 check in allint_check().
- Add TALLINT check for EL1 in allint_check().
- Remove unnecessarily arm_rebuild_hflags() in msr_i_allint helper.
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
index ebaa7f00df..58fb28a6b3 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -66,6 +66,30 @@ void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
     update_spsel(env, imm);
 }
 
+static void allint_check(CPUARMState *env, uint32_t op,
+                       uint32_t imm, uintptr_t ra)
+{
+    /* ALLINT update to PSTATE. */
+    if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
+        (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
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

