Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484969ejb;
        Mon, 7 Aug 2023 07:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7HLA9AYjIyH/Nn49MkNMtIzY40gb7vgDHihbL2TR82tO3YCvRw4psvQZKZnobCYEOsvH9
X-Received: by 2002:a05:6358:2905:b0:134:e40e:b6d6 with SMTP id y5-20020a056358290500b00134e40eb6d6mr8974988rwb.6.1691417858472;
        Mon, 07 Aug 2023 07:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417858; cv=none;
        d=google.com; s=arc-20160816;
        b=zLRs1szXmm2xJRj+OUJ/GitvxlvNxPzOaeWAevvXDReAr0WQtmp2RBWQfumRh9t21+
         zEprCBJhsBNNYWi1bmltaCConx3JJX0yfvr3S6zGEpjRrwuYi25vz64s4FHE57M9fc4f
         mfbfgwhyvCn4dL8rvhsbOlNJ00jukdQKIfdutNciAe3/krmuRiSuoyYS7euBKhDLO8nN
         JaNsJzh7H5j2zddbO4up3z9bM/rVKN6Rdcq20jUli7sLoCRAkWyhn2Pxzv2NAj/tAvQJ
         oSEiYHlcixL1BJqBJI1xmj14E6bL9sfjAm7TldgLFzbAngCLHdr8f8GDyINMl7L9IjhM
         mXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/yyxHEqA/6T1J8G7sWRRyJB/3QTMgoPg9dM02AxAbq0=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=jQuuip30S0t4KChmFiei7kjvOj2tYRTvEyNQKwGHgOXPlUaEi8PXYu/6nORgwsaNwK
         0Uym/jkc+agQHh8BGwRWz+1ptN28F/eeM9KdriaHu0/J2XPRwHmb9ukxGscW95Qkf/Yp
         lVp21C3zRBsNViwDnsRQaQIplxaSFADzb+FmshHM6xSui6zVGefRdoQ0sSDd9L3yD5VD
         lW3bbJd2NiaFICwhJFFb6goqZWALlqr/SJ0IGRHft2mLvYdxalhGjpWOiyJxXTgFJE9w
         98DOIxoVtgghJ2UjKHL3sF5rxeYCKQriafjaeg47AIf3Puk2MAN/K3/4b86Fv0rw75YF
         xIzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCZeRDrJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a0cdb0b000000b00631fe953d3asi4711736qvk.539.2023.08.07.07.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCZeRDrJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT12P-0001pS-CK; Mon, 07 Aug 2023 10:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT118-0000B0-VB
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT114-0005Uk-D7
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3178fa77b27so3856202f8f.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417723; x=1692022523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/yyxHEqA/6T1J8G7sWRRyJB/3QTMgoPg9dM02AxAbq0=;
 b=dCZeRDrJmVUKLL6uHLM8YCsUNdsXHez4T2u/PAmTSP44PeMCIMj3JtFpIc7//ogs1Q
 /NCSzTbZlR+oEG0taAPZhudx+98jILtmJ3ED7enzbogBxsLKPV2gX6su06p+b0qhbQCA
 XRmmWDOYKmU+UzUv148HIxBkCOJ9o+x9FpQ9qqdlpi/CXrlCZkB3bg8U59/sbxhTDrLA
 CpnwlDBpcZ5xXR4co3Hq1knujVK5cfYDSiLgX/qG0kcIajUtgwxJ8b37uESfMZOLVVrQ
 jADOedeACdU1Zo1P7CPWa1Ipln5mQkgVPJQvqWarRm91uNyYZEKvB8eVBcnsD2QHPuTO
 Mt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417723; x=1692022523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yyxHEqA/6T1J8G7sWRRyJB/3QTMgoPg9dM02AxAbq0=;
 b=F8bfxMqXOpKMIPqcJE7Nmo5PXRWOiNSzS/Iz9TUHxg1e5O+o2XHQQcm3vLXOesm4Qs
 NKLdi5+2zrg4lzzLFtB4qReYvLKMrkETjFdaO+HqH7mMS2+lHE6bmaG9NrIoGicLf2vB
 na4C/xMOGyjrgxC8tK8Yro3atLvcOyicE7ZceDhFgGX7xV+ybuU7IhucoCdxuRc1zFgo
 k+xN8B5T8NKMPWoV/W2idTdjHcVFDvvf9QRRiazWmMHCWA+wuNGbba3jsgIo1p64j0Db
 d/WJv5CI+zwdFTDsC+YuFOqzP/fUGA/dUg8Qb54iXNTtSZCvsSZVuxoiewi4zcAoS3mG
 ZQYw==
X-Gm-Message-State: AOJu0YzAoNdhZ5nIEdDdW/Fbu7Tv4hAiSSfg5RZca2mtPqxqj1eeaXiY
 kuHFC3yEjmWq1e3CpXz+4LT7WU2NqqEE+cGn/sM=
X-Received: by 2002:adf:f60d:0:b0:317:6816:578c with SMTP id
 t13-20020adff60d000000b003176816578cmr7085387wrp.5.1691417722856; 
 Mon, 07 Aug 2023 07:15:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] target/arm/ptw: Set attributes correctly for MMU
 disabled data accesses
Date: Mon,  7 Aug 2023 15:15:11 +0100
Message-Id: <20230807141514.19075-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: FyTGSeXYCjFs

When the MMU is disabled, data accesses should be Device nGnRnE,
Outer Shareable, Untagged.  We handle the other cases from
AArch64.S1DisabledOutput() correctly but missed this one.
Device nGnRnE is memattr == 0, so the only part we were missing
was that shareability should be set to 2 for both insn fetches
and data accesses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 312ccabe92e..7f217a31895 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3108,11 +3108,13 @@ static bool get_phys_addr_disabled(CPUARMState *env,
                 }
             }
         }
-        if (memattr == 0 && access_type == MMU_INST_FETCH) {
-            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-                memattr = 0xee;  /* Normal, WT, RA, NT */
-            } else {
-                memattr = 0x44;  /* Normal, NC, No */
+        if (memattr == 0) {
+            if (access_type == MMU_INST_FETCH) {
+                if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+                    memattr = 0xee;  /* Normal, WT, RA, NT */
+                } else {
+                    memattr = 0x44;  /* Normal, NC, No */
+                }
             }
             shareability = 2; /* outer shareable */
         }
-- 
2.34.1

