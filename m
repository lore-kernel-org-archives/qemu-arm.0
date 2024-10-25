Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086038njx;
        Fri, 25 Oct 2024 07:13:02 -0700 (PDT)
X-Received: by 2002:a05:6512:23a9:b0:52e:9b2f:c313 with SMTP id 2adb3069b0e04-53b1a313464mr6260218e87.22.1729865582339;
        Fri, 25 Oct 2024 07:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865582; cv=none;
        d=google.com; s=arc-20240605;
        b=dLNJu8rq7VFhkJZrfGsnzHCpt8pSKmz1SCJhWGuXEjRBIEICdlx3zz1akT+XCgIG8/
         obEXldu1tTLqNas2+3+6cKw9I123FduZOt9sgjuPp08FsWYs7nOXZua5lXH3Wtne7479
         uSaPL/AjnbT3CJ4JgfepXcuMLzErh+jfooEM7Y16MpWmmKmTmnizcBQrtcE3wnuiv9Be
         EFjfXhIzLyi/f1Bf8JZLnSFm962XWnoGutMfVLPcDoxV3BON2EY4FTzd1t5CZyhAeuIa
         Bzvnh0e4HmBc/izQ59s/0wFYlwe+ztBHCeyN7y8U7i5RPRb9rGPQfSLTb1QeZCjSOueU
         yEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zz8dlKtWuutyQ/7iCySTdzhMOZ3Vcdo7OJOwt3HomLY=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=S+3Qy0OlQe0xWrL6B1QPVwgTofLRwGvhMbgae+mFEJQPmFeqw6XXOacwNGVrnPfMrU
         /syzKNR/W9k+5EcKD+unWPJJR0AakDBaiySvRWDdOrIwTKY99Vg/5UJp3McDxxxqw3tr
         cQWOtrhy/WarFwWWYKLoSK+MyN2BsPrZf1gH1EFgRS0I2Uw+4MqIgvQ4I5Rru/mjOx+h
         QFSSD/50Ujk9Inf/g6g69Y3qxvgNuWFiQrRywd3Hu8b4APWzP5KHqbXw6FOzKS9w9XK4
         C8vim82a9ytz1gK0bhtS6qjPL1XZAbXAnoJSv0YZUW4rzRa8H/FjkE773Pp/e927BmSl
         dMnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIHne0vw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53b2e1096d3sor386729e87.3.2024.10.25.07.13.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIHne0vw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865582; x=1730470382; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz8dlKtWuutyQ/7iCySTdzhMOZ3Vcdo7OJOwt3HomLY=;
        b=CIHne0vwtjZ768mdfwbHON/KijpLHXK/fEh4l/z9D3ItuMrHouDy1yWgBhHPmEIzhj
         Hmr71wsbhBLRABZCZywUo1/zztNLk0FZKLD2xzDt/irXkaQ06xewWWdqP66j6LCKVxbv
         c27eTN/QdXyZesxetaGelwqVL/dof015gchnfQZYXbqR9+9qu2NeaNBCji6xRU//m92L
         dtN5xyXec/g9imRqqZvVbg98KtKNOjEXSaRvzwL+7nMznkBbcXg1ZPh6MxW/xG6iVIDR
         1+SmxoW3u8bgNYse7aZGDMRM++6DJwL4yCLWxGHNPySw4d9gtfvHL2HaPooAt4qzShtd
         bTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865582; x=1730470382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz8dlKtWuutyQ/7iCySTdzhMOZ3Vcdo7OJOwt3HomLY=;
        b=kqEAXhWRqLxMXVnfBxKoy1mV9XZLbExp4ffnODfN7PpkwCCndtq9WSy0aiHuQq4sLl
         GSLn2LNptcg8bPWktliEccyHXXrLbeEuN/Xh3wk8qiOatLIMmu5cQHJZr0xFP9LXh3mB
         XagQXXdGG8bnESBjUpBRPZ8c/awwuJuERCURtIEv3EhH0yZXiFtYxQ8XuVood0bWQeMA
         6+jx7F3j3Ui0cwmRN91Y0WEMWpF9YacXZOdHwJZyu0kQaDdQOGpHfdCZeqz/dga9ijYS
         QgpYFLDWkt8D1BgfZDubhjAgM7zJp6JT5kFlXuCSA7wy500RpOcevUYUy6EIjBt4Nnqe
         pMuA==
X-Gm-Message-State: AOJu0YzeU7CfbiNdNgfjs2FsLcTw8siVGJxK+gGFQw1Q4liqlOE8UXh4
	lqI886l+zkIuHYgu8/CKPUNzHCn0d0XNLIWsbSYBfJzQVSV0jr1kv0aAW8DKjhWFkUgOjby0hPQ
	uyL4=
X-Google-Smtp-Source: AGHT+IGLCvNrSlGLRK4tTQGeAufx9cVAlqWidYJfC1pDKzhqcf51xyMqLj7Hu7WTPTDCJTjWqk7VCg==
X-Received: by 2002:a05:6512:3f13:b0:52e:9cc7:4461 with SMTP id 2adb3069b0e04-53b1a2f5445mr5904378e87.5.1729865581703;
        Fri, 25 Oct 2024 07:13:01 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:01 -0700 (PDT)
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
Subject: [PATCH 06/21] target/hppa: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:39 +0100
Message-Id: <20241025141254.2141506-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D9b46qGivtbx

Set the 2-NaN propagation rule explicitly in env->fp_status.

Really we only need to do this at CPU reset (after reset has zeroed
out most of the CPU state struct, which typically includes fp_status
fields).  However target/hppa does not currently implement CPU reset
at all, so leave a TODO comment to note that this could be moved if
we ever do implement reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/hppa/fpu_helper.c       | 6 ++++++
 fpu/softfloat-specialize.c.inc | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/hppa/fpu_helper.c b/target/hppa/fpu_helper.c
index deaed2b65d1..0e44074ba82 100644
--- a/target/hppa/fpu_helper.c
+++ b/target/hppa/fpu_helper.c
@@ -49,6 +49,12 @@ void HELPER(loaded_fr0)(CPUHPPAState *env)
     d = FIELD_EX32(shadow, FPSR, D);
     set_flush_to_zero(d, &env->fp_status);
     set_flush_inputs_to_zero(d, &env->fp_status);
+
+    /*
+     * TODO: we only need to do this at CPU reset, but currently
+     * HPPA does note implement a CPU reset method at all...
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fp_status);
 }
 
 void cpu_hppa_loaded_fr0(CPUHPPAState *env)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index bbc3b70fa9d..4e51cf8d083 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -403,9 +403,9 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 #if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
-    || defined(TARGET_LOONGARCH64)
+    || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA)
         g_assert_not_reached();
-#elif defined(TARGET_HPPA) || defined(TARGET_S390X)
+#elif defined(TARGET_S390X)
         rule = float_2nan_prop_s_ab;
 #elif defined(TARGET_PPC) || defined(TARGET_M68K)
         /*
-- 
2.34.1
