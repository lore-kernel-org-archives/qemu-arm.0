Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp812938ejb;
        Thu, 25 May 2023 17:25:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mYgjJ8c29mZ1CaWa5oTQ4PxmpQocJfgY0WeMyjvz5U1bRVXkDgfcYZl27N8dWj2yo5PrL
X-Received: by 2002:ad4:5f8e:0:b0:5ef:8c79:fe92 with SMTP id jp14-20020ad45f8e000000b005ef8c79fe92mr512940qvb.3.1685060757583;
        Thu, 25 May 2023 17:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060757; cv=none;
        d=google.com; s=arc-20160816;
        b=EzJkMBLIDX6zQkcD/7xbybl7SklkJi5XpNv1jM7P4fbLIjRp/ok0DhC/VKfCpDYdY5
         UXwJzCeO7ae7yywVGgBRfhvK1/GNBZ2OgOLI+KnYT4QydBr+x/2pgxp9dWz+Oc0vdxgr
         oZZATBEFtUaoO10HgJBH7Kj1iB1BWnwnV5O2lhvne9k6G1IZEmnpgsCx9D9+ywubH985
         l7mo+GRMYWJiDk7Fsrpubwun7wUd0Icg+U1c2hjnyZ95hG/BtG8G/FsgQ2aWwEoS3XWg
         cOyyMc22y6djsUEE1ZktCo+1stUQAjy6qj48GAIC4Mcym+RgSSb+r11H8uVO9BsbYnHQ
         0aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o6cJbzSvYvQOTGDtz8/CCuAgm74mnMDf42v4W8C12Tg=;
        b=OfoIoRkeiE+UIx5uOW8vRWLI9A9eNwmUfNyk7uPE8C5Z+ys7LuWSbj1lFyKacs+UlB
         gh7J4hLwHACfzmkip3w910TWrGbx4ZOdymTSTokF+vAFBhk+yT3GWNRCmMVRObPhZDJw
         gUYUPojmrXuaEyPMPalpcvAxvGVMKtoqPVJsC6LNR5qn+0fQ9OE+3RzYs0j9TfwvpxC5
         iGsgtFxrlwzLff8MngnX9GM26od8rUkLmRjspKMU5aLjB1538UDuv8clKVTrOnqkhMuj
         B6/UKVNo5+i7KZQX6KdUtOIL0Eh57MBcwGiiLlhYkjLXfWUC+ozOp8pQvigGebmwZVOA
         WDhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjI4a7DZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a121100b003f6bece649esi963763qtx.267.2023.05.25.17.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjI4a7DZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2LF8-0002W2-OP; Thu, 25 May 2023 20:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LF7-0002UQ-9K
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:41 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LF3-00028K-Mp
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2538aa25873so226809a91.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 17:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060616; x=1687652616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6cJbzSvYvQOTGDtz8/CCuAgm74mnMDf42v4W8C12Tg=;
 b=bjI4a7DZKzaLg63y9jmQ1vqRt/PVvjdAvq1V3UUxVgb8h1HorQmQl0fKN2e69v+QwM
 CW2azV3Zz6wHhwXWL5julyJ1uo5u98IWahjqcjlr7pbcQKNfTvfgTAV5vDp3fqQPT8cU
 Il8aHv5juxFNOkN8Cz/74kcUMHFSLvUgaMuxpBelbqPVqf2qQqcX7rRddw9PZXR/947E
 Iu4R7jikTOHbkthUSbp5MCfiPHpWgbsIliqrkF2Ph4x/q9VnZOXJg5hyO2lgr4mwmkFQ
 kswjhWLNykBwkRrotYQw/bl1wsNxt1+ACkCi13Sk3GaKAc3TS0+6jc8BoAc1n2+g6y6s
 oN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060616; x=1687652616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6cJbzSvYvQOTGDtz8/CCuAgm74mnMDf42v4W8C12Tg=;
 b=XaCgE/FbwZi7Q+8f8d1sdN0pzl1Yhr+K05NfNaGHxBgsir+qksEIVC0DaRHmymchJ5
 jlGhTFCIH1lbg3EAhrdVM26plygeYSQMR1DiIsBpyUXuqzAJOVkj2sflVwbT1YnnWSVO
 qx//eGXluEErLDJJkCbeXCQZWNi9H8pbqhpvv1PmGNPi/cup0AwZOlWwd+T2fHT4avbB
 +ot5XvjY4Ve7nwsuPJ9jbo8OyaOCNmY0w8eodUqCPb+srj3UUOlDo0/lRPNHpaA4C2Vf
 cfRXtvwPSZugKHN5RA4OQ2fgmDjDgqZhjiH5MCk9bWEch9E8anhWk6jNgH2cUfPuGkmH
 qcsA==
X-Gm-Message-State: AC+VfDwxXEjZ+W/VGST2+lNg6ra8NK3Z2fyBtA9Jn8LF9Qe0R/B66Ngk
 GrM1wd5al3S7KVkckWIvOwmr2A==
X-Received: by 2002:a17:90a:f996:b0:250:faff:e201 with SMTP id
 cq22-20020a17090af99600b00250faffe201mr442321pjb.36.1685060616262; 
 Thu, 25 May 2023 17:23:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 01/16] tcg: Fix register move type in tcg_out_ld_helper_ret
Date: Thu, 25 May 2023 17:23:19 -0700
Message-Id: <20230526002334.1760495-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: jWIxK9Fdj7sf

The first move was incorrectly using TCG_TYPE_I32 while the second
move was correctly using TCG_TYPE_REG.  This prevents a 64-bit host
from moving all 128-bits of the return value.

Fixes: ebebea53ef8 ("tcg: Support TCG_TYPE_I128 in tcg_out_{ld,st}_helper_{args,ret}")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ac30d484f5..2352ca4ade 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5736,8 +5736,8 @@ static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
     mov[0].dst = ldst->datalo_reg;
     mov[0].src =
         tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
-    mov[0].dst_type = TCG_TYPE_I32;
-    mov[0].src_type = TCG_TYPE_I32;
+    mov[0].dst_type = TCG_TYPE_REG;
+    mov[0].src_type = TCG_TYPE_REG;
     mov[0].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
 
     mov[1].dst = ldst->datahi_reg;
-- 
2.34.1

