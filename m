Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2711281lfg;
        Mon, 2 Mar 2020 09:58:46 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsskWIoRjyc1Vj5O29H6leY2lGep3UbA14lDBANdi0aGYxf39HnWmQ9ClZiYlpzevi+WGDl
X-Received: by 2002:a37:ad18:: with SMTP id f24mr430947qkm.41.1583171926756;
        Mon, 02 Mar 2020 09:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583171926; cv=none;
        d=google.com; s=arc-20160816;
        b=AUbOEjaW+AsQX78/3Y/JCx8ETZCfiC3XA+9wm94tdRkKvQyhT9dnFUGgkMBANpOw33
         eitpk8ebFBCm2KeRMTbJ5a/9pvtWfaCsqUU0Ba21yU4kIQffOdskNBM71s5Guz0haRRD
         t7aUSf+lUvxjA6ITMdtdS1zLXn57HwcpHvniiisvvz+s3FLUdUIaksCbcNLf2uONfK+k
         I8nRqXmru9WWiMZHzFmrOx35lnNzahjmapSdGPA8FStvTIZ8wvJTVEUaO3xguQz5fHtt
         N2ZsKluhWIuP12hCmypOJm1+w5uy7EdtHvMT+hb6jv/l2v51UwowdGDn59nUZXgxp9U4
         DrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SmyuQTNOfGklwQG6G7fcasvxH7i/TWvMZQATgc7JYwI=;
        b=T5IqOdET+Fj74H8+bxWkYRtpHQWhqByMNxUODOhIYc44t4KS1xALzI+rjv6HUIMZB0
         O9nqODotr76STD731Zz6gLqSeuj7pP2Fvl+1GkWayEt365+s0Lh50CY91QlL24fxUXUv
         bD5TG/vujjpiIyZeqOwoc+eyrwmEXv0NAyvjN1w8WRwuvSZr5LMDPCvhAKi5xIUXoq3a
         242Lw5WzQXQNW+Qgk3rteLNcbk4KVQ8L+kvfBKtBpFoM9LmwSruDwkj1GNVQM0k8CYzQ
         cb7fgiBbZOrKu6AvFVclNeDtDhykcM1mSS52Y5Q8SEOALIXzlTYVcuYYiQ5kOsLdVSMb
         VrWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E5zlf7qR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si3546096qve.60.2020.03.02.09.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E5zlf7qR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pL4-0006dT-5A
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKt-0006ad-3I
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKs-0007XK-2K
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:35 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:33287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pKr-0007XA-T1
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:34 -0500
Received: by mail-pj1-x1043.google.com with SMTP id m7so166741pjs.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmyuQTNOfGklwQG6G7fcasvxH7i/TWvMZQATgc7JYwI=;
 b=E5zlf7qRFUNGm3M6JUSO6MuqSa1+o82//RPtACzUuRGMfuZRUdAgDjWO6A7Yj/M5Fy
 aDA7br2lBM9O2I5cOS8eK93fwtjc7WAaSMIzhMqsjXo3rTcWRpC7EMpx9hGXR6jIcJV6
 H0FSDPHAJKVhYMb2djE9OrxuEVWiOPrxCELpxJSW+JV95dRPE4T2TfZNvzEoPUB/eCOB
 4RzwzreuFzaoraSP+7NLi4eSFrZEhX1/0EfKX61v5mKLg4qw6xkeXigX8NRq3V0kKGTN
 mV6D76TKRPxShHToU9d5rjyi8mEwwyFImSfVvAnzBZJv39HPtKRUnwleNzWZYJB6iFvN
 AUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmyuQTNOfGklwQG6G7fcasvxH7i/TWvMZQATgc7JYwI=;
 b=O2F60LN55Le3dZy7ISBOkhOso1xAgQSNC9fMt/gVRiukpK5Ur66uhLZvEdeWE2DFDj
 U2P8iobLUSKPB58NOF+HQVz45HSqueO66xErK2ivLcW0Pq+llzCMNpo3hY/onhp0Mnkb
 Sb72YBtH5O1UDAhpvo5o0VrxPyWswU1p4nBWtlSWKTPB9gXIbr5uES0RTFfECGOwujJG
 w3A//4KOKP3ScyRtz+4bb5HkbWE+rcVzm/f9cHulbsn+50egFtsvQDeLvQda/hvfT+9w
 emgR424rw1Vte2beoQ3LHb2q7gT80QybeQVQo6M9ZNLvfxLKdP+PUlBRzFTJJuSHEf6m
 +f4A==
X-Gm-Message-State: ANhLgQ2rUiNKMXv4ighqOkwPWnZ5Dav97CYo2tcygIBYeUmHVMPNMSBg
 lCe641CB012qfDhdySDI4uLbYA==
X-Received: by 2002:a17:90a:6545:: with SMTP id f5mr130697pjs.42.1583171912913; 
 Mon, 02 Mar 2020 09:58:32 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] target/arm: Replicate TBI/TBID bits for single range
 regimes
Date: Mon,  2 Mar 2020 09:58:21 -0800
Message-Id: <20200302175829.2183-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIUu9w1NwIuj

Replicate the single TBI bit from TCR_EL2 and TCR_EL3 so that
we can unconditionally use pointer bit 55 to index into our
composite TBI1:TBI0 field.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6be9ffa09e..37ffe06c05 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10316,7 +10316,8 @@ static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
     } else if (mmu_idx == ARMMMUIdx_Stage2) {
         return 0; /* VTCR_EL2 */
     } else {
-        return extract32(tcr, 20, 1);
+        /* Replicate the single TBI bit so we always have 2 bits.  */
+        return extract32(tcr, 20, 1) * 3;
     }
 }
 
@@ -10327,7 +10328,8 @@ static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
     } else if (mmu_idx == ARMMMUIdx_Stage2) {
         return 0; /* VTCR_EL2 */
     } else {
-        return extract32(tcr, 29, 1);
+        /* Replicate the single TBID bit so we always have 2 bits.  */
+        return extract32(tcr, 29, 1) * 3;
     }
 }
 
-- 
2.20.1

