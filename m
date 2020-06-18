Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1279156lfm;
        Wed, 17 Jun 2020 22:01:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLSw/HNKIhnO9QUcvpnmZ8OgB4OTvkhYf/JZayhSj7oDZtDQYtbcdF8qsAIdkGcpMZNf0I
X-Received: by 2002:a5b:74e:: with SMTP id s14mr3647681ybq.104.1592456473599;
        Wed, 17 Jun 2020 22:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456473; cv=none;
        d=google.com; s=arc-20160816;
        b=hrwZ6tQkad/+P60SczxJ6fy0bqqw9Rsp1jWkZ4mkTSCwQnBFR0EUXb8ZfJ9OwMfTfM
         3ddSZ6XGex2cIpmiNraZUkDXNJy4A4UYWnXIY/v95XeVIjm5cthrTOcegJkkeNdvI4CJ
         pUa0dLo1AvN9O4dMThwFFOF09CWiwAhqEEek1b/V8mlDpyNWJTYXKkj7nvpClcp1SqJ7
         clN/jMSJ4/FUwUiRljKEB5Oh0jk/SJefAdK7pAq75bdne6Je2DyeHEyLO5fC/GOyukor
         EIpjL0C/69tdiPo+2DBweBs+JTZ7Rem3952+Prhp+pTtbC4b3kQFMEPRkxURqJ213VfU
         BjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sUjpYX85gvRbXx7OLAC50qSvAFYBPvgDJch2qLP0/gY=;
        b=vtcQQHQDzt1Ou9sW8SEEA/Kuf8rgjJWs5UpPuvTCfMjd6BSWanW9JpGFeoMt7VZ/Ps
         LorKDwNAzLeoXFVE2M0q7tRYV+t5pDrFme1k9BQI//HL+gY9fuOoGZ4B5pFuW7+jtjDu
         fLFyRqq0q6CuBF35VQmJSnM76oTmBMGY8msb3vUIrCPbE32L6oU6PULZSOuL0gtJfevS
         NjfUgsgI+Oo/JiDXocJ2OKXNFzVYxCpMUL6LMv4VItnm5kvu9LVFRRrB5AYf+WXC2phY
         dQUvL63pPOg4Hl8/4C9sJzRQISTOXl0HOrkJDmXRDtbbukisQFtqFG/RTjAoNg93mIYE
         lNMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sGflO3zf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f83si1620149ybg.22.2020.06.17.22.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sGflO3zf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmfp-0005w8-0p
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCu-0003KA-4W
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:20 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCs-0003K7-2r
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:19 -0400
Received: by mail-pf1-x443.google.com with SMTP id s23so2193348pfh.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUjpYX85gvRbXx7OLAC50qSvAFYBPvgDJch2qLP0/gY=;
 b=sGflO3zfvBANaU5bLcNPfwo8SNckoZ/9/+VWaJ8Fscf1YHVvFHYtVclMWsvPNuLODv
 MJbi/XSG11GUYaWtC26gkiy+kau9HPW8tYlIUFdCbs2vNweFJ5SYCWwi3Bi7coFi9HLJ
 1ytid1qMQIfs6b7F+iMfyvFHZRSytMxRW7MbHS3229sDNpfX9DVYqaU5a3555jJTWptZ
 aclXFGQO4zTWQHFQAtEOaIdwamvd5tfo9js6rNLOkafOLl86IYiitZKYzzVwhUcVuXQ1
 Pu/gOcvuUELveiJ/0xyC+D/CsieO3kevhlmJ8MvyHsk9KnKsLQcfS25aa/DFTBMY9eBW
 lCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUjpYX85gvRbXx7OLAC50qSvAFYBPvgDJch2qLP0/gY=;
 b=gXdlyoeYFIhgojqQ5jk7RmL+KeKfI2LKYIxEoDRzNqoh12YWCmamrKeedRbJQwfc25
 fSxizPV71avO8wqj7ryNZ+JpDmmDRh/hhqHfyyBJERWJd7kLPUWwd6betqf4McHNitF7
 4il81qyyA24PIhXVelUNGRAjAFEn2i4nYKs/30BtMtOYWu9XxmVaru9DsJfVrbkZfBal
 5ZLSR1Pmvy6BUg5guLGlNmiWd7uQi6T2RJOHBNJEywnPzEwtXaWWbWVcYc2vqEYU7eKx
 saNtsNBjuJmSYrChsNLm8ueLOw4vvcZ5gehYRJtOdQGgPrViTfnpjoDkKT/M2MkChinX
 R3/Q==
X-Gm-Message-State: AOAM533SGx/yzzJ+7TTEd4TIdIE/h2qlgatwWhe/ZeI1MzxIo/PC1ASI
 7FB5Ujl1yXXUWodR+J5Rbwa7NQ==
X-Received: by 2002:a63:495c:: with SMTP id y28mr1882590pgk.30.1592454676833; 
 Wed, 17 Jun 2020 21:31:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 064/100] target/arm: Fix sve_uzp_p vs odd vector lengths
Date: Wed, 17 Jun 2020 21:26:08 -0700
Message-Id: <20200618042644.1685561-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UcIiC//OrglV

Missed out on compressing the second half of a predicate
with length vl % 512 > 256.

Adjust all of the x + (y << s) to x | (y << s) as a
general style fix.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b1bb2300f8..f0601bf25b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2971,7 +2971,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
     if (oprsz <= 8) {
         l = compress_bits(n[0] >> odd, esz);
         h = compress_bits(m[0] >> odd, esz);
-        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
+        d[0] = l | (h << (4 * oprsz));
     } else {
         ARMPredicateReg tmp_m;
         intptr_t oprsz_16 = oprsz / 16;
@@ -2985,23 +2985,35 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
             h = n[2 * i + 1];
             l = compress_bits(l >> odd, esz);
             h = compress_bits(h >> odd, esz);
-            d[i] = l + (h << 32);
+            d[i] = l | (h << 32);
         }
 
-        /* For VL which is not a power of 2, the results from M do not
-           align nicely with the uint64_t for D.  Put the aligned results
-           from M into TMP_M and then copy it into place afterward.  */
+        /*
+         * For VL which is not a multiple of 512, the results from M do not
+         * align nicely with the uint64_t for D.  Put the aligned results
+         * from M into TMP_M and then copy it into place afterward.
+         */
         if (oprsz & 15) {
-            d[i] = compress_bits(n[2 * i] >> odd, esz);
+            int final_shift = (oprsz & 15) * 2;
+
+            l = n[2 * i + 0];
+            h = n[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            d[i] = l | (h << final_shift);
 
             for (i = 0; i < oprsz_16; i++) {
                 l = m[2 * i + 0];
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                tmp_m.p[i] = l + (h << 32);
+                tmp_m.p[i] = l | (h << 32);
             }
-            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
+            l = m[2 * i + 0];
+            h = m[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            tmp_m.p[i] = l | (h << final_shift);
 
             swap_memmove(vd + oprsz / 2, &tmp_m, oprsz / 2);
         } else {
@@ -3010,7 +3022,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
                 h = m[2 * i + 1];
                 l = compress_bits(l >> odd, esz);
                 h = compress_bits(h >> odd, esz);
-                d[oprsz_16 + i] = l + (h << 32);
+                d[oprsz_16 + i] = l | (h << 32);
             }
         }
     }
-- 
2.25.1

