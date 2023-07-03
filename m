Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172218ejy;
        Mon, 3 Jul 2023 03:09:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH/Z8u9ekWGXZi00QjHc2w7CvYZFqs3C01gGU1xd5I3TYseqYcutuJffnRcWS4ElRZbiB5j
X-Received: by 2002:a05:620a:462c:b0:767:1b81:9ebb with SMTP id br44-20020a05620a462c00b007671b819ebbmr10589859qkb.56.1688378971533;
        Mon, 03 Jul 2023 03:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378971; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfPB5zG90B0RG0HND6uZaMPxLPKpYnnqioZlf6NNHkpvxz86EtRxQUNSq3QGc5LfyE
         wA9rwUNeH12VNC53ZmuMS9f6pKyp6W+c7UqO6HVbgtIafAzCPmGvQsMveMRRa0nOnZ1c
         Uvc7CSn6ZxFfod2Z4wJCcCZ+K3ZIkSWgkvz/73KJPFvdWjX00ixFDenPnpMjqQCP1GOu
         V9UuhJZ8WYulRN4V1cHhTTAAVV+QXanALsLDSIKuM1zm4kSfNH+mpSq2P2AowAnbuKe8
         aCBfFaVUkkFHwXIMyzHVBY8JOsDu5/nNorsbregh49yNF+fMbeFiTLj/4uXJbhAcwFo8
         nvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=awjNPHb4hpgKw6/BX98BisTNl2gXyM8rUcpAkEKG6gqfscte2EtiM/+xifc088ccIi
         Nmh1QhpHmQ8kfFx6HWTPbXnlh0uHYoPPL5u+JG1ZThB748hA+m8BHUUUiJEIqD52ivc4
         QcLT7P/+8phc2Nfq4PzErwRWeG9xOxzf4A4YPiKcuAkegAy37uizhExeTc3kQAvWo8An
         RaVw8dEvdh3bmKxCJUGZv3Etg8kn9pBEwcx1Nj7sL4WfG5yJS6riORq8tC6trdQ1eNOm
         x2g0bh3Lnj+ppJxQW3T3YDFkBUmCiMx/WJfbRExfXZkQldnYTmvKdhdEBGvnohxJQ86Z
         AYYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eRaO08Zr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30-20020a37ab1e000000b0075d2552cc38si10802281qke.452.2023.07.03.03.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eRaO08Zr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGSF-0003mG-3k; Mon, 03 Jul 2023 06:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRf-00036b-Is
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRO-0005xL-5N
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso44951665e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378752; x=1690970752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=eRaO08ZrDSuzrYp5BuQ8239RqbroaXpv62TZftzya4xyfWZ/pv3a/OfQIK1aCcwJZ3
 yCXfLyGJm9p2USDzqFkHExVZ7/j9Ei6Vj4hUxLFughLgCj8kVtVn+uv+onAPbhGcQfMH
 XA3dJnemVe1rFO+5/pEaBcgGbWBWIh+ax1qvLhr7t0W/Gi6Z8x867zxMVwy3UPbL/2Ce
 LglqD9dgoDoTH2IKrzDvQ+Lrm868YEIN3Fiqh+Urgml1XnUphGlEqtSs1aj8THRHduu8
 akt7plmLkGEAW2sDV/odopa6KIDyZIUYuJGnlYDxmbtOGjD9ufsWRFt0J1ByD7lnQ+lU
 bpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378752; x=1690970752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=aF8263cZ/pnpL9bvOAHh4KgbBAcZ1BlP32lBfZXhkt/Vw1HPQ+HYCuA5s8h3aX/U86
 JnOGWpqtvZt2655Rt8DMEUtdyqy9R8+7riPTP9op0GOaIYyny+9p91b+wII8K4XcUXE7
 loI5t3+wHz/xWSyTWEm6DdqKa1kdGmKxxwLOHxLKF2VxOgrQ9cMPSMEkN8zTQvkMLWvh
 7ZGTGOU63RFmPiwhIzpMCy7qjtiCP7R4sJcG2y/gmFN6Om+/AYYwIXuGaTzcayXlZmIY
 bV/Se5TMF3XmxF0Alk3yaCc1da5kzs/BsPmwBJAP6i2P6irOs0JYDSoSPdoehLXwh+bg
 MAOA==
X-Gm-Message-State: AC+VfDwWFboYqXrILaJGp+R2w1fMzTBgVIrFhkFuzLHGDnjuWzU4xVWP
 aunCv9evXcPfwMWvAqD0ap0lDQ==
X-Received: by 2002:a7b:cb4d:0:b0:3f9:b17a:cb61 with SMTP id
 v13-20020a7bcb4d000000b003f9b17acb61mr9585654wmj.13.1688378752763; 
 Mon, 03 Jul 2023 03:05:52 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 29/37] target/riscv: Use aesenc_SB_SR_AK
Date: Mon,  3 Jul 2023 12:05:12 +0200
Message-Id: <20230703100520.68224-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: NlXnwT5OFEuP

This implements the AES64ES instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 2ef30281b1..b072fed3e2 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 
 #define AES_XTIME(a) \
@@ -136,6 +137,8 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
     AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
     AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
 
+static const AESState aes_zero = { };
+
 static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
                                            bool enc, bool mix)
 {
@@ -200,7 +203,12 @@ target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

