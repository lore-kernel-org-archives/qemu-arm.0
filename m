Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5010511njc;
        Fri, 8 Nov 2024 07:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJRL3kOFqDvNoNYJ1uLQWyUriywp28/Bq6dfQpfeYLGItW2PE/LT0KLVqk5e9f682ZqEQJS1j/Pt08/w==@linaro.org
X-Google-Smtp-Source: AGHT+IFeOzGQu3xQ7/FqHEH472YWNoxxi9NCdMu4nuwFOtLkxTuEYEF5Li+SBL63gIhIq4Lj2nvV
X-Received: by 2002:a05:6214:3f88:b0:6cb:ce15:dc4e with SMTP id 6a1803df08f44-6d39e166f8cmr35694136d6.8.1731080875433;
        Fri, 08 Nov 2024 07:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080875; cv=none;
        d=google.com; s=arc-20240605;
        b=iOMl00qCzSlbwREV23m7KykZoW/w9daTy0VgtBiw8W+JF77ybUpw2zP72ADzTfID4S
         u1efr2dNy8M64L53x4UsRLfly2flx8HeJQQ6oZ4FeQ6Y0Y7P/4QSoLmC5Xw8/goMqSdu
         e04ONifAOxxBRElWb5m932c4qbmgpTJeAh2l84O6jF2rRHNevMHKBuLccsN3+0AutCgc
         iHBylZibY8GyQIdb+LqrQbbU/Ng4MMc8z4/HQCvgJ/E/6qdVhvJZuFxdtJv0YyiXo63L
         1uqqRqLldjQQ6NQf0oxQaAXwQStYnp3En71TfkPc+yCwlDCxGAn3TfiKF3nlufbLeqMp
         +1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/NCcHJoi8uwPYYIKuKRo8/qY4WRUa7npw8othDKETY4=;
        fh=oVr6ugzhJHKc/8AN5x2PkRlu9KBFtbCc7vlC1WhihVM=;
        b=IB0aPvZh6ehsU4SnW30sn2+5RiXVWilyNdbHKpqz8TT0w+QfRYlh9waAgZYPT5cPsy
         Q3I3wlq9AYd2ykC9qb4zCoGz4aA8wJV4pk95b1Y3FWPgBokkWwwyKZ372tKDhhriaaF0
         OHJP84L2BzsvEMQBOJxrrzTLJDbW2oDSV/Hoa/0RTT5sUSudyxKBuQzANGypufwgo8QR
         xvcFM92JnLHuBAq6gPTCecyO22Emaej0bDFmQ61cfyD3VUrcmvM1w6P8xK/fbZO7VdkE
         yMYRNaouf458EGCsyrBYhJDfhv1zy1+6BhtTh89G5iKL/oZeEw9uO11mL9PV2shTpcKe
         G5RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/0yBgwP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39664cf4dsi42294486d6.195.2024.11.08.07.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/0yBgwP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9RAC-0005qD-Ea; Fri, 08 Nov 2024 10:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9l-0005Bz-II
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9j-0005ce-Ki
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so1326049f8f.2
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080653; x=1731685453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NCcHJoi8uwPYYIKuKRo8/qY4WRUa7npw8othDKETY4=;
 b=V/0yBgwP1eUSZ51xAAM31XjL9iRdCaOrWIwvbGI7ZO7agIzbN/C02J1bTB/IMYAm0q
 KZm+K65wkBmjNyaN1TReTmWfGnDZq9F3qwrC5YUloeceOB2misXrtHCUDIyDL+WAMwV+
 DWwHY2B6M41TKPEouRLergQtNVX2f4lQB6ZeLJIcIDzg3fF8m9pBo7dt0kvZod4EepUy
 /ibeQkh7JqBd9GhnAynlXwryij83sgEv8DraIN6pZhSZZm24aTPWreRIiAcvEzH7gW/P
 VZdRLApSEqlIfsnntLy1IQEJgV7OaCF+0xTivELjGz5Jjpu71r87D+jxtrftEbV3eUR2
 KFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080653; x=1731685453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NCcHJoi8uwPYYIKuKRo8/qY4WRUa7npw8othDKETY4=;
 b=Xse3KdccrUZMjXkXB2KbFfLHlcw8xgThcV1SltkS//3Rb6GeAxUIMGuwyB+W3lNrGa
 DnYMrNIEB9489dKj0u5dUxmRPjqMb0q/nRcaHOWleXKUfa4TWqhCrg3OKx3IEa1aFJpn
 +A+kJsr9X8zAMg2VPxxEI6CnHM2H6AZVT7HY2LgzVVY/6ynombBRzRfjFKPzMQwrDv1G
 iXgL6ij+dr/UajvRxiNqiHbn7Kg9TZ7v6RofYU7Y8J8ZmccbVyHjmO8i9fBN3AHjYDzt
 LDf7sZMhVz3TxxaVee05o0XAR0l7G1FUbMpLr9582TYAh3xJ49eTkfVgEaOzwuVZpC//
 g+uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNoS5l6xxViqsgHWZYgD0B405XCaMuCUjV51s0NrYbsBA3yqFY6KLMLqouygQnWU+1tW3GiTIk0g==@nongnu.org
