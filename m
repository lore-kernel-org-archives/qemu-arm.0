Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086156njx;
        Fri, 25 Oct 2024 07:13:09 -0700 (PDT)
X-Received: by 2002:a05:6512:ac1:b0:539:ea54:8d22 with SMTP id 2adb3069b0e04-53b23deb2d8mr3853896e87.18.1729865589174;
        Fri, 25 Oct 2024 07:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865589; cv=none;
        d=google.com; s=arc-20240605;
        b=eqaoA2Sli0+JzdV83queDEc+n4nKZeL1JdqlafHeLsQJ3d51Erzt6uLhmS8tkk0YmX
         MrPAZTUM5yPh6838pF0Q3tt52VrD2sJKMxwAaXkHa4uT8W33XKq5RLqCobTd0DzeHE38
         YAG8Z5TRzkw6goJSv8IXSL6Ta+ENg2bdcTKdeXpFQj4L1L5SOmmnqhe3EyiiIAZU5W8v
         EwHb2LuSdLRiKRbBqnaW7tUkF+518XdLzfc9I8FrKtLOgFyRlK+bkZiwAgV2fflKgZR9
         KwzP9svMiwSwrXmp0yt0/6NFb2V5fufP1mc/DGUzxU+2fvPyzCXYCfrNsXuMq9DCi1XQ
         0EKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E/5hJDm1PODLj3BAsIJIpQ+juZ5PqFngoiMdJEv0hac=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=eBvBTwUhihFcRWw3xzVgjxnZE1M2KRiPkNSxZijGMrLvh4Utlwhip1k7C17J52DpOU
         LBfuJyaxX52R1IUwciFmI2zbA1aSoCItaAP/rPRfRlRa/oC1fCeELHSVNjgolQuPmEbT
         GJL5Ge7JTlzrRQxVrbgNukFDKwkxdCSXrGoUgvBY8saMUFo5U79Q5z0DZtk9TPHCK7/d
         R0vY1GZ5tMzcHOIPbHk8or1YeQjQYglEmZai+pK7NjcZy8WZXGoT8V41wdmdSj89NIta
         NauqAmJOlj8oMViH+RymeTIgwtQNhCRDMgcUf4UrOnksiOUXOJ4UxONPTHOqYGK+h5Na
         uMzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w9u55Eo5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938c9549sor4750525e9.2.2024.10.25.07.13.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w9u55Eo5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865588; x=1730470388; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/5hJDm1PODLj3BAsIJIpQ+juZ5PqFngoiMdJEv0hac=;
        b=w9u55Eo5dBGRve9+S7OhDHjgc85TVvRq6ppeQQIXU+0mt73UFJvOs8H9+vB5M9cKv+
         rbqVqqesKHfJilntSLsIMK0dy/lRw6QaXY5FEWwfU5LAwAcPb3zxc6E1zfvWlHu47Hgz
         rsa2YGNHq2vZgWxrxlsh0IW/n6qFGFyO2ofYpB/HuKRzkLqFLYoOOwymHLvFbyWz3eJe
         DluMUkIsqBi0ROQgTfh115ZeTIfYAWmAHfY5OIGFyOpKpIKZyl11eEkktAxxpWLyH8Fm
         mbGBGp6Vdf2QpcEppaDsZDHB4VwFaiPuZ9M8nEekwNxGejp6ERjc8Az/2kX1L/yzt6oq
         DHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865588; x=1730470388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/5hJDm1PODLj3BAsIJIpQ+juZ5PqFngoiMdJEv0hac=;
        b=EKZqC8OYEZl2eu43qZi/HRDhYBAt6uqo9Ugk5F7rxniWzby04MpazuVrP+xXs9CUN1
         a0fZxb8ySdNcmV4rj5AJ1OlxDnsMfdrNp9DjhYhTd1xNNi5usgnHD6WyyNuamv+mnDnN
         gFG8J9Gkq7HjvCIoKkty1SwXwDjUBOBejXlx9vz6b+Q46GNsPMHLmRAVtlGueBfCGn22
         R/GlnZqBevhv5fP5lL/K8xY48zrB24wP3zIs7SZVR7y1C1qTiwEGFMlej4KdwRhwx36w
         qZRAs1rU1CIWovdKrWyZhBppSvuIAVtZ7svxVaWTVumh04j2UrUpOzg8EDJZbEGXXdRL
         +eUA==
X-Gm-Message-State: AOJu0YzMd/+KoN/ir9zzvHnLw0lFC6GwaY9o4Av4XcUCohbJLhQIVe1V
	/l2hXmIVbQfXNh5bMyz3GxrHbWBpvfJ2gLZnl6vkBhfj2Se7RCdd/1DsSVXZkujBbQ==
X-Google-Smtp-Source: AGHT+IFtr8tPLlxe4AzE9S1JUVvrPqyWHnFA5MwdtS48wd3RFQvCTT4NKQGzOSE7PL2RdlkvdzSAaw==
X-Received: by 2002:a05:600c:5011:b0:430:54a4:5b03 with SMTP id 5b1f17b1804b1-4318c6e0175mr46337875e9.6.1729865588576;
        Fri, 25 Oct 2024 07:13:08 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:08 -0700 (PDT)
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
Subject: [PATCH 14/21] target/xtensa: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:47 +0100
Message-Id: <20241025141254.2141506-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RnkwnXXX3vVB

Set the NaN propagation rule explicitly in xtensa_use_first_nan().

(When we convert the softfloat pickNaNMulAdd routine to also
select a NaN propagation rule at runtime, we will be able to
remove the use_first_nan flag because the propagation rules
will handle everything.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/fpu_helper.c     |  2 ++
 fpu/softfloat-specialize.c.inc | 12 +-----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index 50a5efa65e2..f2d212d05df 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -60,6 +60,8 @@ static const struct {
 void xtensa_use_first_nan(CPUXtensaState *env, bool use_first)
 {
     set_use_first_nan(use_first, &env->fp_status);
+    set_float_2nan_prop_rule(use_first ? float_2nan_prop_ab : float_2nan_prop_ba,
+                             &env->fp_status);
 }
 
 void HELPER(wur_fpu2k_fcr)(CPUXtensaState *env, uint32_t v)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 8bc95187178..b050c5eb04a 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -405,18 +405,8 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
     || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
-    || defined(TARGET_SPARC)
+    || defined(TARGET_SPARC) || defined(TARGET_XTENSA)
         g_assert_not_reached();
-#elif defined(TARGET_XTENSA)
-        /*
-         * Xtensa has two NaN propagation modes.
-         * Which one is active is controlled by float_status::use_first_nan.
-         */
-        if (status->use_first_nan) {
-            rule = float_2nan_prop_ab;
-        } else {
-            rule = float_2nan_prop_ba;
-        }
 #else
         rule = float_2nan_prop_x87;
 #endif
-- 
2.34.1
