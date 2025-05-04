Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756173njj;
        Sat, 3 May 2025 22:29:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLRiJxkhYptjgNm8vHz/U+8kfw3XbF0LZj6CM1uzKfEFzBKgSly1l/GHjmtJ7IEBz517ZfsmjaoxFIxA==@linaro.org
X-Received: by 2002:a05:6a21:3294:b0:1ee:c830:abdc with SMTP id adf61e73a8af0-20bd8646203mr16275270637.15.1746336581745;
        Sat, 03 May 2025 22:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336581; cv=none;
        d=google.com; s=arc-20240605;
        b=Pgxd71VC5T3T5Pc4CCosLKUN4U34r8lil/tPkic4GYrWos12iLnhOrdajT5ScOcbQF
         gwO17T64UGZI5hvH8bAc9kol4fScJfql/6v5hB8tyWoLnjagw/84Ui1Gug2Txgua9QX2
         kt8PwwBJYrw/QEhaqSiYK+EfMClRhN4jYZ/qcMABKnkLXI/kGW8GfukRj2AB9X0ua/GA
         8JrtjTy1m+njdNCFeiywECF3e/fAJKVbek5yQAapa9ykq+Y45nqoEdri/UGrnsinuzSv
         4jPTnM3055c3bfAi4dIhwiaOmszx+tbh95yyhlr/9sYvfbHHXKemoM+MrL42z67PnyxL
         Lc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=39PScigtuz9820KEKAK4bxrnXJbLJRdrPn0GANchp1o=;
        fh=NR5W0tvMDj9NF9PN+gS2lgssWLTbwUG5ggAX97pF+RI=;
        b=kqU66wtsmUHIQ+9175OQ+Gu1Onh1d1cIAkSDfcQ13rgym+tXTLfG3McLNZw/NAh60v
         FkSZAJa9884338hciw37Mo+vGIzwLNLce17OqNM1sdqr+Ejmz50xiyDb9Lt0H68LslMV
         CrP4atg9Rv61ZK0AbGzKwFI222Kyy47te1LgclH9i9Jn9wglq/mCK0kKgTaHI/XajO2a
         2yUHqxd8WLKd9LlwUuEX/Ojm40at/jH5vHKDQpFY32p0DY7WT3j+dxfiHDPfO+m6fyex
         rBGbdqeFzTXYfxALso0KUa9Sr43CsShNkgv/zHnYgMGIfVWGMDmou+878dNwMoyLHWpk
         +lpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RYDRv8h2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef18429sor3093576b3a.2.2025.05.03.22.29.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RYDRv8h2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336581; x=1746941381; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39PScigtuz9820KEKAK4bxrnXJbLJRdrPn0GANchp1o=;
        b=RYDRv8h2VlYh9/X8G8g2ukECfsWeGjWEwVsVgTLSP6vgn+TbUnszsZ2VZnNKbj4gqB
         3mQQzUAAAwrDdAc0tsMHrIXToOQJ/328AEG1CBPVwOHMe2TjozwSXLWqWCZ94TC0X6j2
         Hdr4DnCpxIVO7Nf4GdP97JSV6fLxgMavh4ykPFecLUrYAnchqO8XgfM4TPILmsBPB00F
         o4qZdg2XT7fyvds9n5+EEC603bXlpoJReRfkY0L6sqCXebzgYqv5VCXMbHwYpgFPqDCE
         9o+Y9Ignci2HFxt/0Hc+PkkyBNGyE2CE4SHdebXExWcN0xOYumMZLGA5kiWhlObe8b+n
         iGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336581; x=1746941381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39PScigtuz9820KEKAK4bxrnXJbLJRdrPn0GANchp1o=;
        b=etIRJEwNTdM9qV6KV1RTZJpZD0IygisxLYfonDk6T34XCvyfb4SKWn/LuF+JRGDNkX
         JHmEc5QiYGKoJDwDTfNDsTcS6oWjJEy75axTyxG80ft4aUQMQANmCPZXxaa4nzYwX6nq
         VUApzmghl3mWdIwn7TjZ3tkajLxpIaX6c6eknS9tC83tZ31mE4/7jDJPnauZ99ORjapi
         U3fqkj76/3z8TsRDo+993V6RBl5rLTniaUe61/Xd7uey2Xx6ljM9m6nJpAf+6nCx9lBA
         PRFG36YLy1d45WBu//FZiQjNk1sCrZsyqM6EVqIIQOAq+nPitMZWF/MjCs+l1teyCgrL
         qQNA==
X-Forwarded-Encrypted: i=1; AJvYcCW4U9WnO+h1Uki4WPvxJjc4QBr2/wbnlkz1fZoKnnUtZYk9igCNOc3Wpeqqq+3h+QLTj94Tzlmk6slLuw==@linaro.org
X-Gm-Message-State: AOJu0YzosjB0ELFXd+U3YEAGBkYS9XGNtAI1BGMCCMOxEj4RImd8374i
	W88wCTfPB9/TbuQqsGjdz0ue2YmXqlqXeLfaP7PFDKdLg3Jh7qj7K6NEfyOKm1tUyw==
X-Gm-Gg: ASbGncv3hgZF6HS6Y4vEEjOFuDLEk7lj3TfjmqXuOIyfabHykQsDHEoXrKL8WU3splv
	35AbQBP2osulFZBzLJWVyLvYnTDw6xnmuNNJsw6ikNKTNOCrCl1urquee1fjCqyAYpdrKpLWpGp
	Hoe6L6ulV8LNsFYLAMggMh0UZiTaUj+2t4ZUNEA8GASwQA4jYLtqrrOXzmO/0qhEY4hxcCCDcYh
	wu4vzXFoe8Inavv4LBcnEovbyUWoVCX7mpnGBFoyPYMxcLX7V8PogZD/EIAf0ZQcUW0ew/peRli
	QAXEwmFAno5onDgTEhVWIQxkYzwQ55Bp1Ohjf1JK
X-Google-Smtp-Source: AGHT+IGTptIceRjAxyTX2FKxG69Z0atmLZhDjlVRkXVmilsAn2sBjvy7HHkao4bpmRwP6OnfTy6E4Q==
X-Received: by 2002:a05:6a00:3b06:b0:736:b923:5323 with SMTP id d2e1a72fcca58-74049261a39mr15380704b3a.10.1746336581216;
        Sat, 03 May 2025 22:29:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 24/40] target/arm/helper: remove remaining TARGET_AARCH64
Date: Sat,  3 May 2025 22:28:58 -0700
Message-ID: <20250504052914.3525365-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rqK9wF7apzCg

They were hiding aarch64_sve_narrow_vq and aarch64_sve_change_el, which
we can expose safely.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