X-Gm-Message-State: AOJu0YzGjYRj9RSFgwKMOSJKm150hqh5Ad07UlmTSjBBQwB7WHPgdppa
 tgn70Aw98CtfugxbdAPPXCyRGwcjWWdgYJwJmoFpyieJk+TRNpBG2UXLCnwF42o=
X-Received: by 2002:a5d:6d06:0:b0:37d:45ad:8394 with SMTP id
 ffacd0b85a97d-381f1866bb5mr2985528f8f.15.1731080653098; 
 Fri, 08 Nov 2024 07:44:13 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm5236750f8f.100.2024.11.08.07.44.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:44:12 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 11/17] target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
Date: Fri,  8 Nov 2024 15:43:11 +0000
Message-ID: <20241108154317.12129-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: qz78c7GxpbmZ

Extract the implicit MO_TE definition in order to replace
it by runtime variable in the next commit.

Mechanical change using:

  $ for n in UW UL UQ UO SW SL SQ; do \
      sed -i -e "s/MO_TE$n/MO_TE | MO_$n/" \
           $(git grep -l MO_TE$n target/microblaze); \
    done

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/microblaze/translate.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 4beaf69e76..4c25b1e438 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -779,13 +779,13 @@ static bool trans_lbui(DisasContext *dc, arg_typeb *arg)
 static bool trans_lhu(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TEUW, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
 }
 
 static bool trans_lhur(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TEUW, dc->mem_index, true);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, true);
 }
 
 static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
@@ -797,26 +797,26 @@ static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TEUW, MMU_NOMMU_IDX, false);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_lhui(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_load(dc, arg->rd, addr, MO_TEUW, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
 }
 
 static bool trans_lw(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TEUL, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
 }
 
 static bool trans_lwr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TEUL, dc->mem_index, true);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, true);
 }
 
 static bool trans_lwea(DisasContext *dc, arg_typea *arg)
@@ -828,14 +828,14 @@ static bool trans_lwea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_load(dc, arg->rd, addr, MO_TEUL, MMU_NOMMU_IDX, false);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_lwi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_load(dc, arg->rd, addr, MO_TEUL, dc->mem_index, false);
+    return do_load(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
 }
 
 static bool trans_lwx(DisasContext *dc, arg_typea *arg)
@@ -845,7 +845,7 @@ static bool trans_lwx(DisasContext *dc, arg_typea *arg)
     /* lwx does not throw unaligned access errors, so force alignment */
     tcg_gen_andi_tl(addr, addr, ~3);
 
-    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TEUL);
+    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TE | MO_UL);
     tcg_gen_mov_tl(cpu_res_addr, addr);
 
     if (arg->rd) {
@@ -929,13 +929,13 @@ static bool trans_sbi(DisasContext *dc, arg_typeb *arg)
 static bool trans_sh(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TEUW, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
 }
 
 static bool trans_shr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TEUW, dc->mem_index, true);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, true);
 }
 
 static bool trans_shea(DisasContext *dc, arg_typea *arg)
@@ -947,26 +947,26 @@ static bool trans_shea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TEUW, MMU_NOMMU_IDX, false);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_shi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_store(dc, arg->rd, addr, MO_TEUW, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UW, dc->mem_index, false);
 }
 
 static bool trans_sw(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TEUL, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
 }
 
 static bool trans_swr(DisasContext *dc, arg_typea *arg)
 {
     TCGv addr = compute_ldst_addr_typea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TEUL, dc->mem_index, true);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, true);
 }
 
 static bool trans_swea(DisasContext *dc, arg_typea *arg)
@@ -978,14 +978,14 @@ static bool trans_swea(DisasContext *dc, arg_typea *arg)
     return true;
 #else
     TCGv addr = compute_ldst_addr_ea(dc, arg->ra, arg->rb);
-    return do_store(dc, arg->rd, addr, MO_TEUL, MMU_NOMMU_IDX, false);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, MMU_NOMMU_IDX, false);
 #endif
 }
 
 static bool trans_swi(DisasContext *dc, arg_typeb *arg)
 {
     TCGv addr = compute_ldst_addr_typeb(dc, arg->ra, arg->imm);
-    return do_store(dc, arg->rd, addr, MO_TEUL, dc->mem_index, false);
+    return do_store(dc, arg->rd, addr, MO_TE | MO_UL, dc->mem_index, false);
 }
 
 static bool trans_swx(DisasContext *dc, arg_typea *arg)
@@ -1014,7 +1014,7 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
 
     tcg_gen_atomic_cmpxchg_i32(tval, cpu_res_addr, cpu_res_val,
                                reg_for_write(dc, arg->rd),
-                               dc->mem_index, MO_TEUL);
+                               dc->mem_index, MO_TE | MO_UL);
 
     tcg_gen_brcond_i32(TCG_COND_NE, cpu_res_val, tval, swx_fail);
 
-- 
2.45.2

