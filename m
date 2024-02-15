Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp734973ejb;
        Thu, 15 Feb 2024 09:58:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDvcuj679ZiioBX5EbzYz+qW5B+W/ddUE88chmKKo50K2NcayLzfwQHkhJ9pWv/lgpNeC56yPOt7tXSHDva9VUnivLfU+I
X-Google-Smtp-Source: AGHT+IEx+t81sNiJqdvOAc/W90UlLbcloZyLfh1KCpknNdJoO7/dEwNMyultnUxpaf/t1AhSDZOc
X-Received: by 2002:a05:620a:22b8:b0:785:9690:91c with SMTP id p24-20020a05620a22b800b007859690091cmr1842610qkh.41.1708019939541;
        Thu, 15 Feb 2024 09:58:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019939; cv=none;
        d=google.com; s=arc-20160816;
        b=P2zk5rtaeU+fe1947knGtuU5PMhuue8EK/KpUvP8URaTz1+5fidHTbgcAH2GNFyeaR
         eawOZ2ZGrIUqw9+e1/PJ+1c0pnEa4UMicdX4zAE+3VsqVyHMu2l5Amwuq4f+CACZUHfH
         +/UY4MhlJOPur0mUhJL24+BZpKuWQkuOLpxjQmjR8mYi6njO3rrdGDPLoOz6I+IztZiN
         jhfMfZ4x9Ru05xorwuoQqNwBkYE2Exui2yprqtxmBux6mbL9ZEbf0c82Rls1erXf2xtr
         wSH7gvMYhp9Bg0Xj3hbFPnZCK+407Ho+d7+7aYMhx6IV0ySBXa0lpNsETnWDodkN6XhS
         t9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lxUYbRglPJnZ4TffGBHIWw40wYoW0NPrXDzHGmrcbes=;
        fh=f4DcI/Go8gKPKwPuNmpT80EFIMQ6rofF7RDbrtMQY+E=;
        b=SaYczRHUZMslg+fb1clC8slsQIfuIjmNbPXg6vMn+qEEnKezfd4lBSOlzvNuoHDqmM
         1JLpNCKmUV0Vlx4w262Wm+IKU4FagP0dN0LGX9wa0dovdofk96wkQSmnH1/t7STPhug9
         HQIMdqDIe5azIN8BFSTIdS3lTVT7QNsC/2m0kLNhugEcEkWWQp4RP17FAz0aGbqlzwjy
         3BDd1VjKkuaWGjFiCbkEq7P0xyTaz3TCJGo19tb8BaZ/e5jykzoMfWzv+znVJWWMNj3a
         XWNar50l8r7N8uEf+cWo35iwGV0pSDR/aB7IUfDZ7diY2h6Y2ziiUzW1AR2WuarbqoJ6
         38NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JZC/gNUp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay17-20020a05620a179100b007869b71e5afsi2258377qkb.540.2024.02.15.09.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:58:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JZC/gNUp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag0C-0001io-6a; Thu, 15 Feb 2024 12:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0A-0001hK-Lp
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:58:26 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag07-0001Wc-9k
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:58:26 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41211097adcso7852575e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019902; x=1708624702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxUYbRglPJnZ4TffGBHIWw40wYoW0NPrXDzHGmrcbes=;
 b=JZC/gNUp46M0PUNcvyvK9KsxoHL8BZTuhB1azH+bhI7QQQiKdAR4eiGKGX9VwTRvwp
 Qy62iBZWftc9pDLYELNAkUtdGXzPdbIQLzQNRamNZprUotGG3lmeGcDi8PjLkKr4g61F
 szcvhjJf9PsbFYH4x7X0F0mv2jk+oyuULOA/1jD0Pic5AL1u5ZN3YHmFXuOjaakbQtPM
 FBrzrvZ53bdp9rKuxjeaIuyzV1XZ4CvcH9F9+J1PRymvB3AMoTj23hlJkyNhleOuwafR
 ldsBhsULNkj4K+kEbMpWApYxxbY6vDeAU4edyS/FQggItDdJSaCo7AlR+ZVc6rY4Yizu
 BCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019902; x=1708624702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxUYbRglPJnZ4TffGBHIWw40wYoW0NPrXDzHGmrcbes=;
 b=HMOVb9vL1ulTWdoWv9KWSoxznP7RnRinQwIVWgovEjDz8gq6/UAuLaKdZhJHQEYrS8
 ySRWBzMWla06bUJnIbrfJ756M25c8Ns66ZBVf8q00EOGTrbA4u1uYvZ/TEV1e+tdeNmt
 +jr0VX/6hseLQxVexPOCMXxOLFFU/pln9gxGEq14uRdPPhN8I0Q6D0lpw6xVi00ahQ4h
 EsnKXnEsT4SycqCJ1PxMQe5+PKMIowCj+zMuBa4KAIT/ZFA+Fjktrsw3Z0h3fFiM/QC3
 C3v049IuQzpXOumxg+zUW3YrAKgA2aK4ll4hmXlc4dERRVVNntGnPLUW5iIGviKsbtL5
 fllQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx5aFXYVmRdn7H2krGMCW3+C7LsO66O0CKSNUIBKteonZavl2ksDqwMC2JA6u7ch9bhSPb89x+Z7TTohSlf8c0NzPl
