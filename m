Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1329394ejc;
        Sat, 7 Jan 2023 18:51:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMHlYxWLjmjeI/ODrs6N+skhQb24c0jgiOSUboBkK+da9S6T4/wV2CUISbOOzXcnkbfCAZ
X-Received: by 2002:a0c:c608:0:b0:51e:a23c:92b7 with SMTP id v8-20020a0cc608000000b0051ea23c92b7mr19506513qvi.21.1673146282579;
        Sat, 07 Jan 2023 18:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146282; cv=none;
        d=google.com; s=arc-20160816;
        b=TiXMJNKHaefK3X5WSQWjbxbUE9NOKxSesYnQ84KjP/LaAeqbVjkjNO0AseVJ388hCQ
         BzaWyri4EAOKkr1F2Bi3keXVciW9QpruIuWk7NKFWhTzoRZR2S2s229mqCnSYm00dLzh
         HbJx0jSjsc7FOsOYt/Rlm89a2LO9jTJgNBnYyu0ZCTZh+PlELc1Yo2eo0VDzeEwkR0R7
         So87TPYOlLghK5Zg2NiBEMMv9nNQ/GprNCQPfr5IoY/39PZQrMl+cjmhEs1rh3WZcAtH
         qScf+jKdNeqaUORyUS0igsObHmOOR40vnPBsWDJ8DWuH88so7VinXQT4ekBo9HOCBNBi
         +mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
        b=Dh3pCLe5z+9AS/hNeaNKF7L+YE5MFIrYzE1cx6rvBrBpERVkSqTxTnOIZv4ysNAzEh
         g3R5MfOPm4+p7XYOqaEBghD1bszJEaCvCQMPfkaXKYBJnwLZUOeRmjiccVxegMz6uU6a
         oZ2ONY79YNV1RAFviAXwVKHuCYCJbaUq4S/kIVa7/bGt7RVcnVrBwOCupOnG3fdXRViq
         V/mogx+GtEymWijMiRQFkDay57QlcQ83x3qbpJuRe/X6FR84QNicEQMozU2NujApwLnB
         LYAQUNiHbomIKmepyfuHDxXIXCThmGu8uVQv0GDq0fYmJpCI8QM6iAbKIVIicxCv5Ixa
         qe2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTwxzUVT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a0562141c0f00b004c6e0194875si2708569qvc.173.2023.01.07.18.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTwxzUVT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZz-0005cd-2o; Sat, 07 Jan 2023 21:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZw-0005YE-BS
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZB-0004Ve-Fm
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:32 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jl4so5864032plb.8
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=YTwxzUVTIaPoRoMrrMr3xZVtTxHkxcoWUY/Z2XQDOSB9OBwIAea0LWF4lZprz0utdL
 bz8oAXkZ3pbK8ENWVfDUPWyMxSf5qcWI7FdLHPzVhOdyqjkbnc7RYerBxQdmB9Sd4SNc
 W53FcipIv/fYzM1CT+uvFYlDuvdAk2/kogBSiHH30yV1gAPucUS4CmvT7tD6r8j3GoeP
 e3C4JRG6yLBzathSHildNLFQ87fxBqI7WxbiZTxvKKqIeunYgevwxILHvH32/SSN3Z4G
 nJwT+chTNLjwGHbuETD1YlinuW3PASIxxePuuoD/RrS4xa3rYjivcBCSGBfLjUJGJLuQ
 MlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=gDIf+SaukPH3hjZq85/TNeCnL8WQ/9mXBEYBPr4ZlJOI7so+nyFHDMa219/8kQKxGh
 IUcQvYHdjq8edMICVaiKKMlhHcnyjxy6xUbfwl1IHJqGQjhzJmcM0eqrc7AmEDEo7SEh
 PK4nXGCAUUArpIS3mpdUcBB2ZIyqXIlPJjkkcBORsiesII7x9SztVwIZJxWVKViFQOHH
 KBdWd31DpnQdp2eSpY7HvT0CNMsf3qXZffBtXwRP+JmwT5CLuHryhL7Veq0zSJxTygXt
 b1nyVqy4640kXr5p9CD6paM/tvu7QIHQmVKXv2nwFylONmElw8w5Mx2W7mGi7nQGxhWU
 vaBA==
X-Gm-Message-State: AFqh2kqX0BF5BCKBHXNSkcMD8QDz6ztNyuLXCNETdGQaJD2MYKS0yafa
 fMxR9EckrbX4HBMYwdAPAVY8qLT6GZLjPr/U
X-Received: by 2002:a17:902:fe0c:b0:192:5c3e:8939 with SMTP id
 g12-20020a170902fe0c00b001925c3e8939mr52348852plj.0.1673145464761; 
 Sat, 07 Jan 2023 18:37:44 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 22/36] tests/tcg/s390x: Add clst.c
Date: Sat,  7 Jan 2023 18:37:05 -0800
Message-Id: <20230108023719.2466341-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: FXt4B5mTBNYt

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221025213008.2209006-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/clst.c          | 82 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 tests/tcg/s390x/clst.c

diff --git a/tests/tcg/s390x/clst.c b/tests/tcg/s390x/clst.c
new file mode 100644
index 0000000000..ed2fe7326c
--- /dev/null
+++ b/tests/tcg/s390x/clst.c
@@ -0,0 +1,82 @@
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+
+static int clst(char sep, const char **s1, const char **s2)
+{
+    const char *r1 = *s1;
+    const char *r2 = *s2;
+    int cc;
+
+    do {
+        register int r0 asm("r0") = sep;
+
+        asm("clst %[r1],%[r2]\n"
+            "ipm %[cc]\n"
+            "srl %[cc],28"
+            : [r1] "+r" (r1), [r2] "+r" (r2), "+r" (r0), [cc] "=r" (cc)
+            :
+            : "cc");
+        *s1 = r1;
+        *s2 = r2;
+    } while (cc == 3);
+
+    return cc;
+}
+
+static const struct test {
+    const char *name;
+    char sep;
+    const char *s1;
+    const char *s2;
+    int exp_cc;
+    int exp_off;
+} tests[] = {
+    {
+        .name = "cc0",
+        .sep = 0,
+        .s1 = "aa",
+        .s2 = "aa",
+        .exp_cc = 0,
+        .exp_off = 0,
+    },
+    {
+        .name = "cc1",
+        .sep = 1,
+        .s1 = "a\x01",
+        .s2 = "aa\x01",
+        .exp_cc = 1,
+        .exp_off = 1,
+    },
+    {
+        .name = "cc2",
+        .sep = 2,
+        .s1 = "abc\x02",
+        .s2 = "abb\x02",
+        .exp_cc = 2,
+        .exp_off = 2,
+    },
+};
+
+int main(void)
+{
+    const struct test *t;
+    const char *s1, *s2;
+    size_t i;
+    int cc;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        t = &tests[i];
+        s1 = t->s1;
+        s2 = t->s2;
+        cc = clst(t->sep, &s1, &s2);
+        if (cc != t->exp_cc ||
+                s1 != t->s1 + t->exp_off ||
+                s2 != t->s2 + t->exp_off) {
+            fprintf(stderr, "%s\n", t->name);
+            return EXIT_FAILURE;
+        }
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index ab7a3bcfb2..79250f31dd 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,6 +25,7 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
+TESTS+=clst
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1

