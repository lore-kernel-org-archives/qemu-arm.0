Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801689njk;
        Mon, 2 Dec 2024 05:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQpqag8jTS7VouFp4n9bSJuZeHW5lou01aOe498Bb0aSTO6p8Vt4eTO1LE7Fmi3kUjLF6Ry3ehAB7gMA==@linaro.org
X-Received: by 2002:a05:600c:4fc3:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-434a9dbe916mr211618265e9.9.1733145240998;
        Mon, 02 Dec 2024 05:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145240; cv=none;
        d=google.com; s=arc-20240605;
        b=jTHcVTxku0UPbxxlprOi6hTLEFUr6xsqySsQu03VlycXiJVPai/pDYl39MHqXdwXjg
         9A4qJYpILkLdPDMrT2HfvU+Bwv1cbLgMwbsD/9YvNVV0WrWvyD8xbnOttOzv9/DZmmjN
         iMSEZ4XYTyoh+sxg/S/ixi4MosjI0RQOzDIcsAcL7UFJltzRqaWzFZroM9BD4MNrVGQ7
         sq3D0Ni/3NWos/XDZd6gvvotBK1JGSOvMw/OHOlbeUb+3a3cNeH8/TUlWfO0zGtQ5jDp
         8if4cwbrsv4l4GuRsl4XcTGpzzlFFJzJj7c8ZEHKj33YQqRQHpQLRGmFagZzHeUOvVPG
         msDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HfpQEPdfErqnjNX6r5VLZdc7V0ZgOPNgi8c10TCw4Tg=;
        fh=o/n/Gb0Ceksi4TbyHtrYnJO9hS+jNktUHufJTM8wuUo=;
        b=CVxx3pkW5N66ClPcgdqj89xKU9CUpWDm5RrTarY5284XG792gdvAgeXvDVY1/Nkb36
         n1ZDladwtwS4xCT1+RpnyROK9bxlbS7TJXT2QxPh4YrGYAdidNbOOnBRvTHPSN8kiOXS
         pG982BwKQQB0zGti2fq6VLbZDXNA9Pzv3aoaXgWmBo1QFrkFM6hFPvviYg3XdpRVbqJv
         s/xnSeifAoL155+UgggO9m9KehVqzCH48ofmPwn/YX1bvcdskf6LKznwSucma8WkXeGZ
         mFskH17L039WZxDw2bnEmLzariCcDs1ZncENZXBrFHcZznK+Bnsu6Ddg5GPGUj8Ewd3y
         b2ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbSu8Bfi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1052698sor31349595e9.5.2024.12.02.05.14.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbSu8Bfi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145240; x=1733750040; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfpQEPdfErqnjNX6r5VLZdc7V0ZgOPNgi8c10TCw4Tg=;
        b=wbSu8BfiAgefacUxaCeXTNiHjhIs9gYvBjDWE8xq2M2SVnSpvbC+K8/13ixuNfM3lD
         EuCf4BGcAJoix83vTAKlh/3NYltbP5FHv0vt9VcDwgM1ZGb1aIBbRODvN0IBIVzLELZw
         eJ4NKXzPuwQqrLVNfYFBfj9FXYXbRlRxKkolUQQRMACk3QhL/OR8GEpn1oE6D0CMkYb9
         9ShCy0fhCgrkAnXl9O/fDU8zWVOjYpBnYQK1A6WsZbLAixOnhSdt2naGKxNZa3dYsFer
         QQkpqmWJTPMVKxfAmYr0YCh9NxsH+ZEZijw5WVDRppjzAg9wyWELeGWmS6VJ8jLkVcB8
         kDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145240; x=1733750040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfpQEPdfErqnjNX6r5VLZdc7V0ZgOPNgi8c10TCw4Tg=;
        b=Axr5lIukxaKK5J6UebGNmaPDlHWZ/GBvvoMhmzqGmQssStoZzckasffWEbmzF+nW6N
         oKEgpy8/ptfPmFc8hfCnFenkkW21ajCW0LfPXJOThhsblhGEQb742kJUwMvSweBaWNvH
         n+cQR2dQr25PGgPirDWao6o5ZUcGJaPt+/vDiVlXFpNES/xf1EXq1XsTeFjG/x0x2Hw9
         y52LjCcjnwyzyFyCR1pzrIn7ddi5E1pmgG5YX4g4+p8cZhgXGlI6R/v70vRu1j/S0iQi
         uXYOKk/3t4tGwU8WKk/cYFxW9tbywugzV8N/v6aStrpCErqc6lAzrPTmN1MG/MvU66M9
         C6GA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfoXBDG321i/HWlN/KUuSMaAdxgN8R2p7YvAnHHJf4rX7eraOX8YXG43cRTCTRliZ7NsBZMBzs8VYMw==@linaro.org
X-Gm-Message-State: AOJu0YzUm5efGCD2P7eu+n4mvaGjFoqgqMsmphsIQWJtxRwB67ulNPJ8
	kmloJLnHRcGt9zB1YJhpfpXbbh5kHM7fJ1jKQvY5gw8zTc2yGTxk+EJYdngIDnSL9w==
X-Gm-Gg: ASbGncvgrYtjahg0sCsdLokuitAetZscjBA9fU1aOo4Lf1ZIk84qZ3MwSnrXojUuCwE
	Zk7D+P4kO6iY78pPcSc/6RVYMLi94GkCFKjfZHFQE5EdKnceoGcnqjqIN1Sk7anVFW1Gztfbkh7
	4Vy+d2Fz7mBjoN2Z1Ac9foXoVwTmwW8iTJ5eMDUGDcEKPcTK436GVW3SIrCmUvU/vEP7Y/0c5A3
	Gquayg1vqARvafmY+TsvKnrrmgxYByVaRwOdXr8sWuYneNMNaeh//s=
X-Google-Smtp-Source: AGHT+IH1SwiyqgNnO1jb8Mg4+qV0wNNNfAhUqYCw2B1qbD7zW+iE5bOTeMcRWbkK/6Xj+0nABql66Q==
X-Received: by 2002:a05:6000:184e:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-385c6ec117emr19208264f8f.34.1733145238862;
        Mon, 02 Dec 2024 05:13:58 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:58 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 07/54] target/ppc: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:00 +0000
Message-Id: <20241202131347.498124-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Wd0CrlwZSXwU

Set the FloatInfZeroNaNRule explicitly for the PPC target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
