Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877392ejb;
        Mon, 7 Aug 2023 20:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaK2vsy9dSITgiM7wQbNcp+oaE5VQYy4/bHm/fP3QQEtQcQFHZ5m5Bhn10m3F11HCXrPOJ
X-Received: by 2002:ac8:584a:0:b0:40f:d66e:8134 with SMTP id h10-20020ac8584a000000b0040fd66e8134mr16300804qth.59.1691464459592;
        Mon, 07 Aug 2023 20:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464459; cv=none;
        d=google.com; s=arc-20160816;
        b=V6x4R8jwtyjA5m0dGJTQ4P8hg0ZCLH9ibNEAZ9je3iQ2AFJR+kZGZM1A1+gOMMY6An
         2zGr9jkqyBb8kCHnwoOslXiEX4QlUMk5WEL//69y8gQj/rSeWjh/A5ifEYl6VeK0CAP6
         s61vfMBhv0+cZ4lI2ejSODh5amhOUvrKbnuVhnMV596NDTIZ6OhJxBwUuazbCSn0peMT
         lTU46sYHLYg1t5EWI5jsmqqRrFtEmeCcZ04cdN/bfxUOO9OscVC5sS11pT6yFpSEE0xT
         YcL2iB6/FSTq5KYsdVZX4Ma7JHSYtSqfKO/Cc+xBvMnW1YyZWledEzVABouL3UBHLZQn
         doDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g8a+pmsyT7JaiJjb96T8aB4eik7cv3ApHNhItnmJcZ8=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=p6Uh5v4zLTH8OlIFRbAiyEt6nknVtzSdlV9OXwVi1YzMR/e9dI9hT6m11zT0Y9DH7U
         VEusXllaOATDMB5eiktSFwyh2iJscBVifQISgOgR3jsrrWEPghPQ2mXeZOuLZmQXgSv3
         r/wQ4zxCSUlbK/G8H3lHNLW6hXxUHxouHoEC0aX9cnbAuOUUWGkBmiLzeyDbYBI4IV6Q
         XzCUi/RU+kuioBdHPwZXAPkYUJniGgFjTGx2ZZXk+IBdkjuTQU/886yw3+Lcdwi7Ytph
         ru6rXutXchXteYggjXW1IKYYgNIpe20Sk/aZ25DZRzcMqi4y5Znn2yY/v4X8itu8nSWD
         rJBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJ7FU4JQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19-20020a05622a031300b00403e84b789dsi5708114qtw.721.2023.08.07.20.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJ7FU4JQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD8f-0000d6-56; Mon, 07 Aug 2023 23:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8c-0000OQ-GM
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:02 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8T-0000Bc-2C
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:02 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68706b39c4cso3593227b3a.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464311; x=1692069111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8a+pmsyT7JaiJjb96T8aB4eik7cv3ApHNhItnmJcZ8=;
 b=aJ7FU4JQA13xkT3Lu3km5N5DbjXZLQAa4sbHN2fBfxqTUKsmlbvfFl14CDBwJsVaLP
 T06mnOuI92/VhXSmPz0+emVQZOBz3AQlUCb39Q5yrVRl4JJboSyZLpg1jNN6SEWZR2SU
 wd+bXbOUE/MB0WVQEeuDepoZwygh724xFnJ80iWK80lUWkYwI2G2TPkWbc39PUmZHgJX
 9eTumgWAY9ipiYvPyZyfjUNOfqed3aLRuhj5Tvzk2tvlJ7gLfYNrP1kF3jxTrlwKCUW0
 MxZL5vhaxTudJizVoP0XXmjZT3PXjiPLqzaMGzjyenUIrm7pmDXbycZ12HtiwXwsIhAE
 OpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464311; x=1692069111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8a+pmsyT7JaiJjb96T8aB4eik7cv3ApHNhItnmJcZ8=;
 b=jKe5q5qAEIhzUS7QC5l3wEUcdO+2Tj9VBizEqsacX8fCFdJ1aaGUlr3emqsTCnEKqp
 hihxwVumBkTKSQo1ZD7uxa/n4v9iquLbrhlYpmpYz2+SDFHcQMBuiL6g9on4jd4gEhMs
 eEuzIqcWN4VTAsdQSFWcaJFolJPL8P/49T7pd9bf5uwtCjaO27qx3cn3rDJASGMhDjdZ
 8Ive7kVsp3uQTrnYlYG0Ec1S7IXLjJPxqrVjTIiwCHJTYrWJ7JCuCdM3lPxayrbGLcEn
 8aX8d3qsUhHdwC1waoiFECjc12rWomF0igGjjNgKDXTLfUQBY+8sbOVpqXpSc5h2PdDi
 AKoQ==
X-Gm-Message-State: AOJu0Yz4QLPpMNUuT7hugD22RPEu4Od5TYkcDB6WRPbcXpsY8O4byLht
 4oXq1OFyrNDIcQ2t4uS2eexB9w==
X-Received: by 2002:a05:6a00:1a54:b0:687:907f:487c with SMTP id
 h20-20020a056a001a5400b00687907f487cmr10972103pfv.19.1691464311578; 
 Mon, 07 Aug 2023 20:11:51 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 08/24] target/sparc: Use tcg_gen_movcond_i64 in gen_edge
Date: Mon,  7 Aug 2023 20:11:27 -0700
Message-Id: <20230808031143.50925-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: x1pqwj25XSk4

The setcond + neg + or sequence is a complex method of
performing a conditional move.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bd877a5e4a..fa80a91161 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2916,7 +2916,7 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
 
     tcg_gen_shr_tl(lo1, tcg_constant_tl(tabl), lo1);
     tcg_gen_shr_tl(lo2, tcg_constant_tl(tabr), lo2);
-    tcg_gen_andi_tl(dst, lo1, omask);
+    tcg_gen_andi_tl(lo1, lo1, omask);
     tcg_gen_andi_tl(lo2, lo2, omask);
 
     amask = -8;
@@ -2926,18 +2926,9 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
     tcg_gen_andi_tl(s1, s1, amask);
     tcg_gen_andi_tl(s2, s2, amask);
 
-    /* We want to compute
-        dst = (s1 == s2 ? lo1 : lo1 & lo2).
-       We've already done dst = lo1, so this reduces to
-        dst &= (s1 == s2 ? -1 : lo2)
-       Which we perform by
-        lo2 |= -(s1 == s2)
-        dst &= lo2
-    */
-    tcg_gen_setcond_tl(TCG_COND_EQ, lo1, s1, s2);
-    tcg_gen_neg_tl(lo1, lo1);
-    tcg_gen_or_tl(lo2, lo2, lo1);
-    tcg_gen_and_tl(dst, dst, lo2);
+    /* Compute dst = (s1 == s2 ? lo1 : lo1 & lo2). */
+    tcg_gen_and_tl(lo2, lo2, lo1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, dst, s1, s2, lo1, lo2);
 }
 
 static void gen_alignaddr(TCGv dst, TCGv s1, TCGv s2, bool left)
-- 
2.34.1

