Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp597872lfc;
        Tue, 13 Jul 2021 06:41:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4FpQUVwGe44G/6PLppi74+FEv5mRc/zmtjI65isxR/J+Jy6HIQvKXLh+cO4QF2xnYlZEx
X-Received: by 2002:a67:7d8b:: with SMTP id y133mr5923607vsc.60.1626183707362;
        Tue, 13 Jul 2021 06:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183707; cv=none;
        d=google.com; s=arc-20160816;
        b=UCfFqOzfqKVSbGpJIEnxJT2X3/t0sM1qBM7jf012VbAYGe+Nmf19sDhsXbzefsVPCD
         WcArafaFuxQ57AqYGzv8pqYzQpRt4xcW5WLSanZBLBtN3YghGDoM2SuGpk1FU/hwj5TV
         xBDAN+/DQOYoR8zjxE0D1lcKu/LZk3gGvec0gfPnpqEfEVr6CYiCBysUmIaHvyMDGWHI
         cKeJvRIIo24UlK6Itw7ZhE6+UXT2d8gETg6Raer5NldrecgNsoViHjl36oumb0uaCpLz
         LFceugJ27JbH2wytN+PRXpkqv5bDd3hFm4xSInZJLu5x/1a1vF0cvZfO1ZxZ41lzgTNN
         TuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l4h+O9UQxvrDocVeKKCEGu5i8zNpjbzWnTmmgtbEZ2s=;
        b=df8+LLnKZomf8+ySaCKZWx7nSzGMqKmPIqolINt3TGi5oGGaiVYxTpe4QNUrmFpQnn
         ZtM2dhiOFVKG59DL9EfNZq19NQYnieAbDpWBA0lPjhcw+qobc5IphU9M/pb8wGhcxnwN
         RDJe6hB04wYbt3olAmCqKaPJ+Fq++lj6zszwgkkgl+1wwy5Yrv5gEXNaaA8FDVlT7nRs
         tNHbNP/ncfdWKP/jYNFJXR1sRErQGFgZvlV0OERtgYVzTOkl6nd/WdQ7/kXJIutq4yt8
         gTQ6KrfJU/VOYwJplrkCpCjeMw5O0Ly0lR7nkRdew00RRWkFakym9XqMp/Vwf8viWy+x
         jAig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OaqEhGMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si15478549vsp.298.2021.07.13.06.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:41:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OaqEhGMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IfR-0007a0-7A
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbS-0008M7-JS
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003cI-CH
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m2so19482120wrq.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l4h+O9UQxvrDocVeKKCEGu5i8zNpjbzWnTmmgtbEZ2s=;
 b=OaqEhGMxaVz33bTdKgnek+RTDw5dZ+clhFCdU18BF4QC3taqqoLqIlR0/KybUvROX6
 9EVjY6/GgiKAP+hmL9VjJGu6Adxcic0R0zZrNJWD8kxH3hS5JkAMWYdZcAXkzYhFBbdO
 ChJK7xO21Bsx6XH6DK2TB4NRM4h2zrvJ4s6erbbC/newnPJYPNh9P4TK0E1uvS1O/bG6
 xY5DAejwTotZTyIrOtH6SYQtsIhToRTedJ+N+itcD3BBt1P/CstQvpy5ad8r6+Bhk2/Q
 DLb4ehh+zB7CJUY8hGXmedX3dfbSCG+huPdQH26P+r0xrKhkcy1BgTz7M4TIYGtgxspB
 l0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4h+O9UQxvrDocVeKKCEGu5i8zNpjbzWnTmmgtbEZ2s=;
 b=lcyKosyCAtBBgQdPPnxs5DTRYcqaeYkeSF6GMYI4TzAGMImxJ+y6WG4UowZH7gizig
 ZUbBrZAXBNgwkVdpx8nLJ9cPO6dWtBrUmVIVhtMXF+/9pYGHCn1E+hJDDF9cTCc/Wc21
 Kvtp3AVq6FrjaYp9oYyiKXdz7ZPrXDblYm2Zlin0DIMSTvx5/OKAIunHfg0Xf6UrRiH/
 l7zJZb3FtUYvm9CDqqMRzrgkMoUXHaSumoLO5rbImykvPfFUPo7kIAcaTO/xmm5mpiFr
 tBw3+N10CAZcCt0c7pz1K/uxJpUFqr3eDbkT050uDRRhJf3aNWppq6SDJglXpyYsRNg8
 zViQ==
X-Gm-Message-State: AOAM530eny7B+E8t0ibm2NHoFdsb9G+P+hWUU2Sxw62MRJvksA7rgcaw
 vgQvuKBLmyCMnR9m5cUGzNYiwZhhosY+weV9
X-Received: by 2002:a5d:5989:: with SMTP id n9mr5672702wri.8.1626183453289;
 Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/34] target/arm: Fix mask handling for MVE narrowing
 operations
Date: Tue, 13 Jul 2021 14:36:57 +0100
Message-Id: <20210713133726.26842-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OB7lLez7hIdv

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
---
 target/arm/mve_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 99b4801088f..8cbfd3a8c53 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1361,6 +1361,7 @@ DO_VSHLL_ALL(vshllt, true)
         TYPE *d = vd;                                           \
         uint16_t mask = mve_element_mask(env);                  \
         unsigned le;                                            \
+        mask >>= ESIZE * TOP;                                   \
         for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
             TYPE r = FN(m[H##LESIZE(le)], shift);               \
             mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
@@ -1422,11 +1423,12 @@ static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max,
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

