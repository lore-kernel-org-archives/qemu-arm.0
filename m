Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp922360njc;
        Wed, 26 Jun 2024 04:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3MP8aicKFiJQ697aN+G5MHzbYbaWJYcqaxXCtGELkpzGwjGJkAMJPpeeD9cLgTv/2aR4cIZPHDjfUu08V862AthVXC1pS
X-Google-Smtp-Source: AGHT+IEGJpNqJIZR0EHXT+5VRKmhx3o32v76TJIIPgv+X4C4HNRwst/vgvM9i04jSJnCHRcgmb2Y
X-Received: by 2002:a05:622a:7e09:b0:444:f0a2:a3db with SMTP id d75a77b69052e-444f0a2a68amr74238561cf.3.1719401272092;
        Wed, 26 Jun 2024 04:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719401272; cv=none;
        d=google.com; s=arc-20160816;
        b=lfIUgG57eFk36o4v7zABaRr9kbsw8pkbv9S0yXJfvx/QUMMgObgtYyRTpsWP9aVfI4
         nVPvoYnnoOLaoNSDZNFoEt+I6uyTGjScJ9zEsaF7Zac2g90zmN+QOIRyERCyMBqZ6v69
         LuNUGWppMQUjLaLcCD3ytuEbxNrSKP9bBgUirzL7q29ziETHU4kwxBVeCKZZgTE6u7Et
         ywUTM9/uCJACWCBvmPAapaAyY6sF0TtrzhaoUs+OfXmvwRYjDyCSg8Dxsw1Z8zC7JsR/
         7RVrbxbWelafpKm/iISjeN2T4SrYPBXm8NXEL2rhw7B+kRzVsfmhIt+JXRXA6DptPrLQ
         1I0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=P3Z5c5XeGMUuuVJGSPsEWcXMD8Mrt3Anv/zdnQlInfg=;
        fh=c2VRnSpESGsGjPrM5rLS4cVnVaUf5QloU0sTPhH1r5o=;
        b=QmBuWR/zIiyRYkjLfKex9Ghe4W1VP1J319kmYMq3KuTULxbaF6QWrexaXwlf/3/zNY
         EOb/my7mrJIe61TmjaoFmE7ZfmEB7KEa+4lPWN321TioKS2uPk3XC0DVbiK2/ROHTc02
         PwDtGkoxCI0yQSWJgG8OG6UxKoNDu5/sMozi3Ga6GKtgv8OW+ZBSwtOwqEXhU0zSpPOQ
         KeLb1uU3v4whdLqXet6sBa1La6qpCLOQKmbq108brvaCjGQ6062C9bkOZls6jLCOZxI+
         bkVuLfQ3iDBXPgNzlZcOyIPeOT2XlFqw0ktGRI/oHqYczkGxCtfKL+0cd1+QYMLnwZJg
         A8zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Pk1Now06;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444fe7b1ba8si26755481cf.768.2024.06.26.04.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 04:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Pk1Now06;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMQnw-0002OJ-AJ; Wed, 26 Jun 2024 07:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQni-00028Y-1B
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:26:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQnf-0001po-Ja
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:26:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7067a2e9607so2940887b3a.3
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719401214; x=1720006014;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P3Z5c5XeGMUuuVJGSPsEWcXMD8Mrt3Anv/zdnQlInfg=;
 b=Pk1Now066r47QdplLolmDR4r1MKS26h7T0J+8+vTU7cbP3rrZK4TEHKB+x0w9aKCfm
 rDJTnkBpYZ+OMHR5Wi61Sp8rlbE4jwigq/cZCMQjPJ8YsTMbJXxRmr/YiR/dfTStv7xh
 vEebJujvcXWyqHJXQ+Eoq2jCRgxxufZTcsfsDQ8eAxPLvV1gTxhH118rJerr9agsz1PO
 gAUq2OhTK1CzL+hYOQAqt7pES8RNqHQSldP5SNlz1jN21osiZxQy33RAzGa98VTP9wog
 gVQz7nsBgktoG3a6F6MpLEktDSRb5qnXG4Lne5IlI8Qtq27ROH3+SnFmoWWmAGoLL/B5
 5QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719401214; x=1720006014;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3Z5c5XeGMUuuVJGSPsEWcXMD8Mrt3Anv/zdnQlInfg=;
 b=C8hHYbqesRbZIIejtK62DXr1PE4jZufjtaWqfPXs8DQO6FK/bHw6ZuX82q+MiTJyGX
 MNfTSMv3YDTU8IZlut2nTgU7GMNolLtp+BIMwAtnnD3QNTIyMh3mY3xt9dODPDVTBnKJ
 haQ5QFd8A/x1/JO9d2xreZnTDDYkP/ZHAc4GRh4xMLTZG5Ln08qcofFJkW/j24I+lB4S
 qO3axnzT1/4z2dkjaBd9PJEkzKRLlKmNouMDPL9aeP6jUetcwRjRrz469GYYkWCZLrxz
 P5WTqH7Nh+YnxrLRKevPK/qNWy8xZ6MO7U9DU/aX0gsPfm37hAYZ+pIS/fShEBjGJBMr
 GeXA==
X-Gm-Message-State: AOJu0YwxLxh17C8FX9mhluDs2jDJYcZERoBAqi9A/TlLx+701AVXex5O
 Jtm3opg4+loNYffZBzlye/EMDFZCDo3aKVF/v+x3Hxh3iS7KNAfPb8TUe8eFOXU=
X-Received: by 2002:a05:6a20:5a81:b0:1bd:2894:a0ca with SMTP id
 adf61e73a8af0-1bd2894a15dmr2952323637.41.1719401214176; 
 Wed, 26 Jun 2024 04:26:54 -0700 (PDT)
Received: from localhost ([157.82.204.135])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-1f9ebab6fffsm97803975ad.243.2024.06.26.04.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 04:26:53 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 26 Jun 2024 20:26:24 +0900
Subject: [PATCH 3/6] tests/tcg/aarch64: Explicitly specify register width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-tcg-v1-3-0bad656307d8@daynix.com>
References: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
In-Reply-To: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: zRs7NoUh+LSx

clang version 18.1.6 assumes a register is 64-bit by default and
complains if a 32-bit value is given. Explicitly specify register width
when passing a 32-bit value.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/bti-1.c | 6 +++---
 tests/tcg/aarch64/bti-3.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 99a879af23d4..1fada8108d22 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -17,15 +17,15 @@ static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 #define BTI_JC    "hint #38"
 
 #define BTYPE_1(DEST) \
-    asm("mov %0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x16")
 
 #define BTYPE_2(DEST) \
-    asm("mov %0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_3(DEST) \
-    asm("mov %0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x15")
 
 #define TEST(WHICH, DEST, EXPECT) \
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index 8c534c09d784..6a3bd037bcd6 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -11,15 +11,15 @@ static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 }
 
 #define BTYPE_1() \
-    asm("mov %0,#1; adr x16, 1f; br x16; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; br x16; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_2() \
-    asm("mov %0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_3() \
-    asm("mov %0,#1; adr x15, 1f; br x15; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x15, 1f; br x15; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x15", "x30")
 
 #define TEST(WHICH, EXPECT) \

-- 
2.45.2

