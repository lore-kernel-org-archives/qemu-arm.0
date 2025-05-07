Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94301njb;
        Wed, 7 May 2025 16:42:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIsCKtlQ5wbW9g7YksYJh0cpYbg3c6wMpRxXvN547epXLDjKQSra22/FJMcLGmcT3MoXBtAnfzaUaIxQ==@linaro.org
X-Received: by 2002:a05:6a21:6da4:b0:1f5:8cc8:9cc5 with SMTP id adf61e73a8af0-2159b01b258mr1662829637.34.1746661375338;
        Wed, 07 May 2025 16:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661375; cv=none;
        d=google.com; s=arc-20240605;
        b=DSx7s2QuJwW7Qgq/lTypckv4s1RL2Sy+k84bvvrgqjMkbXGXKatBcF3MskaQ+kaCYU
         w1iRVm4PseDKlB8PAPYfrLk6QbT2l2km+plA7bWiBfa76dYQ37GNonjsuxk3e4b/IPDV
         WTc317jU+xyAzELUyJ/AVefPHa/s8Gn3fYTA/0BYc0jdzvjRkOqDuZVtBYPNoi9ZZyrm
         J+kGuDOPDxPu+NwP0g5dqE4bvAq53Asq6ap8fkPbtL8VLohyrr8tkM1SOoYedoVCVXPi
         Iue6aMmgpWKlcmF/VOYOh4bXYoW+VRmTxUC1ThPiP3vT8/cyG/G3h2/Rmc92MSG7HkUL
         7IbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IIdA4T0anNoDoCvg3AtaMVguafAAS4gjefvUsXl2qzE=;
        fh=dG4GNBsBbEV1qFBCyy+oyUP+X/PMVzXHbja0aVwns4c=;
        b=jIOIhRnCC27RYfu0i3d4t9klKO4i0chbCk1FFssE2ROAyDplFMkJh38ak4cAKCZBNF
         Hrcvbn4XutBpE/KgL0rWCcphfLLBJh7TR9VuoGeU32DfHSvaGEkrgXBieuDggtsy/aIW
         rW3JHhbHoiPaUIPxa2m+DhHnmZCltagz6TgbF/TRVz+/KuIeHS7YPpay8/xgRR8wR6q+
         kTJx3F9C/W3auHKBwmq05Cn3BJ04QRrihHzKpu8FhMMeWTYSXjMfTN78HMsE/33AFZu9
         rbc3zYviMNc5TB8AmGMRrPjMmIpeRYG8G/ZlXMAsGUASYW1YvThM9+mRlDNoxKwcyI6j
         M57g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNavhX+g;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d661692sor10353288a12.7.2025.05.07.16.42.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNavhX+g;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661375; x=1747266175; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIdA4T0anNoDoCvg3AtaMVguafAAS4gjefvUsXl2qzE=;
        b=mNavhX+gnpd35pR5McykaPjCIk48QeISL6VuAEe8uT7U9ot82JEc3TKNRYJpy00tI0
         RoqlRqhSBUlXqToLdIxlwTLBqtug3+glfQAsgCROjgQsJt0kIQY/0WQb1EMD04EGRCSg
         yjJ8U5QET3AYExEXKn5lTRElNpPqU+H0RqIsd8d9l7Tpd2XIaiKXVCofo5MZP7yuowsF
         BA5wRBOEvVZx7i7xPcTBlkWZR/RrJE4Yjz9RQgVDp4lmYUPy/BAXfPgOLd4l1rSTg+WP
         VyIdU64a6iyjvc2iktVgXm9zhzj9kxZpqI4Cl2EhMPlSViY9JOSmmzd4UOEJwPgwjU7l
         g2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661375; x=1747266175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIdA4T0anNoDoCvg3AtaMVguafAAS4gjefvUsXl2qzE=;
        b=YPUZ4xhaQCcbFiV/xQtIbXG0nP5jelWfAXXC3dffv6Ause1I4jOGyzt0Z9EKneBeWv
         G1LmW2eChREhr29HUuD8fzabRHIImXbOXlGVdzEFvnurA4NGbnnwePCLhUWNehcEO/df
         o/eGksUw+L/VIpKBofKSzPNy6aIkb5Srt0D3GKfsgDS2mJfHoaJjQwJDqXusSKcZP2Yo
         ueSk38DtuLITfO8Fq5FLSc+sewzj4yyNa7+c1wQ/9uRCYSRo9Po97SN/GYELi1rl2zwD
         tiSrxFXkibSw0uSqk24kXwo/+iNNCRXh/XByBt7Q5gGtTMaGoqrD3FT3S/AjhwzSo5+m
         yEoA==
X-Forwarded-Encrypted: i=1; AJvYcCVfDJlaZKarv1GSBoiN8Sl2cuDcOSoa6VZcK6Hfx47QUkAftA67m9bqMjlSO8ZdVQ4Mo7MSg5GeGWfwpw==@linaro.org
X-Gm-Message-State: AOJu0YxOhZR65SCr72HmRKVgmic7LKZJ0cn9KjzIFEgS5oZNIWEC7XXF
	KXjgBWJBQccPEfrNMyFgnVEdwfDjFPgsODqyUq7Jur80qoi35SOK/VufwsAyIrgLUQ==
X-Gm-Gg: ASbGncu7Phc13paBnhtrOhfbB+j76gN9w//Qtt6xgQaYZup+erWCWBpqlKwtD5t+cpe
	vmvgMLc1GlPILawI2PrvzyjawRDRG78jL6vGIP9ML4sp5cM7cd8hyYMIWNRHwXVX1KfVf8J29Jp
	GF7yCPSXArWenSVgr6Si1RNBN0XfhtEFTULPIUbLkheRjLdZST75DosQeisc3uE+1XnFNvBKfZt
	15wW6TRuB1CfxJpVOi+lTS37GSaD9izJpA2Aq3XGOXVC1KVGE1LiyCh94U886+PPIbCEiofPE3Z
	vt5NA1OnMxc6xvZMCVNxhXtPxBXiOP6kel2HJGwy
X-Google-Smtp-Source: AGHT+IE4SdOlTduCOg7Y2FOUnmos397XeU5l2GkAQ9tyD0x8ukmGUjgShIh0T8CHvCr2QiUOb/m4DQ==
X-Received: by 2002:a17:90b:1d03:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-30b28ce2bd5mr1427945a91.5.1746661374817;
        Wed, 07 May 2025 16:42:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 13/49] tcg: add vaddr type for helpers
Date: Wed,  7 May 2025 16:42:04 -0700
Message-ID: <20250507234241.957746-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YhRUNErB7UzK

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
