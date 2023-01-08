Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1327924ejc;
        Sat, 7 Jan 2023 18:46:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv+yhIfs0y89bZ4erz3aFGZakO1ilkVUgMCfRehPE20VEfwziB2O3JgsiqaeNtJ0PPuLOLW
X-Received: by 2002:ac8:690d:0:b0:3a7:e805:a010 with SMTP id bt13-20020ac8690d000000b003a7e805a010mr86389711qtb.21.1673145973446;
        Sat, 07 Jan 2023 18:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145973; cv=none;
        d=google.com; s=arc-20160816;
        b=UYvSzeyJhedaKrgwNS6vJkBw6Rp6x3gyO77zFXWsNCcVa6ddNHhHRrfWCA8yrqewew
         tRP1orInk/L+2cIWfaxiym0dY5JHTI/ysPjq3m1y/oN7QE7IMg7mrz670MYms/MNkLf0
         urP50MjD0TxFLPah5V3sm5widd+3y6JDbGfCV9dg5o6KZI5sb6bQMbkiQqpTtp0YPj4K
         6sZPM/bHp3r1EW2c+Ei9x1ATICqpFx27M+FbHVuXdX9ognSZKKuLmH1CMskkHWGe4QKX
         dmeNjSTdMhvq3CsIkU9v5yYiP7OxB3ACcJ3G+Wxtlm0RfMSpRq5An7f4y4baHcnR4t5a
         3VBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
        b=H2mYtUw0rYm9+0is79f65UjfoOq9M814Aqz3rRCeSU3gCwmPmHSldyjUzSlxOvDl2J
         0LUwGaAYgEwGCaNwuXA0ozE7A6DxAcqtQjdei3BuXyORt1REJZUBJnZ+Au1tdeX1BPMT
         uD8sHE/GCBUMYneKIUSZTdmPEf7cofzXUfESRcCno3JJYAgRzgxoAEr4HlBbX7xpcf5a
         D+o5vAHqqaJ66pY3Jp9jxX7QxtsYPtIMi+cvhuH+xbbyEK1JMoA2Ru4vDc4BRn2sOG4q
         usZFVIExg6tED+79sHs6/oCyhjxcA35CGtFaJ3IqwMhvS4Eyv577MO5nG+3s85FQ1Kaa
         K+Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJiP8Km0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a37f905000000b006fac0264070si2768346qkj.223.2023.01.07.18.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJiP8Km0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELZw-0005ZH-PU; Sat, 07 Jan 2023 21:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZu-0005Tk-2H
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:38:30 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZA-0004gE-Tp
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:38:29 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso5837330pjf.1
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=OJiP8Km0LIo65GowqB6hEQC0cb6+H2GTFuEr23RyvHYc5n9ACypQTLSyh1I7LHGWFi
 D0kr+Bl4emeiYv/9tL8pXEMmZZnZt9633B7xoXfl/wwu0D1+tcoiid9nF2Fs2wa/HaPs
 2Y8hUzAeJnwRCID5Dw9E4iJT6ZAzVVgJSu8IpKnoVdmRb82hCbKM97WeVDCBsDQQmrEQ
 +a7mmzMp/WGrn+1eIb21gCNp9W/3UjCdMFIl0gA8qcZ9GG6q5bzgpZzV+iWuszcxlx75
 W4scD1e2MWM0F+aDAxwxHA0waA5KY3VClZmpUHfTkZymNVLGG+pYUchfmZ0kstUzCesX
 Q1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=qsrLW18Ze9k0U2UcZPXy6hd5SDRjb7S5snDRJ1Sbvxrzt5RUuB5dfQQj4e+vXKn8kj
 q4BbVEF4qGy2eSy1+LD+kJPR5204RI9iTNx2sEqaTJ0fRh44iUT1PD4eJJdDhf4co7Fl
 PY/fShmvyejTnG72NowRL0YQ9hyqYrZuRTE2yqPMDalvXgG9JjVO1t0aaZwZhZilVhtN
 T0PeTekfpMYFioIMlSInRaisqPQqPpwWK83+qhET/xD7LvK0HwSB3qsqUcA3nmnejT+B
 75MskfkHS71i6/SaS3Ra/ejPi33AA/Op4h8fqTBAd291otT5ZDPvNN4E4it4gffBz3Iu
 tVdQ==
X-Gm-Message-State: AFqh2ko5nyJIwE4yBniiySIKwDPgdtOlRPSAugXmWd3Wj4JtXgZk11Er
 LibngORmOWEG/Yvfdiq//0972g==
X-Received: by 2002:a17:902:a9c1:b0:193:1557:457c with SMTP id
 b1-20020a170902a9c100b001931557457cmr5559835plr.62.1673145463667; 
 Sat, 07 Jan 2023 18:37:43 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 21/36] tests/tcg/s390x: Add div.c
Date: Sat,  7 Jan 2023 18:37:04 -0800
Message-Id: <20230108023719.2466341-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WZ8NPsqhM7+i

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221101111300.2539919-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/div.c           | 40 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 tests/tcg/s390x/div.c

diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
new file mode 100644
index 0000000000..5807295614
--- /dev/null
+++ b/tests/tcg/s390x/div.c
@@ -0,0 +1,40 @@
+#include <assert.h>
+#include <stdint.h>
+
+static void test_dr(void)
+{
+    register int32_t r0 asm("r0") = -1;
+    register int32_t r1 asm("r1") = -4241;
+    int32_t b = 101, q, r;
+
+    asm("dr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlr(void)
+{
+    register uint32_t r0 asm("r0") = 0;
+    register uint32_t r1 asm("r1") = 4243;
+    uint32_t b = 101, q, r;
+
+    asm("dlr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
+int main(void)
+{
+    test_dr();
+    test_dlr();
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 07fcc6d0ce..ab7a3bcfb2 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -24,6 +24,7 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
+TESTS+=div
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1

