Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413008njb;
        Thu, 28 Nov 2024 02:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOCP4F3WvPBZ/fiM7qZhcbq13QM9jV/lIqhCeojw3O0+3UpLLH46DZo4hnCCcZaTrPoNEf0C0MInMTZg==@linaro.org
X-Received: by 2002:a05:600c:3546:b0:431:5043:87c3 with SMTP id 5b1f17b1804b1-434a9df266dmr50221635e9.22.1732790594209;
        Thu, 28 Nov 2024 02:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790594; cv=none;
        d=google.com; s=arc-20240605;
        b=gzogs8GQuCZni/TGzE5HvsaVzEdf+XXjfFY8UEms0O3w4uaXc2zEDwPWia4XL3yqg9
         hS1QV9Y3p0Vhigkc8tHhJcREbV7Gxu0PqA/9Y28iTm8jU33KMXOO/mus5G+LBaV+8VdW
         jKgKNaa9wnjcAyjflHRAYeWlCXgcihoAWBI1gLhaACAonEffuwokrOblHpy7M5lQDodY
         NTV3nQTofa9eJ4Mv+9GnSh8WEsOtt1AxQaVbVHynzerbn+OU8OOihrcp2lSN3to5Hi+e
         oBYZH/C66HlxItD11XKrluGbEUx7v+UA0JfLenossIbnNPMTwY0fqZMjj56OOmJ0yF5c
         HUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mSyVUvmTPOthYAn2vH+po+80+oHdzpSNwVHWEQhdvFo=;
        fh=zIqt4nLN27akRlfqE4Qawk4mKB77W/fSTs0rQ11uXwQ=;
        b=lM6zGNnUOrqjFOKVzPWxrbyCcr9XbL6Bi7sEnx2ijRiO/tJRZckc6eVWBJcwncT1Cj
         ayLqYHoFFbSFfekYZl6C/HNjV/AND25Fh3qzj6Sabf78qoKo9EDYcTBqupQdRdiMd/pY
         +lQ2eyxyQtbFZcggGR8YClT/5PAhP+rs5sADxH3K/UWG+hdW1qjNpNzLA13avvW3V46C
         svKPv8+smppDUuwZVnRAcGo30hrrp+jfa+NVZkmpde0zDsPCHSa8ifNInBtWKcKQJTxe
         FPE0NepiTgYlVJ6/Giz/wi6Kv9vn7bidkyk5+82bDp2CUK9S4iPSDBhZRLotcLlhiKKR
         9Jzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMULOv37;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b0fc91a7sor5237215e9.0.2024.11.28.02.43.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMULOv37;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790594; x=1733395394; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSyVUvmTPOthYAn2vH+po+80+oHdzpSNwVHWEQhdvFo=;
        b=zMULOv37rJVrm0L8A4n3hIZE01mviq3S8jtmE/xYMSSNc88pfsFMXcEWNO1CEf6So6
         RtUrJ+HUpRn8OLyiaZEFVzR8ZVYPranik196c/2fHlZY3rRnsTeME7Din30fEAQOp4Uk
         4ZE5BDtO4ITTnMFStJI7dCdFOGQhHUq1CnV8pvvdUrrWE/Qc21m0MAsmDZ8rucr125MO
         57sU/El5HWLZDC2eASnlIc+We8lB2f+xlus4x1eXPwFkuoLQ0CEcIw914w4NBZmEHcPT
         r18+gZjwxaCm9fmo73QQ80iNNa5OjLHaEd4iFR018TPTDHViZf8w+VzmWrDbiNXksiEo
         BWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790594; x=1733395394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSyVUvmTPOthYAn2vH+po+80+oHdzpSNwVHWEQhdvFo=;
        b=SNwJpnbwhpEVaNfSGTqgXAHxyQ2Qlbw61CxbNyF/QkuanNRpJdWjs0GLKhhQJS4gr/
         4zSov3ixas1rQtvmb7sKM69WCcz60vvdnOhKC+gRI7THAz3nQaXD06Vn4bqA3lXZ21lp
         unidi0mNWkaOFjkCW3yqmMpNXGabZWiStoXJXm6UWjSeIGsMt4gQ3BDNee/P6v0Lso91
         57jnPwDT55Qbb44ICMKHcVKl7tTMdPOr8NFxhGqy6xKe6kEnPl9k/9iY0WYJ1INNu1cE
         M+7VEjO6+a4VP1wE3yLpQlb3qo6o3kvg82k2s0i7GmzmKHW4PpdYH1eKtX1rrdsOA29b
         QXAg==
X-Forwarded-Encrypted: i=1; AJvYcCU6/YGrZbGFmuPu++VlZ36t5ELu169eFEttb0P1YO+C1szo6WePHJMi5jJ52T5oo7eWAGGD3DFsUPftNA==@linaro.org
X-Gm-Message-State: AOJu0Yxt2eZOGmAzLh7tq96hNfwVJ9BW4v2Va+RJ2/z3WJMvUvaEY1Cd
	80pXxtybmGe5+l4czEhdhexV9Vk/WIwjZikA+nJZOGqhGO5jSH3LdilvIqYZaE9g21v1qTsg6/a
	jNsc=
X-Gm-Gg: ASbGnctayl1flIcVTo4HGvEn4QlutEQ5UG0mu0xl0/DTS2pf/8X5YD5MTnWR5bTDJlz
	BbyUqo4JPi7oNwy1mVZeV8Pt/porpj5tXrcNl6qegu17CmDtJKiG5dSIIXindzwCFh7HTgLgDOM
	FZwQI9r2+wrV0Y3aUiHfDO9gAfScX1Ao5NNGddDAYSHA3960ACT1bGZoyfuDsVBiDo1qhbdi2qU
	jWE3Ad0KUYQaGIEFez/VvxcFLV4HqrgRmFgxybXLgy3K1na07vob4k=
X-Google-Smtp-Source: AGHT+IEnmQFdf94EyW0+87R6ugb6E5SiCnBQ2ZMZdtsS835ZaEq231LF7X5KL39Q+yvycbFJZ4gYiA==
X-Received: by 2002:a05:600c:3596:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-434a9dbbc00mr59891585e9.2.1732790593612;
        Thu, 28 Nov 2024 02:43:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:13 -0800 (PST)
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
Subject: [PATCH for-10.0 01/25] fpu: handle raising Invalid for infzero in pick_nan_muladd
Date: Thu, 28 Nov 2024 10:42:46 +0000
Message-Id: <20241128104310.3452934-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DcIUm4LV/J6g

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
 * sh4
 * tricore

The Tricore and SH4 CPU architecture manuals are clear that this
should have raised Invalid; HPPA is a bit vaguer but still seems
clear enough.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
