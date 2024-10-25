Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086077njx;
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
X-Received: by 2002:a05:6512:3e25:b0:539:f8da:b466 with SMTP id 2adb3069b0e04-53b23dcc442mr3762260e87.11.1729865584807;
        Fri, 25 Oct 2024 07:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865584; cv=none;
        d=google.com; s=arc-20240605;
        b=GKrvHIovoQMjJ2TWQqYroC/WdjKwc/3ytvboEr2+DZN9D6QOYrzOnAvxKhY87wfdaI
         zKV8g604e0U0CXjkdkq9McwwoSyIDOjnaBiQf5UkqgM79hc3EXiKW/yP+TYiNeWN7rtj
         0W3XqjTe+mj2zCtGOUM6JhFFePj8I+4Znipr3O5XbF1erLTyoHeI0OTTOXkXJFOkOyQR
         mAELPAiuOvqTYjqRRc/8iqVQITv5mY713mIQej2KqPP6d5UT6Uqx8vqXVjgzCULZ3Lyd
         z6hQ0xeSV9ZQpTNucN0RuhQxZcNzQhaH8dC0NjJTyL1ldptxMvQ5y8M8TTdBTIy2/yYw
         9xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XlVlvBeEo5iy1psg/A6qK9cIHAMeC9pxkWdSURdFSQg=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=lgxtOd07krcRqOBdf0AotoBvpdTqlHnb4s9m4VfzihRKlnzocAw4MYOY+gyUFbv7iK
         LdQBA+KIhsO/ZQIduNsWj72GufPxar/3sij4ExJpaLRt4JQAHpUDWWXGY5ZM4yY6PPIB
         Jw+6IY55Qg1U1TE28UDlc0n412npeONaA6clZ42zwVFXSTx+KOFhX75b7CYUXjdSKo7z
         jjHwDKfbURJ3sN6i1ix03ZtCbXFq9AGupmteKto6vP1ObmN3F8GtRe9VMuoDetT2/tGL
         K8a3ASOArlr/Zi5HqQBDLbGZvnEgBXFKnXv5hgeGTsJAnDy8XBQuJciJ3Cbgtne9NrQw
         zAZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPk07d8X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319391e237sor4737075e9.7.2024.10.25.07.13.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPk07d8X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865584; x=1730470384; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlVlvBeEo5iy1psg/A6qK9cIHAMeC9pxkWdSURdFSQg=;
        b=KPk07d8XNklObdv+rYPjbBN06/1ul1DxyneOjxlsGzas/QzrPF2x3sGWsbkPFwk8B/
         XBUF0WwBluC3uCQIIkgyog16EXjOHjFZEChY1XhgkCmAWv33zFLoM/F2QTTI8e0x0h81
         f/MPWyNJtY9bW2dpVqdbOY3GnWnVMVTnvDSfodZ53LG6qCVGzeVmfvLM8bG6hdVSBgIQ
         UIsr3SOPA6I4rfNWIep4+qo1kEd03pspSiKomWxJE0a7josWw6c2bfDvc3YEBUDoJqge
         kdIEr+xMFYozY3TfKGzxfr8KiRXR/xGMSu0UdK7abcp43fljghI84hF8hw6a8KPTopMP
         ZU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865584; x=1730470384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlVlvBeEo5iy1psg/A6qK9cIHAMeC9pxkWdSURdFSQg=;
        b=wSk36YfwC5vdp4Vf6ZfmG/uE7EG2VeTs14iHFo2nMlwGa3LQPO83PfKEY6z1W3IkbC
         qIRS25y/MZSW++apm6bgyM3Wp09icj97LiRkh2BKJzRIByA/Yp36204KGtkyQ7RnU4r7
         2gtsusSPLcdzeUjZTnbS1qKFx16+veTm/QbyYlTvf8vd5jdyRuDAdTGISCuvAS51YUNd
         wx9n0cho/G9b43Ykr4A4JkRJtyYvqVP2PrFc5SMd51hq3X/7/uCPtn7v8h+pcsM7o5VT
         QtfrZ3+BKDdYOjVgUc0Pho2Y+cRmTrEvtnSLuw6VTNVSjX0paMrnZgL74P4pvxhanSIN
         on3w==