X-Gm-Message-State: AOJu0YwxLGuhbEUO1ROtscLicUxyIep3iDSsYeVz/hZIhSypANq80Km8
 OoGIX2gVx33nqV6lNGCx2ZxMTz3BE+OgvdHkl88GeVfIUvwQUnTbhn5zgVj9uog=
X-Received: by 2002:a5d:49d1:0:b0:33c:e2d9:ad36 with SMTP id
 t17-20020a5d49d1000000b0033ce2d9ad36mr1967022wrs.20.1708019901832; 
 Thu, 15 Feb 2024 09:58:21 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 k2-20020adff282000000b0033b8808355fsm2424533wro.28.2024.02.15.09.58.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:58:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 04/56] target/mips: Remove helpers accessing SAAR registers
Date: Thu, 15 Feb 2024 18:56:58 +0100
Message-ID: <20240215175752.82828-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JmGekEFvTC9j

DisasContext::saar boolean is never set, so this code
is not reachable. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-2-philmd@linaro.org>
---
 target/mips/tcg/sysemu_helper.h.inc |  5 ---
 target/mips/tcg/sysemu/cp0_helper.c | 55 -----------------------------
 target/mips/tcg/translate.c         | 42 ----------------------
 3 files changed, 102 deletions(-)

diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
index f163af1eac..78f7272208 100644
--- a/target/mips/tcg/sysemu_helper.h.inc
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -31,8 +31,6 @@ DEF_HELPER_1(mftc0_tcschedule, tl, env)
 DEF_HELPER_1(mfc0_tcschefback, tl, env)
 DEF_HELPER_1(mftc0_tcschefback, tl, env)
 DEF_HELPER_1(mfc0_count, tl, env)
-DEF_HELPER_1(mfc0_saar, tl, env)
-DEF_HELPER_1(mfhc0_saar, tl, env)
 DEF_HELPER_1(mftc0_entryhi, tl, env)
 DEF_HELPER_1(mftc0_status, tl, env)
 DEF_HELPER_1(mftc0_cause, tl, env)
@@ -57,7 +55,6 @@ DEF_HELPER_1(dmfc0_lladdr, tl, env)
 DEF_HELPER_1(dmfc0_maar, tl, env)
 DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
 DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
-DEF_HELPER_1(dmfc0_saar, tl, env)
 #endif /* TARGET_MIPS64 */
 
 DEF_HELPER_2(mtc0_index, void, env, tl)
@@ -104,8 +101,6 @@ DEF_HELPER_2(mtc0_hwrena, void, env, tl)
 DEF_HELPER_2(mtc0_pwctl, void, env, tl)
 DEF_HELPER_2(mtc0_count, void, env, tl)
 DEF_HELPER_2(mtc0_saari, void, env, tl)
-DEF_HELPER_2(mtc0_saar, void, env, tl)
-DEF_HELPER_2(mthc0_saar, void, env, tl)
 DEF_HELPER_2(mtc0_entryhi, void, env, tl)
 DEF_HELPER_2(mttc0_entryhi, void, env, tl)
 DEF_HELPER_2(mtc0_compare, void, env, tl)
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index 62f6fb4bf6..f8883a3515 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -371,22 +371,6 @@ target_ulong helper_mfc0_count(CPUMIPSState *env)
     return (int32_t)cpu_mips_get_count(env);
 }
 
