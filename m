Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5011298njc;
        Fri, 8 Nov 2024 07:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVF55FJ0aqD3Ke1nKF619BxC55rTNaRI5PQMu1Mhd5P0osizNAr6BlrxvEKWKKol9bdOwbKWLh2m+LpTA==@linaro.org
X-Google-Smtp-Source: AGHT+IEVkQiYTlpX+wkTUxxDxI5X1+X4cQrRy9JU+2n5bFakG8VpXQDnCt59JRWvC8wgXLc71HH6
X-Received: by 2002:a05:622a:10e:b0:44f:fb6d:4b2f with SMTP id d75a77b69052e-4630864bb05mr58620361cf.23.1731080951772;
        Fri, 08 Nov 2024 07:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080951; cv=none;
        d=google.com; s=arc-20240605;
        b=HSLDPNNgRZHd1N7kimy8gohRekAqSBQX5pSr3vfo8UMmxPkYlhv+y3iqv5gA07q36j
         qgsLhaBHsCvksB5McqGiRMZr9dGjyR3dK0OzSKEXwuLb7GANOLd7m/byk/r9rVYd9OQk
         EQ/Svyus8GIFKmfE4Ybv5DE7Mu1lnAbs9nklIru/SaAeEq/wzLPk7cPZ49OCU/QG9a4A
         OyyoPVQV87G0PZPl0oDl6fpHSMp1lWatoSaYT/l8EPPJ45oDdN9KfMMQFO9MpP3B0Wpp
         yDAuic/t8BD9QHZzfHBNjJ+NU8AgyPCP3ZKhWwkwRWDDNrM7eAl1UcI6q6VaVCyGjs2C
         1veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8j17IHTXkaut+m8u9uRJkB2+OtmZ4RyCwvHXesQ1YIM=;
        fh=hmsD6lwFmcvEXujRMkOSq0Izqa/eJsEUHfRj0BDC4Bg=;
        b=lXLtWBIhoaLoJdGbMiAVlGSbEdrBDByRUEK+fS4mmk8xZjIlJgslakPnV/Avpp1MdW
         e5A3LzAlP/RSPbdc1T0KVvXsMKehKsk0qXOB6Kx2y4/g0lOr5GobJrSCP28CI3U1bgqJ
         unnMxHAhrSw8/fI6Zkts3Pd8FC+nxfluJZEATxEmI1ZYM0PQ/ErmOuruwO4PFoU2UGLl
         Ce0wBlSi8AtaUejzohn1oMyivQpdkal8AJWsyqSNiUj+D+pjJyEyUZ41VQYkgbWR105a
         X7WntSifuPeYKlR6HjXLQseI8tRwUh40i0OO8Pvb14kNXk+r/gbgvnu0FgtUckiTXoUd
         qNpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVXpuRZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff61b8b1si44610051cf.394.2024.11.08.07.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVXpuRZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9RA8-0005jh-G0; Fri, 08 Nov 2024 10:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9q-0005S3-Dc
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:23 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9n-0005eY-6Y
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so26734135e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080658; x=1731685458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8j17IHTXkaut+m8u9uRJkB2+OtmZ4RyCwvHXesQ1YIM=;
 b=MVXpuRZFfgaqjk/KoGDk1BEs9EOIwmXLRnnh9sgT0g8sJaHlFciHtjnJ3uYwXyw3p6
 6W+zlYMtmEk8gMUfpdZ8yYhnyqN2CZG1UzMG6g1CJLxvBPWuRWA22h1XM5hor86m98nI
 U9iCKsMM9DaeZYTEfJNl6bv9d7bXuEorQHr1dt67TpMUY+VYzcws7VFMNp68YDgzvPF8
 FBj3M6OwPlDEYHaOz1f/qnKb2+huBW2nmC/Nq/tsLz3Kqu0bfaspltIffPGVwiLD6qo0
 caazMdDqkyN7MuJKjM2c5Lreo9VVj4/QRiPDOhx7i8YHF7sD/30aPS8jwST3PQ7sdJnx
 bPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080658; x=1731685458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8j17IHTXkaut+m8u9uRJkB2+OtmZ4RyCwvHXesQ1YIM=;
 b=NW5OpAMiStZ+Nq2bIPUBh3Sol6xd/1QwU0pMK9poHQoZZQwkClizOH6dGwkA8scFuO
 J9jHQMnzO5nmEWUX1EDsI7rEDN/WOFfcpa8ZGK46E9FmrgIs/7P2JQMzJUkMaIxsZyC9
 4IJrZWdF4+aTwY14Q97FFGr/TegUHzudt/ZQ7g+5SrxN56Q9VrRxKMhrmT9AGKK7EPtB
 i+EICLJH207u6kfS5x6pmX60q2JeqGrKgBNtRXvhQpPM1Ckureru8xn5KiGdcjYRsBFr
 fvQTp6UTnmvnix1tkklr4eXj0EOsDqxS07f8TNVd5CKRxdgZF5wfBopWeeRX/rm13+uD
 LhJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7T46AixqAOJjbd9f+yhE2rRE1bTFEpSloreTnLRpSO+aHC8agia1WNPR5zdIwX5hBIr21InpQag==@nongnu.org
X-Gm-Message-State: AOJu0Yw1plKiL+MLjC2JA+RA0MXEQnuIrbkYQFsEp62Mzk53thYn7rDU
 T35BFAupn2IeGvAMgF00P2FS8DCFp2kIFBy+bvO9VHxcksXG7QxJ9X81663ezKY=
X-Received: by 2002:a05:6000:699:b0:37d:43d4:88b7 with SMTP id
 ffacd0b85a97d-381f1866b62mr3168605f8f.3.1731080657755; 
 Fri, 08 Nov 2024 07:44:17 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed99681csm5368155f8f.49.2024.11.08.07.44.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/17] target/microblaze: Set MO_TE once in do_load() /
 do_store()
Date: Fri,  8 Nov 2024 15:43:12 +0000
Message-ID: <20241108154317.12129-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: fTNk+rsug1XY

All callers of do_load() / do_store() set MO_TE flag.
Set it once in the callees.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 36 +++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 4c25b1e438..86f3c19618 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -712,6 +712,8 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
+    mop |= MO_TE;
+
     /*
      * When doing reverse accesses we need to do two things.
      *
@@ -779,13 +781,13 @@ static bool trans_lbui(DisasContext *dc, arg_typeb *arg)
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
@@ -797,26 +799,26 @@ static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
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
@@ -828,14 +830,14 @@ static bool trans_lwea(DisasContext *dc, arg_typea *arg)
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
@@ -862,6 +864,8 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
+    mop |= MO_TE;
+
     /*
      * When doing reverse accesses we need to do two things.
      *
@@ -929,13 +933,13 @@ static bool trans_sbi(DisasContext *dc, arg_typeb *arg)
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
@@ -947,26 +951,26 @@ static bool trans_shea(DisasContext *dc, arg_typea *arg)
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
@@ -978,14 +982,14 @@ static bool trans_swea(DisasContext *dc, arg_typea *arg)
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
2.45.2

