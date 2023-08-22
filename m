Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp690723ejx;
        Tue, 22 Aug 2023 05:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCHraXjwtsMjcj38/rcceEtDFcm59hhm48DQoL9w41HzUf32gsEOxvuMhT/zT3VhEwFcAg
X-Received: by 2002:a05:6830:22cd:b0:6bd:1059:8212 with SMTP id q13-20020a05683022cd00b006bd10598212mr11729502otc.26.1692708086477;
        Tue, 22 Aug 2023 05:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708086; cv=none;
        d=google.com; s=arc-20160816;
        b=mmAvxpcWugv9USiO6ZBgVKgBHmE+I3/S4yej93/Z4aMClQ9qPsNaQuVImrCmy2zsnA
         2XpNYobJ7iQolLm6ZSF9huv9acFHT3kDZhHYI9V8d0+jD1pvlS09vPxKamPK+xOJLE7m
         20dBrULPDbuOMgre48GZx8oZKNYM4oqXG/R3vGjz2lZvEpkieFskZZ43lU5LqNcsfyKk
         uC1xgDcZ/4nzLsU9u+RWX3NO0JMcq0wFjMaRj2cZb8k+DiWchKAfniyDOW/RyyCWtVst
         +5ma0eHpgVPSZCLTD/Wwat1eTc9xLzAHDQjhUTrVW2SK8F6NxR/Egpgi/oH3s2MyjDqi
         MsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nsvUqHlFX1jn4aW9Gaw9PjawxbooLIqjbrbXDvQlkNQ=;
        fh=wXqw6aajGBSP4OKAgbWKHj3BSg7Yrdz+j0I8chPJZNc=;
        b=FJazEm2sPhjyjCtrsQDUt07L/WJH7eediuLD983o259A/Xbqz1+rQ+Nrqye6iiHrtP
         VM3NPVRS3V+jX2PNMaW4m8IobewHXAo0XpjRcsHth+YquBuRw/+ks9XfYy2NwpPld4uV
         js4UmOTtLyFpl57xeW6atagllSvyvJGJqTIORXMo4pHNjv/4UUTKG2V5EWeBKEcl45Fs
         aERZ+AdTD4OFn8t8ns1N5luprOWqwCPSgrMA+1EcPQ+PWf5JPZJ5d7PmKI9PsU+IUHwt
         ccrgiqT+K3c761/EDMfM5+4iPSWExqiET3W9Q8pcFf7ml1OHmAOkVnXJ2CSsFjI9xT9U
         Pj5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MojuRq3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a025400b004069477817asi6155871qtx.273.2023.08.22.05.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MojuRq3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQh6-0006Ku-Q2; Tue, 22 Aug 2023 08:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQh1-0006Is-RL
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:08 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQgz-0005ZM-7M
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fef2f05356so17270855e9.0
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708063; x=1693312863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsvUqHlFX1jn4aW9Gaw9PjawxbooLIqjbrbXDvQlkNQ=;
 b=MojuRq3FcpEf1spcBl2fm+knldksxR4XIvwkbCZDoW/kyW6EKK2Aq2JsjcSw4SsnGS
 3Ei0IW0w2y3nXhtD47WGgg5chYQMHz8JuUGVok00ftlwd2RA/AzKGgmpVRaQg/nH8mXS
 sfZJooNcH2Uf0albij0xzSD17WVUA+vGUOhdV3Mqt46lKc5kg2Vw+4bFsj3X97Z2qjG6
 TuNu0Tr4geaYFMjoFsUbDSuQtxinxoYM0SpGzzAUoNC1n0yHJAUcPw+p4rGp0Fr722YQ
 DKMj+PXIbDc73wqMsAKWaCugRD0i/UjJZ32GkP6q0VWfpew4ujfPWS5Wl/NR9FDe3WVr
 2GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708063; x=1693312863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nsvUqHlFX1jn4aW9Gaw9PjawxbooLIqjbrbXDvQlkNQ=;
 b=fOAEpeEN+P6IGNUtB7R3hyFpJJ8bOGZ7Zz5Mgsj1WhiqGZJz3kl1YnubxTPHQYeZ4n
 nqugD2YiNsghQy9MWptYPquGEP2KVdFcUrD+Qq2Un67trfXGflDlXuaF22kUUUEtSuaM
 BP5XsdxbtKGz6Ao1kbHqMTxphtsXP6rdWIF24S12LA2SuEgrswpnM2lNO6Abt6ViLpvT
 1bB1TEK84/9U0w/rYS0HFDSVpKnYwBIGlPEwqVU68HTGSV+YkoN5XvY7Hjr4vOju7aW2
 tlOjeJglgglJgyDwSkalZYXfj+X1gXsJFRjNNxZNAHT0qp4J0x/5mq0z1UDog1WbcA8A
 g2eg==
