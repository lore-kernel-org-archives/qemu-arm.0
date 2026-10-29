Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8F606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vAXiw1XS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSkq-0005gO-Ol; Thu, 29 Oct 2026 12:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkk-0005cB-BI
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSke-0000XS-DJ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so2083302f8f.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290394; x=1793895194; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C6gEIGSn1fbeHbuTGwNVwS8Xb0RMqOlj0GQbPLR/fOU=;
 b=vAXiw1XSTUWYYbfsM8ZkvKPmUDPE4lvvS+lY56XiRRl14uucMere6gamCCXav1S4RX
 wx1JcmPXyqv+NeDXqGH+AprgQvzLv0AVFGEx2f+698dITKwuHlRsZPgwcZkdAiEAeIBh
 INpPZtFtd9hfeIS6AF1ueszYx5BrqNigtjtLdns1iHwsgQ7/bmWxR9G6mxZHFbkIgYda
 1jk6JMf2yCHCgJ7eV8qGYmZuWxOkS6wuvomhCAZtE/PcZreeOTpXuyavt0XAAG5heFJ+
 9iVMdL4CQSam5vnurtXfLtr4Nqk9oTARA2r7m0ATF9vOAKDNn1cozphEXdm56DDE1SJh
 mQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290394; x=1793895194;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C6gEIGSn1fbeHbuTGwNVwS8Xb0RMqOlj0GQbPLR/fOU=;
 b=2lvVdXIiaUIFFaGUfTxz5KOiW2nFRBITYvT7j7/frf+adr8J4eAAjPLCJglz6x9Z0V
 TODHoMldsJ4JBd3seStrfRiTduNVkxEa6jLd+YzhQTgd1hDhju/hxnd8b6YxyT8LqiVt
 PSlHOShwjDaaQpP9A6zoBhF2AdAWHEC5DWKOygatp+2wAO1xotLAUo4vSy8PDz+HHof0
 IBMasw6gremrPONhznFbSj8xhWLVzi3e5aYufH0v0OfucfuyVSZtmcb3nR9g1jGWZr/u
 cv4Ij4/fAA130wCl5MhY1I7mLCYudd+AaKUHECz8lzVwVqeh5fKDx72QDjlBYYKFjxIm
 PUtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMrCveSElLFwwZtll2BYF5c6BG9LAvdFs9qM1HP3Bop3iEIWnN0lDkmVxD9+jjWRbRtseG/9ClwA==@nongnu.org
X-Gm-Message-State: AFq9FYKFaHwe1TztndP1S7tHtTUqH5mJCI+3P0OvpWTs1rd29gP8rarn
 Xrj8t6CnD8jbfnWqmTZkU0FtD0yUAWpbwBRrKpv8Sx7Vn+O/A8V76fP6PiJw1uUPoGU=
X-Gm-Gg: AYBFou3DZln6TuP1ceGTa6fQ4cegHOD01B01Mr6pFOhWYuUN8WE9Bhtgk2cfpl+qowi
 PqjvZ+foCxGuwDwwtpbimPQ25wV7GBd32IbNUDb7eMswJ4KzlOrpKNqjUHT+pNDVZ7fGwsE+19f
 5bj2eBTMbbddLhxcJ67yODTvPON9pupuaawOpUc0HAZ9N2tdskB7NMuMo+NtLp5cdK3gtA6JMfq
 HRmekAxgO6cnK3Waf9PvOZdterzGmkRMawO3Gut8qxKKUQFXUAV4z5Afdi4D+Xg/oEo9yeOLnKS
 XjQ3ett/SETmM1O4VzcOYmocixG7sABVsR+gkncRrpMb6aRBkKEaGaerwmZdAclCqfLiOaxHGwL
 31Etnc0EPSpcCvUtyeb5Lg2f0Xz3zhr9qAHwwVpqkQfBz658hhR4naYzbp55+r5B43hQUTEcFEE
 2HsV+xP4+K7hkhriTLC1sUV/jzKX7CuguJYRw5J2tcSIOOr/lbeLKOtO90QH0CDL9koEil/w5pH
 uvie1EqggpMAAiXBNtjZARasW5B+FHglRiHsXxI8vSIL5GuTTTIQ9dQ87mvizK64DtvMOtSnNhP
 PwyWaJCqO4dKF/dTOXGnOASInJdwgI13p+WZOfNpVYp5EYyN9Q==
X-Received: by 2002:a05:6000:2284:b0:48e:69ff:b8a3 with SMTP id
 ffacd0b85a97d-48e69ffbb32mr3297087f8f.38.1793290394252; 
 Thu, 29 Oct 2026 09:13:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6dfac9d9sm88425f8f.44.2026.10.29.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 877285FA05;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/8] target/arm: don't pass env to the sev helper
Date: Thu, 29 Oct 2026 16:13:06 +0000
Message-ID: <20261029161310.2065290-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It was pointed out during reviewing a recent fix that cs is only
needed as a loop variable for CPU_FOREACH so passing env is just
wasteful.

Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND for Cortex-M")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper-defs.h   | 2 +-
 target/arm/tcg/op_helper.c     | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 target/arm/tcg/translate.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 269ac515065..4f9736e6796 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -60,7 +60,7 @@ DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
 DEF_HELPER_1(vesb, void, env)
-DEF_HELPER_1(sev, void, env)
+DEF_HELPER_0(sev, void)
 
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 5788a094123..4a31ce979c6 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -468,7 +468,7 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
 #endif
 }
 
-void HELPER(sev)(CPUARMState *env)
+void HELPER(sev)(void)
 {
     CPUState *cs;
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0c712e7ac2e..941254983e9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2148,7 +2148,7 @@ static bool trans_SEV(DisasContext *s, arg_SEV *a)
      * SEV is a NOP for user-mode emulation.
      */
 #ifndef CONFIG_USER_ONLY
-    gen_helper_sev(tcg_env);
+    gen_helper_sev();
 #endif
     return true;
 }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 6983153ffc6..c1970f93c8f 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3282,7 +3282,7 @@ static bool trans_SEV(DisasContext *s, arg_SEV *a)
 #ifndef CONFIG_USER_ONLY
     if (arm_dc_feature(s, ARM_FEATURE_M) ||
         arm_dc_feature(s, ARM_FEATURE_V6K)) {
-        gen_helper_sev(tcg_env);
+        gen_helper_sev();
     }
 #endif
     return true;
-- 
2.47.3


