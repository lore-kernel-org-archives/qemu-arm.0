Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp1043940ejv;
        Wed, 8 Nov 2023 06:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGseXEv5XaeFyk1H+FTnmrGi4Gl0XCngqwwVBUhVoABKl25LgpdGvAcBdYATzoQ0fWODNLN
X-Received: by 2002:ac2:5485:0:b0:509:4a02:1205 with SMTP id t5-20020ac25485000000b005094a021205mr1539130lfk.46.1699455221906;
        Wed, 08 Nov 2023 06:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699455221; cv=none;
        d=google.com; s=arc-20160816;
        b=zDWxGR2RrqcoDxILhUz++1qYCRbo83IO/kUnShmrIjRi0k4UbPFlUDJpo0pwmdCxlF
         z4qfTxXROYLbg41nE+lIBJotEGT6Jk6BgggWfeiOjrfE9+qVlGL7wkG6Fh/3Ydzn+kTh
         szs8hHf2mWJLK4WfJOsgPnepVWawdb1tP7QaJlF1xWOS1JUKbE0XfNJvDFdUG2fwmz5k
         EVxwDMHNNY18u7f04aWRy5lJasPPRtOH+Tmuehu577Ys842hrQarc7TTX5y5k9zkzIfv
         XYW9xsnwt7qbtjL/8XQUpPf5KaNthp9K5iUBZ7kF370gAkSXtdg2ocngsOgc4pY/kqV6
         eKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wDdmF0dac/ehT5un6rtZ/BCMjBn2hJpxmqGf5ogGxBQ=;
        fh=OVkFVJuMUg9q4Kx7dkC+KxU7Oz3EsIEY+aUQ9DXP/MI=;
        b=Aw8zB/E+LcJmZ98JMWtS2WDeGSuIol8eWHWfEspRo4xKT4bbCp4m5oNuXl4Y3GbF3Z
         C2gDWSVIYMRA187wiMzMoYiBXhu641zhjbyopsV+rfaSQOP44dtbBDxaLZuaXL9MZy72
         Ic1khIRHuO6xX+8CKAH/nE/t8gm14rFJtdSuCnbERGdoAOv/9qqcgwhT6Rk/pki7UoQ0
         kg8rjeqvyHNBmla8Q1Uz/32wPBJ/jxzrJQa6t8npR29LLX+R16lo9lyTKnccPJjBLWR5
         0zw7Q9tDmVeH+DkgEVTijy7B0RnEMeKaO48fxwxEXBiuveITD1nvim8DFUk9aq9F8CCg
         sMlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kqc+ZR+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23-20020a05600c321700b0040501c11b72si10083070wmp.113.2023.11.08.06.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Nov 2023 06:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kqc+ZR+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0jvI-0001S9-Ku; Wed, 08 Nov 2023 09:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0jvH-0001RY-8N
 for qemu-arm@nongnu.org; Wed, 08 Nov 2023 09:52:51 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0jvE-0002Er-O9
 for qemu-arm@nongnu.org; Wed, 08 Nov 2023 09:52:50 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9e213f198dfso351248566b.2
 for <qemu-arm@nongnu.org>; Wed, 08 Nov 2023 06:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699455166; x=1700059966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDdmF0dac/ehT5un6rtZ/BCMjBn2hJpxmqGf5ogGxBQ=;
 b=Kqc+ZR+ECvky18Uf5Itzb+3xwkoHGJx68mZsZXkyBwsrOwAeORrC0WrLpinNBEo/Th
 yaKgobDaGxzEqFUnqfliaMxCwJrwa6NmKaV8RZ4M3nABvomPtnjKuhR3GBFOrBx49KVO
 cBG5xMcGD8y8Klo9YorJs4B65HFEzKp0KbzJwF+3ugQmglgzLrTNwNXoktATEQnW0Qno
 tgzy8M5DH0359y2aNlpezeKAqbGqkSo0vgIJUrB0r0KCpVL/AEv3PY5bxd/vwn8cptiX
 krqGv5ye9OZDaOIBjq5nvxg6Fk7NrFT2pcCeu+9ZVYuOW50Vs0XEPX3xWJn66SL17iSB
 yTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699455166; x=1700059966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDdmF0dac/ehT5un6rtZ/BCMjBn2hJpxmqGf5ogGxBQ=;
 b=tTHFnkCRjlTz43pPVFj9ffvz4iodTCfp1ealzV3WcHW9CQZLjCbXlegVCvAkeVp3A7
 FZcfuBbwjDGVQ6o1YbLBPWFyQd9Z2sen2ANN65Jy1RaheDfBWaLRBYMI8NEqsC/HA8KL
 OKUpuUzBhFuu2XsCnMo/CcbqQRXaABXStD3lT9ZW/YzsyMjQ4vvMq0Duofn4fFD/LBKX
 WZwOUxzBO84ukFgs63+7qy47eg/DaVvI8V8TpJXc7KcfQawmns4DOix82eZJsgDbmXJ8
 5I9nItgdxAap5mH00VwVwZvN7Q88B9en1YSaXIfrQXWrpuj8WOHu0+k8Wa+/pxz18x9b
 GvpA==
