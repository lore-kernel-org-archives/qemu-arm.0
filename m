Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp599951lfc;
        Tue, 13 Jul 2021 06:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8lq3J6ezWfOseg2jE72nK1pTashMdwv2bjxGxF/L/OB2u7ONdr7qNbW3EbMtg0gR8ORYZ
X-Received: by 2002:a05:6102:32c5:: with SMTP id o5mr5971672vss.52.1626183876542;
        Tue, 13 Jul 2021 06:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183876; cv=none;
        d=google.com; s=arc-20160816;
        b=r++ZMSB+NEYhMre5M+LCGfAG9T61QbNC3uE2H905xMBW0KoLxcXOrrX38aLHZ5uqLf
         PAVIKcy24btVs+zcyrcbCbiMFu8usAhBvKvhCEcka7haF2m8GGXa0818L7BhDkIqnT0g
         87R//B8Of6Y1igwfLr04mBnE5V8oLYiTPVZFc2Ma+5LBKvBvdJ3MNGzWwQUA9Od8m/50
         Yz4T4wV136niSUAjQhX/T7EtqGez8HwIibaFdLxnHP77AqMh+GxPhmqdQnkweKVuCcET
         vwP2ZXCW+0s2dcHRw6ZEvU6n0kSlYMjkQAmKn8q1D9Ccu5lSmMCgynO/2eGR3Zhx+xjc
         WS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hzoBamT9L0is33IwFMKLrmnDteA/k33y/OWd2P4v5ng=;
        b=U43MZkJ3uErwAXPn22hxDWgbQtHPyq/xI40Vz1C8ZLMm+Gyr5WG/P41RRTJ3mw4Xc+
         bezd16X4SYWNSF8ZO2jVT6ORutiLUnZD2CHVTGYw3Sk6E/TLEkZa/qUrq74RY4AzbUTV
         3mIDmzgvGL+GSqCt1YMik3CG+WFioKiNCK4YIpVpNXtSUZLg/9ea659LP1ZtqlAuNpzY
         fcSb40FDq1kwr2V9qo/41mjn2cSNULJDO0MyJ4+fFhguxi6YpXBCIqYwKovsmRxKJFdY
         6lKu6MT+w3dkZtegiDy+g3H0GJmP81JoO9Wg9Dl+DKzFH2zmZ94PQMLqzgk94e1FM+Hh
         qCiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rR55kHlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g37si15336476uah.241.2021.07.13.06.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rR55kHlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IiB-0004Cd-FX
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbS-0008MR-Nu
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003dH-C4
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r11so25255697wro.9
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hzoBamT9L0is33IwFMKLrmnDteA/k33y/OWd2P4v5ng=;
 b=rR55kHlQIl1wQrwUm7Xj4eNLUchExUoJuFxbGK2hPb/tq6itxRee7QxMeQXHH18+m5
 dEuOfmI2C12ZOblK0FJgPYD37OBJ3lUMDj0A7dVJ5JcXxfSue26SQhPVQWKHMYmQU4Db
 irwul/UrxmiUeUo3SF0XtgJ1lHY3tCBTcjemaaydQ71Jtq6fNowUWZ35chPKdteooQ9n
 8cGS9lX575VTDi1wnwhl872p3bNlF7JIJhbGYS4HpG1dBHpnIwu1YYbvcdYkYMliBZS5
 40teNAimv/aDyVTaXQfw4E6Dv5CxhfBkUtwJ/bnPy+BPPPYexpZhmaX5PPckBBrGKIvx
 mSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzoBamT9L0is33IwFMKLrmnDteA/k33y/OWd2P4v5ng=;
 b=Dz5A5pNgTZ8N80Q3QJraC93bYNZeFHzeu5Yk016QMiJPCvHZUyyDFtuElgW6U418YU
 4PzfuiANFP//UlLtVvh+QNph31SrWDzI7olIjssf0do82PmclLDkP/QkAq4JgPQScANY
 Hv0wPpwVSWIW5JI43/JeWV82oLtZ0INL3d6FaboNls7NuyBtQiaz4Uh6fasRPQeaffNK
 BNyfK2mGtQKALzI7UcsJiQK5RXe2/E7kMXy0QmDojIok4st31zjiITsOShSzkBSn58Hw
 PZkwbjLRuuvQlDvdBYpqHy+W9tMOpaSbMdXfmUZbCDM9UQIz+SkYmNlaEXMoptl/eGEB
 LXgQ==
X-Gm-Message-State: AOAM530vxRrJuCG8sEvPJfY4kfof+TdZIDuwNKKHRQnosjTJvBzSXgX2
 p29HFiWl58KuwaBEJzdL3+/bmXgKtIo+xr1P
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr5862352wrr.57.1626183453988; 
 Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/34] target/arm: Fix 48-bit saturating shifts
Date: Tue, 13 Jul 2021 14:36:58 +0100
Message-Id: <20210713133726.26842-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
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
X-TUID: D4iJCwH87r5o

In do_sqrshl48_d() and do_uqrshl48_d() we got some of the edge
cases wrong and failed to saturate correctly:

(1) In do_sqrshl48_d() we used the same code that do_shrshl_bhs()
does to obtain the saturated most-negative and most-positive 48-bit
signed values for the large-shift-left case.  This gives (1 << 47)
for saturate-to-most-negative, but we weren't sign-extending this
value to the 64-bit output as the pseudocode requires.

(2) For left shifts by less than 48, we copied the "8/16 bit" code
from do_sqrshl_bhs() and do_uqrshl_bhs().  This doesn't do the right
thing because it assumes the C type we're working with is at least
twice the number of bits we're saturating to (so that a shift left by
bits-1 can't shift anything off the top of the value).  This isn't
true for bits == 48, so we would incorrectly return 0 rather than the
most-positive value for situations like "shift (1 << 44) right by
20".  Instead check for saturation by doing the shift and signextend
and then testing whether shifting back left again gives the original
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8cbfd3a8c53..f17e5a413fd 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1579,9 +1579,8 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
         }
         return src >> -shift;
     } else if (shift < 48) {
-        int64_t val = src << shift;
-        int64_t extval = sextract64(val, 0, 48);
-        if (!sat || val == extval) {
+        int64_t extval = sextract64(src << shift, 0, 48);
+        if (!sat || src == (extval >> shift)) {
             return extval;
         }
     } else if (!sat || src == 0) {
@@ -1589,7 +1588,7 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
     }
 
     *sat = 1;
-    return (1ULL << 47) - (src >= 0);
+    return sextract64((1ULL << 47) - (src >= 0), 0, 48);
 }
 
 /* Operate on 64-bit values, but saturate at 48 bits */
@@ -1612,9 +1611,8 @@ static inline uint64_t do_uqrshl48_d(uint64_t src, int64_t shift,
             return extval;
         }
     } else if (shift < 48) {
-        uint64_t val = src << shift;
-        uint64_t extval = extract64(val, 0, 48);
-        if (!sat || val == extval) {
+        uint64_t extval = extract64(src << shift, 0, 48);
+        if (!sat || src == (extval >> shift)) {
             return extval;
         }
     } else if (!sat || src == 0) {
-- 
2.20.1

