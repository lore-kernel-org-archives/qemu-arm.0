Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19635njj;
        Wed, 30 Apr 2025 23:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsD4Hw4ptTUZ4j8kLsy4VLSKtsPAl+OwCh1ih7K9bAKvzIrdrWGNI4nPmv46ppuqL4Bt67mScaY1P2fA==@linaro.org
X-Received: by 2002:a05:6a20:2d1f:b0:1f5:80eb:8481 with SMTP id adf61e73a8af0-20ba6ff6b89mr3069838637.13.1746080651489;
        Wed, 30 Apr 2025 23:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080651; cv=none;
        d=google.com; s=arc-20240605;
        b=BOhw6j3E8J3OGrBK6T8qXUtLVO85IhclTwXssmXp6m45fQgVPLXERl+yuWxx/3Npbq
         fqnC2EW75t2PP4VzU6y0ZA8av2E2WiagPXqdVbGngWPOmIQs5TU+egAOojNkfjozrq6X
         FkwaFQGadjD09xg0yGwQxjUCj9fEYQxFYIB6PWs9Cv+KpJzsSQ1/Py1eflz68+fjIkLT
         AWGuSGbQhuGeuR6aV+BZA0QGdht7MNCZYTABvRp9Efb1G19RBjQNZ8UTX2Io8TrnfRW/
         XXifyLdaxcw7pDt8eWHlnu8ckMYFsh8iuCbblQWVK6Q1uMaUZdAGuAHtqWPVSFxPvljK
         hllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mpKaNGqfmwNtM4gHQeVcm0rmbF9SUIpTKwfANCDu8Fc=;
        fh=GR5mtjYwXj94E7BqKfWFTXDgviRrpiZlRPTyFPPp+D8=;
        b=OaAuAin72ejHUs3xG67b44ll1yQwF6Xl/jKpGT+LSD9CvtRdu6kRgzncxLM+ISlSEb
         /5ueNL2wTHSo/X1xiM4u88ApUKJFG9zevn/IiBxQ0gTGrKnw7Z5m+MYjvsbeOLckG4Z5
         msLgMg+mxALSMg3TFY/Jv7mSXWsab0b2KZejhEsAX2SPGbAoQNwT2Q81cIs1fXLhvQ1b
         scHujpE20EaKXaT+bWfsOIXMcy6swYsqo7czu0IK2q3h662qxirGS9NX/fVCkwUJVPtD
         QqnpaclN5iHKHANfHwfSNBasYsG2hhi2j8elmclICCqakwh2XvKZrOB8rFrL3WBF4KaH
         l2FQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+59rpkJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9b325bsor121298b3a.5.2025.04.30.23.24.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+59rpkJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080651; x=1746685451; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpKaNGqfmwNtM4gHQeVcm0rmbF9SUIpTKwfANCDu8Fc=;
        b=H+59rpkJPzWVeNMDodO/pqnK1LEESRd/ohht5r0Rj/gfE0rE3Gcn6cmFhSeyOkpa/b
         RbmPkS0Fx82ZK9/MpvMnIfgThmpNEVBp5UVupElxbAyX2+eLSoPYWOF3dleSIRTzcGun
         2YYjxwEwz95QRvOsQNPDqkDTC/qUQZKXZuXF7i0GR+ETijuNMDSfALbfJ9sdEBr8Hr5/
         bTUTBmuvx/8c8PPR5Z4SNe+hJEIaR5FVNEWfdXeBSm43NtrwIpJqXnHqgA5FAH+VOsEt
         QqZT7FXN+D88/bkI1vpNJNwgAkwHl0PI1mjAu+glUvTsTQYB0eA2okBDhNyBmjNYw3DH
         uVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080651; x=1746685451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpKaNGqfmwNtM4gHQeVcm0rmbF9SUIpTKwfANCDu8Fc=;
        b=ZJzr2riQn3TLRQgZmWYUhQ1odO9akjrnIhF3ysbTRO+YmAP/s/yL1+sVJKsgINAZXM
         JY2nRk7cmuR6m4w18seUESt2s5r7r9NGPAB9i8q80BSDxR98K+AUsZC4di1kyBdkoJb/
         2uQtT3v0sEuge6FM0DNG/PsvajlaM9l7VWj6gkvU1/61MAkd9NU1WCv15zjZQITz0g5N
         WHme+R38i1mGTbBn/y+mol92uBKiNtNiMaeO8V6GXLgDecE7og23wTa2nERxCY0DbgJh
         5mGcRacvGwKxJdr5Im18S6NiHqQyecqyaROny63FLdwOH/SHJR9uQbzZ7LWpCuIe2s+j
         ldhg==
X-Forwarded-Encrypted: i=1; AJvYcCUo3ckqhC5qxNr+lErKwYu+nKEphmDZuG75987BAwxanF3KftX7JBRqBEE456g+9QWyeNAefQSAegsLqA==@linaro.org
X-Gm-Message-State: AOJu0Yx1TlcFhwwZNJBgJJJc4D2ADD53p/vJ72ju/sFJwzGC1gQWrXnN
	TRopGBIcVW62Fpehb/PkI1Up8Nw8nBV4kbzgt4UDxNeqjIOlD8ZwjZNPz7TA8Qyt/rb3VB/M7Cd
	FG3M=
X-Gm-Gg: ASbGnctOAAGfQZwvVxovxpc/BbOdv5lo4yzU1hCZhiX6VNu9CvffalSLX24Mz61MA2+
	UJOrYAljZAzGZI+oAYurqsqS1C4xk9rrkV/EnPWuMiSOHi3mQrkFk0+LDsskF203Y3+ctUnEMlT
	Y4ha2w5Fn7RwGJGl5kgF6w8g85fpU7RUAg/Yc/GjAzUI6etJv2OmFffLQqEVfvdAv0E0YO46Z0K
	h27rCd7/Pym24SILKojXVkiA7UWgakvuu+nKuVxZ89AQKuPb736bT6D4aOXkaVNbfM6FH1MMPW0
	3A+tkyTUfo70zkqjEIZMuSfWcLJghdUZiiofGFWi
X-Google-Smtp-Source: AGHT+IHWmZFe0mwWyFeKYCiS49H1f5jxhNRdExacq+/xBeP9espa19f6AzO9WL3BuOcAYk+W5kolRA==
X-Received: by 2002:a05:6a00:84e:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-740477a3268mr2817241b3a.12.1746080651095;
        Wed, 30 Apr 2025 23:24:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 22/33] target/arm/helper: remove remaining TARGET_AARCH64
Date: Wed, 30 Apr 2025 23:23:33 -0700
Message-ID: <20250501062344.2526061-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Gp9D+tOK53kP

They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
we can expose safely.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1db40caec38..1dd9035f47e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6566,9 +6566,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
-#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
-#endif
     }
 }
 
@@ -10645,9 +10643,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
-#ifdef TARGET_AARCH64
         aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
-#endif
     }
 
     if (cur_el < new_el) {
@@ -11552,7 +11548,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, vaddr *pc,
     *cs_base = flags.flags2;
 }
 
-#ifdef TARGET_AARCH64
 /*
  * The manual says that when SVE is enabled and VQ is widened the
  * implementation is allowed to zero the previously inaccessible
@@ -11664,12 +11659,9 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
-#endif
     }
 }
-#endif
 
 #ifndef CONFIG_USER_ONLY
 ARMSecuritySpace arm_security_space(CPUARMState *env)
-- 
2.47.2
