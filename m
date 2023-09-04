Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1444183ejb;
        Mon, 4 Sep 2023 09:14:20 -0700 (PDT)
X-Received: by 2002:a19:2d44:0:b0:4fe:1c40:9266 with SMTP id t4-20020a192d44000000b004fe1c409266mr6000332lft.17.1693844060042;
        Mon, 04 Sep 2023 09:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844060; cv=none;
        d=google.com; s=arc-20160816;
        b=EZxIqi9cKtjXzlN9tBfYXPjHwOOgwdxKtwQT4XqwM4WakaoQPAdwQJVddPrQSX8b98
         8VaGCIE3F74/fc3xgQjVE+b7BvHcnqbC9iAFW3rA60lhU0oocLfYiOHHHYiZCwrR7mZL
         zF/2ml3IhvpbdgmnAn/N7Y2imyovcY/frlbsewAVzvMRod/bCx6Fsg4/P56GtFrk4OPv
         ILm3gomCkMUoosrHvOwE5o7CDYWr5xjlNRNsZNQpAMSA3ZH+Ad/kzf+XbQ8JO7kotPdY
         ouIG9Wg/116lLzPcTTDWWV5MmrhPaRBz0E+6YNieQCOEqrUmwJN1K/ldCuQlJLNU07u5
         xNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GAJ8IyF6qJ4L0zeYktHFZ3FRJiDz0/SjvkZRz5aktOM=;
        fh=Q5UJePQCPk73Niy21rUDClvVxazdpvTyPM+Vdv/IeIE=;
        b=0CTdDIA8u6RqDho/CGrf0dtTrpmdbz+F5cv1VJNTJ0kFk4jdZO4SyrftaiJgnQEqMr
         ANgGvQOh5A2nu2vydX2S1KKtS5W4LIQDAUozNINJD3BWTL/LOk6CAfWGLj7P//eCkBjd
         FPj/dSCQ8nqcxIQNhKrjZPQHef9uo2yGRg5uGtluIP64rnRzEtGZab1UqAODlnf7EEX+
         fvE8XSFh+9abcNXJypcjynquMreQd5gJkbYth6i+U7L7RXE9iNz7L+/nQN16AuYsP0rE
         uU8D+H2znduXigsPbxVnuyS4vKxUy9uVNPQ7iButUkQSVFSoG3Z4/vFi82zjlM2t6w9V
         Ab1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ls4eFAts;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mm19-20020a170906cc5300b009a2185b536csor1047425ejb.14.2023.09.04.09.14.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Sep 2023 09:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ls4eFAts;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693844059; x=1694448859; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAJ8IyF6qJ4L0zeYktHFZ3FRJiDz0/SjvkZRz5aktOM=;
        b=Ls4eFAts1+G6pjXjXB6aD+sprtEfwV1w6q2anhQzZ89BQO0qlAsUfUXwtO7WgAG8cb
         fAmnY18bBipCcEbNnSMrrlAZ39FyA/cjgT3PcxVbnXoTESGjEgrHTm9emxz8Dke6ct1R
         5ayXySasSSULmK2lnOi9vtFSfhfJsAbGRioJSu1oURCRY4s4pRdiT7q8IZ19IDfbc54x
         t3l+h/yaH6LAA4915w/2vihqWGtLpRP6uU81FoofElapmG3VICrS6GrOczrNkqG4864q
         U/NpJjt6Kj41X/bYrFkXSvswlEEtG6Svr+HcGXOAt/bnLjlrEqLvxOdFtQYJ4tQL628D
         +byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693844059; x=1694448859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAJ8IyF6qJ4L0zeYktHFZ3FRJiDz0/SjvkZRz5aktOM=;
        b=AlzMhAex1KT8yDkT3Bm9PQvq6+UeHwVIVU4FDVvGD1jsdYZS0KUQbZbaNXSvbgpZli
         zWR5CUe+jYEk+gKtfk3KFpOOx4nXSzSYrV7xa0nRbNQcTGQNnFUbnwQnHld2sxeAaQVI
         LxDahAdl7v1BMSyGWlMxYKO3L+7YQYO7Ok4GiMWA+WYPCuC07OFbig9dIPWktQP4jgzm
         nuaGvbS5F0S8TbFF1VvLDDeUfKxmOoRMSo7Dd16r6+/6oBNBU3uRTCmtDLPE3z2oEOeM
         XjUxyo9eTxDgG176JjDraD8b//RcVCfxGJ3DsY1rDsmJta7afDcbckNtYFlAhGVmFVEE
         BB9Q==
X-Gm-Message-State: AOJu0Yxg8OC0IT5fwq0VG/aPtYLCC52gvyccq+UKlLGPaEtxpco56M0i
	sduW/HdZl/bw43BZy7GG0uPqZea0
X-Google-Smtp-Source: AGHT+IHWd3g9dbdAbRXD6k37Djl5t4cJGZUnGQpwQ/K8x8GNzAXQpl5K2XGtunvfqzH19N4u3OObnw==
X-Received: by 2002:a17:907:7813:b0:9a2:16e2:35c with SMTP id la19-20020a170907781300b009a216e2035cmr7922548ejc.31.1693844059744;
        Mon, 04 Sep 2023 09:14:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.209.227])
        by smtp.gmail.com with ESMTPSA id pw9-20020a17090720a900b0098884f86e41sm6270060ejb.123.2023.09.04.09.14.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Sep 2023 09:14:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 18/22] semihosting/arm-compat: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:30 +0200
Message-ID: <20230904161235.84651-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: r9JTXV1yIweS

Fix:

  semihosting/arm-compat-semi.c: In function ‘do_common_semihosting’:
  semihosting/arm-compat-semi.c:379:13: warning: declaration of ‘ret’ shadows a previous local [-Wshadow=local]
    379 |         int ret, err = 0;
        |             ^~~
  semihosting/arm-compat-semi.c:370:14: note: shadowed declaration is here
    370 |     uint32_t ret;
        |              ^~~
  semihosting/arm-compat-semi.c:682:27: warning: declaration of ‘ret’ shadows a previous local [-Wshadow=local]
    682 |                 abi_ulong ret;
        |                           ^~~
  semihosting/arm-compat-semi.c:370:9: note: shadowed declaration is here
    370 |     int ret;
        |         ^~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 semihosting/arm-compat-semi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 564fe17f75..85852a15b8 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -367,7 +367,7 @@ void do_common_semihosting(CPUState *cs)
     target_ulong ul_ret;
     char * s;
     int nr;
-    uint32_t ret;
+    int ret;
     int64_t elapsed;
 
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -376,7 +376,7 @@ void do_common_semihosting(CPUState *cs)
     switch (nr) {
     case TARGET_SYS_OPEN:
     {
-        int ret, err = 0;
+        int err = 0;
         int hostfd;
 
         GET_ARG(0);
@@ -679,14 +679,11 @@ void do_common_semihosting(CPUState *cs)
              * allocate it using sbrk.
              */
             if (!ts->heap_limit) {
-                abi_ulong ret;
-
                 ts->heap_base = do_brk(0);
                 limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
                 /* Try a big heap, and reduce the size if that fails.  */
                 for (;;) {
-                    ret = do_brk(limit);
-                    if (ret >= limit) {
+                    if (do_brk(limit) >= limit) {
                         break;
                     }
                     limit = (ts->heap_base >> 1) + (limit >> 1);
-- 
2.41.0
