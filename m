Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368836nji;
        Wed, 11 Sep 2024 19:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHnZjouefyPc3IZZRJsdScpq/Tacdg+ASaxsf1t1ceCX+VQhCNfmVBMlmplrNFYvNBiz676GGbLai7PA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhEo5iqlwQXacEQoU6kyRBfaD1LT5Zgi7xR0nsFaQ5epx7FDszYmrq4vrt8JiRHw8vTUKv
X-Received: by 2002:a05:622a:1905:b0:458:32ca:a306 with SMTP id d75a77b69052e-4583c73b6d6mr129022211cf.14.1726109162564;
        Wed, 11 Sep 2024 19:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109162; cv=none;
        d=google.com; s=arc-20240605;
        b=ebqiKvkLbxszhZv8cvNgURXYJnlUO1YzDaprhw35f89vEvRBc1kAMzeGV7zy/vIWN9
         Tdh/VIfNI//UrAgi/cvjgu6Q+EusPTD2C5YJmJCxl/mRWYZH3kyNPGfw5/c2V2KuwWFZ
         s8Q8Hk2VzJvvkuWAE5Imbz/k1Rt2uQGW/yOMQUXu8iqFnNYgFcRMjlWFd7+NaJcPnUc/
         Vtc8Ttf9B8o6rNnFRt3PkkaHOAhANwf5EmcbSfIkZNMI7oGFwKouYJ7BG1cDEneJlF1z
         IHj60fyqVqRkBYfS//fdiXNoSJ/S1CGaTN2t1+zGQz71UmQf1kEF07dHnjc1/58CPhnx
         Db4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=40qRQiWPnzwQZNkzfC9uwjfmjEELssT5eDCBB5PE7FA=;
        fh=gQUbKHWxndGeE+DWX4FUU/bGRmGjAJrLFJIkYOi+27k=;
        b=c0ENw+fi0shjpBQ6qc+wMckZFiC6juWCdvroQbXBf5Il+t6aC+2Yy7h/8DVsdgP9q8
         rMQ3WGE7oAlpXik3H9kgH4nFfqUjUxlcXv59n4SMYsQR69BMzn2Zw0uBi7FV2u59tAyD
         qsrM6/nZ0cvH4S5R5QbsmM4yk6Frn8DkWNtOfmFLbZivb52/noyM/zXXK8UIbN34CS5s
         SO5GseO7CM9wulBAGArtIO0RNDYkUQurgpGw4JEbpEqOlaLdtV026pDu1OxKtdtPJxVU
         z7RwPFO31jz6ds0SccfYRE40D/hPQzKb/MTb779xj0fFmjPc3W3ybxx4exBK2mjJ10Mf
         ixeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g2mRUJsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a47f85si1185924885a.472.2024.09.11.19.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g2mRUJsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZm3-0003H7-MA; Wed, 11 Sep 2024 22:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlu-0002cL-2A
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:26 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZls-000497-Ei
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-206b9455460so3733555ad.0
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108883; x=1726713683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40qRQiWPnzwQZNkzfC9uwjfmjEELssT5eDCBB5PE7FA=;
 b=g2mRUJsqbtnhFzdCr/mZbMid5hJ5k5WCgLBqLcKMahAzu72wdSbY5CZ2qwvveW2pwX
 i0xTiSz7ur+Tc0VG4XuC9BBx0LCdu1fY7AmeTFcKzVC8g+ovJ2orRKFxcKpnB+Upjkem
 +Ng1Vr+e1d75ULV8XwTmgy+kbR5bSkxCyZ1iBPbjeHZQ4Ju4Z8A/UyXgTjAMNVV5wgAO
 NBTm2r9Fy0x8CAWlysgcvUwC7OSIA8LHhtiqK5chVZ1QHotSepMkAHpgmUHYXpJArMRN
 M64V3JIX6B8O37EtIh2DsX4/B6Ca9uYz/3DZ5fFAd9HqWQSNz+83EhL/OM5foDo+xubh
 v7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108883; x=1726713683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40qRQiWPnzwQZNkzfC9uwjfmjEELssT5eDCBB5PE7FA=;
 b=HWlAb5nP9g4DfvZRptylxoqR+cyFOjLYtfeTACCyRfyFZ4WbtkkXkDegwdx6HYEe7P
 OVFF2eFV16swjPrEsXnm+kNkPDnlAvCvSDBlaXRrMloELBQ3wUBTrSwRbev8cz58b19m
 H5mnKvvFggjMSyZ//jm1/dLp9vkPZPVxG8zMbyvjk6W/7E5clCIt92tF4Mzuc+y5GiAf
 49YmSL78l+1+cgbf0X5eUWjS+5XGysPO/1wDVH+UDbmQq87fo4rkrrWmj8hVQqnzI61W
 9s3alz3kOoyPIKuVGgBPCJovlwYsi7+WAj4/okjqRB4JB5t+12TmVgy/XQ/0ScSv2qBr
 Sytw==
