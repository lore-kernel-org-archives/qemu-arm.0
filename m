Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp84197wrg;
        Thu, 13 Jun 2019 11:53:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDHOYgYD6TfjLxVZZyEA/6q7Tl62LtF083QWa1Tl9dBwu0zRJ+q8vghBU9doDm77WYvvyn
X-Received: by 2002:ac8:1a3c:: with SMTP id v57mr76278889qtj.339.1560451982061;
        Thu, 13 Jun 2019 11:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560451982; cv=none;
        d=google.com; s=arc-20160816;
        b=qOMgpbKalMOBc3phG6TJyHbWjHGTKpSr/52Q1DluUp27OCKbYx2s2+zuQffaYcH/yg
         9B0oNaiv4qaDz34EkFFpjfxNZZDDVgSKQtvB8eXl5H3F1NAq1n+sJx2GHyWbAr+W+4Bz
         3icW7fDKLbyunkw1EzRlKiWVPjzuzsbK0AnZjcqI8UHzcBfwPw0CaCTPfWeTkYgBmIE9
         893w4Ouy2he04P9WMxfI89BQfGtOgcOUQ5eRuKlMtyArToQyU180HjDE/oHebiaJT+f4
         jIEhzJpLnbzGn/GRZNQXZYKqKtBeNp34+06fV5k4SXl5lzNNJaESpCT6a5RmxBw2Ur87
         yamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=aWvmCLU0tYg1jkOyEItQlK/WmLZzoOV611s9Hk2h2Ds=;
        b=e8jvTMtvnXn/dmUQjZixgyXtvcsAQlSZ9MGwOMJ9j/fsnVWnf7KHx5QZcSh1QCM01u
         tz5e/Xz//QbxUkRBnxu3m0B8P3VsKD3631Y0dExfslwiqBVY+Me85bsGFtEf9q8dMN/6
         nuwmvHAdMah2SPktaupt+gANQpMzjFgQddXRvJUQ2j2SC/rfL21HFpMLrjH5HrH4sEw2
         GisvXU/fw5wvWeNWqbJL7e/UgKF72YoqVF9wXs/yC0iDrFO0J+krc1MKh12XvLFmmD1m
         trwWhtBijzFtRrBmF1JLbP6HPO2oF2TnhZqYquyS363ORkmtVHkfjhvzJQv1SUuvFC9L
         HQ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldLozEVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si309101qte.293.2019.06.13.11.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 11:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldLozEVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbUqL-0006Ah-Jn
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 14:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlK-00049W-E6
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlG-0003Mx-C4
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:42 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35444)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-00035L-QJ
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:38 -0400
Received: by mail-wr1-x441.google.com with SMTP id m3so2528081wrv.2
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWvmCLU0tYg1jkOyEItQlK/WmLZzoOV611s9Hk2h2Ds=;
 b=ldLozEVS5RPki2P5jzmSLxEoh2wYQ/TwkL2qq6FdwlzjiRBBxTRDfR9BnO8nTjD5PW
 S/5WaRq/Tf+wZfTgf5MWTqyI4Vx8pkXNZdibyZe2PRtXgYJSqp5+ZHilgC3x5RIk7I5d
 vVzTluaEqnNoS5b2d12rQF0627bcVCbpcBM6u9skzvOAjemRBpLnvyAO02zF7Rv9RsDw
 WWuD0tvLilz0KgRRN9/gswUaXGbFg96TzUzo9/NXU37WHVV8RDmcqVafOSdhr14SUTY+
 s4vF2Z08eG0SUmxb71/rc0JZXDtZeFUkr/PAqpKXfJQsMns/oqf44dvvZcFi1NTcyrtC
 yMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWvmCLU0tYg1jkOyEItQlK/WmLZzoOV611s9Hk2h2Ds=;
 b=o16CkUtJiboIoubiT8tB77Oe4KNusYni9WJEaJABGB3D46LHXtqcP3Pe6P6Jlwplt/
 L9b9HKHDoiMVqra5Mz7+fX5OlrYqrkWlbFOUofxWp+hI05SLDl+zB88hU+uPxWsAAXI7
 gIJWM8MgANaNqZedj8bVFppwhcErezv5IQNO0LmQkEr5EyDQhQim5d0u9pzsVGf3Mf5q
 pk9RSSDZLyHqmY/oIgQ2BrrHO0nEb/zFn2+esm4rN18TKKx2sulzr/dZ1V4aRNL9+FJ3
 heMRljbGE20CfFPTQj3R2f+LOu55Xrhlcv5ZoVN8RjjLJJDYEkN3XmpIxemx4NlwkLOf
 Z0ZQ==
X-Gm-Message-State: APjAAAXXZNkNSAGhtD/ZPAjMG0YZlJGOleHA3we5RdDR++6Qm/QpVVsf
 TmqhgFjNiRVfkVMTKoD0ALd+0ROnqjSMMQ==
X-Received: by 2002:a5d:63c9:: with SMTP id c9mr13593451wrw.81.1560443972149; 
 Thu, 13 Jun 2019 09:39:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:17 +0100
Message-Id: <20190613163917.28589-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 12/12] target/arm: Remove unused cpu_F0s, cpu_F0d,
 cpu_F1s, cpu_F1d
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gh/OLKDitvwz

Remove the now unused TCG globals cpu_F0s, cpu_F0d, cpu_F1s, cpu_F1d.

cpu_M0 is still used by the iwmmxt code, and cpu_V0 and
cpu_V1 are used by both iwmmxt and Neon.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8f124a953b6..4750b9fa1bb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -67,10 +67,6 @@ TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
 
-/* FIXME:  These should be removed.  */
-static TCGv_i32 cpu_F0s, cpu_F1s;
-static TCGv_i64 cpu_F0d, cpu_F1d;
-
 #include "exec/gen-icount.h"
 
 static const char * const regnames[] =
@@ -11911,12 +11907,8 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->base.max_insns = MIN(dc->base.max_insns, bound);
     }
 
-    cpu_F0s = tcg_temp_new_i32();
-    cpu_F1s = tcg_temp_new_i32();
-    cpu_F0d = tcg_temp_new_i64();
-    cpu_F1d = tcg_temp_new_i64();
-    cpu_V0 = cpu_F0d;
-    cpu_V1 = cpu_F1d;
+    cpu_V0 = tcg_temp_new_i64();
+    cpu_V1 = tcg_temp_new_i64();
     /* FIXME: cpu_M0 can probably be the same as cpu_V0.  */
     cpu_M0 = tcg_temp_new_i64();
 }
-- 
2.20.1

