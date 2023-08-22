Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp690824ejx;
        Tue, 22 Aug 2023 05:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwUD8m82P6MXi6ecFsQbtKtR4wUfOy/wdO+5hvIJOO+5t4tta5mcNXAq9kzC7H7nftY/Lg
X-Received: by 2002:a05:6359:2f97:b0:134:de8b:17ef with SMTP id rs23-20020a0563592f9700b00134de8b17efmr6772410rwb.18.1692708096387;
        Tue, 22 Aug 2023 05:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708096; cv=none;
        d=google.com; s=arc-20160816;
        b=PtnpreEvrcgzxd780GgpmHaIcvhSmZaOWOafd++HZ/6WqMj5GAWS+4+OUzJIJugzF8
         wpobU8s/q8kEpMwxwpVf+xYBbGfO1cNF1s50282cNwkaqz+Z1g9rzxMXNdVlj071onxP
         WRarfr3xt/0D+AlrIxizdcdP9dVM/oByuuzzaiDS+nzhj/f2kkOAER3M2qSp6OkpEehU
         M4grhPe+u1hBWj2fNFzwZcMtybLs8xszKRJOiA0JqWkWs9DkyAMXlJcNf43JpPv5DNGU
         aXLPBVxbS/P+Da85c2PzIhouwFdw4/RMYJo2Raz+VpXKembUC0YOXBBiMXS3766emeJ3
         EYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k+Q+413qAyohxkZfqCqkkltTwZ66XX4v/AfIWdcA3w4=;
        fh=wXqw6aajGBSP4OKAgbWKHj3BSg7Yrdz+j0I8chPJZNc=;
        b=NYPfp59Fd9rVyk5/CJqJoO8ERz1T5xiQ3Wwhx8EiGhuXcquobQGnMDkPUmEmvLPw3R
         tQfzB8oMs/euHErDktUkmtmDjhyS+MGXY6AVvtKcdBqJZQwKYHiwkpUm9JBon8k9tuYD
         yOJ6+YZURZFKkFkaTYzq2gIS8Ffgz21ZstJYW6olcHhTcVRuzLYy38gqFS+jyzIilHNp
         aDH/bDKQmyXUWPjx+ZZ49lcuC3GWGJ+tikVGtWA2wT7nrujs9rHA7may1a4Vl6WW0I16
         HfvCEaINf1DMShivYfkRvE2SVICt24tygjsV30KpA4SchzevMBLWFwoBvSc1TNDM3z3O
         PUKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHAt31Ja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85749000000b003ff1fe3cd40si6080084qtx.162.2023.08.22.05.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHAt31Ja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQhH-0006OM-6B; Tue, 22 Aug 2023 08:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQhB-0006MB-6p
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQh8-0005fM-Mz
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so3978940f8f.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708072; x=1693312872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+Q+413qAyohxkZfqCqkkltTwZ66XX4v/AfIWdcA3w4=;
 b=RHAt31JaX+enrxV2lGY1ElHMHQfUkmaCYzzh5D0NPoQO3WOwlVHcNJSyfwCJgMJdRE
 PRLJDtij2T3QHtANmzMg9V0JBto+2j0VV0eiggYB9uBnsvLJirOkj3JNTKO9XHqqTBBf
 XYuiH0hlG3aIOvrktg3GzU2oeySb805dxEBF9aEuVWhl354HLQT8K8+/qvFmRCobVRZ9
 zfVBJ4KP5msX5FBwxX2dvCdD8KpTdW9aCdYoxC73kf24rOcWFzibQ5MldQ7A/fhIPLue
 IVcriIEhPRxJqIiHUZlmFjPXDqNUlPtctiljgrrUFYbtoleQAZ3Tpogbb40/W+UAc/ta
 r1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708072; x=1693312872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+Q+413qAyohxkZfqCqkkltTwZ66XX4v/AfIWdcA3w4=;
 b=dus8pOFAZ1GbCZC7NPzzNnjT1mAdEEbz2khTmVNItPQatuOSBpSYalxAWlmpAZYztm
 zJpaN5WhxSlqWJct1qMKO9BVOQtUFYjeSWwdBDN3vWFDdy6F1PvTD2p6a4Cc8xmJxsyz
 uEgeTZjAHXyg95/kuLEO+x99zyVjQP01A5tXqLHfbXF80/6WkRwV8Cax9cn+7aOa3cYO
 wqcWVZI0PYzWd0xpAWCzwtlfo5MnGBe4DMQBWn/A+plWKpXmOXhVKgZYX2Fu1A7Rt0JC
 vhmcmgW7/aRK+9GScPFkfv7kEFbfnYCzomEpiPY2LuyP66bM5sd6oChor1RA5lp1GR+/
 Rwbg==
