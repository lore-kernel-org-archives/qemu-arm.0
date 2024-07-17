Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615504njk;
        Tue, 16 Jul 2024 23:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvZLn1HVaeRFLflZaVK9tRjSXpz587Or789xNwM9wAPu3EH+ZF1BP+SuopJrmBxdqqMgbreexFVwNu3JxSkz1qniF9x4Gb
X-Google-Smtp-Source: AGHT+IEURQMaCUzLr13aNqvDkM2FXyfH5o1uAmn2FZoUo5J0pybND/6DyGnqXkusoaN375HT+d5K
X-Received: by 2002:ac8:5a47:0:b0:447:f620:4d0f with SMTP id d75a77b69052e-44f86173fa6mr9672301cf.5.1721196691497;
        Tue, 16 Jul 2024 23:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196691; cv=none;
        d=google.com; s=arc-20160816;
        b=u0JZsgqNmfRvVkfKbX/6/Uf6zlyDwslDA8mc2S8NaGWOy8OQTCJtjzN+ZRxhr7ePrV
         dDhHJhBM2aVr/geylKV4CIVLWybE8mK4w7vnuDIQdmxXQu1aa8dwAlmaW1shRQISXyi9
         7QSKUhF9CyrrVBqdBJeIQauHVmFMy2/B+Tk9g6fP70aBZbT1/PKM8wQ7RSY6O5LuXM8R
         BGEip9Dpe5kscD1WsPvm9uu1ED/DgTbTfEwwVyINEziu+W+1WitQMQGbFoKl8CHFRZVN
         ydAI7entPYw+Bj0F2jImDjX7V4HuAtcRsDfSpd578XmarklVi1KUpJBx/XJIKndQ9rI+
         r8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=shR5dO6yp58OnhkL2VwnGKfoxEn8l1B1D1MBIepMKeA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=EU9ZOZdt3PTjRO4I/YhSHBtgJj/OXb9O6lScPv2L+nsPL8v8t2R+yVGTyvGVVQ/XgN
         SD+nR4BuhmG5flk/rkZ6UhRhe0nRLpbqbIzTu7CEcDZvtPuwosi/rGgy3Ed9PJFLm2Zc
         J3sZlE8IAr5fROlqMsgY7zpMxPaWH+mQAD8fiqFIg+NSts+8D4aWSoOFiq73q5VcwwzE
         yAIrpkJTt0l4vEh8n9CAmH+wEx4TEoRZIqpUUT7jn0GynLw45+2x9bJYvppUubb4PxUE
         NDWTV4FpwA6hAMQITWhzREykvZ8wI7p0ZMBGPjnzO1x2AdI9F5AOTwHXwxnFrXjZPhyt
         bHuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ki0ZGPmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b7f7636si91827191cf.391.2024.07.16.23.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ki0ZGPmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxru-000064-Vf; Wed, 17 Jul 2024 02:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrN-0005bt-K1
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:53 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxrJ-00036H-Im
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:52 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7035c367c4cso3762246a34.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196588; x=1721801388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shR5dO6yp58OnhkL2VwnGKfoxEn8l1B1D1MBIepMKeA=;
 b=Ki0ZGPmz8Nnnf8hYtB/KLkYOVtPTLOZAetHgXzbaMpXVTm/4VGk25+twsch7hpFrmE
 uCcFE3K1f3Poj58qQawlwBkwIfx5jm8rcDJhw7uO1qRUySx9FLOUyV4uKI1lCbzZp1Qg
 gRBLv5RcLrCB00HiEellPMd056Zz0NWebOVvw69luvyoeRY4TURMoE1I1lCJp6nw6nxf
 VZMUCaTqKMlpdsy0dpB3/VnRLjRgYI6lXb4bk2PN/OvCj38wPf7MmOF0BlGx6Pc1dVzb
 A4eXUMsc/xIPjS14VtU0WeziEiOQ5xiSQON0PIHLokcUM76o8wnJpkFyxPoOxftRYok9
 p1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196588; x=1721801388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=shR5dO6yp58OnhkL2VwnGKfoxEn8l1B1D1MBIepMKeA=;
 b=OnOAfQdSODxD9JQhi6xidQUbx65ytu0QMyt2xhRNMZi6eaytf2BaOS1LPL6Jbi6DMM
 HEMbQLo+nRsCuODZfyCx/j/zMm7hVDbhLrCNDxEPuFKIuDyULAVa+9i2oBy8+9kG3f5e
 HrQc0Z8jpHwMzT5ZyMnFTlVseHhBnz6+Zzc04XfWvLpvE6K2elkTzSG4CNfEPn0JLmnr
 r50OTO2ntMcOvS5Boz8rvSWLEjsQGvDmne+e66nEmmS1s7D8+PXo8NvlWvEwjMbGPeVw
 fJ8u6Sk1FCcPUccsaV6Ix/lFtMTS0raFPqM1WuMFdFl6EL0mat5SYmVkXpkcB/O9okIg
 GiGA==
X-Gm-Message-State: AOJu0Yx0pvAVUeoMKkw9Lo0kNUSihZ2fCEodX9C6BjO9+80yh/0ZrX05
 cevUKIB24lw4oWd72KuCPj1tetI4ZqsN8Z/FGl8w5i8x1ORvDZH33TCLrcVr7dpNXH14SpBkKGB
 u1vM=
X-Received: by 2002:a05:6830:6e09:b0:704:47db:cd68 with SMTP id
 46e09a7af769-708e3778001mr1007107a34.4.1721196588116; 
 Tue, 16 Jul 2024 23:09:48 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/17] target/arm: Use {,s}extract in handle_vec_simd_wshli
Date: Wed, 17 Jul 2024 16:09:01 +1000
Message-ID: <20240717060903.205098-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Pksi33e63vAA

Combine the right shift with the extension via
the tcg extract operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d0ad6c90bc..627d4311bb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10466,8 +10466,11 @@ static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
     read_vec_element(s, tcg_rn, rn, is_q ? 1 : 0, MO_64);
 
     for (i = 0; i < elements; i++) {
-        tcg_gen_shri_i64(tcg_rd, tcg_rn, i * esize);
-        ext_and_shift_reg(tcg_rd, tcg_rd, size | (!is_u << 2), 0);
+        if (is_u) {
+            tcg_gen_extract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        } else {
+            tcg_gen_sextract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        }
         tcg_gen_shli_i64(tcg_rd, tcg_rd, shift);
         write_vec_element(s, tcg_rd, rd, i, size + 1);
     }
-- 
2.43.0

