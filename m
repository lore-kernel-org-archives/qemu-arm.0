Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2201629lfp;
        Fri, 14 Feb 2020 09:54:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/4u6JlfnAlLKfIVQDozYbZI4LXf1WQCVnzLxaxP3oJ6On8GQJMVAdSxP4E/NSHxmaauzx
X-Received: by 2002:a05:620a:1535:: with SMTP id n21mr3546961qkk.439.1581702867675;
        Fri, 14 Feb 2020 09:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702867; cv=none;
        d=google.com; s=arc-20160816;
        b=nChTRBgO4BmS7Alrq3kXgMMUyFl5314QBcjjrax1EZIiBkNuoOc0aHGLSDxkedmPDq
         0vVVNA7LxWwtnaguqa1SLfqJOdxAonyFYUOSHZ3pmzRjzj2nB57pjav4hsb+KbPohPob
         atHpithJyEsdLIr5onfEN4exXYyof66TWNqnWakDaghb6QIqELwv23M8HOqv0kldDfBJ
         uKJyEEZnkny7WiF8HM1UZV+caaTR+dJimvxzsOF11TQwpTXJY8iq54jZRxbbI/GYfIjx
         YNuGkzwaLpc+s+G4GH5Qv9wKKt30OphCistxWR7DnerSNn2Grnux409ZR9K5qDKpjkMU
         j1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VbLItfxzzwVIogOn7W2BSKPPHmmspgIMmaJYOYePbHA=;
        b=GLjPMg7so3PhSWKYcfgw+ErP3cG43aOUWK05By2UiRX4OU8S7glNAbaUBa0fcb1BLd
         6xdT97F4ARQPcA/2XfrhqPGhA6Vg7jiY0zOWME6Q8tl0zniJGQLr5skO/TQpimaLZpyY
         XOaIE2sNW3KG6qXJSWOefj6H6y0AZYm9cQSP4x25w2QD7m+MQ+2V/vosNyWnf97OetCR
         P9zwfCQQ0hHnsSG6zO8mcLAqoM00MELLJASla070Jt1NyJp67BM5tD3DUBScTikt47Py
         KjEvkwXAqrTTkyPtQA/RWMvu11o0DsR7N7e1OWs6oFYieFt6M1MlgnOZ7yB0wugh20ot
         CQOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NcHHIMcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si3350026qkg.108.2020.02.14.09.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:54:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NcHHIMcr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fAZ-0004Ob-3R
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7u-00062Y-J9
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7t-0000wM-GK
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:42 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53553)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7t-0000u3-7y
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:41 -0500
Received: by mail-wm1-x343.google.com with SMTP id s10so10844733wmh.3
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VbLItfxzzwVIogOn7W2BSKPPHmmspgIMmaJYOYePbHA=;
 b=NcHHIMcrfMMDyIWzSxccuCJZQIr4b2c9J6b/8eEQ6kX6D4/KeCDV4KyvZ7Y88F8A6g
 QTGojyP3Sl2htawQ8RGQ0U00aF8SDOVytmOd8LBqqpmMXd7o7hPwPqCA8fuLLPpvlHGO
 kcJyxjAcOMcV+oPyNoB2zabt7YA/Rz9LBhbH2lxrsS/W2aTLKCSMT4eDsQBUt4UdiakM
 XtdqEXrLFHzfPYBLAyrWfTE1Msmy9fuG0+U5Di1MjAD4Ai3uuVKTwAX9vkVsIGYciIHF
 1PL6dnjVJmN9VYxipwjgAhtUWQflXcRWo3QRnSArQhfaaHVLPBhRmJLwAhgkXOnVwy7B
 2m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VbLItfxzzwVIogOn7W2BSKPPHmmspgIMmaJYOYePbHA=;
 b=RgCn67yYqWP+grK+HRmk2+R/5lsOJobp5avFJDo35SWnuZ3lzGDZrD8xCtuBqTVLB4
 ZZQWMXibybHM8DVFZ9U9M47C183VqVsqO210kYISYhgBkyFt5s8HShQhGImGthPMnQK/
 7ca+5hBTlw4VYPoK7GQXZnUvZvNlKTOj5a/b6bRzh+qJjHAX85Xgi+5G0huMGcERbC8/
 l0dPTtX0yY3aRlhuqlyBsn2BWw3CGUdrBugYY0ijQEOU6eHmip5koA6Fd63xgOxGQDUQ
 2vgqadKmiVMoycTs2z1e2/+b2M8Y06NGnBb9Ypg8PIMWpoY0rSqB4N2OzOHRD1LhFbZE
 beKw==
X-Gm-Message-State: APjAAAX9rQCqcjDt/kCsQOPSSWy1Yl1jfY6sQGVi5jPmpeVU9oOe0e3k
 Zgnne3etnJ7cr76IRmpK5CZbg6SRvRM=
X-Received: by 2002:a7b:c416:: with SMTP id k22mr6069503wmi.10.1581702699939; 
 Fri, 14 Feb 2020 09:51:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/21] target/arm: Provide ARMv8.4-PMU in '-cpu max'
Date: Fri, 14 Feb 2020 17:51:10 +0000
Message-Id: <20200214175116.9164-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: id4OFNZNarmk

Set the ID register bits to provide ARMv8.4-PMU (and implicitly
also ARMv8.1-PMU) in the 'max' CPU.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use FIELD_DP64 for 64-bit idreg
---
 target/arm/cpu64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f8f74a7ecda..c9452894035 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -703,6 +703,14 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->id_mmfr3 = u;
 
+        u = cpu->isar.id_aa64dfr0;
+        u = FIELD_DP64(u, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+        cpu->isar.id_aa64dfr0 = u;
+
+        u = cpu->isar.id_dfr0;
+        u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+        cpu->isar.id_dfr0 = u;
+
         /*
          * FIXME: We do not yet support ARMv8.2-fp16 for AArch32 yet,
          * so do not set MVFR1.FPHP.  Strictly speaking this is not legal,
-- 
2.20.1

