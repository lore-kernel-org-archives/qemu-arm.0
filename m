Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756125njj;
        Sat, 3 May 2025 22:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGQLpEJIoD4G6MOAo5k7KSVrT1NQZrUlXbCUqMFxTVeAewXRoEhP/BnC58IYwiH+/0Rnx8Uefx7+Cbfw==@linaro.org
X-Received: by 2002:a05:6a20:d04c:b0:203:bb3b:5f1e with SMTP id adf61e73a8af0-20e962056a3mr4248659637.1.1746336573029;
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336573; cv=none;
        d=google.com; s=arc-20240605;
        b=eGFfWCqIEW3Y4e5xgpvvCD8HEpwx5r84lNzDihT+8jSBDkJnk3JVM+AaiDZZ8wyXv8
         EmXNmeVJE7doui1/w0spr5LiGSjwZf4CBWJ54ovpCkJeay4GG+fK1atLrY+Dm4nwGrCJ
         S9Mx92cM/cNxxGno4NcG4T0Rqt52Gm92QQOu6M8NNMTukbO6tIqr94BTMTIHes+oA2YZ
         37j3LHXPqg6Mhe2j++A9FO1+KiCLgcPvpCE3z6ffpUWBYR6QDkpFoVzjGAr1sQGChoEu
         IC07sGvlY5t4Df3rvUdjBW2eUoMVooQbfO7hFeLq/jyZjmzEWSqjCcUSshB1NX8yzR6t
         IsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z2AIxKY+FMiPJgej6tAa266T+4QbSc+CiL7TGNxQcGc=;
        fh=c7gJWyUSA+PDdsr5BvzsrPOyWywM3rBfyBb9AzQkvXU=;
        b=WODVi1a+wRmIvhGUto8DBV6GV/KKLbOBsq86VT4eP7EQ39VvIBhqqdQlI6o/oxjy7t
         TpyEXB2X5VtlmPWGJkJfaQ1SCVW43jdBpaUMKTKb1/XGC/CpOAbPwUfTqs3Eryuh+BcQ
         Or0NVSBtiDVw9DC//iC4gY4qscSP2axoulmSVdZc6IE14glQlFGGLR4i/6BfFgBCCmnX
         vvcGU62kDq8Pa/gqhRVniSSVjgqNLm2/HBUhpimaUmfnWQsqiCvUElflsoWhUUcDJQ/7
         yk6zOyl9PFANAP2oY7xjm9jXdBhw2zcJQiYzG+jQSi4ARTRxzKStzVGVTlvR2sj09AeW
         oK0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RbN3f4Tg;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef1500asor3085370b3a.3.2025.05.03.22.29.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RbN3f4Tg;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336572; x=1746941372; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2AIxKY+FMiPJgej6tAa266T+4QbSc+CiL7TGNxQcGc=;
        b=RbN3f4TgxFJSDadVJZ5lsVVa0LcvnEncEbooSOcVOOiwd1wYbwIFCsy2Xn1OODdmym
         3MORBlB6wfcQLU6Dt1tEGdGVUR6OMsJziueCHwdryuiM07ByxsBa9xPaBmZvciEUR3J+
         muc5DjpGGkf5mGsTpSGIz3vWT+0/Iy40+wcAuhPY1pIPbKIMeZ/a7f96r2xKvhb2RjkC
         Q30Qna1Gw4pVj482qdeUqBQg42abk4CIuNSyVk7YWn5SzWOwLEEHHKrbZ7i6i9hjPpew
         VPLt62dcqbOm4RvZcRyqmgysXlGzGATbtRmATuR+AZwx6K0+msCSZJP5uPe8tPjjyiF3
         qyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336572; x=1746941372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2AIxKY+FMiPJgej6tAa266T+4QbSc+CiL7TGNxQcGc=;
        b=L/B4PPH5wkc7xJeGz/s0gwcQ9c3TsIdslEU8wqLG6Vdtz13J7Oj8WPwTPQ2fCim2yX
         bIbFVQkWI3LwKrrhKYt5P1EXdlNvAMScXXs6fDpwcnTRBzpG0ZU/p0A+/F2O9tb7C0qL
         QoqDv/qwG6fZvT3ubNWEKrSeUpYwL/6+QA3sadUO+utetxJkcGbPg4f+nCHnvFBJWuFc
         +8suC0qyjGuMwzPoJ8WT6TC4uaFu3zTbSzXZyA3iABa93aEgRDDLFiyNW481RTLcMMGJ
         GpY4P7LohK4pgvup2+Cct4kbvPqST0PFqA96Ar7e3WiIEIZQ+TVaDR9ExMH3OZVLFgM2
         nEww==
