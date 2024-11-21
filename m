Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4815055njc;
        Thu, 21 Nov 2024 09:16:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHnHims5r56CVLMl0btXzPHPZmNU3AQYmNikipHX+foLe6l9qrqQj64eOvRrHhUpAUQNYi0Q6fGc9aUw==@linaro.org
X-Google-Smtp-Source: AGHT+IGwNrH8Ezi43u/ROpa/LKKOESFhS21BR4FiDGxxhUKWsxWO1asXXqnqgwikzo0W5Qf8bB8I
X-Received: by 2002:a05:6000:18a2:b0:382:4926:98e3 with SMTP id ffacd0b85a97d-38254b162dcmr6229259f8f.46.1732209384484;
        Thu, 21 Nov 2024 09:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732209384; cv=none;
        d=google.com; s=arc-20240605;
        b=Bj7U08bWXYDm4wyGOOSKnpDUUPwPv9SzusKDeK05YyQC7XgWlEQ9dtu7DXANrxWLZZ
         dlZIxi8tQ1Db58wOGtny1YOEDl4UZterhi3Bf4Kdyh9CeU0UVUyBap6O1oPlxdVPxIPR
         LLTsA+6b8l8Qd4L9gd1vHWVH1hdyWoj3nq7/RJY80e1XBuCBOnq0pFmKuXqpvFZ2sKEL
         kVyWmLZub9TuFZsxIk8vz1kU8IhNBsuo5tFmICgoGQReTKTNhCjBqEtZwlFAPGCrEEyO
         x4PRUAvQ/nCykKVMKKGrn12P0ACVP+j4/9c+WG9hgWr55S5LQividHOS6gYC8lA2gEnb
         Qo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=PYs8j97Vn43piyGDTKOqzrDTZ1GOKdtdtzPW5aT75V8=;
        fh=Fn2xElHpEBenZuMRX+Z3teysgkX1pS2F6RJdnQ4387U=;
        b=PYt70h0H1m9nc923JZtLTszBtuMV++mSe7RfJIlKyjOqYHmCTtcZPESB7NcYZybuq2
         5vqj33AoMBh4hCsThdX35nIScczlqoz2cIRF7+Q4tuS52J6f4C6ZKRJHZmUn04XMMS6b
         WSKJyWpxxRul+XxLTpxGB+qMwlnxWQDIEkEpzjTD412fzA/O5saPOYQ7v9zRUkzfZ7Dv
         QXe6kTbvB/ds5/KCgGyMPpp66jbISwytMvMKV54oTj1sx9z/W+cvKdiWea7N7CA02hSm
         vwGOhZm9RhE9UPSstuD22lbSp9HoKuoo4HANc7jOBGCEPe8KB+ZFzT4LJtDbsmMV49Li
         LgjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3825fb5a2bcsi42500f8f.161.2024.11.21.09.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2024 09:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tEAmq-0000i0-UU; Thu, 21 Nov 2024 12:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tEAmp-0000ho-Kp; Thu, 21 Nov 2024 12:16:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tEAmn-00049l-4f; Thu, 21 Nov 2024 12:16:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D3FF8A98F9;
 Thu, 21 Nov 2024 20:15:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C0116176BAC;
 Thu, 21 Nov 2024 20:16:05 +0300 (MSK)
Received: (nullmailer pid 3273292 invoked by uid 1000);
 Thu, 21 Nov 2024 17:16:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH] target/arm/tcg/cpu32.c: swap ATCM and BTCM register names
Date: Thu, 21 Nov 2024 20:16:02 +0300
Message-Id: <20241121171602.3273252-1-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wxTZxG7m8hPA

According to Cortex-R5 r1p2 manual, register with opcode2=0 is
BTCM and with opcode2=1 is ATCM, - exactly the opposite from how
qemu labels them.  Just swap the labels to avoid confusion, -
both registers are implemented as always-zero.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/arm/tcg/cpu32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 20c2737f17..2a77701f8d 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -574,9 +574,9 @@ static void cortex_a15_initfn(Object *obj)
 
 static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
     /* Dummy the TCM region regs for the moment */
-    { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
+    { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_CONST },
-    { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
+    { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .type = ARM_CP_CONST },
     { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
       .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
-- 
2.39.5

