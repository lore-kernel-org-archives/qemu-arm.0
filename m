Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801517njk;
        Mon, 2 Dec 2024 05:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8a5KSBXdo+o69/s65Iu/cTkSCdgOnIYk+omUBcF7030t2SPUHKz6NaLgGo8rm37sbB/6NXqxZEGc6/w==@linaro.org
X-Received: by 2002:a05:600c:4f09:b0:434:a802:43d with SMTP id 5b1f17b1804b1-434a9df0376mr196914825e9.27.1733145231601;
        Mon, 02 Dec 2024 05:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145231; cv=none;
        d=google.com; s=arc-20240605;
        b=copBvU8PAJi59BfTYgS3io3jBDtCqJ60lCDnR3QT5Dk7ISBTNiGQTF45/Pz76ZtFeX
         96WpWpfOrpdpRC3ZnewBUn/LO1+HpqkJ/2l5KSygtuBWBpW5d/5LExLBRwIE6O0ReDt4
         rHK6Pn7OONNSSL005B1nCdd5dl1cBhXYaeU5qyXi+P9FcrxyZTt5QdXhJr8KKu2ISk7q
         Zr38EKX85HpaE6EnND640ZiMdMbbJHG39K4pi/n1Tqu1QjjrEdt7kRSpYYVAy8XjwRVf
         pRJJ+/UK24rBoSiPO++X5H76KKMTGbACDzj8fCOF7WYmV8XyRvJENLNmrEMmHee5aGMi
         BL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=URx6rpKRY5AUX4gzx0lKGV+i3UM8kCWTj0TBxOydcdc=;
        fh=QaBvl9MDjV1jz5cAK8ShQp0G/7AgNgwJpRG22pSAHMw=;
        b=N8IgjuNPUK0R4mtSUKhF1i+KfBm9cJsThHbBIHvt/oEhgkbkiMLbB93mKv5kmDda/T
         UkyBix7yTrX+tsIPhjRb7qrsY2uiXlznqnMA9iDyMU3RCo2+WN7cpJ3ZcMu2/pOu9ShH
         xGR8AmGhKudK1wQExLkGWt7PaR8L23JI/DuQU+RyJBq2hFmrcAxw01mXpq2MbsNVT7iJ
         2LtzBYAoXys6F6S+27rSiuzhmJfzZFzdxDgbv+/ZQ6h25qKztS1s0rbyfXNKLX9RU7ve
         r6toN/HpfIxggm5mMLCFfhO0RBtPB9y5eif0TZCMaHnL3UN7rZpiMTxwe0DXOk3cpLwL
         XE0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Abrh+wDx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b0fc84d5sor35144125e9.0.2024.12.02.05.13.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Abrh+wDx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145231; x=1733750031; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URx6rpKRY5AUX4gzx0lKGV+i3UM8kCWTj0TBxOydcdc=;
        b=Abrh+wDx1RPpd2wy27fiZYfm4YdU66/d7cxfuQdEtfbFctnUS+zKOVxSniQrNwvnZ4
         sE545Uxup4r5ZGFxrhRRhkpX2wVu5k8OPhLA85m9V65Ka83KhKZmSzFBm/BTDXVqfxg+
         6ay5obeVMnEQSNtnOfzWJEXJkegV9VeE3wocPJxuvRukyor1xHFhQTPKZkOMNVhVPVky
         E2+5YOFBvZU1OBDkszSvo1b4VSiLS1tljGN/PoyWPFTrQWmJKgAGIqJRZ5LViYwIJ03Z
         QTnT30H9dokCezDec0EoPLWL1JqOIqI1DTSwLib3s//gzKwwVnDMr5J/V/Y+ILVMZF9d
         wQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145231; x=1733750031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URx6rpKRY5AUX4gzx0lKGV+i3UM8kCWTj0TBxOydcdc=;
        b=YrfofzJsNdXi3n1XBa36PfsCQs85EiWBCH8dH0emjwn2vxBpF9xnDdfZQLWNMiHu6u
         81F3+L8S2vzxqKf+Dcq06nxDyukoQHAifmoDWXEoiuaO2aaBCph3IxYVz/BPyWHI/T2z
         FmRKmwDX454tEzPDN9wFD+njPiyjmXyuA9YhqYHncZ1aBxf6keqHHqcLN1xiTGg75WWA
         jXq1jCPUMGdbApGIIVqk140iBtuefkkc6Ijx385Nr6CKB+PdU5XSRyH0rDDHvw2ODPC0
         Wzn3D+GqolJh2EPdekJ2MNKKVrjFBTDpQyVILDbDmAGaMuIUUFMRFFCpw/ypNIBbZKWf
         cfAw==
X-Forwarded-Encrypted: i=1; AJvYcCV0L+eHXaZ++Tdc7Zf+WcV6idnNyu0x8RQExbJeCE1dh2H4Cql0qiWhhO5SjhJ/b46ZznvJ8ZxqRF5OnA==@linaro.org
X-Gm-Message-State: AOJu0YyKKFuXm6E1RXnYPKQHajLnibBPSNvmSQknqOfUiMeoepT7UGJH
	UAsG1+TsKHSukPwSv2pXXt4fa00FbyY39i1ljoEgbIKZ/+6cJC39BHhOP4LKKw5rqQ==
X-Gm-Gg: ASbGncuKT31DO8hbuZ+jgsNmLKHA5qbUqG8p9lQjnEMF5AYb8Kx5d/PGaJowsG2PFLe
	q5v2/PTOpebcmf1SZxXi0lKuHf22+hAr9pn2EarQ/bhmVfiR2y9wby23BMlF0BVTM2Xd74BG8e5
	6YAPzfGf7kZlfb4Hvm7a/PFxO6UOvPltINNCCrbU8mI0tbj2hOULwgXsZX/++snVq7StakoX3PV
	RaRUb0x18fWZVU2V6WtW5dpeai+UKARsPFcAmIoPwjmI0Y8tR5VwhE=
