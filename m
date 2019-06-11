Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4205973wrg;
        Tue, 11 Jun 2019 04:03:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrBzIIUBYf1JQyWkwwuLa3pTVw167zmn0Vjm5frSb6ubl5DQ+HGf8Fh6czpimmtjH0h+X3
X-Received: by 2002:ac8:25d9:: with SMTP id f25mr62682735qtf.256.1560250983062;
        Tue, 11 Jun 2019 04:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250983; cv=none;
        d=google.com; s=arc-20160816;
        b=kLJACT6nFt7EpGPQxLVlMfAFAvuw8kHobDdC4dXcw8E59nlBijZFDbJ4Ij3yCIcAm6
         eIg851zEmTrJK40NE7MpJsrDsMqY1FOFm55x+ofFhAYdpmgKRVtVlI4XcAp0/3MigZgb
         zHCC38++3BJpJ9grfRbG/Eqrti5Svgq5aZtwTYUPo8pLEqEneMgbYj7MZMjIplcWm4uV
         d+8pfJ/K/Zi5rlBtKKj/Q54VxZbv2GZxtqjq/TrXl/9eULkvz3X/nKpMHq3OE9AU9Yg+
         CKZViXz+ZomLbA1UhqIGmJU7gvxfX1S6B8oUpWPh28x1pCjEJBZ3d4Qku7fCIz3trARO
         DNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=o6pWiOTZGrPQzzzhaP28sXPHF/a5tiDkyRfucp6JqcA=;
        b=JlV1PN24CJJNQMTpKDZ7eNZXIZ4b0omAVyxY0mpqkJbj5pAt7X/VQfQnEdwTT7Stzz
         D+qygPbs805+jRUx7lmugY5i3+NJTihZxuHZZLp7XFO+ieceyEpHBKKttozrg7ZYdCrq
         Hzwq/AgVKozDdkkiLBQ+5cns76R22yD9TxUjCeGHx5CmuAcOqqswfzCFWg4nKObtnQGf
         n+v/TMfji9SNw/YWqH2Mp8xKXNrtGjizxxOnxN2cK0ru8FiD3vnLURW22JcsTP2KUbNa
         /Ys6tQeF+l/FR4JiUbD36RQC5UIIOLdOOs+n5A/4WAyF85yk/qd1n1F/LuR7K8j42GoR
         VFog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MgYwJOTG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k38si2079514qvk.75.2019.06.11.04.03.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MgYwJOTG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeYQ-0005If-Et
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePj-000783-3k
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePg-0007E4-C2
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:02 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54211)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePf-0007Cb-M7
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:53:59 -0400
Received: by mail-wm1-x344.google.com with SMTP id x15so2419385wmj.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o6pWiOTZGrPQzzzhaP28sXPHF/a5tiDkyRfucp6JqcA=;
 b=MgYwJOTG1JwRYllOT3EqKrsxmY9ZJngNgNWexrOwaYyFor0oniGU+2T9PGCw0wB+UW
 uy1aoozIM1HLJHa9k+uzlgHTOsLPtQol41jizMm46eI/pKgioOfCWjXoaqH1d9Jmfg9l
 63J8SzGv7hb/UQxK0Th05sOqZI6a0ll0aEeMBl27CPd9TL/UeT3L9N3td7hLXw4B284y
 v95QRrSz2wAA8D1KwI5LZ3OGNJTWAwrW956FQf5iGneOH2eDueXFKbpuRoFcb5xQ6yhV
 3hSNUGU/r179w1ARMg96qpADIuQJ2RIby22NgK/LPoAYxQryyhjhyTOX7NFipIjsz+vk
 GCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o6pWiOTZGrPQzzzhaP28sXPHF/a5tiDkyRfucp6JqcA=;
 b=mpOMGBUeEADvmZXYxm4bhZtY/PNr8hzmecFeD2SK7aeWyPmMKFiEaz4scHa/dedgHU
 /mX2ZeZBXMEdiv6rYKCe+ohtNJCtpPxfyXa8sbaGlwfnyJps78/k8KjXTrvQiVjEuRy8
 qtZNx7eRnSpcfouL6zg88U2FgF5tHg/sY3U8dL8rN7A43nKjxpamJmkklcIqlG0u+H6V
 bStJk6BqO3armXs9YToRgcZUGyUbwje4bzsMGKeIGcPnXWP/hcmd2tgevqjSBlZ6GtYn
 BJJe/hDkq635kmrgT90Q4JQplxpd7x4rEQ8MXHTOet6bLznr9Gv3O1mbyH0SaX3IJXFW
 rP+A==
X-Gm-Message-State: APjAAAXdTzpKBHP4QCmobecDko7VNqPX0I4XyLzYI3UN+X+h7ezBRLQ5
 npnev8Xigg9L30l8Tp5jxnTivg==
X-Received: by 2002:a1c:4b1a:: with SMTP id y26mr13400026wma.105.1560250438428; 
 Tue, 11 Jun 2019 03:53:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.53.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:53:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:14 +0100
Message-Id: <20190611105351.9871-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v2 05/42] target/arm: Explicitly enable VFP
 short-vectors for aarch32 -cpu max
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJFaWfdbvj5z

At the moment our -cpu max for AArch32 supports VFP short-vectors
because we always implement them, even for CPUs which should
not have them. The following commits are going to switch to
using the correct ID-register-check to enable or disable short
vector support, so we need to turn it on explicitly for -cpu max,
because Cortex-A15 doesn't implement it.

We don't enable this for the AArch64 -cpu max, because the v8A
architecture never supports short-vectors.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ac5adb81bf1..cdd76c54444 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2021,6 +2021,10 @@ static void arm_max_initfn(Object *obj)
         kvm_arm_set_cpu_features_from_host(cpu);
     } else {
         cortex_a15_initfn(obj);
+
+        /* old-style VFP short-vector support */
+        cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+
 #ifdef CONFIG_USER_ONLY
         /* We don't set these in system emulation mode for the moment,
          * since we don't correctly set (all of) the ID registers to
-- 
2.20.1

