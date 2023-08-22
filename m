Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp633327ejx;
        Tue, 22 Aug 2023 04:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCy/O1q4qy01WGjmt9tOYqVrMKFrqol8kXqGq9aZITkRa/jlP8GCr6ukfDjbDq4jS8+/W3
X-Received: by 2002:a05:620a:40c4:b0:765:42cd:c192 with SMTP id g4-20020a05620a40c400b0076542cdc192mr12083333qko.37.1692702212253;
        Tue, 22 Aug 2023 04:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702212; cv=none;
        d=google.com; s=arc-20160816;
        b=t0hiLqNOwlF2TKSoqt9qV0xoyyNKKhaf81R7SrFmy++WGtrCSUYQVasaA8iUW26f1i
         kFlR7TU4Ky1oPEH4d6CaaVIFE58WXPSBZiq2uqAKamijFy4zd8ViCP0xKGkrhphZJWdY
         flRkpLVLNBQhMLBs+QaGt+hEbQvgn6vsX/GhVSQw8Cy3U8hp+d53Wh3uih31BIRPuYW4
         6NzJbs1R+Hka0SmLBnNH4KsxlU7wdKsCrUAuUTYDgu5BKwdQJS5YVOI+qKUzdxTCcmn4
         XZt4DMFnChmGw1GJrJQ+AUBzaotHm8sxuLUJy2I5ub5929DpGpUAz825HY0z61f2YpnU
         Ro9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iElFObsC3ifF74P0i52/vlr1BqZqHUcD9/Vx9wOeGDY=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=F0NZ5eqIxhra/6UbSzhDQbgdQtkEqCrEOn21GMxNzIKEVcV5tcppAExjNlVdDASeYP
         A3fW25oARUil0oiRL70Kh9RhI0ClwtI06zDa8zSSVTBsF95Y5dEFG2ySJ4Z4ey90QSS/
         Wnp3NPVp/9cWD5NkRrLnL4RByJaB8wH2bhJH3SbIHY3bCj4i7dcPqNLXxE5z9xIkgN19
         4h/6WwUXQHnZuDmUvQtwaNtVt6mqgg6sHmb4hAwYlG2Lw1aEiV7zQteiRbc51XBJP6KS
         IIalWFJbKq4tiWKLQ++oA300i+IIPsjKIrTTY0hOFgNhH4xbG2AAZ/lUNLKAibtntpyl
         GpgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5VOsL8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020ac8588d000000b0040e332bba63si1124090qta.751.2023.08.22.04.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5VOsL8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYP9g-0006Q1-PD; Tue, 22 Aug 2023 07:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9E-0006Hd-LD
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP90-0003Kc-Uq
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31aeef88a55so2375291f8f.2
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702108; x=1693306908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iElFObsC3ifF74P0i52/vlr1BqZqHUcD9/Vx9wOeGDY=;
 b=w5VOsL8HA902IBDleuj4nPXjr8wGO+zzCVi5et9JLr2e2P+DvkB7cT5JnSY4paZa23
 lHVbn5nsDd3W/OeHcXBbV3zcIFMGqF4HjEgIWdrUT0fTFMrd9u8y8trNKDts4XChSXPZ
 15fa6oGy0I6qFx6BwbtHW1PKyZJrLS3yvLUObrqt4IiGjIPIg5sNnQ5jnWug/+XOOvCp
 ltPf8jAfWkrwsHYTCEY51Wl72hAM2Wl+CXMpf6FvpMdx3BX9JtvX2PLlte1fY664eD5q
 Mhs3y/71+HX7vrAurDpEgfG4Ns6Cfq5iLo2vGs7QSGVfD5YBsXV7Hj5moQasl9JqvA0T
 FIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702108; x=1693306908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iElFObsC3ifF74P0i52/vlr1BqZqHUcD9/Vx9wOeGDY=;
 b=Af734dGuIvwY4ZJyvWtNKDXBpj3txDgeoXlQGrD7/L3uiSHcz5ZANl6c6dIOtfgftW
 F7CjXPOg50ZejhRQMkpvsonEDTsFJNR1263GY4bSsIkV3+BaI9qq3L1Ev4okPvCN8A5T
 Fzl3brQrU/rclSR15Idwc08AxhhWriLWD06yg04pujrrc3180W6AoJp3Fr+BlvSv8YUC
 vMDNQAiI4YwuqixTcOfbKwQoOjFBnZEbIp3kxMmj5knc64PD0WIxpBWg7BS9vZLZAtrH
 kyQciL6KV2eCGrPXtUwHEoyxAQGF2zUG4+efrrDTj6YqHlgoTLOARGYRkyHjQYc4crEm
 p5Xg==
X-Gm-Message-State: AOJu0YxZ2KdmgjB1XkhwCqbVUIDReJCEIuk0+ORYSdWEdP/X0Nx8wNLs
 te4YJW6RHpf8S5xxMpDuCV/Itw==
X-Received: by 2002:adf:f44e:0:b0:31a:ea7d:49d9 with SMTP id
 f14-20020adff44e000000b0031aea7d49d9mr7728917wrp.53.1692702108101; 
 Tue, 22 Aug 2023 04:01:48 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b003140f47224csm15488415wri.15.2023.08.22.04.01.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:01:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 2/6] target/cris: Use hswap_i32() in SWAPW opcode
Date: Tue, 22 Aug 2023 13:01:25 +0200
Message-ID: <20230822110129.41022-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822110129.41022-1-philmd@linaro.org>
References: <20230822110129.41022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: CqwA1cq0L7e6

Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
introduced the generic hswap_i32(). Use it instead of open-coding
it as t_gen_swapw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/translate.c         | 14 +-------------
 target/cris/translate_v10.c.inc |  2 +-
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 42103b5558..925ed2c6f6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -399,18 +399,6 @@ static inline void t_gen_swapb(TCGv d, TCGv s)
     tcg_gen_or_tl(d, d, t);
 }
 
-/* Swap the halfwords of the s operand.  */
-static inline void t_gen_swapw(TCGv d, TCGv s)
-{
-    TCGv t;
-    /* d and s refer the same object.  */
-    t = tcg_temp_new();
-    tcg_gen_mov_tl(t, s);
-    tcg_gen_shli_tl(d, t, 16);
-    tcg_gen_shri_tl(t, t, 16);
-    tcg_gen_or_tl(d, d, t);
-}
-
 /*
  * Reverse the bits within each byte.
  *
@@ -1675,7 +1663,7 @@ static int dec_swap_r(CPUCRISState *env, DisasContext *dc)
         tcg_gen_not_tl(t0, t0);
     }
     if (dc->op2 & 4) {
-        t_gen_swapw(t0, t0);
+        tcg_gen_hswap_i32(t0, t0);
     }
     if (dc->op2 & 2) {
         t_gen_swapb(t0, t0);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index b7b0517982..0ff15769ec 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -506,7 +506,7 @@ static void dec10_reg_swap(DisasContext *dc)
     if (dc->dst & 8)
         tcg_gen_not_tl(t0, t0);
     if (dc->dst & 4)
-        t_gen_swapw(t0, t0);
+        tcg_gen_hswap_i32(t0, t0);
     if (dc->dst & 2)
         t_gen_swapb(t0, t0);
     if (dc->dst & 1)
-- 
2.41.0

