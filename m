Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178834njj;
        Sun, 4 May 2025 18:52:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0lm0dFDU8ppxrqyE5yrR40V3rLSqc87BSPrwqFlItOaIGz7bL6Y7XpoO14zebZ7OFvT592e8mPTOyig==@linaro.org
X-Received: by 2002:a17:903:2383:b0:22d:b305:e082 with SMTP id d9443c01a7336-22e1eab5108mr71666125ad.47.1746409970674;
        Sun, 04 May 2025 18:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409970; cv=none;
        d=google.com; s=arc-20240605;
        b=T2JYRw+bVHIEvO8ZX89+rMx7vrIRufODgoJhaaizmG+fJCJZycBXAZ2oshV4X41DXD
         Qq28bBP65gJ0VY0d4o/TLPvj67zdq24HLGAUQ6p9AOWQuKW+x/5p1/zhhm3NleGAPNmM
         MqdW4ref1YM+M9to8/3M9X8GOqO8AMGESDvYpusVlC9nmw0PiLg6w0La222HA9i/RNtC
         IuHt/GKUHOPKssS8BZtJEafwbl+J94hBX6gHct4SgALcSM2SnUUZ/T0QIU1l/HNcDh89
         qpjNAEfDWvJd2nmD7KcmH1QodlEE29Qb1YHBO/rYutLhPTNUNqRo7a4PhHFIj31Ymnj8
         AMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Tgtkzpe8JxmQvRJXZCyTrKxE1atR2TmNo3Re2v0+pHY=;
        fh=LyH2hgiGKtPBYSIltVDendbMb1C5l8bZfFP+2cyyIUU=;
        b=D98IxfQAQ8JSic3C+gn0QRcAM1hzr3EdeCzg7Rtkh/icdPJYifZrdX3KWoz2lpKEfF
         /yDAE1fSgM0Z1xFBEX6iZa//9lpggcdBD3O32QSEJTCZBXXslehQs4BMJmQpnICd52I4
         BIC78/dtMCXPMlnFVFy7WPOUFASShlLmUEXEsnhXt1VaQ7+yQbr1DxlUOiiEbEWsG/SN
         tfvV8WVckqSjZ1sHqVYD+5CqKxwWuWn99SDQHGgfCnAcUy+Os63PEviYFucmUqgaxqWf
         m2JzL2+x9jhBooRytPgIrq2EMGvv//BSi44DxOqC39kvFyoon6Fq+STntueJ4ixYgj5Z
         8hFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPGd0XGC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0d83asor6629718b3a.10.2025.05.04.18.52.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPGd0XGC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409970; x=1747014770; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tgtkzpe8JxmQvRJXZCyTrKxE1atR2TmNo3Re2v0+pHY=;
        b=XPGd0XGCtM3+Odf9/EUmOzmUyRwM7fm6fnWi0u5AOMCv1RDi+Cf5OeI+yrIjQ28DvM
         0wIza4Eb1iVppDDMiOL1aUrCrv3ax3fK0yUrjTWTbP9WgaZI5v0UiVohD/3m0JdEQvmL
         4XqLuy3/qCUtoow1gU3+9HLo+vqfidkx/tGj9CDRDMGkVnF4o3pXnZYNYKmdxqyfvxhp
         WzynJKz6rulvggtjrXsc2l4E4ykxU7KastkKkNIj6KrR1pOBaDcfIbtIoidWmq6k3ZzT
         L0YxTnRN2l/Iq+M4g9nLzsZu38MI7izBt3/8UABe/AsOpqaOD3xHFOiM7f8bVh8PPlCu
         9WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409970; x=1747014770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tgtkzpe8JxmQvRJXZCyTrKxE1atR2TmNo3Re2v0+pHY=;
        b=t04MWoGScCqgqPcj0ttpR+OSN/eVphMjqx5YpZir2lu3rJp3iHQaRxTfqStFqz6Lrb
         nTXMyde+2u9r4pIrabgCd8FYtoLW5Khpv4fDGvTmkgkao0VULdR2Vod48N8wRvSE4Mpk
         cvrsvb6tDflpK7n+3iB3mV8LOA1Y4/Iqp71X2NwFEj9VN8ZkDY6SpIuxfaK+zUNHlWm/
         7vQWf5xgBEkwMDiIXVCjxDNNXQGN4UhJu30vF+7lqosLtz1jLNh18CgoD5IBTQmDx35r
         TaVVUtCpVZNszf9kvft1W0bUKmbr33/Q/zqBY5129MrPeAVBIl8jlmjmdyiwqgzUFUbt
         xtOw==
X-Forwarded-Encrypted: i=1; AJvYcCWaCuFYMK5uoJIv+AgDFZ2+ezHNsyyhWppBN3le4OFCKDSK4Dw29l5voy6WT5nQ48PHILYqsIeoeOAw1A==@linaro.org
X-Gm-Message-State: AOJu0YzQLP8hPiKgRgPIPCks6UtX7S39GfqfZcdsB2a86sJs8qVCl6Mv
	QMDhFH/6IobNo92APgJyJGLQ20J65eSX2ulgF0FS0BAYcaUVu0pldte/GUcBLA8ycw==
X-Gm-Gg: ASbGncvclLrlDiCaHo6Xu3Sj6+aow2LLaDwuO6y9ae7g6+seUPrX6A2di4Ny+LImpKZ
	3tZHPeho+zoOTbcCnE9jIZoLjj0NnIYCQ/1DgVWXaDujHSIgBEdco/WRJg4zZaUg8NTVfmtX4LC
	Vc1N26JqGavu2jv2Am780h9FKCxQZqiaTV0QsQgKhFds348DuHCKde35wvLIQPDxojXyQwkEk10
	M+1VXTTiwO7XYovope24cxOtqvvaSk+C4tCStmxJbOCx0FlNyfIT8mRc3n4FAgihW4Pm9j65X18
	o+iSSizv2HnnR2iSR5qp65kXtlSUeP4mLiO+ii4N
X-Google-Smtp-Source: AGHT+IGhu4YzGN/5F6xNrrGQWE7WcyTSjX3jY7dpyCfW22wf11Z/aLnaJEKYbWVBhB6LZTzsmoKOng==
X-Received: by 2002:a05:6a21:9189:b0:1f5:8d30:a4db with SMTP id adf61e73a8af0-20e96205dafmr7605597637.9.1746409970184;
        Sun, 04 May 2025 18:52:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 24/48] target/arm/helper: remove remaining TARGET_AARCH64
Date: Sun,  4 May 2025 18:51:59 -0700
Message-ID: <20250505015223.3895275-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tDh4kbq4XE6C

They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
we can expose safely.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e07ed04a5b..ef9594eec29 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6565,9 +6565,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
-#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
-#endif
     }
 }
 
@@ -10625,9 +10623,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
-#ifdef TARGET_AARCH64
         aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
-#endif
     }
 
     if (cur_el < new_el) {
@@ -11527,7 +11523,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, vaddr *pc,
     *cs_base = flags.flags2;
 }
 
-#ifdef TARGET_AARCH64
 /*
  * The manual says that when SVE is enabled and VQ is widened the
  * implementation is allowed to zero the previously inaccessible
@@ -11639,12 +11634,9 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
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
