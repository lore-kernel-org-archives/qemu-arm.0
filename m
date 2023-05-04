Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp214844ejq;
        Thu, 4 May 2023 04:04:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7eL/g122wJ7mHVSUSqqbwYgfoy/scQ7ioCzTYj9Tf9vr5wos3QCJzNXI9pdn0gO1AJSors
X-Received: by 2002:a05:622a:1750:b0:3ef:7975:99d0 with SMTP id l16-20020a05622a175000b003ef797599d0mr5190463qtk.31.1683198266740;
        Thu, 04 May 2023 04:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683198266; cv=none;
        d=google.com; s=arc-20160816;
        b=fjr78W2BJPkm3L+vrR/74uS9XDuPJAYBY8wFyozBXS6uEQz2s5pqzDH9JRrjZ/KvWT
         dF0s7tox7Vb43B6/R8loQLAm1RuR7pOHMk04MA8ZBJCdRGYQ1D3iBRZm/kVFCRMSOeoy
         QeolZ39xIPUm3uKQFnwOjIjOLJL8iFOGlYo4cBjQVEJ7rIMJ6Pb/sGGLkVFkjiDzyC5H
         zP5Uxb8JwLtfThsY4iOsjLgIDNfxsDCIF0jrDe1m/72KfxKB17/C5JJYUO5zXh/ajirk
         /m/QZiZfkflx9255chA/IsOUPylkjiSHcj5SbvtGauW4gQbLcfUXtfCJfAqNZBJI1ooz
         G1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aGw5su4tM0a+gusZAdk7uk47Ld4BoHoi82Y5UurxcOw=;
        b=bX5DUpYbvSF0+thtxyo0r6awV+ngniikDz7hllCujIBYmnUNd4LpcRq2X4hK0mXFzr
         fHZ4Lr1tKfj8HRRyipGtSAkwcmP8D+KvoXW1j/NLmWZbjyGWBw+9LCZ7LrKcHngnoJLt
         5e4Bdfawht6IIqVEuR5biau4qQ7GzfTJJeJ6vpG7mvD9LUbc6VcYIQNUxTnAmVycvK4I
         HHuG56Vi4Aclz+c70nfAWcfuwpVo2wFlV53M90TaQo8UjuOIyI/mb1HjurfEojvPTam2
         sBcpVVtYryyZxUbdFGhVTsfH/Gxwe1Bm3m/I72N8PYD+OM3pBmuVzp2g8lWpq8eKJp5I
         cqmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qzFOwK6y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020ac87f14000000b003f216233939si4480165qtk.0.2023.05.04.04.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 04:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qzFOwK6y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puWl4-0005fS-HH; Thu, 04 May 2023 07:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl3-0005el-Cs
 for qemu-arm@nongnu.org; Thu, 04 May 2023 07:04:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl0-0003ag-Rv
 for qemu-arm@nongnu.org; Thu, 04 May 2023 07:04:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so491539a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 May 2023 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198257; x=1685790257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGw5su4tM0a+gusZAdk7uk47Ld4BoHoi82Y5UurxcOw=;
 b=qzFOwK6ybxEadA8/mtBSd0Nlos/Z0OEhYBgP4rf7IQgKsxsL8hSR00k4Tfvr5gknkS
 glHTLwOHIYt3ZeYXktOASgU+PH5ibexzuyxoE7vwvawHjJFMHoG2KIs9Ci3eYHb5uqYL
 ovz61NGQjhPyFrk8DMqPNZCw7vM2fb1PcH+z8LNv+Dpw3IUpLrHHCrX8HKf1R7OImyZw
 yswW8Lo2QQfjJDkR7okDCASeBf54EnxEtW8T+tciuytPppXO9AJnG2eOZ1PAO7VGKuOV
 Cu/PjH4tOw/B5SUYrzzbLqrth0hSOs93IaAl8+YMcyOf2dOdYrbdaWd3i2kd3UYOqF3o
 5dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198257; x=1685790257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGw5su4tM0a+gusZAdk7uk47Ld4BoHoi82Y5UurxcOw=;
 b=ZqGD6xBe4ipuDaqjZmifKpZLdqWvWikR9jDhmU4deoCdan2CzDGFCESf64JYGJVqKF
 /adW7vUVqCjlgSk/3qYisXGEVU1M9HGHvRiJys7fYbtPBax+JUbYCgB8Km5mOwWq9/qy
 12b5NDyZ9XAd1sQ4xmOXuMn7Gt6KkuNaLDn4jwICAwUCnrYpa+Fau9PqqXUssXannkGj
 8/+1ZrK0Q/IwYZHwax9eAVhbOlg0q0piOZTvKu/u8TjknjTi1tPDMMH+BL+k0p1HAOsi
 4YUFHFI8z//fI0ghf89iB4ZCkJIxnZ7wQ83KJ0kvKpJ1d9hOt2h8B8vdYLOnvwdQ4+6p
 XQ0g==
X-Gm-Message-State: AC+VfDzG1o41Yq+Tziz04QleuL9o2i7fWsB2hhcQY10p6DTUBCgDXift
 SeOni6kBoH9UYfQWyMOBBSNPDg==
X-Received: by 2002:a17:907:934d:b0:958:489f:d050 with SMTP id
 bv13-20020a170907934d00b00958489fd050mr6266099ejc.43.1683198257073; 
 Thu, 04 May 2023 04:04:17 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090648c500b008c16025b318sm18626175ejt.155.2023.05.04.04.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:04:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/
Date: Thu,  4 May 2023 12:04:12 +0100
Message-Id: <20230504110412.1892411-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: yKnSzxJVn2qD

While we cannot move the main "helper.h" out of target/arm/,
due to usage by generic code, we can move the sub-includes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h               | 8 ++++----
 target/arm/{ => tcg}/helper-a64.h | 0
 target/arm/{ => tcg}/helper-mve.h | 0
 target/arm/{ => tcg}/helper-sme.h | 0
 target/arm/{ => tcg}/helper-sve.h | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/{ => tcg}/helper-a64.h (100%)
 rename target/arm/{ => tcg}/helper-mve.h (100%)
 rename target/arm/{ => tcg}/helper-sme.h (100%)
 rename target/arm/{ => tcg}/helper-sve.h (100%)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 018b00ea75..3335c2b10b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1039,9 +1039,9 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
-#include "helper-a64.h"
-#include "helper-sve.h"
-#include "helper-sme.h"
+#include "tcg/helper-a64.h"
+#include "tcg/helper-sve.h"
+#include "tcg/helper-sme.h"
 #endif
 
-#include "helper-mve.h"
+#include "tcg/helper-mve.h"
diff --git a/target/arm/helper-a64.h b/target/arm/tcg/helper-a64.h
similarity index 100%
rename from target/arm/helper-a64.h
rename to target/arm/tcg/helper-a64.h
diff --git a/target/arm/helper-mve.h b/target/arm/tcg/helper-mve.h
similarity index 100%
rename from target/arm/helper-mve.h
rename to target/arm/tcg/helper-mve.h
diff --git a/target/arm/helper-sme.h b/target/arm/tcg/helper-sme.h
similarity index 100%
rename from target/arm/helper-sme.h
rename to target/arm/tcg/helper-sme.h
diff --git a/target/arm/helper-sve.h b/target/arm/tcg/helper-sve.h
similarity index 100%
rename from target/arm/helper-sve.h
rename to target/arm/tcg/helper-sve.h
-- 
2.34.1

