Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2008754lfq;
        Mon, 11 Apr 2022 17:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZsazLjruNYFHFtRv1LMqpBVdPCbR2EPpCX45v0JpOqf+gJ+FlnXAkM0GoBp/E2WNv1HSN
X-Received: by 2002:a0d:e5c3:0:b0:2ec:49e1:67d7 with SMTP id o186-20020a0de5c3000000b002ec49e167d7mr3653397ywe.166.1649724287686;
        Mon, 11 Apr 2022 17:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724287; cv=none;
        d=google.com; s=arc-20160816;
        b=C9shi9WR+px9uPjJspmQUvZkWQWlFRrE/nHiSpUKIii1jLGGrUWzFSbaDbY0gX19e1
         Yk4jStO+QB9hNBlofEJsvTQA642OvsHtOjggprbOwI+TAAQrI/U3BpMxY4kt/c+bQbI+
         siyZYVVBSddnvu3n4809mrvvbMoitHBQBXP/v+36+97dPPG8pZIz1q9T9WjTP3XN+UPb
         MXiK6ygpDpm8pJlrmadVbNL81izgl9AX6SbwhTMwzCc2hp/hCQFs5AeK7M/oDZZ9VYAP
         8gyQfjXarxL4ovQ683GWw3vIlGcWwT061zXsxhnGmkkuFwC0wskOtc1VvTznPEHhH2pI
         qiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=faNCwnEjGzcd9KzSFRXFlNXpqp9BiPt3SM3b4mcstDA=;
        b=BrFaPW5bWA8aOaWq5shgwbCVxgWWQXfCgqbJlNVrKjBPqaCosBcFQ2Y+ysWm3COqpu
         /3iKeHRLI9yp4N5gVE5lWIXFinzCIDQbTIDtHQVGUL/mrxtm5UQfgyihhgNM3s5cNxvf
         wzerGgi2DCbMeO2VVuz1Rbvy6tuRhuK4yRI61hcI3tSv6A+TtrHam8OWuVDW9jLOTIhI
         01hlXu+oxKvEDWVI7mWVDh8aP6hrDMamxna08H5UCeNug+PryJ+dKGiwbngVEiYjDGUr
         NbExz/gllVVpgyr1EOiZMfZL9oK6syRRKqHeNJ560MA87tdSAsrJKug9sz3PpVlW3H9G
         Y23Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XyhiXgBp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k124-20020a815682000000b002e5f6913b5asi5438905ywb.293.2022.04.11.17.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XyhiXgBp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4eF-0001yr-3Q
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TV-0001tb-Vx
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:42 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TU-0001r0-Gf
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:41 -0400
Received: by mail-pf1-x436.google.com with SMTP id f3so16039172pfe.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=faNCwnEjGzcd9KzSFRXFlNXpqp9BiPt3SM3b4mcstDA=;
 b=XyhiXgBpnmX0x0ZB3uBjnGU45f8+HPMmDIXqpbs6g6U3PLGcEoq5EGJvXih9jqIulJ
 Zwz/B3wzl1imDPZGxnaEhp3T7qbzIPWLcqNShucXuSMywKDUQEp13xMWtIBVz2fQRD/r
 IVFDsZhWoWQhRfDZlq9KA84up3N7uuaDXIHI6y5W43QfmQ9P5wse/LsxxygForRHE1YF
 EX2pIp9xt5j+XbMHnULpg9ghf69aIDAk11OwOLIPasVBXrfv89A8Sn5F3ycXbkgxpc+1
 YnDhobKnqZfrZShKpxGm8feE0zdyJCe4KOCqWbiUiUDhF4tp7Q76no5VhJAmU/I0Cw+j
 RlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faNCwnEjGzcd9KzSFRXFlNXpqp9BiPt3SM3b4mcstDA=;
 b=rRWYctva/bM4UCJD0A9vEENa4Rhihx0GzSjeI89mMt/PqMGnbS2LrAbz4B5G44x0h/
 HcZ+0XKg+0b5e07IIFPw6+kMa7LWmBrivQjWzWHz5AodduHgEUEWMjV3eVyDco4U4F+I
 v2r4VvqRRIZEtFHpXadnj4ulsZMspeVPTZxhdwM4OQFcgBAxdxsCH1RvGyeGwwK618DX
 y012hIWEuWd+SzguN1REx8xuVwqmLZXGvOXp5WluCd+uURWdu7mjYxnQLd8JWBzUVgXR
 QavQs7eInPblrJEWWfgpcGmoxPCBbEBk8DdoaPuOl4tgLjGEwCsLJKItZkX0U3zKA9Lu
 dG/Q==
X-Gm-Message-State: AOAM533tdfH+PopXWyNErvafbfb/dOKH9NoZscBlctDuq1TeGlsg4Rwn
 zdiriMjJv4nKYBuA6nDDLZGj65ouMLIKKg==
X-Received: by 2002:a63:e952:0:b0:382:65eb:257 with SMTP id
 q18-20020a63e952000000b0038265eb0257mr28518778pgj.465.1649723618004; 
 Mon, 11 Apr 2022 17:33:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] target/arm: Add isar_feature_{aa64,any}_ras
Date: Mon, 11 Apr 2022 17:33:13 -0700
Message-Id: <20220412003326.588530-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6CGKea9/AD5K

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9c456ff23a..890001f26b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4208,6 +4208,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4430,6 +4435,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1

