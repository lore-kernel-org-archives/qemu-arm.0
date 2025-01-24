Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp931498njk;
        Fri, 24 Jan 2025 08:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdQeciLD740TgaIwu/cY/ysDj0CEKL1fGqg0ybCDaG4ChnY0o4W7uP+puDCobX1gVTYgbkbHKkQmXs7A==@linaro.org
X-Google-Smtp-Source: AGHT+IE9TqWnLWFO+zcQz1StCTp8dDB1EtqFQt5rG3JS+nR9ukmC9UxgtlVmeBTk04QTlLKyFEyC
X-Received: by 2002:a05:620a:288c:b0:7b6:ebc6:181a with SMTP id af79cd13be357-7be6324cfb8mr4855816385a.41.1737736616893;
        Fri, 24 Jan 2025 08:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736616; cv=none;
        d=google.com; s=arc-20240605;
        b=Ya4rcRkFJLqMDHka1H4rfRxmOQnn/icDhoacMtJrwT3BGnvaRV6/CCFcG73jUBw3kh
         pYISBtd7aI6UDyB5k0khotptuyjC5jhvKL7eWLfkBZsOGQjjmudsYOrOrEgOQYRqmzr4
         +okid9QvyUHBhOLyIHG7AJCpTnBvd4PpiZe7VoDkRyAy/CYxMsxvPY5FrfCUcuyra5Fk
         iblqo2x64Kt1p3JSTSczkUNhA+Cs/7ZWAQ+5MPpMhHBR63s+oRb0nUZ1dInGfItgnQYP
         8wKUOQ+rOTVvTntamg7ftCpg4w9jEum2gu0kyU+A76rN6w/XZ278bXtVLieiSSPirE1k
         oZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8AGs31o3QVkBdFVRa9k1zWhHeCcvoSGGZNisnAwsyfU=;
        fh=myVcqgMLdSvBUziRHlEpwqzNkRAw2j9y/U6JPLsYOXc=;
        b=OYTtY5r8imHcNO6VaRjZDRai5DvHhibr5C4M92De0Jf8Lk8lB+ZPiPYXDbOPOk7PF7
         eDPbNcvfai/GsB/PQMScMJxoBl2vkEjOA7v9YddVAQDPB0AAubQQKv36mOOwot0jOy66
         c9tzj5PjafzsLG0jzMbtJs7YnWLwB5/w6tG7pMRl1TC/rmSs+qP3ypwb8IEuUemPHDqa
         w10QsPnUL88osPN4Kn60jc0/4rh+bp+mHQb+Ju/FciKJki+BZoiGWiN3ckaZzexLUX8k
         oJuKYdbUXZUO1gpYh6vdFUcJ8zlUNlKcEL0eRw+a+6MlSlQw2EvhNwv69wVc74mwBloE
         CDog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z1OSb0dp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af12913si250989285a.549.2025.01.24.08.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z1OSb0dp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMe6-00026r-RY; Fri, 24 Jan 2025 11:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-0006B9-Mc
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZY-0005pO-IB
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:30:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436202dd730so16573815e9.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736202; x=1738341002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8AGs31o3QVkBdFVRa9k1zWhHeCcvoSGGZNisnAwsyfU=;
 b=z1OSb0dple0v4WE5ZeuN071rjzwF5/aXCec82pyAzyH5A5WNDdXfyl264E664u8FkE
 L52Dh88kHERzZMBFTAExDpbcaD+U/MGRdW+0AU9TN0z70Ms1G3cSkXcf3EIMoDg+kxBr
 O9QVBGW/3rMKCvr4kSZxrG28dNY0s0sadXcKPiAfjlMogU28+Cq1OC0L5lEZI3BqSDNW
 09bir7mr6q5Q4B8Xlx5XXzDwkOUHyHteu7NsBCbFzZjzSn9qiP9hgTmFd0Fst9NWd/tS
 wsjR1zExgccGsV0qGL6A5BNnqZY1anBJ8x+91y4Cn/YfZsDp8cxbWSDP9Y6SweYoXWVs
 FXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736202; x=1738341002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AGs31o3QVkBdFVRa9k1zWhHeCcvoSGGZNisnAwsyfU=;
 b=CkQYNXMee5kSp7BwKM30pkHEHhAOh0OPL91TnV9lPTiS9jmtCDlBOywPfdwrOCjzLU
 By+aioS3PrU+MLpnnBLZun2maiiIw2a2/z0/ikVyStfguDAovewoICyQuITXzNmQIn0m
 VQ5+T1GyC9ZSGM5LO95MitqGWfSES5zk5nJl4vCKLOcWUE7PP+dOMOo/iqgmR7qU4esp
 nEbXKl+B9wwTBZEC/tZsyRWXzwxAlT841Lvvh4uunHlPCAU+OnMCj4C3oE1p8AO49gkb
 zdLVkSeN0ZtxJ9+3LClFl7+93sOI9nVg8z8zO7ESqpCUoILdCfxPmhlmJhiLhPAFFNo+
 9Icw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+NyI99Tumj78idXfx9oNC92JQrVyfAkXJ77Wilz0j9nYVswVYR/JrQ8rXbphVHFH4KUgm7bcRHNqy@nongnu.org
