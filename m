Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5542770lfc;
        Thu, 29 Jul 2021 04:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5WQ2aFqzSxw33Kaluc6Ba/5gpdwenMOQdRbq8D3VOmdHWsyA/Ug/+jAzPy0KwUORzJ+WD
X-Received: by 2002:ac8:74cd:: with SMTP id j13mr3817381qtr.382.1627557840218;
        Thu, 29 Jul 2021 04:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557840; cv=none;
        d=google.com; s=arc-20160816;
        b=xKs3FFMlnMGZGql9mqNF3SjyXBVk0rtFTcp/W9wJn9ZYbaGgkqB3fLYfyJNQzarSIl
         +mWO53TAvMIf7oF607Q+bL3fW/g+KksSkHfsWZSRl//kDxkT/ZH69dzVtGOdB9ZoVpqu
         vta5ddLwqFGrEG8LygyESWoUV/i7x3acfFwpW3K9TCn6ios91eFnVTAza8pZixkFokrb
         CVM+QJH3rqbv2h3EcmBDcjbxTL5HSNq/OFtqHvCNmc1YeS4B7HEyFHk3M9LbqkKf2ACr
         29gdx4TiNu2gVD2YMy+jmPtUzqgf8+V51zMQ29AeazTp4sfqpVoMvRFzoraiArbQ0rmG
         jv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AdQbpZh4Nsn4ZEWXMN8/5MXfv9l4tGOGQ949NSeXfXg=;
        b=o7Y5yGgXE2Uzw6RwZvfa0qU0CA4M+FcW3aOgeyAsY0d37TdTIK/npAUgaPjw6ABiHv
         jHZB1fft53rB6iOlSmGnQjqnul6uTRdfummj04ASVWt4jXnX8HIZZr2mFIF6vGjklAAN
         zuLEIodCSUSmgZCgz1B2G880xvth8BgzMJ6METKsDq8hBx/59rEyyz7J9AKqGAELUpsX
         MUnMOHkUlxawI11pwhOyxppYCZJCtQZiXtnbu9tFkhGTVKfHmRNu9/U6tHs7vLJHidsT
         vx3nT7z96DPgbbZMkv7vQjiWwHa5NoTNEnMLF6iAoMzg25NPQ0uycSnk70GLl7W8Wz0w
         lzpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="leis0gb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si1672116qte.78.2021.07.29.04.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="leis0gb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m948t-0001CU-E5
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940d-0000CD-C5
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940W-0000y2-7c
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id c16so6427448wrp.13
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AdQbpZh4Nsn4ZEWXMN8/5MXfv9l4tGOGQ949NSeXfXg=;
 b=leis0gb/ZagYqBhoF55uD2lsIcnPdessnkG1zNgwKzmkH+5NePet1CdV0o8JWIkN/+
 m2B7xWgpsjV2DurZkQCsNA7Bp0nqWhS4JS01xZXTqZChLxGA4xwGhijOD75x/fGigxkA
 yOqw8BmqA8hT/rotU7L2IBbtP4ognFNezVRT+UUOeW5Zpql2tuIiavjryyckkvCseSN2
 Xkv8l6yx1IyE+fNWN652Bdpf6dwpuJ8aAd1NT8hZWNS5JVvdkANZw0oWdUUD71yAHXg1
 hjtAtg4Uj3ivDoOrMcNabeI0XfLjZYlF2+Tnbx40yQs0ZE26xNIudcCFiTPN3DsmXayQ
 eQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdQbpZh4Nsn4ZEWXMN8/5MXfv9l4tGOGQ949NSeXfXg=;
 b=el4MR5SdH1yTuEBClUS8PxwqvzsimSXBoK9BV1L6az+w/z1PiF7lJeR21wHta1T0K7
 LAYyhiNIPHa/Kmy8TlxK6tTiRF8dBjpwaxmOiSBM4WB/gMqAvCTNfdg0bVgwYXPl+Xct
 tNnDISk1Y9KesV5CUxpLrxcb8B0gOECJCEjFb3gANUcSSxCT6ny02JlRcKzQCKjQ9Zu3
 sw+YWSSheUF/TK6igBuGsvcMrGFT5LRUMDVvtY/OoJIyeaxHrj8V+ymx/XnxRkP+CQSm
 RSFdz3OxlyiSdaQ+J8FxpkCmTDqKwAS5RhACHStc9ypZ2MNsEMz4fRMIQ9qcmAS8gbV5
 /LYw==
X-Gm-Message-State: AOAM531//2gmQPZ74wj3/lTnUMZLhN7X4AsGu0Yg10V+j3PQGxYds+4t
 foHP8Pbjw4TlYhN8Pqc3cPxGrG1naHAN1g==
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr4188401wrv.151.1627557318849; 
 Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/53] target/arm: Fix mask handling for MVE narrowing
 operations
Date: Thu, 29 Jul 2021 12:14:24 +0100
Message-Id: <20210729111512.16541-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ws4+r+AKdS4T

In the MVE helpers for the narrowing operations (DO_VSHRN and
DO_VSHRN_SAT) we were using the wrong bits of the predicate mask for
the 'top' versions of the insn.  This is because the loop works over
the double-sized input elements and shifts the predicate mask by that
many bits each time, but when we write out the half-sized output we
must look at the mask bits for whichever half of the element we are
writing to.

Correct this by shifting the whole mask right by ESIZE bits for the
'top' insns.  This allows us also to simplify the saturation bit
checking (where we had noticed that we needed to look at a different
mask bit for the 'top' insn.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 82151b06200..847ef5156ad 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1358,6 +1358,7 @@ DO_VSHLL_ALL(vshllt, true)
         TYPE *d = vd;                                           \
         uint16_t mask = mve_element_mask(env);                  \
         unsigned le;                                            \
+        mask >>= ESIZE * TOP;                                   \
         for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
             TYPE r = FN(m[H##LESIZE(le)], shift);               \
             mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
@@ -1419,11 +1420,12 @@ static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max,
         uint16_t mask = mve_element_mask(env);                  \
         bool qc = false;                                        \
         unsigned le;                                            \
+        mask >>= ESIZE * TOP;                                   \
         for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
             bool sat = false;                                   \
             TYPE r = FN(m[H##LESIZE(le)], shift, &sat);         \
             mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
-            qc |= sat && (mask & 1 << (TOP * ESIZE));           \
+            qc |= sat & mask & 1;                               \
         }                                                       \
         if (qc) {                                               \
             env->vfp.qc[0] = qc;                                \
-- 
2.20.1

