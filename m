Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4296049ejc;
        Sun, 26 Feb 2023 21:41:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8qiX3ViMckrLHmBXkn6w+tFIYcwhP8aJki+6csGVyAwthPzOfFgFaTf7n3Mz3OUL/kv54z
X-Received: by 2002:ac8:5947:0:b0:3b8:58d0:b4e4 with SMTP id 7-20020ac85947000000b003b858d0b4e4mr41433918qtz.33.1677476471544;
        Sun, 26 Feb 2023 21:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476471; cv=none;
        d=google.com; s=arc-20160816;
        b=TEDxGZWOa8dVfi1/sMKVpfWz4Od2QoeHuqs9F+CHxmG2hCfxzQLv62q8bZ+IZ/q+lm
         QqQ4KAtYLsyrEEMAH+ZI8MkZwYpC8yoW3HKBMFwj3fl6aasY+4SxxjKg08qw66IQXJeY
         mE4Bhk6YyJr4W2/YKGV0LHaBxwa0hhjKmwIYsfmshJYAMJskV9YWLjc2/iCnxCrA1Vel
         uW4BqO7SJNiQ5N7wvKrzWWjEBK28ILI1FHGELBladxIsbca8SkXLQb1NrDJUjzv9NIkF
         cLjfTnBTN/XLz6iY9ycF76uMJGqbWFAuytFZgDsV0jceV2lhQ3s2YF2kJaQ0x7mwGSej
         BZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
        b=MDUHVTeCvDGnk+FRlvQNzDzVwNN9geoW+fcHBDxA/Dtm3jRCtt7Lhv85OYClPDYAAr
         Kcr7VUWUT2mFkKY6yWC+EcWA/DZ+QNVgEvRHa4xKmBSEBRi3ieLl5FbhIDQjkmeQnYwd
         XROswXnfb/tKeSLPk31sIQacNY+8LQVyeQyAwWS9U5N7Lh0Y4braDJAVV0hcuVYQClI6
         FhT+kgbNKnWIgRj9Zsfn2769ZAFDKy4Jp2/Pv7d9eXfhAJthYlXj+nubJeGvMvRzBbbH
         nM5PST5J6riaP9wUwPjZHpNdSSP9GEFINabdODjMzM1Js+pM+xacGn+pzRVzY5KXPzhl
         lUCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyt2k5Ud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020ac85f54000000b003bbd8bdb931si5777757qta.789.2023.02.26.21.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:41:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyt2k5Ud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWFW-0004rH-QL; Mon, 27 Feb 2023 00:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDW-0004Cv-QW
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:31 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDU-0002kZ-0R
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:30 -0500
Received: by mail-pj1-x1030.google.com with SMTP id l1so4898134pjt.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
 b=Xyt2k5Ud8eiGrcvqCwysPkVoeyDvBNW4qJpXU+br2EzibIoVBJ2Yqu24dH4NMfCkGK
 PgAXe2EAfxemCQ4TnoNTl7zgTEnyOo1MnpJ88B9wptJPKK2YhUZrqHKVafXYQ+39qN2p
 GFg5oW4chwgKYzbcPY6F6OGmqpqJh/XOIaqJYf/QFjqzzAiDDFnq+0JvJxP/edpm/8j6
 i7YKQEDNBHMuyuPGr/o148tOAoKHi9+soy4DRTb7Y3Bob6qCxFz+1RvPnK31JEfrHRaW
 3h0+2Gsh62ZQHpjCz1MaJ9NJjubpT4FQJzOP+3wlZh7y6Hm37SqZ2baVJ5sKlHcBGGTz
 QCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
 b=fIGy3Tswb4kivNu2Kyajbxt7XFJOivarQVh1qC4m0LnDO2vQl5VMr9IRAHvYrl1t5x
 u4C8FHYPofGGmus6/9+qBVGhjYrbLX78ZcbXkDZO3W/JTmhHfaTIxr8rJ5SAj3vxMkOb
 IFh8YxPCrgYo8bGW8ht6XvalqF4AcsoPqXYgZcRnbCffOAAaVCbzfSvvdFwHzzwWoJqR
 q7xWHDj0rpNqbaFStdjlU9pgwoPQtnXzkBSe7ISGCZV6fDQduYA0aRZwbrhZdC6JFfyX
 qwkxYxTzWwB3/2uq9bBFOovNBHPXdEdk0CQpOtl35oYKQs14M8b5uFHtb4/rJejcZIcV
 q31A==
