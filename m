Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp640591lfi;
        Tue, 3 Mar 2020 09:50:07 -0800 (PST)
X-Google-Smtp-Source: ADFU+vviWC4mPUBTGmFQL4suYzjq4g8pbslNoE6BLyB8euiznZQ4Dk9NDPigbegdLqC/N9cig2nC
X-Received: by 2002:ad4:5882:: with SMTP id dz2mr3580523qvb.132.1583257807206;
        Tue, 03 Mar 2020 09:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583257807; cv=none;
        d=google.com; s=arc-20160816;
        b=OofdypJR/rlzXXIm+tw96ti3S4rhqsiCA1lAVFBheVP6arr7/0em1urtciWI44P//X
         Xseo8Ig4WI/JVoRREwV885Udi880tCwfwN7tw5NYm7C+zVnI3DXvvHpYEDhyCVdfOCOa
         MTTTQITOkFZODKujFpZ9lT7cE+iMeNMEIk9SpHTcxMWOV8zJ2Yws+dE1+54oPpuD3eYC
         OBwW2wD33Aowm3M5VcpnEx+zNZelPSCR0XfSIruBQsP0J2RN0B5HS3sHvejxIgQ2/SP3
         iCTQGv1AakqjqWPUEnhtxNXCUAZgZRfuG0KN7fhPcetyzDOIg/1gRyzbjNoxwAbDl695
         P53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=++P9RdISn12IMj2NdnjcFp9KnKYuoL4/wTvl1xQS+Gw=;
        b=mT7un160XMuMuE0HQ9iZtxXZwMevCeKPxqL44ExeUdOng2hiXPTOqhNwlnGtFdWhOO
         Qhhfn7S9hH+yn2UURcsx4Dqi2VFG4V9VcLubbN3XKI2MsJcf8WkDei6/5vBsTB4RjBvH
         52jUnj04x/xYG+UuUH4dWkqbNcnI5BKRMUTr2zViO9lreo3LNHJnJQa5LTKLhyOTuSxY
         lTgbXJQjJKfB+CFwXjPXWW2xy5dIhiGhgr2PdoV+ETuiCZOUj/xcvPw1Xk70MFG8xVdg
         VuNBazMYzY4/u+LPaotAnWYCXs0GPkGNLkpnB9JE3saM4maGMQ3LQYyCon8IAGiOvsrl
         EGrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sb2HGiqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si8218844qka.225.2020.03.03.09.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 09:50:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sb2HGiqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9BgE-0007Za-KU
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 12:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg5-0007V8-84
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg4-0006KK-9Z
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:57 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:32961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9Bg4-0006Jl-46
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:56 -0500
Received: by mail-wm1-x343.google.com with SMTP id a25so2898111wmm.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++P9RdISn12IMj2NdnjcFp9KnKYuoL4/wTvl1xQS+Gw=;
 b=Sb2HGiqGWJw+URWcfjeZ6XvDQmnlaKryWB6to+KJ0e0QcFNJ4TTvM4chhG/5Sucqyc
 W++mC9X8HzAMXuEaR4w0jKzi+ikjhtXC5HxLJNJRQ+rF5+G5ML55fUE+LwNWQQhEIu93
 gPABx4jKnifMS6NKJcQJjO5r+6OZchswCGEwqnjvCBvSNuKch0D8GwmgkVd3aMlUq1XK
 E6tI7mPmHQBVx0TsQaopZXZWIemE7yJQtH+TzJe27PU8GBPN/LsodSrQKA3wxsReDPgT
 Pdg5H7vB8hY51Pty0IzssZS9xN5ePOy3MiZLoxaGiUgHZDe0ZmBBp86a3xW5uO2EWr73
 CRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=++P9RdISn12IMj2NdnjcFp9KnKYuoL4/wTvl1xQS+Gw=;
 b=BBsdsBtondXGDceZlYctywHdaEu3OkyKg2gwbC8bMXjULteUW2m56WrORKwoRbVYch
 80ksCpn7hpjzDxFQ01n+yH3or4T7AZabVS0SRLxtK9wQcAH8LZlTzwq8DNZU9b1OMNr4
 ILt6YCvMaWrmhy+pSF7zjgIVU56jUwjSVbVO3XHlLeo+XFOHNjVK/ZU4jMB37nN8lEf0
 WFwa0Om0bs2LMXxcNwcGPM37MwvFEZW68O0W2Z+GPdTUlVckmJLFP7eVpXlsfQYUSUZ/
 sMuN6C81wHRaifNyeG4UL93BqKx6FZspoCciOOrZtfv1xLFUlxTNBvAn6haF7rAKGpls
 TjxA==
X-Gm-Message-State: ANhLgQ2CHX1gs0JBiy8PXpv/e4aYaZDRBU23sLAFmdn9V/oUbWA1W4Yf
 +HqNH5KVm5Jb65mYLm1XPrarGpwWUk0OPA==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr5159852wmf.75.1583257794709; 
 Tue, 03 Mar 2020 09:49:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm4867576wmd.44.2020.03.03.09.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 09:49:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Update hflags in trans_CPS_v7m()
Date: Tue,  3 Mar 2020 17:49:48 +0000
Message-Id: <20200303174950.3298-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303174950.3298-1-peter.maydell@linaro.org>
References: <20200303174950.3298-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-TUID: BBcCrnLR7hEg

For M-profile CPUs, the FAULTMASK value affects the CPU's MMU index
(it changes the NegPri bit). We update the hflags after calls
to the v7m_msr helper in trans_MSR_v7m() but forgot to do so
in trans_CPS_v7m().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6259064ea7c..7f0154194cf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10590,7 +10590,7 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 
 static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
 {
-    TCGv_i32 tmp, addr;
+    TCGv_i32 tmp, addr, el;
 
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
@@ -10613,6 +10613,9 @@ static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
         gen_helper_v7m_msr(cpu_env, addr, tmp);
         tcg_temp_free_i32(addr);
     }
+    el = tcg_const_i32(s->current_el);
+    gen_helper_rebuild_hflags_m32(cpu_env, el);
+    tcg_temp_free_i32(el);
     tcg_temp_free_i32(tmp);
     gen_lookup_tb(s);
     return true;
-- 
2.20.1

