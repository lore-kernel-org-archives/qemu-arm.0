Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1144349njb;
        Sat, 1 Feb 2025 08:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX95mDZL+tHIORoWTXbbv1AAtX4JfXE7Cr9onRKlhYFwgaHb4IVVB1PfLhPBOsH9T9M4O4Y4yB4pLRBBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHnP3jWgoEDLkw7GcAnujhjfS76D6W2A0Yddck5yqE0YRJe968iYcnXZOFnNL3ux3wFcJz5
X-Received: by 2002:a05:620a:198a:b0:7b6:67e1:b4ff with SMTP id af79cd13be357-7c0097c1c9fmr1711853985a.28.1738428359658;
        Sat, 01 Feb 2025 08:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428359; cv=none;
        d=google.com; s=arc-20240605;
        b=gj0ArTg9jTIu89O5nPQ2ZaQe6sYIJ8Y3sC9J500KVnA3QQ7NiHNRMAMKFl0im+aNzE
         7AVn9S0C0/9p5Acodf/I7bOIihXV5imtBWP2P2oPLhWKzQgzSOXkuiiVGcTq66H4BESx
         LYR46yG/awDOqRciuqEFwx6Fznbs3uKRmxQ5ggvMHgL3DpLuD6J02yQ9EdfynbUvJ0ZL
         VfcNu9YDA96B4op/tUmCfLgWz8VVUTjgiWSqQz1GJlUPwxs2dZmH1sLKGuuaG9d3bt7H
         QHGYm1UpAijozv9AAFxi8hihFzVFjN62IPJvqevlHjZsP2VVtx+GHkW1UhugYZvvQwsX
         A+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hR3/G2BdnpgL0DkgE9KDbKtJdTUbStqQyabHgGIFImE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=T8Z6Pdf4MySoPFxYWw4IviheaB+nel4qd2HGCpfHpecXRxFnDkAsW7gZsAifrb+/gg
         9eevOrmEbSkKsj3K12Ve7Nwvbi+ywmzX3ctxwuLUQKVaqAqk6Inoj+NxzHXy31iEF7LE
         enqkRqPE3+iapxOB6PtB/Eq4+nnkSxCaHWzh8qpX27ZLwsSJQdik6JhGxb38DNCmCSvt
         nsDwQAmVNPvWvD/kgmFhBOJFy9Bjf7gb74yzqMpQWAZ8nIyyzxcEYuwIauEVGiXhmDgb
         x5Mg22OwExDKP9bVI4OXZIgZqXj1Vr3yasJV6r6rOLdgZ2p/+2Nhupy0alNHW0c4WwGl
         TSMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PtLUquyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8bf264si230738485a.101.2025.02.01.08.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PtLUquyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGXt-00063Q-3d; Sat, 01 Feb 2025 11:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXi-0005zW-AW
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXg-00013Q-Mf
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so1612568f8f.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428023; x=1739032823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hR3/G2BdnpgL0DkgE9KDbKtJdTUbStqQyabHgGIFImE=;
 b=PtLUquyS8c7gxRIVFMhzqoxndWkdZrgMXHDa4NWeiAtk4COmbO3eUHhxKyl/F5SMXR
 LfjT1HshlIvQClvbivqaaqrDNAqr7W+Ea2zG4D4cIUdb1aZRtsPo0f+U7//akItVBIY0
 5GZuJ7/hfw4UDD+HfV8Uqm37QYiO+ODdSskJfhmp2jmeICu6OJMFG+BTP2+1Bh6HXcp/
 sc6LhzYjuy0ybYDi/L4DabT/6/gYmwgCTDYNEpwIY9e0hpKJt39jcf3wveCADCJc/i8/
 DyaKB1UeI9h+ZkGF+l7Zfa98ode0Pn3EyroI/9/8aqadKA5QzuPaGj8pb7KVlw/vPI88
 JA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428023; x=1739032823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hR3/G2BdnpgL0DkgE9KDbKtJdTUbStqQyabHgGIFImE=;
 b=iV0fZUoW7d8PswDbUMoQ8i4CXII4qCQif0xyN8AFizCu7LE1XIIfwSaLeCVLe8tZ0i
 HQ42TKa4Udekf0MogHgByNtDdqI/2+Wk3mIcDKRxZMktAma1k7b/1WSSjaADDkN3m0KH
 H6C+q+7UgrN8Oww7FHJYIquZx0ROECFxDkAjK5auGj2cmUM/lb4FkkzPisG30UOPdntR
 zLaE508rf2y+2JhErwyeG3mfDbH9gN63Nht5FHQmT+KDna4o90AOwbXflYt5+as4jJiL
 n3f64vI+tXhP1NZlX7rUGPV4cRz4xLdpKInqY/ZmdKWhgx+VjqRntLTg4DJapxDHjvGu
 XB1w==
X-Gm-Message-State: AOJu0YxL/KMs3Kfee0LZVLPqkwxn4swWSmMHZLU5cOX+nxlKCOP+s3U6
 VWqSEv+QIc1Uf5EH5beD2Ttd0TIX/2MmP8DMfLpAdxqssUBSjBY1rvh2M7MOvUzV/h6pAHhekcb
 5
