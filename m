Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956252lfg;
        Tue, 9 Mar 2021 08:22:26 -0800 (PST)
X-Received: by 2002:a05:6808:656:: with SMTP id z22mr3348857oih.163.1615306946837;
        Tue, 09 Mar 2021 08:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306946; cv=none;
        d=google.com; s=arc-20160816;
        b=uidTGGLRjuzchKQk85vSqxKXMUg5B8o3xyFbrRzIRC6BINjWjzV1UdrG/mrnqiD51F
         Zr0RyYxmECeriIPgKGuVWm2bjSY8ZSRWnxztVbghwIzQHqbFB25fE/MX85YyVbDQxGkE
         sPZra5NHGkoMeA8no+alDX6KQGtH8wibBZwY0yhopJzih2pvXQVcACBVU9BwHWzfbzee
         G2pUkngRFx2Zy6H7uRjlRlyxYA0y0cXNNggS7XfJI57fLnX+jXras0EobyrocSVu/Wtk
         bgcTOo8g0hUCl8egwReP1pPl1YkOvd4pfZsjx/Ce5pO84J/jsxfw4+WPmDCaLcx7hGm1
         B7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ebb1J4U0PlPdNLq+xM9aspyyU60NgXV87zexXZC7NNM=;
        b=k/3Gq1LYJbLiTCAFAH8QK75f0uH2RotnRpvb6Dn9M8STTkUDMAPMDz4DCXuqeXSgTI
         OeJELwJL+5xLRoLvvjD4cdzN1ERj19NWJUcsrbNo1nnsBeEYPnyMykQ8b/DgqnOcraUP
         z65rilg43mm1372k6zKU9xGD4/sNn+7taBCkTaPsTETByRIftfb+pos+82W0BMOSuTWZ
         /8b/K+7QZhvpLoqHURH8oZpEbbwLMwYvE74JkjEJWozXAAGErWDeCfdwIBlJrn99A7Ln
         OBpwNJl93iHcSEZUBTh8yJmaKH8UaBWcNuWkfQeHELi+vpC9Vj/z9BNkYvnUmcWh1Dx6
         Prag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQBvFspD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l28sor6923479ooa.14.2021.03.09.08.22.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQBvFspD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebb1J4U0PlPdNLq+xM9aspyyU60NgXV87zexXZC7NNM=;
        b=RQBvFspD+gvwA1XfZNvOAMkIjd3qJEb0rUBQkZ8Fx8mnSkTFHgnz7wEHSruq1VHoC8
         +0kVGGf5sVhB0iwNqUI7M2gNv1hee8JhPTUVUnOWj8RQbx/Jg25X4vMDAEL1J5TP6v2R
         93hiROeVudEj7IEF/hcYR53KPwYQeZlmnu7kIb/sOzdL9J/8u6+FdpWmGhHkqbTKjN65
         48MYQzQ0i3OMAeUrrHC8py6Iv0rvvHaPV3RxcItqB/ks4MxWWTe+k///bVeJV7VBVTUQ
         iHOpvxE/NDYgyEW7X+U3tRUn/ZLSqv+5QLzJRdmD69t8WdjeAihw/Cyu+Bu4krQ3ZTHF
         hGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebb1J4U0PlPdNLq+xM9aspyyU60NgXV87zexXZC7NNM=;
        b=fR8CuOD8Xzuloy+mCZDTnNnpwS4Z02/SMLS66yjMCAscCf5MfOjM9s8lYZzhBKbQ/7
         0qKU35z6vM94CdKOLjjHVXGhRJNtxlvRRGw6sV3vQCvX7RGXaD+SN5/txl33MjBEzXt0
         4InAvAaYhGjrR5Q240FuGgqYv4OgFCU0MSDXGA/rBey4R14R9vjvS1We1RWt/yzCLmch
         gEmWlF1kAiMUN7GrVffwLhOwtzJhvLsTBdbp5O33engVktUwpIC/PpHB4FyNKNXB+bE0
         4PrgWsspQhxzGatxUeHb0Jt+GFU7Q/cwefqTq9enblXjpnQlLFQdgzoM0x3bYFUVmTAH
         5KPg==
X-Gm-Message-State: AOAM532RNrc1vHVhTJIE1ODzxpGkHZNTlQPLBUR4H8nZQlMHI79qo2FQ
	oKowZlRp4iqOY9AwZAZHNUzFmgxctj3nnS5mAwM=
X-Google-Smtp-Source: ABdhPJxoMK0Oe8jbCN2VxLOLjxzKqOtuazWrWx9hoIheY3+usv34B4qli5fXLWR9AAGMJb8BE0MwMA==
X-Received: by 2002:a05:6820:3c8:: with SMTP id s8mr22820856ooj.49.1615306946483;
        Tue, 09 Mar 2021 08:22:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 64/78] target/arm: Implement SVE2 crypto unary operations
Date: Tue,  9 Mar 2021 08:20:27 -0800
Message-Id: <20210309162041.23124-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: o7MPwgZsvnha

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6c4002de60..b161334e93 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1551,3 +1551,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 23ffad33b0..f61e6ff6ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8123,3 +8123,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1
