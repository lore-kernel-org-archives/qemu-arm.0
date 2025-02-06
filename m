Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777157njb;
        Thu, 6 Feb 2025 11:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0J6pSIgPqMXIsQ3sRQeCxWQ8oGx9k2ju+GRgEqcwCBGvRJ67ippWjeqmgsPfMp3awDS7XxtQtxOuvXw==@linaro.org
X-Google-Smtp-Source: AGHT+IEDwmcR9My/yqrVsVHEbSp/xH89AAuQmim0LWuryRzwSkgCIpxYVYniygei86tSHScY7eI1
X-Received: by 2002:ad4:4eea:0:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6e44566a31fmr5560966d6.23.1738871882154;
        Thu, 06 Feb 2025 11:58:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871882; cv=none;
        d=google.com; s=arc-20240605;
        b=aNRJn8CDw5vsBSOhehiqpdha1rtoCVGZ4BnpdS0iVrBPRRk5JolpMBNv3DA0F5mNme
         fPZzKnICUmQWPeV3vGLGs9QkgT7EX6tN2YgPYbnTuCet5s7H/4Kk6oW4MD0yCf4pJFan
         id43syYA9bkYlTK3XWA5boqSOy1zy8NlBTcJhy81KIZV8cw/AowSXO0PNgWHzuedX/wX
         qkkZQ+rGKBFgaYS55xI4ztISWu/vFnGza79MNkioQE5JikPynGvj6Qlv0kJ+SLjJd+5Y
         iKrRcxCKc6NRnVDJhb6EN9IA6RtDh6pOx2JN5NG3vn3qJEO1sudBuApHHvnDt+za/QR9
         +JBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uoQR56lcjZAhphgQyGDSgdvmVHPYbCeYqSZu6JrpeEQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=TJ573Q3tAn2TnNjiKsqtsJWoshSDYgjP2sGHRIR6ycHa5O2u5Sc5W2S3VP3BNLLy6c
         d+aZB8U8z2b/BCmw3wMWwCqmrOtnTFUH0k9PmTuUbT5SvSGyiRj3ULCNHl+eFT8m1k2H
         9QmE0XmEzMf8cHPSP2qtD8oOsV5R2oAKAWPiZ6MqFUrm4Y4m2CvO7oLw3TTLLsev4oyy
         TveIhBy+76L+i+T5aZ9qXgOOHsdthzUFk5eA3wrgAjwPzLotYkdpNrxtWHXkvsxsOsbM
         eoIUBPmyE2KVXFkHOJ842NeDOySTPw+z7a5uJUUwiPMiSQrDSq5SCSopYetphMPm6/fG
         6AeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q5Enlsa0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bafde58si17408596d6.405.2025.02.06.11.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:58:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q5Enlsa0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg809-0007Ax-PL; Thu, 06 Feb 2025 14:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg804-000773-23
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:24 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg801-0000RW-0y
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:23 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-216728b1836so22590935ad.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871839; x=1739476639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uoQR56lcjZAhphgQyGDSgdvmVHPYbCeYqSZu6JrpeEQ=;
 b=Q5Enlsa0ucZqxBa9nSzreoxxXHqWL3PSElgcVAHZRwEOHPpBc65ExIU9oTTI1XXpty
 Fi4Gi21NCXToGpC6RgdYrhLEuhUn3nq3jsljroBwhx4UQzwbQWotnbkqnjxVKrt2j7AI
 1kq/hojK42H4wmv7reIUOwOeDdjfQ+UhQfo7iVYjxZj9CajIwMjAmxCqoXgbux1zXUvA
 hQe+00q/IAIKL5HU0RAj6lOJSuvOoi1PNWdoiKot5mQYExJYxvJ/31xsvkb9EsGhzyy5
 XixuUviUE6MRtzABH6f8GloLLSvVypiRLE/5WR0ER3hdicffKXdHtHujBaYfgEjIgvp+
 vKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871839; x=1739476639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoQR56lcjZAhphgQyGDSgdvmVHPYbCeYqSZu6JrpeEQ=;
 b=fMnxX6A7iLxDkDGxliHV8FReyIov9uD9M/g4Kjpz2Iqrj+S7729hUJCq+SKUJ53w8/
 yu9AonNN4kBkWjEYpt0h4f2HKi94aUp/f2jndDzRSSvAka9t0k5+McT7yjKlRDlpTmK2
 Q838mZzdYSFoQluu+iWH2ptJNgSIbs21/dSOCsbyEpU2mA98ys6+PKSiJir8QvLmGvfL
 BrPq9FA7r8WJ6lsRkjATRjEsQ/nLa7NjKg5fHdQv39LIFcIoapycsXIVjk54KuH789Hc
 xd64Jm0rhK4xrTK2He7xXMQEPKxf/f1sb6CyJdsbhikIGSkXfHUp07QLT7BuVoc9WwK4
 EYIw==
