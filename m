Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp735547ejb;
        Thu, 15 Feb 2024 10:00:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGPR1V0I9V+Zki8SgYTWcSnDAywbeNqvqKrEzHCu/APVnfcC7tu7XQzSOP+CA9ia2KLOA5xuobt9pV9jDMqlexXXHNPXMu
X-Google-Smtp-Source: AGHT+IEH6dWu4tZL9e3Eb1A1RzdTnZqbzQXu4ypFpUvnbkhtvy/u2W41Z64jSvjxSn8GmPyfKWDB
X-Received: by 2002:ac8:7d81:0:b0:42d:c864:4fd with SMTP id c1-20020ac87d81000000b0042dc86404fdmr2661383qtd.6.1708020004876;
        Thu, 15 Feb 2024 10:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020004; cv=none;
        d=google.com; s=arc-20160816;
        b=WE2TMO1343RPb8XK3bROL0kqCz0BfDBtlDeX/p5Mqv7LM4ajGwOB/BeiIu0JmoDymg
         0l0ooZluCriHyoYyM28hbid76MiKx64LBkWztYldq87ZcDY8dfx0x8FoghVyw8NdvnCz
         4+5E276HsIqHgqgYAaqkxKFd2fTfzWH+UCMuLvKqzf9NsDz1aU1SQcxOEECzZbvYT2Hq
         q4tc/4ebjHaqGOkF9uAcyIxNUAg26jWYDrx8C506gcGPXI45TTADV3sD4rnPQr9nSJ/9
         U6H8IGHwxXQtjGHq/XhhUnDa5eAOVJMcs7mMESqcF9pRbbCpswEVYvH9dhUjJ2x5si1A
         /7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8KRNAN7J6jVrW+a5YkWZvl2JIbNfjxd3JGHRrNe6AUc=;
        fh=wwIkG/R7c5p9xHi5wYEcw4twPRXQ118nLR8YaoJ+VQY=;
        b=W8cEIrqjSf1Ue2hXdMuLDgtIpSGN9s9C/5oki2+WICKeHLBvcjRUa5t6E1BSTmLbdd
         fhaXTfKZrAKuCKN9BpnIn+iykGPqF9ymC9eIFVV90igkC2u7lCENZURSVsYkrDsTvqw7
         BOQC1rzn6gc4/PQ5cPd9oPuIaW9v7JInmy3qNPd9x+cTiCR131BFzBP/dw2LsqQ2rutr
         lIQn3fyl3+AmHViy+GeRDXEpgWwNl1dc8pFjNReROTQ/iAl60kI+Ez1N7TcYfTHlLxC2
         NsOXuDXAS4apr6LjTOKgTkpt8sTvzkiMZVYnWpDvAPFsAwDQDVI5vE4gIT2ZtZ5hqNFu
         KrUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwckSceF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a05622a034a00b0042c7e0bbcfesi1988702qtw.546.2024.02.15.10.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwckSceF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag1Q-0004wF-W7; Thu, 15 Feb 2024 12:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag13-0004Py-Hv
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:21 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0w-0001jn-9Y
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:21 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d208be133bso11347561fa.2
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019952; x=1708624752; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KRNAN7J6jVrW+a5YkWZvl2JIbNfjxd3JGHRrNe6AUc=;
 b=XwckSceFGVkZ5LLhJ+dnl+6hw9goj7dHawTxXt8MhWaOJ/0EVV/R7XCVpeRzEja8+D
 uMVxDtGZooeYAR71+3Mj13ETEbwG9eRyEGs5byjkJGV7x8XS5X5H9kT8W0YOR79GFMdS
 ZdQ+bOAm3bzA82my1ye1Ov8jq7TM8aJve9QhDtqnRmlKU1iqHlhmJ594aQw0Ye1+XbXn
 viVA2/P6s0T0SIzftbff8Oyj0aomOn2i8QmHjA5IcK4hpqVV6rL8x3Q+runs1FIJmWk1
 ezwElO45+IcNVzm8hbaddoAUkJYs8+drb9BWcqNchvGzscf3mkuztvJ96HXPqDvx0i5N
 2sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019952; x=1708624752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KRNAN7J6jVrW+a5YkWZvl2JIbNfjxd3JGHRrNe6AUc=;
 b=w8SVqDJ6vX//+FAI3uUPbk9CEmRxfMIRdzcicIkQN2dwCWwGfowY7m0/Psk9Gvjh1a
 F5e54S8xofIiDI4B5k9OrCQqaWZ7fN6qaFW6zq/NXWWUSl1kGm79j7knFIONm4ovg3Dv
 emvDiGzuyHpp869rUe+aL9UbSJ3wUTIBwKFD2HHC5hUTqXhWobE4HgOmQejwnnguxtMn
 y5+bhFzFmQIWRWtsG3KxR1QjlY8npTpRs+ayujGtc8ScCvkvKFh9JxcQX13P+CidhJC6
 C+7XUxOzIMobNSwBGKgcjKazLIpRmbCZ4RnMlsWH4tesHsxSMwgIyt/ueg0QWn11xhAx
 M++A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbUBkhQJcbI8J75uENAmOsHLbUEONYBOY88vFI6Ve3FuDRTdIc4fu8YxBOS8K/ozrb7tIt1UwqGKwsiMLehqNsoAzc