X-Forwarded-Encrypted: i=1; AJvYcCVU1WjeW5aBaejkpU+dJjAz7d6ezomHDfQ+9m03J0C8OWTSGzreU6ijMbo5JxFtsZNKHZojp5/RX/STtw==@linaro.org
X-Gm-Message-State: AOJu0YzsA2wdd4Qyxe0JLIPnG6gFSXZl6OzyU7WYKss4Zd6oXN7DmD4g
	vede2pyg4F+Vd7DnGT+o0WvR/+NNT7Dnal4d+ler3HHoVnNcdkCp5FVsobed/5cz7Q==
X-Gm-Gg: ASbGncuvHux2ZMFNYAdSG4lzh34N/tqoT5Mu5S9rwd/b2jeQzrq96foqwAIJFtLZbM0
	woLVHxeSmmHCPJ7hQU8ZGHB6OAvdZq9FIE+QvFiZjdHJPcMLqkdlbHW65ueEKxIns6JljeANcT9
	xocbgjDqmQ7DeBe8mMwTFjGyTQH75RySmAeZy59Mz3NOiFJECtsF6GAeLM6KfRs5gS+QMgyLajK
	B/nQbD0xlBtwQIc8Edv3+Q1mYfd4uPy3nsD2l50Vv0Ao67mMRScsKsSii0eICOZBehnzJOqXeBV
	k5vublXdkeH/pi6pBIm2kfRqGfKt6dj+ytNS/SI0UW7SrVYbeOc=
X-Google-Smtp-Source: AGHT+IEU6HbixXtpyc/R49r3cZVRH0CTjPwr5pxfq2u4SUp++XWmysJGYYMZORx1y251tL8QRfDM8w==
X-Received: by 2002:a05:6a21:6d8e:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-20e9620551emr3117470637.5.1746336572592;
        Sat, 03 May 2025 22:29:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:32 -0700 (PDT)
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
Subject: [PATCH v4 14/40] tcg: add vaddr type for helpers
Date: Sat,  3 May 2025 22:28:48 -0700
Message-ID: <20250504052914.3525365-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: t6nZp5Sk+jhw

Defined as an alias of i32/i64 depending on host pointer size.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op-common.h    |  1 +
 include/tcg/tcg.h              | 17 +++++++++++++++++
 include/exec/helper-head.h.inc | 11 +++++++++++
 tcg/tcg.c                      |  6 ++++++
 4 files changed, 35 insertions(+)

diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index b439bdb385a..7d7375eef44 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -14,6 +14,7 @@
 
 TCGv_i32 tcg_constant_i32(int32_t val);
 TCGv_i64 tcg_constant_i64(int64_t val);
+TCGv_vaddr tcg_constant_vaddr(vaddr val);
 TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
 TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index aa300a2f8ba..0eb033aa7d1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -188,6 +188,7 @@ typedef tcg_target_ulong TCGArg;
     * TCGv_i64  : 64 bit integer type
     * TCGv_i128 : 128 bit integer type
     * TCGv_ptr  : a host pointer type
+    * TCGv_vaddr: an integer type large enough to hold a target pointer type
     * TCGv_vec  : a host vector type; the exact size is not exposed
                   to the CPU front-end code.
     * TCGv      : an integer type the same size as target_ulong
