Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5557930lfc;
        Thu, 29 Jul 2021 04:46:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlkGbfbIRs1KKWZDYmDV3LseeRx0eGQ+vgp/T08Vqb4TNyoAR2Sysv1HJWAKg8bhGW19M/
X-Received: by 2002:a25:dad7:: with SMTP id n206mr6187163ybf.119.1627559184020;
        Thu, 29 Jul 2021 04:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627559184; cv=none;
        d=google.com; s=arc-20160816;
        b=Gt11Iysf7gfhQ5UoTUHafGzWqOQ9KTPaI+aGoGpWA5fZFfE5XrK+Mo3xQx5TsoKnCM
         FK50lsofqpCP+qW53IAdPkkHpwTB2icmsLSDl9m0IjrkypG3ZNs75At7DvoQ/sKzSKDb
         O53QrdvaRH/m1IwcGdVTRZJCBm4fYiySw5T7uagcVv6qT358d/E3ai5V1gEcNODe/e5q
         CFQe3BFcnA96JZAUKS3RTTQYIBSk0B6hAC47F1tMEE9araXO4UO92qpXpivubUWd4DGi
         IqubRFVnQBlXoNckhlgV5AQQrnJEUgF4BqVvykiC+SUtoevBMl8tjynxTjZrnWY2npo3
         lAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hZoXvoCnZRqFIIUh7VxjDF986CnTtjaaiZusPA7tfs8=;
        b=RqQFa03ZNVxBRQcyeRc5Aj742DzBeKKfV5zLfJ+CdlXCHm1S959Hj8MRjvsahQON13
         AYmDSTdjhYkSjoO/c3Ims2yl4wjyzREVns6y1iX4+n8xZjNpJ66KwRV+yB7UZHpIJt+G
         CHQ/pGiRRmlrydoREPlnXcDHyPFLsMR0Xn05PTVUwjDEdqgyIimvxUR7F2TIGOixTrwX
         9iJNRLqCgLZRFIIAM3sZ6B0W/KkOIx8XJND+WsYEkCFOnHPQsYFReu/q7vKWswi85MjH
         ne5VpEESbcvo2W8P1RL8IdzzzGfnNgUYCInm1tMaP0h4YZ64IiVjUa9dUtMSw+JK9+aX
         E9eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhY4KIem;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x79si2385807ybg.479.2021.07.29.04.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhY4KIem;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94UZ-0002LG-B5
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941X-0001LQ-UY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9415-0001Q8-P5
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id n21so3461557wmq.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hZoXvoCnZRqFIIUh7VxjDF986CnTtjaaiZusPA7tfs8=;
 b=nhY4KIem0tqLbQDewOxpT0Dfez4pSsZezW2AiLxC+Vq3qioL6SFWbatt0U7Fm7NWsM
 IfuuA9km/36oEnWte8nsvQBN4Lrb3ZRS0fs2iLlGCtwCboYpmNGEAdyR73OEIyKPE6ex
 rPj2grxFJ4vx+S/HHAE5fWXrFVub49ObQBXY3rj7PW+BnJwbheNm6V7mA1PY//wxhs2l
 XVQ/yZiBDLcYw41upOzomBePpHu19789b9en6i8+Uc3r7iSlgGGRG89kAarSsiY8Rgnq
 3NRX1o/NDh3PlEtFGvERQjPgkR2rvucI7ri3cfiyHaKO6vX9KESp1SiZnTm3KzwXHOZC
 LTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZoXvoCnZRqFIIUh7VxjDF986CnTtjaaiZusPA7tfs8=;
 b=leKBdVpeg4QEk/PjHHOY/ho7Cd5kVcDWFuWf7UJDjT4mbgzA3MwrpkuL0eQegHPDWo
 /2rt0ULGwWow60Ix2Hgp8DlZSIXY4YB3Hd8MHxd8Migry45ocEBsdL6HF1olrMX7gmJK
 N1PCA+1vHQpgvuvei0uQTE6NmGFMFOYalDPlCGrK/znAJFZXvGpOYO49RPY2gMw/khJI
 uDbnKyqfGs5S+KtrQHeJQH8wZBCxcOXx2p0VA2Z4pGsnwEDp9Hop/aUKU8g3C+Mclv1H
 OApNrznxkmFDDvCOAP4u/hs3ZQWhZcYEdlYCHrRGGK88W5Eoe5v7fkQSWM3egHZLtX0v
 LQiA==
X-Gm-Message-State: AOAM530Bq1HlIUsIeGmUI2G+yWFBUSSBT3BkOVrFCbzIA8Re6AcbYyoL
 kD1zxrQGBRPmi2mEaRsb8dYK2MGc1eDbcQ==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr4296737wmj.100.1627557351563; 
 Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 44/53] softfloat: Remove assertion preventing
 silencing of NaN in default-NaN mode
Date: Thu, 29 Jul 2021 12:15:03 +0100
Message-Id: <20210729111512.16541-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SBaEjJQZo8zW

In commit a777d6033447a we added an assertion to parts_silence_nan() that
prohibits calling float*_silence_nan() when in default-NaN mode.
This ties together a property of the output ("do we generate a default
NaN when the result is a NaN?") with an operation on an input ("silence
this input NaN").

It's true that most of the time when in default-NaN mode you won't
need to silence an input NaN, because you can just produce the
default NaN as the result instead.  But some functions like
float*_maxnum() are defined to be able to work with quiet NaNs, so
silencing an input SNaN is still reasonable.  In particular, the
upcoming implementation of MVE VMAXNMV would fall over this assertion
if we didn't delete it.

Delete the assertion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 12467bb9bba..f2ad0f335e6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -198,7 +198,6 @@ static void parts128_default_nan(FloatParts128 *p, float_status *status)
 static uint64_t parts_silence_nan_frac(uint64_t frac, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
-    g_assert(!status->default_nan_mode);
 
     /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-- 
2.20.1

