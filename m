Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777231njb;
        Thu, 6 Feb 2025 11:58:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOr2gakcEEydPftJzFzw8+knuLoJ1gOVM9O4yvrlfajsHyytcxzNqi56Xb8hliEpRRRn9X7kvQMLV8iA==@linaro.org
X-Google-Smtp-Source: AGHT+IF8IqrmBWkaoxyHmqoS63qLaEMvycIDj6MyoIx2eBT0hIl27g+OE8a17ihO+PrYwxrOlILI
X-Received: by 2002:a05:622a:1114:b0:461:18f2:49be with SMTP id d75a77b69052e-471679eadcfmr9583851cf.21.1738871891973;
        Thu, 06 Feb 2025 11:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871891; cv=none;
        d=google.com; s=arc-20240605;
        b=Ialh6bZNgUP12mlxHDgFkPBisMelBoJVKP6vh/0k9nvpwBAVzy00UsG0YfUO9pZP1G
         xOJ0MwwsKQ+gfnE733cgzN3UHKinpRgzcOztFho6S0VGsf0kNUoH4Q/EfWEksoCTIUSF
         zcW9ccDdTZoXJC2vzSCo7o+aauUjvRiN/MW6rvcKpG16T+EIBcujxtSaQuviU2io5wVD
         ikOnC/YELGxZMOMJdJU2VOUcHR8lKRW+TL/sjm9gV8AfKUOuTJ022q85AjE5QG7s5jBn
         MXwzEzKE8+bQvVSyqa8o973157aNpmWD7fZTpwhbIfpc3vzhoWGKjAbG002VQGGaIRmM
         fnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lGhhjzHgdaB2j6jJXVcSFxfC86zQCbWbwi8vUso1KsA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=LdueyJnmA9SRggUVQSWEyTEDgeunYDB3IGbD6hFlcjYDCGLJSSjVRne003ht6h07Kb
         vaygazonVym7KU3JAtS8Beum5MRIaoDLkfQB9bdHYaNQAuPJsYRhv4JKnchuQYOyzdxx
         lfXzSlcylMkuqMlHhJuUI0HHR7Xs/URYQQLjfYSleZEftvAf19RjcLUB1ZHceAIPmyAi
         1g0BYKbE/kL/OqL8PBfBPFmZtE4Zy0ClWgY4Qp4x/XCmCQAwJzdi0b62nsl7lOV3Fe5I
         uYpbWJIko/XDkkfgeufuupjOARYqsc8dGZ15PJ/1zyHGKvCOSAKLwubSu/rGDAYn5nbF
         rw1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RfW81hvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4714927ba84si16630951cf.20.2025.02.06.11.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RfW81hvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80B-0007Cn-IN; Thu, 06 Feb 2025 14:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg803-000770-Tw
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:24 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg800-0000RI-Fi
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:23 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f21cc7af5so18924435ad.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871839; x=1739476639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGhhjzHgdaB2j6jJXVcSFxfC86zQCbWbwi8vUso1KsA=;
 b=RfW81hvVnhYZRj88K0U70Xy0H5f6VVU4l33p2vPXigV7hRpt3vLPQIcxfIsCMbEy9H
 5Tj8VjwleFoyJIyXYIBfbCCcHihQIiNguarUcrAsECK8cdOjYb3WTL69Z7dAFaefuKBF
 wBB3So0dpO+YgSv5igL3+ZEzroDZDtGeAZqf3+0T5/1qHBdqKEKQxuFP6xBC8fivL6CY
 PVEaYk/9vKIF00hEfAKQWCLS+tal+0iWGKVOfkRIOuJ9z+MDSSikLrf2TU8tugaLV4n7
 5EIygKdFr7RFM2/JCb16smTRGowtLARYJjQegnR8jtp3JXqHICs8fRZgUNdo5AIga/C0
 bkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871839; x=1739476639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGhhjzHgdaB2j6jJXVcSFxfC86zQCbWbwi8vUso1KsA=;
 b=S97bqxnsDH453T1ZAe5yXBJ3jqIqNbJhtbdoJ5FrMXXZvaB8/1d6uPOvVznWrbDKBs
 2r8K7q+5Yd0nyvwoeqveVztVm7d/mUH4hfQeIL0W+LOznjrF/i89xQiWpBBfkyVyoz+Z
 6ICLD2cGptdEOhYSc431gxqe195rzvPKqi7ODWkGu29bWQXWn4W9qyoAD00Dwx6Y9DFu
 yAiMn/uC3NHerfj/h59X9qEx7yN70p/vqqEPa/zDw4wUhJELooOZgbMELsFwasBYA0Cy
 p8PzC/ZiDUp4MHEcGyyf6oh+P1i4lBqp79AReMQm2zHDrqx7EPNKUFwOJwzSbKaHtAGE
 slMQ==
