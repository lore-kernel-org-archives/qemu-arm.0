Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp127004eji;
        Tue, 6 Feb 2024 18:53:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDvIaGuGni3/jH5KDokaod2lwjgFzz0OlIq/2Ly14mMx8H9rj5V+4GmwnEZd5S7YoEopv+
X-Received: by 2002:a05:622a:308:b0:42c:3a04:58ca with SMTP id q8-20020a05622a030800b0042c3a0458camr4295778qtw.11.1707274437819;
        Tue, 06 Feb 2024 18:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707274437; cv=none;
        d=google.com; s=arc-20160816;
        b=Nuzz/n+iVFUBAJLAbj9eL5xj6qUtXsS2nG3dqWUspOBx6POAvF4dM88BivTin7Cj/e
         8crgE9bZWCotjdj+pB0vJPs8pgNPpRfvRfp6xw2Ef4IjJIQfTQ+CvY9qdc2mvaT/P320
         90KAyBM8s0LuhNL0W1CqsXDHaHF7u7fAjEjHN1ow0UHgqvWNU3Alq8PgGyukyMzuOgX0
         +ZcvQnJtXKtzr4NmV9bmLN5WjURV1rDiUeLmr4z/aFLsbSlemSXh47Gsn4hyartmbhM8
         wN0crwLvAGthRzqkiBsGi8nZSssCJ+vTmYGqXlr9/hMdkbdm4uWXIMgtRfirbWfygbY/
         wb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TlKFEqZAqQ3pAY5dLOI6DMwcM/4p9lbYDIei9Bg0M3Q=;
        fh=RSKpHTLkabv75HwU26RdWpX+kVsD9iiS0OHnCMChNNA=;
        b=vd+t7EmOzOs+/ncvacpxOSx7/R6aY4jOp+ANOM1aKoTn4bfqT0lStnyf+kYEfSUtoQ
         sKf6nzxAG0k//cA4nkv2o7Hyhdku5pmypWpkmN9W0tqzr9lZQxRYsQ7/edeP1Q9ji/LS
         jO+V9iDomyDMG9KQqUQy/yvb/XgcZ0zmnEfeNPyETXB2UsJXHupuxeL3EWdsAm3sfZKm
         ty8eNo54umDM+xckWMnxp9pDSBz+ArFIzMFWC57H+ZBZlxIkIg9k7YaJcPri8k2iJ24K
         xT5R17OBJewr/zQwkKCIBwaEMm7Vo/7+ntJ6OT/2iVR6U9yQGc9qlSkNKwRh9aIU13Et
         9tFg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OEIty088;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUxMXj4b1ZauP74e0jEw+sAYmuweGRTzZYwF2I81fhz/hAUy67gUSviKUY3VvLhHPuqYdPUPLE6tOn6F418HRlGktNl/0TX
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05620a084d00b007858fccf35esi290198qku.125.2024.02.06.18.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OEIty088;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXY37-0003Fb-NV; Tue, 06 Feb 2024 21:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY35-0003Eg-RI
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:31 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY34-0000fq-CO
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d958e0d73dso1470525ad.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707274349; x=1707879149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlKFEqZAqQ3pAY5dLOI6DMwcM/4p9lbYDIei9Bg0M3Q=;
 b=OEIty088a7D36IEO+R5MgPgwJIIQ3+uCYUbjTCxIecylIh92NxRpSqSKSpjmZJN5io
 kEhpBdm/XetUZaR/WiL9tBLQnp7+FCcuwrVQRt/ZXa7oF0vdd9O1CV85/r3NfABFhYql
 HNpfnDWmSI6sd7scS5asTGUEcVOi1z089WE/Eyvpl5qdpc7ngR0dLaaGzTrCmvT3I4Wo
 7Ev2RBZQwE43SX44rqhqEOL+IpB9aYvNFDPqv3K6Ldc2v7+YHe3P7yPRjC+Mt2jiRKNu
 QXDSd+t6UNJIGsR8sB2qZ1h0z7RPTlSgBQf+X/zI8IZvTI/TR9Xk7Ejr+4RnBDluER2b
 yRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707274349; x=1707879149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlKFEqZAqQ3pAY5dLOI6DMwcM/4p9lbYDIei9Bg0M3Q=;
 b=Sfs5Uoz9MtgjN35iQNEz8vxdE2zWMNRSn9UCU3kD91+GWMwluqqqCCjmPeQA7Lnenc
 j58+mtP2yASufqandlvnkmV3kAOCAFJnw0Q2fhw00+UMdFRCnHPIo4V0kMpDhuL3tK70
 HcY7PyPGUOFHbnAUPFujmSe82xoqLgpTbajaSJ4iA6oJ3kD7feT+l3lAeXHd5pyXWwOD
 MOaOD6Bx/XGSwv5C7mC4io+akH3xOU2nEt92v8ERQrFCNqr+p0HM0IBuiGAydCgqel1n
 RNfSwkx9pycKDwY1kPzsxdqd19z7o6YdvKXgoUwTGsuxvJFaQo72wyaSyoXficjoHq8X
 OpJg==
