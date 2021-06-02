Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4188992lfm;
        Tue, 1 Jun 2021 19:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIm4KKG7NuK1rVlOQjGeUrw3omoD4uFJ9/tbj9r3Bp2f+Swzyy0FL0IEPUX50U+cLC8PZr
X-Received: by 2002:ab0:4042:: with SMTP id h60mr19264012uad.133.1622599655489;
        Tue, 01 Jun 2021 19:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622599655; cv=none;
        d=google.com; s=arc-20160816;
        b=qwelYweqJTbk3Lm2Jvmsra6GlmFbd1dCoWbwkW5RsGF/X77bHA7WV/TzHsPcUsKldr
         XEeKYIUgqwTPZh0oG42RvmE4IhDHmkrdJxvQ3gdaQ6lgbTqhmzHhmUFufKu7TJ9jOAcJ
         i/opRt+Cz0RXIk+B7xdYaoPpV7OYsiFgXMGmwn/pdo2jfKYuvL0ImFdo2+M9dG8ny+dY
         8Hwx7wWJ/zx9qstbx8ZExw1ePaLL/zp0sNpAEcj6AWZQ+H2dqjs68cK6m2dLLH46X7V8
         jc3ybF96z4OMG4x1EeJlxqCNq4eQ6SHaHnnRxFibM1jUfHP12jtPiT/4nkb+B09ci48N
         AS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=P6soOheKeKBX/bO55GWtKn6aDK79/Oblvy0sX9/aDio=;
        b=fXjT2lGxl7IA65fr+GmZ+pt9BoASKgcojuckKv0tEJvRwQDnrhvwOvsc8Ko87LQiTw
         RJlMY4UEPnnBdbGPxHol/bq8yBk2wpk4N+XJ6zxDjeXwdKn1xK1MA7G7Nhveuv7S3vQ3
         HGcsdE/q3JcoNc5jUz6gD1N3MqreDtx/H6GsxH5y9tXxPQl/3zjCNXJmE4AKOXEjwfzE
         EIrZ5y+Lfvq4FPN8k/Zu5SD2jMniuGzbj0T+o1Fd6Tn6t5yLsZaNLtjjEjbrybVkf2HJ
         4T9Uhj1XFbXgFNyR9/aHLK/vZQ9+WYQm6uDiv+YDCsNL9GtzrSbPLagjYSNpm01QLmea
         ANgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZ2XfhAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si8803699uar.45.2021.06.01.19.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jun 2021 19:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZ2XfhAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loGIA-0003QV-Qi
	for alex.bennee@linaro.org; Tue, 01 Jun 2021 22:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loGI2-0003Q2-D6
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 22:07:26 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loGI0-00047O-Ho
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 22:07:26 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso792381pjb.5
 for <qemu-arm@nongnu.org>; Tue, 01 Jun 2021 19:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6soOheKeKBX/bO55GWtKn6aDK79/Oblvy0sX9/aDio=;
 b=mZ2XfhAO+KAi4hDX/hgWo3fjbZO7Mk7vCBIc5MZxXqi4PWBHahNvbLQpW9uWMrupO2
 k9TSsScCejxoB57pA8r4b465Ldk/zLTNRppLTGFImoXbLsqPJMCRcahfuOEigKEH+Qjh
 RI+FVJZp5gNqzmCIEdwJmG35k2U4B3SgrAEiXnDo4QnswpTyhZkHqF5KTwdZ1ZQ5NSi4
 w3w5UzSzodVI6dAE/bRfKW7dsEdePRzxqYE69q0ZAZP8qNLio+eKQzDDX7dvzJaS7toq
 V4BuP9jvrOow/+vAcJque24bp1WHwjd7jMZgVL7jno65vhdlSWwJfB2jB6dtsManc6ot
 nTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6soOheKeKBX/bO55GWtKn6aDK79/Oblvy0sX9/aDio=;
 b=TApiDddhzTsF+eNcnIE1iXNxQNxFMvjeEpTu+JJKYgJtFnpng/TmgA/B7AzSdRaAKa
 VUWtxCAKSk4vji7cb9e6uwfotSGp3jZ7YKH12HDViWB4Unv6a4WuMI3q5UIzaqKOQc5P
 g8LFuupSC3MyEB20T0+/liaGkN9n7zZDsjRsYE7BV1ePibBNx6ruaYABUvrc+GSk/QoG
 yNUEJoD653Zi6Xk5iukOGRWYtD0RFoMPq/Wh1blT41Qo/4LGeltOv7oTpqe1XPVasdEl
 XFVrcqu8LUUKOEHCfK2jndPz+xNMYeUYzvDFHm1QwAXbcpirBCHbv+uPBlzou9NNULlO
 TJeA==
X-Gm-Message-State: AOAM531Q24wpGtCvXwFbAFiRD2IbqcKJ1AhsUGgSSw8PjISxmNM9smdC
 2JuCuXOogltqjlUQvEQ8S+4LlA==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr27926281pjq.179.1622599642690; 
 Tue, 01 Jun 2021 19:07:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g3sm5309879pfk.188.2021.06.01.19.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 19:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Mark LDS{MIN,MAX} as signed operations
Date: Tue,  1 Jun 2021 19:07:20 -0700
Message-Id: <20210602020720.47679-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fxWAXDBMLSez

The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
be signed, so that the inputs are properly extended.
Zero extend the result afterward, as needed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ceac0ee2bd..d6906d9012 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3355,8 +3355,9 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     int o3_opc = extract32(insn, 12, 4);
     bool r = extract32(insn, 22, 1);
     bool a = extract32(insn, 23, 1);
-    TCGv_i64 tcg_rs, clean_addr;
+    TCGv_i64 tcg_rs, tcg_rt, clean_addr;
     AtomicThreeOpFn *fn = NULL;
+    MemOp mop = s->be_data | size | MO_ALIGN;
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
@@ -3377,9 +3378,11 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
         break;
     case 004: /* LDSMAX */
         fn = tcg_gen_atomic_fetch_smax_i64;
+        mop |= MO_SIGN;
         break;
     case 005: /* LDSMIN */
         fn = tcg_gen_atomic_fetch_smin_i64;
+        mop |= MO_SIGN;
         break;
     case 006: /* LDUMAX */
         fn = tcg_gen_atomic_fetch_umax_i64;
@@ -3422,6 +3425,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     }
 
     tcg_rs = read_cpu_reg(s, rs, true);
+    tcg_rt = cpu_reg(s, rt);
 
     if (o3_opc == 1) { /* LDCLR */
         tcg_gen_not_i64(tcg_rs, tcg_rs);
@@ -3430,8 +3434,11 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     /* The tcg atomic primitives are all full barriers.  Therefore we
      * can ignore the Acquire and Release bits of this instruction.
      */
-    fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
-       s->be_data | size | MO_ALIGN);
+    fn(tcg_rt, clean_addr, tcg_rs, get_mem_index(s), mop);
+
+    if ((mop & MO_SIGN) && size != MO_64) {
+        tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
+    }
 }
 
 /*
-- 
2.25.1

