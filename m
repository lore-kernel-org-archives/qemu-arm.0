Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6269040ejc;
        Tue, 7 Mar 2023 10:37:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+ve8f9E/OlwkTzYRVIF9343WZewqfm1B3GdpCXA6nyi0DZqtBCdq+Tw7WMLWJGNGS6Mxsl
X-Received: by 2002:a05:6214:19e4:b0:56e:b273:fb53 with SMTP id q4-20020a05621419e400b0056eb273fb53mr28850882qvc.49.1678214237849;
        Tue, 07 Mar 2023 10:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678214237; cv=none;
        d=google.com; s=arc-20160816;
        b=zKRxx2dXwwa0G+UtPQemvW4Gs9zKbyqQgLZtzuIGUkY+I9hWska5ZXY5yjZO8F1ZnE
         ZK4F2C9+M6DoIBVmdR53OVO0TDvegtrGgdpfsHsM4eELeHiUgP/pR3N+Yv3e8xctdnyR
         HbW7rswPXc5GkgsrdJMjRm/dFSmLMaPl7T1+O2NPx8jgtVF9RVWwUvIjFa3RPGidq9Ry
         CVSQZqpTrSeqZGGSzlTHGA5N/P4ErGLbYDubAUObhyxzktZUDFSCjrr9Dp8B0NCAiIOU
         4rbwSU+BD4urc2HGsznKTAF47I/4VgGkpNX8JfzX66AMeWJ+e55lJxibKmxkcg/0WP3N
         ZMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nzq0HMNTYxPoQdwBr6U6yuEWrZYUhbLnx8E8aaEFjeI=;
        b=o5EMUpUpcEglgPuPUPvVBiwDcCDrslwaoUtl6wd77zt+iFNqLk2LbatyPF3yMDafra
         mMtRuII/mOVAk08/aFEBCJD/FAHw4epyxIMDBSDn+gK7zehnpk57dtyx29KX+kZd7RrN
         bMOvztsxpkt3UUlgq6vHq1UpIGPd9IyBGJf8ByGchpav/k+P4FPDfksgMJF89k4G2btV
         rTUB04sNFMRiZroYEuXQ8xzhbuYyn03yBE0oV3OXEliO0ZyKQvZZqg2IBMhqFVNueOiq
         45rLi+w0zu+AKf7j7z3uEjuFwM2pr8LPm6xHn9X9R20R7uhrnxVs+UVygJ1J9so4QgQf
         qhiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIZ6o67M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020a0ce4d3000000b00571ae4ba7absi9846302qvm.475.2023.03.07.10.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 10:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIZ6o67M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZc9b-0003bU-EN; Tue, 07 Mar 2023 13:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Y-0003Yj-IG
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:12 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9W-0007il-Ee
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:12 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ky4so15136642plb.3
 for <qemu-arm@nongnu.org>; Tue, 07 Mar 2023 10:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzq0HMNTYxPoQdwBr6U6yuEWrZYUhbLnx8E8aaEFjeI=;
 b=OIZ6o67M8R0QJvDEdoPtF6358XD0ACF3Si1BSCrgJ4aqA+CEgB7PrtraRvxcGuK0kI
 hgAo+3G/fr3K8LM14kDsQ3k7ijWRmEeso5g5/Q8yj0tON+K8OCEq+OfHNvf/GsA/yzBb
 LbN0VeVAwlFHSVBKhTxAo6F297Q2bXTGE5pSYl2oPXwNfX9OXaqRpX5NcB+YDjRnqaOw
 x5o5hTf8TJgKNhcYEzOTTeG/l3/nmL5v2dV1nOd8ZgS1W91AxyGzWrqdV+iVvrMWD6Oz
 4LuCny9uI4Mt+YvEzyNGaroJmGxYwuZIzzQfsl0aVKqDmgR/TfiqJO/ApRin5rXoWxSy
 ahOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzq0HMNTYxPoQdwBr6U6yuEWrZYUhbLnx8E8aaEFjeI=;
 b=7a0FVbokC33jOIP4TdqKAIvIYJjTV7uL7/SUGZg1/XeGo/gJfoGqQCL7R1QkABUmp7
 WQy87f977jGbTwPpA+4t69m73MVq/UtQ/cMvngfQHRlTiM/1RdGBx58Bfo4szypC9pvt
 oGaw1H8vUT/MMTGdQcA3ANPcMAao3Eame5fXqs7kQno2/5WsjLmMGDi/kYsdfDTiWaGf
 ih9p1RN2Dv20Cu9RbUjjEa3jtUmZ4QM/BmClUwEbIrb0dZIZ2hTf+d/whWJlwkABqroK
 97UgcNRpZUfgx2HM+hq3/xr+Of3SunjHbec6IARK3SwV5S1RCLlIH3r+tQCyb8g25zkP
 07EQ==
X-Gm-Message-State: AO0yUKVrlbrofskLgGk2x2NYTVw70ixDrB9/UBC2WDg+sdVNvFc9Rht5
 8c2ytNI/XjCH5LyfUm+kKdCvaWg/dxUk7owl7qY=
X-Received: by 2002:a17:90b:3a8d:b0:235:53e5:8597 with SMTP id
 om13-20020a17090b3a8d00b0023553e58597mr15825205pjb.34.1678214108892; 
 Tue, 07 Mar 2023 10:35:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/25] target/arm: Improve trans_BFCI
Date: Tue,  7 Mar 2023 10:34:44 -0800
Message-Id: <20230307183503.2512684-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: DWg3WA0fnz7L

Reorg temporary usage so that we can use tcg_constant_i32.
tcg_gen_deposit_i32 already has a width == 32 special case,
so remove the check here.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/tcg/translate.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b70b628000..4451aea09c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7261,8 +7261,8 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
-    TCGv_i32 tmp;
     int msb = a->msb, lsb = a->lsb;
+    TCGv_i32 t_in, t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7277,16 +7277,13 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     width = msb + 1 - lsb;
     if (a->rn == 15) {
         /* BFC */
-        tmp = tcg_const_i32(0);
+        t_in = tcg_constant_i32(0);
     } else {
         /* BFI */
-        tmp = load_reg(s, a->rn);
+        t_in = load_reg(s, a->rn);
     }
-    if (width != 32) {
-        TCGv_i32 tmp2 = load_reg(s, a->rd);
-        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-    }
-    store_reg(s, a->rd, tmp);
+    t_rd = load_reg(s, a->rd);
+    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
     return true;
 }
 
-- 
2.34.1

