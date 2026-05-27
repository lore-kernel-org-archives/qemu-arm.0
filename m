Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D432CD6E44
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 11:45:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSCfZ-0005Ky-Kp; Wed, 27 May 2026 07:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfY-0005JJ-2B
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfU-0008Ub-T5
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490686877a1so22222955e9.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779882203; x=1780487003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vr/dCWZqkxecamIVH5FjFCNfp5PazmhoCWjfR1OvVNg=;
 b=SogYB00knIA9Uql+I2ujVkTkelh37FDKuyP++dNS4ZzoUX5jpuiarx8fODIbVQwMgG
 lDQGWRSIftyE05pG7oPtq3nEEHo46tWLhI8CnPsLZY8u0l8U3K5Pm0N/YZ4C+5GqJs/U
 Sa5nvGurWY6AXw/c1FDNZgp0a7/NAwVresaq07GnxzHrCobaID2VbojXVtZ9PC2lz9pU
 Nkl6AP2Ie5TQEHI9vViZh8Qe+4quUuD6j2LBJ0KOaF8tOjg8p7hMYSaz/CbuNBfw3vFG
 6ULP/zdE5aiiy8dv0gmEHHOPelBswZ0jn/vpzfrgYDXzVTEKZs/OjNaagECuYqa2Ys3w
 hxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779882203; x=1780487003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vr/dCWZqkxecamIVH5FjFCNfp5PazmhoCWjfR1OvVNg=;
 b=lTk515ImfHOKTKh+DmAavvHyOdKGz7Fd4J9rLOyAJfjkiTd08FCxS1XF7aM6JqxGmp
 eErVa7Pj317HJeaSPASXZgXCJEIFg4VgaJErFEL41pZNWKqGEPWEPYK0uExd8gi0NApq
 3hPFwI5uAcInBaKXGmNus0V37jzm9RogYPs79Il22ucMCb5EYOUrbBjaDkigYv01EvS0
 rghAimNVQvaI1XoZc89A50//aJWhchXRsPW+7DtO8C0sEPUwMgOHmXQDJYbR8R/79XXV
 kYgNvVQVTTMYpA2x7jFSxqOlpEojNrnz414/PZ7vEDUMO3tvW21YCZ4nyIeIxLx1880l
 BDgQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UYdEYm97rs8YWW8u0Na2kBGbA5zMXJD2WBvOwgA8pKkNyNOCVGuUJshaX1YgjI2p/6JaX+D6SMg==@nongnu.org
X-Gm-Message-State: AOJu0Yx/+Ykz7UbDGpYjOj/FNcu8KlrD6zSF3O8rqMnISEzkUE277Zdn
 XBOtU/5Y54peYAb5oUgiZVltM/fPzmWRWX6FQin1QZCo9PHgqLR7Ec/JJEJ75uyEm/E=
X-Gm-Gg: Acq92OF+iy5Khb7ChYATFPTrMSLkJJYAr2NLQjC9agiydYn16fdhl+TpxVqiF2DZaXR
 y+xTz4vTGQts78fpRGNEDbVp0pgQ0FFy4msZk91gr88/0bALHpDS5u2Q+AJHJbjrFJUUKMBpzfp
 iYRvIctFjt1RppHq4ktAficesD7B8Y63JIqAThuVpzYTbIqzzGS0OKx/LV2dQTAgUuQ5JMIXVLG
 JobBVgoBeJMPAHJBPwKVo5K+txsvqxybcy92BsaaGdivpp3XZLQJDLjSjv9ZLbyLoNi+0Lb1JyD
 dLn+RM4JDEgIzCaI87Qa9R80+hz2pnk8/ShWQET7R6ejbSsDIqeiC4S7NGXM46+SsN3J+EsISI9
 Ji0/0AOWg+oN0nGIGPRzReJyGkmV2MCjGVDzHcrFbtbmcBS+Tpn7/3zmgImXGKAABmRQBoizTEL
 SAUO4GuEDTmNtXIE3DsxqTy8bFPQdc3iiSeg==
