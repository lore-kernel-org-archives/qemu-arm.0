Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3709121qtb;
        Wed, 2 Jul 2025 05:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgfeUw/RHWwdPQAHLb7TAMm6qPPvrl+QSV7/7pttHZ0abaGV3v1l4wPFf/TAVEPX+djWxMpH1MdqfD+g==@linaro.org
X-Google-Smtp-Source: AGHT+IE1oPkPZa9JNaLtrjOIqKD2FTnXJ2KkbnQHdqC+Qzr0lfuPJkdyCJE6t8CeENBkeBAN4Wn5
X-Received: by 2002:ad4:5948:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-702b1c04e2dmr39754346d6.31.1751460226110;
        Wed, 02 Jul 2025 05:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460226; cv=none;
        d=google.com; s=arc-20240605;
        b=Rrb0zXRRZIDEnjtijIY/b+yAPzUOb4sE8PRFdj1VZCkVn+5O9GP16+B1xlIapmvZuf
         5oZ1glKDBPHVDa4sqi89LGhaFAQa4SPCjlpshSlHsV9vlEq+N0Zx0IVdR5UEYFlHkZWl
         6c43J4VrTZycptl9DSgBtNjkMnRWIQlbN3fY/B3LBRP7euLxc8/AfiGw1Mdsm7RHdAM2
         gZ8AJv1xLuPEJhSHrjMIh01rmYKQKTXZWF7rsJ6B+4xpGcpfNA+KLHxmf/TcdWUsqjWD
         3VNcQOt7Iyw2YYPO9qxRg1SEdqdeGJGJeIqWzzejZ/cGKd6pGAz0tlHCU1xV70WEJuEk
         JqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ymtxh/t5Vz2HpH0lDSu55N56lt8mlCDF9TtMdx4EgyM=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=jQ1QNUTXMelvYdWG7WH2kCkwPmtE42uJmVeiiLJyTvNVnxkwDh073F+awTuq7w8rf/
         6sVpLYg/ojEzqc2ab8FiN7xIbV7L72fKDYlVSG1AAITtmNJgcEjoVdxdXfzpGziGISm+
         NP1Nt5ZONQlxq/vOi93e+BwgUwvMEcNyr2BeUEYbic0wPRNbWedoXVJAt8Blb9uoGGzU
         LeTgd+kI1QWnI/iLaymnKKgt6iRbmUdXpvqU/NC57be7NAj+l66WBl068iiPkRpX+VjH
         b3igvZYUlcQiiinGYdCzvY2v81ghglHUaSHWsA7NyP0GWK8qo5wzpRf/D+KANNNthoYh
         SvDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJau4tOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702b45206b2si11594716d6.58.2025.07.02.05.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJau4tOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwo5-0001vA-UE; Wed, 02 Jul 2025 08:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjb-0004QQ-Ue
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:45 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjV-0002A6-EU
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:43 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-60402c94319so3919092eaf.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459911; x=1752064711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymtxh/t5Vz2HpH0lDSu55N56lt8mlCDF9TtMdx4EgyM=;
 b=tJau4tOmJw0sP3UDFwCwjPm9I3bl6BYQA8avv/eX+dQMYiThJYb5mV5/I2UPvXrO/D
 1qrLO1a+ykY/GS29R1zNyaagzS8PSbbdVc4ZRA/C/Iq3XkAvSVlphPpWaLVM5iOT8eHz
 g1QYq3GOwWxcOWrE+vfWypqohVoeUR0Tf4GEZJ9GwKUn/1xSlgSYy78OuC/pNrfl2ZKh
 7tAzAK0y6octqtP1wJEvpdS2LrHiEkksgR6SclDgQ9ac1nQB30OW+mEfWDtu4LVWpoeA
 HFdRc1pQzZa6Dn8Vdn+UOVsWu+2GCvMpf/C4ns+QxMCr9DMhmRF+8Z456aQcE9ErH0Ev
 8h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459911; x=1752064711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymtxh/t5Vz2HpH0lDSu55N56lt8mlCDF9TtMdx4EgyM=;
 b=ZysTmvrFYE5ucVoMpvxPQkU2Ork+2fNiHiWi495P1B8GUgPL/9WZVLK5Nn7Bt9BWIH
 NLouqONThsoOTdjYy9kLnfOTTDOIjQ0aOfVtdA6I4Beqsyev0RTj9SOBsxva/VGmLy3r
 ChvT9koCtNlIHVne10wIl3F9IvSWWrJs7qfSDpnzl4zeoLMmKcneoGqNmIwIosZeNiLL
 8sk6D/chcRBsVtHaBJDD4Z7LTaxJI6sini/RbqMxE5PJrmvms2HnooYy/lKp4h/M3svP
 nAW2rzvitj6hbeUUOMQvX/YpiVWk80n5DDCHIs2fc9aPew6cpsKATFOD+ixZJzx+s9Gz
 WFJw==