X-Google-Smtp-Source: AGHT+IGTnHUdbOMrbpzVCxLquKG7nOzVVR+6pJz3DvC2xGSbU9WIxVPWyJnqr0N/OahjZZ5fVRRMkg==
X-Received: by 2002:a5d:64ae:0:b0:385:f220:f779 with SMTP id ffacd0b85a97d-385f220fb3cmr3997762f8f.49.1733145230928;
        Mon, 02 Dec 2024 05:13:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 01/54] fpu: handle raising Invalid for infzero in pick_nan_muladd
Date: Mon,  2 Dec 2024 13:12:54 +0000
Message-Id: <20241202131347.498124-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ee4YgR0amTUG

For IEEE fused multiply-add, the (0 * inf) + NaN case should raise
Invalid for the multiplication of 0 by infinity.  Currently we handle
this in the per-architecture ifdef ladder in pickNaNMulAdd().
However, since this isn't really architecture specific we can hoist
it up to the generic code.

For the cases where the infzero test in pickNaNMulAdd was
returning 2, we can delete the check entirely and allow the
code to fall into the normal pick-a-NaN handling, because this
will return 2 anyway (input 'c' being the only NaN in this case).
For the cases where infzero was returning 3 to indicate "return
the default NaN", we must retain that "return 3".

For Arm, this looks like it might be a behaviour change because we
used to set float_flag_invalid | float_flag_invalid_imz only if C is
a quiet NaN.  However, it is not, because Arm target code never looks
at float_flag_invalid_imz, and for the (0 * inf) + SNaN case we
already raised float_flag_invalid via the "abc_mask &
float_cmask_snan" check in pick_nan_muladd.

For any target architecture using the "default implementation" at the
bottom of the ifdef, this is a behaviour change but will be fixing a
bug (where we failed to raise the Invalid exception for (0 * inf +
QNaN).  The architectures using the default case are:
 * hppa
 * i386
 * sh4
 * tricore

The x86, Tricore and SH4 CPU architecture manuals are clear that this
should have raised Invalid; HPPA is a bit vaguer but still seems
clear enough.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc      | 13 +++++++------
 fpu/softfloat-specialize.c.inc | 29 +----------------------------
 2 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index cc6e06b9761..d63cd957a19 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -66,19 +66,20 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
                                             int ab_mask, int abc_mask)
 {
     int which;
+    bool infzero = (ab_mask == float_cmask_infzero);
 
     if (unlikely(abc_mask & float_cmask_snan)) {
         float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
 
-    which = pickNaNMulAdd(a->cls, b->cls, c->cls,
-                          ab_mask == float_cmask_infzero, s);
+    if (infzero) {
+        /* This is (0 * inf) + NaN or (inf * 0) + NaN */
+        float_raise(float_flag_invalid | float_flag_invalid_imz, s);
+    }
+
+    which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, s);
 
     if (s->default_nan_mode || which == 3) {
-        /*
-         * Note that this check is after pickNaNMulAdd so that function
-         * has an opportunity to set the Invalid flag for infzero.
-         */
         parts_default_nan(a, s);
         return a;
     }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9bca03c4aed..c557c41b2af 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -480,7 +480,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * the default NaN
      */
     if (infzero && is_qnan(c_cls)) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
         return 3;
     }
 
@@ -507,7 +506,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * case sets InvalidOp and returns the default NaN
          */
         if (infzero) {
-            float_raise(float_flag_invalid | float_flag_invalid_imz, status);
             return 3;
         }
         /* Prefer sNaN over qNaN, in the a, b, c order. */
@@ -529,10 +527,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
          * case sets InvalidOp and returns the input value 'c'
          */
-        if (infzero) {
-            float_raise(float_flag_invalid | float_flag_invalid_imz, status);
-            return 2;
-        }
         /* Prefer sNaN over qNaN, in the c, a, b order. */
         if (is_snan(c_cls)) {
             return 2;
@@ -553,10 +547,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
      * case sets InvalidOp and returns the input value 'c'
      */
-    if (infzero) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
-        return 2;
-    }
+
     /* Prefer sNaN over qNaN, in the c, a, b order. */
     if (is_snan(c_cls)) {
         return 2;
@@ -576,10 +567,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * to return an input NaN if we have one (ie c) rather than generating
      * a default NaN
      */
-    if (infzero) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
-        return 2;
-    }
 
     /* If fRA is a NaN return it; otherwise if fRB is a NaN return it;
      * otherwise return fRC. Note that muladd on PPC is (fRA * fRC) + frB
@@ -592,14 +579,9 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         return 1;
     }
 #elif defined(TARGET_RISCV)
-    /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero */
-    if (infzero) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
-    }
     return 3; /* default NaN */
 #elif defined(TARGET_S390X)
     if (infzero) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
         return 3;
     }
 
@@ -617,11 +599,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         return 2;
     }
 #elif defined(TARGET_SPARC)
-    /* For (inf,0,nan) return c. */
-    if (infzero) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
-        return 2;
-    }
     /* Prefer SNaN over QNaN, order C, B, A. */
     if (is_snan(c_cls)) {
         return 2;
@@ -641,10 +618,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
      * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
      * an input NaN if we have one (ie c).
      */
-    if (infzero) {
-        float_raise(float_flag_invalid | float_flag_invalid_imz, status);
-        return 2;
-    }
     if (status->use_first_nan) {
         if (is_nan(a_cls)) {
             return 0;
-- 
2.34.1
