Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801843njk;
        Mon, 2 Dec 2024 05:14:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaAtZGAoWrXyAfpY+nHT3+swHrbdvs3nYcBSq//P5ifpKr3RZ9vHM+l5X+gGfCr2G+YrtQZpwKaaGSBQ==@linaro.org
X-Received: by 2002:a05:600c:314a:b0:434:9f0d:3839 with SMTP id 5b1f17b1804b1-434a9dc3d2emr199595975e9.8.1733145249568;
        Mon, 02 Dec 2024 05:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145249; cv=none;
        d=google.com; s=arc-20240605;
        b=W8VDqqMlqM7Gc4IqVYJyR6rjiMn7sB7Eie5cVz/KybOfAoZLtL7ni2LkaXmdqneKEK
         WI6OIhmoPXkcJ5Md+QjMBDZIIkhaEUM2HiGCQWkagUf1HV5ekvS79/q+4YO5DUtUNhfL
         7aFar8G1UOe/43b7VYOjIltXW23y0UfTN0p1z2ynrdG9fYE6HQVpP2z3TpU6TF5D6Jf+
         qsBb2I4l8x1hZHATVjbN6DBAu6MC1jPbVIwNYAJeHqhbRsDijsxaSptPj0GPkGjXN7II
         uc0XFwb28tUMhhnhKas/AXH3QLuwom2Z+EYnAOcXIOBb//a/KwPY+/bXigwI+qgXEaVX
         Lb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uAvUlUwIT6mon/4ZVWSLpgO6VDhWersS5LUlGU6M2Ag=;
        fh=ozh6pPFQ8wjrwf2YHF3ZEbhQAN9kkQiOimb2m7hsoBA=;
        b=LDlQd6EY1k+iKu6nN4+dU56rNXF6Ca2q/AZvMs8JVOgqjGnRzKYHL6VIbpYQq0P4yq
         HoglskBXsq+hf49dCxYZKB8p6F5IF04w6kQ4lczP9E8Qnqf/uJHAvF4ZvQidFAu+2/2C
         G+b66V+sL2LpsMWejEWz46nDQvWspGw74kud4DeCG6dVcFLutVJxJ397OcSbLCf2iYFo
         tZm9u3hr7VXSKg1tKzlBgyufDpmu/cYAoWq598hIPjdgBH0Jb1rf6nVy//jwmjLBx7Bz
         ibiIPL64wgpKR9Zk5gEksMBHqird9+LJDgK9SGw8ei7zL7cm8h+JzMr58RFC7BQrJKxl
         KrSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYyY52ej;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385db8065ccsor1841246f8f.0.2024.12.02.05.14.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYyY52ej;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145249; x=1733750049; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAvUlUwIT6mon/4ZVWSLpgO6VDhWersS5LUlGU6M2Ag=;
        b=LYyY52ejE7cmJJN4jEgsLu5mQKzGqcYUfn6019e80kR0Rc7eocqN4+kFLnNH3sc608
         a7lzlaZ6eS7ENcPI9BWTf/8g7Ocf/Abn4T/qUd7MdqklzO7J1dv+KBMCFvNrStBjtqbm
         bNeXMrxANKSO3+887Ds07H2agERgd4+ohGjieUmel3PQZvrS8UgOwMKvCeAv8WDC3Y7F
         c1uiaJTXyk5DiHN15hKe8v+LNydnw+IDqne8/4Hg4qPq5T3bFsUrIQxThLE389WORmlo
         BrwJ9FiiHDyvvp4dERhItJ5qDByTjdQBy3+LR/+tFzCTSHKjfa46BzBWB5mst3dcyr+9
         kHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145249; x=1733750049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAvUlUwIT6mon/4ZVWSLpgO6VDhWersS5LUlGU6M2Ag=;
        b=mVKnWXEywyM2/fE+T6KHAafKwOztnIN73mQEiClLbN/l1wFf58vV/j79kKCJmjFx7t
         qnhPnIwwlTZuVMcYLdlo8RGzT7ckjLu/yEZpQSnsRPK52Q7OlExpAlQRkc4uaRD/qZ/U
         QB+X2kFI7dUsIPtaPDgnXaG1UK+sy0m3X/Q6j3YXOgddJgQkZLId871RXOpQ4UtRMZBR
         Zpn7TC7VmSb55p2u4f0Sy9nuHH6DDAbc3GISvgziccfi6qwXfjjCTJeiu8FfGlENPugs
         IqTnld25jxENddqLGJKDesSzJ6oBnImKeys4vg8eBJijf9Sx4f5w8erPmjhZYqfeE9Bs
         VYdg==
X-Forwarded-Encrypted: i=1; AJvYcCXxPRO7VYvE2dYRZGSfgx3ebMa152eplXf5iFMCwr40nsQdLTvW2tsN/bylAOP11y2QXY5cnwGgiE2xFw==@linaro.org
X-Gm-Message-State: AOJu0YwzxZ9TlWzSAqKYTFIqs4zoXYkid9YV0y8tgVm5whtT9NiHUJAM
	QRXofvYG9B5NMaGmMxpeftBqgtzvADfBrr8YkOqNmXdGTDHarZb26tnafH3R5lh0eA==
X-Gm-Gg: ASbGnctuImcOfpkCQddESStLnmMjQwaA8mUovvvDV9FeEaDhgS0QzR9d0dJwGrOlFAE
	GDmDKXEfRzK4j5V4R/i+LOHSw+H2Px/A0KVqf99mVwCl7+R2Df3qPH3EMaeUlhx6x59Xj5fnPBP
	rZSXhQLY/fTSagBAJyEVdBJHKa9tfNCSuw6vmvWi6EvDeETp0MmTSkw7tg8OCo7yYG1EU4QPA44
	MtxjPFhxdX1vjnJOzIW5tu2b3IB+oHpwbzhM8hxicpcaC2F4pJzVpk=
X-Google-Smtp-Source: AGHT+IE5iv5s3mrYdQc2+fXd2f07qSrhY020mcYzc/+Y1BJ5GlK97WEz6OPBovtSk3AryeNH6ag8Ug==
X-Received: by 2002:a05:6000:4710:b0:385:e013:73f0 with SMTP id ffacd0b85a97d-385e0137516mr12146642f8f.59.1733145248867;
        Mon, 02 Dec 2024 05:14:08 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:08 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 10/54] target/xtensa: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:03 +0000
Message-Id: <20241202131347.498124-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ysY8IP2Hs+B2

Set the FloatInfZeroNaNRule explicitly for the xtensa target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c            | 2 ++
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 6f9039abaee..3163b758235 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -133,6 +133,8 @@ static void xtensa_cpu_reset_hold(Object *obj, ResetType type)
     reset_mmu(env);
     cs->halted = env->runstall;
 #endif
+    /* For inf * 0 + NaN, return the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
     set_no_signaling_nans(!dfpu, &env->fp_status);
     xtensa_use_first_nan(env, !dfpu);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 7e57e85348b..3062d19402d 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,7 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
+#if defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-- 
2.34.1
