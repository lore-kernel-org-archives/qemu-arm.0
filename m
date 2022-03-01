Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209724lfo;
        Tue, 1 Mar 2022 14:00:07 -0800 (PST)
X-Received: by 2002:aa7:999a:0:b0:4cf:3290:ebb8 with SMTP id k26-20020aa7999a000000b004cf3290ebb8mr29897048pfh.19.1646172006909;
        Tue, 01 Mar 2022 14:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172006; cv=none;
        d=google.com; s=arc-20160816;
        b=fmHITN/ikFLIkjq6YEf0Kwf0+1xGaoz2sA57iXjnwLGdWX1f6x2FyntJ5blpZMRuUh
         gaRjPLwT9r1NztAE6JH1MF/Z6q7Zz0Il0uWXKhzs2/677WsEK1a8SibiqMjYALghFZ0Q
         OUR1qih2lAO/5NNVEOKhEd5uhYVhiDfLIlSiICs6vxEJEAI1CcpYt+46skp6USIlcm31
         FkVpcaeSQAgvVoUjq1z26fLfh4WvYD3DzIuQ2lprUTkMyMDGu8Kyig6Y2rDWURQQQ8OS
         GW0FuPqvo3CYe/kRXCINNtkhJYlj/RLGGbi45CQVEjgYxdpfy5qBh5d+gSZUKv4EnDBo
         GbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zkNbMXCqLzhadKWhMyb5sf6Jtr4mvpt/QguB9jnfEUo=;
        b=Oa0qC2n9fnC78gpyPEYbED3tjCE8TKAajP+m6YSublxQahQ8W8DZN/tc7XX0LB6H0q
         PkTsLMs8rvm+MkEb81SN3M18+cilqodr9TAFBnG26N7KQl58tN6u15RaS6F5j20T1mek
         YJbD6BJ94P7Ins/cfVgCf8svU/hPXR1McTgjBVffY5DyCIvzyqBV8nvYT1xFy7od1/dW
         XpgTA3JtVql993d3IoIREEM+Qm++7RMBqVURGpaJDSOhdHywaHOSaX2VU2uVFPfr4zPV
         m2T1WvFuFhJfZ1BZdrETEK2HN6URr3F69U+VRW52hzbNWv7NRNvYx9v7tqo6+snFzmiu
         UPCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EJ3kfT/3";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j11-20020a170902da8b00b0014fe9289a0csor7086603plx.188.2022.03.01.14.00.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EJ3kfT/3";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkNbMXCqLzhadKWhMyb5sf6Jtr4mvpt/QguB9jnfEUo=;
        b=EJ3kfT/32tEKtDZICqVQu68dz5nljHJIm3YDkO+5ks9AmTzxfmJReyqASVaKT+8Qpz
         nxwQXSOy7O9F7cfbFdQsp1wRKvu6tYO5oD1OZtsoQOE+oEPj7og8AgR8FNBS9ejJpSRY
         IWy2999/H3a/0lqvCGcv0cDJG5455rydiXFFMatmHva88ZGk04DoIr44ipfvWLlItTY/
         mF8zjRryf5kmC6tQWOJ5+zbqz1FUrbCkKoCecdJR4gRZi3LgmoTDtmSvwT4LC4xBbA2T
         NPZcMA/T0u5G3QLMeBukX63SBklCRvWxYGYfVgmYFlwX8aPIIXSn7mT/YPVH5fJlcWl3
         Dkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkNbMXCqLzhadKWhMyb5sf6Jtr4mvpt/QguB9jnfEUo=;
        b=cCovCcPGpVaBTjAshsEGIok+YRGFu5XJeZR5EF2XS1yTNEj5vd8fUjTraRT313A5Bc
         fz2JlG2f6JqyglavfUM14k2N+iFE+3bzrwQFcDakVxRYcqFAnoe16RayI3HyQVus8rox
         Kfuiw8nAPFNeKsJhiJAvNTRI8j6gBw8kqYhiOQ4uIJyndFTu77escxLlmI8x/cKBgFA1
         gMuYImxti8J0vgFK/Yj1nQnpRsTgqDKaFui2XwJhWWMYkW+7EUQNN9KoOvgURrr1/ur6
         lPpCSgI9jkYnrRQW/66VCjphLT4wUCfgCRYPvdAPzv81cfU+9mQrRc7OGFWuHeenYurW
         QdLw==
X-Gm-Message-State: AOAM5318yxFVTGAlhf9jJnOXjYLi/6tjvxpiExtbo/pbVPqmk5v4Gov0
	rJOOTeKxTtZpuhDIHjRayI/HNyiQ
X-Google-Smtp-Source: ABdhPJz2wKAGz/T57HGhB6mMVZ1gddczIcicqGCN085OKWyf/Pl47Sd1hAoIGeQTYe1zA1GeBPtZCg==
X-Received: by 2002:a17:902:9045:b0:14f:14e7:f3aa with SMTP id w5-20020a170902904500b0014f14e7f3aamr26471266plz.69.1646172004414;
        Tue, 01 Mar 2022 14:00:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 01/18] hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
Date: Tue,  1 Mar 2022 11:59:41 -1000
Message-Id: <20220301215958.157011-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UEG9KqRRK12G

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
