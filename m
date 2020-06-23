Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4352840lfm;
        Tue, 23 Jun 2020 12:56:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEcIq03RhhhoDDpBCeZ/XPqkCYC3rxxlWqZa+BInLrKT2gKqRDACRsmH6XlNsZQQDHc18V
X-Received: by 2002:a25:32d1:: with SMTP id y200mr39974351yby.507.1592942189643;
        Tue, 23 Jun 2020 12:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592942189; cv=none;
        d=google.com; s=arc-20160816;
        b=xoKvGaBKcWcYUdnItyihV6+ijkh7x9h52ZfM/LPBkGz8O53M/tY01Av9lS4lRTdlO1
         Hg8x+J19LaXRwP6iRRl1Uz5eMtggo+wLOzYSiJ7rAtzaOMQhVelfsBFW3bRb0Tmec3rY
         3JsJOoZsDzu0lnc3WqEWmQkt2t4bOyTKXXvSpP0hThoRvR13BsK9Kc90ZdBPTU4cetMr
         naVBOwhLVlWU9QT7WQzlsU041k2bKq/qucgJts2ZaNuKgPMRvQSX1aDR7YZswOsNG2zB
         nmjnWbLujsPNXf/rTrWnB0icaPNAVtkd9+wyYtvM76tRq2oqalMA1vmq4h+H3OU6LSCQ
         1AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SDD847ond76J9XGL5A29cRd+o3rpRZsV5UU2znfqmjI=;
        b=E1mTTxDJGFp7gHRkh/U9aGD1AmXtYQ+hRqMIPhfq+lFUgj3ZEwj35ebs7L6eLTmKjm
         RiXPPvHlY2EUPgIdwVXZ7+RMoPuQrOq/grU9cfye+rk0vyyZ1vAaab1QCJs8X7QA6feX
         0qbw45iWkNf1b1cz9264C/EJ+AvUSPNVdw4+nSUj8LtwwoiNz6feOYz0zeQVh1t25drr
         kgL/w6LDI9plH4CQytljlHQggw+odqWT9nx3QEua5ndOSDb1elO91RC4JyVP77sE4rd0
         Qi+3YM2A7/cvU3HG0TWTZs+yM8mhJT0hMs5G7wsP5Dbvmis0uwfiO1e7zFaXVn+Ioek0
         PStQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FAipURx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e81si17461577ybf.12.2020.06.23.12.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FAipURx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnp1w-0006jX-W1
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojr-0004gc-Li
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:47 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojo-0005r2-MZ
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:47 -0400
Received: by mail-pf1-x441.google.com with SMTP id 136so963266pfv.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDD847ond76J9XGL5A29cRd+o3rpRZsV5UU2znfqmjI=;
 b=FAipURx3opxuS5QOjkETUoEEAZDBqFgjjCdMSYWZIKcz7hy4p7wyqt50wqZNYJwvoH
 TPJQ+TbzM72E/8nHmdX4xblHnQmrt30kb98r34zDxv8AuvHUWjZlYPdkYlkX/SaapZyn
 dpTG8PjCqCTO7cZRgEi1zDNrnDS61DrgqpF6k0tSuqdVRwZR3ehQtieA1GrVxaXYOytG
 mI723qM8CNPYVKRLbfjo/powfJ6LkamP54otVfSyhjQAzp+YzVYQHfnjzvfHLNfsCiiG
 wuHPUcEMbHnnTHwnir05eAfOU9Q4BlytgHU9aOgOLhjm379/Oo9Xs5VXFk9gYuqtBpcY
 UMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDD847ond76J9XGL5A29cRd+o3rpRZsV5UU2znfqmjI=;
 b=hF5718YSnGOIspT27CG2PLNQctyj3L6ln/1g7t1X6/Wo/3T8LVF/UaLzMfWBy3E7kt
 GbvGlWKWkaErtUZyU+X/mtQUGMQCbHzLvDBjIdVBZ77D6DjmmicozobCbL26ybbP0pYw
 p2N+nqWF8cDwp7e5UgbyeBK+akuFq1isjSjrzpvEK+OIEcxJR18gzbVHIaXgYnnnvWW5
 0Wy1h79+Oukq3/KLXdc13r/o4ADXa2vB27L3QqERjDgREdjIZrvtiSa7QgCnUSoeZBZG
 FlqUiaybFdbCNpFTYA5Z33xu46BLPmUCGbdijoi/RUuU96hZVd9wdr9X6JjyfuejZPdb
 cdng==
X-Gm-Message-State: AOAM533d04sblLi95a93KeoeKHfcMfqpAO/P4gzveBgnyG2HB9Cnrz9G
 PSQdiZY3kyoJ4nGEgwjFCdh+dQ==
X-Received: by 2002:aa7:9d9a:: with SMTP id f26mr25575927pfq.229.1592941063433; 
 Tue, 23 Jun 2020 12:37:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 31/45] target/arm: Tidy trans_LD1R_zpri
Date: Tue, 23 Jun 2020 12:36:44 -0700
Message-Id: <20200623193658.623279-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1xfYaEpCTaIx

Move the variable declarations to the top of the function,
but do not create a new label before sve_access_check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Split out from previous patch (pmm).
---
 target/arm/translate-sve.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4fa521989d..a3a0b98fbc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4883,17 +4883,19 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
 /* Load and broadcast element.  */
 static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 {
-    if (!sve_access_check(s)) {
-        return true;
-    }
-
     unsigned vsz = vec_full_reg_size(s);
     unsigned psz = pred_full_reg_size(s);
     unsigned esz = dtype_esz[a->dtype];
     unsigned msz = dtype_msz(a->dtype);
-    TCGLabel *over = gen_new_label();
+    TCGLabel *over;
     TCGv_i64 temp, clean_addr;
 
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    over = gen_new_label();
+
     /* If the guarding predicate has no bits set, no load occurs.  */
     if (psz <= 8) {
         /* Reduce the pred_esz_masks value simply to reduce the
-- 
2.25.1

