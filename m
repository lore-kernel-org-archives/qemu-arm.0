Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2942010lfq;
        Mon, 11 Jan 2021 11:37:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0s2s3/kSnYLXOHNN8Oe8iqZsHxrg4WQ04v7NiSidefXq2nq4gRhQbd34dc3gsBGDogdt/
X-Received: by 2002:a25:7c06:: with SMTP id x6mr1940419ybc.445.1610393825031;
        Mon, 11 Jan 2021 11:37:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393825; cv=none;
        d=google.com; s=arc-20160816;
        b=mb02Hkve/tMtyiZEQr2XaqEnc0b82E1fEGUjJXX6hn2+IOo+sEQPtma+LlojEELM3x
         iykpl+yKRamjz6bUg4kltW95W3eeOHeTp85jqI9Iag3yQ65muJvzSa6mR+7M+maSxcUQ
         7J/1L0Tex4Y5SdcLZhsN+fOZLJ0V0B/gBmS1lJGEuawAWvx1TIQhdOGZjJ1O9oZ4fJO/
         MUN8ZNd4dIDSTngjyjZq9odgzlpEuwD+1gZpRGFLJrkCt3jc5e6GibTNIH1dmf0EwAtD
         nwF2BLmdc/68ebO2iT0yJsMRCjvIcHXGTk4Z5LYRnviGe4pwmjnOzogmyhtucrm6Kgo2
         aBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LMCF8q7A21kXUpOcDk/n6acbUew2GqwmafvBGjmsF/Q=;
        b=nom8HFbih4sWgvR30dayAAURiy6NWv+AovT++L5cEg/8MfHtHX8d1mmozVEAnHrJyC
         iDc7+KmeX3rRmJvlFND5RQF66CbJ7qi4PgUrX5cLqMhtEJxhL2KOoJhjCwlmlzvsersX
         ZKIWCzmvKX0izlfGxjvV8Pdd9wtgEywxkFj/7B1oVI5XhWZS1i8lS3UvBUDYYEjdySEa
         dPt25B0yVrzusTCwSpWqCbgG5TTfKipNPP8SgWI9wjEYIF9kKeE96LBdj3kd12xz9Jcu
         B9V63mlbCzFH0F2hJ5ZxZ9QVa5ABfC3FGrFqPWMC1HVouf0HlG2BGUGBSmyNrEFB+crj
         45wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ila6muUf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si764184ybt.197.2021.01.11.11.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:37:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ila6muUf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2zw-0003IZ-DH
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S5-0006OX-8B
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:05 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S2-0006WT-1m
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:04 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l23so109676pjg.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMCF8q7A21kXUpOcDk/n6acbUew2GqwmafvBGjmsF/Q=;
 b=ila6muUfv1NetpureejFZh0kulP+DrMan01CqbWIwGd9s5fPWoAWozRnmspD+34IPX
 wyZvmL5pXuheuJWl+C9UstsqlfKcGscju8/aiu5zaUsRkoK0o98yRQgw2EdurUkIeUQT
 EmKU8nbCwYfeT6gmIyzXFWRLLoO0DfGv8B/Zht4UHcX/183Sg+7Lc0edC9yWxBv/8bjO
 idpnX1YMFVycpCFOOi43FA77JpqEi6slCO1x8/ArIur/kdhMNSBSrEGohlRoMlauXFq2
 SQUbtemb8ZzR3v7CuMuszx+3KeSBllbBILTAvYbHfrlTIyz1OvlihGl2Yr18ZU7QCy1h
 fXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMCF8q7A21kXUpOcDk/n6acbUew2GqwmafvBGjmsF/Q=;
 b=QWdqdTScCJMGv+yUVr3UgezS3u+gdMZDyiYx78ZKRb3ah7rlduPORPzLnVAoY/IKcw
 v4iG4doutnVCinEtj2PR5hVJHhqoFWHeHidlb756RQ2c7tEKliTVMJbMAg68cSskohMH
 H2qw5W+3F7LNWlQJ2OwWxA+vY2GQoEmDMZYryXQRyY252eMtwBYIIiU4V4l7gpK8XxSa
 WhICfhDuCcenEU4+BtUdlQT2jvKrv6VCIBSeT8qKHnPeJmE8vDIQ4wuMfTT/9EI1ZBFb
 g1XuXQgdH8QSmpzKDY41BMyXt5QjzhNAgXqp85oSC7bwo4WL+2pxdp33W2m48xGhaxzM
 IssQ==
X-Gm-Message-State: AOAM532uKbLx+sXGcm9VEfTYUYGaghq34A8rcnLMGxcpIbXVJXJpuU/5
 H8+mNjGMJ+5lVCS9ZnUvijQHdkoyce6rxw==
X-Received: by 2002:a17:902:fe95:b029:da:fa53:666 with SMTP id
 x21-20020a170902fe95b02900dafa530666mr714476plm.72.1610391720129; 
 Mon, 11 Jan 2021 11:02:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/30] target/arm: Use finalize_memop for aa64 fpr
 load/store
Date: Mon, 11 Jan 2021 09:01:08 -1000
Message-Id: <20210111190113.303726-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkFeQND8gr+M

For 128-bit load/store, use 16-byte alignment.  This
requires that we perform the two operations in the
correct order so that we generate the alignment fault
before modifying memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5d93fcf25b..9255763ea7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -957,25 +957,33 @@ static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
 static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 {
     /* This writes the bottom N bits of a 128 bit wide vector to memory */
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    tcg_gen_ld_i64(tmp, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+    TCGv_i64 tmplo = tcg_temp_new_i64();
+    MemOp mop;
+
+    tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+
     if (size < 4) {
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s),
-                            s->be_data + size);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
+        TCGv_i64 tmphi = tcg_temp_new_i64();
 
+        tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
+
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
+
         tcg_temp_free_i64(tcg_hiaddr);
+        tcg_temp_free_i64(tmphi);
     }
 
-    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(tmplo);
 }
 
 /*
@@ -986,10 +994,11 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     /* This always zero-extends and writes to a full 128 bit wide vector */
     TCGv_i64 tmplo = tcg_temp_new_i64();
     TCGv_i64 tmphi = NULL;
+    MemOp mop;
 
     if (size < 4) {
-        MemOp memop = s->be_data + size;
-        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr;
@@ -997,11 +1006,12 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(tmplo, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_qemu_ld_i64(tmphi, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
-- 
2.25.1

