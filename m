Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5201570lfh;
        Thu, 2 Jun 2022 15:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqxmfXybfyZEKWyoEWJqXYuMcFgZescUvYCvzHskgVDfwdjxl4tYPM1O61GLEGaTgEiHNd
X-Received: by 2002:a05:6214:2267:b0:461:e790:e80f with SMTP id gs7-20020a056214226700b00461e790e80fmr60498824qvb.81.1654207338307;
        Thu, 02 Jun 2022 15:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207338; cv=none;
        d=google.com; s=arc-20160816;
        b=Tzm54y6qtCjvjOxi6QmsAmoKmNWuYyi1x65FkwrECeUlSeUH9H9VXrNw+NKSr90lOE
         4HmnOdVeVyuTeeMDSZzK3HiSEKb3FTHKiGeTRostm41q9B+AE1B6v7yZRRpiSkkmkSID
         TCZHuX7X6DE4oyV9c0mS2T3Deg+lyKnq5rfIJONjeEchOh/UEj4EDL5LykmKBSpFhwUj
         2IUpfw0O/Pru8txyNdXo3YS2d3/6y+ulCkgCEZLfG4BaN3PUtQJr12NvzcBz09dn17mM
         HTtNvZ6kzrGMA9BKm6JhAV8RponegpyjVRag7LXk4ap2mAzEdZ746KT3fGYtWFYHb45E
         9rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
        b=cOJdiMd8RSqxlJ1ZpN3IEOC5wmXVgwd0b/K1Qaqmbpypa8nUJ7wZHPq3jYmEC8oHRd
         eZylznKaxJSg/zdzNi/WVROiToLDPD8BCI/NurhAjDFWwApJa79PSLX9xXQTm6UDirdt
         wy8LBAowckZuVMTfaiWlQdY3Jiv3zevbQOfjl73Kg5on6z3eyywPyBF+SN8CXv9ew3Qh
         6jcGQoVDMtMze9J79X0A0bUSi4eNBIljFvBeBf2S+8URAljILwKSJ4nVXMdloDq+mzxh
         ha8O2Yqww6Ux63dnLmdSJKhUn2LDC1jQdVTha+1ijL5HwfEmIF6fzU8gcLRu6U3ha9+w
         E+vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aknP+xaE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ae9ec0c000000b006a3266adcefsi2709237qkg.76.2022.06.02.15.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aknP+xaE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwstV-0005JE-PN
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgt-0004lt-CY
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:15 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgp-00008F-Qz
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:14 -0400
Received: by mail-pg1-x52a.google.com with SMTP id c14so5763696pgu.13
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=aknP+xaE3VnJiWAP98x59yW/zCR2tdQTtsmsSZCjiGVVxRGYADAk7ADq6BXE+eSWoP
 o4Fw7heXiEWSTz+rRAjSLzd6FCAU8kMsFgJs2Mkh1OG5kNZApnphwvcmoXg4wV9hx3c2
 afNyFW3Ga9VOpYmEcpfKRaaB0sptYT6N/QrY3vLUTH0T6sM5VS7VVk+DU/LCF+jC35m9
 pa8758VRpTSnxzu23ceXXr7mylhbSA01EzDLHNAQxCk5bLHz1QCWRW91eUoPLXxfJyPt
 oheU3m/P7qIAsGR2DtymLb+EppSmSmMJ1siyp68tiMJtMjxcLxM/PWEca4TsMmpUvWiB
 uJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=ll8LTHhT2O4er7DGHfJS6D3LPomB7H305WvnyoO6lFUkFr+5wmhQnL/XN3cfTM2yq7
 UjRF9Olts07HSlgPTY9UTgfpVgGOV972qp01FL4b/dtmOZQ3su6Y8NMeGvMCizC9nn+w
 MGq6/i7Gb4E5ZkHAHLDSirnsgFdUZKPNfGTJdR8+fATybDIHyWtN6d7W7UXGIvaQx3GN
 BWyIpPQtx+kIHvJbj+OApgGxAcv+yuy8J4wcCMM7qUBBOPgTwBbhmVWBL9XDL8PuhhlQ
 gwoTx4tkNBKWdx9CY4y5dFBl40aYHFpJYMd+3q8bFLAjtDxDtM2+ZiTfwt9ENf6vB3z5
 tmTg==
X-Gm-Message-State: AOAM533QzZd9/JMEKxdK+7z7xCqI+WR2JzMQ05c2DZzPaGHt8EniSaK+
 WRJfmQTHg8JmzzI/WoCDRDvElft37nx2BA==
X-Received: by 2002:a62:820a:0:b0:51b:d1f9:b45f with SMTP id
 w10-20020a62820a000000b0051bd1f9b45fmr3544959pfd.63.1654206550275; 
 Thu, 02 Jun 2022 14:49:10 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 18/71] target/arm: Export bfdotadd from vec_helper.c
Date: Thu,  2 Jun 2022 14:48:00 -0700
Message-Id: <20220602214853.496211-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: geW7JZgrD4V0

We will need this over in sme_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 13 +++++++++++++
 target/arm/vec_helper.c   |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 1d527fadac..1f4ed80ff7 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -230,4 +230,17 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
+/**
+ * bfdotadd:
+ * @sum: addend
+ * @e1, @e2: multiplicand vectors
+ *
+ * BFloat16 2-way dot product of @e1 & @e2, accumulating with @sum.
+ * The @e1 and @e2 operands correspond to the 32-bit source vector
+ * slots and contain two Bfloat16 values each.
+ *
+ * Corresponds to the ARM pseudocode function BFDotAdd.
+ */
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 26c373e522..9a9c034e36 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2557,7 +2557,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
  * BFloat16 Dot Product
  */
 
-static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
 {
     /* FPCR is ignored for BFDOT and BFMMLA. */
     float_status bf_status = {
-- 
2.34.1

