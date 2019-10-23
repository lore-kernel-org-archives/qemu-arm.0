Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1035527wrq;
        Wed, 23 Oct 2019 08:24:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhuK65jfL2XohzeVq/rR3EX/i/zpYxS41oFULgKIdJpHwUdNgWzI5I38f+31/7pIkZjg/y
X-Received: by 2002:ac8:3789:: with SMTP id d9mr1736868qtc.132.1571844272364;
        Wed, 23 Oct 2019 08:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844272; cv=none;
        d=google.com; s=arc-20160816;
        b=Mur+EvFtmyo0MPdn/4KqAJrir9VUl6lT2WFLlvjmJsKhw+kzsuM+rno8EjSOjfXZho
         9fhyGyp3B5lV99zDWWLSHf3nSlP97kcmcsIREFYd64gIDzeM3WgrjR3FD8EQF9kjlLBm
         EuPuBDjcKcOGkIPuipXMLnLYeOUtTsBTCZSGomLJD1fyT9Yskrs8RhnrzwgnDRXaG5wS
         UCmFt3o+xINBDqLbVVPP7Cl+Ar0GAGRf/wPljLFqwfmq3V2lVNIfgkerH9OwaeKoRpZy
         wmawzFnvRBIaoSxrOErFZ0TJ3JVloQ8/PcVNTvAPEETzKdg6Br8I95AneFXGSZvfv2hx
         +o3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LNnrsVkwlgJ6QoJB/sOp9/3FjmMcP/pJsCavmGVFX6A=;
        b=vsTUghAiHR0w97t5MeBSmq+ND3/qBFbS5gQmIVCUDxDEuUsVC0SFojKGnEC9tOl6v2
         IjC2PhdU/ra08CmoZyMXU1hl3FDCO4Mto7mCRLV3GA/7jVeCnGWxkojvYtbttXX0M8i5
         0XG5HdofZSeL4feINpuiyXnAsy3LYgfvdQIfLB28VGLmimnt329giQ5lFVztxhpgoLIi
         j+/V0f0cn+TgfJQIvt/NF+CqoednecR+vs5z/66+8IwXnYa1ulQA2grxkuUI/FJHRo1s
         Bk9FryWP6Hn8ER66USEziUCcDxnib2bIsl6CE5JcM4BoQSC/D2jSpzGTbMnuMwOnG8FF
         0jWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PI8SmEt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u188si18425608qkh.316.2019.10.23.08.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PI8SmEt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIUx-0002A7-FM
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8w-0008Ed-Fg
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-0001IX-AX
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:46 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:36370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-00019N-Vr
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: by mail-qt1-x844.google.com with SMTP id d17so18126656qto.3
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNnrsVkwlgJ6QoJB/sOp9/3FjmMcP/pJsCavmGVFX6A=;
 b=PI8SmEt0aWF4SMPYVp+5sC2i8RM3azhNXYGSc+CvtQ8YlR5iFc2AxLG0r4mM5pCgmy
 c5WNM9XNMFvTP6LfK69OIwvCqLYqlVcrFaE2k2xIak8XvzOFkcnQAvNIt2KkJlj+yP7q
 V4SMg2kudwbrWNcnK+TQEziGrSOntG92jqw6CgWPjTfPQehw366erv8H4ZBWrWc3t+SN
 Is27wco728zLE0P/jaBR+MLCvnxgydHRb1NzbnzokNAx/TcZvzRd5tsqwOSWJHhH214R
 HQlkhNrc9eaeNuL2XoNCe1v/hEfAftaXkdRzJH06lgvWGKLDTxdBpC9WtUW0+6AKmkbW
 3aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNnrsVkwlgJ6QoJB/sOp9/3FjmMcP/pJsCavmGVFX6A=;
 b=CFSK74BEHqiklS+t1RFFlpBgwEnsg5JmH+e7ZiUgZf5ANXnRRRCcy6+BCAUTK9HIpj
 Kw0iwvRASFSGzr982L24y60L91yQ9XTFAU/7OgoFJ+TUV5j/tHn4ePLamc9txPE3U1JV
 ORjKGDtZ2Jb+G2pufaKlo7ilz8QgDg1yyvq4mc5xO5VUoyb6yx4YB4auq0Beyp+RY7+o
 795WflZBSmRRkgM3IqrFMrA0/xO7q4z89ERCT5zPnS+Ba3BHm1EWz0aYmXhlNG9yCbiz
 akcrv7GrWWF/4finVD1DHjh80PmSf6mzpkFketdCblW8M4OAKlfmZV0YYXcPRyTw+pBL
 X9oA==
X-Gm-Message-State: APjAAAXH3vxeAzYJKwCvO/FisoqEXS709C+pKaf8JdgvBOjWV1mOQjG2
 V9A+zJduLr7wMrHQCLAL36SaUQ==
X-Received: by 2002:ac8:40c5:: with SMTP id f5mr9979337qtm.344.1571842885143; 
 Wed, 23 Oct 2019 08:01:25 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 17/24] target/arm: Rebuild hflags at MSR writes
Date: Wed, 23 Oct 2019 11:00:50 -0400
Message-Id: <20191023150057.25731-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HoGo0X4t9iEj

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 13 +++++++++++--
 target/arm/translate.c     | 28 +++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2d6cd09634..d4bebbe629 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1789,8 +1789,17 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         /* I/O operations must end the TB here (whether read or write) */
         s->base.is_jmp = DISAS_UPDATE;
-    } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
-        /* We default to ending the TB on a coprocessor register write,
+    }
+    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+        /*
+         * A write to any coprocessor regiser that ends a TB
+         * must rebuild the hflags for the next TB.
+         */
+        TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
+        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
+        tcg_temp_free_i32(tcg_el);
+        /*
+         * We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 96340520ee..46a0bf51c9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6890,6 +6890,8 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
     ri = get_arm_cp_reginfo(s->cp_regs,
             ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
     if (ri) {
+        bool need_exit_tb;
+
         /* Check access permissions */
         if (!cp_access_ok(s->current_el, ri, isread)) {
             return 1;
@@ -7068,14 +7070,30 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             }
         }
 
-        if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-            /* I/O operations must end the TB here (whether read or write) */
-            gen_lookup_tb(s);
-        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
-            /* We default to ending the TB on a coprocessor register write,
+        /* I/O operations must end the TB here (whether read or write) */
+        need_exit_tb = ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
+                        (ri->type & ARM_CP_IO));
+
+        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+            /*
+             * A write to any coprocessor regiser that ends a TB
+             * must rebuild the hflags for the next TB.
+             */
+            TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
+            if (arm_dc_feature(s, ARM_FEATURE_M)) {
+                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
+            } else {
+                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+            }
+            tcg_temp_free_i32(tcg_el);
+            /*
+             * We default to ending the TB on a coprocessor register write,
              * but allow this to be suppressed by the register definition
              * (usually only necessary to work around guest bugs).
              */
+            need_exit_tb = true;
+        }
+        if (need_exit_tb) {
             gen_lookup_tb(s);
         }
 
-- 
2.17.1

