Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178770njj;
        Sun, 4 May 2025 18:52:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUR5WxHrkT5LFYzJo+JgEPJmyuzXtIdyYts6ADQF6+sUqJm0pmE2Bkdj1VHTc+dBWFOH/eEV4ZOKP2xKQ==@linaro.org
X-Received: by 2002:aa7:8b4a:0:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-7406f0df3f2mr6686905b3a.12.1746409961224;
        Sun, 04 May 2025 18:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409961; cv=none;
        d=google.com; s=arc-20240605;
        b=JY9/4GI7S82mbqJF6/VCnoM6+Er6jATY4wQgr/jqnNCYw+w2yt93SngYgN0BK7ifCK
         Ndlc0agypjPCNRenA5WUQ2F9pvtulzffAmvLcr+mu7/YNIRlt6xzNAVs99WCotlrPv6t
         xNDA29sFWnOfN7EEhXvQw4f+z+B7lA3YZA2EVph1pmlBRDazvQcxNuY6Tnw7NWrNiwJi
         bseFF0ZzPGLqi2EaE0sI+57Di2Gq8uRbS04N/B6VeTZucdbjemDMuhbg+Kt8fgMxDO1i
         3zmhS/jP3EP6/kPTtgDceJShc3YbV/BF88Pq3EbUWFYJEQf6RBz95sQLnZzxW7URaUga
         AS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u3pVmvmULoy6BBYUkUdwM0L9kebw+2O/lrIQahS04Iw=;
        fh=hgYb+DQ/Y/EhmwvDKtysMlLom874Y1A3va6LrUNyoG4=;
        b=ljAvJscX8bVE6WyJDI9fd0AE8MHh+RgjnQUeGksIMBaY7fM0EWRwdyfRU46GUV7Mw3
         6/xX5fJEMXP6ymBzk8xoj8rOZvp9h/woFs2P7sjRcH8DEaijsuZwqPCfUUP3EINuQWcM
         9l2ZRBkWDmMQbVItM4Ag6EXAWadaWZyEr57+Ufht8sHrby+4dmrJp/XvLDuaA7jP1pZ8
         ynTtyE+EbZoeKkD/1Noa58FLNif/1FKcgqOcgFuShMYLCuuekUKYr/gunZNa4f/qSaP8
         hIDloLGc3Xz0h6T3rN3vWyj4ntHKCIq3mJidGfpPTeNj+i9QUrNp8rOJPT7J5FS7/MH5
         s92Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fq+CP6o4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9ac4dasor3670142b3a.6.2025.05.04.18.52.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fq+CP6o4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409961; x=1747014761; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3pVmvmULoy6BBYUkUdwM0L9kebw+2O/lrIQahS04Iw=;
        b=Fq+CP6o4L2QH0jAlCMOkWZ7L3ptUe37YZ1woNrCZ/9E3KhaiRjIXYw9NDQOzAqauux
         KB7POsotPtfp6abiZAiUSZakNYaF8Klo1rVQD4zo1CQ2fViGJr3VJS7RaK31fjuzaA9z
         Pynzakw+IhsZJEDFmRd7N9nbLP9HAQxmRoM9g8OCM/bXcUgfvlLtvCUWmN42wQDohcPm
         PQvkE77J6w90VB/G3LIHpsPDLZ7+lUywwyi28GOcXULjghNxTt5FcCW0Rzt2aMLUrI7i
         QFCpqMuYdQJaBms759ltLSKCvl5yf/rfUMkftYOIwWHTB/4KdFkhTwc4hv0qAOQcC32q
         /YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409961; x=1747014761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3pVmvmULoy6BBYUkUdwM0L9kebw+2O/lrIQahS04Iw=;
        b=i+wIRmU5Kuo8iIdmVxIYhwCGzu29eM5w19EmVGxnHHUYeWPyoeOVwAyZmtPpnviHGg
         pINu+SrmfIVKwZycrgYBKhLFE8JYN31eUKKNIWswdRs3EVG1WbU4ZN7QFO28WVdSZSuk
         4FAjYhKExROp6irFW4u9Q7TFf5YljHIHbMhm/XLQuncEVf7pdbfojX+XhVVrTC2J2aPN
         rDwRQicVr1NAfeTxRB8hnCg4J8RK3GmukQ3WfutQDFyB3VHFSaHipqHVj3jJGe+8HAYT
         yGtrE6xNUAZcJxb4v6atD9ZSPh8CU1ZnGKH1LDksMoF/FRfN+cwn4kfhQtoUL4CpLmQS
         /33Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9PpxUAx+OXxUZ0/RxjqraYqECm7iRZx4e0GbMUTf4UTAM/GKyor1FHa/kItO8IaG0jj97Oag5JNFeqg==@linaro.org
X-Gm-Message-State: AOJu0Yypq1+M79VAQhglucDtu5YQ0n9+xGDgiGQA6bfcIGawzYfkFrkJ
	OVIPH78e4XknLIr2hU2b1uqznSt5LVgz9u5qotSVnLcqzdO5EQavS32w47QqW+KmWQ==
X-Gm-Gg: ASbGncueBZZcCFo1z6S+QXfmaQpdqysrmUWWb9fOM2YX4214SUG1VQRFr+NVbxSeVKf
	TI6GP9c9IfyFPpVY/N7C2GrWm6EPGbpfZwrm/SbGBpdkKhiTTJLBgl4XF1DOIZkojpmwlacK8X0
	ehVNljKL637bN6mPx8YwpVPTNY1gNc+QZ/M1ypWS9qtwq91ZkIN9BGXn4q83/rvz+we7vnS09HR
	v5ptkEvTzx2Ml1d4LoQPBDK4nXTnYWIeUuY7eTaqd2wkfrYLArUnaM1YRJ1lI+SiowhExEcZdwu
	EFKJmNooA9nPJlvVFbHp6LpCf9ZCCvVVP1iaBTu8
X-Google-Smtp-Source: AGHT+IHMzdomMMzlq4KGCLymz5PTggicrRz+TP8w/tfk7qhqTrOD0GKRynUQbqlHnDL/LsXEtE08DA==
X-Received: by 2002:a05:6a21:9991:b0:1f5:79c4:5da2 with SMTP id adf61e73a8af0-20e979c9149mr8579279637.31.1746409960824;
        Sun, 04 May 2025 18:52:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:40 -0700 (PDT)
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
Subject: [PATCH v5 14/48] tcg: add vaddr type for helpers
Date: Sun,  4 May 2025 18:51:49 -0700
Message-ID: <20250505015223.3895275-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dmuhNsxAsvz0

Defined as an alias of i32/i64 depending on host pointer size.

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
