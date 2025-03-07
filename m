Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2398309njm;
        Fri, 7 Mar 2025 11:05:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUl12yGnEhmR96KhFuCw0dfYWwaigIdVeLmivtMZs8KHobrmYPqN2RJpmXiwX0kKbXBd+m2VxlD22+/uw==@linaro.org
X-Google-Smtp-Source: AGHT+IHVAQzZjBoCJd633IdIIfgdV8+hoc2NL2PrpElKIeq9CmOnxWfsvfBG+WqQdBJIe+egPpzh
X-Received: by 2002:a5d:584e:0:b0:391:306f:57e4 with SMTP id ffacd0b85a97d-39132dc56b5mr2592174f8f.34.1741374300599;
        Fri, 07 Mar 2025 11:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374300; cv=none;
        d=google.com; s=arc-20240605;
        b=BjXKELTBS/ycqLq1j88eDVYRiQlcV0Adupr1Fox0bJH71X8LSOP7s2EQZafmXa6hW8
         Jzf4LIbe2gYnk93niicJS6TzFqYO86QKA6f0+KCVOKgPFVWWllWOL96WrKAIc5Wd0hGy
         mI+8473Rxb7+CGQRqaQIJOfZM6shltad0QnJuhFVXmQ4mfQluovFu/o/0JLh+jKf1uy/
         jilo/zrwdPtQI6w4zbHmw6UeLOW7xidtkj23vmMJZOQFGBmmF4iC7zyd5g89kUoF1sth
         jyFBE1ZfYOrdYXw6SOIQb6A2bQi1lJFS7bv45tgd2reVsB7Xb3tDhyF+LNNGblN6ZOYD
         VoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gWT0L4EBMx/nGFskBmpx115GbPBpRrubLUlCXG3QWrg=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=hQmkfe3m5icE6NunnOcki86/iffKJBIG6ca7ixiBrwGIsRJWYrKcgIbQZC9I70kZZY
         9xA7iwU1vhStxO9FNs8vwShWKqjXDO0nGZcbvcrv/zHIp2QV/K/sASsalOZQ7LLNsF7B
         FdfWwiZspBeEgq/qc8FTnuk9Wqjg9FRzjwo9fWhlWt7B+xbi4sjQW9+8AVEqavWvyiyD
         VJdMSpE6ygx0M1+TjgUlIRUw4UaSESxqtrONPKRDUhy+dzaRx9WaKEAqbpWwIk7h5aH0
         BbO0tuV6ITWIvWCs0Cawziqa4iNChOwihnaUGaIAWnWUQ5H5WlE6WfWVE3vvx5GGUz3I
         qB4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+YlI7CN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912c14d481si2889296f8f.871.2025.03.07.11.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+YlI7CN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqczq-00047c-6v; Fri, 07 Mar 2025 14:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tqczf-0003xe-FP
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 14:04:27 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tqczc-0003i2-Kx
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 14:04:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-223594b3c6dso41871865ad.2
 for <qemu-devel@nongnu.org>; Fri, 07 Mar 2025 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741374258; x=1741979058; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gWT0L4EBMx/nGFskBmpx115GbPBpRrubLUlCXG3QWrg=;
 b=Q+YlI7CNkPltkxqzJG5qqgxjLzwX1nvBEHLJqGx6LtHitimJU6W6D4JK4aEdJhby9k
 oOWTwIT0fUxx/QfABqyJQ+22rwr91/eHsH2BkYCQsm6e/Nfz/nSjgiCHYMQR50+1cWIS
 dnUJvA0u59IRMpud4bZUtQQM+PM4dg56vbw3XTZkTP9frPy/ZK+yztAm3JpLK0plAtbv
 uXaapQp7eol4/RoLny72zoMMZ6Jo8bqtVx8lXTxvGn1MMeMLodi3BA0u1ut0iqchKcly
 LYyXObU5XCAaIWQXwmiCxD4X3FC3O9f2ACVCTWT9kvMhngL/f8n2O56FAl/4lHfdPQJI
 FncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741374258; x=1741979058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gWT0L4EBMx/nGFskBmpx115GbPBpRrubLUlCXG3QWrg=;
 b=jcpbD9NM7bLmLU+/KMk4uLtyJH3e5awb5h5jqB0ZdC1TeftDEdH1vpGOQiICjsGuay
 0oz3HVfWpLY3pnT2H2zjj/wx9kvmk8E3Tkh8TQF6zQeIw8rvpuz90T+77bRAZ+y5tTPO
 dlAGSoL8kMeIiJHBbpTdzRjv9CIDdkoW0QcQrKoie/vXZcx2P6xgSAIhV5FUroqZxRKU
 Sm2Ue3NkICTFRNtrKJ1PrNQ9EDsaE7NTxsFK1LUhOjAR0wwA7pl7BmHiIYTgzwiKSFQO
 hFajyXKQ+DE8VdhideLxJL+aYPT+rF/GVaNoksQxpxcw3Dmy6Py1jxG7IfOmawNOvUrr
 BtHw==
