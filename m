Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086069njx;
        Fri, 25 Oct 2024 07:13:04 -0700 (PDT)
X-Received: by 2002:a05:600c:1390:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4318c703d37mr55605715e9.16.1729865583982;
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865583; cv=none;
        d=google.com; s=arc-20240605;
        b=DDUpxJfuzLvUyZ9d8jIOHelX26bfBt2ussFm7XwIW1ECNuaVwtiFRumpG/uD65D2xt
         r7FFcucvMNgovI4y0Ru79gkNB0q8IuLXxEL81BIUT/1+rfrb0kJvP5dsqUscR5In7TAF
         MBFIIf8y3+jjmT202BwD9mU9FH5AMoabgmKqCI2lSD2s9Bg1We48r+OAwGPtyKbRJh6L
         P+PXJw44Ymplso6LOiVntiQtYIsEy2zD3j9vA3j475VmZ1qe0pg99239TAVEIVsaX5Vn
         PlXyep/vihD4CPx99QwbZWCgiZI8TCFakYJf+dwSeDxChUCFb8QsVhCt6M5mkYHRP1/7
         lqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+dIJNAUGIBKPluHUtywmy4VA6hHxALG+WEgmCVMe7gU=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=OTGtxkPwihJK7mnl5aGbpcocNxsugoa0P9XcMWxhUNVcB71LhdGKv/GjvOncq3Do8t
         uKUqH9gS0kRWauHu04HMIOwMf04x/0wi6bHhLAVxEBV6DF4nOopxS1/aEwsdLnogAaYo
         iF/rTQPtlw2PuF7Qdwcu4Er/bRPiYcHyAMTCoC1GajWztmenswbHf2b71EFOwh5C5AXM
         Vr/B0nqyDg8MAm4YkQ9Q4aj6PRuaPXftUPrsgd4C1JilSfyosEV4uKdTaK4/hFBUvEO/
         2nq9/OF5xBu9r7aQiOvfS0Xul1IwaDn7qv1kfGRtPNfjqBQvoGiUj/jxoIXmFglr2VL6
         RmUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yBrAqkQi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431939101b7sor4705165e9.6.2024.10.25.07.13.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yBrAqkQi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865583; x=1730470383; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dIJNAUGIBKPluHUtywmy4VA6hHxALG+WEgmCVMe7gU=;
        b=yBrAqkQicMPPyrEq1cbfDPDcdSh32KgdwD7naQlbdNU0tKcUyTwUeRuQxP+pe1y+Nv
         T1X84iVQxBSFdn+TQEDznlf5XVbeOJuu9USmCv+ROuj5nUY97pCAnrhsmQzq/kOtpTp2
         ZL1mCSrDLE8yrUM0Jz5c3dV1+sYMkahCJcy9UvMwXobvZ2FbBZW8dOL0TPYn85OmWkZo
         lXXha9BJZnxKR8Rpx7J9DJt5MeqdugwkYdddM20iZYZw9rZ5tHQ2HIne9rPl3AB87GIQ
         AtuehHmWx+lRjZEy31JWrnJ08zt4QvNZDsp+xw+tVcJEjJgdOVLkamzKYWczlRpHjd/r
         hlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865583; x=1730470383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dIJNAUGIBKPluHUtywmy4VA6hHxALG+WEgmCVMe7gU=;
        b=ayhZ8m+ZCyR2SFT0Au/IcWHb/hw4AFBV7FkaYw/YrmNAAlOE+QXSISi6EMCuB8Ok1m
         7UxyxWVpKK15Md/lSAzciuL/ZkQP1d/EfnEMMgg5KiyQQJaZC3B3dnSpOzqJ37zv6VmZ
         I7BIyRVE74njrbJJ1q4h2glgTC3BmyLY5N9isiJszybGknxTCy81B22+3hlkrqzkwktz
         ScBIds12eTYU5PNJ6D09Q/ZKAHrAuIVT1IJt3dxSZ1Er5wj7BwrwLM6xHQNAkK6kw4yU
         ILRX7oLtb6eL2wxludUr2TpKIokDFQ4LLcSjL0CjL3kJbIUP7tBDmEaQWGALQOkSDlqI
         82ig==
X-Gm-Message-State: AOJu0YzSS0fylovg1uOz/dmZmQwaOoqjCXlDyBY1Nsu9WzJk5rYZ8ACf
	yt64A8aC9OovgTFqWBfIk524NmWcfz91nPaAb4+dkuDhy33KFJszLYwRik2CeRYm6Q==
X-Google-Smtp-Source: AGHT+IFcA8oxoQEOawvv97SeiVR3If+e/2yvc0iinLIy6uEef3JELIn/jzXfhO2X0gtQUx9yM0jyIw==
X-Received: by 2002:a05:600c:4694:b0:431:5f55:28ad with SMTP id 5b1f17b1804b1-43191349709mr34138735e9.22.1729865583374;
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.02
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
Subject: [PATCH 08/21] target/ppc: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:41 +0100
Message-Id: <20241025141254.2141506-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WC+r5OpNysHj

Set the 2-NaN propagation rule explicitly in env->fp_status
and env->vec_status.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
As an aside, it looks a bit suspicious that we set
tininess_before_rounding on fp_status but not vec_status...
---
 target/ppc/cpu_init.c          |  8 ++++++++
 fpu/softfloat-specialize.c.inc | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 23881d09e9f..5c9dcd1f857 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7326,6 +7326,14 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
     /* tininess for underflow is detected before rounding */
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->fp_status);
+    /*
+     * PowerPC propagation rules:
+     *  1. A if it sNaN or qNaN
+     *  2. B if it sNaN or qNaN
+     * A signaling NaN is always silenced before returning it.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
+    set_float_2nan_prop_rule(float_2nan_prop_ab, &env->vec_status);
 
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index a0c740e544d..8e3124c11a6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -404,15 +404,9 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
-    || defined(TARGET_S390X)
+    || defined(TARGET_S390X) || defined(TARGET_PPC)
         g_assert_not_reached();
-#elif defined(TARGET_PPC) || defined(TARGET_M68K)
-        /*
-         * PowerPC propagation rules:
-         *  1. A if it sNaN or qNaN
-         *  2. B if it sNaN or qNaN
-         * A signaling NaN is always silenced before returning it.
-         */
+#elif defined(TARGET_M68K)
         /*
          * M68000 FAMILY PROGRAMMER'S REFERENCE MANUAL
          * 3.4 FLOATING-POINT INSTRUCTION DETAILS
-- 
2.34.1
