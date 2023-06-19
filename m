Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2878009ejt;
        Mon, 19 Jun 2023 08:43:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S0Rm172F+zUYleazMqiVn5b6C4SChqjSFoTahU3SkYuKy1SQFhveTlx06fzdsdmoNkGgU
X-Received: by 2002:a1c:770f:0:b0:3f9:ad5:a6f4 with SMTP id t15-20020a1c770f000000b003f90ad5a6f4mr3176722wmi.8.1687189423981;
        Mon, 19 Jun 2023 08:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189423; cv=none;
        d=google.com; s=arc-20160816;
        b=Hn2AROmuafDNSGjvF1z7wJ+4hUCJtUByDgxGZY8O7MqHQF6lUZSMnl7JC2x833mhYQ
         irdD7akDaWk5njMnYZhMdNwIqjRXzHpZGJ7Cwhh++XV2clMrwaT0YbEsQtov54hgTTZY
         2RiVL5/zXAFafGysxSqvCY52n2eMYYv2iZRl7U8t7ezy5o+7jubbu8WYJg84FNSXWDy0
         ULcrMXiubb2lxEvx2JQY6hSNsPY4pNI0THHOYm+FnQAWMzcPdf0QSD4xS0BDCFSs6vP2
         u6x9NtyLFr2JunzsVXd5YwW3Eg/o8z21iDLGboBOQ0YEq7icgx3uUNEqVfGIdoOUT+LU
         E+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
        b=yLaFY/pFNMsIMG22HeLdMN9SFvJZT56hp7ZIFA45h98t1Q/awPq/f9qKnHQRFusF8z
         rD1DCLlTfnmzrnVI5OOGpdgLt9VVi1KJcRINeem8QTCvJROl98csbQ4wHa4T8/6aF2Sg
         TaVsUd2lg63NLeysX02Z1iCsQ6xsFTpykQzfho0BsVj8Qej4t84RVKG+Fq3ZLx2tNFjq
         E0zobV1f9fucs4O1jx+As9EaouHaQN7FMdbMsu/Vmbk50P0e53pjMIyL2diSVqXWMlDP
         y6+PF+wEUqp9oRL1VGwYrHOsg+iF+knn6dCdr5lMdVHaIOZpzucvbRLw5+rZyCU0+iDN
         DceQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cxfzVFAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05600c19cc00b003f7f838e907si4864795wmq.133.2023.06.19.08.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cxfzVFAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBH2b-0002WU-7e; Mon, 19 Jun 2023 11:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH2Y-0002PJ-Ls
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:43:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH2W-00012S-8p
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:43:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3113675d582so1287317f8f.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687189415; x=1689781415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
 b=cxfzVFAPOJpJzi5oEeFN6Lqd+nIpRHS5RopmOkG+PEL3p2LAuul2//U33WP20BwQzp
 gNR9yogU44Qwt8KQpEUdf0gI6hBgoMBbUQmdYVUY9AQYVO/wM3ai/9sD1408XwUJJ9Cg
 GXGWwg+54MltU1Juh2X0Ycszb9bGcWeF7ANvp1PQVV3/JQdHs1sbiNvqma+ZaeqgedyX
 Z8H+nfjAbbcDEYFb/vO8I6Ak1XhZk+Hp9/JEWxX1eoVgBfO+/msSAL+ZCSdic1ZDPuPZ
 XRf28GyU5IPywUx2nLTyJTpJcBn95y1mR8Olab6XYWestRoRVsFeMDqzPMff+iWwEisQ
 WwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687189415; x=1689781415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
 b=dKuPk+lfLFp06YFh+dbr8dwfdB6dQd/cgEuq6dMcFGdm96EnXJOXARLdoqZGLzkV75
 pD2MGIIb2FvNcviGuoHhHYplmH4zgikZipR0YVgPm9ulmRYj8XCIfRG+Y3nib4sjGyZ/
 IG/6ZTBUTfqsvkROLeKA+crYDdXEKBT2EJSayY2eGtMMqfqqepVAOaNIQuKvn+Kjfqe3
 YPP6UbTCffXdEfV/n+SzgC2bvfYCZdgLhvLBfYBYg5wr/O63DiGqXDqbBvY0ob3ymdWo
 myP/2juqvOnFueNOwFjPF/GGXj535LuJwPm0tdys3WppUPNKWuA0K719oPl8HHWqhaQd
 mwkw==
X-Gm-Message-State: AC+VfDxdhHV6S+mQoxB+1PPsIbIFkInZDakLyEfh9sRWvmk3qkodaW5Z
 B97CslbdVAVWGDN8qg5Nvff40Q==
X-Received: by 2002:a5d:6406:0:b0:307:9f8:4f30 with SMTP id
 z6-20020a5d6406000000b0030709f84f30mr6202912wru.70.1687189414966; 
 Mon, 19 Jun 2023 08:43:34 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 m7-20020a7bce07000000b003f9b155b148sm2928816wmc.34.2023.06.19.08.43.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:43:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/34] target/arm/tcg: Rename helper template headers as
 '.h.inc'
Date: Mon, 19 Jun 2023 17:42:30 +0200
Message-Id: <20230619154302.80350-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: 5OFZ2XO9s/P4

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