X-Gm-Message-State: AOJu0YzfASrQpsqB4hO8z5I1LJfwxWp0YQkCOgNTMr2x0xsw0GhGOYhf
 Yw7YiOXa2su0FNY4CB0KE44O2AU2HBbFIkHcezZOfLB+HahKfZb8SNyvXsO+VSqAKb/QXtpHWHV
 p
X-Gm-Gg: ASbGncvCvwi2+mz6mUILX8DUPNZZaw4yuqTGzqgaIrcQ8SlliMGaAIx1T2qKhBneoLl
 Iz/9qwdleRCMS7o29HIqmElykNfkxb5Wl5ld357X7eOkLuxOaT/DKiA6IsV+f+39t5UdIu7cR0n
 +Zrd+4Si2JAv0RUa8sBw5ixn6btsPT12HvRKT8FohT/jm3NXHIr+TfzX1IjEVGysLf+4wJqtHJG
 qWoL0LzYWoBZRX9qsO46DiTwR9JIQGOagThQh8b2XkYuZgUqIqAlyphj0k4TLzTqUp2LZWFJMDM
 rHtc3kJQom/I2LKIVL5zJZ9Ogk2icpT6tgqWlgN+hWqMtiE=
X-Received: by 2002:a05:6a21:3511:b0:1e5:c43f:f36d with SMTP id
 adf61e73a8af0-1ee03a45cd8mr1371365637.18.1738871839580; 
 Thu, 06 Feb 2025 11:57:19 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/61] tcg: Add base arguments to check_overlap_[234]
Date: Thu,  6 Feb 2025 11:56:18 -0800
Message-ID: <20250206195715.2150758-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: QjFPfeRIon0o

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 55 ++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index c26cfb24cc..54304d08cc 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -58,29 +58,34 @@ static void check_size_align(uint32_t oprsz, uint32_t maxsz, uint32_t ofs)
 }
 
 /* Verify vector overlap rules for two operands.  */
-static void check_overlap_2(uint32_t d, uint32_t a, uint32_t s)
+static void check_overlap_2(TCGv_ptr dbase, uint32_t d,
+                            TCGv_ptr abase, uint32_t a, uint32_t s)
 {
-    tcg_debug_assert(d == a || d + s <= a || a + s <= d);
+    tcg_debug_assert(dbase != abase || d == a || d + s <= a || a + s <= d);
 }
 
 /* Verify vector overlap rules for three operands.  */
-static void check_overlap_3(uint32_t d, uint32_t a, uint32_t b, uint32_t s)
+static void check_overlap_3(TCGv_ptr dbase, uint32_t d,
+                            TCGv_ptr abase, uint32_t a,
+                            TCGv_ptr bbase, uint32_t b, uint32_t s)
 {
-    check_overlap_2(d, a, s);
-    check_overlap_2(d, b, s);
-    check_overlap_2(a, b, s);
+    check_overlap_2(dbase, d, abase, a, s);
+    check_overlap_2(dbase, d, bbase, b, s);
+    check_overlap_2(abase, a, bbase, b, s);
 }
 
 /* Verify vector overlap rules for four operands.  */
