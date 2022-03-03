Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp646878lfo;
        Thu, 3 Mar 2022 03:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB11bONPf9MjHUY/mTV6eAW9GPnmD2MWd1126rkgExvbF9tlkcVZFsM5mwMtaz8oLuLBoa
X-Received: by 2002:a81:3dd2:0:b0:2db:5c5d:8145 with SMTP id k201-20020a813dd2000000b002db5c5d8145mr22987258ywa.279.1646307487324;
        Thu, 03 Mar 2022 03:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646307487; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3Nz7aIjDN5ca4FgnhQGiBGiiqEI7H9xi3t1Td1xskplPIMPz6mS6AQTZzfrgCTPQ3
         mtg+YUsa86dlbhk8z+HcgBzp9AtzIOFI2GmlVg9PeMIrIJwiPRoEktV38wOtBXk2swHM
         VZQT7xyZxRG/Wk7NcqOXxIv3dUEDn485s9dO1vx7beYC5l/tOGcE3P+X0Chouk3I2krn
         HzbjyivOVb4U5urU9A47OaRTnMJEmF5qOurUZqJjc4yTmNKfXg/tr0S4n0Fe6aO2B4up
         toHUwOfR4EA0mVgP3/mDznW0UnZtlWGr1xoIuSsEyeHW8S/gFhyqXJrx7FR2tqAXDa73
         XIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nsvhK/ifUeSvWeX1rdfKJDrF5hLi+OAvYK2zDd+7vVs=;
        b=uxPXC5AZd0QuFYpL+AA2Q8zgh7VFwZRpSdmz6lYPVRZmMYdNVoMH+RAn/2ZlMsJca8
         i7rlrg+K7XTCsjyaIOBP7grCZuQRuyIACBwKTHvIaBbuQWtqw9aW/44I7AqGkrRoO607
         n6qa6YXm3Serz8ZOpk8KhnDgGmh52xCNRYvpYGKxnKgmazt7NTK8q8aEqLVk2+5oiwwk
         CW+sJyb2DPAeVqdbL/xSumwcmkwTIWNu8+gBNr51WhnW9peUixui7cNxUz0RGrZY1box
         mY1Bc8C7JfXXfqNmZ2fzFgSrEvtAndo9JZOsbBCSyMxvqRLZn/Rr3Vg/jVacqGmymB60
         Zyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7lcVf0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a819e47000000b002dc1841c9basi1328550ywj.194.2022.03.03.03.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 03:38:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7lcVf0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPjmY-0002Pw-Ni
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 06:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmH-0002KY-Fk
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: from [2a00:1450:4864:20::42d] (port=35517
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmF-0006VM-9k
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b5so7389770wrr.2
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsvhK/ifUeSvWeX1rdfKJDrF5hLi+OAvYK2zDd+7vVs=;
 b=H7lcVf0FuhiLUwxNtWR1RDNJgta9PoZ3PPESl5zQ58stQXj/YtwEgScfD0I1AmbzQR
 oBT5b540dFeqbNii6iIq0GQe0bek44KK61RHD6P9UvaAvDgbJtXYEQ3jiAjVTUfz0QDr
 Yfa7pZnrbw1nk+T7ijqO4jLnp59GC34AXJJvRcxkCpYLtLzhLsi27AKW14pj3pTco+ci
 LpjriDhnRLy/Db8GoWeCghU4OWCdp0hTl8NbpfllMaKDy56iN+DI0zTgoUKT/ADFSud/
 NHCP430n26hm6f6NWL8H0V7m7BIQo4qenYF+nNq61Iol3v282fFxvOu1gKJUJpbCdQh6
 3NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsvhK/ifUeSvWeX1rdfKJDrF5hLi+OAvYK2zDd+7vVs=;
 b=nHlMMnw3/iXZPb8lv5t1o1iOmtYSp2i9EHnqBxwDMmFWHd50vd4PI4rmFpA44MDaLS
 P25ZZmH8AZ+dm723bPsmTe8osggOC6pJawhewqZA+J5Dm4IqnBPonfTwHfcGhgGpsqUW
 7DE+OxmX8mnuNfyK5fyerTIplx3EpNaLYkyJmeZHF5QOCUFSESkVr/cDUiaGDHehPKuO
 EIPo4jMr1OLsOHn8jh5ziFA1kxRuVnKAk2DJPSGGtRTMRYiUlZr+UgHAlVV/l4Hy+mNw
 2syFsdVknONBGpABXKZdWALVkeED38gTTdFayYsApwrStPuXJQztoQ2tqPwMwLJ2NArc
 Osxw==
X-Gm-Message-State: AOAM530Wt9z3IdWXyesOLHucpvQ5ASphB8eXYToskNAt/9LZsy5ED/RQ
 PKrgnz00Bsrj3saKAwqQeZDmPJVYMy0Y0Q==
X-Received: by 2002:adf:fa8c:0:b0:1f0:47ef:a04 with SMTP id
 h12-20020adffa8c000000b001f047ef0a04mr3764509wrr.398.1646307465738; 
 Thu, 03 Mar 2022 03:37:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm10240093wmb.48.2022.03.03.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:37:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm/translate-neon: Simplify align field check for
 VLD3
Date: Thu,  3 Mar 2022 11:37:41 +0000
Message-Id: <20220303113741.2156877-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303113741.2156877-1-peter.maydell@linaro.org>
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZuYAtOrLeYFD

For VLD3 (single 3-element structure to one lane), there is no
alignment specification and the alignment bits in the instruction
must be zero.  This is bit [4] for the size=0 and size=1 cases, and
bits [5:4] for the size=2 case.  We do this check correctly in
VLDST_single(), but we write it a bit oddly: in the 'case 3' code we
check for bit 0 of a->align (bit [4] of the insn), and then we fall
through to the 'case 2' code which checks bit 1 of a->align (bit [5]
of the insn) in the size 2 case.  Replace this with just checking "is
a->align non-zero" for VLD3, which lets us drop the fall-through and
put the cases in this switch in numerical order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 072fdc1e6ee..384604c0095 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -665,16 +665,16 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
             return false;
         }
         break;
-    case 3:
-        if ((a->align & 1) != 0) {
-            return false;
-        }
-        /* fall through */
     case 2:
         if (a->size == 2 && (a->align & 2) != 0) {
             return false;
         }
         break;
+    case 3:
+        if (a->align != 0) {
+            return false;
+        }
+        break;
     case 4:
         if (a->size == 2 && a->align == 3) {
             return false;
-- 
2.25.1

