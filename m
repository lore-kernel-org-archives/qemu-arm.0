Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287657lfk;
        Wed, 9 Feb 2022 20:04:36 -0800 (PST)
X-Received: by 2002:a17:90a:ea0f:: with SMTP id w15mr720741pjy.181.1644465876176;
        Wed, 09 Feb 2022 20:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465876; cv=none;
        d=google.com; s=arc-20160816;
        b=QzuJmaJLiBl8d2lXqLVNb9WZuLEJ2Zp2Bo39wfbyslMMV5jNRr2W1IGql3o+0BHwuZ
         PTCZ2F6fqeD6sQsgtk4hgLSALc3Oxf3SRVfuzAalEUZj2ZcNl/sUZ6oUlkGXohgENIK4
         W/CbuCtA8LlYGts3ZgpRwsg96cdLyf8klXZfiJ0F7HNRMFR+ZCTI8Z2lEHeZAEWtmBO4
         Su0AuvUBvL+rrPgPCfeFfATm+K+3XOV/CD/YCMrVF3zUEx8GOdudz6GgdjIagOWJfN+u
         Q1C12qhuv4syyBiQiNhsQK/jkES9r85WHYmHF61ci9V2IkNLfAor/5D7nLk4D3hULsim
         HVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AwzX6nehTYEJJpMljDUaZpO2r34jA4Ju646jiPXQlwk=;
        b=x6Vcf1EXtiIKxoDnDzzAr86A03g/OK+Eejl1MiCPTd3miHVtQcIE94zYpq42ZICJv5
         K6qpR1bjHeylSObQY2x/MiX/Jdsd0QRbsd1LdWa5xr3kj+WXx46vs685nL3LrfGsrZBM
         Bc4J+w8BniTEITAvMhb5gYN6ufTHSInnSS0dstXrg5n6uEbuZp6aSgHr6tSnnSBZGf7o
         qtLAzMk2u+j4XkfJazWZp2iF+gRNFLHY1Uas5ICA5viIn/+/rSm4MsSdVBxYg3trGkEN
         3cSRqIO6QY/WKvkjMzF+AdohXVNoqTI4nuVA47lT3nYZYlrQEl7Ipp9QVQhgA8yPjTcZ
         NScA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fxoubPLN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pg14sor82355pjb.25.2022.02.09.20.04.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fxoubPLN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AwzX6nehTYEJJpMljDUaZpO2r34jA4Ju646jiPXQlwk=;
        b=fxoubPLNEogn+zHRnWFJWC+02DY723o0fq2mD8X6E2s1xgD8o6Q8a3eI/T8JVd8rtq
         9ZT1LBBeJTKrH1XeHWmzn1q/QJX9IjQMkZlmav6rW0XnrofDTCUk/+Ck5IJm94cA6Gsg
         SDBBWqh9qQ9RgT+ewtFxdOk4c1Grp9f4tLZH9kDGC4660fg89EMBZNgkruKqmyL8rTIe
         Z1RkqS2X/006oeS+5XAXAivHdihTmQYjNZpGtW9FdDsJjUJDasBgtgXhzbNUUW8L0wxY
         lo4wUWS2/Pa6s2PHUsTMGCJIDeoQLm/Am+lDVd2VJY6vQs7Vi2VAIe0cMqOQO+yIEPkq
         uL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AwzX6nehTYEJJpMljDUaZpO2r34jA4Ju646jiPXQlwk=;
        b=vSCCIIYUxauANNb+sRAEhNCAlUbq2EjB8KG8zEV0CsodAqiuTq4iN5avZF/pGHuSFu
         XAgiMGkTbhkH0xSlFOh639Tqtdbn6ZADbyGkTUidIxqJTusRB+o04m+UGMhCKYWzBjQ/
         VDIJBoy7kQ0xii5nU4xgNQvkSXDr8JqSp/Xio1y3QLlTJ3+XIYdDq5f7pBAF6Az9Ufr5
         ZzRW5hJJfuQ5Dy3OZlpo0J62Yp17pp4KvWa5jtVPEou49MnjN1FAJYw9V5TY1sT+JlLT
         vsrhaflu29THQdJAXzptYRC5GIuvsp6mIGZn7JuhZvF58hYaD9R8TKkOwowNJExbPFot
         phBg==
X-Gm-Message-State: AOAM532XZA9WURIlOkmr0reU8bbehfVUTk8ShSKRvUB/FGdt6U0CoKoR
	XCTLoIJAaRf3cof84NhaglClup0p
X-Google-Smtp-Source: ABdhPJz0KVvI1mTb0oODJrEK+YKDaIymbE6d50ZoWXQ2NLmSdivXc3vxFLGoaYYn2FgKTCdxQElB7Q==
X-Received: by 2002:a17:90b:2243:: with SMTP id hk3mr750212pjb.244.1644465875665;
        Wed, 09 Feb 2022 20:04:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 01/15] hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
Date: Thu, 10 Feb 2022 15:04:09 +1100
Message-Id: <20220210040423.95120-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qmsU1a0ZfRnu

Add new macros to manipulate signed fields within the register.

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