X-Gm-Message-State: AOJu0YxGqA6IU6TTgSKs5TyEYUuXfMVgVMsPExFSxvlHgIo9BpFMIh69
 8smmA1Ixzxjd5r2RxnNQPzkd3A==
X-Received: by 2002:a5d:4685:0:b0:317:59c8:17bc with SMTP id
 u5-20020a5d4685000000b0031759c817bcmr6009480wrq.15.1692708072120; 
 Tue, 22 Aug 2023 05:41:12 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 a14-20020adff7ce000000b0030fd03e3d25sm15856795wrq.75.2023.08.22.05.41.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:41:11 -0700 (PDT)
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
Subject: [PATCH 03/12] target/cris: Use generic hrev32_i32() in SWAPB opcode
Date: Tue, 22 Aug 2023 14:40:33 +0200
Message-ID: <20230822124042.54739-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: C16EewTwimpw

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/translate.c         | 20 +-------------------
 target/cris/translate_v10.c.inc |  2 +-
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 925ed2c6f6..00bbe6c645 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -381,24 +381,6 @@ static inline void t_gen_subx_carry(DisasContext *dc, TCGv d)
     }
 }
 
-/* Swap the two bytes within each half word of the s operand.
-   T0 = ((T0 << 8) & 0xff00ff00) | ((T0 >> 8) & 0x00ff00ff)  */
-static inline void t_gen_swapb(TCGv d, TCGv s)
-{
-    TCGv t, org_s;
-
-    t = tcg_temp_new();
-    org_s = tcg_temp_new();
-
-    /* d and s may refer to the same object.  */
-    tcg_gen_mov_tl(org_s, s);
-    tcg_gen_shli_tl(t, org_s, 8);
-    tcg_gen_andi_tl(d, t, 0xff00ff00);
-    tcg_gen_shri_tl(t, org_s, 8);
-    tcg_gen_andi_tl(t, t, 0x00ff00ff);
-    tcg_gen_or_tl(d, d, t);
-}
-
 /*
  * Reverse the bits within each byte.
  *
@@ -1666,7 +1648,7 @@ static int dec_swap_r(CPUCRISState *env, DisasContext *dc)
         tcg_gen_hswap_i32(t0, t0);
     }
     if (dc->op2 & 2) {
-        t_gen_swapb(t0, t0);
+        tcg_gen_hrev32_i32(t0, t0);
     }
     if (dc->op2 & 1) {
         t_gen_swapr(t0, t0);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 0ff15769ec..86cc5de8ad 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -508,7 +508,7 @@ static void dec10_reg_swap(DisasContext *dc)
     if (dc->dst & 4)
         tcg_gen_hswap_i32(t0, t0);
     if (dc->dst & 2)
-        t_gen_swapb(t0, t0);
+        tcg_gen_hrev32_i32(t0, t0);
     if (dc->dst & 1)
         t_gen_swapr(t0, t0);
     cris_alu(dc, CC_OP_MOVE, cpu_R[dc->src], cpu_R[dc->src], t0, 4);
-- 
2.41.0

