Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778296njj;
        Mon, 5 May 2025 16:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMbHGWc5Pz7RZZSc7ScHudznqvOndyFXVFePsG1rdJSb6pXBRACWCi54+zby4qZdHeRF+S1Gu0LsU8tA==@linaro.org
X-Received: by 2002:a17:90b:380f:b0:2fc:aaf:74d3 with SMTP id 98e67ed59e1d1-30a7bacbdfamr1795665a91.4.1746487242282;
        Mon, 05 May 2025 16:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487242; cv=none;
        d=google.com; s=arc-20240605;
        b=AYSsnYaqH9pArWnfvyek6E12YjStmzgG5GXHxYyepg35k1gd65ffYWkm2Vq8Y6jAKm
         1jpMwySrRZ3l3apv82nzyfkqkPSXocd7gihynaW/sJ0aC6bn4nQ5oFZTLv7Ej5OCFMwJ
         LSJECzoz8ESx8isvmWJA5mUUu+uyNQrdBmuK4WCpZE71jXSjk7bkWoydxWA8WxoMCC8m
         8S7hLLbhBXs0eFHcW8jp2AUW3syFIvkF+jN6gnhP6+U13HvmccG0aV/5DRYovh4QtR2z
         n28TfvSssKtTC/+wunRdBajMTxJvMxxFwj1pobSROsYLthOF87+IzqQ8xnu/IlKDjNOi
         WBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Tgtkzpe8JxmQvRJXZCyTrKxE1atR2TmNo3Re2v0+pHY=;
        fh=qWR+lDDEB84cg8Ok/B9oYUs7qNBg4plN4/xY/Iy7tE0=;
        b=Rl0mWlB9pRr9wXjxNAltluqvXVkTPzb9ET+S3l1ItIVtJBhc7bYXWbNVDyKBLPtR0B
         E3+fI7seYiPuJOUNI5Rg9XqqWecNi4FdjygY3AbpWbF8noUxKI4/pUKXzvF8DWGPcmrj
         xngMdeiQyuvLmrUYCH2u3qRDeyh6MI82uC2SPUVKmte/Y5PjidwPhEWc+BGNajvG+2on
         AbsNX3kvnGXn/A4CkilMkOuXbyumY0V2tFW53UV9tv6lmaRbCn7x/u35mPGrB7nPQd/n
         lFIhS2zpdot7twtLZ+XqehLXrL5JIpcPV7JFH1risAGA8GeDUZhe643VNrT13Uxj2tz+
         tbZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGYpjRyE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a347ca48csor8088539a91.3.2025.05.05.16.20.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGYpjRyE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487242; x=1747092042; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tgtkzpe8JxmQvRJXZCyTrKxE1atR2TmNo3Re2v0+pHY=;
        b=qGYpjRyE1FAMeN/5cUo566TNjf+WMfyaaRxmettn6XZBi9R5LN2/CpybXESAGi8z69
         Y7xGEVruiKKxiPt4lKpvnKgUpbkjwpxgWVnKfE3bzM4VnjZ1dfzz1DNPyO7TWfehmsMv
         CVQl/zqXhaCxKXGL5pi4/VExSv+NKbmh7m+Lei/zbyYSMxOk4mhRhFvXCrlmL+HetyGY
         UgC0B2R/F2NM4ECz2e8lvVNFoBll9LoL6moXW1YlU83I3hOi2UV4GORwNEJvlQ0hU4YB
         gUn3H61FXAXyyfhjGJ3J0djxjAblGD5ja/Rhz+Q6rcDpEAlHZ/A9mfQs4eocE0A/mTpS
         U3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487242; x=1747092042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tgtkzpe8JxmQvRJXZCyTrKxE1atR2TmNo3Re2v0+pHY=;
        b=NGMwGLz9NSuCkIeH3a2xUev+ZsQuEB/lW05CvJkd8SuOikV0Qdg4ssFOx/MZdgDr/x
         xwG6h84JVocuUur/WnBGvg3EEQORcDiwEvOei60nXz+TJlihuCKRTT/Sm4lUXAbtgttP
         Q0xEQbQ6geNX/T7cXQL52MY+/DmI4akXRl82ctRBG11U+IKd5ct9MmABsS4WKJUhJ2gv
         Zmtf+TC98v/JiJEzgJg1lQDn/5c3INwXpcmRkSA5zDfZKvrI2nxYRUFJLvfu7dzYRzNe
         VWuaTL9ChQ9FC0zGzns51D3x8FfVBUgg2F+qNXy97yy9/Tf6tgbgEEmQ9Yl+psG7OwTu
         9/lg==
X-Forwarded-Encrypted: i=1; AJvYcCXvn372DPI/OOWspGxfFFcneaQ8+PEY3M4w9vhdO6NK291XdNcnYMwmyeUlDCdIyYxHQ7gARxo4ratm5g==@linaro.org
X-Gm-Message-State: AOJu0Yztn2pOdC6rOm1rLsRPpZTeWNEai2I0DtVbBnNw590NgLiaTKm7
	Pjv0+DP6+1BvkUaGoLHsPnBse5cKpAAGOSSyKLtZIF1nr2EY5TsLVu5z36xvkQmWcQ==
X-Gm-Gg: ASbGncuvet9UxbvcPO2FsnMLmo9TCYre9avJsHtaPr2rLrGZS6uizAhjKVVUi6nQCS3
	fM+PIvbot8HtoRViheCbSyKVuPePvXrwvHnAbNmWpTSdPAevhm/RWvfSne2Ko6vns6WtcLaioQo
	Hw0polAcsHJwzsiYn4/LSN7gr74Rrp26Ij/dp8PTxZfJMucYEUj4/qfWPm69T5ohDL2/wM9cb/r
	seVoKUb/SA+ejX8oIzb10qaPe5C0Ovve/kfrnY0tlF9t8Rr2qViBY7I7Nu+g4Pm/zp1fbhnSfns
	6C6dzqrqkQ7Q3ojhEbeHeP2OgtzV/FQRYvtjxonA
X-Google-Smtp-Source: AGHT+IGWkM8Y93kjIHnya9pzfJRAlQyMK/kyKFEpmMjkEHy8e5TjRZCSQClHRiEUpiFWdNLxftt7RQ==
X-Received: by 2002:a17:90b:544e:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-30a7bb28833mr2024932a91.14.1746487241836;
        Mon, 05 May 2025 16:20:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 24/50] target/arm/helper: remove remaining TARGET_AARCH64
Date: Mon,  5 May 2025 16:19:49 -0700
Message-ID: <20250505232015.130990-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SxxVE5V7d9V7

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
