Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2012478lfq;
        Mon, 11 Apr 2022 17:53:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5cT27imnUy07DHh8TBgHqE7aNO/4/OTyzZC03C8FUjWmT8ilXizankMcMWoMeRnXcf0kP
X-Received: by 2002:a25:9a42:0:b0:622:4bed:4f4f with SMTP id r2-20020a259a42000000b006224bed4f4fmr26291299ybo.508.1649724784389;
        Mon, 11 Apr 2022 17:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724784; cv=none;
        d=google.com; s=arc-20160816;
        b=VZkXFd9eDKhDSxhbgZrCvhLfnJ+wnNkV5l62DwlsN6uJTW12r/jlMpPUdEW+RN7t0q
         xa+UeOX9+5YgQgaOwBo2VF8aEcKJ1RRaNk43M5RlF0a5hR0Gn7T4wpIkQssftqBRjYt8
         xscocoZ6fHdFzQNkqfvCHTfD1KSLdtYhpvbEcEP3aAE8Ka2lFftlznMHikPGMHE9CwUL
         iW/NcO6s1s1M9prIM6rCuscpoaePNOHRE2/uLdC1w2VKkF97sF2zivMpXBKHDmleZWg4
         omB9sZGFjq91LIvPsXW++VPSv7qa9t4ckNlNBqs55KVb6hHOlvh7HjzJYkYoZz3a+n+w
         qngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vvaSAF9dWxfTutPcPK5woK3fG4aF2EnUyhQgs/BQ6VM=;
        b=Ths1qB5HRYJUPgY6DJusJ9+sdmHJ10U9r5PQo7NoD9xv3qkTrQlRrVttj7R2N1BcUx
         cY47UF9QzTTZ19/IUTZ8aKPr7lL26Tt2vzaF+A+aa8Sj890jLDIDfja2egxktEyXYg9d
         pxVvyylYuI1ImxaeKswAT8jxEmx4p+gw3gqcpwA4vCcMM2NQUM7oMQxGu7mAZzUCDKWG
         uSvSICeKbHGyV4g9HkL2gz4VDkJqPhSqtoVUxINHkmdsjnEx3SBGGydloijviH5XhnJW
         M/MOx9GrAhGDBqFNfZEY4KeBkA/6KT3/Pw5U5j+DG0M5UvXaRgM1XBkDJF13IspdZ4/p
         ztng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j0P8wQkA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f128-20020a811f86000000b002eb49096516si5273969ywf.13.2022.04.11.17.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j0P8wQkA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4mF-0007HO-QU
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tg-0001wG-9S
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tc-0001t5-89
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:51 -0400
Received: by mail-pg1-x533.google.com with SMTP id s137so12912418pgs.5
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvaSAF9dWxfTutPcPK5woK3fG4aF2EnUyhQgs/BQ6VM=;
 b=j0P8wQkANITMz6s+rLKNO/c13jUInPdSaGN6UzVbkCX0Je09sfssCiYTAHdZeyZy2w
 SUGnijSNCR4yikcT93Mb14nANpKEhIDUFZnXiVeY0UhMWJ8ypiGK1HphFZi3SwGBhknp
 jgIplE+vv7sZWoqsznZscMKzFa9uw6XbPnjaJQdd27VByHHMxBsd/bpTfWBjePqAUVFi
 YpMrJi+lGf8letoVPF/cgfI3Ym+qWK/XeF8gaCPPz55E14xgDjjlD/Ija6HHWH3JD5Jr
 WdHXD2SEg5ntOcJ59j/KN2V2Om1Hk8+L/eb7FF3t6g84RTA7vjwnV8QJa1P5NFG59+0q
 4+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvaSAF9dWxfTutPcPK5woK3fG4aF2EnUyhQgs/BQ6VM=;
 b=QTnWmIaPp91tz52SoFKnCh3objRtKU0Xab2ap16JIT6fl0VV96pZnyPKbYbe99rdxN
 ytgcsNiM3nO3SJ6IYLuQ7s+CwuQbwMMIxrJHB5LY1B7cIee9C0QpwxPfMJj6mK176jPb
 64xdgtk0bSc+m3VVOBFOVPmO4rwX37C2fk5ICT8uHmjkPrfBG9aLBpbca1VNsAJh/ZR8
 e663fj61jWcqBvfErFbr2zaY1ZydeDHrCnqUNVinKS8usn6uFIJWpEMb8r7F6w7vkpXd
 wUJclw0QItGfvMkZS0qhlD17D4diaCAsIDFvtoC5bMeRJuZ1q+6BYGJfD7tSaK1seOa6
 HaFA==
X-Gm-Message-State: AOAM530VTQEo0VaIxILNB934XbyYI9wqrGwgLU4YNudhgQ11oPFAMlgj
 8w5n4ZS5ElvfkMdl/cf0KwsK7w==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id
 l13-20020a056a0016cd00b004e103667ee8mr35414150pfc.9.1649723624360; 
 Mon, 11 Apr 2022 17:33:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Mon, 11 Apr 2022 17:33:20 -0700
Message-Id: <20220412003326.588530-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IqTQOjzBgAEv

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index ebd9e418cc..91fb06c579 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -11,6 +11,7 @@ the following architecture extensions:
 - FEAT_AES (AESD and AESE instructions)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c91528a12e..eb4bcd8e80 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 4aa2eb0841..7775a84575 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -67,6 +67,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.25.1