X-Gm-Message-State: AOJu0YzZnZ7F+sd2OnCLFXLfrn/hFGcVQ3pQ+eFeFZ/bumjx799eaoGT
 F4O2XQ1JJGlCkuWlOBYaRt5IsQ==
X-Received: by 2002:a17:906:794a:b0:9e1:21d:fdaa with SMTP id
 l10-20020a170906794a00b009e1021dfdaamr1903099ejo.57.1699455166606; 
 Wed, 08 Nov 2023 06:52:46 -0800 (PST)
Received: from m1x-phil.lan ([176.187.199.60])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a170906455300b0099bd1ce18fesm1165398ejq.10.2023.11.08.06.52.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Nov 2023 06:52:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/35 1/2] tcg/arm: Factor tcg_out_cmp() out
Date: Wed,  8 Nov 2023 15:52:42 +0100
Message-ID: <20231108145244.72421-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028194522.245170-12-richard.henderson@linaro.org>
References: <20231028194522.245170-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: M3oF3zjn50wq

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231028194522.245170-12-richard.henderson@linaro.org>
[PMD: Split from bigger patch, part 1/2]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0c29a3929b..66d71af8bf 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1191,6 +1191,13 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     }
 }
 
+static TCGCond tcg_out_cmp(TCGContext *s, TCGCond cond, TCGReg a,
+                           TCGArg b, int b_const)
+{
+    tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a, b, b_const);
+    return cond;
+}
+
 static TCGCond tcg_out_cmp2(TCGContext *s, const TCGArg *args,
                             const int *const_args)
 {
@@ -1806,9 +1813,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* Constraints mean that v2 is always in the same register as dest,
          * so we only need to do "if condition passed, move v1 to dest".
          */
-        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
-        tcg_out_dat_rIK(s, tcg_cond_to_arm_cond[args[5]], ARITH_MOV,
+        c = tcg_out_cmp(s, args[5], args[1], args[2], const_args[2]);
+        tcg_out_dat_rIK(s, tcg_cond_to_arm_cond[c], ARITH_MOV,
                         ARITH_MVN, args[0], 0, args[3], const_args[3]);
         break;
     case INDEX_op_add_i32:
@@ -1958,25 +1964,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_brcond_i32:
-        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                       args[0], args[1], const_args[1]);
-        tcg_out_goto_label(s, tcg_cond_to_arm_cond[args[2]],
-                           arg_label(args[3]));
+        c = tcg_out_cmp(s, args[2], args[0], args[1], const_args[1]);
+        tcg_out_goto_label(s, tcg_cond_to_arm_cond[c], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i32:
-        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[args[3]],
+        c = tcg_out_cmp(s, args[3], args[1], args[2], const_args[2]);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[c],
                         ARITH_MOV, args[0], 0, 1);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(args[3])],
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(c)],
                         ARITH_MOV, args[0], 0, 0);
         break;
     case INDEX_op_negsetcond_i32:
-        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0,
-                        args[1], args[2], const_args[2]);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[args[3]],
+        c = tcg_out_cmp(s, args[3], args[1], args[2], const_args[2]);
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[c],
                         ARITH_MVN, args[0], 0, 0);
-        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(args[3])],
+        tcg_out_dat_imm(s, tcg_cond_to_arm_cond[tcg_invert_cond(c)],
                         ARITH_MOV, args[0], 0, 0);
         break;
 
-- 
2.41.0

