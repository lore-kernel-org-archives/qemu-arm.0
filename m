Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp364952lfu;
        Tue, 26 Apr 2022 09:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy21N9lyL5JN086bEO+KDYFO9oEvKguUR5Xb3sMnsX8POIqAWe5Lch1EKfxqgsi/bFKFnzw
X-Received: by 2002:a81:6d0:0:b0:2f7:e35e:6101 with SMTP id 199-20020a8106d0000000b002f7e35e6101mr11487554ywg.159.1650991510692;
        Tue, 26 Apr 2022 09:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991510; cv=none;
        d=google.com; s=arc-20160816;
        b=T+WSdoCmYyHeRLayNBIPUUvkl8CGGYJbfhBtu7yoZJrC0R7uPMvG32XsgmOkXB9dpy
         C3XHbH+t582VfQZLpApiYo+miztGcLPS0zyoSkht0Y8nYzwh9ObGsos6p00unS8QaU3P
         4ahkZ27XN/ClD+LAJicneZTKDVRvBlKwyt6f+ixPQmLQ/vZI4RmPxzz2mqprgr+vMO8w
         SB9odsfNbGcgKMfID7PD6rWv3guFFe43cC5gITUqxd1Ez2qNidOQEZnf3HTAWRC7yx3U
         C1/0W/XzKdX4gvWITilT6lFgSaRDlZnpytv4acz/YJ7TXaIyUh2dFikcMpFjNEMw0MjG
         Q3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ItNsMIpQW+EwLJuGlJ3T+gRGOc/rNBHOo2ljke9h1ZE=;
        b=vsBqUKGeDM6955zNFNFVFbn1x+5WUJXWnf4TZY8rA5hCL5MjE7Ciuv04mo6Xb3ZoCW
         K9ZDqhv78pP07mbOjESJzgw+UVPoezlScgXVqEeHNGuoegTTnFLgyVJXaNUu1CgqDt2i
         /R+7sbpMiiYHp9Ya1jW1RE0ejBa9jvt0QG3q0VNuAL8GupQiIcGNL/ZXJbX3FxUSWeUv
         tPrhad56cnBHT0cd45s7nflrovMjbYQ6OqNVNUgb4dcHUXMhOGelOzwsKxV/DozuX+wo
         68J3TqMTzxmqaHyV7sc4ohUrSXRAlMs9WYCmtYCo43iHK7Fx+J4yo+L5MeNkQhYIFZOY
         uOpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ucwLtzRm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c71-20020a25e54a000000b0064849c797f5si6616969ybh.120.2022.04.26.09.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ucwLtzRm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOJK-0008GW-19
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035Y-6q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5m-0003sG-Pe
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d15so30708142pll.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ItNsMIpQW+EwLJuGlJ3T+gRGOc/rNBHOo2ljke9h1ZE=;
 b=ucwLtzRmxmFPWsz0q5EU7kHg01oDruqut61GgnaBj1v6x4uWSUK0OoRFFUdAWKzB9D
 7yEwUw1aozf5T9AgEWg1jWN3ApyIGGc+y5YRfhUwJpO06CTppqhrW1ok7DHvmlfqWtfa
 1iNV/Tr2hLi3sjV/ERPjFxWD2UxCFvE/0pr4wSXxhOqPtBBBng6CMUgdUfgyt2BhMJVK
 dlB6T9/dY6+UIZT1tiiclaUi9lQgvJonHx8a76iPhUfnjOVKId+tictDlmKK3nLPT1PB
 1StYNbo8aM5dULRdgGXoBgdwHTuVMaFESwoc6nbj0/0yno4s+uVZzE1yFQEtFbIoeoi6
 1j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItNsMIpQW+EwLJuGlJ3T+gRGOc/rNBHOo2ljke9h1ZE=;
 b=o0EAKhu6hK/HQAvkzOHd7Pmjh3ds2Bja6GxHKFbZxsKHfsXIZKBV6iewfF4WN39lPK
 Dd2YAuHtUhYlByaqYGvYZKoNAFIkJjvORcY+ZuzqU50bBfB3+2k6GRtkSyza7Si5TXj4
 plXd3SZxkQxYWMkDPSF6G6xt3j6pTXNHuaEZa2VqP1BcaAWol2SVyfkBPRrqJqd6sYbH
 7JULSqtAvDqy1Dt1j54WZFS93xZhdgTsOfDpPYXfnmA228c+8rQ2t3Te7jSTKxfMrUNJ
 X3Jj3EqBrNJ3CD1sE1JVE15m5LzcPs6dYCFLdukgHAyR7OjPwvXvTrFu4QQwrO7uQsQ6
 5tEQ==