-static void check_overlap_4(uint32_t d, uint32_t a, uint32_t b,
-                            uint32_t c, uint32_t s)
+static void check_overlap_4(TCGv_ptr dbase, uint32_t d,
+                            TCGv_ptr abase, uint32_t a,
+                            TCGv_ptr bbase, uint32_t b,
+                            TCGv_ptr cbase, uint32_t c, uint32_t s)
 {
-    check_overlap_2(d, a, s);
-    check_overlap_2(d, b, s);
-    check_overlap_2(d, c, s);
-    check_overlap_2(a, b, s);
-    check_overlap_2(a, c, s);
-    check_overlap_2(b, c, s);
+    check_overlap_2(dbase, d, abase, a, s);
+    check_overlap_2(dbase, d, bbase, b, s);
+    check_overlap_2(dbase, d, cbase, c, s);
+    check_overlap_2(abase, a, bbase, b, s);
+    check_overlap_2(abase, a, cbase, c, s);
+    check_overlap_2(bbase, b, cbase, c, s);
 }
 
 /* Create a descriptor from components.  */
@@ -1205,7 +1210,7 @@ void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
-    check_overlap_2(dofs, aofs, maxsz);
+    check_overlap_2(tcg_env, dofs, tcg_env, aofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -1269,7 +1274,7 @@ void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
-    check_overlap_2(dofs, aofs, maxsz);
+    check_overlap_2(tcg_env, dofs, tcg_env, aofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -1335,7 +1340,7 @@ void tcg_gen_gvec_2s(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
     TCGType type;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
-    check_overlap_2(dofs, aofs, maxsz);
+    check_overlap_2(tcg_env, dofs, tcg_env, aofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -1415,7 +1420,7 @@ void tcg_gen_gvec_3(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs);
-    check_overlap_3(dofs, aofs, bofs, maxsz);
+    check_overlap_3(tcg_env, dofs, tcg_env, aofs, tcg_env, bofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -1482,7 +1487,7 @@ void tcg_gen_gvec_3i(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs);
-    check_overlap_3(dofs, aofs, bofs, maxsz);
+    check_overlap_3(tcg_env, dofs, tcg_env, aofs, tcg_env, bofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -1550,7 +1555,8 @@ void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs | cofs);
-    check_overlap_4(dofs, aofs, bofs, cofs, maxsz);
+    check_overlap_4(tcg_env, dofs, tcg_env, aofs,
+                    tcg_env, bofs, tcg_env, cofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -1620,7 +1626,8 @@ void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs | cofs);
-    check_overlap_4(dofs, aofs, bofs, cofs, maxsz);
+    check_overlap_4(tcg_env, dofs, tcg_env, aofs,
+                    tcg_env, bofs, tcg_env, cofs, maxsz);
 
     type = 0;
     if (g->fniv) {
@@ -3149,7 +3156,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
-    check_overlap_2(dofs, aofs, maxsz);
+    check_overlap_2(tcg_env, dofs, tcg_env, aofs, maxsz);
 
     /* If the backend has a scalar expansion, great.  */
     type = choose_vector_type(g->s_list, vece, oprsz, vece == MO_64);
@@ -3769,7 +3776,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, uint32_t dofs,
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs);
-    check_overlap_3(dofs, aofs, bofs, maxsz);
+    check_overlap_3(tcg_env, dofs, tcg_env, aofs, tcg_env, bofs, maxsz);
 
     if (cond == TCG_COND_NEVER || cond == TCG_COND_ALWAYS) {
         do_dup(MO_8, tcg_env, dofs, oprsz, maxsz,
@@ -3889,7 +3896,7 @@ void tcg_gen_gvec_cmps(TCGCond cond, unsigned vece, uint32_t dofs,
     TCGType type;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
-    check_overlap_2(dofs, aofs, maxsz);
+    check_overlap_2(tcg_env, dofs, tcg_env, aofs, maxsz);
 
     if (cond == TCG_COND_NEVER || cond == TCG_COND_ALWAYS) {
         do_dup(MO_8, tcg_env, dofs, oprsz, maxsz,
-- 
2.43.0

