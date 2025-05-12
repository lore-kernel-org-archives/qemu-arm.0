Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42633njb;
        Mon, 12 May 2025 11:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6hwHoJNmbVj7iiotY4Kk6KrtWL+GZ9LsUpTxD5+SOz3qjrUnKnD/YC9L85LkcVueKZ48FEN5ogXg4qw==@linaro.org
X-Received: by 2002:a17:902:ccc4:b0:22e:50f2:1451 with SMTP id d9443c01a7336-22fc918fd2bmr202793445ad.37.1747073123161;
        Mon, 12 May 2025 11:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073123; cv=none;
        d=google.com; s=arc-20240605;
        b=Ng/7nI8nje9F9lSfIehfQPmsFCmNSwA2TnWRB/B582Z7ZJ1QenPt2+fJ3OJHGf98/y
         4NfP3Y2N2fCLyq53jouWMpYpH4R49Pn9HACpEaYZpKRHp4c7sezWnmAh822eoTYPRx5L
         /SkJteLVvm02G2SqQNjcHeaNFZD6CRzYnJYlaIlidKrjFqjBvqUERwU5zsJcrCi8ij/m
         rEnLvV8RiQZJa5ZAiaPjfiam/RHoGeaPCKuIOrbs6FRtpsSCGi/RFlTnx1PO8zmd4ir3
         uQeBjNtfJup/OtP3/30vpNz0ND78lR8I4IAENouo58u6RM+ZFlZ5ujyBHygDvVVcpCT4
         KQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IIdA4T0anNoDoCvg3AtaMVguafAAS4gjefvUsXl2qzE=;
        fh=9lzG3OsOg7ZEwOTPksEMUMYhSDPZdJgwFmF9VJk7sWU=;
        b=QHDeaxeIR41jEV1/M9Ziz8Xqahrom4cC/S/OnVTFpWixhtT/aICUP8S3k6LnEIZ8Tc
         0QjnNcB2PZFyPXtLU/7ly3fXjGH4s1x/SpWYzU6DgHF5wcbOJ5gbMJV1bUKXU1PBvWv/
         tl0mn60Y6hsp9Y2Tbyq0CRPFzyPYEu8E/Oj5y/rpgevLMua0XqOzhHeRVqHI6PDNvl0I
         4h3qvlPZc84FRMSczrDGBtYg0TAdNTwpoTAQf5ZXBJ+VydsUqIq81GQg1ueLm28s5NTv
         cgUorV8iHY3MlrvjUE88Ntlq6iojzFopJRwp+2IeGPu8o6IxMKpiLMl2fA4A7gjR+ijT
         Pi8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EROH8Nyt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc582ac6esor46537055ad.1.2025.05.12.11.05.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EROH8Nyt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073123; x=1747677923; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIdA4T0anNoDoCvg3AtaMVguafAAS4gjefvUsXl2qzE=;
        b=EROH8NytwdUmZvcOCdU+d/kHywNegaLUy9IqySNIOmBL9BKJZDCtDuKwbw5zrHrqgZ
         ajZIrg6OhFiJaPfGHo3Gqk2E4w7fDEka69l6Mq5518M+SR5bmql237qBZKX8T6AReb0d
         CiH+ibwZgra/QU8u5bYM7ZCW9Q0sgaHvHJ+AqAjGuUA2HZcUmyWZqOJyDhwIRRPvXGFb
         zwrw3i+Fx6XODDhSj8HAmKS/ngTKJlcfmFFyUBSnur4MFJY5C3zsENrxUQwgkOLZTJuG
         PDPfu90LVXNDcVOOb69EU0CMPYFCvmEltWJ7crwTCneXUcCtzbY0Bnne54XRc2pERadN
         YkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073123; x=1747677923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIdA4T0anNoDoCvg3AtaMVguafAAS4gjefvUsXl2qzE=;
        b=rLG6jmw7n9LjdBuLeHO1W8E47dr2xEvlJrQk1/VjU3TW+cW1MIXzt/IQSIn+fJ1zqF
         W9foplPsFn3DTcqZdGb56eRWXFxpfI2lotveFxaGe+dHpaIegYZpbwAxfMvH/2SjoGQt
         MzBKIiV+F4meVemB+z6ywlfaWLv5SULsoWdDXmb64kB9scPMvLlqv6A3VIzuTfFo5U5w
         XAie+0yO5X+wMX3jrb4x2qL6+aiZZD3Bfnsp4BHPV7FaaXsnHcN68/Ls1UC8ZjybgwAL
         XGWXpB6uFpZ78L3GLsA/fMKVfvWMC+mrX1hU0HVa9D3jSe3SIlVaUtPoNJD0cT+70ZZ7
         0lFA==
X-Forwarded-Encrypted: i=1; AJvYcCU5kPHROgF1ZPQj6Q2UoIYGf30HWS4HeBNcic8+AIQwORpfZix8Qjh1X35NF8Y71fwoJYc5tz8iMASVsw==@linaro.org
X-Gm-Message-State: AOJu0YwUHxTLQfghcA9CX1e4GiQ+Yerurw8Idopi2NBzMEnVOUH+YHhz
	GzYa8wdD/p64V9lzg62Dp/6EG1/3upHZd4qMW+HqwJJEa0vp+q2y/p2DlTxAEYGE4w==
