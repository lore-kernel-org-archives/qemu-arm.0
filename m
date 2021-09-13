Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3514966lfb;
        Mon, 13 Sep 2021 03:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdXM7bPYlX1Do4701vW44Xp1VPxKBO+hkKaI+3gQ9yRisyFxAXD2wMu56TtwLh29aL2Rvt
X-Received: by 2002:a92:c147:: with SMTP id b7mr7191449ilh.277.1631527256753;
        Mon, 13 Sep 2021 03:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527256; cv=none;
        d=google.com; s=arc-20160816;
        b=yTyMnH75xka9MGEZOhLjnXvBsRquMdcp2j4B01Ug/AoJADo3hL6yrGWByn92CUgmLL
         EfwBg2aHHC5rik9Sw7eW3FpPu8W2K+eK/H0R8qoEdnQaJk8efG+R3SN/Wlh8JTSZU/LD
         PfBMfTSi+35mlInXUa0Jlr4cPBm2RRYRzbE0OeGCPSPm3p/LbU2OtwvVWRjdLwchn2AP
         5yxqRuCzB+JG1WiIcXAxEhtbWoQadIxIa41zNbnqkUGxWJLOK4i4YykeuRuuxP0Ys8C0
         jBsSpieXtk+c3M0p2wtVdDTwGK7u283Wrw4xCK7+r0z0SKzw2XFLnmfks5jGqgsZknfP
         BeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jxk3ue8j1WrvxC+M7fUY505W445uGju5w3RgNRmMwPM=;
        b=UxEI2fkw6Kv+//wzv82xeMEIU62+RRi45fl4o/xUHFqtSWBDFkqCK+fTbsGb+fHmjN
         uhriM1t5aY8hixzgbPed6ih09iUZnpIQW74vIB+1Ynr5y6UPwB4jyaMo8m6o7yv+7Ecv
         wcFis9l+8M4PvxChp0zKNRniSBUyV2DeL8bb2V7UBU39sE8xj0g96UNoYsgoqFthzmQZ
         xIfpSRnK28Elbgig0vO94u0uBxeHENu+RJIl/RBDt5VIn9RuU6OfIDHrASABlzwmebgS
         BObhzwSxzBUc9i01zYcPyDMWIPssFFMUygCRZbsY5NcStAbzBUQfUiSj9lHTsmJI44Yn
         4UOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iZjrwq8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si6518399iow.40.2021.09.13.03.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iZjrwq8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPilk-0000g1-2h
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifp-00079P-Ij
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifl-0001r2-9u
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:49 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso6450734wms.3
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxk3ue8j1WrvxC+M7fUY505W445uGju5w3RgNRmMwPM=;
 b=iZjrwq8iq+1dDlWPQUUp4J1hTSQyUB+PPBj9QQEW5nMA9yxScNQIPr7dMbDL64T9Br
 DKEQ97ScI5sMxxVPRlRryIWXroHgDqkDXKL7RvpgRQrBibtNjiJO9fE/QNx/x9vYfb6r
 STtJZZUDfgg6v1BGAXX1vsXHfMeJbt4CYynQd8ec56gDBPZF3Iz6WwpKCrDWOJtRjmrR
 jZI00O/n8gGWYs8hHC5zY/VA+WPNcRvK+i6YObvzgwwbow7UfhOgikvsSrrOJDxMdQom
 9nOOb59E++qaMDm9Fce04SZ3ODOf1P2hXB+4eSjPLS8L9kTTN1CtBDZcqVIOBdC4Gyih
 uX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxk3ue8j1WrvxC+M7fUY505W445uGju5w3RgNRmMwPM=;
 b=1aDNf+e5zwEjOC8LtVV73FcgzlKOhGeKJpXZ9lCo7fUZI7M+OHZDX8+s5hbRlhSEtP
 /NCA2J+577CKbhgYJ/0dxWClKu9I/7ICwVQASemulj/8BnRa18nXUTBEFaB8paySB1xB
 dmIjAUwBoMiOOBvPTr7yEJiqBQaMMizUFCjyS7ZL3DkYMVqRumaUeCnrpVBcbkPOIn+T
 wKzYwheTVrEQS7RmGq5B9irj/yban6RliYILTj0EsdFWAMRbFX8eL2Ljv+wa1BA/PCrL
 /Vq9M90ysMhmAjWn4/oEGRJ4xEOA5nolyeb6YRHu160XrP2wGtQEewblw9ojYtcaj4Nh
 VFAg==
X-Gm-Message-State: AOAM533P4FWU4en/p1WmWE/08N2eHPqusDYpau//qbqoRXw8ulH8H3Um
 7c8zjwsTHSepkzCNA5anwSX4BtVIsTKfVA==
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr10111903wmk.151.1631526883871; 
 Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] target/arm: Enforce that FPDSCR.LTPSIZE is 4 on
 inbound migration
Date: Mon, 13 Sep 2021 10:54:30 +0100
Message-Id: <20210913095440.13462-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 17lXXV6Sz1yz

Architecturally, for an M-profile CPU with the LOB feature the
LTPSIZE field in FPDSCR is always constant 4.  QEMU's implementation
enforces this everywhere, except that we don't check that it is true
in incoming migration data.

We're going to add come in gen_update_fp_context() which relies on
the "always 4" property.  Since this is TCG-only, we don't actually
need to be robust to bogus incoming migration data, and the effect of
it being wrong would be wrong code generation rather than a QEMU
crash; but if it did ever happen somehow it would be very difficult
to track down the cause.  Add a check so that we fail the inbound
migration if the FPDSCR.LTPSIZE value is incorrect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 81e30de8243..c74d8c3f4b3 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -781,6 +781,19 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    /*
+     * TCG gen_update_fp_context() relies on the invariant that
+     * FPDSCR.LTPSIZE is constant 4 for M-profile with the LOB extension;
+     * forbid bogus incoming data with some other value.
+     */
+    if (arm_feature(env, ARM_FEATURE_M) && cpu_isar_feature(aa32_lob, cpu)) {
+        if (extract32(env->v7m.fpdscr[M_REG_NS],
+                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4 ||
+            extract32(env->v7m.fpdscr[M_REG_S],
+                      FPCR_LTPSIZE_SHIFT, FPCR_LTPSIZE_LENGTH) != 4) {
+            return -1;
+        }
+    }
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.20.1