X-Gm-Message-State: AOJu0YwmjCwCDR3r25Ek1RLpRXHkcuVQy1FECiCiO+e4qjcdzefMrBNX
 X64cAQzTEbbwPL4XX/tiKzZ3LQ==
X-Received: by 2002:adf:f70c:0:b0:317:5af3:caa4 with SMTP id
 r12-20020adff70c000000b003175af3caa4mr7256713wrp.38.1692708063580; 
 Tue, 22 Aug 2023 05:41:03 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a056000014f00b0031ad5a54bedsm15923239wrx.9.2023.08.22.05.41.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:41:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH 02/12] target/arm: Use generic hrev32_i32() in ARM REV16 and
 VREV16 opcodes
Date: Tue, 22 Aug 2023 14:40:32 +0200
Message-ID: <20230822124042.54739-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jfjxJTlE4drQ

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate-a32.h  |  1 -
 target/arm/tcg/translate-neon.c |  2 +-
 target/arm/tcg/translate.c      | 14 +-------------
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a32.h b/target/arm/tcg/translate-a32.h
index 0c8f408eea..6cc02c83b9 100644
--- a/target/arm/tcg/translate-a32.h
+++ b/target/arm/tcg/translate-a32.h
@@ -45,7 +45,6 @@ void gen_lookup_tb(DisasContext *s);
 long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
 long neon_element_offset(int reg, int element, MemOp memop);
-void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 void clear_eci_state(DisasContext *s);
 bool mve_eci_check(DisasContext *s);
 void mve_update_eci(DisasContext *s);
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 0e59b03ff9..9489dc0b3e 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3528,7 +3528,7 @@ static bool trans_VREV16(DisasContext *s, arg_2misc *a)
     if (a->size != 0) {
         return false;
     }
-    return do_2misc(s, a, gen_rev16);
+    return do_2misc(s, a, tcg_gen_hrev32_i32);
 }
 
 static bool trans_VCLS(DisasContext *s, arg_2misc *a)
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 39a42611c6..4ebf04f4de 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -416,18 +416,6 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
     tcg_gen_mov_i32(a, tmp1);
 }
 
-/* Byteswap each halfword.  */
-void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    TCGv_i32 mask = tcg_constant_i32(0x00ff00ff);
-    tcg_gen_shri_i32(tmp, var, 8);
-    tcg_gen_and_i32(tmp, tmp, mask);
-    tcg_gen_and_i32(var, var, mask);
-    tcg_gen_shli_i32(var, var, 8);
-    tcg_gen_or_i32(dest, var, tmp);
-}
-
 /* Byteswap low halfword and sign extend.  */
 static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
 {
@@ -7578,7 +7566,7 @@ static bool trans_REV16(DisasContext *s, arg_rr *a)
     if (!ENABLE_ARCH_6) {
         return false;
     }
-    return op_rr(s, a, gen_rev16);
+    return op_rr(s, a, tcg_gen_hrev32_i32);
 }
 
 static bool trans_REVSH(DisasContext *s, arg_rr *a)
-- 
2.41.0

