Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp117575njb;
        Tue, 9 Jul 2024 20:28:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcdT214807MvUOsL+C+vvNnyiDXNlLVtW8gWTEdmvlYwPHgfn4n2ILtsmNJvT+pOg1MahXZ2ZIEt7Q38mF0q+HKL8m8YrN
X-Google-Smtp-Source: AGHT+IEi9XatpZPhSCG8AtxlC3IuHL4YfRS5zvFOZ/8+j0HpPk4MJScwPG73ONQRVB61JzQc3WDR
X-Received: by 2002:a05:6214:d64:b0:6b5:683:df5e with SMTP id 6a1803df08f44-6b61bf0d093mr51382306d6.32.1720582136133;
        Tue, 09 Jul 2024 20:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582136; cv=none;
        d=google.com; s=arc-20160816;
        b=Ir0Lh4N0/j+ZbefzzQiWNm+pSQSvqJjVgu9mBd9k+xbFyzq6gbF4+aukAoo8ct1zV2
         5rpYf8QmqMeoONaRuOdyOtyGvVvrtKLAhypABdzZ7vfGs/jjzxdFQn36DNBEMhvjCe4x
         WU1pm816Oy6ubkrUGfFeE9JRsmR4Ou4vJ+1Jg5JvZ0Gi8JmazHfq0b6chKL/Be6DN23I
         i/yjhrP5ofIKSKRcIYVs28d9cL2w+evRBmdCzCeIOFV13Zs7DIRDxisf4eWk4w4oiyfy
         YXkqWnG9f66z3+f1XngNFxFwtgljrHCGUktI0dnb3M2o3CGrtC052z5anCKcqGtsv1C/
         rq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GQAO0KTgjbZehDr4himFsvAKyM+WWXiQ7FDysfKIpGc=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=jh4eqCN66Gqajis8Uu7arwnJ637Ukhy7TR4g0hwG+T7PHrnX+0iz9mihvSVQIjEP0z
         QPZJwd5lfrTADG/aRS5zTOVfTJ9IueJq+ykYHwbuRFGlGs+jphnaxB+usMtU/E0PyPl1
         Qqd1Y3GVMvLdz3eAeFKqN+R9ehq+DVPI8QWpyHa87LWm2nwrx8iVAYwZqGS8u9owHTMI
         hrppjIgBmQK0qnceVUA1qh13E2r2lqYdeE14Er2wCDnOmkFsXmtPCiCawHuaE2Eyy/L+
         U/F99X04QNY59Ei6U9FmF6xzvQJze93cB43wugswmnQ9ar/a0LXYI5cs4PiMdFlts5Cj
         Kqqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2TsoLXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61b9f6fd8si37693686d6.104.2024.07.09.20.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2TsoLXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRO0c-00017H-2B; Tue, 09 Jul 2024 23:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0Z-0000wT-LN
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:44 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0J-0003na-RH
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:43 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3c9cc681ee4so3147172b6e.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582106; x=1721186906; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQAO0KTgjbZehDr4himFsvAKyM+WWXiQ7FDysfKIpGc=;
 b=f2TsoLXlnDKs/MybgMNR9+aWPfJiRBZJ/cH+fB8CoAwZGzaiAho67LLPsPwLp1fUYL
 J7m7P3ZfPdEDAt0Nrpzuq0Z5tI5rKvGdLkRkccfgd42Va7ebhoD/ls7gXpTZxsNoCG8Q
 qZNMA4yurnB7edptnenOmBU4QGgMFtt3sw7IXdsSDqkQOViviP+ppXGtNz5vbs1c68TH
 zu0QD57qPDUuchR7p3m0V+Rvod+c8doZJVtLnW58dL56ZkE8Z+neeSxDZ0h9u9kG/bju
 PtVkum0v00zAftLaygpJLjybUANjYlOoMgWRsow5kLORa5uiH5bNRJXu1LdwV2x0iC4r
 +Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582106; x=1721186906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQAO0KTgjbZehDr4himFsvAKyM+WWXiQ7FDysfKIpGc=;
 b=i/U5pvurM446OchYwaYOIYYneNlNFYR8+OxKhvU5Lkgul8zktI/83v0hTj6ni2fcbR
 HyKKP7QcIsPbuYcH9LqsjE+wxmmKKWq0EbjEXTDHFEbazIUmYlqwkSe60ekIOKT287O8
 7ArM8Nxuk2JvLI7yOQfpxEkHXJwGkwyClZmaiP0h3Mf5PtbExVXm+Z9FtN4dUJmiz9wV
 f2SJxDpdIdjwlt7NtSpApfqZHnkQLJ3ZYjiB7m8mM0Ds4585SIDRoabpBtyUIMLlkVWP
 TLtLO+rrugXLnJDfdv36EXwIf3QC9UZPA1QZHfglzxRo2hv3dbvECKjj/GS+8JNwW1z2
 kWIw==
X-Gm-Message-State: AOJu0Yxy/1o15DwDOlEF3HIM+pWozXm6cSP6S73UYRPVDXKwEAzzovWl
 YFP7lOi75MkvfkcSD3HdZABHGeW5j8Ieqxr/2bbCtMW+sWVp+NMXDzh+VBv4Pqs=
X-Received: by 2002:a05:6808:148b:b0:3d9:26d6:c70f with SMTP id
 5614622812f47-3d93bee9516mr5121280b6e.7.1720582105753; 
 Tue, 09 Jul 2024 20:28:25 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 10/13] target/s390x: Use user_or_likely in do_access_memset
Date: Tue,  9 Jul 2024 20:28:11 -0700
Message-ID: <20240710032814.104643-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: TOOCUy/U+suH

Eliminate the ifdef by using a predicate that is
always true with CONFIG_USER_ONLY.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 6cdbc34178..5311a15a09 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -225,10 +225,7 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
                              uint8_t byte, uint16_t size, int mmu_idx,
                              uintptr_t ra)
 {
-#ifdef CONFIG_USER_ONLY
-    memset(haddr, byte, size);
-#else
-    if (likely(haddr)) {
+    if (user_or_likely(haddr)) {
         memset(haddr, byte, size);
     } else {
         MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
@@ -236,7 +233,6 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
             cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
         }
     }
-#endif
 }
 
 static void access_memset(CPUS390XState *env, S390Access *desta,
-- 
2.43.0

