Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp363415lfu;
        Tue, 26 Apr 2022 09:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaS31gSr2/o3dpduE5lCOKIi6cSTW/a3lS7VYlI6REWLATzvvAkuswQU90JPdEJWnPAjPs
X-Received: by 2002:a05:6902:10c1:b0:63e:4f57:f533 with SMTP id w1-20020a05690210c100b0063e4f57f533mr21802637ybu.374.1650991377256;
        Tue, 26 Apr 2022 09:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991377; cv=none;
        d=google.com; s=arc-20160816;
        b=O9IF3e6k+b27xwDXZ74v1HVV+KcNGFQThvXN8EhOk/nCIipGLuIc9O1aKX0LD0dCPX
         BMarWQwzoHbsBrzzfI70MpueElbBCeRlyMMGoJSMhsBw2spooFc/5HuKXuF6MAi3mHe3
         JpQhFi6kjdFipnjCTvk3jA2/uLsauF9uFMLJF3apbQUhiD0zv6fDJS8HKYsyhp2Ade2f
         eIHmLMpUYgLJYjvg64ondloPbYwnLzr8tqDY/OdT17iJ6GDzihoixRmBqWC1kzIrhfy6
         uA6H7ar67qp6LAlUBkn2Z1Ws2iQ/JtbxioBdIMBZVaZsvrAW9sOVNDSVOpKqI5+X0WHF
         FEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QR3LzJQ6YjEzf58rv5ySxFoYa24sQiIxhi3F4IlHklA=;
        b=h2cUI1Bmh8U8n4kk7T4k7DJerNiBHiV3U5QxhoKTYjNIbHqW1Y3TiKqIjrLv4ZsFcu
         asW9okvB4OGbx/ES5RBYORXASX5H/FMfGT+nSfblXYAUZ7S2rBsrAKzEJybZwfpGpUWa
         Lq9fS1zbDWWl+FdMBGOYQXhIjbk2EG8SLU9+zzVosK4K9rS/CJe7tdBG7BPekB572aqU
         2DWgEH3HaADeoTfIELjByJM3WN0J7/Uo1Rs8nqkjyGViT/u2O1HcsK+1X1JZ/QzkZtZw
         9OT2shqHr/Z7K4lqsWdalia4J1vHoNAUlkTTOHpIua6vF/aIFyTafzGt6kWmylyEyQR8
         1BDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCegV80k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a817e47000000b002ec31e9b836si13508853ywn.317.2022.04.26.09.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCegV80k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOHA-0001G5-Kg
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5i-0002yL-Fg
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0003pU-4V
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:05 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bg9so16478558pgb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QR3LzJQ6YjEzf58rv5ySxFoYa24sQiIxhi3F4IlHklA=;
 b=UCegV80kHjMJgyMY1v1XvaO0Oyjozb2CuLqCUKctNaKWfD1bJBPsCo73bpEMWIRCWj
 /C4jfoJV+DfUHXfL/z3/uL80FmrOMPE2diOTwg6FawZHE3MK1Euy8GlaPVkYklDWEvQh
 Is8/X7jmXjmx788NWByBA0QqaMy8KeA9W7j9SLAKqdVbnVPLmES7nocnlkhgwigCjVZ2
 BmbvEnTSdwCbf/02UEXV+ms9KVBAMiMan0ujMbCQ4N9hCpVz+Aj+0beuqoRdm3nebq5y
 hsWUcqGdTVDhQVokiUtzY5FO6nxMrsjzOIwxMmDl2SE46VP437FdH0caay9Y1UJUI069
 sYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QR3LzJQ6YjEzf58rv5ySxFoYa24sQiIxhi3F4IlHklA=;
 b=zVbCSsVCddBvsyBwgekq7LsTJF2/Z3Yk/OFZ/MAKuM3+lQntGszXt6ogJCOESg14UB
 aCtNhg78gmNdGhh+bdPXRTszMuH9a8Sdv+nVV+DfliAjOEcRXhhWcu5vPklOvx4znPb0
 nStvpY9vREf64T99JWhszbYv+BRFg4PWRHXq2zGvGgwwq0ZzLALQDQr0OjUGFlF8A7Ww
 FSucKUA89NS8EkZ6iTSLM6ux7SYu6QYkvjBA95dXamgBNPZXuiU9OVy/HtzD1OQXy9Ey
 Iuxw51guP5GBIi8Csa0bsTzJh89xiNMKcN2KPGoIX8Se6mOdLqABIDR0IrloyzCrqTJT
 Mqog==
X-Gm-Message-State: AOAM5324GY3n8dNaDWZUmW/hU4Vxgdz7ITZ6+RYTiYnFpqUXlGzcZscO
 /WtQ8q4WuUdnYlltY7Fwo/YvbSFQVr3xFQ==
X-Received: by 2002:a62:be14:0:b0:505:a43b:cf6e with SMTP id
 l20-20020a62be14000000b00505a43bcf6emr25299684pff.33.1650990661702; 
 Tue, 26 Apr 2022 09:31:01 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/47] target/arm: Use tcg_constant in disas_data_proc_2src
Date: Tue, 26 Apr 2022 09:30:12 -0700
Message-Id: <20220426163043.100432-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VSM36vOmd43f

Existing temp usage treats t1 as both zero and as a
temporary.  Rearrange to only require one temporary,
so remove t1 and rename t2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ff08306d2b..358f42026c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5734,15 +5734,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
             goto do_unallocated;
         } else {
-            TCGv_i64 t1 = tcg_const_i64(1);
-            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGv_i64 t = tcg_temp_new_i64();
 
-            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
-            tcg_gen_shl_i64(t1, t1, t2);
-            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+            tcg_gen_extract_i64(t, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t, tcg_constant_i64(1), t);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
 
-            tcg_temp_free_i64(t1);
-            tcg_temp_free_i64(t2);
+            tcg_temp_free_i64(t);
         }
         break;
     case 8: /* LSLV */
-- 
2.34.1

