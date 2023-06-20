Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp199189ejt;
        Tue, 20 Jun 2023 04:10:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WBeJvO/UhhvQeJiqpbKm9oMHgRbKd8mf+0/l5UmyFGHLqP3mt5ziUCISWjmc9QlI11hwt
X-Received: by 2002:a05:6214:19c3:b0:62b:3d13:2db4 with SMTP id j3-20020a05621419c300b0062b3d132db4mr4560876qvc.43.1687259420765;
        Tue, 20 Jun 2023 04:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259420; cv=none;
        d=google.com; s=arc-20160816;
        b=KyIZnsVkNpnB+DsEDKpPU1XSAaUxEYJItONUZgjhLe1yQyilfsD4MCL7NGLq06wekR
         HsTb4umHud5DlsqSKoOJnYCcANDORo5w5i8ePkIp5XddvXWbDGH1lUw1JJ31bEZDMvyV
         SqpDusjJVxE8sCnf+fkGp+r87YJMMgd+iHH/QRruC4DPOCD9ka+oj2WK9/YPIRuozvBL
         VAAa+u0ctIO3TnYUHQqQX7yIG3eKwxNFgN+FjPJwfnYFOSb//IRuZ0enJz0QRjUBsz1O
         BASvmB/cG8s6iZBYoAPaBgZlz3d0Vg+IaPYLvEFuKmXnoG6z9AkCcsnB1eM2TtoxAlEc
         qt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mjZWs2Y+Z9mHPnjXNP6VJFYBwuCl2SNNXRyLlkiAXFM=;
        b=NYzpTYT2zYlu04xCxatvfU9tLhn6zqPo+j4Uv4dvoLVIqq/gmfhFF+mJVxP9Ce9oZC
         jmnGS3w0EKW8JxbCR7bHLeTfuBWvmjHxMBw9HR4lwzl0dTy9mNB1BckElx4GneixBPSl
         YagtoMEgtBCL8jTJHv86swGbYtevfCjd9mT3fGJyMf5shAQntxATSPFY7COwcFmbmHFt
         ONd8830K9GjbpJ1xIsnlw4dJezMtKh77md1horfzc1aKKT2JNOL5MrbgVk2hfVaQ7J6H
         mBWxrf0ZBPey6ttPprtCC90aVynpITOs7YUa4cBg3x5coC91R//fdazw6YUkLjH71VZu
         ACHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtTpfhmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05622a178900b003f6b1b31fa4si707017qtk.43.2023.06.20.04.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WtTpfhmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZDf-00063G-Rq; Tue, 20 Jun 2023 07:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDe-0005zG-4R
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:18 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDa-0004ES-Ez
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:17 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-982a0232bdcso718256466b.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259293; x=1689851293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjZWs2Y+Z9mHPnjXNP6VJFYBwuCl2SNNXRyLlkiAXFM=;
 b=WtTpfhmL836K+SDKJZcnTDhDgLuRfsn2tUQaR+Ia6h+vYJ19/2sEg9HfMbl5DfxEAz
 mrQVHhwidUHoKlaKS+pS6yo/9BaxNdhFSgBUL4SCagAkRidQx+/CnFN4KhvH5/EnHVkr
 uOG7naBuHjCO0jQ9tN/R0Wak8YXWZ3M61uy3f1aFJ6pTZmBS3xpFHjgMbOw3eT6fOUbR
 5J13df0NCNGtD+U3jyWeHFCBYqomFY5/RclGg+4zfeRMhfTMgUYOLEh1LKnlYpzoUdi4
 2z2dLKhMIRltl3jikMstAWJo2OFkUDB82bco3eapx5xIH1nERF631xZ/qhSsQHziTenb
 GRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259293; x=1689851293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjZWs2Y+Z9mHPnjXNP6VJFYBwuCl2SNNXRyLlkiAXFM=;
 b=MnH+7zRxLGB76bWPRkXDi4ANFuFUisXSXb3jco83pTbV6AI7GGmujd+wKlHj5Isy+O
 aFGPiXGDbOpyteCzlI28lVs+Xds7SBbjreu3GFyUnI9I3Ks4xbzd9m64ULvpsih4wS3M
 tfsG3tGg6uFq7AyG9s09D4wUmo0Y0Vs3FeU4X62ccnZrA5anmZylbbFYd4yVNtb42QNW
 H+LcyiIU6weqnse/VgBv72m3IEoSAFid7VsB5K6Jct420Imj1ZFPExeOCWIgDPTUwB4h
 09xFf4zTLIaMb2BU5r8fj88J7UJ1T9GREWWAK5qBr4UInMDnxw+Vm9qxusof7zWkfhFQ
 mVng==
X-Gm-Message-State: AC+VfDzMHZmq+E0lrmSguYbvYRDostoFFaMCJThyoIwaI77XjOryPKsv
 ozHmrvMROIMTjhOwUyXFe5/uEA==
X-Received: by 2002:a17:907:6ea7:b0:988:9836:3fdb with SMTP id
 sh39-20020a1709076ea700b0098898363fdbmr6149505ejc.11.1687259293201; 
 Tue, 20 Jun 2023 04:08:13 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 08/37] target/arm: Use aesenc_SB_SR_AK
Date: Tue, 20 Jun 2023 13:07:29 +0200
Message-Id: <20230620110758.787479-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bqgK3bKrLAre

This implements the AESE instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 75882d9ea3..00f3b21507 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
@@ -45,6 +46,8 @@ static void clear_tail_16(void *vd, uint32_t desc)
     clear_tail(vd, opr_sz, max_sz);
 }
 
+static const AESState aes_zero = { };
+
 static void do_crypto_aese(uint64_t *rd, uint64_t *rn, uint64_t *rm,
                            const uint8_t *sbox, const uint8_t *shift)
 {
@@ -70,7 +73,26 @@ void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_sbox, AES_shifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /*
+         * Our uint64_t are in the wrong order for big-endian.
+         * The Arm AddRoundKey comes first, while the API AddRoundKey
+         * comes last: perform the xor here, and provide zero to API.
+         */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesenc_SB_SR_AK(ad, &t, &aes_zero, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

