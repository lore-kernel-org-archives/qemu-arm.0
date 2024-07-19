Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp180104njc;
        Thu, 18 Jul 2024 18:08:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+pMk2WHuwv64WYBYgXXvw45vGJUua0+bdysnlYjifL7kTNXKl0rNmWGA0cSBuEzpN4R66rdXtscYAtWmiuHVgRToq/Ad7
X-Google-Smtp-Source: AGHT+IFT56qsgNN+ZHyYGUJz/jjLNT0fT7KFdk1u95XCtonE4I6mYv03ONBQ4Z42+nCKDzelF4sG
X-Received: by 2002:ac8:5acc:0:b0:446:4c01:1f7a with SMTP id d75a77b69052e-44f96a5bc19mr26512521cf.33.1721351331017;
        Thu, 18 Jul 2024 18:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351331; cv=none;
        d=google.com; s=arc-20160816;
        b=CnGwRLPpnB9ZKSGYEox6UCYxnPGLeLVDlndDWHQeB8Hg1oc6u2rT0+e70+s7jF1F4P
         ja8JpbHG53F8XmjYOE0akH1mA3/dUhxMyei8Ul+7mp1sinz7hfftWmsgB/XMANfgiQy6
         EEA5MXDNViEHvF9nkDLkqNz07wnHFXOBRajD1+C42S2wOMQjb8gT7Ay2+jXN4q1ViRQ/
         /jDg4Ivr2J28PqCtg/hT2Kuarqo/sTth6RGQcg405EsY9BX4EoMi5WGDLxZUSfXSa9+o
         9D6IgWCM2t7ZFzqWtPj+KkwcltZ93Ug8yvamqA//SeLycxI+Bo8uYT8gASJkr+Hs3JoD
         6qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xqmmPMBGBkj8EkL2sBghBJ5bQR2DDW9j3L8Pj6+n++Q=;
        fh=PMD1cJf9IbYeK/VmAJgusCYc7DxmYIcIgC7fGquy+wg=;
        b=AjpmXiqsYRdHGBOmANYsFXJRh3Jx8OtyubMbIl9j5AIyqhjiz28t6GYi+6439qzu20
         jlVNrN5sFarcLX30o+r2ye8CrQnSzo0iIh4nqg5R9FBsUxyYaWo79ZqCiH6w7gaqnX2U
         xpXy7xEQBMI2VUJtlYpeS8rJN5eniPr8sWZlfl439UdKuO3G8WypQe8aPoSvw3QbZuEF
         bK/85vTRg2xUWLBV/OqDf4msEdHTPPnx+DNpl39YchfIan/33+5rXnk8+tyGqqa8qW7v
         P3lz3rzVHlkuiUWvn0Y2ZKDaa+0Ak25rGPJBRWugTLx2z5t26lCxowjbUgigze4OuMy6
         r1dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yUzvaTX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdb84fdsi4222541cf.256.2024.07.18.18.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yUzvaTX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6p-0006Tm-Q1; Thu, 18 Jul 2024 21:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc6F-00047D-KB
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:08:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc6B-0000tq-CV
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fc6a017abdso8046615ad.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351270; x=1721956070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqmmPMBGBkj8EkL2sBghBJ5bQR2DDW9j3L8Pj6+n++Q=;
 b=yUzvaTX5AVJHx5ho1YSJXenhVWf/8ZRR/bJgKGxfnvZMom07oXG+bu+TX3GrTkUsDO
 V+2TwwJx62tMXO9q4EtRzmfjxk0WMhie4YhN5NIKqk6nbjTxDg9GoYRBMAfAhutRinS1
 ToKnceAsGpZ5Prnp1rUtTeS+uFP11QtpPjLrpeMPi8RSmGlLl2f8favFu6H2yz9S1SO8
 Dyk10r1l7Q0zDRgagw0jUGyFfZlVEpabo04gb6BkPqRdBu8yP10847r1GJMaYEQJxnVk
 aDoxSCPlNYpOo4sfoyimekos0FD8zQFDKzMt+EdnOkbg+ANQ5ZprXKstuwwPZufETJX7
 m37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351270; x=1721956070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqmmPMBGBkj8EkL2sBghBJ5bQR2DDW9j3L8Pj6+n++Q=;
 b=f6MtEk/dhMbVpf/v36ImStTW/AezbOCnzn1dxZaKqu17eXtvDLzs6zW+nYiQtH1m+Y
 sUuHo5aSKJI3cVbQ+eyH1LOjKKx2ZckfGrcsP3xUtoGZfMu1gNwkLRjpvV2H5AIgvepW
 zO8JgKJIXfCAy7z2DHiS56lYMCsZM4KtFmHN74r/MfrcNm/WnCL7J1wZUkQVJYpaF2IN
 MGgpuBJgsAyn0ufATVPvIaZumjMk6FgH3col6yjo/ITB7nrWcFRwQQUb4SdMpxz32fHM
 5QhtaTHA19UJhDfwNc6pGI5bLGD4EvrGmnlfs9glYIchA30fcNAtrZjWQnvo7yeY028x
 iV/Q==
