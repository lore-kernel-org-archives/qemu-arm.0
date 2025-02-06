Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524304njb;
        Thu, 6 Feb 2025 05:12:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVT+OeT2lbNbLXwXCTxnb+uDwmu0Kei76fRSTwVVHV1avXOgD3l2sfEFLiK+G9tQ6afKGbwtXRgWamBqw==@linaro.org
X-Google-Smtp-Source: AGHT+IGzwTCBI1QJxFJjw6+78KJnNOILjtzob14R+sLihC2XVjMplKYYLWoUsS+dFcFu5nVoMjHG
X-Received: by 2002:a05:622a:1988:b0:466:8c53:7758 with SMTP id d75a77b69052e-4702814ca26mr94899821cf.5.1738847560794;
        Thu, 06 Feb 2025 05:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847560; cv=none;
        d=google.com; s=arc-20240605;
        b=ZO8+xhx/PmyEIS6SDn5MHhuY8gg0K6gJNlbLOGoWPVXKmdELfGgVmegvSHCoakKGLt
         oICwnjIAw7W1JXdBczwt2vBvwxykeGrDh8TMXYgn0zbx/5p0IHUDsgOUtbewMfFEvInW
         LoALpxcO2L5M2UETcZAJsuR0xc/2FYQapeV7eBSZEAZqCdjt5/uvmxgvvHLF8mFPXqiJ
         ig7M9VAhoKeb6lpMlp0GcYRLdOyOc28p3PyhRNWkU4IvePw4y44ec7gxAxu7jpBF5vDM
         egnqVMrRRD9hSXeZUlqCGTtC4QE8kegTEf0yT2EiBkbHyHE7xtr7kLZ/qH3kWfY/yII8
         XoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V8KqGQ9zIkCuNT2EkzNy15iA5VEmYGDpqhCWVedzzZA=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=WluuTvnUwxa3QcbKri0suzDOQdpu2PzzTQtwUrM1xqLYX/L+7RMhwb4tUmTbhP6sAt
         fbzsFn+hQ+tkb4tCMX3zyOy1v4+J4jf8TNDZk3dBAdqzlLP5lZme8bOtV4VIgduHGQ4v
         ZKStcl8+8X8xutOb+3lmXzM8R9pHFTzPEZSJ4aL+Etsq+/awbUaEz3SFQ4Rlar/sdfYR
         EJLH6laS+5uGqr6aJXiKqLF5q+CycSlBZv/njcNW8Tqj4GkWbT/Fe0DORobmu0xJ30gb
         LsZp1D92igoxB0cM9fDU+9O5RPmTXALajPZ/JzQusM//4mzxHNGwB8DU86g2HpbkBgYk
         QaDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EshzQQPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b6f7f6si10947661cf.245.2025.02.06.05.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EshzQQPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1fR-0005E1-Lo; Thu, 06 Feb 2025 08:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fP-0005C3-A3
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fM-00088X-TK
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso9703375e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847495; x=1739452295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8KqGQ9zIkCuNT2EkzNy15iA5VEmYGDpqhCWVedzzZA=;
 b=EshzQQPoPeg8YzMvPK1lpDDOjJ+VGHLSFevlqfRyOJZ6K8gq+FeC4Xotl5HVOdNVd+
 Bm3tC6WY4bq5Mu/uhJsc5i+JrHzQqjlCezLTO8YZuzxyZYNnkTeRx0Q4e0EEK0bC00fg
 FEX0VF6wsJ5r5RqSSvUuP61fiFyWK+BZP3GKUfGjXbGeZccORfJoNbyH1TjsLHf5j+WU
 1DfDjlWGxZh14SLFpD91L3iS545BHMV7Fz8JwZYk8ZbN0aF6fkC3GJujojGM6rTpSfGI
 ts3ZMRYBanj5UqazvhR/s7g+rz9qcuInhpl2y14fyr5TpQQnharurFBi4PqLOnHXc4aX
 vPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847495; x=1739452295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8KqGQ9zIkCuNT2EkzNy15iA5VEmYGDpqhCWVedzzZA=;
 b=J7AkZVSaiWCgbV/C3QX2zeatoDrl5fxFqiG+aIub3zdDZketcxFlYM9Hho/gk0fhgq
 qn5B1G9olvYoyqy5w+fKKZhdAap36pKFgmXyE3r5hwYSXannozDC08H19RfpaLmnkpck
 qXWSEv0ETf4THxw8HEuJcckheYVVTHVcFtr5CeY6OZxibFTOjfwgaQ1AVUddwxm+rmia
 gB7dE50sweUg/w6H8T+LPklPPZwUVmiqDl8OfXLF6wiOHs8ti232NRjTwBUuna1bwYXY
 /dpAB1TnDir5s/201USBUY+HJ70XTiO38n4XA/4zogmjn0+F4GLQ+A2fKA3Pt55cdq0o
 fYPg==
