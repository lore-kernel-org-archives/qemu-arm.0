Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1370536ejb;
        Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yNHlWAMqFR/FhrsxRfolKNLfpNHFIAiDDizCuKfZqe3mO8Wa/CkQLplYa3EdGa+7QVthh
X-Received: by 2002:a05:6808:192a:b0:394:66a3:c68f with SMTP id bf42-20020a056808192a00b0039466a3c68fmr2645557oib.39.1686473981408;
        Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686473981; cv=none;
        d=google.com; s=arc-20160816;
        b=NbebAdjt4Y20kopOgp2pllYfCqNsDIivRdzuV6ltk7AlA+mW7gOVMlfGfvxoqR+O5N
         E37lhbcIfGBsbZtH5xiXWMtoArS68Fp6CclbWxhwDuJbviETZgfLTsuA5/HosCPD3XUb
         YhKPSQDwo7QktrsBgjY0I5uVzZ75C4KkdF5C2xfwKHsYsDhXH2eNDfOJ15LxJLIl44hJ
         M/oVBMZoyxSow4vWPKgj3lC+hOHN8oUn9GMWoCiI/JVtBAfaNHuQSD9wiIymtgxOdakF
         oYsxlUOVs4KZoCsB0CwHJq3gVoGfDS3lXIV/oqpBrpD236Us7oskDJVuUX2nZTp4zVaV
         X48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
        b=KTn+P+HSgbOYHMzkIIlRdlwcFJU2VQ3NsEizWbWAf5IapJ/Nv0i789c2iIbtIKZCHX
         YCzXGE3vwuq6LNRaFtBBntifoLwTHAmKmkMr2F1kQbGRutNOyx8kSA+CmfriuNIw2VZI
         qSQiJLIULFfpho5aHuRxwEmyCZIIEzKOPn6JQ0QKXcnDpNhXZ7ukM0a6VqDUl4QnFnmw
         gmQF8O32FCuE+t9oqM4Q8LAXZqQSd9vl1bBjOqskSWhGmpdKFLtz0NC/WU8rztBtYOqJ
         nk9grcpq8gVj6cqwZw3wUfqByC3Gqd7logb4RidtwrAaDWULXZzUp5RVzZ/XEwfcmKQg
         dd7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sAhBNdzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f32-20020a05622a1a2000b003f6ac42f745si4686259qtb.126.2023.06.11.01.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sAhBNdzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8Guj-0000zi-RX; Sun, 11 Jun 2023 04:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gui-0000zO-WC
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Guh-0003a3-9h
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6da07ff00so33872835e9.3
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473946; x=1689065946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
 b=sAhBNdzBBnGJ9+/VPT/pteV9lzaEYA4Lt5lf4FbDBG7Yg6IfQTllC7h/kvLmt+iRid
 V+FMxlJQulzydVThmgYHQmawz2YrYPrM8qOvnKEK+XLPqJ6jnAsWhPimyUkrF5u741qj
 pbSrpyofWKtTiExxETG6OUWsiJnhugMKpArYgkNcwZ2lLe45iJja1AYXzHhSpN0Lfjhv
 X6Gc9Y+sSmY3oOB8qgOMmPMag1BCbyMNl7WU8ImvKpo9KDoXSfdJAjEOT0dtABfCmNhb
 S4jxApj84y3r9zKU8qSBUPFoHt1z3r9FrJJtnplBStCNgSDlvvyfKNQ8VEMjpPyvcwRf
 /Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473946; x=1689065946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
 b=P29dzpYohbpdT9EjwliEu7Qz9g9quh2DwEZCzLwihFKZ9xkxF3rVnOkEvrx+cuja9c
 L+yOrSkFkgOIB+4Rt8x3mq6ZHsRv4Ije5nSgT2hsdkWsNrJnfYeR1i02vH6WYyc/SMv3
 elOhG2zA1pnYT31ZiZnp68LLv2Odt1PW2K7cLOGaV3S6eUg1Udmj7KC5qANpEyxF0+xC
 XYcURb3fMsIbbGfjTL6vqVFpMb4l/qX/NI+xypRw6wZwJPubGlbDoWXRaHAV/j52bOfz
 GgIsAANzjslX5gIhPyb9qxbAu5pAQnQ46fEBgD5okvJW4+4cC5rHjS/J5NqI902Q1syX
 cKEA==
X-Gm-Message-State: AC+VfDyZu42pQ/s3TvRb7Nky3DTsTXnGmxRwAB2xzZpZ6Pkj9i9/Wu92
 lwSa/J2bhduGA+8pvzeEf37+Ug==
X-Received: by 2002:a1c:7203:0:b0:3f7:e800:abd2 with SMTP id
 n3-20020a1c7203000000b003f7e800abd2mr5404360wmc.35.1686473945911; 
 Sun, 11 Jun 2023 01:59:05 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 x22-20020a05600c21d600b003f70a7b4537sm7855052wmj.36.2023.06.11.01.59.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/26] target/arm/tcg: Rename helper template headers as
 '.h.inc'
Date: Sun, 11 Jun 2023 10:58:24 +0200
Message-Id: <20230611085846.21415-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 2BzPexRnqeTc

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename the included templates as '.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h                               | 8 ++++----
 target/arm/tcg/{helper-a64.h => helper-a64.h.inc} | 0
 target/arm/tcg/{helper-mve.h => helper-mve.h.inc} | 0
 target/arm/tcg/{helper-sme.h => helper-sme.h.inc} | 0
 target/arm/tcg/{helper-sve.h => helper-sve.h.inc} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (100%)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3335c2b10b..4218d98b51 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1039,9 +1039,9 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
-#include "tcg/helper-a64.h"
-#include "tcg/helper-sve.h"
-#include "tcg/helper-sme.h"
+#include "tcg/helper-a64.h.inc"
+#include "tcg/helper-sve.h.inc"
+#include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-mve.h"
+#include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h.inc
similarity index 100%
rename from target/arm/tcg/helper-a64.h
rename to target/arm/tcg/helper-a64.h.inc
diff --git a/target/arm/tcg/helper-mve.h b/target/arm/tcg/helper-mve.h.inc
similarity index 100%
rename from target/arm/tcg/helper-mve.h
rename to target/arm/tcg/helper-mve.h.inc
diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h.inc
similarity index 100%
rename from target/arm/tcg/helper-sme.h
rename to target/arm/tcg/helper-sme.h.inc
diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h.inc
similarity index 100%
rename from target/arm/tcg/helper-sve.h
rename to target/arm/tcg/helper-sve.h.inc
-- 
2.38.1

