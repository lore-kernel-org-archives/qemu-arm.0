Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98091CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:25:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXem-0004Y0-S2; Thu, 14 Aug 2025 09:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXeE-0003p3-5y
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:38 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdz-0005ca-6S
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:37 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f30so240505b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176718; x=1755781518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZELB4+c17Zgz1LBTVaRPLkTpYEUU2ZnNce3ABKyIZzo=;
 b=emdcfISw+ZyZWZ+mIrPdgDHF1qM2bwpq8q8V3lR3cby+WI1DXyT/L5M5LT3KMSjofR
 82puxP4gVWW1PLJS3DujIMAR2+DVKUMSzh1MAPY6UitKUidxqnZ70y4tHB5nsVqNx1M4
 Ts4aV/kjnA4lLoQbLsiYec3LNSg2W33KmVWY/lysAgGNF9y9ivQQaguvszkZXXaZYdkT
 aNZoMjDB9yCDE+Bt+7G5JJEsv+svIkR6DPh1kmg06cUnZ+fDMp1ckdu4c8OkoCZ5BPZf
 vGd/3apxJIEIg6xSy0peVpBEIFTMXqb0toywM81GHCpDvj8Vdqrk7MCZLETImB8O22Uu
 ZALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176718; x=1755781518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZELB4+c17Zgz1LBTVaRPLkTpYEUU2ZnNce3ABKyIZzo=;
 b=LhJdxGfD/8Gon2pcfPFp25RMZKipVqpCiTcDIHq2u62aNal/ghphKRIayM4IMDhQAh
 6vARLBS0Blwz+Dn8NIXlTwGDj5gsZY6cEq87LsUCPOv3cEEwTFIyVUfzv0B6ZM5z4ZnS
 Nvjvjrxsy0oy92CvLtNlE5FsK6LWpnOwXX59StDvDIukLZ9Dfvv58ye/PJ3JQvO3esbb
 lpQYKAWZGG2oDhCOwbvBG2L4N5mONrYS++92gXjVd+6cO+RLOEgbAh/+QMqZF1Wr/6Zf
 9nQrmOf0lFNOy18PYtG6/EGA1VapsL4ysi0gwI6x6ngZ6yw/S1CkiWMnCr35/NboiK8p
 vkng==
X-Gm-Message-State: AOJu0YzBMFPG9u4XLV/Ishe8dZzyt4EjJMsRZC4Np42Cx1yaJwLngKwc
 RZUHwUOjhZ3l5KNFUVRzY7dJEf/uI4H/XJNZg3AuTLdLX0vLOALQeMCnMLDPoWH1nR0=
X-Gm-Gg: ASbGncuS6heVCXQRvepbfidDzKv2uQM8+SBJKv8tUKWdD5WASVu6eTt9vwoMxFVfmCD
 q+QuPYJ6IOSJhdEcQXhxxRUDQDFuSQ3BXLMcmk3MNXMJt8trxdb5UAvXFq4yV7uQoDXIRAnDlSF
 nsTII5flWOTy0MtAwir3z/c5vqjdrSsMOlEsslR7I6P5/iQoAAL1nPBECO+kW7UaffeTFeFN53P
 NKLKdUv3jQSZWiIa7RjgNUHpVV1ON4nktxGCfXsxL+6ownmgS6YvQPkExNPUou5v3bZStUe+xvi
 JLCpjG+d9+Uuv5nJwwP0OOogwGzEWCe99mCcjC6h43dEs4UGVHLlwgJ/k+RfkLjGRrg4lXBUhdV
 FygR9qmuVdzqGPkpmBeILTloiSaxod27Rit/aebnY4rEYZgmhy31BN+EcmQ==
X-Google-Smtp-Source: AGHT+IFJO4feDKk0LaggKzdPc3UD+mX3IYfxkI84XpcnCfxFsBphVVMP61Cmxa4qIqRC9lPaqCe59Q==
X-Received: by 2002:a05:6a20:4324:b0:240:265f:4eca with SMTP id
 adf61e73a8af0-240bd325a85mr4140446637.36.1755176717833; 
 Thu, 14 Aug 2025 06:05:17 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:05:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 78/85] target/arm: Enable GCSPR_EL0 for read in user-mode
Date: Thu, 14 Aug 2025 22:57:45 +1000
Message-ID: <20250814125752.164107-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ec63297165..284d1870ec 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -317,6 +317,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->cp15.mdscr_el1 |= 1 << 12;
         /* Enable FEAT_MOPS */
         env->cp15.sctlr_el[1] |= SCTLR_MSCEN;
+        /* For Linux, GCSPR_EL0 is always readable. */
+        if (cpu_isar_feature(aa64_gcs, cpu)) {
+            env->cp15.gcscr_el[0] = GCSCRE0_NTR;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.43.0