X-Gm-Message-State: AOJu0YwbPV5xw5VOkXCcpgcdKJ2h5aKtqeHGg85zH8IcaJFtCwRSuZ4e
 uitb2C+5vyQj0J8y3ZJE7NhwvWG2I9RyjsUK+6u2CUGdBndiuWdl/myxCkPRKuM=
X-Gm-Gg: ASbGncuHYcVm/tYljkxH5ntm/BWCuqXSDsH4w4VjImixm6+qK0pv3dEb4Ue2CrWHvU7
 Fgp7TzkQybRtc8uXJltdPU9kLqdHlMKzOuUSWjgpMkZGjil6T4po3NyWbv93r5zMbO8hJcV0SQl
 ebUzWMjALxpw1ohp7hw6tJtE/mebcT0rpOiISrl8+6h6BODXSquoLCLPMc99n0P+RegO1JBe71M
 zfMxCD5+94TkK2vVHMw+rhPdzjPdAyiEk5La0C9WbAf8eHx0mF6+8tyHVaBqTS4EocgZqrcdF2t
 auRwfkWcCueQbgSXHEr9d6O/xXxWzTak65cmw/3UUq3luJk=
X-Received: by 2002:a05:6a20:c706:b0:1e1:af74:a235 with SMTP id
 adf61e73a8af0-1ee03a6b2d6mr1145133637.24.1738871838918; 
 Thu, 06 Feb 2025 11:57:18 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/61] tcg: Add dbase argument to expand_clr
Date: Thu,  6 Feb 2025 11:56:17 -0800
Message-ID: <20250206195715.2150758-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: Lk4sqP3G6Fct

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 451091753d..c26cfb24cc 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -380,7 +380,7 @@ static inline bool check_size_impl(uint32_t oprsz, uint32_t lnsz)
     return q <= MAX_UNROLL;
 }
 
-static void expand_clr(uint32_t dofs, uint32_t maxsz);
+static void expand_clr(TCGv_ptr dbase, uint32_t dofs, uint32_t maxsz);
 
 /* Duplicate C as per VECE.  */
 uint64_t (dup_const)(unsigned vece, uint64_t c)
@@ -526,7 +526,7 @@ static void do_dup_store(TCGType type, TCGv_ptr dbase, uint32_t dofs,
     }
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(dbase, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -703,14 +703,14 @@ static void do_dup(unsigned vece, TCGv_ptr dbase, uint32_t dofs,
 
  done:
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(dbase, dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Likewise, but with zero.  */
-static void expand_clr(uint32_t dofs, uint32_t maxsz)
+static void expand_clr(TCGv_ptr dbase, uint32_t dofs, uint32_t maxsz)
 {
-    do_dup(MO_8, tcg_env, dofs, maxsz, maxsz, NULL, NULL, 0);
+    do_dup(MO_8, dbase, dofs, maxsz, maxsz, NULL, NULL, 0);
 }
 
 /* Expand OPSZ bytes worth of two-operand operations using i32 elements.  */
@@ -1255,7 +1255,7 @@ void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1324,7 +1324,7 @@ void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1401,7 +1401,7 @@ void tcg_gen_gvec_2s(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
     }
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1467,7 +1467,7 @@ void tcg_gen_gvec_3(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1536,7 +1536,7 @@ void tcg_gen_gvec_3i(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1605,7 +1605,7 @@ void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1674,7 +1674,7 @@ void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -1701,7 +1701,7 @@ void tcg_gen_gvec_mov(unsigned vece, uint32_t dofs, uint32_t aofs,
     } else {
         check_size_align(oprsz, maxsz, dofs);
         if (oprsz < maxsz) {
-            expand_clr(dofs + oprsz, maxsz - oprsz);
+            expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
         }
     }
 }
@@ -1779,7 +1779,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             tcg_temp_free_i64(in1);
         }
         if (oprsz < maxsz) {
-            expand_clr(dofs + oprsz, maxsz - oprsz);
+            expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
         }
     } else if (vece == 5) {
         /* 256-bit duplicate.  */
@@ -1822,7 +1822,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             }
         }
         if (oprsz < maxsz) {
-            expand_clr(dofs + oprsz, maxsz - oprsz);
+            expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
         }
     } else {
         g_assert_not_reached();
@@ -3255,7 +3255,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
 
  clear_tail:
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -3834,7 +3834,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, uint32_t dofs,
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
@@ -3975,7 +3975,7 @@ void tcg_gen_gvec_cmps(TCGCond cond, unsigned vece, uint32_t dofs,
     }
 
     if (oprsz < maxsz) {
-        expand_clr(dofs + oprsz, maxsz - oprsz);
+        expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
     }
 }
 
-- 
2.43.0

