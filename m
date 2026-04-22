Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EFAF9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:11:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUYC-00071e-Se; Wed, 22 Apr 2026 06:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXp-0006ry-8Y
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXm-0000lH-Q6
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso20230185e9.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852653; x=1777457453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAtQqYAVHVvhu80r9xI/PSbLS4M6sLMvc1JPbP3qMzs=;
 b=j+wSpGcEN4LIBEvUj98+3sjf2+1OFjZCKUw62Snd+rABXSoBvZCodcC1PqN1y0gIpF
 aN5dnhde8Wl93zRHYh+Y9Rm3q9+F44oDpl7h75XkfTdfYGnwmJrOqfg3sgf7G684wdoG
 PTpVSGSOE3qroHwDLF2SnRwZ4CnJIxUxYyln3+ftvf6GP7Xv/U1KXqOpQgSrklzDdudP
 uFwZHuo9iwB3oZUiAnGT1AwaLMblBB43gFwVMINWvCUn+3RJOvAZgEBTIPNvDZgWbxd0
 4n6KRdOEgXlqM+kJdcXrhLON7vDxitA0Zrb8JLeFk6MquSFfeUHPc9GXHiTtb7z+zbPE
 8+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852653; x=1777457453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EAtQqYAVHVvhu80r9xI/PSbLS4M6sLMvc1JPbP3qMzs=;
 b=BFq5O86OfEXVACgKeocfloIQE31F8hS2dI2VF3hXA+RXRziW32YeqFOq6ICyePjq9p
 VfmsqsEA3BnUKgkFeao3ij483EgLGyJLD6UDRMnzVB8ufhk8D8fkj5JAbhGzUDs0RwYw
 Kz9lkaLY2j3EnC5CzwJM7MVV/17Wg/UYD29tZ+0qnmZpenCgXMtGTkxe9eyI6cTJaJ9S
 g/dK9bo3QdbFEuIVJPiUBfK36a/bZfU2NV2OwrnNeJlz/P89EWZOpyu9GH6Ux5a6mXqV
 JmMQKWm023IY3sFLSSvKsBfUIDZ4K6z4dUsVfNBg8JAl0TaAvROGkG/jMI1CIjng+bdp
 tvow==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pJEXMfgtFBCZPN/1HyS+mppHhX1UErPIp4cu71P56qewrMT/XEOLR4+Sb2oxA4j0es15/va07EA==@nongnu.org
X-Gm-Message-State: AOJu0Yyz8mOWm56jm9Ay247VftoOOuTkx902iLxiolt4My5N5H6L6WdY
 qwaWp1PbNQ5GQp2cWiqNoYPEf6W9EuhkPfyF5jKT3bjPA/MW4v6Jx8b89dqczeYm1Rc=
X-Gm-Gg: AeBDievnv7L1nkYp2UzLOmra4RIv4NBcXEAK0PpMLl+EEpIj7Q3k1HAAsi0MdWmjpQf
 hXjzmhgKDqNIK/k1dvSfW0j3VlJcZeK0ZURi+f8tODRhNU+ARo6CxbQy6aq6PublJSRpPLPM8ND
 LAsvtS70iw4Ps7u1D3jRzaEDY9KO12NQ4FTIKSAZcxjlT1pBoR/1gQ0qVjQaG4dpz8pm7jlJLEm
 hr8cu80a6epvM3NBOSyjMlsq0aIByTLwUjchWAo+e4SQEE8QxlyTgWx6LIqqBxT8NQrpLVvajpi
 d37AXA9rdIuSRL4nzwMZu/x9kMu3hbzn7cRQHoun8q8QSHTvxUWrSi04h2mLxK9uPA0lp6XsBPg
 oSYgOM+QZvhL2fqUkz87LOlg2qr3+OJBS2a2ERxdXOkdGg1rm1iWb8qb/Wnk0KcTC0B2h7+Z513
 WHvtEHR0k11mriRdMyQ5NENCn3FkLbhcwrUtzvOJ/hHqYz
X-Received: by 2002:a05:600c:8909:b0:489:1b10:d896 with SMTP id
 5b1f17b1804b1-4891b10dd45mr174107775e9.0.1776852652830; 
 Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffc558f2sm296321775e9.1.2026.04.22.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0180F608C6;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/31] target/arm: migrate BTI trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 11:10:18 +0100
Message-ID: <20260422101043.1234229-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index fd8639d4f07..52a6745cb23 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -426,9 +426,18 @@ static inline uint32_t syn_pactrap(void)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from a Branch Target Identification
+ * instruction.
+ */
+FIELD(BTI_ISS, BTYPE, 0, 2)
+
 static inline uint32_t syn_btitrap(int btype)
 {
-    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | btype;
+    uint32_t res = syn_set_ec(0, EC_BTITRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, BTI_ISS, BTYPE, btype);
+    return res;
 }
 
 static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
-- 
2.47.3


