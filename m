Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086196njx;
        Fri, 25 Oct 2024 07:13:12 -0700 (PDT)
X-Received: by 2002:a05:6512:3d0e:b0:539:e333:181f with SMTP id 2adb3069b0e04-53b23ddc8ddmr3886049e87.10.1729865592581;
        Fri, 25 Oct 2024 07:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865592; cv=none;
        d=google.com; s=arc-20240605;
        b=lsXq3REky3zRemC6jOb+C6TPUOBUK5e7p6tlgwSNQ19fcmoBUJerNR2YFehd7+2j6u
         7lZW9CBb2iFKZcLQWolw/OKM3D+b4zUlBOnLThPdz3/u2zazG9mxa728RGRh8V165bCT
         bRQ3zqs4Ol/Uv0Uxw5fCj6/cGC/16apYny7oDXLFI/Z01lTdME0ovAIJtYBXhDDx16oO
         V6gPTS7xS2F7HRQe3Rqf6aWh1AeDiFqhz/+nWbbSGhKvBNL6rRnx7hF3pYPB1F9m6ePc
         biDqIYNB3tTFdbdAA+mkak8DDvOAnvdDalH/tWdB0yZfmJUOdm4IAe6w6GkPYfcTzsf/
         o+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tMvryF9qkcHmjr/I6qQdi1be4a3BwpUnonGBJuEa1aE=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=LzSX902/6ozbiTVACu0efaS/dICgqv2DU43Yxn5yHFEk8hQZVJvjNGn7lgRuqCsu79
         hcnm+7WBy0/th+L10FLvAMoU0rNLMm/WCvJDBDcQ7+w/7L1j/6nYlx3nFiLZW4Q3KNg2
         pVLcMVg2UeCUwOH0J++Oq8XxI8glPfS9fs0viq7iWQpLk/Vn9DVzS5+xbqYTSJpuhgrV
         XpJg1sWI+rYzGdXNWwKuFZyrJEkFDNLvXIOU3EBvvnMaeIMBJRz1q7PWfVES+Pi9drTK
         FzWxpq+MaTwzCGszdNSoq/wcZCU6Jp18WWBfNfUxaHf6oOc2v6sMAmfD4l+uAe37/w0b
         qGmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUGrZTQo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938f6c46sor4566825e9.6.2024.10.25.07.13.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUGrZTQo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865592; x=1730470392; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMvryF9qkcHmjr/I6qQdi1be4a3BwpUnonGBJuEa1aE=;
        b=pUGrZTQoF/UadGxOvVIBy0mN6Qvb76ONdG63uFuRPzlaSezG198iuT171F4pxOzhmr
         s6xRMXgnQRkJGmcoPCuxOtW4IStMRe8/r9w27xnc4w3SpvKQM93V6JcAvl4cx6UjMnMc
         Em+tOSTbKa8GGvEgxDOn5tZKRlXRsDvnpcrta6q7Z/ArEGKVWiUXx39jpmqDcgdWVIWA
         JjV1skhztWQYGT8JcT7dHEuj98yP1OdEG9dg6ej7HhqnoyhobW9Y60WaU7Lus26oS+aD
         p31txw0qwurfU/YyBIsaST2vJtxk4UUy9OfHw0V+kEnvpkCdoDrDCe5Ae7Itmj4Kjpb0
         AWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865592; x=1730470392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMvryF9qkcHmjr/I6qQdi1be4a3BwpUnonGBJuEa1aE=;
        b=pqHq8sWPI1f7P1XxyT66N72MJY52eSk0hP3WA40iNpUf/Y4FxvGCXPmcsLQGun5jzx
         n4NidXj6e118NgRSTYjtlGVcLepSXHeEUy/V+iS+t5JYtK0oK2D1XyeSorHXDcl0XKXu
         KUKdrxZvtca3lUeI8nvU9tPrudM3wKlQPmAzH6ZMyxqwDdkO/1SQXcEXPbxR7RAgTrbl
         DFPiLK4TGDHN8FUB83P+Fz1m+kI/phQ9g7bLmpy2rdA61+QWuLoCMykp2V0leaeL0hW8
         OskNlpWVLOQmKN9AfKDQ3dptoId4q+MeGspNkedA3RJIdkX5obvoZ+AJmqXusLWgS51a
         nDkg==
X-Gm-Message-State: AOJu0Yw+hEP6zFjTH6fTlvEJdSNW+WZdKjqiNGGmmwMJPTguq14NCAeu
	SbgLRQtZkV8a/ICG1h64fI3wJKfb2J3AOFbklzVVDIjV2K/SqnNdbFZdB4ZLq5VxoA==
X-Google-Smtp-Source: AGHT+IHxNq6/vkQ2TaPaeuuAkFK4+FFHuybPNerZNA0H29NUQ0TotXUp+CFWvnyAmdoq+Iu4Dr5CZg==
X-Received: by 2002:a05:600c:19c6:b0:431:4fa0:2e0b with SMTP id 5b1f17b1804b1-4318c754b24mr47132065e9.28.1729865591969;
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
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
Subject: [PATCH 18/21] target/microblaze: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:51 +0100
Message-Id: <20241025141254.2141506-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tvMu8qi1XvCy

Set the NaN propagation rule explicitly for the float_status word
used in the microblaze target.

This is probably not the architecturally correct behaviour,
but since this is a no-behaviour-change patch, we leave a
TODO note to that effect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu.c        | 5 +++++
 fpu/softfloat-specialize.c.inc | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 6329a774331..14286deead9 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -202,6 +202,11 @@ static void mb_cpu_reset_hold(Object *obj, ResetType type)
     env->pc = cpu->cfg.base_vectors;
 
     set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    /*
+     * TODO: this is probably not the correct NaN propagation rule for
+     * this architecture.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
 
 #if defined(CONFIG_USER_ONLY)
     /* start in user mode with interrupts enabled.  */
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index a5c3e2b8de5..40cbb1ab73b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -406,7 +406,8 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
     || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
     || defined(TARGET_SPARC) || defined(TARGET_XTENSA) \
-    || defined(TARGET_I386) || defined(TARGET_ALPHA)
+    || defined(TARGET_I386) || defined(TARGET_ALPHA) \
+    || defined(TARGET_MICROBLAZE)
         g_assert_not_reached();
 #else
         rule = float_2nan_prop_x87;
-- 
2.34.1
