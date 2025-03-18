Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694635njb;
        Mon, 17 Mar 2025 21:51:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOJyIwqY5Gchf7ur0E22ovMKkuvERM8ZoFHPB1/z9gYmbZcN89OJmFaHAPHE6phAQxednAU1b3d6syOg==@linaro.org
X-Received: by 2002:a05:6a20:d043:b0:1f5:7ba7:69d3 with SMTP id adf61e73a8af0-1f5c1175149mr20942992637.15.1742273503881;
        Mon, 17 Mar 2025 21:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273503; cv=none;
        d=google.com; s=arc-20240605;
        b=S+iLP6BkzNjuVv9MONHyoCvyPj5TCIJfyqDThTprHKyimUb/NoBBklTdowOklda+G+
         IByr+lHRiZtMKteoUFex2OW1pO1bmZCZl18ZMJ8CjGDq0yjDteh4bvybmNQMGMxORnfs
         jYv16C6Zya9ngg+fPbvX34r1nMBn+VKiQ6hSl9ke0iLBuqcHz41LD0Kd0HSnC5rCaenG
         VU4Ac74R718q/GCFu4Si/sVFoKsVhB32GlZS5btl0OuzSY2FuuQOQrkqLm3OrH44zHof
         sCEtYYzTdjSSZQVDxMSx1IbOOHVvzDK7oMftdky4cr5ayqgBdPopGRS59U9Rql9DnNV9
         qkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ff4if22Q9C7/aUOyimjBXuhprbDC9BPiONo3GzzeMnI=;
        fh=2BLgl0E/1QhkdHvLb4unMlFKUJB07o/f3DS2R3gygCc=;
        b=So0lj5KVf5EwBFWjTNEAgNRAJq7yWT0s4XNuuG4P+V5rQPoj9/+sSSPZFRnz04rBps
         hJxAciYsCgwB7NCECyeRwbAhgkVn6vsCH8iwd6rcfBWLtOyptsPSJVsYQJJ0acxBCNcc
         AXtWq+qqSs8MLG1aWEqO3aftm+r0Yu+mCbbw+7aPzCYdcxQZ7vYWJ3LBuB9Kln5Q54LO
         Qd/1Rn3+qNBJ2v9CvMVNO0dnhYj6/gZiXjDSaIs0618llnzpL2vOCsHVgsbS2f3AQHdt
         SvXJcfSEFrBnmapHurFt1occ8pzHX+4/Wm5zHBZ3lk69dFpLaiwk+Upf7o9TfoH/bVgP
         I0pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2adwllY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af56ea5d5f2sor5065155a12.4.2025.03.17.21.51.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2adwllY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273503; x=1742878303; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff4if22Q9C7/aUOyimjBXuhprbDC9BPiONo3GzzeMnI=;
        b=E2adwllYpSqWTVWexh5bKYUpP86F9ELxJC1x05d4oBMLTif6IARGGiFwL7ZFI+Sbhe
         iDDgKxgYjpv/XSvTpxcr5x5rT+GhsZ9omiILDOU0kL15akER43UBOVeNFCG2Ibo8GOZp
         eH9U/5UKK23hrTcnLBVA4Rl4fXDz8xS5GlmUYTocL1Ln64QoXg9kaLw/ATf30CNMTKhV
         JsmvMVz1S/2xRFIUnENR1mJ70eLI5R09CUSGz+syE6DRHGLL44H7q1gLZZXbSBvEJpMB
         U9mPVVQSuA4N5X7mJYhmWxSthuXLb6N/yCqhwMuYS8N50MtqWo7Jhn5y1wKrp4OHu7UT
         zVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273503; x=1742878303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ff4if22Q9C7/aUOyimjBXuhprbDC9BPiONo3GzzeMnI=;
        b=mWbpDCTMAH1dA/j3zgbnzT0CwwNH7Hl3NcNN5Y2Mjz48YEfXfBkcKoJZPAwqZJWxse
         8a0urLw5FVyMQYv95zceFauot0gdhqGQH1u0UeIhEGfxKaf+UPyvZoKsqwlJK2GfGmWa
         bbw7IancxQb8rl2xk6kdCs8d1tQtvpd3C/85wGdogNJuSUDOqUHqwyxJ6QPAfHn1iCU9
         4KLwmEHUph5IT5HO3y+2Px61qcRh7c5cd7/MYqyGAP9ExKCUbkasFQ0d5HdyLn41LkaG
         cl/m8BC8b8Y5syFola6on/+7OAfva6BeriKOl0Lg2nKg5o5/EbYsyfoEvNmvvGQPKfgd
         LnQA==
X-Forwarded-Encrypted: i=1; AJvYcCXSWLzvZp4FhKDNk947nhDLi8vtBwaZ3PdyXLg6S0mKHvVmir7OuvsXGFTsOYKRZRklGDBEEECFQky8KQ==@linaro.org
X-Gm-Message-State: AOJu0YzK/VbedkrSAPc4T+59onI/2cFzZcfhCmRXv0eoxsZ+F0fARDZ0
	fD32ALw3GC1RVX0BUL5fxaueQz9lBRZ9Tld+yF5LVZWm2So8o3bbXpLAp6YlvM2e1Q==
X-Gm-Gg: ASbGncvl6ynBHIZXQjZM/AwR+l7+KQ4sRR7xIY13+taNvQ7qUXDyf1hzAp5jB2e65QK
	F+8M5dlzEYhHATFzvAGN6TpKAof5mSh7Rxh6PLenuar37LDyb1CllJhPdpWkXgkSSnrCmhAaJJR
	esI5HmPHfBi5j0zbNDgr/K0Y4Q2xt8oKevjYQ3RBlPzh4KiJGegbVbCoH8OoC0r/aljF76E8Dcu
	KTAl8Hz+4047ZcsXzBfYmSF3pN7aj3hEEm5gpupNKjTiFkPhYs3WhfcnrAR83pbFE28uqUvZhMr
	iFQtXc0nZwhJrjnVjY1Nd0tqPCgHHZuGIC+lj7jl8a+y
X-Google-Smtp-Source: AGHT+IGwUIS/3wXKGJBQGhbVlXqqVjdKfsJ7yt0C5ebmRfs4P5+hmmLEk6TOEURFfJtw+igxyOPO3Q==
X-Received: by 2002:a05:6a20:244a:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-1f5c1327783mr23658501637.35.1742273503447;
        Mon, 17 Mar 2025 21:51:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:43 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32 emulation
Date: Mon, 17 Mar 2025 21:51:23 -0700
Message-Id: <20250318045125.759259-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GE2BQJXtb4X2

Directly condition associated calls in target/arm/helper.c for now.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h    | 8 --------
 target/arm/helper.c | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 51b6428cfec..9205cbdec43 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
  */
 void arm_emulate_firmware_reset(CPUState *cpustate, int target_el);
 
-#ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
@@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 #endif
 }
 
-#else
-static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
-static inline void aarch64_sve_change_el(CPUARMState *env, int o,
-                                         int n, bool a)
-{ }
-#endif
-
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b46b2bffcf3..774e1ee0245 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6562,7 +6562,9 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
+#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
+#endif
     }
 }
 
@@ -10646,7 +10648,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
+#ifdef TARGET_AARCH64
         aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+#endif
     }
 
     if (cur_el < new_el) {
@@ -11663,7 +11667,9 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
+#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
+#endif
     }
 }
 #endif
-- 
2.39.5
