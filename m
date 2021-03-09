Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930604lfg;
        Tue, 9 Mar 2021 07:53:11 -0800 (PST)
X-Received: by 2002:a05:6830:408a:: with SMTP id x10mr3487742ott.248.1615305191755;
        Tue, 09 Mar 2021 07:53:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305191; cv=none;
        d=google.com; s=arc-20160816;
        b=tLI/PdGxQjx5fIiVwYWGDDuembARQQclqP8Ehm9sV7N3UZipEYSz9KLWTEZ+7aoQpK
         pdfEWzBzmMXNjSxe5XlE+taJcAvsR+2PyUudByYNlutM3yyFwTv9WUlzId4BwLnqD3cr
         TqHrXag4Q3r65zKK738v86JuW+9BpK2hezMqAwrOa2mVPHNET4vApcKOsoddV4ttslwv
         fAsRR2TIy9YUuP7Joti98hX4To6TOs5/KDuztZmSCr+XsvlTi8XHmDtGFnntJ1D1WTJn
         NYhP7+vN1mfHEMyRF0I4giptCkSKmL1evI69UF6trhERfCeh8xT6/fyXe4hd/YE2AUkK
         OR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JqBHCmuWPtc8j+9KLqwTqisgKUnIBVTxV3C6VerPLaI=;
        b=pANLtKSqNsoBe0uQSxklvdr5NxQm0kNnZvAWNhephpbogUTVM8O8oVbOXjLt6QGNd+
         7TO5TxNvc+DuIrqbwp2SAovQk/3G1iDSw6qXdt+5mt2VcBRew6xH+XkkdDPU5ENONwNI
         vRc4/eJWrsUvKYL/EHU55ouEvc0ePoKs4A33Hti5SHv38iFHWTbgVY2bOPPc78VJgOK3
         9t9ChvT2rTkzKu0mldbcSP67XXbCVEjeIwHZc8RvSGA86jRJEnXL3E9sj78WhAh6MX25
         TnSpzXVhni7l36+dBo454mxh+vfU2i/L0i+SDkTHuHIq+fxPE+c+6heLw55BX8jidQ4G
         ItlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOofloXz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u19sor1844433oiv.103.2021.03.09.07.53.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOofloXz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JqBHCmuWPtc8j+9KLqwTqisgKUnIBVTxV3C6VerPLaI=;
        b=yOofloXz+lpOjmIomS/aMNxj/RYT7/R3cuyg9Rg9caoUaqo2rCaI0fSjoqkf3xAdTu
         wIUG92C24jdCTJB8WlgiwSaSTqJYFNGmoXvUVwQp+4d9GldrKbmNLheEurgGwF806xSQ
         wcuNxRYolka6+j4hsIeQChszknwZj4IoDT7x6r2ulOqVnmWgXaSsgoMteTuaFHja0NRH
         bRgYs9hHyddIIadjnwBbY8siYzpnkK/rdvRenOBWCbf06L9ZlhPgl6DQUh9cXXbWcfLc
         EcgJRfTngoyceoSLQyLiI1yYZIbM95ZsZ1ksCCqRLA/yZ0VIuNSlLBz6BH1WI/YbhbBQ
         DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JqBHCmuWPtc8j+9KLqwTqisgKUnIBVTxV3C6VerPLaI=;
        b=HAiTbleMeimRvzcjz/S/haYN9zMUUSxwW96EOHhBv3L0yuDDNPVZ2iBXORsScO4Rt2
         GG8XerutuKUNM8J2Ehl/levkMofiMCEjpAHnKy2bFCI/Ad+gsT8okTBXjA9plrroCc/1
         lausyaBohB3kso6otttsFBRm8UeguroZK2k+lFHT9qDwMC1E9XPnkiuauuBnHjNecUzX
         ILCwWtigQJKyQIXtMZ4VJ0/LZtbwXsdCQO13wWlJro6hrHYcJf9YEIkk8sCMC58x/Nh0
         xFHYfLiK4m3KIWuIc8rXALWRBkUYeOpAIiY1ZEQzzqFZNZyjLkNkrHOsTPdjhQN1HFNG
         7xRQ==
X-Gm-Message-State: AOAM533FDKS707d/nNldX938E0pRdk6Gn03u+yBvajeXVJ2LP0I2bSDL
	ib3JAvRTLuj5FUfLbrb7z1yPmPjd
X-Google-Smtp-Source: ABdhPJzNIaIDIlHoHxOaQRRJekM6GLSz/zXEUp5GEvqRyanArl6dwZWgiKWVMiRQsYmgf6CEm6LlEA==
X-Received: by 2002:a05:6808:128f:: with SMTP id a15mr3340981oiw.143.1615305191423;
        Tue, 09 Mar 2021 07:53:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Laurent Desnogues <laurent.desnogues@gmail.com>
Subject: [PATCH v4 3/8] target/arm: Fix sve_punpk_p vs odd vector lengths
Date: Tue,  9 Mar 2021 07:53:00 -0800
Message-Id: <20210309155305.11301-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /XRSsCKcwpNp

Wrote too much with punpk1 with vl % 512 != 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2fb4b2c1ea..981895a17c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2105,11 +2105,11 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 d[i] = expand_bits(nn, 0);
             }
-- 
2.25.1
