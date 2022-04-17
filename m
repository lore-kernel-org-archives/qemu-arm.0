Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1270964lfk;
        Sun, 17 Apr 2022 11:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjo74kfHvzLUMvpHLbbE7CMPJ2XkhNu6wY7oJSWRY1BW1B3noK3bgK+UoFeTgOXyoM1iFT
X-Received: by 2002:a05:6214:2624:b0:444:50f5:742b with SMTP id gv4-20020a056214262400b0044450f5742bmr5623585qvb.21.1650218507869;
        Sun, 17 Apr 2022 11:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218507; cv=none;
        d=google.com; s=arc-20160816;
        b=XgWOgnzQ6aBZseTYJJFWgljUcVBGgWT1HKSeR7xeok14X7vBwAvnQykAMsko3Vt/Md
         XJPVyjTyOvvsmDCA8q9Pk9PdGs51D1ip2sWEKy0EOB2sZyYhuikPxxO2Gx9lOqzwATka
         qre/mG4CH+AXYdzfZ2eWRrXEgfk3OgbHrSpz/YayBmBuFVcNS5ZnShdnfPNWL9IdFW9s
         u53n4FjCj38qjAc2F2L3VkgVuRf6ZA2QyCKIFrczRWkDBOdS1yvYP+5F0osl2hclXeTf
         xCiZsFk6ik+KxcbB6OgJtkY1wee9+JRSmlQBX07NffDDM1G+IJcwjyFouUZvveBQVp+u
         FN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T+qbueQADK/vfjH9sg1vNkUW9Au5lmMPxG4EP03Vc/s=;
        b=rX2zoUuKferQB1gPAyitr8jEgEXv2fj05TdFhfiNYbeZ2xFEsxN4A0PSwwkXgtg8c2
         B4GnSPBihYJ/6Y+weWrl9EdltxMllVFyh5U4I82AvzcndF32wC5lDCrAuB+HpHRmpL9o
         vnNraeo1OM4DfMXWvHljhAVqihGshbEZx810kp/Aj+zwOvWNLfom/MIq/Qyxo5scggch
         JNN7/3l1L3/4ZLnAFOIn5RYvvl0gScpxXlQkwfftX1lteJqBY263IV6ViqWtn+Xx2fHG
         OwLl/x+tDzIqJP+Q0x6PVSRyl7hTUuX/eRF2zR1f4Lt/tK8gkuFCI4zTfYc06VLSsbNw
         Yflw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aySD4yBw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140d6d00b00446592ded45si430334qvs.231.2022.04.17.11.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aySD4yBw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9DX-0007Qn-By
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x5-0000iq-7g
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:48 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x3-0003Jm-3E
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id u2so14950417pgq.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+qbueQADK/vfjH9sg1vNkUW9Au5lmMPxG4EP03Vc/s=;
 b=aySD4yBwds8m94r8eX+fNpZnJzukavDjz6GWEEYQXcYuhW+SoTf11yPk9b9FSLiRvQ
 /dQMLgqdOKfTCSyYfG8lWeS3HNNyZH6WiBiFBElJrP3xx1ttzlWfGvNxv7ke2dFCWwMy
 lEcoZ5auKUOCfGKLqw5Y1akblshYbXERu95YWjXYXvWftvuWQboERDOLvLB3/R09h/rg
 LNo2O17hMSrvV06vy7OYmCl2yKSdFcujSkET3q/XodSs0nQe4b+VmEZJLky+xgWDmBK+
 jV/On1JngCVBw9VBqGYDrTuoRYDhxNJNqgnHcv3TQyNT6tUQIZFyoOruIagcYiSZFSG4
 LiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+qbueQADK/vfjH9sg1vNkUW9Au5lmMPxG4EP03Vc/s=;
 b=0MXRHiUMoTlHyz8mAmOtu9YRI9sh0R5otays0b85mPjWBEpPFkaKCtNhG/jm+LBPoN
 9n1hVj88TtF1SPaUR3gnzKBbo2NUAc4Oduu/VlgV8xlHN99evBRFc/NP2hXH+9ZOWB0r
 ChxmtbaoW92XakWiLSxE7GZ1VNGJTQQbv5dK9SlDzNQOweE4RBpq8kysvMixxzcXOUxF
 MNy29FFf3quIYphhdtelsEJL+Vk8gB8z+WI3C+p92GR81XNxA2kYQ5kEawk3UmxKxmLv
 166TagvDwn4PWgonubbDuJ6//Nk44Y1k+z5dC+eoTzemADtm9t7uGl2fsbx69xT2J7N9
 CVHg==
X-Gm-Message-State: AOAM531waYB1GAqgiRJm6Q6jJJSZaaYnoh16YYIxXUJGxTCuTYsNdTAm
 6TwnSbuPydMqX6Ch5quxYeiksoJtds3jvA==
X-Received: by 2002:a05:6a00:b46:b0:508:2d0f:9f83 with SMTP id
 p6-20020a056a000b4600b005082d0f9f83mr8308075pfo.80.1650217483604; 
 Sun, 17 Apr 2022 10:44:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/60] target/arm: Simplify aa32 DISAS_WFI
Date: Sun, 17 Apr 2022 10:43:42 -0700
Message-Id: <20220417174426.711829-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VgM9lbN7kiUU

The length of the previous insn may be computed from
the difference of start and end addresses.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8d6534f9a5..e1c1dbc563 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9870,18 +9870,14 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-        {
-            TCGv_i32 tmp = tcg_const_i32((dc->thumb &&
-                                          !(dc->insn & (1U << 31))) ? 2 : 4);
-
-            gen_helper_wfi(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-            /* The helper doesn't necessarily throw an exception, but we
+            gen_helper_wfi(cpu_env,
+                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            /*
+             * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        }
         case DISAS_WFE:
             gen_helper_wfe(cpu_env);
             break;
-- 
2.25.1

