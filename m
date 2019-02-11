Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp105681wrp;
        Mon, 11 Feb 2019 15:57:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IazBqXncmCufBeT4etHqidoc+aUKm2q2gbkHjHUyvAEYd8KbmJU3KvGK16KGNv4SCeueLoT
X-Received: by 2002:a0d:eb0e:: with SMTP id u14mr631581ywe.375.1549929438474;
        Mon, 11 Feb 2019 15:57:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929438; cv=none;
        d=google.com; s=arc-20160816;
        b=RCJMlG3/0azB/o/ukYXLfpkN9Ki/ytIv+Pz654S7K1yy1/89iO/57rrzfx+xFTHMdJ
         xyVEkK2dXTDZ64h+WVzZf2PFRy3onwartTZcxTu1dLIILmtxYgbsM7CTWesfxYWF2SUM
         WchRjX8XwtAFa4ZcKIyByYLQlP4IyEkPkpg8kCAQqG6hB0X6jjzg6ViYQNM4/9z1m3Zc
         Ay8efSXHawHGl96Bf4iEQT8GeTVF4bJst2HCadTmsDN5baCbs64WJ77TmeP7yUbSE+yF
         Cg4dVAHKycx0c6DWac80JhicJir3ccOFN2h/+dy3JG8SKn09aVUCymCeRlTQhPJkXqUP
         26eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=u1cP8m0OoSVsqCjKblIhCfU4wnhzJWGLVFK+17Qjpco=;
        b=VAIioI9xTaau+1F6X0V3RLQ1A+hiqkGar6stxz2Swms4CrkcyBlXl2prARBA9PXQTN
         Bo9SkzH/YdiToJp0YbPF9TfzoFY3Mh41vPYI+FlyziyhbCUjRF7heDtmm4O2AHFPxDpR
         U3bQI/yDmbN+gPkkOQOcJy9OCMmEKyXim4URVrUMPxmDbjqWA0Gii9iTF7XDKtbaIRuP
         s+ZSsNO9SjtPJFT1V80Xo15KRHjJQTzkToXZbwwrmTjzkVWonZ5gzfxsQXbPk/OKBfAW
         C4l8h3SImceJcV5d2FagJG8ur8OXEmh2ebSKnyKrDjHGgyUeLKPgodib2mFKviWvPO2W
         24dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ljZlRPnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si6279720ybp.416.2019.02.11.15.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:57:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ljZlRPnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLRt-0008QV-Tg
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOG-0005Qy-TY
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0004Zw-Cz
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:32 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40279)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOC-0004XN-9m
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:28 -0500
Received: by mail-pf1-x441.google.com with SMTP id h1so329453pfo.7
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u1cP8m0OoSVsqCjKblIhCfU4wnhzJWGLVFK+17Qjpco=;
	b=ljZlRPnZc5Xgga4f/oPdQ6fhBQ0dMP0lxj4VVVKhm12mdJCPwVmg3RWl5ny5GFhvSG
	262eKQRoIcwwx7Y/qQWzpZvpCktIh6faDX5jRettMV0MY+8smzJH/RvqlwyeJ/8OdsHj
	ZYGKMXA6G0swuF38J+NlXS8UixfzfQjyMB5rz0pBGv6HLplEURn09tjNJgVfBo3l2U7v
	uPBQ8Ssbje1FjD7uoZBsdIXf3hESSulH0dxQlLB45UrjJi8Yhc744o6cok6k/JbMUA5j
	bmoZ0nGtNFsjyqUQcogqiypMWHAiU7uuBaiM1e+GDuE5/iz/2piNP2HvTADx7o+EH0Uc
	ogcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u1cP8m0OoSVsqCjKblIhCfU4wnhzJWGLVFK+17Qjpco=;
	b=fE6do7YxOiCrgys9piXzQ9oUrKLcuEhaVOKCwZnqzHGtw6mgNZERgKm6O53axprAzs
	MI/y30DsQTOAZFbBl7PrwQr6fZtjqBmkODixnm+zAxm2MFcUX11g8EJrtY1FKGdJnrGh
	ChvvgHd9RJECW4HjalKxJTwPiadYd4SC8kAbkA9aLEkOLxnb59gFe4k6FxNGbMCSiFL4
	au/iG4ByWxPPe61nMfZCW+qcMWPInWjcPc8uLmVfHvCxe8dX0yIxDvSZ+j9WEPf1SMha
	8azqNNfDBKytqEE7dy02ZPwFFWWMhs1qn5xh6yMkH53bXyCw1lAiQmV/xKSKpWFRt3Et
	SXxQ==
