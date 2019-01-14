Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2530971wrt;
        Sun, 13 Jan 2019 17:12:42 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7/vTgrtRVw0eTf3h7hBGmktDDF7RfVrzndcFD0dUysPEFSRLd5oMzxxHZQGNVxEt2b5NvG
X-Received: by 2002:a5d:530a:: with SMTP id e10mr22795569wrv.151.1547428362186;
        Sun, 13 Jan 2019 17:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428362; cv=none;
        d=google.com; s=arc-20160816;
        b=N+cI1Ac0tSMN5wLWHCXXVYWW2wGWGRko6GfF9tFjmllZKNRQSvgFM9r9FyHpB4J6Oq
         uQi22MPz4mL8JH/5hHJDAIgiujb/0QHO9o/LaoR4LAlb7U+X+gebKOkfRRdTDk/R0jXk
         V1cOrsvMQhKUiL+dI5hp/sHygNMtLQwy8MxHI3HigICYS2fEJQqkCvvq+xQywHrBOCg5
         /hFVqXzOahDGn43xL65Htr42B7CztDfrPGj1lAkkR4WkucavDgUkLFLgltLWXmlXKs/n
         zxQuKGqw4BrRkO88WDCBUO4x47QPCw0rnmx6yOJipr4KSrHaDwhucBll4JGQQnIhImFt
         Bsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=3J8t9aS2dh0pM+GMneyhpHvQ6P8FhxWkWFs9YiMs0mA=;
        b=tM7fZf4lfoD8T/R/BiV8hPTrLbOT9SQcEYNJySAGzZrngv8wqK9NCtktv0gboP9vm0
         JxFD2r8/suK0uVU1pfDcuGVonDj/F3mCyawAVGf35cNJ/Tya77D4ISa2RwPAE3X4kQ9W
         ODogntMFCMGEGhuvp2W4PcjE88yke453P2JuavfgWA2bk30ujrgaa0BDKfQFcfP/cn8B
         JoFvrckuy1K1n383f0zwmL/R715FyPaPog/M0gfhNDsNAvpyaDWKZIbQpyF8y2Qe0sIY
         GuIx6Row3QJLWHx4h/rmGsLMeyv7c1Tup/55yZrUxvBU3WvmcLp6z6sO87J+lQNBRpF4
         H+ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b1XvGnKN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g131si17413971wmf.32.2019.01.13.17.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:12:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b1XvGnKN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqnx-0005UC-7G
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqmz-0005Rr-25
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqmy-0000lK-6r
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:41 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34627)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqmy-0000kk-1d
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:40 -0500
Received: by mail-pf1-x443.google.com with SMTP id h3so9555771pfg.1
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3J8t9aS2dh0pM+GMneyhpHvQ6P8FhxWkWFs9YiMs0mA=;
	b=b1XvGnKNQvLA8dUXXq2v4i46b4vh8PMGDSZgMUHIhZxxLmJn8L1mtToYmok4VfRMm9
	rWlqulrTGta6y8v6ImMT8MwuYOGHVCvZuaF9jbf+bBPdUNJmpQxCup0QuGHICRtNOjDO
	dW8F8YFDJvMDk/Aa2kUB4x6HnRwSa77jEx1lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3J8t9aS2dh0pM+GMneyhpHvQ6P8FhxWkWFs9YiMs0mA=;
	b=jwfJH6iF8kSngqM1tCnE9mg0asH/JXwAxBSJ5RuNeIGj85i3DnkdgLNqk4ZhRopnU4
	qP9ze6bje4H40LpV2GgabHs25qwmSDd47q2q2ejESZkjZgTUrEWXJgx7zNUqBRt3Fxf9
	j+2r45eqj7JYH3B3VlfuUnnquuWBceoYQsJm8wr1VhQ4liK8DS8fMVwgn6XZ8tlY+XCJ
	BqOCymlAtAEI/O3gkJSRYl1xF465Oy6jKWDAnASPN/7Rc4z8W1aTcSfTshAZYjnmm2QW
	O3EKT3/G8Zb01Z1rJy8+CKBSzlUlA3C8e2kPJ7IDnfnt1HqA+l4i41lUkhp1+yhCpz6a
	RjGQ==
X-Gm-Message-State: AJcUukeI1dreCd5e2UUT9vu2Y8yWGAbmBE51WmvX5Fka9cESd8u+mLbp
	m5ecwKztDh2xiKP67kUJ8F3twJsOkK2knQ==
X-Received: by 2002:a62:2c81:: with SMTP id
	s123mr23146130pfs.174.1547428298697; 
	Sun, 13 Jan 2019 17:11:38 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:07 +1100
Message-Id: <20190114011122.5995-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH 02/17] target/arm: Extract TCMA with
 ARMVAParameters
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OWVAYQmq0tGS

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 1 +
 target/arm/helper.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c018e773c..2922324f63 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -959,6 +959,7 @@ typedef struct ARMVAParameters {
     bool tbid       : 1;
     bool epd        : 1;
     bool hpd        : 1;
+    bool tcma       : 1;
     bool using16k   : 1;
     bool using64k   : 1;
 } ARMVAParameters;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 038e52af4b..5a59fc4315 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9789,7 +9789,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint32_t el = regime_el(env, mmu_idx);
-    bool tbi, tbid, epd, hpd, using16k, using64k;
+    bool tbi, tbid, epd, hpd, tcma, using16k, using64k;
     int select, tsz;
 
     /* Bit 55 is always between the two regions, and is canonical for
@@ -9803,11 +9803,12 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         using16k = extract32(tcr, 15, 1);
         if (mmu_idx == ARMMMUIdx_S2NS) {
             /* VTCR_EL2 */
-            tbi = tbid = hpd = false;
+            tbi = tbid = hpd = tcma = false;
         } else {
             tbi = extract32(tcr, 20, 1);
             hpd = extract32(tcr, 24, 1);
             tbid = extract32(tcr, 29, 1);
+            tcma = extract32(tcr, 30, 1);
         }
         epd = false;
     } else if (!select) {
@@ -9818,6 +9819,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         tbi = extract64(tcr, 37, 1);
         hpd = extract64(tcr, 41, 1);
         tbid = extract64(tcr, 51, 1);
+        tcma = extract64(tcr, 57, 1);
     } else {
         int tg = extract32(tcr, 30, 2);
         using16k = tg == 1;
@@ -9827,6 +9829,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         tbi = extract64(tcr, 38, 1);
         hpd = extract64(tcr, 42, 1);
         tbid = extract64(tcr, 52, 1);
+        tcma = extract64(tcr, 58, 1);
     }
     tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
@@ -9838,6 +9841,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         .tbid = tbid,
         .epd = epd,
         .hpd = hpd,
+        .tcma = tcma,
         .using16k = using16k,
         .using64k = using64k,
     };
-- 
2.17.2