X-Gm-Message-State: AOJu0YxJT3U6gosMWYbuxIPKs5zPP4R+gLa5/q4PGEH4rmx1ZLcumpAD
 iqLFM3xfMgOY4M3PC2s0N6FyXQN3Wf2IvsmRd43E6Yq53qAKxzNZswVwK9WKa2D+DmqhRYC+4+R
 2
X-Gm-Gg: ASbGncvp7Qn0wW1NgNPY3y5jsh1hbD5PXWRBNt9H7jYpoa2lOadAtUdunClbDiU/3P/
 bRtMcIeOJdIALNF28dhqDqCU28VflS1PEmZGYjVxMxqQOHMQOL6KWs8kx6V/1rl/H+BLsniZfgt
 5q5+x1tsTXVjNySKc+yBx2rjvQeU5SJyssQNyRb5qF8e8ST9qOvDuZBZfrBMoxNicnzpqsq/T4K
 /UdU/lejIe4iaLUIgErg4vwydRkki++AK0jj02AruRfgDzpe5ffdRT0i5TLAlFGmpckqzdO2XJY
 yvXZm8BtIQV9PVkEtIe+CzNQ/Nrjrb/fd/jhSnKdQx4PjLhV3t7opKaG5bs7umVWlNxb20qcX21
 W
X-Received: by 2002:a17:903:2282:b0:224:2717:7992 with SMTP id
 d9443c01a7336-22428be5a5amr62909535ad.33.1741374258002; 
 Fri, 07 Mar 2025 11:04:18 -0800 (PST)
Received: from stoup.. (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a91c5bsm33686335ad.186.2025.03.07.11.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:04:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 2/2] target/arm: Simplify pstate_sm check in sve_access_check
Date: Fri,  7 Mar 2025 11:04:15 -0800
Message-ID: <20250307190415.982049-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307190415.982049-1-richard.henderson@linaro.org>
References: <20250307190415.982049-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9TYMOpLbVOHu

In StreamingMode, fp_access_checked is handled already.
We cannot fall through to fp_access_check lest we fall
foul of the double-check assertion.

Cc: qemu-stable@nongnu.org
Fixes: 285b1d5fcef ("target/arm: Handle SME in sve_access_check")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 48e0ac75b1..723cb3f24a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1457,22 +1457,20 @@ bool sve_access_check(DisasContext *s)
 {
     if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
         assert(dc_isar_feature(aa64_sme, s));
-        if (!sme_sm_enabled_check(s)) {
-            goto fail_exit;
-        }
-    } else if (s->sve_excp_el) {
+        bool ret = sme_sm_enabled_check(s);
+        s->sve_access_checked = (ret ? 1 : -1);
+        return ret;
+    }
+    if (s->sve_excp_el) {
+        /* Assert that we only raise one exception per instruction. */
+        assert(!s->sve_access_checked);
         gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        goto fail_exit;
+        s->sve_access_checked = -1;
+        return false;
     }
     s->sve_access_checked = 1;
     return fp_access_check(s);
-
- fail_exit:
-    /* Assert that we only raise one exception per instruction. */
-    assert(!s->sve_access_checked);
-    s->sve_access_checked = -1;
-    return false;
 }
 
 /*
-- 
2.43.0