X-Gm-Message-State: AOJu0YyqXLQoUazp+ZDpPYaNZHeY8SpxArbiNqM9+Zq2Aw2U0/XsBZDc
 WU+Ow9YBLQfj2Xs4MeY5NmVjbUbrMDMxO3MSxD30AKGNubfx+eVo36vrSlU29oQ=
X-Received: by 2002:a17:902:f542:b0:206:9dfb:3e9e with SMTP id
 d9443c01a7336-2074c5eebbdmr88259105ad.10.1726108882950; 
 Wed, 11 Sep 2024 19:41:22 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/29] target/arm: Convert TBL, TBX to decodetree
Date: Wed, 11 Sep 2024 19:40:52 -0700
Message-ID: <20240912024114.1097832-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: nI/J3sC1dyvu

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 47 ++++++++++------------------------
 target/arm/tcg/a64.decode      |  4 +++
 2 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 48188d4116..70173c67c2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4680,6 +4680,20 @@ static bool trans_EXTR(DisasContext *s, arg_extract *a)
     return true;
 }
 
+static bool trans_TBL_TBX(DisasContext *s, arg_TBL_TBX *a)
+{
+    if (fp_access_check(s)) {
+        int len = (a->len + 1) * 16;
+
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rm), tcg_env,
+                           a->q ? 16 : 8, vec_full_reg_size(s),
+                           (len << 6) | (a->tbx << 5) | a->rn,
+                           gen_helper_simd_tblx);
+    }
+    return true;
+}
+
 /*
  * Cryptographic AES, SHA, SHA512
  */
@@ -8938,38 +8952,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-/* TBL/TBX
- *   31  30 29         24 23 22  21 20  16 15  14 13  12  11 10 9    5 4    0
- * +---+---+-------------+-----+---+------+---+-----+----+-----+------+------+
- * | 0 | Q | 0 0 1 1 1 0 | op2 | 0 |  Rm  | 0 | len | op | 0 0 |  Rn  |  Rd  |
- * +---+---+-------------+-----+---+------+---+-----+----+-----+------+------+
- */
-static void disas_simd_tb(DisasContext *s, uint32_t insn)
-{
-    int op2 = extract32(insn, 22, 2);
-    int is_q = extract32(insn, 30, 1);
-    int rm = extract32(insn, 16, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    int is_tbx = extract32(insn, 12, 1);
-    int len = (extract32(insn, 13, 2) + 1) * 16;
-
-    if (op2 != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rm), tcg_env,
-                       is_q ? 16 : 8, vec_full_reg_size(s),
-                       (len << 6) | (is_tbx << 5) | rn,
-                       gen_helper_simd_tblx);
-}
-
 /* ZIP/UZP/TRN
  *   31  30 29         24 23  22  21 20   16 15 14 12 11 10 9    5 4    0
  * +---+---+-------------+------+---+------+---+------------------+------+
@@ -11834,7 +11816,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     /* simd_mod_imm decode is a subset of simd_shift_imm, so must precede it */
     { 0x0f000400, 0x9ff80400, disas_simd_mod_imm },
     { 0x0f000400, 0x9f800400, disas_simd_shift_imm },
-    { 0x0e000000, 0xbf208c00, disas_simd_tb },
     { 0x0e000800, 0xbf208c00, disas_simd_zip_trn },
     { 0x5e200800, 0xdf3e0c00, disas_simd_scalar_two_reg_misc },
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f72f95865f..e2a3ef62ef 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1141,3 +1141,7 @@ FNMSUB          0001 1111 .. 1 ..... 1 ..... ..... .....    @rrrr_hsd
 
 EXT_d           0010 1110 00 0 rm:5 00 imm:3 0 rn:5 rd:5
 EXT_q           0110 1110 00 0 rm:5 0  imm:4 0 rn:5 rd:5
+
+# Advanced SIMD Table Lookup
+
+TBL_TBX         0 q:1 00 1110 000 rm:5 0 len:2 tbx:1 00 rn:5 rd:5
-- 
2.43.0

