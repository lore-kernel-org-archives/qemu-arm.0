Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1332899ejc;
        Fri, 13 Oct 2023 00:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwrIGDEMVjiXh2KgTY1d4rQdGNDmFkEbcKEJdtrnHmGkX0EGkPvBQCQGbLe1tzeWbK7dkj
X-Received: by 2002:a05:620a:b5b:b0:76e:f149:fb43 with SMTP id x27-20020a05620a0b5b00b0076ef149fb43mr25446304qkg.70.1697183843493;
        Fri, 13 Oct 2023 00:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183843; cv=none;
        d=google.com; s=arc-20160816;
        b=anZ8Flcssb66tvrSXhy39Q3a/Fg2E2Gn4edM7o6bzh0axyjrS4B7hn1cCPloIRAoIy
         20NoQGSHZyEua+61lKYtGiUlx7yAxilULM3bpV6AZWuDWtDa6kDRifoNkoWHMlNOMzVe
         IkLZ0CrWixqj+kqHWj2JUFLIpoEKxQIC0hoxWF8zuLOu4HFlAenO/oGLs9iFIf8ChSiZ
         7CNziwYiHiySCe4KVmscwOwiepbEStHn4FoObpGBjmdOIu0IEMBj2QAraD4wj9kniSVP
         V/OHCNrbmurUQeJ1CfTOz11KKUcAA6Q4ulMUdO2msLCaU2e0QBAikS6Nku3xeB+W0Vne
         Z9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b+anxPnJqiuUB0GlICjcfmVbR8l+rl+OV9Xrz2lyUIE=;
        fh=WVptdNFdWObhAL9XpQ4H0zAP5QCLG7gjiic76qNMtkY=;
        b=vPzjunCejzA0DcOGMLpdY2MJc06ymUs1P55PYrCdbpjpw6f9M3MCVrrmO5ZrKCG0I/
         RHu61ndfccrgRjcdqyzhw6ikqcSIXzBmoUaxBZH59XJn51+W7FrZ8pW58w3UF7xGrrRT
         EpbGuD+3OSwf9+TEmTiQVLpdFoODOvjtYAHXSYwLy8YfgZswT+AqAIRJEZF64xNRh7F+
         xNXUXfw4CMbK9iqiRnwcGoUngJ2rOVq3cAhj/+/6VjTAlkqRcTPdyfb+WBVSQWMZbBiu
         9WiVhu0POaO1BP48P2eyi4+8zIHFhNNNhpNja4uLW4KyOtH95E+S3qLuIhZKgzoNw0Pn
         M+pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzxUtJSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw1-20020a05620a600100b0076ef9e388a8si812681qkb.141.2023.10.13.00.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzxUtJSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCxp-0000jJ-H7; Fri, 13 Oct 2023 03:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCx0-0006Kz-VP
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwn-0004vQ-GR
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so1720488f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183459; x=1697788259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+anxPnJqiuUB0GlICjcfmVbR8l+rl+OV9Xrz2lyUIE=;
 b=FzxUtJSYpQvdJktu4/CLwabsCv6GhLLL7234x+0SSwwyN4qlQzotSSFIlgTYx6+rqp
 xX8Q5iYS0/FTXgO0MNeUubXctCsPZpYjZs215drzBR+RRBn0JuKzFlFTrnG6wcG8vH+t
 PLUXwYo57VJnaHvCVaTeIcFR2kx+KecH9O2794YfNctEwVDTAAf9yAarRr/zUqhgSEiA
 mN49PO91rhuvVE904ukCS950omavnkOiVD1siyw2sRhkW1XnbrGvjrhEGM9mD9qy8bCK
 MHbcSGt6H//yFSQpxuKWTTKW57CIKcGeWx7/xK8Z4C4LkoLn2SMyo21BIKGNj450y9Hm
 cGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183459; x=1697788259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+anxPnJqiuUB0GlICjcfmVbR8l+rl+OV9Xrz2lyUIE=;
 b=WcSz+Bp0EPHBbARDMfTQIxd5RvsN2Yoy+N/95eKuztJZw11GVTUmW1ygfjQgdTc+Uv
 cwx9xbp+NlU88tFSwz0k/HIj+wNeSfqtTc2/4sM8Ebx4SsdwRPWqhEMkMGwmKCtlmqkp
 /9MU6nA4Mybrh9HIkbo/IJleXk76ydY+hCXvnKwl0yPtHQH1ls8KvVP9DSBF3Q8jgKD8
 GAkjrtalsrfkvIg4z9VqqJcLxqpJfZcVfBifWqZghlqY7n1QF4L6bLT2NQbbIduk/9JO
 3lOfzx6B8gE8PaVRL980uVwVl+cnw4j4ZdQJf/NrUgrPW0oNCT3yfGEkvbFQDAX6EXcN
 0YCg==
X-Gm-Message-State: AOJu0Yy4nZcp17dLlc1+ZHQrkMAk18Icc7s+OWA+KM6zkOZbiWEGy4cp
 5r/xFvuA8VgHAviYA309UG3ceg==