X-Gm-Gg: ASbGnctntfYAqPJrSYr9mKKRbh1gIPcNgSd4E18EfqMpFFq1hEXcgjj0t9LNcL35rso
 ZcrDRmaT/uH1viwAuQTOM3+JfYIWM5/2jKM7Wy5v2l+8naDzelxqxy9ZPGxxLpiCh+Ptf5IUW3q
 gceX7XQ9O2J0mtVV4WbcvLesSR+Y1qqascBE5t1XrPYPk3lojc9HDehV1efHQB/zYKIqslM/ceY
 xRndcAUIbCEjlnbuBDwkjvr+E2SmhntfDQLy1P72ZvGqjiPXNbRpnXg55QofZ5Vm5T1s+BwTtXk
 OVKSM/fdTlfY+0CbgUb4
X-Received: by 2002:a05:6000:1788:b0:386:459f:67e0 with SMTP id
 ffacd0b85a97d-38c5194d438mr15108783f8f.21.1738428023064; 
 Sat, 01 Feb 2025 08:40:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/69] target/arm: Define FPCR AH, FIZ, NEP bits
Date: Sat,  1 Feb 2025 16:39:09 +0000
Message-Id: <20250201164012.1660228-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: b5A3JQ8dHLE5

The Armv8.7 FEAT_AFP feature defines three new control bits in
the FPCR:
 * FPCR.AH: "alternate floating point mode"; this changes floating
   point behaviour in a variety of ways, including:
    - the sign of a default NaN is 1, not 0
    - if FPCR.FZ is also 1, denormals detected after rounding
      with an unbounded exponent has been applied are flushed to zero
    - FPCR.FZ does not cause denormalized inputs to be flushed to zero
    - miscellaneous other corner-case behaviour changes
 * FPCR.FIZ: flush denormalized numbers to zero on input for
   most instructions
 * FPCR.NEP: makes scalar SIMD operations merge the result with
   higher vector elements in one of the source registers, instead
   of zeroing the higher elements of the destination

This commit defines the new bits in the FPCR, and allows them to be
read or written when FEAT_AFP is implemented.  Actual behaviour
changes will be implemented in subsequent commits.

Note that these are the first FPCR bits which don't appear in the
AArch32 FPSCR view of the register, and which share bit positions
with FPSR bits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.h          |  3 +++
 target/arm/vfp_helper.c   | 11 ++++++++---
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 30302d6c5b4..7bf24c506b3 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -802,6 +802,11 @@ static inline bool isar_feature_aa64_hcx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HCX) != 0;
 }
 
+static inline bool isar_feature_aa64_afp(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, AFP) != 0;
+}
+
 static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2213c277348..7ba227ac4c5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1713,6 +1713,9 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
  */
 
 /* FPCR bits */
+#define FPCR_FIZ    (1 << 0)    /* Flush Inputs to Zero (FEAT_AFP) */
+#define FPCR_AH     (1 << 1)    /* Alternate Handling (FEAT_AFP) */
+#define FPCR_NEP    (1 << 2)    /* SIMD scalar ops preserve elts (FEAT_AFP) */
 #define FPCR_IOE    (1 << 8)    /* Invalid Operation exception trap enable */
 #define FPCR_DZE    (1 << 9)    /* Divide by Zero exception trap enable */
 #define FPCR_OFE    (1 << 10)   /* Overflow exception trap enable */
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 3c8f3e65887..8c79ab4fc8a 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -242,6 +242,9 @@ static void vfp_set_fpcr_masked(CPUARMState *env, uint32_t val, uint32_t mask)
     if (!cpu_isar_feature(any_fp16, cpu)) {
         val &= ~FPCR_FZ16;
     }
+    if (!cpu_isar_feature(aa64_afp, cpu)) {
+        val &= ~(FPCR_FIZ | FPCR_AH | FPCR_NEP);
+    }
 
     if (!cpu_isar_feature(aa64_ebf16, cpu)) {
         val &= ~FPCR_EBF;
@@ -271,12 +274,14 @@ static void vfp_set_fpcr_masked(CPUARMState *env, uint32_t val, uint32_t mask)
      * We don't implement trapped exception handling, so the
      * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
      *
-     * The FPCR bits we keep in vfp.fpcr are AHP, DN, FZ, RMode, EBF
-     * and FZ16. Len, Stride and LTPSIZE we just handled. Store those bits
+     * The FPCR bits we keep in vfp.fpcr are AHP, DN, FZ, RMode, EBF, FZ16,
+     * FIZ, AH, and NEP.
+     * Len, Stride and LTPSIZE we just handled. Store those bits
      * there, and zero any of the other FPCR bits and the RES0 and RAZ/WI
      * bits.
      */
-    val &= FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK | FPCR_FZ16 | FPCR_EBF;
+    val &= FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK | FPCR_FZ16 |
+        FPCR_EBF | FPCR_FIZ | FPCR_AH | FPCR_NEP;
     env->vfp.fpcr &= ~mask;
     env->vfp.fpcr |= val;
 }
-- 
2.34.1

