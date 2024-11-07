Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3911120njc;
        Wed, 6 Nov 2024 17:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9k+3Bf74CyYXGDNhSnB0BHE6t6DXnQ7c71n0+aue040NddLo9XN4ih4dLrm+CB/5wv2pAbwhzCblCww==@linaro.org
X-Google-Smtp-Source: AGHT+IGmVDtqGmKgOuLfo8z9gBuK2W5+p3IsATDKjiPzzlHTbt6zOMJN0uH7bJ2Ve613QkggJrqh
X-Received: by 2002:a05:620a:4621:b0:7a7:d37b:3ee3 with SMTP id af79cd13be357-7b3277f31femr245208485a.26.1730942738115;
        Wed, 06 Nov 2024 17:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942738; cv=none;
        d=google.com; s=arc-20240605;
        b=Lon1azM0uX7CUZ2M17DeQZctEPUGeElM9/YBLXmvZTLmB5Qu8C7s7qietZvu3j28nA
         akeZerHf2aXgYH7gQiMQlEelS4/c83iBviFDjO9YgVWA6+04Fvz2ibi19VDhsDNILLt+
         pwsE/aF1HxDuxvNfacNGL//YU/czUFSvMamM3QpKDABHf96FzDoziaMCvHnJY/xySjJ5
         Zsu0z4HPLfU/sxXhCt9mi0vsUMbSvJ3O5a/qNQDr89a/EsOFqSg1mfgIG/eA0pTmoPFM
         nRiDvTxR2OsAvf6twADF1aIFdvyX9IUMC7VnFctasSKc4aGs1LWg8FiCuKDoQsWiRFJ5
         w2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/NCcHJoi8uwPYYIKuKRo8/qY4WRUa7npw8othDKETY4=;
        fh=JRGJYeaMvHCle0/nsWWeF5PzGbme28V2J7dO0gg/7Yg=;
        b=fsvvJsraXoouXI1hzfhnfFottC4RxOAh0IdEpPfFJzEznB3SVUo4o4sH/X2cW8Wh5+
         m0HkFzxNmxtqBpf9vTOftb8YPelHhm6tAPflbXoGVTgbHWbnuK4s1kLX8PnQPfeLL2TU
         uWcVgcSd+Z6ppLmn8XDuXU+j9FfyZp7i4nIhj5Ooa/k705PuiXh85qX+7qh6lhlBifV4
         N9CUJaK+2B3QwlpXapgGE55K6vmLPBRTjFojUlPArzsgcDDaQ9NWTLj7q8w973hroVBX
         UFqZ/o88H7Xuka7/6pPjUWfPjmnCI+Aaq9HNgvqutFWBFMqNYrsRwYcBd9nt3pYa0aMj
         ECag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Onc+iqJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac3db91si41825785a.52.2024.11.06.17.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:25:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Onc+iqJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rFY-00067R-Tw; Wed, 06 Nov 2024 20:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFG-0005kM-3d
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFE-0003B0-0N
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:33 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so889153f8f.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942610; x=1731547410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NCcHJoi8uwPYYIKuKRo8/qY4WRUa7npw8othDKETY4=;
 b=Onc+iqJre0hasKnan5X0/iXPcmP9F/RWQ38cBIbNNlS+qzY7myqfIznB+u/wbFfLBE
 szsyX9m/6olWeGrelhPD7RIASn4Jlo2yUXy+Ee0o50lcE6pt1ij6bZN/42jYHTXvwApd
 sh4B32HVYIJbrJmd5dlTVgRuqIftB4p6zBpS827xq2VRkNz8TaFVvQjMt2I8c5nAwsau
 Whzzm/1Or19XT3W9/uvEAc9UFOAojOheCiSs/OKPRsrflD/+lwHjLgSVaNjPmLC3iZ7g
 JVjKjtTa1pdRrks69qMWKu3SjIgM+DkZQ4T43paCMipHqVoJTVSGb+Nj8poHFKkFxfOV
 smPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942610; x=1731547410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NCcHJoi8uwPYYIKuKRo8/qY4WRUa7npw8othDKETY4=;
 b=DR8T8l/Zj4yZ8cWzxhzKUN2MkJprbFrb/+7F1cY8QUqFDMJZUwszIvtSgpDdovmy59
 WYy0/2f7KOZXP42wjvOtbcmo4Ov/0tsNtivLfN6+LjPUwHUltkg8opg4DeVL4f7oMCG0
 972ppgEiyX/57DsXIt8242kkvhKBtnAt29UaSsv+jxVfzEhVAFxJb9v08pDm8d5D9Ifv
 G9ipiV7/t3W7NUZdrf2fEjLPVhozBY7OtDeiVI9cxlwqFeYwKhc6dXGS/TOOpnSqqBT1
 BbdZEAL2Tb2AcIq18Xu9npfIOrHg48c/mkF056zw9CQQYQaC8wcdEVKjuXnr8+Tp6AVQ
 fZGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDMB2B0PlNqqlbY4aLScNg1FjQjfxKBghpskemG9vH9wGF/cv4icn52zxsoWD2PuVYsPLGk4580A==@nongnu.org
X-Gm-Message-State: AOJu0Ywemx96LjlVFZ93ZhX9Crjb9ou1o3NXRwPKlPMqBzGedXuRCtFp
 jsX6sMjLJYftDpYAWIWAohOIFiEB8ljUigBE+IsWTrKwumNonInSE2CRBFcyESo=
X-Received: by 2002:a5d:6da2:0:b0:37d:4330:c87a with SMTP id
 ffacd0b85a97d-381ec724f22mr807047f8f.4.1730942610121; 
 Wed, 06 Nov 2024 17:23:30 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97ce1bsm242407f8f.36.2024.11.06.17.23.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 10/16] target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
Date: Thu,  7 Nov 2024 01:22:16 +0000
Message-ID: <20241107012223.94337-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: Im41+cajGF0D

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