X-Gm-Message-State: AOJu0YykwkxFdFvCZxpSPL/YMjLRiR+c6H3XvwujZ2DRfu5uCakwq95x
	w/zgd5ZLJ09RKu/mZTt+2CHniRTuzyamqGZnxA2oW6ngt4ve7SbU2kSQZEIu1XEE3A==
X-Google-Smtp-Source: AGHT+IHuVmVPpD0uEEE99zbT59LiMowu3UFFLJFExcm831LgVTVmwcTaFFic7V7R5EgyO383KTowLQ==
X-Received: by 2002:a05:600c:34cb:b0:430:5760:2fe with SMTP id 5b1f17b1804b1-4318c73947emr54557345e9.22.1729865584260;
        Fri, 25 Oct 2024 07:13:04 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 09/21] target/m68k: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:42 +0100
Message-Id: <20241025141254.2141506-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A37uzsQx4daH

Explicitly set the 2-NaN propagation rule on env->fp_status
and on the temporary fp_status that we use in frem (since
we pass that to a division operation function).
---
 target/m68k/cpu.c              | 16 ++++++++++++++++
 target/m68k/fpu_helper.c       |  1 +
 fpu/softfloat-specialize.c.inc | 19 +------------------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 1d49f4cb238..5fe335558aa 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -93,6 +93,22 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
         env->fregs[i].d = nan;
     }
     cpu_m68k_set_fpcr(env, 0);
+    /*
+     * M68000 FAMILY PROGRAMMER'S REFERENCE MANUAL
+     * 3.4 FLOATING-POINT INSTRUCTION DETAILS
+     * If either operand, but not both operands, of an operation is a
+     * nonsignaling NaN, then that NaN is returned as the result. If both
+     * operands are nonsignaling NaNs, then the destination operand
+     * nonsignaling NaN is returned as the result.
+     * If either operand to an operation is a signaling NaN (SNaN), then the
+     * SNaN bit is set in the FPSR EXC byte. If the SNaN exception enable bit
+     * is set in the FPCR ENABLE byte, then the exception is taken and the
+     * destination is not modified. If the SNaN exception enable bit is not
+     * set, setting the SNaN bit in the operand to a one converts the SNaN to
+     * a nonsignaling NaN. The operation then continues as described in the
+     * preceding paragraph for nonsignaling NaNs.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
     env->fpsr = 0;
 
     /* TODO: We should set PC from the interrupt vector.  */
diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 8314791f504..a605162b71f 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -620,6 +620,7 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
         int sign;
 
         /* Calculate quotient directly using round to nearest mode */
+        set_float_2nan_prop_rule(float_2nan_prop_ab, &fp_status);
         set_float_rounding_mode(float_round_nearest_even, &fp_status);
         set_floatx80_rounding_precision(
             get_floatx80_rounding_precision(&env->fp_status), &fp_status);
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 8e3124c11a6..226632a4d10 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -404,25 +404,8 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
-    || defined(TARGET_S390X) || defined(TARGET_PPC)
+    || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K)
         g_assert_not_reached();
-#elif defined(TARGET_M68K)
-        /*
-         * M68000 FAMILY PROGRAMMER'S REFERENCE MANUAL
-         * 3.4 FLOATING-POINT INSTRUCTION DETAILS
-         * If either operand, but not both operands, of an operation is a
-         * nonsignaling NaN, then that NaN is returned as the result. If both
-         * operands are nonsignaling NaNs, then the destination operand
-         * nonsignaling NaN is returned as the result.
-         * If either operand to an operation is a signaling NaN (SNaN), then the
-         * SNaN bit is set in the FPSR EXC byte. If the SNaN exception enable bit
-         * is set in the FPCR ENABLE byte, then the exception is taken and the
-         * destination is not modified. If the SNaN exception enable bit is not
-         * set, setting the SNaN bit in the operand to a one converts the SNaN to
-         * a nonsignaling NaN. The operation then continues as described in the
-         * preceding paragraph for nonsignaling NaNs.
-         */
-        rule = float_2nan_prop_ab;
 #elif defined(TARGET_SPARC)
         /* Prefer SNaN over QNaN, order B then A. */
         rule = float_2nan_prop_s_ba;
-- 
2.34.1
