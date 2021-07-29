Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5538263lfc;
        Thu, 29 Jul 2021 04:17:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/vcpNBUVOn90udeAxz8RgjEmbFu4xMkdS7f8ljDGpQG0A+Ji7QoKlzLcUb6VgrsxCcvtF
X-Received: by 2002:ab0:728a:: with SMTP id w10mr3733233uao.12.1627557437223;
        Thu, 29 Jul 2021 04:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557437; cv=none;
        d=google.com; s=arc-20160816;
        b=1GQwAyMEDkjE/P1srep8WrutZaQbCjCAZouQH0jNUc0oJyQDlK1Wc4DbHCFC7aQZ/3
         5nmev6qV4ejonnC02H0iCHIjwK9VhcjoALyMnD1WkiLp6qPZ5VHznYDlzvx9M10EsunM
         3RyGjAl0w8vzzOE72OY9TJL3EhBz4YkBfaBxLInLnqJHu/AQGJ/3Set4Xop1XbEsuzhx
         Eayn9QOsVFFgUbTeMN4tZQa2RIN2y1ABlk6ltp6PSzihX/b1t1iDhpProjwTEUk9Q+pH
         d2UQUfpk53zJMsRBm6if9eHDkTf6HRtC+JNzxPDyGi7kgoSPsIQa+OxJTnf+lsdO2zi5
         r8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GGF4FybEKy96gYcYMu+JcP8KcGdVIAGNRtBK4g3nQ2Y=;
        b=MrwwdUBBSLiY0+Vpx3+k54w/AbFdXRCVDj4TlMvetsBt1otJfGPQPnVA/xQ3xWBUDR
         DnX7ZhlMEDriXsGm3tJD33hjdQaqUjLz2SksFbhA0HxRAf+Pcbe83fcZAkOeCW9K04O3
         E1/lQBajI+wlRCjHeSCeAhRQbkrmwmtzg3tq40mj3e72YqHHG6GAi7/ol0moe1ohHBi4
         HgtZsR4HZRxM7cR4EdhPldcp+xNGO46at60H9pM+NNsigZuXVrz4v1Lil/PW2qOcfjsw
         eDzKf4W64Xqb7JSRF+0j7C5ULB3a5eYEE83QqMijPHcsHe4Wwu5g021tghFm19+p7OfU
         ihJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDDI2YZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si121775vsn.312.2021.07.29.04.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDDI2YZ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m942O-0002Jp-F5
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-0008SI-DA
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940U-0000vS-P6
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id k4so3468730wms.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GGF4FybEKy96gYcYMu+JcP8KcGdVIAGNRtBK4g3nQ2Y=;
 b=CDDI2YZ3ES72TH9b5xS0B5e8W9Cg1RLQ98gNketTfJN72pYLOY/giiTD+xjj2kQnG6
 d3r/u1uQJRmY0HbVH0iIGLTt2mfXsa1aIeUUSTQ2Ub17R2Cgr/i71CQYIRK5I0SK2kXN
 YMhzkUujolcy8/uaLcpl3YxA2vkghvHqX9JVfYXQ7MRp/Un5Rq0R6IuBR/V0Z8Yr5gpN
 mYGEZL7W7Er9zHDMjXpNMyf8ADZapEfiCpwuIrXTR5did2uP4s8pL2vhauU64OqHVgXS
 zZldVBvs0mOiRcAXzNhirIIWK+jh4QEa65jS49e3PUg/zNvGjJSKlhcvDucbSD6lXMIr
 q23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGF4FybEKy96gYcYMu+JcP8KcGdVIAGNRtBK4g3nQ2Y=;
 b=AXYCJ4H1t3b6yaYpRrIFg3X4oQUiiZYNF5N6OhoLlEoHTmwfhu5xREJmpkbCBVbtHj
 MeCRrn0TLkPUlFRs3rIT13sQ37+zhg1eBRAzIxuPgTyH90Nxi7mOaNRKTprG8df56vxF
 imDNyplwwPzmiBHB02K5e274ZmvBauLcAEUD40mSKwe8QR1++AvD9VawujBAZ4ni68qM
 v6qLwyzoB5dEkafmtPMGTvBJcXKhrHXUM7PJdWkc5sbg1Usu6qQm+du4j9mNVU84wAPp
 6XJRSfj2gJJYkt3YVWvojY2kacuzTdWRZl4+qFFpA3kG4diH8AatYtLE/vcyGd+E09Kp
 9SxA==
X-Gm-Message-State: AOAM531b6CFzeTBcwmtB6sMYqYfoxs1JibeQFq2KD0HQKUKewWpfBaR+
 /jdBKjnt9GWcMDgVVSzq06VT6qz7Og5/JQ==
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr13543761wmp.70.1627557317253; 
 Thu, 29 Jul 2021 04:15:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/53] target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
Date: Thu, 29 Jul 2021 12:14:22 +0100
Message-Id: <20210729111512.16541-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DftS+Iz5Ea7K

In the MVE shift-and-insert insns, we special case VSLI by 0
and VSRI by <dt>. VSRI by <dt> means "don't update the destination",
which is what we've implemented. However VSLI by 0 is "set
destination to the input", so we don't want to use the same
special-casing that we do for VSRI by <dt>.

Since the generic logic gives the right answer for a shift
by 0, just use that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index db5d6220854..f14fa914b68 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1279,11 +1279,12 @@ DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
         uint16_t mask;                                                  \
         uint64_t shiftmask;                                             \
         unsigned e;                                                     \
-        if (shift == 0 || shift == ESIZE * 8) {                         \
+        if (shift == ESIZE * 8) {                                       \
             /*                                                          \
-             * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
-             * The generic logic would give the right answer for 0 but  \
-             * fails for <dt>.                                          \
+             * Only VSRI can shift by <dt>; it should mean "don't       \
+             * update the destination". The generic logic can't handle  \
+             * this because it would try to shift by an out-of-range    \
+             * amount, so special case it here.                         \
              */                                                         \
             goto done;                                                  \
         }                                                               \
-- 
2.20.1