X-Gm-Message-State: AO0yUKVf/FRMbsGi8CpVFaxmpn4GN91Wyp32Cc8x6VbEvLhprLb7TBPw
 ECUrpk63lxvmzh+bxUUsIx3dww==
X-Received: by 2002:a05:6a20:160a:b0:b8:a0e1:2739 with SMTP id
 l10-20020a056a20160a00b000b8a0e12739mr29438519pzj.3.1677476306870; 
 Sun, 26 Feb 2023 21:38:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 30/31] tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
Date: Sun, 26 Feb 2023 19:37:00 -1000
Message-Id: <20230227053701.368744-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZG9ErQ2A+oPT

These symbols are now unused.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  2 --
 include/tcg/tcg.h    | 28 ----------------------------
 tcg/tcg.c            | 16 ----------------
 3 files changed, 46 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 66b1461caa..353d430a63 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -828,14 +828,12 @@ static inline void tcg_gen_plugin_cb_end(void)
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_mem_new tcg_global_mem_new_i32
-#define tcg_temp_local_new() tcg_temp_local_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_mem_new tcg_global_mem_new_i64
-#define tcg_temp_local_new() tcg_temp_local_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2e220d4040..7e2b954dbc 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -905,12 +905,6 @@ static inline TCGv_i32 tcg_temp_new_i32(void)
     return temp_tcgv_i32(t);
 }
 
-static inline TCGv_i32 tcg_temp_local_new_i32(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
-    return temp_tcgv_i32(t);
-}
-
 static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -931,12 +925,6 @@ static inline TCGv_i64 tcg_temp_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
-static inline TCGv_i64 tcg_temp_local_new_i64(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
-    return temp_tcgv_i64(t);
-}
-
 /* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
 static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 {
@@ -950,12 +938,6 @@ static inline TCGv_i128 tcg_temp_new_i128(void)
     return temp_tcgv_i128(t);
 }
 
-static inline TCGv_i128 tcg_temp_local_new_i128(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
-    return temp_tcgv_i128(t);
-}
-
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -976,12 +958,6 @@ static inline TCGv_ptr tcg_temp_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
-static inline TCGv_ptr tcg_temp_local_new_ptr(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
-    return temp_tcgv_ptr(t);
-}
-
 #if defined(CONFIG_DEBUG_TCG)
 /* If you call tcg_clear_temp_count() at the start of a section of
  * code which is not supposed to leak any TCG temporaries, then
@@ -1084,8 +1060,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_i32 tcg_const_local_i32(int32_t val);
-TCGv_i64 tcg_const_local_i64(int64_t val);
 TCGv_vec tcg_const_zeros_vec(TCGType);
 TCGv_vec tcg_const_ones_vec(TCGType);
 TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
@@ -1113,11 +1087,9 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
-# define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
-# define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i64((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 758b2a3e06..b65f2ffdbe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1476,22 +1476,6 @@ TCGv_i64 tcg_const_i64(int64_t val)
     return t0;
 }
 
-TCGv_i32 tcg_const_local_i32(int32_t val)
-{
-    TCGv_i32 t0;
-    t0 = tcg_temp_local_new_i32();
-    tcg_gen_movi_i32(t0, val);
-    return t0;
-}
-
-TCGv_i64 tcg_const_local_i64(int64_t val)
-{
-    TCGv_i64 t0;
-    t0 = tcg_temp_local_new_i64();
-    tcg_gen_movi_i64(t0, val);
-    return t0;
-}
-
 #if defined(CONFIG_DEBUG_TCG)
 void tcg_clear_temp_count(void)
 {
-- 
2.34.1