X-Gm-Message-State: AOJu0Yxfvj+eWs7GMJuQ8Ddb5KlxximL/Nx5FqQAiAkEvU4vcPCUxjl3
 vYHDA9ctInL85dopkTKhz/k1bih8fBg5X25qwz/m2v0NLntzAo6Z4gn36ZXCDC0=
X-Gm-Gg: ASbGnctO8TpGF0BZ8SSARsr7ESujVxRGp8qG3XRgu3LULPGzkDqzIhvX7KUFbvDtGcq
 QUU8qu92qIkLAq3nSl3dqfoktGee++U5mxQYCeTAQtGhFKbZ3oCO6OoBNuimUZNLX9yUwgvxN5V
 lbBKlIOzZWjk0HQz6LKYiyFC82qpo9U8A1AhmFSx4/gcJnfmpCSwEwzXg//33GovVGG4lA9qDpp
 LEoyGjgh6UcywIYpFJp5HjN9t4Au3pu98ISs+eNRJzA94xeEeHKj8Cs78WSYb8hmPDK/2l7H+Zp
 N/z2NvNqnOI=
X-Received: by 2002:a05:600c:3484:b0:434:f8e5:1bb with SMTP id
 5b1f17b1804b1-438913e48fdmr301349545e9.12.1737736201795; 
 Fri, 24 Jan 2025 08:30:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 66/76] target/arm: Handle FPCR.AH in SVE FTSSEL
Date: Fri, 24 Jan 2025 16:28:26 +0000
Message-Id: <20250124162836.2332150-67-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GHRR4NsjRLD3

The negation step in the SVE FTSSEL insn mustn't negate a NaN when
FPCR.AH is set.  Pass FPCR.AH to the helper via the SIMD data field
and use that to determine whether to do the negation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sve_helper.c    | 18 +++++++++++++++---
 target/arm/tcg/translate-sve.c |  4 ++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 90bcf680fa4..a39a3ed0cf9 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -2555,6 +2555,7 @@ void HELPER(sve_fexpa_d)(void *vd, void *vn, uint32_t desc)
 void HELPER(sve_ftssel_h)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint16_t *d = vd, *n = vn, *m = vm;
     for (i = 0; i < opr_sz; i += 1) {
         uint16_t nn = n[i];
@@ -2562,13 +2563,17 @@ void HELPER(sve_ftssel_h)(void *vd, void *vn, void *vm, uint32_t desc)
         if (mm & 1) {
             nn = float16_one;
         }
-        d[i] = nn ^ (mm & 2) << 14;
+        if ((mm & 2) && !(fpcr_ah && float16_is_any_nan(nn))) {
+            nn ^= (1 << 15);
+        }
+        d[i] = nn;
     }
 }
 
 void HELPER(sve_ftssel_s)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint32_t *d = vd, *n = vn, *m = vm;
     for (i = 0; i < opr_sz; i += 1) {
         uint32_t nn = n[i];
@@ -2576,13 +2581,17 @@ void HELPER(sve_ftssel_s)(void *vd, void *vn, void *vm, uint32_t desc)
         if (mm & 1) {
             nn = float32_one;
         }
-        d[i] = nn ^ (mm & 2) << 30;
+        if ((mm & 2) && !(fpcr_ah && float32_is_any_nan(nn))) {
+            nn ^= (1U << 31);
+        }
+        d[i] = nn;
     }
 }
 
 void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT, 1);
     uint64_t *d = vd, *n = vn, *m = vm;
     for (i = 0; i < opr_sz; i += 1) {
         uint64_t nn = n[i];
@@ -2590,7 +2599,10 @@ void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
         if (mm & 1) {
             nn = float64_one;
         }
-        d[i] = nn ^ (mm & 2) << 62;
+        if ((mm & 2) && !(fpcr_ah && float64_is_any_nan(nn))) {
+            nn ^= (1ULL << 63);
+        }
+        d[i] = nn;
     }
 }
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 663634e3a39..2d70b0faad2 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -1238,14 +1238,14 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
     gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
 };
 TRANS_FEAT_NONSTREAMING(FEXPA, aa64_sve, gen_gvec_ool_zz,
-                        fexpa_fns[a->esz], a->rd, a->rn, 0)
+                        fexpa_fns[a->esz], a->rd, a->rn, s->fpcr_ah)
 
 static gen_helper_gvec_3 * const ftssel_fns[4] = {
     NULL,                    gen_helper_sve_ftssel_h,
     gen_helper_sve_ftssel_s, gen_helper_sve_ftssel_d,
 };
 TRANS_FEAT_NONSTREAMING(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz,
-                        ftssel_fns[a->esz], a, 0)
+                        ftssel_fns[a->esz], a, s->fpcr_ah)
 
 /*
  *** SVE Predicate Logical Operations Group
-- 
2.34.1

