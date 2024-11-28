Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413198njb;
        Thu, 28 Nov 2024 02:43:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVB9Fi15Y4ZJlzZp0WbwZoCqRJTUF4dbugHNhUNaQG5Z4ulgnDLEUX1WbyC4a3O1fMc2zNzDQAxrjj0DQ==@linaro.org
X-Received: by 2002:a5d:64ec:0:b0:382:2f62:bd4b with SMTP id ffacd0b85a97d-385c6ebe46bmr5305010f8f.33.1732790614938;
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790614; cv=none;
        d=google.com; s=arc-20240605;
        b=QzgHq3P2kisG3LhvSRFdpoGIqpaIC2kuVau8z95XPYE+PLeiKEy23uKIOLDwaEev4H
         YhuTK710DG9Ab7bx2vEY2HkHSltwN8Mt7Pop9F5Qf/F/A+LS1uj3zkAudHIJcG+kvaIM
         7lSxvpxj1UCzBqZISsiZ69igXIHab6seWTXulfwdgZ8NdXGJNpw63WLqmwcfxptcqvuc
         soBQGlzyqSiq/143obLKr8FNptRt7id0MFWChE5F3hqJpiB7OUOMsdvMQVg5SDjIUTmo
         rZym/v+a47GTqIgO7rGeW9Z0Tyyb9mVUoSG1/jdw8Ch+zc0Q7GmE9axhMu1AJGAexyu5
         dnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2TrVJRkkr5D+N0aBUkmYJt1MSRdpl5FRuyVmIZ66utw=;
        fh=lSCq+gDygxZSsbZZmRbdq4CFZdly+j3GJZHTGDK5cyQ=;
        b=fVdkA7wnWquU34jyhjdUWccfxVM5GGSUoUBAwKUEVVRjMcmeAk1J4rtuz/so2B0Egc
         VGkEHvhkW551oHmQFmpdHi3Pl1fjdUwpoWCof1NEtNUoG3xx56/ebpwaVzQlz7BBG4OE
         jiDYr0Lsq/VhPaNWOrRhywIrtA5vNqGOH+ze01h3bkuWVadMyj+f4yDom3Sqv9N6OT9y
         CfDGEyG+Jvvj4PmEURnzSVRon+YpAEqlxDwApw9fBjsu3PVI9sHhrTdoEs2M3PXC0X+t
         1XXlZ6PPCrBf2GIO5DqG9LFyAhKoyu0OedDLA2W2T+3RONJEB8Hyv5nkJZCFgP47hm5o
         0oWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qYvFjM8f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd5a8a1sor327111f8f.6.2024.11.28.02.43.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qYvFjM8f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790614; x=1733395414; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TrVJRkkr5D+N0aBUkmYJt1MSRdpl5FRuyVmIZ66utw=;
        b=qYvFjM8f2jmLnEZ3rIVkxXhKKqdnuPswqBquPZuQmnK1lKDf743h9FLcbQBBQGvN0A
         FK+yGLNh94Bwnzot8O2MBLcEu2xacd2jXJ3esgK34Qps7beoZSliz9m3KOxlMnVn9BmE
         gyQDqzRHerMjOIJP+AC4WuBv5wjZYN4aG41soBM+4Gjf5mJYNEcdSzJ6W9lvphA3skzV
         KL0zk5bZmfhvEcP7mjdahis34ERgle2UX3ouNq8uzs4L+Z9JaVtRkjghZ1Rpb23Ydd8x
         COmI4RGh4/eVt94Wv26G7vDmpvxgSbAJ+XPZcTBHKkG3MjYPUZvBU13pZDaGrjBYkoAh
         2tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790614; x=1733395414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TrVJRkkr5D+N0aBUkmYJt1MSRdpl5FRuyVmIZ66utw=;
        b=kpQsVMKRQKi8hEtT9cMyyzvcxh+e91Z3F8mETjnom7Vq6ewhtvNykkjPWC/5R3hjQr
         gMtCKeDFK3PcUzxH2kXnfe8Uhp8Gg/ZA2opV6EJcKSljJhhSRQU5HfE14livYeD82iHp
         +XHo6RCBweJnYwPmbwuyirLltVYefKjGeK9XALZWpLTYF8a1HBzCdSbjHZ7S9og/nlMd
         xHiSTQAaiqwol62ojlkQr4INM0+ZRhz8e21T9GZtNpkC9w7eEWvlSScMnenKjQCNHmix
         ekMyZWCYesX8Lyw7G7qPlm2RrrUb4XkaYwep/5AkuPaBe91BW7Vn/zhFfTpVHP0J4MGZ
         ouuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHeVuir01RrBfiLWfAZ4u4ATxEW+c9xyx5NMyT0OI3UFv3+lTwBUq/vkTjJrqGFkU/8wZOLvjpKFl0wA==@linaro.org
