Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp641760lfi;
        Tue, 3 Mar 2020 09:51:26 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvoVNHHv821hjR7NsDv0s+4PP4+djAXRIJ66Q7D0/yhu4spENSUBApNsYg3lBniif6TKM40
X-Received: by 2002:a05:620a:141a:: with SMTP id d26mr5276050qkj.312.1583257886043;
        Tue, 03 Mar 2020 09:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583257886; cv=none;
        d=google.com; s=arc-20160816;
        b=EA5Oamv1xI8DqKLQ74l+omzeNK0wSpSE0bMBJlWYVwtafKVej0uqkoOa8DaVk0asRD
         sj9DQBEbkeYoQxAYvgM3u+Y6qfJJj5J8AeciQ4lDANBVQMNmDwuUXSUnJPknbR6i8AX4
         Ob1yz43brHECAxUeaS4rQmWAYFXEEn0/R7LOio/APacJ5FuGe3OBUXTlVYGlQqsXLsnt
         Y/rQUSVT3Dpso1yTQvtagg+UU/Wn+i4m/Mpk91jwKXHj6p1fPG5IE8ULhCe+YvGejZt6
         9XAAa0tpDipUAkz61pT9esHhbGjPr29p/m3CfinDuVDkGoCGKIGxpqyst9467nQGZRfL
         RRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YrErCxdPD0FB72C1AvkhsFUhJwKacmb/G8K5xzzB0Es=;
        b=hqP8Zr0fGN9xnjLRKuP5z28DbDTPSPNFfPt/4zyQzF6pQU886UYukdweWl6/oGiQrG
         Tn1rydmMJi/hBVLegBeLB37MDE00S0XAh1EVhbzrHJKznKjkMMprM4JucO8zr3dp2Uor
         9LxClskWmqxUPK9aO2idrSzYhl+e+b8fv4s4+sqPPgXNF5yzZJVPWjzdzlXmMrEGyUk2
         N8f1XOjY49vEo6nGKxb1pQ/wd7MuTOTtz+Yo5Ev9OB7nT5pOd/VAA8O/m6WeRD3iw+Xo
         NaiMztryRPn56YhGLT9xkIpnkR7Dgb3kmtG8HnE/7FVt/zhO0mg2A0Joy2EWNHDvUvvU
         oaDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VH9HZj4k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si8703315qtl.44.2020.03.03.09.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 09:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VH9HZj4k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9BhV-0000zS-CD
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 12:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg5-0007VH-Ud
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 12:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg4-0006Ke-R7
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 12:49:57 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:32962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9Bg4-0006KE-Ks
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 12:49:56 -0500
Received: by mail-wm1-x344.google.com with SMTP id a25so2898124wmm.0
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YrErCxdPD0FB72C1AvkhsFUhJwKacmb/G8K5xzzB0Es=;
 b=VH9HZj4kdw+98MsTFuffbD0riDElu6ZAEL7Z1/aF/roWyIv3rj1tpjftPAqTrXCfTq
 DxK0YlbpYLBfFkHFpYbklmxMiRVZJ3jpO5krV4iLqOIIWBryyG1wGP3xonegd41lxjCa
 oRsci3/RemWGFmUFb8HHDqVgk10br8axwsQWgommwmrObGWaIivqrB1Ti3JqJKIJjP7T
 fWIAR1bl9MAyte+VGoZY7LJqA/jfq3VjQSoNRjGiVnqcOKSxWYkxlwzLsdMrsuxUs8m1
 DREmdgGH3I7fwFnwslPaPx0w4it+1B3CcFlZB0P0kBho0V1dHyDra3X5tswy5BBVmFX0
 zvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YrErCxdPD0FB72C1AvkhsFUhJwKacmb/G8K5xzzB0Es=;
 b=DKSzlJQVT+8CcNa0V9v/4YN3h8lrou8Cq35XGJ7/3nVD2inSaGKyQTCI7oBBf9dzHH
 wpXj5kdzyjEu/gFBrpbXQ5MAVqlamQ12tQ0FNOlGv5pkWydAN+K5PN2TfBwr4svYocal
 /ZCJ1O2GqfLaE+jGMpobes48wftqk9KlymPJ21Ogj8glBUVhU2UlgY/7gRUxzoI8Q3Dy
 vvkQSwaYRL+HTOTtM3EXTiRwtoEQiepG1oOliYxXd4K5zaGht7FzTqmyv2PjndbSF9IM
 SlyWQwvhd7vcBX8V5anjDiOKDBjs4gywm4aVsRKIgnvVK+6/rzl+N4UEkDk/65/5yC1W
 eVKA==
X-Gm-Message-State: ANhLgQ3T8TlIh9gwg4KetmAvDVjOAiELFvVKh3Cmz9HvZ9FHmUzckOSJ
 b3H1h2i1E4RA8OetqMXFk04Ikst/y9mppA==
X-Received: by 2002:a05:600c:552:: with SMTP id
 k18mr5507694wmc.171.1583257795766; 
 Tue, 03 Mar 2020 09:49:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm4867576wmd.44.2020.03.03.09.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 09:49:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Recalculate hflags correctly after writes to
 CONTROL
Date: Tue,  3 Mar 2020 17:49:49 +0000
Message-Id: <20200303174950.3298-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303174950.3298-1-peter.maydell@linaro.org>
References: <20200303174950.3298-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zstWwnTFlq2k

A write to the CONTROL register can change our current EL (by
writing to the nPRIV bit). That means that we can't assume
that s->current_el is still valid in trans_MSR_v7m() when
we try to rebuild the hflags.

Add a new helper rebuild_hflags_m32_newel() which, like the
existing rebuild_hflags_a32_newel(), recalculates the current
EL from scratch, and use it in trans_MSR_v7m().

This fixes an assertion about an hflags mismatch when the
guest changes privilege by writing to CONTROL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/helper.c    | 12 ++++++++++++
 target/arm/translate.c |  7 +++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index fcbf5041213..a63fd5dfb73 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -90,6 +90,7 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
 DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
+DEF_HELPER_FLAGS_1(rebuild_hflags_m32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6be9ffa09ef..2eec812b80b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12325,6 +12325,18 @@ void arm_rebuild_hflags(CPUARMState *env)
     env->hflags = rebuild_hflags_internal(env);
 }
 
+/*
+ * If we have triggered a EL state change we can't rely on the
+ * translator having passed it to us, we need to recompute.
+ */
+void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
 void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
 {
     int fp_el = fp_exception_el(env, el);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7f0154194cf..4715ca0d2ad 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8551,7 +8551,7 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
 
 static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
 {
-    TCGv_i32 addr, reg, el;
+    TCGv_i32 addr, reg;
 
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
@@ -8561,9 +8561,8 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     gen_helper_v7m_msr(cpu_env, addr, reg);
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
-    el = tcg_const_i32(s->current_el);
-    gen_helper_rebuild_hflags_m32(cpu_env, el);
-    tcg_temp_free_i32(el);
+    /* If we wrote to CONTROL, the EL might have changed */
+    gen_helper_rebuild_hflags_m32_newel(cpu_env);
     gen_lookup_tb(s);
     return true;
 }
-- 
2.20.1