X-Received: by 2002:a05:600c:6992:b0:490:5000:917 with SMTP id
 5b1f17b1804b1-49050000ae6mr310718185e9.1.1779882203368; 
 Wed, 27 May 2026 04:43:23 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454c600esm383473175e9.3.2026.05.27.04.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 04:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 24CF75FB96;
 Wed, 27 May 2026 12:43:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 3/8] target/arm: redefine event stream fields
Date: Wed, 27 May 2026 12:43:15 +0100
Message-ID: <20260527114320.1581552-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527114320.1581552-1-alex.bennee@linaro.org>
References: <20260527114320.1581552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The event stream control bits are the same for both CNTHCTL and
CNTKCTL so rather than duplicating the definitions rename them to be
useful in both cases.

We will need these in a later commit when we start implementing event
streams.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h | 11 +++++++----
 target/arm/helper.c    |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7deaf1ab6de..0c22781919b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -269,14 +269,17 @@ FIELD(VSTCR, SA, 30, 1)
  * have different bit definitions, and EL1PCTEN might be
  * bit 0 or bit 10. We use _E2H1 and _E2H0 suffixes to
  * disambiguate if necessary.
+ *
+ * The event stream bits (EVN*) are in the same position for
+ * CNTKCTL_EL1/CTNKCTL.
  */
 FIELD(CNTHCTL, EL0PCTEN_E2H1, 0, 1)
 FIELD(CNTHCTL, EL0VCTEN_E2H1, 1, 1)
 FIELD(CNTHCTL, EL1PCTEN_E2H0, 0, 1)
 FIELD(CNTHCTL, EL1PCEN_E2H0, 1, 1)
-FIELD(CNTHCTL, EVNTEN, 2, 1)
-FIELD(CNTHCTL, EVNTDIR, 3, 1)
-FIELD(CNTHCTL, EVNTI, 4, 4)
+FIELD(CNTxCTL, EVNTEN, 2, 1)
+FIELD(CNTxCTL, EVNTDIR, 3, 1)
+FIELD(CNTxCTL, EVNTI, 4, 4)
 FIELD(CNTHCTL, EL0VTEN, 8, 1)
 FIELD(CNTHCTL, EL0PTEN, 9, 1)
 FIELD(CNTHCTL, EL1PCTEN_E2H1, 10, 1)
@@ -286,7 +289,7 @@ FIELD(CNTHCTL, EL1TVT, 13, 1)
 FIELD(CNTHCTL, EL1TVCT, 14, 1)
 FIELD(CNTHCTL, EL1NVPCT, 15, 1)
 FIELD(CNTHCTL, EL1NVVCT, 16, 1)
-FIELD(CNTHCTL, EVNTIS, 17, 1)
+FIELD(CNTxCTL, EVNTIS, 17, 1)
 FIELD(CNTHCTL, CNTVMASK, 18, 1)
 FIELD(CNTHCTL, CNTPMASK, 19, 1)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8240f1b3848..3b06bd80a01 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1766,9 +1766,9 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint32_t valid_mask =
         R_CNTHCTL_EL0PCTEN_E2H1_MASK |
         R_CNTHCTL_EL0VCTEN_E2H1_MASK |
-        R_CNTHCTL_EVNTEN_MASK |
-        R_CNTHCTL_EVNTDIR_MASK |
-        R_CNTHCTL_EVNTI_MASK |
+        R_CNTxCTL_EVNTEN_MASK |
+        R_CNTxCTL_EVNTDIR_MASK |
+        R_CNTxCTL_EVNTI_MASK |
         R_CNTHCTL_EL0VTEN_MASK |
         R_CNTHCTL_EL0PTEN_MASK |
         R_CNTHCTL_EL1PCTEN_E2H1_MASK |
@@ -1783,7 +1783,7 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
             R_CNTHCTL_EL1TVCT_MASK |
             R_CNTHCTL_EL1NVPCT_MASK |
             R_CNTHCTL_EL1NVVCT_MASK |
-            R_CNTHCTL_EVNTIS_MASK;
+            R_CNTxCTL_EVNTIS_MASK;
     }
     if (cpu_isar_feature(aa64_ecv, cpu)) {
         valid_mask |= R_CNTHCTL_ECV_MASK;
-- 
2.47.3