X-Gm-Message-State: AOJu0YwTwlpujeFsyOYCQBqy6gtYuLpMHthIhpboNkvtcVKRbyUODoXQ
	IgzhkksEyO+uWGWxCNh69YUxR8/EIMd+Vbqoe1FtkxxtKgIO22nQVR7Q/WZ9bXTYLg==
X-Gm-Gg: ASbGncsV2v9hCvMkKOTNhGhl17qNCFGIagQagvJXo6DEz5nQgP6AXBgQZstI7UY7UaP
	CiqkrXy0NZpAfkCaPbJYQRZNWSaKzefHAJyCyFJoRE+gRt6njnr7I7MY5sMwYhmptjCB8Mq+ZH2
	4/P2jv4v+//iYUsfOvoctXYy8jeOlk8n4w4gaNHzpT++4+PRHKZ23q5r40flv33akLefYaSua6M
	bAQSDTA93ObXeYFHxvbulZ5vhkacYX7bmMm+CjJlpW7yyXx6EFkbl0=
X-Google-Smtp-Source: AGHT+IEbfVCLYtPqt/qOPnH2qT981nHuA4VnsdG2pgMYEFf5EZYOEna96GoFM7XW2C+4P/qqEtZwEA==
X-Received: by 2002:a5d:47cb:0:b0:382:22c6:7bcb with SMTP id ffacd0b85a97d-385c6eb4c32mr6479070f8f.3.1732790614335;
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
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
Subject: [PATCH for-10.0 21/25] target/mips: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:06 +0000
Message-Id: <20241128104310.3452934-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OmVQk3eAkkr7

Set the Float3NaNPropRule explicitly for Arm, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/mips/fpu_helper.h       | 4 ++++
 target/mips/msa.c              | 3 +++
 fpu/softfloat-specialize.c.inc | 8 +-------
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index be66f2f813a..8ca0ca7ea39 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -29,6 +29,7 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
 {
     bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
     FloatInfZeroNaNRule izn_rule;
+    Float3NaNPropRule nan3_rule;
 
     /*
      * With nan2008, SNaNs are silenced in the usual way.
@@ -44,6 +45,9 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
      */
     izn_rule = nan2008 ? float_infzeronan_dnan_never : float_infzeronan_dnan_always;
     set_float_infzeronan_rule(izn_rule, &env->active_fpu.fp_status);
+    nan3_rule = nan2008 ? float_3nan_prop_s_cab : float_3nan_prop_s_abc;
+    set_float_3nan_prop_rule(nan3_rule, &env->active_fpu.fp_status);
+
 }
 
 static inline void restore_fp_status(CPUMIPSState *env)
diff --git a/target/mips/msa.c b/target/mips/msa.c
index cc152db27f9..93a9a87d76d 100644
--- a/target/mips/msa.c
+++ b/target/mips/msa.c
@@ -66,6 +66,9 @@ void msa_reset(CPUMIPSState *env)
     set_float_2nan_prop_rule(float_2nan_prop_s_ab,
                              &env->active_tc.msa_fp_status);
 
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab,
+                             &env->active_tc.msa_fp_status);
+
     /* clear float_status exception flags */
     set_float_exception_flags(0, &env->active_tc.msa_fp_status);
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 565790b1834..2d029de7baa 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -502,13 +502,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 
     if (rule == float_3nan_prop_none) {
-#if defined(TARGET_MIPS)
-        if (snan_bit_is_one(status)) {
-            rule = float_3nan_prop_s_abc;
-        } else {
-            rule = float_3nan_prop_s_cab;
-        }
-#elif defined(TARGET_XTENSA)
+#if defined(TARGET_XTENSA)
         if (status->use_first_nan) {
             rule = float_3nan_prop_abc;
         } else {
-- 
2.34.1
