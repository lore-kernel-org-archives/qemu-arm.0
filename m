Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086058njx;
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8e:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-431841fd6b6mr81715275e9.8.1729865583079;
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865583; cv=none;
        d=google.com; s=arc-20240605;
        b=fE7zxdXKE9MHUcvNWZ555kXXtB6QB2CjEuMyGUWA1uDuojWZIRvQy8Bc6b/e7T8UZp
         K28Vk7Qa7kXBOeOs8sau1xNyfE2q8SifWp1iwITH688CjJId9Cl3mB1Zmqvx+iJYgIM3
         GH0aMobeXMCs0UenAQBTR6xwLICiNhBijMM5zxtibpi8lzMnCp3YDz1WveM+pHo9I8Lc
         TEOvzTJBvAha2MSlZNPe5e1MixIWmKAxZQKPdkqwhlCUsZ0vcUZG+0uFAJsImNWAD/h4
         7VW189iucJfp7jbpFUdjPPZLjef2N1ELf4nex0up5PvyGMuyvfftLCC4YUuBxmgGXYK2
         9D/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ixfMug0zlUN7NkGJexyOs+kqoUuLgEjdmFA8bPjqRvc=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=O2Lk8yiREOyktCK76pfpnxdDADtTR9CRXIbCiJQSPrR6zzl6SEFlfnjnADbYg9Gv4W
         KgcVHqPdPP4Ote2PIZJthKLiPT+YR2iTRP9BMIgncyNuhhmi9jg7HuK78LY76qGlWkhK
         1ljm/6kvoZQTD+9MA9rvvSXWAMBqVQ/0I/cCaycemgD1oWhRnRay2yrDl3BKwpKexGUK
         OyN47xNOoNqUy4skpULAsyPm5DrIynseta1mBPfyp1epl5gFnl2HBkepKZKdC9k18hzb
         uL0wNSl4RNVI5pWqRJr1Oi2Sl7ql8bcLcpxmd31k5URqyQaNNGMPfif/+8uLrB7NRotM
         wt/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LD3GFjzr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319383cb1esor4690495e9.0.2024.10.25.07.13.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LD3GFjzr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865582; x=1730470382; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixfMug0zlUN7NkGJexyOs+kqoUuLgEjdmFA8bPjqRvc=;
        b=LD3GFjzr9kboxNGt90qrZLnn6P173uTGYhy8joAeGKbEbWk0RbS1MiqC4ShbsM+77s
         eyJjMR1oD1dq+tHRDQT9R7nNO+oDtp8A+xADxi3UhlBHZHlpRkM1XH5t3RcnLpMv971a
         d6VKJwJx8YiRRsZ11Cfkmy+LrQ8xL9sPi570RiyvK6qsJCKFFd5kXwyRtbvysoVpDBGY
         Q0YE1p4pt8Zo66UqRl6ssppt00YMqUDbcT+pGlcMUb4crhj/PvoN1o60PUCIHzKSnrIQ
         EqEsSeKK2F8+kfWjaTB8IcJX6qOxs80GAoFYayuI0/N9X1eTSAiy+6TwznW1DZMKnD8U
         SSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865582; x=1730470382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixfMug0zlUN7NkGJexyOs+kqoUuLgEjdmFA8bPjqRvc=;
        b=i5X41jPh4/QTKunsoRmon1VWplwOMqSifLqcVNBDigHOvKamYC3Y+d935UZS7gbqMR
         ko44m4kXQ5koGWMGWjJZT8T1AKKg88mJ1rCPCIs5mjgifRXlf768PqXqvG84XXgE1N92
         TgusU66YJhP0+wiyA9l8nG9PJETOELdpbL3fM/3AmaESVn6kCh91Jgov67SuYtquSUo1
         JOud13SWxNNKeQWpxp6INs+orAhAixb1VUjAsotTDxlhOChzk5PXg24b8icHpRbglGka
         DQWVhEVqW3GyP4gWTHyvt/lMLmy5qhwaiyDPBvuq/4PhcCOVS7ycR+vMEHsagPInI9AW
         KH2g==
X-Gm-Message-State: AOJu0Yx0I/eu7pUJ8dwxua+fd796ZGIvYngqQHbZXjhuczJ8EJanv4Y2
	DqCqkuYWl96fb+bGsyHBOg6UMeJE5LfNmBMRyjzTGirX14ucoMaggF79qBgUpoSIgw==
X-Google-Smtp-Source: AGHT+IH3YD/fch70M+E+aGPD2bCRvSqrnkBVacyWnI/TVm2I6n1Jd2xUh54yaxSRPHXLPNbPgNr4Kg==
X-Received: by 2002:a05:600c:34d4:b0:431:5533:8f0b with SMTP id 5b1f17b1804b1-43184246647mr93646725e9.32.1729865582530;
        Fri, 25 Oct 2024 07:13:02 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:02 -0700 (PDT)
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
Subject: [PATCH 07/21] target/s390x: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:40 +0100
Message-Id: <20241025141254.2141506-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5sHhcS/YfriN

Set the 2-NaN propagation rule explicitly in env->fpu_status.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/s390x/cpu.c             | 1 +
 fpu/softfloat-specialize.c.inc | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 4e41a3dff59..514c70f3010 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -205,6 +205,7 @@ static void s390_cpu_reset_hold(Object *obj, ResetType type)
         /* tininess for underflow is detected before rounding */
         set_float_detect_tininess(float_tininess_before_rounding,
                                   &env->fpu_status);
+        set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fpu_status);
        /* fall through */
     case RESET_TYPE_S390_CPU_NORMAL:
         env->psw.mask &= ~PSW_MASK_RI;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 4e51cf8d083..a0c740e544d 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -403,10 +403,9 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 #if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
-    || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA)
+    || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
+    || defined(TARGET_S390X)
         g_assert_not_reached();
-#elif defined(TARGET_S390X)
-        rule = float_2nan_prop_s_ab;
 #elif defined(TARGET_PPC) || defined(TARGET_M68K)
         /*
          * PowerPC propagation rules:
-- 
2.34.1