X-Gm-Message-State: AOJu0YymY47ojIgW5B6jydHSoel4/ZZznbAzihJyE+JmxGhKdJ8LKCh3
 z0YSVOqSmq31A9760Mku9riwRlxzYxp7KfEdP+/fPfE91onqPbEz6YDS4P4nJ+Q=
X-Received: by 2002:a2e:8018:0:b0:2d0:d3ec:a545 with SMTP id
 j24-20020a2e8018000000b002d0d3eca545mr1850052ljg.50.1708019952746; 
 Thu, 15 Feb 2024 09:59:12 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b00410ab50f70fsm5604008wmj.15.2024.02.15.09.59.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:59:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 12/56] target/mips: Remove helpers accessing SAARI register
Date: Thu, 15 Feb 2024 18:57:06 +0100
Message-ID: <20240215175752.82828-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: /WNpHMWtLeeO

DisasContext::saar boolean is never set, so this code
is not reachable. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-9-philmd@linaro.org>
---
 target/mips/tcg/sysemu_helper.h.inc |  1 -
 target/mips/tcg/sysemu/cp0_helper.c |  8 --------
 target/mips/tcg/translate.c         | 20 --------------------
 3 files changed, 29 deletions(-)

diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
index 78f7272208..1861d538de 100644
--- a/target/mips/tcg/sysemu_helper.h.inc
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -100,7 +100,6 @@ DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
 DEF_HELPER_2(mtc0_hwrena, void, env, tl)
 DEF_HELPER_2(mtc0_pwctl, void, env, tl)
 DEF_HELPER_2(mtc0_count, void, env, tl)
-DEF_HELPER_2(mtc0_saari, void, env, tl)
 DEF_HELPER_2(mtc0_entryhi, void, env, tl)
 DEF_HELPER_2(mttc0_entryhi, void, env, tl)
 DEF_HELPER_2(mtc0_compare, void, env, tl)
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index f8883a3515..ded6c78e9a 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -1077,14 +1077,6 @@ void helper_mtc0_count(CPUMIPSState *env, target_ulong arg1)
     cpu_mips_store_count(env, arg1);
 }
 
-void helper_mtc0_saari(CPUMIPSState *env, target_ulong arg1)
-{
-    uint32_t target = arg1 & 0x3f;
-    if (target <= 1) {
-        env->CP0_SAARI = target;
-    }
-}
-
 void helper_mtc0_entryhi(CPUMIPSState *env, target_ulong arg1)
 {
     target_ulong old, val, mask;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 173b19a090..3ba2101647 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5653,11 +5653,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Count";
             break;
-        case CP0_REG09__SAARI:
-            CP0_CHECK(ctx->saar);
-            gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SAARI));
-            register_name = "SAARI";
-            break;
         default:
             goto cp0_unimplemented;
         }
@@ -6374,11 +6369,6 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_count(tcg_env, arg);
             register_name = "Count";
             break;
-        case CP0_REG09__SAARI:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mtc0_saari(tcg_env, arg);
-            register_name = "SAARI";
-            break;
         default:
             goto cp0_unimplemented;
         }
@@ -7143,11 +7133,6 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Count";
             break;
-        case CP0_REG09__SAARI:
-            CP0_CHECK(ctx->saar);
-            gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SAARI));
-            register_name = "SAARI";
-            break;
         default:
             goto cp0_unimplemented;
         }
@@ -7850,11 +7835,6 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             gen_helper_mtc0_count(tcg_env, arg);
             register_name = "Count";
             break;
-        case CP0_REG09__SAARI:
-            CP0_CHECK(ctx->saar);
-            gen_helper_mtc0_saari(tcg_env, arg);
-            register_name = "SAARI";
-            break;
         default:
             goto cp0_unimplemented;
         }
-- 
2.41.0