X-Received: by 2002:a5d:5a86:0:b0:32d:260b:5b7b with SMTP id
 bp6-20020a5d5a86000000b0032d260b5b7bmr9715611wrb.11.1697183459589; 
 Fri, 13 Oct 2023 00:50:59 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:59 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>, Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 37/78] target/hexagon: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:42 +0300
Message-Id: <4b2624f946d0e16f0f424c1d2b109b11ced24d22.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6yBsF61BGN0t

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 4af020933a..0f1713ae4c 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1,34 +1,35 @@
 /*
  *  Copyright(c) 2019-2023 rev.ng Labs Srl. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <assert.h>
 #include <inttypes.h>
 #include <stdarg.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 
 #include "idef-parser.h"
 #include "parser-helpers.h"
 #include "idef-parser.tab.h"
 #include "idef-parser.yy.h"
+#include "qemu/compiler.h"
 
 void yyerror(YYLTYPE *locp,
              yyscan_t scanner __attribute__((unused)),
@@ -621,51 +622,51 @@ static void gen_sub_op(Context *c, YYLTYPE *locp, unsigned bit_width,
 static void gen_asl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
                        bool op_is64bit, const char *bit_suffix,
                        HexValue *res, enum OpTypes op_types,
                        HexValue *op1, HexValue *op2)
 {
     HexValue op1_m = *op1;
     HexValue op2_m = *op2;
     switch (op_types) {
     case IMM_IMM: {
         HexSignedness signedness = bin_op_signedness(c, locp,
                                                      op1->signedness,
                                                      op2->signedness);
         gen_c_int_type(c, locp, bit_width, signedness);
         OUT(c, locp, " ", res,
             " = ", op1, " << ", op2, ";\n");
     } break;
     case REG_IMM: {
         OUT(c, locp, "if (", op2, " >= ", &bit_width, ") {\n");
         OUT(c, locp, "tcg_gen_movi_", bit_suffix, "(", res, ", 0);\n");
         OUT(c, locp, "} else {\n");
         OUT(c, locp, "tcg_gen_shli_", bit_suffix,
                 "(", res, ", ", op1, ", ", op2, ");\n");
         OUT(c, locp, "}\n");
     } break;
     case IMM_REG:
         op1_m.bit_width = bit_width;
         op1_m = rvalue_materialize(c, locp, &op1_m);
-        /* fallthrough */
+        fallthrough;
     case REG_REG: {
         OUT(c, locp, "tcg_gen_shl_", bit_suffix,
             "(", res, ", ", &op1_m, ", ", op2, ");\n");
     } break;
     }
     if (op_types == IMM_REG || op_types == REG_REG) {
         /*
          * Handle left shift by 64/32 which hexagon-sim expects to clear out
          * register
          */
         HexValue zero = gen_constant(c, locp, "0", bit_width, UNSIGNED);
         HexValue edge = gen_imm_value(c, locp, bit_width, bit_width, UNSIGNED);
         edge = rvalue_materialize(c, locp, &edge);
         if (op_is64bit) {
             op2_m = gen_rvalue_extend(c, locp, &op2_m);
         }
         op1_m = rvalue_materialize(c, locp, &op1_m);
         op2_m = rvalue_materialize(c, locp, &op2_m);
         OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
         OUT(c, locp, "(TCG_COND_GEU, ", res, ", ", &op2_m, ", ", &edge);
         OUT(c, locp, ", ", &zero, ", ", res, ");\n");
     }
 }
@@ -800,41 +801,41 @@ static void gen_andl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
 static void gen_minmax_op(Context *c, YYLTYPE *locp, unsigned bit_width,
                           HexValue *res, enum OpTypes op_types,
                           HexValue *op1, HexValue *op2, bool minmax)
 {
     const char *mm;
     HexValue op1_m = *op1;
     HexValue op2_m = *op2;
     bool is_unsigned;
 
     assert_signedness(c, locp, res->signedness);
     is_unsigned = res->signedness == UNSIGNED;
 
     if (minmax) {
         /* Max */
         mm = is_unsigned ? "tcg_gen_umax" : "tcg_gen_smax";
     } else {
         /* Min */
         mm = is_unsigned ? "tcg_gen_umin" : "tcg_gen_smin";
     }
     switch (op_types) {
     case IMM_IMM:
         yyassert(c, locp, false, "MINMAX between IMM op IMM, not handled!");
         break;
     case IMM_REG:
         op1_m.bit_width = bit_width;
         op1_m = rvalue_materialize(c, locp, &op1_m);
         OUT(c, locp, mm, "_i", &bit_width, "(");
         OUT(c, locp, res, ", ", &op1_m, ", ", op2, ");\n");
         break;
     case REG_IMM:
         op2_m.bit_width = bit_width;
         op2_m = rvalue_materialize(c, locp, &op2_m);
-        /* Fallthrough */
+        fallthrough;
     case REG_REG:
         OUT(c, locp, mm, "_i", &bit_width, "(");
         OUT(c, locp, res, ", ", op1, ", ", &op2_m, ");\n");
         break;
     }
 }
 
 /* Code generation functions */
-- 
2.39.2