X-Gm-Message-State: AOJu0Yxj5X9h+ljDPuDIzhW2dLplxnpQpCUNTjSAHP1TD3DaFbp30B+q
 jYoHiT+lLvA8BesBEtMehT3301nZhmHJM82YGoq/xC2+YK3ROdzyJ5wsm+IxSF0=
X-Gm-Gg: ASbGnctYSbJl4u9TYbPbI0SUQdA60awZtIkUcnyEL7k54gP6B3MX07woStIl3wvCUI8
 HjZ/eRzfvxf2gWyjQ5+gTKzDArtbgAomqz63drVGgq8ROah41T6bVfxYCcn93EEnF3uaPjteUrq
 2k1BMegf8eQaWuMZEXMvfOGYez9XAp48LHZMBw9cTuTYGA976QLObLmbeMvZR3eVLU5/yWDhDUp
 EbuPjzmtsm1xOjY08rsIcJ89mARErxOOtxuCjZffYpiMNfZk6GhCHIdl6/mLA+XhR1HXIjEupEW
 8or8lZAWTAzdjSKfBCkrsVFDtQfefng/VgHs5lpE0+LEt4u3hJjblKiffLHAXpzQmQ==
X-Received: by 2002:a05:600c:83ca:b0:434:f218:e1a8 with SMTP id
 5b1f17b1804b1-439133fe7abmr21066925e9.19.1738847495448; 
 Thu, 06 Feb 2025 05:11:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcb0eacsm18832295e9.23.2025.02.06.05.11.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 08/16] target/microblaze: Set MO_TE once in do_load() /
 do_store()
Date: Thu,  6 Feb 2025 14:10:44 +0100
Message-ID: <20250206131052.30207-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: aTula8VwYmrC

All callers of do_load() / do_store() set MO_TE flag.
Set it once in the callees.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 36 +++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 86efabb83b5..0d51b2c468c 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -713,6 +713,8 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
+    mop |= MO_TE;
+
     /*
      * When doing reverse accesses we need to do two things.
      *
@@ -780,13 +782,13 @@ static bool trans_lbui(DisasContext *dc, arg_typeb *arg)
 static bool trans_lhu(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_lhur(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, true);
+    return do_load(dc, arg->rd, addr, MO_UW, dc->mem_index, true);
 }
 
 static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
@@ -798,26 +800,26 @@ static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, MMU_NOMMU_IDX, false);
+    return do_load(dc, arg->rd, addr, MO_UW, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_lhui(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_lw(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_lwr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, true);
+    return do_load(dc, arg->rd, addr, MO_UL, dc->mem_index, true);
 }
 
 static bool trans_lwea(DisasContext *dc, arg_typea *arg)
@@ -829,14 +831,14 @@ static bool trans_lwea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, MMU_NOMMU_IDX, false);
+    return do_load(dc, arg->rd, addr, MO_UL, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_lwi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_lwx(DisasContext *dc, arg_typea *arg)
@@ -863,6 +865,8 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
+    mop |= MO_TE;
+
     /*
      * When doing reverse accesses we need to do two things.
      *
@@ -930,13 +934,13 @@ static bool trans_sbi(DisasContext *dc, arg_typeb *arg)
 static bool trans_sh(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_shr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, true);
+    return do_store(dc, arg->rd, addr, MO_UW, dc->mem_index, true);
 }
 
 static bool trans_shea(DisasContext *dc, arg_typea *arg)
@@ -948,26 +952,26 @@ static bool trans_shea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, MMU_NOMMU_IDX, false);
+    return do_store(dc, arg->rd, addr, MO_UW, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_shi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UW, dc->mem_index, false);
 }
 
 static bool trans_sw(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_swr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, true);
+    return do_store(dc, arg->rd, addr, MO_UL, dc->mem_index, true);
 }
 
 static bool trans_swea(DisasContext *dc, arg_typea *arg)
@@ -979,14 +983,14 @@ static bool trans_swea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, MMU_NOMMU_IDX, false);
+    return do_store(dc, arg->rd, addr, MO_UL, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_swi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_UL, dc->mem_index, false);
 }
 
 static bool trans_swx(DisasContext *dc, arg_typea *arg)
-- 
2.47.1

