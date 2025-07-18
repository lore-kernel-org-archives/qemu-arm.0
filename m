Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EAFC83F1A
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 17:44:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucp8X-0008VZ-SB; Fri, 18 Jul 2025 13:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucov3-00055x-Te
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucov0-0000sY-I5
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1380018f8f.1
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752859845; x=1753464645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTq6sdILRqpJUa4aACdnr1dXTMtMDz2K4P9Jj5bpG7E=;
 b=Cr1rBjbQOPdd0iMcCKRN8oEZlarmlzn7k232BHijLQBlBsBpTUdjMZjNkQy7F3TPbN
 Qs2vVNmaBcjJNO1Go+tUZwwy5m7c725j3rHb0Bof3oO+d119QECTCBh6ecfvDg2/unBe
 GA9kLqqktK7h2EEmwxpwWEht1sKk6K528Q7oAm1L/78KvqUBpNLwBQZHXm48Xp+IlTEN
 EmhrSKZU/v+bVI5qGvVopxXpsPdcLOBk47ahikYh9Q3W6QiRmrjNDVofdryD5sFDQv+l
 IC3NDq1Jxz5dvjDmNpUd4lt0earNkwfvcRZxyCHbFs2zYCFFZj9plB1hMN+ASZJ9TpuD
 o8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859845; x=1753464645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTq6sdILRqpJUa4aACdnr1dXTMtMDz2K4P9Jj5bpG7E=;
 b=fk++bLKL8ZMzijOaQt51ztrTp2O3LpQFSriC0M0LIirs39MIJf89LuPOmcWfl+MCeb
 y1N5p2/Kl3fqZFbLxGcnnRIbsALNhesXKGjh8Lfd4dF5DW6jdlpNMx9yUFDI+fdoLpLB
 84tWzhl65OAXsTQjU9MFVzfp4oWp4gRO77t+iFXiJMRwhIKDLozrfFwNNFNcD9sMYm1I
 /M0Dewaw4K63JD/o2OBBNDcJFgXKrVLiJGFfd5u0eXdXn/Gq3wU53m6WNjtiUw/sSJl1
 3zfAXMjA+Ui/soErcMGVWlVTIxdKL692410ufnBEakPcpdwkU9cDCnl38/qqNGjJzO0r
 OKBw==
X-Gm-Message-State: AOJu0YwH7rAdaRxoQ9+h+DJ3x2PZq01E+gxevI3UqvnNrEhE2X3i4eQP
 pSzns8SRgUIMPBwo5YA0HflFHJO+v1Vl8rImczcEGQUWbD9LM6+8kxcnJ3Hxgqir7aALlZvAvgK
 Ntwgl
X-Gm-Gg: ASbGncsu/edWCOXAF9uH6EeTmgm3Dy7ZP2BscmQFHBbQfj+6sNPU6kD1UtDiW1kJ+fN
 ccn1P69vBd99jq22+O9heENGHc2FixWs/5bp5Q+n8Y2APgLsIH9LUWMIvpF1W9+DB9+dpBzKZwL
 sEAQxlzPx1DnnE8vpA0rQadD1cCTF/5+rvnWEaGhTRnUqVccDvkE74MJDa5Ft/Ws8yhKv0iAPoD
 LfCONj2DqBObqz6QIYSGeBKQUWly1HaVlFiyFhKAqepr6SeTqiarTR0+QEHbHMAWKWK5K81zBMu
 XCTkIh/cDnxLR4uu8nK88sS9Nbcto0f3PwR4KA8eCkYo/xBYmoRxmfrbEJN1//5QoG6kQ0fGZ8T
 tbvFL/6KW1bm8AC3saiuB61ZqrFot0L4KYROKbEQ=
X-Google-Smtp-Source: AGHT+IFgt7aZDHGjiKQDQO1pSNy326DvR33iyVj7kf8kRYd06fhb2TFbEm0B9AIQoF6bRuk1daRsSA==
X-Received: by 2002:a05:6000:230b:b0:3b6:333:256f with SMTP id
 ffacd0b85a97d-3b613eb49f0mr6272738f8f.58.1752859844744; 
 Fri, 18 Jul 2025 10:30:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25443sm2454655f8f.9.2025.07.18.10.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:30:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 08/10] target/arm: Don't nest H() macro calls in SVE
 DO_REDUCE
Date: Fri, 18 Jul 2025 18:30:30 +0100
Message-ID: <20250718173032.2498900-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718173032.2498900-1-peter.maydell@linaro.org>
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In the part of the SVE DO_REDUCE macro used by the SVE2p1 FMAXQV,
FMINQV, etc insns, we incorrectly applied the H() macro twice when
calculating an offset to add to the vn pointer.  This has no effect
on little-endian hosts but on big-endian hosts the two invocations
will cancel each other out and we will access the wrong part of the
array.

The "s * 16" part of the expression is already aligned, so we only
need to use the H macro on the "e". Correct the macro usage.

Fixes: 1de7ecfc12d05 ("target/arm: Implement FADDQV, F{MIN, MAX}{NM}QV for SVE2p1")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 105cc5dd122..bf894f0bf13 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4509,7 +4509,7 @@ void helper_sve2p1_##NAME##qv_##SUF(void *vd, void *vn, void *vg,     \
         TYPE data[ARM_MAX_VQ];                                        \
         for (unsigned s = 0; s < segments; s++) {                     \
             uint16_t pg = *(uint16_t *)(vg + H1_2(s * 2));            \
-            TYPE nn = *(TYPE *)(vn + H(s * 16 + H(e)));               \
+            TYPE nn = *(TYPE *)(vn + (s * 16 + H(e)));                \
             data[s] = (pg >> e) & 1 ? nn : IDENT;                     \
         }                                                             \
         *(TYPE *)(vd + H(e)) = FUNC##_reduce(data, status, segments); \
-- 
2.43.0


