Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp198617ejt;
        Tue, 20 Jun 2023 04:09:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O0qcBAOG8UwmPe32I+pWtTSWKCNSd8zoxw4MgCAfB7zSeudkFQ+b0DkV6rf0EKk6bLNUv
X-Received: by 2002:a05:620a:2996:b0:763:9d1f:3f35 with SMTP id r22-20020a05620a299600b007639d1f3f35mr6223684qkp.5.1687259347791;
        Tue, 20 Jun 2023 04:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259347; cv=none;
        d=google.com; s=arc-20160816;
        b=hcwmpBa/yjtZ4cI/8QW3gBQftpfrHpOH6bqEcBfWwEar9mFh7MptrmApehTx4xv4cK
         nDTQTdtnZLCkv/KihS+4QqjMiWQJYmLQ8eYWcGyqOM02RIX+3nF5ZExyfmfkHGH94dXM
         YfgowmSXHTpWyouyzmhwz2FPBgD4E+1NV2EKzN94X2IkJ7jwgxd7KpYBL6CfXJi9tsxB
         lccBxcD5AEpdmEr815Ek6SMsJCsSTtk6y5YKfAfzTZv3f8JdAK2vxMa2zRWpmktPay5Z
         WcxW/UpxSXWTc25Bidox0cEmvhFaoYD+XZevcT2HGiKF4Mj64Cm7JUlkgYH0wXpmaV2Z
         g/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
        b=YhpOU5i4LQqYFNl1x+hl4vJzu5khaIfjLwkCtvzx/iVoWXGFSGrpNgsSAhAvBnwHeO
         iOHAbzg0qvC8aPNQsX6FnN0c5MmLhuFBWx9Aa0TEug9VXbEJguY7ECrd5b/HXQMJOkIu
         4O/C4j9zw8Dw+LjoPEoZHwQbmKc7VggS6jRa0hQjmRxl7RCwQV1hMbM19eoiKU1+Qsp/
         yKv2ZQo3xI9lM4p3WtJ37ecu8lBli/tm5EuOunWmA+dwF8yZ4Y3a8D47A9FgED2Bx9rc
         +ZYL4empVIO4r/tQ0zjgiy4jiQWiDSEM/Zn/7JHJMURn4MRZXBvYMbRAMiPuc+U2Yt7f
         UlIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/355eKP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17-20020ae9e411000000b0075cf5c73f94si683166qkc.772.2023.06.20.04.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/355eKP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZE6-0006fR-6H; Tue, 20 Jun 2023 07:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDy-0006Ra-1r
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:38 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDv-0004SK-Hr
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:37 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9889952ed18so348515666b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259314; x=1689851314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=H/355eKP2OudGaREb0Jf8k9xBqLbZssn38xZhnZVnrPhbtra2DVNG2Jt1pZ6bZl5qS
 42CvHW2GmSUIrIBR80eaVaFBTrAey1A7XCNpWCDlj1auIisZIXixWwSWwhJRzLHepGlY
 0nqsi8KeIIg5KLo+nnmzd8YB5wAJIZWmbR6V5+gR0p6FORLrgPkOf+nIf7aFGOgGFVcG
 UkKhkiEyiR4U58h4PI8iVEOdIkzZQAPGkOf0SOzOQ36UBq6HqEwOvh2vs2Tqrt86SuSW
 AqwORZXGJXFbcbDa/2RCOVqxIGx9+H02SUVpVZAmyRxV4yWa/mlZxXqDc2NAkvw/QvwQ
 EgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259314; x=1689851314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=lL9LRxdkzl/oIcx+VKafH5P9n/T/8PQtFvJsfOCdUvilqIij6QzfEthLFNP1D3SkOA
 kzVFtJLm8VRYEGaynGzjgFfOtaeiuaLkgLhoEDBiNKK8+6mL8DI7D8xBuqPrwswFnZPo
 kHf336y1k2P3F57wnzXUYbsiqYL982IJWnJVYyVoL2gzUu4tVA7Ul7M2ffX+E1s0xrRx
 cC7EqL9umDTEjZPCuy8Dm0igioBj4jxCU+0N7X5Fx2isgkcVlXASsal4WkTUVRboS9tr
 Pm3jVHNrCWDciC+6FIdslYFLM99jT3kyprCj0sw8Ug/OQsiUy7TYretX2m1afrTFbfVA
 XBYQ==
X-Gm-Message-State: AC+VfDzp8Ntgh54AZG1TAdN0mgALRMcr93jHp3AVXhjYYHjRKCfjCegq
 0MkTNroxeurkAd7jwULY4z3yPg==
X-Received: by 2002:a17:907:844:b0:982:9dc1:a434 with SMTP id
 ww4-20020a170907084400b009829dc1a434mr11166400ejb.19.1687259314270; 
 Tue, 20 Jun 2023 04:08:34 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 25/37] target/riscv: Use aesenc_SB_SR_MC_AK
Date: Tue, 20 Jun 2023 13:07:46 +0200
Message-Id: <20230620110758.787479-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tv8DFgOlxMb6

This implements the AES64ESM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 505166ce5a..c036fe8632 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -198,7 +198,12 @@ static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
 
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, true);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_MC_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