X-Gm-Gg: ASbGncsiQPCiHVo67H8wC/8tRvgImDHAVQ4nfsB+93GCzNxAtGZkWHatBgaAwEzc9Bs
	vHpSXNWD6Zkd8gITXK7RKc0BrYu4RHHvDgQlIj1CEgkJldTwea4agSrCSBsRJbGLyShPlHTMK3U
	PJEC4qtGoJW2DXEdvzC6P1FRzxEe3k6OWdlO5D5VzOyCMYxQciVJnVzPbiX7UpigFD1ilj3Fn5K
	QvaVD5wH8f6xLLs+l3ls4TNKQxHqOama7dbYxt45UbrZeMOIDK9cOy8I/Ihaqsg9CFX4Tc5f4z3
	i4sk+fyReiL+I8bdXPIlmTFHmu7FeYmSpqZUIBDJh9NJnqJLl+w=
X-Google-Smtp-Source: AGHT+IE4KyY2sjUciM2QtMe6xqm8Ao/CMZro9JcL3u4sz8QtHZGkRvfqtH/L0/tgDzL1c2LWymKJtw==
X-Received: by 2002:a17:902:e88d:b0:226:38ff:1d6a with SMTP id d9443c01a7336-22fc8b1b1d6mr194043645ad.7.1747073122675;
        Mon, 12 May 2025 11:05:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:22 -0700 (PDT)
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
Subject: [PATCH v8 12/48] tcg: add vaddr type for helpers
Date: Mon, 12 May 2025 11:04:26 -0700
Message-ID: <20250512180502.2395029-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 07zP597htfpg

Defined as an alias of i32/i64 depending on host pointer size.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op-common.h    |  1 +
 include/tcg/tcg.h              | 14 ++++++++++++++
 include/exec/helper-head.h.inc | 11 +++++++++++
 tcg/tcg.c                      |  5 +++++
 4 files changed, 31 insertions(+)

diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index b439bdb385a..e1071adebf2 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -14,6 +14,7 @@
 
 TCGv_i32 tcg_constant_i32(int32_t val);
 TCGv_i64 tcg_constant_i64(int64_t val);
+TCGv_vaddr tcg_constant_vaddr(uintptr_t val);
 TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
 TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a8c00c72cc8..3fa5a7aed2c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -189,6 +189,7 @@ typedef tcg_target_ulong TCGArg;
     * TCGv_i64  : 64 bit integer type
     * TCGv_i128 : 128 bit integer type
     * TCGv_ptr  : a host pointer type
+    * TCGv_vaddr: an integer type wide enough to hold a target pointer type
     * TCGv_vec  : a host vector type; the exact size is not exposed
                   to the CPU front-end code.
     * TCGv      : an integer type the same size as target_ulong
@@ -217,6 +218,14 @@ typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
 
+#if __SIZEOF_POINTER__ == 4
+typedef TCGv_i32 TCGv_vaddr;
+#elif __SIZEOF_POINTER__ == 8
+typedef TCGv_i64 TCGv_vaddr;
+#else
+# error "sizeof pointer is different from {4,8}"
+#endif /* __SIZEOF_POINTER__ */
+
 /* call flags */
 /* Helper does not read globals (either directly or through an exception). It
    implies TCG_CALL_NO_WRITE_GLOBALS. */
@@ -577,6 +586,11 @@ static inline TCGv_ptr temp_tcgv_ptr(TCGTemp *t)
     return (TCGv_ptr)temp_tcgv_i32(t);
 }
 
+static inline TCGv_vaddr temp_tcgv_vaddr(TCGTemp *t)
+{
+    return (TCGv_vaddr)temp_tcgv_i32(t);
+}
+
 static inline TCGv_vec temp_tcgv_vec(TCGTemp *t)
 {
     return (TCGv_vec)temp_tcgv_i32(t);
diff --git a/include/exec/helper-head.h.inc b/include/exec/helper-head.h.inc
index bce5db06ef3..5b248fd7138 100644
--- a/include/exec/helper-head.h.inc
+++ b/include/exec/helper-head.h.inc
@@ -58,6 +58,17 @@
 # define dh_ctype_tl target_ulong
 #endif /* COMPILING_PER_TARGET */
 
+#if __SIZEOF_POINTER__ == 4
+# define dh_alias_vaddr i32
+# define dh_typecode_vaddr dh_typecode_i32
+#elif __SIZEOF_POINTER__ == 8
+# define dh_alias_vaddr i64
+# define dh_typecode_vaddr dh_typecode_i64
+#else
+# error "sizeof pointer is different from {4,8}"
+#endif /* __SIZEOF_POINTER__ */
+# define dh_ctype_vaddr uintptr_t
+
 /* We can't use glue() here because it falls foul of C preprocessor
    recursive expansion rules.  */
 #define dh_retvar_decl0_void void
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 648333a9fb7..ae27a2607df 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2367,6 +2367,11 @@ TCGv_i64 tcg_constant_i64(int64_t val)
     return temp_tcgv_i64(tcg_constant_internal(TCG_TYPE_I64, val));
 }
 
+TCGv_vaddr tcg_constant_vaddr(uintptr_t val)
+{
+    return temp_tcgv_vaddr(tcg_constant_internal(TCG_TYPE_PTR, val));
+}
+
 TCGv_ptr tcg_constant_ptr_int(intptr_t val)
 {
     return temp_tcgv_ptr(tcg_constant_internal(TCG_TYPE_PTR, val));
-- 
2.47.2
