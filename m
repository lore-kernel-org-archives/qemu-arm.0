Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45145njb;
        Mon, 12 May 2025 11:08:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV48p6jalhRX9q7FZRf2fDiCWaNj1fmrolO4SvaX0bcaVssgQlzXI6uIT/TO001LCPjPxrclQ6TT0AvlQ==@linaro.org
X-Received: by 2002:aa7:88c8:0:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74279044a66mr489787b3a.11.1747073337076;
        Mon, 12 May 2025 11:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073337; cv=none;
        d=google.com; s=arc-20240605;
        b=GmeTSVwHCguAO+iapT15hONE6hUyzvgfznnBtqKWsnX4MhpnU/0+NzrQ9Z1uUy8D+2
         OiBYzeeh/sZ4Z1TXvKRIWErKjdmL+Pn6KTKN4EUofx7V/fk53Po6W4uLv/XqMX4joizI
         Iu+r0Tufqx+bldBbKFw4LrvKVhoKmeq/b0i910xhlaNS5seaPUGHfGf2ZyrGMwGleqnW
         BbFgJM39fGDVGtWoKCK4D2ymuXB+5JjN2dp+B+tykWv0Z+4HKnHVRv/rRpoHKvlhZvJ6
         Cik5q07jBhselAxXQF6qqKHgRjzMJ5xItn6uG3tNX3P1qCIF5Y6x3ZAEdo6gxpxNyCzX
         jP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A9pY26zaQMqZMR17IM27tzI2vbhn1j1ig8REcOyHb8s=;
        fh=P5sqOcDddtOzYv/rlS3129Ex708cVZNImEnVQ9r6VN4=;
        b=LSDpZb+ajMN2lB7gxH66wQ/Ea4NegW86fhEZN+LgJv5OhE7qFF+GUQ5x3rNHcaFphj
         sjIJMSrX1vDmWb+I9ANnT/HmJOYnw0PnaX11aiTmPcg6Z3O9nwW+EocZJAKvMwPOaQSN
         AvOz4hg7r+1gnbIG9LcYmJSFHRQ+vstz8mscpo3mnF0vGxcG1Yj3ZBQBrKI1B/Z4Va/r
         wepLA0XQeJcSLyO8smzXWaMNZXnMBClvIPKHAp5O45oSyHsbR+tp92c+K/L6nqmraX/W
         jbvgkZd8iOQQ5sLo1cI6JkMUYvLgwVTqVq88qjNWPQOAe7l8S5fVcbfHyC8MXJUouIKp
         +WjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDFHZGLr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237dc4f85sor4596094b3a.5.2025.05.12.11.08.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDFHZGLr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073336; x=1747678136; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9pY26zaQMqZMR17IM27tzI2vbhn1j1ig8REcOyHb8s=;
        b=lDFHZGLrh3AS5g1J7r0FOTXUS7A5KlSZF2VLZsOr2h4cY96ihzM4jUi43B1gtOtJX5
         NrEvL6mSmzs48f7rWDMEZp737gPnPdgdUt5PRrcLyut93qLEwq87DkvCMc+YhXpskk2R
         pz8/5PwozgYeUM/XhJzjKNDkQQgted6Fqr3cNwRizqQEzNQdnnZZWD5s+vDcmnYcEeZs
         O3TfDzNHh3/QouYa+VFsDCoFgzFb/ylOJ8qerCjjfN1SfVQfMy3k5sp8xjozE0HF+GCU
         rqMUtTW1Z2Xmlt/uNJZ13wsv71EtwDeac3CJOThkBfz9BQaQYfPF36U6lpKPkHlyUK+4
         gZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073336; x=1747678136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9pY26zaQMqZMR17IM27tzI2vbhn1j1ig8REcOyHb8s=;
        b=ihOx/fCIsPNxUQuUyLiytB+3rNYKrLw1HaDfeXW/YUFBvoozL1G//aIl3xVDhiIwy/
         AEIXMJuMxk4ZcWOrz3nEWAEHUcTomVTzBa8aBV+JtOgpTr+lH2I3NLbpo68ihheVtsug
         JbzR9P2ui9sf+JFrRnUeUS+rxyzR9PBZp8Bz+79MK7GIkTeYVZUE9Jw8ffSP4smm7/Y4
         MwJYbRMk7UNwdU95mEKHTy/V91DIQsBIlyzicDZnMy3tzsmR0JqIBc/e9pvW9nLqk1hh
         8TZlLM/EVYMbjjj9sR0c253lTvaejC4oh2T/WGoSPZCZFcs58XhA8lbnTtJ3V+Hr0grS
         CPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOffZj1+qfagscjxsiI1/NLYgknGDzwFQieuSNPqUfBJYywsd0DMZ9Qy2m0JXuKZ0OjCnio/msnTD9ow==@linaro.org
X-Gm-Message-State: AOJu0YyF8hX6ZNYRkDR4i9uYQdJIxA6I259JMEVFexoAnZi0VwdhFlsm
	Oy3hDCzDnQlorS8HhF9UKkNMFNzKOdsmj6XfRb2oHXpjgcpy35peqRLixGyGVXgivA==
X-Gm-Gg: ASbGncvXlJjHuLeTwoYTOGBzcSMDLI43LqSfSo1cFLfogdqz9ZcagPKcVxyh2tNBYox
	SKQE9PETo9iekaelGDasVxAox1TgxpXy72N5x9XsCaeBngtTpOkqCvuS7wq9bdta55owJ6G0ouX
	sVszd0Cc56oKpIIeICJudQZcFZheWhc5GMkkOcRXsaqGI8tggZhDMA1DHWK28ww50Q051vKdYeE
	r3+wtbC7TENbXQxE/8OLToehIKg105FcONjeOYsRCWcjT1tD//DGlMGAZCJ6qSy6bHRNchBn4dI
	55EyOKvVc5p7NZYtCmTil1EQ210ZXURx46BZWM8Quo7mGdttUew=
X-Google-Smtp-Source: AGHT+IEpgv+2XV0Zbgxq0jroyNZr0Hhc8tUXZJKtGzmiJs+oD+973KGXRHevMub/LwmkpCtxJP8WNw==
X-Received: by 2002:a05:6a00:4d8f:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-742791784dbmr459306b3a.7.1747073336612;
        Mon, 12 May 2025 11:08:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 45/48] target/arm/helper: restrict define_tlb_insn_regs to system target
Date: Mon, 12 May 2025 11:04:59 -0700
Message-ID: <20250512180502.2395029-46-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yivqKw7OObes

Allows to include target/arm/tcg/tlb-insns.c only for system targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index aae8554e8f2..76312102879 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7764,7 +7764,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v8_cp_reginfo);
     }
 
+#ifndef CONFIG_USER_ONLY
     define_tlb_insn_regs(cpu);
+#endif
 
     if (arm_feature(env, ARM_FEATURE_V6)) {
         /* The ID registers all have impdef reset values */
-- 
2.47.2
