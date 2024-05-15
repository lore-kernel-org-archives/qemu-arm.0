Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp708496ejl;
        Wed, 15 May 2024 07:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4HOrgkMxgzy9Ve17GfmPsx8/GpdTOX3fGVAsyJ/wqduIriLzpd/kkjal//rUs8Kv3FQ55v9EUdDeCFFKwICw2T9VE/ZwO
X-Google-Smtp-Source: AGHT+IG9HQ6vz5CHg5q0BNQEAn1KSsFmOFr/Ce5OXOdx4Eaa4v1HfxLcvSUmG46ybNzYuJOoKWwR
X-Received: by 2002:ac8:7d86:0:b0:43a:3fce:32c2 with SMTP id d75a77b69052e-43debf55b93mr296496971cf.3.1715785173601;
        Wed, 15 May 2024 07:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715785173; cv=none;
        d=google.com; s=arc-20160816;
        b=iVbgywDMeDKYegdlBj6sBcQdG8CqJptttmkj0q77K9+U3kS6Tl8l/uKyM9ABvXT0lx
         Jl+X7LAEN1M7B4F+AP/5n+sobf7WiEq5OsfqzvgnWeYLLiCvYZ+zcVOEOSPeI2qgbtD7
         6H44Kzt5xM+HF9PIdxtobYtpBMeZfFSyNG3sDuDN118tFDLPwjf6iYL2CB+VuPu09W7H
         G0QA/g0XZ9kKfQnVt/pl/xFh4MAh6OAjzrMiX1dZxljL12+g71wvdxntNnv9pDDIs2eM
         hLT4ckLBtX65dB4koU6sbW4VFbKu2irC7C8+211sb6qfATD32PxFu4D5L2mplj9hQmTh
         SWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zWr5b7ogG/rKIVgZ3ajQkJPbaaMpVh+KqxIFrCgh+w4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=NVi3Lp7+X0tJaVCWce/xzV18/o2ImTOK0oCETUOh0eZ46AYa3jXq7tarRDq+UbvOrH
         ebV3UKnD52P+DGEUSzjyROf7kn8/TrssglMGxMuflyHbb+m8l0jBWCxFpJ2yWWWlUL9G
         5mL3sMbPEP71SqtPiwkyA98Y7jC2C496RO6hKLCWOhqMD74FCfJSN5/tns87O73jy5l/
         TYwP/PDNpzRQZmkBP3D0TH+AoczONL4h7L24wVYJRORvwfpijAO0BOw4Uz+SRkMHi/T/
         z60S3vfLVuF4IV9SH7LW7HEUAHimv0i/c+45QS3JEuiquL3QOl1UbkY/b+bxnEZk1P2R
         Dx8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x1wtNjVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df54b56d6si142581521cf.203.2024.05.15.07.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 07:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x1wtNjVb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7G6I-0005Hk-0o; Wed, 15 May 2024 10:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G6G-0005HX-KG
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G5x-00077R-Jb
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41fd5dc04f0so44899655e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715785142; x=1716389942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWr5b7ogG/rKIVgZ3ajQkJPbaaMpVh+KqxIFrCgh+w4=;
 b=x1wtNjVbvhSf3e2YDLi0sAwqIHh57VwN5E8bJbAfwJgt8rapDxMKbN52PXT9wSNpVR
 THIcP706bp0kXr0o+UlM1/kIxjH5f17IDZGvcaOC9AWJzjVe6K4BeZbuR8D1dJ8fR1aI
 gbP4uVRO2lWc1b+jzAeOd2y1hjXRv0QX6iuHWFy4TOe0478VEgzsa6baX56gfugFvfqj
 Zp7nc4dyeJqQ0aT6P2EiguzRcsNaKXKoWD5AMGOTnU8emwUQL/iHLJ3AOyguQ1ZVO53L
 z6w7YqxQ1stl4riFIRyWB/KBx+M9UpzDYEOGd1ifTlUalTaDNBffOSY/IwSgaPdhQ5BH
 WYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785142; x=1716389942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWr5b7ogG/rKIVgZ3ajQkJPbaaMpVh+KqxIFrCgh+w4=;
 b=qgpd99WHnjWiWy0KWCTqImnrDYXtPYvehe+QsrI1+Q5mqpupCXHKDxBT6PR0EfexyL
 8DALPoCAWO2E4nBoy7l9HT3BipuSOJDy6uYZwybBhkjuwcc0y1TXMrqnfqEFvRzCgRm7
 0beiS645Do1oZlf6fk0/0gej5rzrZpjHairfIR3tid8oVujDZK5bm+Iz4sFinhZnu4hF
 kcyemOk9A1PjXFDGRgAUggtDzBTFKEc1SBaLyWMzUI5bg3/4VseSJnDtUz1E21FBPXr6
 umF5ZtNzKJ7IjxxltrS4AZ2ooINcmpeYoE/caKsJR6uHKdq8RWdCvwlE6QcOswGU0BEN
 c9+Q==
