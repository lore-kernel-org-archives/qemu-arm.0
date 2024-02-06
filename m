Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1531051ejb;
        Mon, 5 Feb 2024 19:07:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEC1/xUhS/Rcr8/xDAm3OV4NEwCJYEV99byeR6+doIRTAGYceaF+0ObllpMe+YFes6W4/7b
X-Received: by 2002:ac8:6719:0:b0:42c:3661:439e with SMTP id e25-20020ac86719000000b0042c3661439emr248206qtp.37.1707188834035;
        Mon, 05 Feb 2024 19:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707188834; cv=none;
        d=google.com; s=arc-20160816;
        b=sE4EozVGZTAmwKKaZCjb9HpFl+JKXbimfWMr3lsIw24/Lq8/2Aqafe8sShSGAQdVPC
         oN6OmIbMYDhFmr6EjcJigzICguF/FODvf/sCnmxHv8IwH/JDsQSj0pbiY1KBxRgAUmjw
         GiSPHRzL0UO32gJi17oDZahELIAkFmoovhBFM9Cy2yiEyJxJu8i1GDXJGS8eCaX7I++T
         qDKY7D/Zr73huT28lRNi0ynxBZcojtVyNJGsSCgATB86A6Z16BEvktPJaIX7HLAG4Kcc
         JutbhppQEUkvtNBEAi2OcUUtJPay3mYRJCKoY48dxroVa00zc/+3Ye74lx2fnagXsSy1
         UEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gHPXu0j0nAO0+SMsvMvHJ8lHzrBgl7Y3ITORBgFmLRk=;
        fh=bXCCAGG6danHGVkddqVi5f5uLoYLsscHSyh1K2eC+4s=;
        b=vuve5nIyftwT89TCe8LbU6xyslI+HTPfOW5Ym8lMIa0s7aS8j/M1bO95/CjdJE/54Q
         YgdYt5OQmq1rm//8LalEjaojkdYTgu/Z4oM3VGukKSsrMelCbRUv6l9O8mz4w0Ulivbq
         i5XYDLsajT20ZhKQziKhwhsSZf1+2nGSu+QKtVe1G88A05Wmb2L+PGKn6tD2uhH3Pjkx
         vz3+2LgNig4lEZm80+/Q1cJwULz9uhjco8CeRoc9Js/xOHl2TjyiCfWWDEn2O5Gl/HbL
         sRNjohEScOE2ZPppo/SURacBXyeb8Guj7DT+0lg3JKItz/qJb06JGfgaCcA7bQUwFA83
         Vnog==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8orwk48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCV47FxEPXgWt2Ku7sxUDhullb1B8g2BcAkQM3VVH6WbirFEAie6KNNYzFDfSyNl8i465ETUUTD45KHjG6B+nTMew1kuD7MF
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05622a181400b0042be48cfbd6si1404115qtc.250.2024.02.05.19.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 19:07:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8orwk48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXBmV-0006wH-Om; Mon, 05 Feb 2024 22:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmU-0006uj-9o
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:54 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmQ-0003G5-9D
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:54 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6e05456a010so492321b3a.0
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 19:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707188741; x=1707793541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gHPXu0j0nAO0+SMsvMvHJ8lHzrBgl7Y3ITORBgFmLRk=;
 b=U8orwk48UD4w2FFG5jHnixYJ29TCV5RRo9Et6BUusFiBj6Y/amebwMS7gFzVsmJ+mN
 dGIFhp6w/KKanlFjBmiT1/lAX+6c10shyuyI+M/MZ1vNvLG2YfDQsCi3krS8nolQU16D
 ZvF73O59vKVPi6tMgxJTVI3lvqkJYYhxFjABUSQkySiFdPbz/muuiJkcgk8OcXe1tojz
 ugQAHZaNCM+Rd0ZbOkHB7s4lEINVmBZbRWVxjoNdz+XN9Rn+klKxeMtZeZLqmzbi9ySe
 YA4HIIt4009w3BHKzixvrItlR1wqx7rxZODAd8+ThzSOkXmKhfmZmf2IwcbFC1d2I80O
 3OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707188741; x=1707793541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHPXu0j0nAO0+SMsvMvHJ8lHzrBgl7Y3ITORBgFmLRk=;
 b=P1gxuzQQ8BpfBf1U3rGFAlF/qKuiO8wx2RQnOXq8DcOq4lQFhv2hFNAuMzQe6CF0FH
 JbDkWywETPTFJmDLlCnu4jKmTCaAaTVrQIBlKZipIJDysAAgZvsaiahVrIBZ4dPaV56f
 GtMDeRMwLVQ2XGvShZWj8knueXqKZEWH9UDuYC9EH27RxATcxf2m+bOm0DkVrlnM2nm5
 vO7S1werUN94HwAxrCAohxVX8t2tjyXf10fNuohvjVfLBpTBDAU9OdANPCB3NFWdDVfn
 1mHqBv8R1yg5jKqPNJFBaON8wIW8g3m/WUN733t61wIcKmsQLeSdrrqE1rfqC0qxhiNA
 lXRw==
X-Gm-Message-State: AOJu0YxgY0ltXNGHwmKFP0i4E6LNKXqWy6s66yP+wQhqPsOf5MwA3mkV
 Bt3nT1/e3lLPfw/WRfZ4w5vfq2rEc/JUHOp3qIJUlo6H00wPRJohKoezPd/0K+Y=
X-Received: by 2002:a05:6a20:7209:b0:19b:673d:824d with SMTP id
 y9-20020a056a20720900b0019b673d824dmr327389pzb.46.1707188741089; 
 Mon, 05 Feb 2024 19:05:41 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUQ7tQ5Cubv0pchS/7CGd8F0TqpmNW3ud5JUcjf4DnVWODKV1G1Y796ss0PZHp738doxMf7t8HzvdkpyDdz2koAurvdHqLyOiuW
Received: from stoup.. ([43.252.112.200]) by smtp.gmail.com with ESMTPSA id
 r14-20020a62e40e000000b006e025030700sm627478pfh.190.2024.02.05.19.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:05:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v2 3/6] target/arm: Adjust and validate mtedesc sizem1
Date: Tue,  6 Feb 2024 13:05:24 +1000
Message-Id: <20240206030527.169147-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206030527.169147-1-richard.henderson@linaro.org>
References: <20240206030527.169147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CuKwPjJdwJI5

When we added SVE_MTEDESC_SHIFT, we effectively limited the
maximum size of MTEDESC.  Adjust SIZEM1 to consume the remaining
bits (32 - 10 - 5 - 12 == 5).  Assert that the data to be stored
fits within the field (expecting 8 * 4 - 1 == 31, exact fit).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h         | 2 +-
 target/arm/tcg/translate-sve.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fc337fe40e..50bff44549 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1278,7 +1278,7 @@ FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, ALIGN, 9, 3)
-FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
+FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - SVE_MTEDESC_SHIFT - 12)  /* size - 1 */
 
 bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f50a426c98..2628ac2840 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4443,17 +4443,18 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
+    uint32_t sizem1;
     int desc = 0;
 
     assert(mte_n >= 1 && mte_n <= 4);
+    sizem1 = (mte_n << dtype_msz(dtype)) - 1;
+    assert(sizem1 <= R_MTEDESC_SIZEM1_MASK >> R_MTEDESC_SIZEM1_SHIFT);
     if (s->mte_active[0]) {
-        int msz = dtype_msz(dtype);
-
         desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (mte_n << msz) - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, sizem1);
         desc <<= SVE_MTEDESC_SHIFT;
     } else {
         addr = clean_data_tbi(s, addr);
-- 
2.34.1