X-Gm-Message-State: AOJu0Yy3Pn6SgFFtp2DXni4iEhJt785a+E7VzLtbI0TJK3vvUZydjfde
 BtX7T9vltBaJnlh2GSdA2xEZt2M4tdsrqnOB6wsHZ6x7SQolwyto749WGGppBUHvrxY=
X-Gm-Gg: ASbGncsLc/Je9tCW+VtZ15oD3T/oFcS9nNYRt6LUbLtnE4AIVbdOiiZJGvX1pHkKNKM
 ouHR+IDsEPOVIaAZoavonylhndsB4pGOn5S1Dp+sFOtGksrfbpIE5bVYeAbVL7nccdZGuj92y3W
 pFN7y1WgyNVHMnmA2zcv+7TlXLw223R1qf8Lq8tuv1qUdbR7WqsNoCFOSZQIsOD6hwBqOtlSGbQ
 jfVv6Es3xgOvB3sgaDcB2YS/GdXy7y2EqK4+BlEEwt/UDFXSN7wQoLEHbvosL0wDVuxUk6/9f6u
 CwmHMlacDuMLcpLrEoitXnjx2JajcbXE9jlwfHE+EdOscN3zochccxAjQxmN4s1+BJpxI1l/MkN
 k6HWN
X-Received: by 2002:a05:6870:ef05:b0:2f3:e087:7ced with SMTP id
 586e51a60fabf-2f5a8ba6a07mr1858594fac.2.1751459911225; 
 Wed, 02 Jul 2025 05:38:31 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 61/97] target/arm: Fold predtest_ones into helper_sve_brkns
Date: Wed,  2 Jul 2025 06:33:34 -0600
Message-ID: <20250702123410.761208-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fP899dXwbyJV

Merge predtest_ones into its only caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 8fb9d0241d..5014fd135d 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4061,31 +4061,25 @@ void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
     }
 }
 
-/* As if PredTest(Ones(PL), D, esz).  */
-static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
-                              uint64_t esz_mask)
-{
-    uint32_t flags = PREDTEST_INIT;
-    intptr_t i;
-
-    for (i = 0; i < oprsz / 8; i++) {
-        flags = iter_predtest_fwd(d->p[i], esz_mask, flags);
-    }
-    if (oprsz & 7) {
-        uint64_t mask = ~(-1ULL << (8 * (oprsz & 7)));
-        flags = iter_predtest_fwd(d->p[i], esz_mask & mask, flags);
-    }
-    return flags;
-}
-
 uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (last_active_pred(vn, vg, oprsz)) {
-        return predtest_ones(vd, oprsz, -1);
-    } else {
-        return do_zero(vd, oprsz);
+        ARMPredicateReg *d = vd;
+        uint32_t flags = PREDTEST_INIT;
+        intptr_t i;
+
+        /* As if PredTest(Ones(PL), D, MO_8).  */
+        for (i = 0; i < oprsz / 8; i++) {
+            flags = iter_predtest_fwd(d->p[i], -1, flags);
+        }
+        if (oprsz & 7) {
+            uint64_t mask = ~(-1ULL << (8 * (oprsz & 7)));
+            flags = iter_predtest_fwd(d->p[i], mask, flags);
+        }
+        return flags;
     }
+    return do_zero(vd, oprsz);
 }
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
-- 
2.43.0