X-Gm-Message-State: AOJu0YxQtz+567wI4yt61LVGz8d9aOF3MGxP/ens65caWsGtPjoHBfBf
 0+CAQNQY9KIsyg3FbKXsTw+tRAUqvwcn09h/0st3HjLAehC2Dm+vQTutSKlWmsbfQ6UFRUIcLxa
 DoJw=
X-Received: by 2002:a05:600c:4f0c:b0:420:1f0f:fe19 with SMTP id
 5b1f17b1804b1-4201f0fff56mr61846545e9.13.1715785142301; 
 Wed, 15 May 2024 07:59:02 -0700 (PDT)
Received: from stoup.. ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88111033sm272134645e9.34.2024.05.15.07.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:59:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/5] tcg: Introduce TCG_TARGET_HAS_tst_vec
Date: Wed, 15 May 2024 16:58:56 +0200
Message-Id: <20240515145900.252870-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515145900.252870-1-richard.henderson@linaro.org>
References: <20240515145900.252870-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: OesqccBHFsJp

Prelude to supporting TCG_COND_TST* in vector comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 1 +
 tcg/aarch64/tcg-target.h     | 1 +
 tcg/arm/tcg-target.h         | 1 +
 tcg/i386/tcg-target.h        | 1 +
 tcg/loongarch64/tcg-target.h | 1 +
 tcg/ppc/tcg-target.h         | 1 +
 tcg/s390x/tcg-target.h       | 1 +
 7 files changed, 7 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2a1c080bab..21d5884741 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -155,6 +155,7 @@ typedef uint64_t TCGRegSet;
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
+#define TCG_TARGET_HAS_tst_vec          0
 #else
 #define TCG_TARGET_MAYBE_vec            1
 #endif
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 85d5746e47..138bafb9da 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -167,6 +167,7 @@ typedef enum {
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
+#define TCG_TARGET_HAS_tst_vec          0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index a43875cb09..434a892e07 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -150,6 +150,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
+#define TCG_TARGET_HAS_tst_vec          0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index a10d4e1fce..2f67a97e05 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -224,6 +224,7 @@ typedef enum {
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       have_avx512vl
 #define TCG_TARGET_HAS_cmpsel_vec       -1
+#define TCG_TARGET_HAS_tst_vec          0
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) \
     (((ofs) == 0 && ((len) == 8 || (len) == 16)) || \
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index fede627bf7..29e4860d20 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -194,6 +194,7 @@ typedef enum {
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
+#define TCG_TARGET_HAS_tst_vec          0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 04a7aba4d3..e154fb14df 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -173,6 +173,7 @@ typedef enum {
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
+#define TCG_TARGET_HAS_tst_vec          0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index ae448c3a3a..62ce9d792a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -163,6 +163,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     1
 #define TCG_TARGET_HAS_cmpsel_vec     0
+#define TCG_TARGET_HAS_tst_vec        0
 
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
-- 
2.34.1

