Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087422lfc;
        Thu, 12 Mar 2020 12:42:40 -0700 (PDT)
X-Received: by 2002:a17:90a:f496:: with SMTP id bx22mr5908963pjb.115.1584042159969;
        Thu, 12 Mar 2020 12:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042159; cv=none;
        d=google.com; s=arc-20160816;
        b=cJgxZFaqIOVHq6ATqJcSNnP7CmU7xNaf+DLOhmEF2HhMJ+9uUR0/BsnbJhWJmHEDwy
         Kjn1j6utiNl8GOIwi49cmmDKtRcHo6Xot+FXWDtPeO6hbx+PJP7AynnuIDQc4/LfEqHJ
         oxWSIST3po/sFJXwrYuZ5hep+pGLVLRdxe0UJh7Ka997hKZ6fwl1VksOuXur55TN4hij
         ayjoOddjupc+qoj+JncQuxSOl4SIqxtPjSPsz7ib7OEQPqTHbWrBsZZ+NJuCo783xaBK
         UWgQ16Tk0iwKSYkOkNo0GZ626Ex3tKwNYrbFBNOb2AKhHaBFAuRh/FA6a//nXJreO/0v
         ZM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wN0TfHqfZivaapeBhs6fRX0f635NiC55vaX3XaH653M=;
        b=q6lxgtwxlFHGgDfmr/SowyKoCT5iE1ipk8nnyVnWg4qlfSzZ1Mg0COelhD07bajlsq
         Y5ih1BT2blw0YD/yD+EiTNyh5OeWA9eekl1ZopblVg1ee8udb/NOWuajBptOprS/tgj4
         urnc6pB3TboB1tW85DnC/WiUKFB6hNo6FzGcEqqd+bbCrKTUbMIxb3pDLD//vxPzv2LS
         owuYntJqQ3mGmotG04PCYXCv5LKpG8Q7IgNqcdgKtLjfa+xynZQw8L5FUBea1wbchMkm
         4GSBYIbLvkpMpAOmhOs6Ir+5Q7vH4YPuGFgrWapzIvxx5XJ3YfVScplbvqmnCIL2dVwX
         Jfmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViHYVa2I;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id cm15sor6829473pjb.3.2020.03.12.12.42.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViHYVa2I;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wN0TfHqfZivaapeBhs6fRX0f635NiC55vaX3XaH653M=;
        b=ViHYVa2IeF2adL4f3D4ETRqrlHVsziMQ7lV68vafRzNA2+lyX+m/bhOYsTKGAeVAHA
         bsxm7M/poAJu1lqEqXuChqSrsqeLqpX7PMcgcMNjg0RdiK9uJIqWT7ZyE13bb2B900v6
         TAurQKqQicROPyOkVxxQAn9wP6mnR1qV8zXhwhWBti1kdDfBLb3r3rRJj7xZLcVXHfed
         9KLyAWFXcbwMsOKYXWMPfh8XdbK9t+WOFZwcIK8mkBsEydJoXn3eQHg9uHVbwzxAkelr
         a+DeCQF4BDR4G0SgFjTfW19BdUeNJwzdlM80R2JDmaIfK1UbETWpuaNVcjJEtv2RdGYa
         i04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wN0TfHqfZivaapeBhs6fRX0f635NiC55vaX3XaH653M=;
        b=o+yRamg5+zWvBLzcqAiz9LBhrhQCK2GgSR0iXhCus3/5FvDghrhSiEkYgSNiRFdocY
         PEjX7W/a1+/dV55+VnSUN3uuWH89TLXFTC4j4JAbwQE8RXZjK0SYEsXSjFrSNRwVpKPv
         m4FJlZ08jC0JZKgNb4+1Ul4PB1D/83GkwFHhg+HegZ9HWnXOLt86NC9aJJ4okeuajSKv
         c8he5ASWQWdTj16+AdIZX9vgKWFvCN5WyMNu+xEk9YjeL+1HWpfOPGVKu95w/AX92Gmo
         ytnc6JDaHFod33zy9K0VTDm09bui8Vv0l1VNN19UvQAFAQkeCNXRmq2KqZieQmVrbqGh
         wK4w==
X-Gm-Message-State: ANhLgQ3oyIVqMDgCZCZdObSBLE3nocjtxlQbUtUwNRL7f3c3ffmDey1v
	aurf7CQ0jgSTaIx/iEoR1YeEQQUG
X-Google-Smtp-Source: ADFU+vvBl8xXhve2nk+KtSWPbdc4kzq+cZcbkDzr/ZJudrGaWu/pRVyl7s3X1RskCe7fJ2xQHu+xXw==
X-Received: by 2002:a17:90a:9306:: with SMTP id p6mr5806526pjo.0.1584042159488;
        Thu, 12 Mar 2020 12:42:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 14/42] target/arm: Add helper_probe_access
Date: Thu, 12 Mar 2020 12:41:51 -0700
Message-Id: <20200312194219.24406-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SHhHG+nvZfja

Raise an exception if the given virtual memory is not accessible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  2 ++
 target/arm/op_helper.c     | 16 ++++++++++++++++
 target/arm/translate-a64.c | 13 +++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 72eb9e6a1a..8a616ed6d8 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -95,6 +95,8 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
+DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
+
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index eb0de080f1..b1065216b2 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -935,3 +935,19 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
         return ((uint32_t)x >> shift) | (x << (32 - shift));
     }
 }
+
+void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
+                          uint32_t access_type, uint32_t mmu_idx,
+                          uint32_t size)
+{
+    uint32_t in_page = -((uint32_t)ptr | TARGET_PAGE_SIZE);
+    uintptr_t ra = GETPC();
+
+    if (likely(size <= in_page)) {
+        probe_access(env, ptr, size, access_type, mmu_idx, ra);
+    } else {
+        probe_access(env, ptr, in_page, access_type, mmu_idx, ra);
+        probe_access(env, ptr + in_page, size - in_page,
+                     access_type, mmu_idx, ra);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 49c94bc565..45a95d8ea0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -249,6 +249,19 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
     tcg_gen_andi_i64(dst, src, ~MAKE_64BIT_MASK(56, 4));
 }
 
+static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
+                             MMUAccessType acc, int log2_size)
+{
+    TCGv_i32 t_acc = tcg_const_i32(acc);
+    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
+    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
+
+    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
+    tcg_temp_free_i32(t_acc);
+    tcg_temp_free_i32(t_idx);
+    tcg_temp_free_i32(t_size);
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
-- 
2.20.1
