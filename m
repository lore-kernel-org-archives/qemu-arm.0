X-Received: by 2002:a17:902:f70b:b0:14d:643d:9c99 with SMTP id h11-20020a170902f70b00b0014d643d9c99mr1941106plo.18.1645655502482;
        Wed, 23 Feb 2022 14:31:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655502; cv=none;
        d=google.com; s=arc-20160816;
        b=sCtVfqZUOVd4JwDtALzLjgXeWEWhg4sIVGZbNyd1tbfoVeXuQI8cVB5rw88GylRNr7
         9YC+djwx6+SQzDb7x5epm2BdK7zdoRDrULioTc6c+Gxzu6msQpri8wQCs54OZg6m/YhE
         fOUiBVpBJveD8pDIr2tDLSLYwFjkpqva/Iwt1fnn8nmC5eo6oTtJ5hkqeLMg+soXQj5H
         IxnqQzXYDAiDG5uXYrpPQwfBEmyVBMtcjScjqfnjtmhZqqU9ZHTZW2sVL3qm8I95QBAw
         LtSNqhYsHzvfuPes98k1Z7gYWDGs/iCCvqym5DkG89rjXW7IGC9H89v7Gwni89yjxJOo
         1EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zkNbMXCqLzhadKWhMyb5sf6Jtr4mvpt/QguB9jnfEUo=;
        b=IZgy0clq/SSMEkDmmn0rGTLaT5kku60smMTXvzSguseUL1uMbXJovCCvyThR6AT1iQ
         NV+kt2zW0sdwhRzxuK9cwcRxt0Xe8RPq8gTP2JHW7aF/2UjNtAAeWJMCxxIXWQ4bpzxk
         C4Jmiy6ftsVoFXUwNpvqazcRPo4/p7IKIRvRDJ+VvudbYfz9WWWK7TYLfIcENHBtY8lN
         o6BqALnx51MEpmdmn9qCTNDWbPLzhb20h/q9U13/VKFBPu91XR0xgs1sDiGlMrGxlAWi
         H5KrwBsEuLRdrCA4lcJJ0Vyc38pIpDWZ3o1w5T2xHBxEArwJK/XhcKY6T0eGaFShqnX8
         2cTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GS/BLDrj";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2sor610701pfj.18.2022.02.23.14.31.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GS/BLDrj";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkNbMXCqLzhadKWhMyb5sf6Jtr4mvpt/QguB9jnfEUo=;
        b=GS/BLDrj8tq/Y/FvD6oIutunQTHV7Aq4Yq5oZ8yBsyY8Ao3Fs0T1bNcdVSpuIFrmCd
         rildfh9CGSnMx7gJCN8Y0ieS6GI3OvwFDB7+dRkZQeWbHj8Ye5a+AfeV2eqXFRMT0tZS
         EDzYTc1oT+odORAUJQJKIN/tfGlTji5+FiFN6kV3+NIa7bAvM07m5Xt/6SpvyBj2AH2y
         nmBo7peAfdLqUkWekemf5rr0asnaoGIpzsTxWD3B7e68P/yEsq0QzYLSqZ1M3EtTNroA
         4oe8WR1TeARGvvy5buXDyKZJ9FaiiKzTA6V9WI74o6dcg3SgtTCc13UaFJBqC3/lNQmB
         ELiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkNbMXCqLzhadKWhMyb5sf6Jtr4mvpt/QguB9jnfEUo=;
        b=jHCuMU5fEYDQI9uD+NPZiyQC3zUY4WBLUuCb5Zq74sp2Omivz6sXPLUtKQ6kWcfBxq
         YF22sVdglyeHnqvnfZi01XT0SS7GtLrIUJgLzgsnNQTaJClFCf+LJBLfF3Wf2aZBIYn9
         WpIFp+q/1R2NV1eu/HBji2BasbJS5arQfMLrfzXKkpEHeP8a7OP0shNx/uetVeykFcv+
         8N/TyjrVbMLZjsHBiQaWa1xa4DE8q3foNUqJ5VKrne37EZZeZP4gSGeZcXvsCZTQssBB
         vqVCj+cAJUyNEMEC8qqKkdzT7+Ol66EeKkKuM6WSj+ehBzk5nsjmrW2bt4UBt8w4596x
         fMWg==
X-Gm-Message-State: AOAM531XM8naN6wOzjXhr0RovK2IIP/Ilv7jb/G31sOeSiRBoyH/4vGJ
	Y/dhDcZ4E+DmtvVOs335qsf/plIK
X-Google-Smtp-Source: ABdhPJyhdBZ2JUwklUGo4Rmwi8cTu0S+gCWIVK4fVMOcy1nIuCgEQu16rPdnUjkp1dAqOzsO2pU+YQ==
X-Received: by 2002:a65:57c9:0:b0:375:7489:1bac with SMTP id q9-20020a6557c9000000b0037574891bacmr1354243pgr.349.1645655502045;
        Wed, 23 Feb 2022 14:31:42 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 01/17] hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
Date: Wed, 23 Feb 2022 12:31:21 -1000
Message-Id: <20220223223137.114264-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yqIkeQNqvTNp

Add new macros to manipulate signed fields within the register.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/registerfields.h | 48 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index f2a3c9c41f..3a88e135d0 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -59,6 +59,19 @@
     extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
               R_ ## reg ## _ ## field ## _LENGTH)
 
+#define FIELD_SEX8(storage, reg, field)                                   \
+    sextract8((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
+              R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX16(storage, reg, field)                                  \
+    sextract16((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX32(storage, reg, field)                                  \
+    sextract32((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX64(storage, reg, field)                                  \
+    sextract64((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                                \
     FIELD_EX32((regs)[R_ ## reg], reg, field)
@@ -95,7 +108,40 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
-        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
+        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                    \
+    } _v = { .v = val };                                                  \
+    uint64_t _d;                                                          \
+    _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+
+#define FIELD_SDP8(storage, reg, field, val) ({                           \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint8_t _d;                                                           \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP16(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint16_t _d;                                                          \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP32(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint32_t _d;                                                          \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP64(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        int64_t v:R_ ## reg ## _ ## field ## _LENGTH;                     \
     } _v = { .v = val };                                                  \
     uint64_t _d;                                                          \
     _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
-- 
2.25.1
