Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524376njb;
        Thu, 6 Feb 2025 05:12:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeHIEbCEjTC0XoVatN5/e9x7uKGnVuyAvQrMA5sU47kPnfD8O67zKC9Ktqvg9S7/kZJ7DCJeaJ3A9qUw==@linaro.org
X-Google-Smtp-Source: AGHT+IFzqwp3JMnBjXHVlGFde/7kTh/6WBRsqZ+R7gtNs08Wi+uXILo9QyV7VzYkkkmU98e/n3gU
X-Received: by 2002:a05:6102:3e24:b0:4b9:bd30:34c6 with SMTP id ada2fe7eead31-4ba47934e1dmr4096965137.15.1738847568800;
        Thu, 06 Feb 2025 05:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847568; cv=none;
        d=google.com; s=arc-20240605;
        b=b849+iVWAFJDTq59XSD3HRt8+Nk3rct0qNrPsOhJNGsM1BfFjwZzlCKMm4LyMIzplb
         QS+/6+EcIdYzagias0MxALtH/7V8lfKKmRfapetfNfp5g5ikPZ4WlmtctQOvGANX6Hiu
         VbM2JlX9Srs46vNHEYqgxirBZVx+S4nePNEfTc8BtH75p4hdiI/dTjWEYcWKDSgRUreu
         2XueEscgdRAyixQtkVeHnrhXwwyJwTiOZX4A0fs1IhuBzQF8qX4eirDUmOexqCe+4MQm
         9hCmA6x2AES3QyuX+nnG4B+u564oAERZ9rM89k335piRdZ/gTQJN+MaPqyALc79fm89H
         +jww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O4Wc+wPX9caPrybWTx+kUBv1XRxmKkHkBF0nt6GWIO0=;
        fh=yr00bVLnV7iYVNSWexO0aOtyC2jzRd2HPdRwJdA+ngc=;
        b=XpODL2DO+gnz/5DDwoW2NZTZblI2w63s9Hsj06JxdyQjcGnfNcLKHdkAJe/19T3RgR
         +tQ7MafkiNOedwsf604aNNrCIyD8OTIg99gcnUN5kFm/QadHA5rFJvuYF+lE7Va1g8f9
         L+cLhX1fUJBW3q6oeHEUtQXId9GigkAV/gZoZQB6U+3/UIhfw7mPAyKjVb8+VapRFduc
         rUsDQ2cNa0FYWg6e4Nk35niy0NFScAtCed/V/Q6Bh+4G38hEz+wewW24H9GsDllmALJ3
         wu2tTSf6FOWsrs2xToRA09epwGsYhyReESAQqVcc08TiMfqxqpk2NrCZB9Hgaeum1ug9
         s+TQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C6TN/k7w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba77658aaasi189991137.130.2025.02.06.05.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:12:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C6TN/k7w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg1fM-00059Q-U2; Thu, 06 Feb 2025 08:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fL-00058e-KJ
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 08:11:35 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fI-00087j-J4
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 08:11:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38db3a3cf1cso377995f8f.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847490; x=1739452290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4Wc+wPX9caPrybWTx+kUBv1XRxmKkHkBF0nt6GWIO0=;
 b=C6TN/k7wyJRBUUNtr+JwXDYgT6uQmla4SAQlH9c29e8WyDULavNpTNkUPyeQjClo12
 z2YJdnEi0D1J6msyWsZ1ZfjSdKhZBi9Fp49XSaaTSA7wlKxr9DoCBcQRmm+8CpoYNQpY
 2TT4lwYGkD+3PYUCj9Guxgn9uirQ8nuAvQO4rG2T5fpG0b4kvh6GGv1R0jqtAb3DzAwY
 vcwy0osi8eiMb3RGuPP575hu5lzhQoKAxKpzbT9fKcQwt/9WwmN5sAhJeZcBI5E9nbVY
 ex0ZihQGkSeHywzJXKLvGOP51ekB4KgnBhTsRUoZRp4nB1wY+07dZ4PRg9X6mVlzZ86c
 lapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847490; x=1739452290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4Wc+wPX9caPrybWTx+kUBv1XRxmKkHkBF0nt6GWIO0=;
 b=Tk48eDCUa+/C7Ne+sWZnRn9oPu55ZXwOJ0cRA9sfwmJzum4ae1gZnIJE/rL+asZ4H2
 7PbXt4UrQwXVf4FzIwMdO96vRWJ6i8FH1Tyw/3bP/kookWFFB51oNnxdcRjLv4DmQ2wW
 cgJPPE11zo6sl4IBigIMgeQ3b3+ystjMX1U5JEs2NNCGP19nOSeLHFLX6fC+QqxVzdC1
 skQBuyyC0YWDrYphlHCTjajHAKNj1Od0QrB4nRHREqhKP5VCgqZvgS3eiO81sL7nNjaz
 6K5FVS7MQr+7sB2UB8/u3d67enWgUP07f8GJ31odLui2tDmE7M7QYReZ/7UkM1robmSI
 h34w==
