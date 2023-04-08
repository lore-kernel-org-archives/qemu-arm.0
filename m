Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649468ejb;
        Fri, 7 Apr 2023 19:45:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZbHC6ArwPrjdKVm/2pV3718kI1hg6F/xSATYcKQJ3mcuH33td5PKaNnQI7oqIkta1ZRpXQ
X-Received: by 2002:a05:6214:cab:b0:5e6:88f5:5681 with SMTP id s11-20020a0562140cab00b005e688f55681mr8451597qvs.49.1680921948220;
        Fri, 07 Apr 2023 19:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921948; cv=none;
        d=google.com; s=arc-20160816;
        b=GZGTLX5S7CCK9pmCa8WcsmjAywIS3FMwCUMpWg0geR7LmEcnh/znU2IrEjsLXYt/VV
         nuQqcmRCPyboo5qpPqfQRFDqDH6S/YXuL764i5Q/+UNicEeVBMuWacS1CnvUDiK/SvKi
         6hJXnonTTyjNNIZ+PM98MJqm9fRAk3xe5++hLEq0DETRYVcF3ygi4U02oXKfXfyA9Pns
         2JcWYVyNuhC5qwN+Cr0OeU1A2RnHWbDQx3lDe11xk9EZo6matgDIzQqaykZfso9K0LOw
         +oOXDH+LAYVbtLRjlr2zl1r0XFnD3Z5fNXZtx6D2wxG/sdnuqTl/Wo/1e5DWDtTnB8a5
         BukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
        b=ArGL37ZfRq4pMIa5sGwPM2C6KzqXtw+vf8CHyo1J+eRh6ptig0jebLpvtbrmkRwmfq
         nqHkClXUeoCYt1Chb1uSiC0MMpwbHnGNioniI55VhW6od4jV1MTxZqR/TYexSfXHIFqX
         strCC5nyF525GWkdwO14FkI6YJZSz0gHXqSnAp/pMkoh25uME3aROaD1agwg0fIRkvqR
         KiQIJyoo3xm/v0TyqItt4gTIRIHDlTiPixdMa00ZdQE3ziJQrYDQYglUM8EZ2a+n4J+P
         cJxq40wHs+nAmXPbyAeTsOFppzjF8XLUsAiUUx4Vrereah00GxARCUoBEc/Ma8NxytYm
         hmLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BV4QZLoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz4-20020a0562140e6400b005dda9d0228dsi3769646qvb.610.2023.04.07.19.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BV4QZLoD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYK-0007Jh-4m; Fri, 07 Apr 2023 22:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYH-0007FF-5o
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY2-0005XC-SI
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:40 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so2769328pja.2
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=BV4QZLoD9jWd/KXOoAfWwR5QX2ZB5xwkbSayYZPtKFJA7xaXLzTS5HqJyGZPLYlOm2
 dNfmSkrBjBUqD/vKNXWMPv0ZBfxpU2GmNNAhhaZpdxqKYcZoFfYW/pqwtQYtmKU6FaOL
 9k+grM5btznLFtRGn10n4ASK4z4v6zk5JwwuUpfenyBGsPISlJ0koP0ZLSK9hOzK+LeW
 f5781+DGyR48TS2OAUabQUWlK52TxLbY2bzlt85j2Oj3IBFYwXsGnLxZ5CCbw9XMaDuc
 p60Pvtg7tS8bL/6+B9+3kxiUzfsngtCpnK7NS/KcZlzM/cCSHWtnoUH4cvFnBp9MP5ST
 R8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=SzOBf9W91DIG4Tq2Rj6b5DG/zWiwTNur/i1Gvg+fRght2KbR85JJLdo7eU+gXXG5sK
 wP3G3QhrOD4d4rr+WuvmhGA9HJUnzvss4TuwSuejEe5rSSROpq0jl6qSIRHw6aP8pZdV
 udY1yKQJCrzih49qWC1pQP9Wbs8S4zF7uqPab9yGdSIyzWmrSQKlznIzqQJJ8fEvsWtG
 1o1UAmFXq+tQ8036ETYisB8bq4VLlcviTLSwGRfhkrST+7d5jKuNQH9OKLFY2KDe5CnL
 lGjCjzChU8wWwhywnJMpmd7zCW6w6VvC+4L3kVNJmuTRzaj/x9IoQSmmo3q0kSTowecF
 pixw==
X-Gm-Message-State: AAQBX9cDTz9+66gJrsTT5z1gHYdEU1NuJfge0JFCZdJMkdWKeLiGOUra
 +pnPuWq66kOnpCr2S0RPg/FgRw==
X-Received: by 2002:a17:903:68d:b0:1a5:f:a7c7 with SMTP id
 ki13-20020a170903068d00b001a5000fa7c7mr4317569plb.0.1680921805877; 
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 10/42] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:42 -0700
Message-Id: <20230408024314.3357414-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: I7NTejtHRPHL

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 989632e08a..b2146988be 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -458,7 +458,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
-- 
2.34.1

