Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4291511ejc;
        Sun, 26 Feb 2023 21:32:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+NjWka30eETvH+G2uKAiE2W12D1P4wkn5f8B6C2dXZz0UH3nlL/6y6+N710i7ahtbGNc86
X-Received: by 2002:a05:6214:518f:b0:56e:b1e0:3ff2 with SMTP id kl15-20020a056214518f00b0056eb1e03ff2mr38895309qvb.9.1677475979633;
        Sun, 26 Feb 2023 21:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475979; cv=none;
        d=google.com; s=arc-20160816;
        b=joOHOkXZLXWIsnx9wizRp+8cvblEI7ZItGE/JqW/rQ3fHKLRedVjlySlZlGRsMZ+jP
         swYybtlOet6b8yJZh3KsRNkcYnPYSPxTZ1NwwoE7luLDmfqbfDHiab8SGeTzrUlFOW+X
         E9xLEDK5LPxlXna12E0DKyVDVzkulJD3ussWbY+V3RN86oOXR5rk77tj2i/xmvr5eXvb
         hh0HBvgADL/w08K234kqvdDwJemEWOswAupg4Fzo9+jMo2x7vm84rIfSanL2UVHlrSGS
         dVMJDu4PTd913oTCk91PzqKZW/GyB2qbeNbWkUf0wYyZe2LnEnpK1QLZEfILEi9qGJ1Z
         2n6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
        b=BXX8kf30CDX0xONF1L89hGyXHPDldK272stxTetY9btiltY6c37/ymO9YpgXe9O3MX
         N1R/wJygGfUtIWJjnGE2kTPoK10UOrJQ3lA8off/aU3aP2P/FOl2tXQJ9mLAyXu59fVn
         g8mvLAAPNxDaVZjIjJ0ooRxs9F1CZ12alx0ZUjSRxhXPT44O/NEmmxqGnSBOjt3Do4ip
         HZ39fygjPxi67KRNVbJSZqhHXtGDmvT1DxEYIWe5leGrBVkB5ms7bO2p9x8QOL4VxaKb
         mXSKw5UlVb8wcTLgPaJvlYIRBaXyMgC+2L3kkGL+zKt/+d73cTn3+CqiPbL7pXoY9WUo
         jLpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sb+cdnbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a0cf403000000b0056e95273d53si5451348qvl.131.2023.02.26.21.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sb+cdnbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW6S-0005vE-70; Mon, 27 Feb 2023 00:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5a-0003DT-7R
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:23 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5Y-0000OE-MJ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:17 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so5096256pjq.0
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=sb+cdnbYsOXgn8MD7Pzyjou0dbcOJ6CQcx+rfjPxAQP/dUd5Mv5R+jTjMsYx2nee7t
 ruA8Ohas6ptT3YroJF0m97t5clvLSotWXkWElrGlMM8iQVfSdoEdp2U3+++1K0YYFBGP
 0tkR6oAMS+KjaMuoyxRC18LNqfaZrNvs+oYOYiJyxqL6ZNo4brXKAnERH+MiMhypEEAi
 rDOS7P9PgVefPFAPPIBObDLZIU2hqziB53qQX8rNrBeIo89U2KFwewRssXL5fC1CXl2V
 BPwA4DVyRg0Zwti0K1Y7RN4vYuSzvJYzQg5zbS3ltY7f9JBQd7VnuL1ZFWwHHP/Edtxy
 R/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=tcVSqGlOWUnb5Fwehs3q1vH62QJPPY/LSz7yvQNTplx6DnbIZkaIM9/w1eyqjWyipA
 HK40+o+rWs7k6aHeM1cGhQ75zpiNfmaFkF7Opy+TF3xSomqhI7JwBPCxt/w209395EP1
 JnKSGuxCdJV3VsVQH2F0W9952UKsyPqjzkPtOETdTVWFirSoPAjBhRl1nwEWZVCA1YM4
 yXyoJ4fs8FiHG+RS8EHJfd7Cw3XhqNtRpX/w+4nx4y96rZG2ymSEutsf2gB3Tr9x7Nua
 Ynwq2+CTw6c1aiDG+QIYOYM/ul+2iTJB9/iy/b6xE4an+YmVLev73zwHjBpfksKESRTd
 RCXw==
X-Gm-Message-State: AO0yUKXEXScHjX+UMAt8CDbNY5o/6GYv9eYns8cPmyzKHaY+3NuIAWxx
 FXe7DRuM9ZBD7X4vFeYMepAGBZj4z9Fcl8m+Emg=
X-Received: by 2002:a17:90a:e7cc:b0:230:86de:f390 with SMTP id
 kb12-20020a17090ae7cc00b0023086def390mr24155960pjb.42.1677475815415; 
 Sun, 26 Feb 2023 21:30:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 45/76] target/mips: Fix trans_mult_acc return
Date: Sun, 26 Feb 2023 19:24:34 -1000
Message-Id: <20230227052505.352889-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rdsis2LAxyde

Success from trans_* subroutines should be true.

Fixes: 5fa38eedbd ("target/mips: Convert Vr54xx MACC* opcodes to decodetree")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 3e2c98f2c6..a7d241e4e7 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -53,7 +53,7 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 
-    return false;
+    return true;
 }
 
 TRANS(MACC,     trans_mult_acc, gen_helper_macc);
-- 
2.34.1