-target_ulong helper_mfc0_saar(CPUMIPSState *env)
-{
-    if ((env->CP0_SAARI & 0x3f) < 2) {
-        return (int32_t) env->CP0_SAAR[env->CP0_SAARI & 0x3f];
-    }
-    return 0;
-}
-
-target_ulong helper_mfhc0_saar(CPUMIPSState *env)
-{
-    if ((env->CP0_SAARI & 0x3f) < 2) {
-        return env->CP0_SAAR[env->CP0_SAARI & 0x3f] >> 32;
-    }
-    return 0;
-}
-
 target_ulong helper_mftc0_entryhi(CPUMIPSState *env)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
@@ -514,13 +498,6 @@ target_ulong helper_dmfc0_watchhi(CPUMIPSState *env, uint32_t sel)
     return env->CP0_WatchHi[sel];
 }
 
-target_ulong helper_dmfc0_saar(CPUMIPSState *env)
-{
-    if ((env->CP0_SAARI & 0x3f) < 2) {
-        return env->CP0_SAAR[env->CP0_SAARI & 0x3f];
-    }
-    return 0;
-}
 #endif /* TARGET_MIPS64 */
 
 void helper_mtc0_index(CPUMIPSState *env, target_ulong arg1)
@@ -1108,38 +1085,6 @@ void helper_mtc0_saari(CPUMIPSState *env, target_ulong arg1)
     }
 }
 
-void helper_mtc0_saar(CPUMIPSState *env, target_ulong arg1)
-{
-    uint32_t target = env->CP0_SAARI & 0x3f;
-    if (target < 2) {
-        env->CP0_SAAR[target] = arg1 & 0x00000ffffffff03fULL;
-        switch (target) {
-        case 0:
-            if (env->itu) {
-                itc_reconfigure(env->itu);
-            }
-            break;
-        }
-    }
-}
-
-void helper_mthc0_saar(CPUMIPSState *env, target_ulong arg1)
-{
-    uint32_t target = env->CP0_SAARI & 0x3f;
-    if (target < 2) {
-        env->CP0_SAAR[target] =
-            (((uint64_t) arg1 << 32) & 0x00000fff00000000ULL) |
-            (env->CP0_SAAR[target] & 0x00000000ffffffffULL);
-        switch (target) {
-        case 0:
-            if (env->itu) {
-                itc_reconfigure(env->itu);
-            }
-            break;
-        }
-    }
-}
-
 void helper_mtc0_entryhi(CPUMIPSState *env, target_ulong arg1)
 {
     target_ulong old, val, mask;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 12094cc1e7..173b19a090 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5151,17 +5151,6 @@ static void gen_mfhc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         break;
-    case CP0_REGISTER_09:
-        switch (sel) {
-        case CP0_REG09__SAAR:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mfhc0_saar(arg, tcg_env);
-            register_name = "SAAR";
-            break;
-        default:
-            goto cp0_unimplemented;
-        }
-        break;
     case CP0_REGISTER_17:
         switch (sel) {
         case CP0_REG17__LLADDR:
@@ -5252,17 +5241,6 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         break;
-    case CP0_REGISTER_09:
-        switch (sel) {
-        case CP0_REG09__SAAR:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mthc0_saar(tcg_env, arg);
-            register_name = "SAAR";
-            break;
-        default:
-            goto cp0_unimplemented;
-        }
-        break;
     case CP0_REGISTER_17:
         switch (sel) {
         case CP0_REG17__LLADDR:
@@ -5680,11 +5658,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SAARI));
             register_name = "SAARI";
             break;
-        case CP0_REG09__SAAR:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mfc0_saar(arg, tcg_env);
-            register_name = "SAAR";
-            break;
         default:
             goto cp0_unimplemented;
         }
@@ -6406,11 +6379,6 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_saari(tcg_env, arg);
             register_name = "SAARI";
             break;
-        case CP0_REG09__SAAR:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mtc0_saar(tcg_env, arg);
-            register_name = "SAAR";
-            break;
         default:
             goto cp0_unimplemented;
         }
@@ -7180,11 +7148,6 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SAARI));
             register_name = "SAARI";
             break;
-        case CP0_REG09__SAAR:
-            CP0_CHECK(ctx->saar);
-            gen_helper_dmfc0_saar(arg, tcg_env);
-            register_name = "SAAR";
-            break;
         default:
             goto cp0_unimplemented;
         }
@@ -7892,11 +7855,6 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_saari(tcg_env, arg);
             register_name = "SAARI";
             break;
-        case CP0_REG09__SAAR:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mtc0_saar(tcg_env, arg);
-            register_name = "SAAR";
-            break;
         default:
             goto cp0_unimplemented;
         }
-- 
2.41.0