X-Gm-Message-State: AOJu0YwIRiu7+Ytge765WS162Td5WQHC8YLfTmR1Db1x5IYsYtk6aZqQ
 np1kFclzyKrBRhluAwnsg3ycYJiPJn0lqWU1tqotZP6L26JZRm8utLgz9QZQ6zg=
X-Received: by 2002:a17:902:e751:b0:1fd:6677:69b4 with SMTP id
 d9443c01a7336-1fd66776de8mr1859415ad.49.1721351269676; 
 Thu, 18 Jul 2024 18:07:49 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 10/12] target/s390x: Use user_or_likely in access_memmove
Date: Fri, 19 Jul 2024 11:07:05 +1000
Message-ID: <20240719010707.1319675-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: MosKQ0enYF4l

Invert the conditional, indent the block, and use the macro
that expands to true for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 54 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 5311a15a09..331a35b2e5 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -296,41 +296,39 @@ static void access_memmove(CPUS390XState *env, S390Access *desta,
                            S390Access *srca, uintptr_t ra)
 {
     int len = desta->size1 + desta->size2;
-    int diff;
 
     assert(len == srca->size1 + srca->size2);
 
     /* Fallback to slow access in case we don't have access to all host pages */
-    if (unlikely(!desta->haddr1 || (desta->size2 && !desta->haddr2) ||
-                 !srca->haddr1 || (srca->size2 && !srca->haddr2))) {
-        int i;
+    if (user_or_likely(desta->haddr1 &&
+                       srca->haddr1 &&
+                       (!desta->size2 || desta->haddr2) &&
+                       (!srca->size2 || srca->haddr2))) {
+        int diff = desta->size1 - srca->size1;
 
-        for (i = 0; i < len; i++) {
-            uint8_t byte = access_get_byte(env, srca, i, ra);
-
-            access_set_byte(env, desta, i, byte, ra);
-        }
-        return;
-    }
-
-    diff = desta->size1 - srca->size1;
-    if (likely(diff == 0)) {
-        memmove(desta->haddr1, srca->haddr1, srca->size1);
-        if (unlikely(srca->size2)) {
-            memmove(desta->haddr2, srca->haddr2, srca->size2);
-        }
-    } else if (diff > 0) {
-        memmove(desta->haddr1, srca->haddr1, srca->size1);
-        memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
-        if (likely(desta->size2)) {
-            memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+        if (likely(diff == 0)) {
+            memmove(desta->haddr1, srca->haddr1, srca->size1);
+            if (unlikely(srca->size2)) {
+                memmove(desta->haddr2, srca->haddr2, srca->size2);
+            }
+        } else if (diff > 0) {
+            memmove(desta->haddr1, srca->haddr1, srca->size1);
+            memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
+            if (likely(desta->size2)) {
+                memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+            }
+        } else {
+            diff = -diff;
+            memmove(desta->haddr1, srca->haddr1, desta->size1);
+            memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
+            if (likely(srca->size2)) {
+                memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+            }
         }
     } else {
-        diff = -diff;
-        memmove(desta->haddr1, srca->haddr1, desta->size1);
-        memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
-        if (likely(srca->size2)) {
-            memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+        for (int i = 0; i < len; i++) {
+            uint8_t byte = access_get_byte(env, srca, i, ra);
+            access_set_byte(env, desta, i, byte, ra);
         }
     }
 }
-- 
2.43.0