X-Gm-Message-State: AOAM531rR2Bg89/i+vzQrP/4Lx24jFUyyaDoLvAsWDeE38hs7hBaqicp
 kxG52VZ0lD8OLYbe7tehl54UUSNltajkXQ==
X-Received: by 2002:a17:902:cec2:b0:15d:37b0:2d07 with SMTP id
 d2-20020a170902cec200b0015d37b02d07mr3840906plg.128.1650990667032; 
 Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/47] target/arm: Use tcg_constant for disas_iwmmxt_insn
Date: Tue, 26 Apr 2022 09:30:19 -0700
Message-Id: <20220426163043.100432-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: NuwvdL40FK15

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9bd1b46a52..501192ed55 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1845,24 +1845,21 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         gen_op_iwmmxt_movq_M0_wRn(wrd);
         switch ((insn >> 6) & 3) {
         case 0:
-            tmp2 = tcg_const_i32(0xff);
-            tmp3 = tcg_const_i32((insn & 7) << 3);
+            tmp2 = tcg_constant_i32(0xff);
+            tmp3 = tcg_constant_i32((insn & 7) << 3);
             break;
         case 1:
-            tmp2 = tcg_const_i32(0xffff);
-            tmp3 = tcg_const_i32((insn & 3) << 4);
+            tmp2 = tcg_constant_i32(0xffff);
+            tmp3 = tcg_constant_i32((insn & 3) << 4);
             break;
         case 2:
-            tmp2 = tcg_const_i32(0xffffffff);
-            tmp3 = tcg_const_i32((insn & 1) << 5);
+            tmp2 = tcg_constant_i32(0xffffffff);
+            tmp3 = tcg_constant_i32((insn & 1) << 5);
             break;
         default:
-            tmp2 = NULL;
-            tmp3 = NULL;
+            g_assert_not_reached();
         }
         gen_helper_iwmmxt_insr(cpu_M0, cpu_M0, tmp, tmp2, tmp3);
-        tcg_temp_free_i32(tmp3);
-        tcg_temp_free_i32(tmp2);
         tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
@@ -2318,10 +2315,9 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         rd0 = (insn >> 16) & 0xf;
         rd1 = (insn >> 0) & 0xf;
         gen_op_iwmmxt_movq_M0_wRn(rd0);
-        tmp = tcg_const_i32((insn >> 20) & 3);
         iwmmxt_load_reg(cpu_V1, rd1);
-        gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1, tmp);
-        tcg_temp_free_i32(tmp);
+        gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1,
+                                tcg_constant_i32((insn >> 20) & 3));
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -2375,9 +2371,8 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         wrd = (insn >> 12) & 0xf;
         rd0 = (insn >> 16) & 0xf;
         gen_op_iwmmxt_movq_M0_wRn(rd0);
-        tmp = tcg_const_i32(((insn >> 16) & 0xf0) | (insn & 0x0f));
+        tmp = tcg_constant_i32(((insn >> 16) & 0xf0) | (insn & 0x0f));
         gen_helper_iwmmxt_shufh(cpu_M0, cpu_env, cpu_M0, tmp);
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
-- 
2.34.1

