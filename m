Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778227njj;
        Mon, 5 May 2025 16:20:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMoReulaPRVzLW/HLqCrkc/g+zjYhUFQayoOHQ0eqLPhXecjyaWVgIb3Xvx1q29rwI2ocAQb97OmZmig==@linaro.org
X-Received: by 2002:a17:902:ebce:b0:210:f706:dc4b with SMTP id d9443c01a7336-22e35fdf578mr10687525ad.13.1746487233778;
        Mon, 05 May 2025 16:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487233; cv=none;
        d=google.com; s=arc-20240605;
        b=I0T0XpvqW4FVryjh5uXY+G9D3EGDU7BGGEGHdANDtN150D7DPsu07Aaa2qWJcF923q
         7/l7BqBv2SU5Cr+t/f0zBGjUUX54+MoGIPF0s551uiL3bJi4zAE88qu8EyAV867CrHr6
         J1Bu7v0Ty1uCEf6jV1jNm3lAwfHHV+U54NKePt/xMGKVnJD/f2MIlF3PCmgKndUmP0Q1
         v/I2N+5zaZJaU9gDI+rkMa+au91uRmbKErwy1oH5JfSL0X3Y4S8+GObwP/q72Z1B+DlE
         Y/e3P0QY45iaSDJmoHUb8AMfewFiYl9HRA1RqqGn7D7ECYYsU1VAbgR3oAaCsLMfiDoR
         VWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cDb7EHZEjLo7h3rZVcHObRDfwFiVArFxWp0gbUWTYQ0=;
        fh=BHMFcS2bbeYM4T4VSNd4v1rDykNHOBCFo24+kBEfjrA=;
        b=ZMPSZrX/ccvtWoZaSyBtopbG/evWLeh/p2nbmzfbiKmT/NlOGSt38IGuEcrV6mSbqt
         MnWYxng91TFSwa+U+OkpzLFNkDiy3lAk1efRUrdMCX5k0COp4fmvmodwy6fKOQTH3mlo
         nH5o/vHYqTV8y51V+38rT4RP8nZl7wK0UDwPVD5QQYKSRZfkvrcx04yi5d6DvFOFnxxr
         Nk0xhqJ905VbLgBQv6N1pomyp8lGC3CnkxoYOw3XEs0y1nmWjAjmiATdAoc9evad5m7c
         lzimSC25pWDnhjlMO/M2zci42Efe1ObnIlwj8YrQcbom9YBR1ZgvQ/9Rym7e3Xt4/kAO
         U66w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gqxGv8Zt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb290bdsor77864665ad.7.2025.05.05.16.20.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gqxGv8Zt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487233; x=1747092033; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDb7EHZEjLo7h3rZVcHObRDfwFiVArFxWp0gbUWTYQ0=;
        b=gqxGv8ZtLHRgZumBGIxawvt4VfT5Z5QxDJnFB8oxRFSlA4A96SZGPZrE7zoTvKlQkO
         F3xmCssqhAk+UCorny3+vLo+iroA7vgS1CA3W4rhK/KRVNu0VtNsgKGNbaJS77hlvQ2s
         x+mA5EM5atvZDoNAy81ZpcFKdCKncrdXIfrfW7PNe+BNigMHMm4W7eYw8t/KdyuAl0pl
         3Ot8mzq1M1bgvwPI8I6G//k56hAyV2Vs8bBztHw1Upwdp8gPV2NTmNPBSeowKITrJ3in
         g69qwasLWQmjLuAncyEd2H3QL0QD9Ox/Tktp3iXM+x5lXtyohTILzIe+ggCYNhhJwsvl
         3mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487233; x=1747092033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDb7EHZEjLo7h3rZVcHObRDfwFiVArFxWp0gbUWTYQ0=;
        b=XrSUEGhtr9ujq/ts5CBp/IFiJcK8vO/GX99n3VFNmi8OZB/EfMoZNT0+jVPl0YYXD2
         GG3xtrNJqv7j5QDbiLMdC1IIS7Q01w5PixECEc+jS5smAA/uG+LTrL/oFIiRP0KSDZtC
         QH45PmHM3B0oDK7NvvYCSw0NYhRUZg12VghCDwjOfjLuY1hU9Obuxic5kNgkRFnHh4x8
         V1WWPLhiJMMCeOqVR44B7olDOKsqCbVLyZMz6RlRrj5jBN0Ucn8ZNuOKqbGC4BYZOl0X
         unlH0zwJkBcBCTZuFKJA0zDJuNG83Rb8Jl/Kqm8tLDii0I0s4N16N+wvkdVvr7WcavKf
         LuJA==
X-Forwarded-Encrypted: i=1; AJvYcCWjbv2OBqChabWPT9+5ZCSIiaZI0N/vySrBOaRX+noT3w5pvqzzYsMk5L/fEI8tf/cO9FhYUb2SuQ6hZw==@linaro.org
X-Gm-Message-State: AOJu0YzXBOzqpsnazVOx7LzCQi29TBw2WEb0rMTLF0282c9vGJNLDBYs
	Br+Ex5mZSCnvolq2Pz0Oc3PN6pXWcWSWwamHpp347EpOIFLFxBJj2dFnmPCrwKlFNQ==
X-Gm-Gg: ASbGncuBflfIX8NWWKhEfHNWSrr1feKnawMolPCi7LJApIC/DbntqQLYgVXMfLLZhlL
	Gr5lldAtJDNmE7tBO5IdAxFrPQH1f55K3WM9fyiO25r1lmb3YWrBG/jfxcFA5KfjqTbJWZVwnMh
	o9a5prPDeWxzpQM/JuefjGd612KuaPh24LkSEECkLaOHDPZGAlT1bg8qdPB3EEaLATa6K8yeShe
	8fevd41DJ6nw4smYxoD2E3oUQz7Okba0VWlIuNnfEyeaMRwUgQ45rklDKr1ECAJ17NRUFq/d2az
	bgVWvAkM0Rp5e0xLbbKd/yPdNOm/RxNlhVLm5Pak
X-Google-Smtp-Source: AGHT+IFJti35iYUgKEkKZhhVTmuhbgWlpB1h6Ppe2ETgmh9NoEZMHMZ762NC6rp3ineO7ZWC8L/XPw==
X-Received: by 2002:a17:903:3c68:b0:223:635d:3e38 with SMTP id d9443c01a7336-22e35fdf7edmr13552305ad.15.1746487233076;
        Mon, 05 May 2025 16:20:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:32 -0700 (PDT)
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
Subject: [PATCH v6 14/50] tcg: add vaddr type for helpers
Date: Mon,  5 May 2025 16:19:39 -0700
Message-ID: <20250505232015.130990-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nc5x7bmXqNIz

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
index aa300a2f8ba..72bfd3485aa 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -188,6 +188,7 @@ typedef tcg_target_ulong TCGArg;
     * TCGv_i64  : 64 bit integer type
     * TCGv_i128 : 128 bit integer type
     * TCGv_ptr  : a host pointer type
+    * TCGv_vaddr: an integer type wide enough to hold a target pointer type
     * TCGv_vec  : a host vector type; the exact size is not exposed
                   to the CPU front-end code.
     * TCGv      : an integer type the same size as target_ulong
@@ -216,6 +217,14 @@ typedef struct TCGv_ptr_d *TCGv_ptr;
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
index c4e866e9c34..51ec8e04bdc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2368,6 +2368,11 @@ TCGv_i64 tcg_constant_i64(int64_t val)
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