X-Gm-Message-State: AOJu0YzQuf9Kjto53YArzHG51edRjxNR1I7Gt+PZRf+wU2Ihmqi8gTZ7
 7h3Bo3uJWzSNkl0LuR2oDmVUJouigN4v0jmqClKZSk5WJw42aZqH4u5A7W8xUfx0lDpmGO10G12
 awjs=
X-Gm-Gg: ASbGncs7UAwWvjSRGiC2XtWS7CrgqX1X+WRaoGCfweoJXg1gY0iU7XN+6bqUtCxIz3a
 X1a5zdRM3RanNqAFjX8B5aiHW3vLHUfW7t024yx/FqN3OeRqIEQTSWJzK8tCemFzqRH33q0MHbd
 DAb3XvlJurJAMyvdZA57KVm2eIBoq6xyFWXy3lGVMVIBL+n5kEu0bfGXk16uSEwROJipmEX3vAW
 AnnQ+lxCs8c7/njPGZCfd+B3DTBM103OjnBk/pdLfrbUtzgmZ/bhP0lWz6q/0DrDGkKcS2pJrvd
 Iy25oV4arDf/GFgeKfwQ0kdzBo8q5cxwCBeThGMZSriUta6SInaCM19FCjQgSd/ExQ==
X-Received: by 2002:a5d:648d:0:b0:38d:b998:1a2c with SMTP id
 ffacd0b85a97d-38db9981b07mr2650665f8f.34.1738847490504; 
 Thu, 06 Feb 2025 05:11:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd539c4sm1677915f8f.42.2025.02.06.05.11.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 07/16] target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
Date: Thu,  6 Feb 2025 14:10:43 +0100
Message-ID: <20250206131052.30207-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rEb3oZeZbEat

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
index 24005f05b21..86efabb83b5 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -780,13 +780,13 @@ static bool trans_lbui(DisasContext *dc, arg_typeb *arg)
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
@@ -798,26 +798,26 @@ static bool trans_lhuea(DisasContext *dc, arg_typea *arg)
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
@@ -829,14 +829,14 @@ static bool trans_lwea(DisasContext *dc, arg_typea *arg)
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
@@ -846,7 +846,7 @@ static bool trans_lwx(DisasContext *dc, arg_typea *arg)
     /* lwx does not throw unaligned access errors, so force alignment */
     tcg_gen_andi_tl(addr, addr, ~3);
 
-    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TEUL);
+    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TE | MO_UL);
     tcg_gen_mov_tl(cpu_res_addr, addr);
 
     if (arg->rd) {
@@ -930,13 +930,13 @@ static bool trans_sbi(DisasContext *dc, arg_typeb *arg)
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
@@ -948,26 +948,26 @@ static bool trans_shea(DisasContext *dc, arg_typea *arg)
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
@@ -979,14 +979,14 @@ static bool trans_swea(DisasContext *dc, arg_typea *arg)
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
@@ -1015,7 +1015,7 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
 
     tcg_gen_atomic_cmpxchg_i32(tval, cpu_res_addr, cpu_res_val,
                                reg_for_write(dc, arg->rd),
-                               dc->mem_index, MO_TEUL);
+                               dc->mem_index, MO_TE | MO_UL);
 
     tcg_gen_brcond_i32(TCG_COND_NE, cpu_res_val, tval, swx_fail);
 
-- 
2.47.1

