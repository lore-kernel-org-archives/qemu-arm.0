Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2801091lfm;
        Tue, 16 Jun 2020 10:11:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8TkzWQ76uGoOWqFSsFOUnUR+th3+ufdTMfs8P0uXV03l9S03NnUKr/VjcrG27ZQbE4GLu
X-Received: by 2002:a25:820e:: with SMTP id q14mr6135157ybk.196.1592327490066;
        Tue, 16 Jun 2020 10:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592327490; cv=none;
        d=google.com; s=arc-20160816;
        b=Is+h6r61BXrFtY7jDU28jCsdaycq1H2w9eXHGw4I4NHv4mQLM/1O8rIjRHWdkxZMq5
         /4+8UnZ8vAh57ODaUbbbp2AkTpA2vY+8+/Hn2aJurROUVfnNDKtpoPNfBjaZQaReSEGR
         7E6SfUXmwJvp0TW5//uKod0b93jLz/mG3ulAVXd8zx6PYRE6GSGJHFWPEkSDFm9cy6cU
         9mMwbhi5KFRDq1rbNySitFdOEhHRvjYoLtCK4WmFe9lnhiIERdzOz5Zu/kKeCos3PUVP
         gFlMmp1nbrYh1CnUNSbkdcw3bUrfdo2ChBbVuy6KkVOM+OD0C7Xj15RkF+hZU/7wRsHi
         VAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7LajX6MigHB41GQ8EUoLxZbQvXk12YJJTXi7/b1pm8I=;
        b=AdquMq1FPw++SIA+p3PnLjgdjEn9YHSMBpeKY2rNpfgViTPJDevpbPZ9ot4nJ6Hj/n
         TichGicWvgwc21Kvpw4ztypgULK1Po/M5kdFA0DU+6+lU4qBhJHonRahI697oZ3hfMwG
         kOKdzvi5+FQG7UVadgmP1epUj1qReMNfsA5Az/487O0JoAlG/YxH0gPbrYlpYRLR5GEf
         gf8aKiPqElbkZPTRPcSsp/wJxGeSjA5HaBjVO8Ujg/88Ek7YcSBQJU4vDoLnUiYOjIdg
         +DBtZfjbiRAoX2DG3FKjiLVOfDwN8VhbmjtbPJpucoapUOYQa01FfqOXE0yxsSml3CWx
         mSRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IG8cbs/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si16705491ybn.76.2020.06.16.10.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IG8cbs/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlF7Q-0006ta-UQ
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF57-0001S5-Bv
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:05 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF55-0007Un-Ki
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:04 -0400
Received: by mail-wr1-x443.google.com with SMTP id x6so21519847wrm.13
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LajX6MigHB41GQ8EUoLxZbQvXk12YJJTXi7/b1pm8I=;
 b=IG8cbs/tjzQOL7NuXNYgazP4L0BqzXhTAGCSn26mxKUwoTfxPsX4k0wGgTkQfzimfS
 tf6ScVYyYbevZPvQ0cLW52Cd+T/GdKtDjCn4le/7G/WL9eNgnosOWBZ4EdsfaU77Okan
 vcQ+dj43pjhOImPJjquB24P1LCjBiOU6lrDj7+idrCBd2nMJzfNkVUdsD6A0TcNtehNQ
 EbukkZ0cE/Cl5FjV7cQoEFvIPz198wDd7OEKmnhNt1AdwZoZv6xDL3k3ViB9XSRQTUV8
 cUSyaOR06ZDCZ0b+sBoPn81ppU4YtWyazGqSLZ3JfjcoSIrBuSPKVxc/gz7oQgOiRHIw
 bOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LajX6MigHB41GQ8EUoLxZbQvXk12YJJTXi7/b1pm8I=;
 b=bveDJqpNdYJV6+hMyaUmJByDb0uQ8dOKfn5jUqoyCpUZLBEjhLMd1R7TwXGcdv9fL4
 dhG3ulwrFLPqbzM8kGNk6ZS2Cqh5Xh/c+YLkHli5sAs7LDcGL4PsiUbOrz8PANwIvjwa
 oQQ9hVHSvZfQu1LGMBd9O8g3GimqBA2Epbg/alys6Yv2Ndg25eCAmhbqrZe6D9fWtsW0
 lOMsDmVM0IlpqbFxk4KB/5/F8s9YU+6vQ+vLx1lY6Gl0mB3f4qAGVMl4hPGavAm0HLM9
 P96ouTR2+7bJIXyvj3KJTp04HF5SE1r9Vs6+KXNUSb3rgQDKd5hVKm82GomQ4cT/kdB8
 h6ww==
X-Gm-Message-State: AOAM532k/PLCCT/BXJcSDM7Iv6U/lYs4atUnsnC9QmXmUT45gGRDWYub
 oCe7ifC1pU+sRaCRuiAq2rm9pAI6whOGEQ==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr4368917wrx.55.1592327341941; 
 Tue, 16 Jun 2020 10:09:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y80sm5263216wmc.34.2020.06.16.10.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:09:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/21] target/arm: Make gen_swap_half() take separate src and
 dest
Date: Tue, 16 Jun 2020 18:08:34 +0100
Message-Id: <20200616170844.13318-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616170844.13318-1-peter.maydell@linaro.org>
References: <20200616170844.13318-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLQimhNqW/bO

Make gen_swap_half() take a source and destination TCGv_i32 rather
than modifying the input TCGv_i32; we're going to want to be able to
use it with the more flexible function signature, and this also
brings it into line with other functions like gen_rev16() and
gen_revsh().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c |  2 +-
 target/arm/translate.c          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index c39443c8cae..4967e974386 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -3007,7 +3007,7 @@ static bool trans_VREV64(DisasContext *s, arg_VREV64 *a)
                 tcg_gen_bswap32_i32(tmp[half], tmp[half]);
                 break;
             case 1:
-                gen_swap_half(tmp[half]);
+                gen_swap_half(tmp[half], tmp[half]);
                 break;
             case 2:
                 break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 38644995ab2..64b18a95b64 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -378,9 +378,9 @@ static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
 }
 
 /* Swap low and high halfwords.  */
-static void gen_swap_half(TCGv_i32 var)
+static void gen_swap_half(TCGv_i32 dest, TCGv_i32 var)
 {
-    tcg_gen_rotri_i32(var, var, 16);
+    tcg_gen_rotri_i32(dest, var, 16);
 }
 
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
@@ -4960,7 +4960,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         case NEON_2RM_VREV32:
                             switch (size) {
                             case 0: tcg_gen_bswap32_i32(tmp, tmp); break;
-                            case 1: gen_swap_half(tmp); break;
+                            case 1: gen_swap_half(tmp, tmp); break;
                             default: abort();
                             }
                             break;
@@ -8046,7 +8046,7 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     if (m_swap) {
-        gen_swap_half(t2);
+        gen_swap_half(t2, t2);
     }
     gen_smul_dual(t1, t2);
 
@@ -8104,7 +8104,7 @@ static bool op_smlald(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     if (m_swap) {
-        gen_swap_half(t2);
+        gen_swap_half(t2, t2);
     }
     gen_smul_dual(t1, t2);
 
-- 
2.20.1