X-Gm-Message-State: AOJu0YxYO0osulw6PXQIUSHuzxtfXX/SmjUaMh85nU++x3jbTmZ25sGw
 am5F7ejnoXTme3YUvzj+n4fh96gxUhDWMiGSLCkum5nspX0YWwL9qL1ioK9JFiA=
X-Received: by 2002:a17:902:e802:b0:1d9:3edf:1e2 with SMTP id
 u2-20020a170902e80200b001d93edf01e2mr5648247plg.3.1707274349017; 
 Tue, 06 Feb 2024 18:52:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV/9fEBvxZ179Rf5XzajD3RWE0SQCCajNCrcLVa3rq5LTAoZgPOW38YKYCJyhuvDjR7UBZu1RuofMr40qUAJ1NAwK0MDYdCrAFv9Y8/sanyn7tVQt0n01YzpFK4LVKMlVxmw0NbBb/IE//GrUaTxbZNDiVIHPFYrhVhTTY=
Received: from stoup.. (60-242-98-186.static.tpgi.com.au. [60.242.98.186])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d8ef97de4asm255435plb.38.2024.02.06.18.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:52:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 3/6] target/arm: Adjust and validate mtedesc sizem1
Date: Wed,  7 Feb 2024 12:52:07 +1000
Message-Id: <20240207025210.8837-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207025210.8837-1-richard.henderson@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8jxABzRpgj9B

When we added SVE_MTEDESC_SHIFT, we effectively limited the
maximum size of MTEDESC.  Adjust SIZEM1 to consume the remaining
bits (32 - 10 - 5 - 12 == 5).  Assert that the data to be stored
fits within the field (expecting 8 * 4 - 1 == 31, exact fit).

Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h         | 2 +-
 target/arm/tcg/translate-sve.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fc337fe40e..50bff44549 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1278,7 +1278,7 @@ FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, ALIGN, 9, 3)
-FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
+FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - SVE_MTEDESC_SHIFT - 12)  /* size - 1 */
 
 bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 7108938251..a88e523cba 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4443,17 +4443,18 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
+    uint32_t sizem1;
     int desc = 0;
 
     assert(mte_n >= 1 && mte_n <= 4);
+    sizem1 = (mte_n << dtype_msz(dtype)) - 1;
+    assert(sizem1 <= R_MTEDESC_SIZEM1_MASK >> R_MTEDESC_SIZEM1_SHIFT);
     if (s->mte_active[0]) {
-        int msz = dtype_msz(dtype);
-
         desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (mte_n << msz) - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, sizem1);
         desc <<= SVE_MTEDESC_SHIFT;
     } else {
         addr = clean_data_tbi(s, addr);
-- 
2.34.1

