Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5073753wrt;
        Tue, 5 Feb 2019 10:29:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbsDdfWhMHce5nsKkhG7+AH8DtukaHrHFOUp9wivTQOWg4qrdQ46z9vznBTl7ZSbonzSU8U
X-Received: by 2002:a81:d201:: with SMTP id x1mr5364826ywi.9.1549391387737;
        Tue, 05 Feb 2019 10:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549391387; cv=none;
        d=google.com; s=arc-20160816;
        b=yKhWir8M+QjjVTHD3mmmiIxAc2zLVxzY9Efl08M+HSl6vVVlv8aRWUrRCzzolDjuhO
         KOsAkX8KCheeLkNIhEO4YtkgrD4h6k4DMA8zudRSyTCRH8n6tutgusmx/At8/oiQliS8
         2P+dp5HrVIFxLkqMXQ6MfxM8fqBXuXDjXxT5aUU4erH19p5tGbaS2678D/T4lHk+yvGf
         gvLXwOtShVh3Jf07ctCbfVbqt85ixvNm0h+1uywmpGBHLbnwUQ38VQNY6sJcaupaCMT4
         RcAmxwxgLYLdJ58yzww4CpJVVtL9/SFhu68jIes0/DIVFn9gXbUBRSZcQavYldAc+kqw
         skDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=M98p1uZhiAqbZbizsbvMNJKrarrSLsz1eMgBMbbzlI4=;
        b=LwP4V1nMdWG3ucxaBLw2vu0PlOoGspAXUKcnRDkKw9Sshy0TBZQtUSpC7VJFefB6wm
         Hgywy300rfkT66a/fcslN0Sm0prSvSXMXFnVUASTz2lk/fA/1PJIIfDScEF5eVhe6v+L
         f72Q/042/TJjSnvssxUJI+xxyilDK4HWmfSukkHlmYTLGfSDXxfXI6hVAC9rXOAcntZC
         B0DtqyMxEfzUdfx1dc3Pe/5568vxBlwd6vdJcYVNoq4WNoLcncREKkAkU9ZR68GsfpM/
         +qb+8pDZ/whj/P+af0pooHFsrsOov0kziQTiRIjiw2JZNigK3Ca0lISExjDm6ZHxm7UL
         SYJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ifmSOh3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c195si2386673ywc.457.2019.02.05.10.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ifmSOh3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr5Tf-0005Rf-4O
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:29:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr5Ct-0007cQ-48
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 13:12:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr5Cr-00016v-58
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 13:12:27 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr5Cp-00010I-3F
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 13:12:23 -0500
Received: by mail-wm1-x341.google.com with SMTP id a62so4668771wmh.4
	for <qemu-arm@nongnu.org>; Tue, 05 Feb 2019 10:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M98p1uZhiAqbZbizsbvMNJKrarrSLsz1eMgBMbbzlI4=;
	b=ifmSOh3axv0hFEA807/rZPTgmj8qz8kbQpvEHX1HaeeWtmc6Rd//ONjltjyLVCjgTS
	2G1UjXrBfvAla0JjxS30OG6VD1DgS0u+h1IXFP7t0X12pdGNRNAfi+x6L5vd39HTJxia
	klbRoUT6a0gvpF9eHk8w1coG2Cr/x9aptfzOdhR7+CIRu1xgakYYgUaNctKNCZEfMHYw
	sLoohNmJseUEAU+975kqY/Imzb9YqIFsSVNPFxfgOV+poYAKctG+8YBMQA+Z0xGZzlmx
	TymB6r+rnyWtVbfx7FL8Qc4pNkF4DORqXQaUrmMbZs5v/Z/8TPfrie/jkmxEMhV8ibtz
	C1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M98p1uZhiAqbZbizsbvMNJKrarrSLsz1eMgBMbbzlI4=;
	b=DiQvPZ+/zrdzRaIE4WIafzPY0FHII0EGel0S6jIGaUOq/Z3kdgFhqkdvOF4+6l60ku
	+0cOk7FCRFYpWFkM/4RXxWfSoklFe7YRJzDUUDD9p2wfU2oAJoHD3LfQrQ3NA0RY7tY+
	14+BCkQsvDSMIV622pvfxJBsugtIME7/BAWlNiNcmh+OSEORB8HnI/W3W7JGRF9GA9Fs
	NLNOWFcDhig6r7MCiUXLAAsWTHJ1LxNa9VuUvY1FAEQ8docBT2dniGTrxIjR+5BEZDki
	HUGluiShARkchty/guWxHSddPKNjFdRqIxML0Xl6gQ7DBf6zEfkdJ/bu4S0meQBiejJ0
	aZJA==
X-Gm-Message-State: AHQUAubJ+Duh+UEad6ekMCS7IGTh0KvMkCSWxPUMffsjc9w1400wfy+C
	mhWvUakt3JmTScxcboFj7HN/e2rKiXmt+g==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr4903009wma.137.1549390341018; 
	Tue, 05 Feb 2019 10:12:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	129sm26662086wmd.18.2019.02.05.10.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 10:12:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 18:12:18 +0000
Message-Id: <20190205181218.8995-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH] target/arm: Implement HACR_EL2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r2S/FuYe2KN3

HACR_EL2 is a register with IMPDEF behaviour, which allows
implementation specific trapping to EL2. Implement it as RAZ/WI,
since QEMU's implementation has no extra traps. This also
matches what h/w implementations like Cortex-A53 and A57 do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d070879894c..f09f815578e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4434,6 +4434,9 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL2_RW,
@@ -4666,6 +4669,9 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_writelow },
+    { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
-- 
2.20.1

