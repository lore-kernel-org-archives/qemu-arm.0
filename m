Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5026186lfr;
        Tue, 13 Apr 2021 09:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGWaXSs9jejXxVTO9h6bPnoh103UkK2AEhjetcMBE/2VP2fycQTKalRoG06iqtOMAxHxqM
X-Received: by 2002:a05:6602:2d04:: with SMTP id c4mr28250978iow.182.1618331262903;
        Tue, 13 Apr 2021 09:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618331262; cv=none;
        d=google.com; s=arc-20160816;
        b=DbnE6xXOyglYrpwlCLmt0TwmvBidg/3rkIUr13irbZsyFAdFWRnGoYJzWdBRHxKsSy
         bX/E6tMs8dtJyjE1fedo2xTWxMOZ8MiWwaboWWFc4UzfkUwAuZYVu5OnDQCO9VjHVpDM
         SaQ2xwDsVDgSWhddCHEwsaZM5S90xhtP/RD3kpFueotI0ZWYO1Z3JbpwwDFvJPzPz0tt
         OzcP4fyiYlOXNulpHdvfkqsPUt/P6xRLc+rc9aU18lSoeW9Gjj8buW0AwcDOSPmFbOfO
         huMqTYZIj5q+tw6iUfX/VS7pnZBnh1Ic1xLDSIr0YWfVEIAOU5I5T3d8ZcYFkrsJnt36
         B+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zJftxWeOf1waFo8PZ0HmoXVAIrP81e+QKyBtFEMWQ/s=;
        b=lovE6avzglA3ehORXdxq7gpaadM76gFjVBTeyq5U2iFYjoIRTG1tLFWRAFm+9dLMzq
         KF0p02wMLc8KgA4X9nF/bnPywQpbz+4ffd4fB6XcgTew0G02UhczwibUovwYm1HvDMTb
         b4lgWia3g5bMOtU12U6vjSih0anMvoEC5LM1OZGfcwvacZHEl0xw6/XPgIsrdAZa534/
         UH3AL6hjw81XMnw7sNt7qn5b3pYh0DAYaySaStpM/G5nQC2P4Sz+AxaZDPaEFeXsdP2Z
         62WcbDOokT/E0AXysxL+sCn4B5U8aMf1Hpy8QsuR9+Ts2NmI+oYOOP2y15jS5qnO+Tem
         5H4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwPvgcUv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si16884203ios.97.2021.04.13.09.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwPvgcUv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLt8-000477-72
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaZ-0006T4-Sy
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaS-0006wV-1x
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id c15so8060739wro.13
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zJftxWeOf1waFo8PZ0HmoXVAIrP81e+QKyBtFEMWQ/s=;
 b=GwPvgcUv2Xgb/pCrm6mHysuUBo4ESzHXBIgJkjg4WEm6o9713WHrxJnxPFpOsQK7uc
 Zj7nj8tF1bRrDH/ukaStJiyvgeiNrZa50tCrdcioqeqts/WrRXql9sQHQtYFF0O/WrnR
 EVoW4GUMfCBoOID6vB6HzfsR5o1+du3CYQN4gmHOOV41VmMUETVXujlGy8fbz0LiqjYQ
 kM3JjF5QlHMfV7g0Tu7sXwLGzb6wQMH7oNzuUIgbXeKhVw+KMRcRHwkF/0Tu9lzrQwfP
 yfhBjdvdG3re1I3K57Ngct/qL0azj7gqOSeX/qVdugiBWXPFGg3I1G1rTKYtjBR627jG
 Yu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJftxWeOf1waFo8PZ0HmoXVAIrP81e+QKyBtFEMWQ/s=;
 b=JuiXBviMm63UODaIjFN57xolajUS6s7HN3Ypaq56xxh4yl2dm09n3qOtRazRAw5hRi
 70KGJPYaNDARNhjMXi971dh4TEaviaxW+bcjD7puPvVc86T79X/Lbv6oqvM7ZMBs+8FJ
 N+7Qk5qhQ5LC8UUVjYTHIScdeIP6mY7zbyzLBHfKLb9mo148W+mVu+7lBIndvLEHeSmj
 pnCyIjDEl+EJvWFr+UJCboAiYA4SmGHas8VffmowwKf87QGAhmJw4htH3d9wodZHjAF4
 S9WHV/BVL0AF0x11MM6cmB7ZKWnuIb5uCJvgZNhw2Ipu9pnUuvKvczElJi9H5NtfCkbx
 UMrQ==
X-Gm-Message-State: AOAM53260X7kzViqo/w6yojus9Q8mR1stm+2dQb5MN6T3jvunVhpISoX
 yaFn5U2W4GCbEwOy1jeSlmwts+WRiMxbNebM
X-Received: by 2002:a5d:6682:: with SMTP id l2mr13269224wru.306.1618330102357; 
 Tue, 13 Apr 2021 09:08:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/13] target/arm: Make translate-neon.c.inc its own
 compilation unit
Date: Tue, 13 Apr 2021 17:07:59 +0100
Message-Id: <20210413160759.5917-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NwBkDV4nxuwR

Switch translate-neon.c.inc from being #included into translate.c
to being its own compilation unit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h                           |  3 +++
 .../arm/{translate-neon.c.inc => translate-neon.c}   | 12 +++++++-----
 target/arm/translate.c                               |  3 ---
 target/arm/meson.build                               |  7 ++++---
 4 files changed, 14 insertions(+), 11 deletions(-)
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index f165f15cc47..d3aeb5a19c9 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -24,6 +24,9 @@
 bool disas_m_nocp(DisasContext *dc, uint32_t insn);
 bool disas_vfp(DisasContext *s, uint32_t insn);
 bool disas_vfp_uncond(DisasContext *s, uint32_t insn);
+bool disas_neon_dp(DisasContext *s, uint32_t insn);
+bool disas_neon_ls(DisasContext *s, uint32_t insn);
+bool disas_neon_shared(DisasContext *s, uint32_t insn);
 
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
 void arm_gen_condlabel(DisasContext *s);
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c
similarity index 99%
rename from target/arm/translate-neon.c.inc
rename to target/arm/translate-neon.c
index c6f8bc259a1..6532d69f134 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c
@@ -20,11 +20,13 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * This file is intended to be included from translate.c; it uses
- * some macros and definitions provided by that file.
- * It might be possible to convert it to a standalone .c file eventually.
- */
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/exec-all.h"
+#include "exec/gen-icount.h"
+#include "translate.h"
+#include "translate-a32.h"
 
 static inline int plus1(DisasContext *s, int x)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f6d71d03a3a..b00344b933d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1149,9 +1149,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
 
 #define ARM_CP_RW_BIT   (1 << 20)
 
-/* Include the Neon decoder */
-#include "translate-neon.c.inc"
-
 static inline void iwmmxt_load_reg(TCGv_i64 var, int reg)
 {
     tcg_gen_ld_i64(var, cpu_env, offsetof(CPUARMState, iwmmxt.regs[reg]));
diff --git a/target/arm/meson.build b/target/arm/meson.build
index f6360f33f11..5bfaf43b500 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,8 +1,8 @@
 gen = [
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
-  decodetree.process('neon-shared.decode', extra_args: '--static-decode=disas_neon_shared'),
-  decodetree.process('neon-dp.decode', extra_args: '--static-decode=disas_neon_dp'),
-  decodetree.process('neon-ls.decode', extra_args: '--static-decode=disas_neon_ls'),
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
   decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
@@ -27,6 +27,7 @@ arm_ss.add(files(
   'tlb_helper.c',
   'translate.c',
   'translate-m-nocp.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
-- 
2.20.1