@@ -214,6 +215,7 @@ typedef struct TCGv_i64_d *TCGv_i64;
 typedef struct TCGv_i128_d *TCGv_i128;
 typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
+typedef struct TCGv_vaddr_d *TCGv_vaddr;
 typedef TCGv_ptr TCGv_env;
 
 /* call flags */
@@ -526,6 +528,11 @@ static inline TCGTemp *tcgv_ptr_temp(TCGv_ptr v)
     return tcgv_i32_temp((TCGv_i32)v);
 }
 
+static inline TCGTemp *tcgv_vaddr_temp(TCGv_vaddr v)
+{
+    return tcgv_i32_temp((TCGv_i32)v);
+}
+
 static inline TCGTemp *tcgv_vec_temp(TCGv_vec v)
 {
     return tcgv_i32_temp((TCGv_i32)v);
@@ -551,6 +558,11 @@ static inline TCGArg tcgv_ptr_arg(TCGv_ptr v)
     return temp_arg(tcgv_ptr_temp(v));
 }
 
+static inline TCGArg tcgv_vaddr_arg(TCGv_vaddr v)
+{
+    return temp_arg(tcgv_vaddr_temp(v));
+}
+
 static inline TCGArg tcgv_vec_arg(TCGv_vec v)
 {
     return temp_arg(tcgv_vec_temp(v));
@@ -572,6 +584,11 @@ static inline TCGv_i128 temp_tcgv_i128(TCGTemp *t)
     return (TCGv_i128)temp_tcgv_i32(t);
 }
 
+static inline TCGv_vaddr temp_tcgv_vaddr(TCGTemp *t)
+{
+    return (TCGv_vaddr)temp_tcgv_i32(t);
+}
+
 static inline TCGv_ptr temp_tcgv_ptr(TCGTemp *t)
 {
     return (TCGv_ptr)temp_tcgv_i32(t);
diff --git a/include/exec/helper-head.h.inc b/include/exec/helper-head.h.inc
index bce5db06ef3..b15256ce14d 100644
--- a/include/exec/helper-head.h.inc
+++ b/include/exec/helper-head.h.inc
@@ -21,6 +21,7 @@
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
 #define dh_alias_ptr ptr
+#define dh_alias_vaddr vaddr
 #define dh_alias_cptr ptr
 #define dh_alias_env ptr
 #define dh_alias_fpst ptr
@@ -37,6 +38,7 @@
 #define dh_ctype_f16 uint32_t
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
+#define dh_ctype_vaddr uintptr_t
 #define dh_ctype_ptr void *
 #define dh_ctype_cptr const void *
 #define dh_ctype_env CPUArchState *
@@ -91,6 +93,15 @@
 #define dh_typecode_i64 4
 #define dh_typecode_s64 5
 #define dh_typecode_ptr 6
+
+#if __SIZEOF_POINTER__ == 4
+# define dh_typecode_vaddr dh_typecode_i32
+#elif __SIZEOF_POINTER__ == 8
+# define dh_typecode_vaddr dh_typecode_i64
+#else
+# error "sizeof pointer is different from {4,8}"
+#endif
+
 #define dh_typecode_i128 7
 #define dh_typecode_int dh_typecode_s32
 #define dh_typecode_f16 dh_typecode_i32
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c4e866e9c34..e86576120c0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2368,6 +2368,12 @@ TCGv_i64 tcg_constant_i64(int64_t val)
     return temp_tcgv_i64(tcg_constant_internal(TCG_TYPE_I64, val));
 }
 
+TCGv_vaddr tcg_constant_vaddr(vaddr val)
+{
+    TCGType type = __SIZEOF_POINTER__ == 8 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    return temp_tcgv_vaddr(tcg_constant_internal(type, val));
+}
+
 TCGv_ptr tcg_constant_ptr_int(intptr_t val)
 {
     return temp_tcgv_ptr(tcg_constant_internal(TCG_TYPE_PTR, val));
-- 
2.47.2
