Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413070njb;
        Thu, 28 Nov 2024 02:43:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfhw29OW4w2c5GzFSAxWSIoU2/kHyIyAcb4hfrrKRVTHjkoUgLc83kmk7AK5FI7yVPyroeXgH83Nq3IQ==@linaro.org
X-Received: by 2002:a05:6000:1ac5:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-385c6cca304mr4852556f8f.8.1732790599748;
        Thu, 28 Nov 2024 02:43:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790599; cv=none;
        d=google.com; s=arc-20240605;
        b=k6OtUTQdpNt+o1VLrDgg6xKaRXzlxiYFdsvluzlxLH+1YKKaiDuxSDan7dh7TT7k1K
         mvitzwd+zCopfJlRkKyNN82F1bCz6KxU5BG0I1ohs3wOqyfN69mVlBeGszJ2WLBnBxvr
         EhsD2gKl0uAuyp6U1FUmJhoFbDls5/GMT59FcjYlcY7hWPRc5Coa82/Hc/0UlElHpziq
         7Csn7n9YLdx2eXoXuUvINHByH7bWgTLYSErkOUMNXiM0gJNhnHdwWyGYsFCIPmt43F9w
         uriQE0WIZzupUd2A0X4BG1qaFVmsQDs3t1sS+9dz16275RUz/2dHbwfIO7DB7shp2zzr
         JkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I7qNHcv2xsM6B0IoBDGG37yuVzj27RgfOCxf0ou+qD0=;
        fh=dwCGyCIoL+XV3HbLONstrN448Nghl0CF9CdeKnRQPvk=;
        b=BbKY5lFcvAifk9zaPy+NsgjtjM/I/hiA5AkZc/MeYJ4ykG+LkYH7RcMmGDIvoTftGY
         2uQFklVPRGI8ul38nEqB0ZiHkScAEOlTUsakVrhtVCdORF1/x4BvVKL38eTGd8jIBUJ9
         jXYObDYvoY+qelWuwESi6vs+qXRizVpuqtFtLUN43DAueyOpadZwBmiCysjkMoYtoE+G
         xK7cYHztApCSSwG+uRHhR6i2MvPu38fWd2FiEemuceF7t1L95ii3+ZrkqO7LPXspR24F
         bgHn+Behin9kEHh3ud2ZBZw/Mpz+/oiYLFISh6nsrEL+2ACbc+qUVvBSwuGfBn5Ezi9R
         1LLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oZVMRkVX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd9185bsor301086f8f.9.2024.11.28.02.43.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oZVMRkVX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790599; x=1733395399; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7qNHcv2xsM6B0IoBDGG37yuVzj27RgfOCxf0ou+qD0=;
        b=oZVMRkVXxKVcRZ6587hLO685O7cNt6nqMfKcKP/zdBPweAPR03A6s7mlH68pTHaufy
         621d7ISE+2a/SzXA0BPa1DcS0DHNpVMB1Aji2CMv5i/Tn4MrVNCcEv2nIyUYAQOLw8nx
         NYKtU8athq3deWpV5I2YUBkw+ahFzs2hDI1UVpyK1z/S+ewsoD6/B4kLvY3Bb9rMxrrU
         EXlx+VEbFqQG6fQZrGG2jpDpbha1jpbudyK5QIDpBbi2CMSyEGmLMFuD3w756CeMBU59
         IqO7QrQYfTEZgAWtbqWwvwuioVoihd0BhFJ0z97OlunuyYjV4YPdFqxzwRSj0PM3vFZC
         DZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790599; x=1733395399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7qNHcv2xsM6B0IoBDGG37yuVzj27RgfOCxf0ou+qD0=;
        b=sYoYs6AlmM4DJBfLuelqeOg9q8vBtbTDrN/chP+Bg7ESq5wvIwwx+PDlGrGWMScpyR
         oDT5xkb82dPITvfWtUogU4sU2s7xKAVYARPah9ci2oG+xj5qXPVRY2iJKu/kxPzNFVDq
         zxmys3owcg5D37YYjIaxefSKVi66ORHSmCE2SvWZEgsbjXcSA+BqJsIUP9fIRyzCLGAv
         JaDH4JN8tw2CUNrtt6XiCJ1fWoFlgGPW7LVjfC0emTQQJUwm5mvcxssznt7AA2b1doe/
         IoFy4L4aa2kXQDvlbZoeNfZCqSYMaEdSzjgsig4mgaASTCeI4OLgl80JhPzmAP+xaKlg
         RxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWli8mfIyMVZSXLrNNbfmId68a6Qf0HfvI1/prpW+INPCg36kJbE4QQtx182iDSBqyVtB85KrRG4gPKcg==@linaro.org
X-Gm-Message-State: AOJu0YzTNBzdDMFbewcvGXxU9+gpPf6a7T0koOEyKpebfXZgu44Gg8VJ
	/+RkRwClXQM2pd9eJhEBFBwG1IdCZQYfSrws3JEyaQwBLHC/9E5u1FZpNMnZUE8IwQ==
X-Gm-Gg: ASbGncv/KE2Oeda4X5PP8ry+R+YXjZE3eiyY4qTsZFj6eF3XK+V2W1NQ/A7wgb647T7
	t+8YnUrGwTe8BYkcX9fQweWzFHSIh70YRxnoQiuDNQHSh9I43sq4bhDNn7Qs9wz9mDyLhMtx5h0
	8VTMAPjzKlN+4TiR4qlrdm+HYzTP9F+4KgQVcMI+6obS80BAn86EUxcdEzKbNNUTxf06thGsIC6
	t7A1UtPuhVHpvvP/aXv4hzs8wD9+u0oyoAlC3FBcRHuTmBJZf6K7uQ=
X-Google-Smtp-Source: AGHT+IHySTOT4575kp/JGABI+mh2igzLQZ8XO2gvE//i7mGU/JyqYH/xnk9v4vZ460bseG5dsGZH0g==
X-Received: by 2002:a5d:64e7:0:b0:382:49b7:cbc0 with SMTP id ffacd0b85a97d-385c6edc520mr5316469f8f.52.1732790599203;
        Thu, 28 Nov 2024 02:43:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:18 -0800 (PST)
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
Subject: [PATCH for-10.0 07/25] target/ppc: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:52 +0000
Message-Id: <20241128104310.3452934-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: csl5Q3qMVLoG

Set the FloatInfZeroNaNRule explicitly for the PPC target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/cpu_init.c          | 7 +++++++
 fpu/softfloat-specialize.c.inc | 7 +------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index efcb80d1c25..f18908a643a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7270,6 +7270,13 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
      */
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->vec_status);
+    /*
+     * For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
+     * to return an input NaN if we have one (ie c) rather than generating
+     * a default NaN
+     */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->vec_status);
 
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index db914ddbb1c..2023b2bd632 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -503,18 +503,13 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
              */
             rule = float_infzeronan_dnan_never;
         }
-#elif defined(TARGET_PPC) || defined(TARGET_SPARC) || \
+#elif defined(TARGET_SPARC) || \
     defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
          * case sets InvalidOp and returns the input value 'c'
          */
-        /*
-         * For PPC, the (inf,zero,qnan) case sets InvalidOp, but we prefer
-         * to return an input NaN if we have one (ie c) rather than generating
-         * a default NaN
-         */
         rule = float_infzeronan_dnan_never;
 #endif
     }
-- 
2.34.1