X-Gm-Message-State: AHQUAubCJawNfVsr6guD+ZIrnjaFr8kIweq7lQbM05rZ/HsM7pcRU+FP
	bAWD+2bg0xS6hfg3PbgQj6jGc04PDcw=
X-Received: by 2002:a63:f412:: with SMTP id g18mr852785pgi.262.1549929207334; 
	Mon, 11 Feb 2019 15:53:27 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:50 -0800
Message-Id: <20190211235258.542-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 20/28] target/arm: Implement data cache set
 allocation tags
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hhs24U3055Qz

This is DC GVA and DC GZVA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use allocation_tag_mem + memset.
v3: Require pre-cleaned addresses.
---
 target/arm/cpu.h           |  4 +++-
 target/arm/helper-a64.h    |  1 +
 target/arm/helper.c        | 16 ++++++++++++++++
 target/arm/mte_helper.c    | 28 ++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  9 +++++++++
 5 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 74633a7a78..ca32939483 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2160,7 +2160,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
 #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
+#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
+#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
+#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
 #define ARM_CP_NO_GDB            0x4000
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 5bcdfcf81b..ec4e7f7cf5 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -117,3 +117,4 @@ DEF_HELPER_FLAGS_3(st2g_parallel, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm, TCG_CALL_NO_WG, void, env, i64, i64)
+DEF_HELPER_FLAGS_2(dc_gva, TCG_CALL_NO_RWG, void, env, i64)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ed1b258497..f17e045706 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5841,6 +5841,22 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "CIGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "GVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
+      .access = PL0_W, .type = ARM_CP_DC_GVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
+    { .name = "GZVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 4,
+      .access = PL0_W, .type = ARM_CP_DC_GZVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
     REGINFO_SENTINEL
 };
 #endif
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index afa4c26535..6d0f82eb99 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -473,3 +473,31 @@ void HELPER(stzgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
         }
     }
 }
+
+void HELPER(dc_gva)(CPUARMState *env, uint64_t ptr)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    size_t blocklen = 4 << cpu->dcz_blocksize;
+    int el;
+    uint64_t sctlr;
+    uint8_t *mem;
+    int rtag;
+
+    ptr = QEMU_ALIGN_DOWN(ptr, blocklen);
+
+    /* Trap if accessing an invalid page.  */
+    mem = allocation_tag_mem(env, ptr, true, GETPC());
+
+    /* No action if page does not support tags, or if access is disabled.  */
+    el = arm_current_el(env);
+    sctlr = arm_sctlr(env, el);
+    if (!mem || !allocation_tag_access_enabled(env, el, sctlr)) {
+        return;
+    }
+
+    rtag = allocation_tag_from_addr(ptr);
+    rtag |= rtag << 4;
+
+    assert(QEMU_IS_ALIGNED(blocklen, 2 * TAG_GRANULE));
+    memset(mem, rtag, blocklen / (2 * TAG_GRANULE));
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9e7afa571d..1bab7ea211 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1818,6 +1818,15 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
+    case ARM_CP_DC_GVA:
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
+        gen_helper_dc_gva(cpu_env, tcg_rt);
+        return;
+    case ARM_CP_DC_GZVA:
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
+        gen_helper_dc_zva(cpu_env, tcg_rt);
+        gen_helper_dc_gva(cpu_env, tcg_rt);
+        return;
     default:
         break;
     }
-- 
2.17.2

