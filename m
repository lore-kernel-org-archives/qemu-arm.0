Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802523njk;
        Mon, 2 Dec 2024 05:14:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXS8Td5/+awa3wJiws2gGBaldMpTndgPn95IppLU15HzwoTLDatUbxqBTEzmnc8GK369m/vplecsgSNA==@linaro.org
X-Received: by 2002:a05:6512:baa:b0:53d:a95d:982f with SMTP id 2adb3069b0e04-53df00c78a9mr10880561e87.5.1733145289936;
        Mon, 02 Dec 2024 05:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145289; cv=none;
        d=google.com; s=arc-20240605;
        b=fIW6lu1dF8qJMV4u4keUHFRu1uyG/dz9EHOjXn3DIqRkMRfG/MEWqvCiwIMDouY7BG
         IV5mTZ7LkuReAzLw1Wc60A5ZVGzbjyMm17PCnjNcm2kc9907rOBcC+ahOUb0ju00Y6BR
         9XqNq5KjfgwoSzazRduGDkh5HtqY7/1GZjqt9pR7VShROYxqm5sf8033VocyYHu884ND
         yL6+PLd5yTIDXuahrvdFdblsvOzZiVw6i7muVR1Efi1i2PAW95fbNxtzIaQuYYh1XNgL
         SOBJvmt8vTm9ZE2GfwSNR2WG/DpaWGZn3wDgHpxldIvztNSU9jlfyVCHZO4d2mRxOj1w
         TYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7mmqERnKJTYNHU5Lv8qXJWCaRjH14PqNpgofF/931Yw=;
        fh=d6Ukt7wFCAMoFHtrUpUKoJ2A/HYvXIIqUltPNqNHgqQ=;
        b=BqtHTTl+XJfzLCDY0DOx7/tebrxa4BPS2hHpMPmjB6jG0UlrhigVue7Aa8XU1bp0G+
         cIIwWBm87iRA0PRGcZdPprVuu+m38J+2Kt8ByD/SdOa48Y3jjAsgWr0hcO/qcRmQO1Aw
         NTvtjBQm+4VUzHbnDGDgAxC+hibkdH3icb6hJIs3RsoW2MBDXSSsjJnHIMUrfkN+Vfet
         /RrQZRN1VdjW32WW4A8gQe/FmoVCfnAAcNxEE6DCmAOLh9LOaoz9FbRzd/2s0ujVa/Ux
         G2PzQGhMaqmIQacPTgdgC0XhHV+c1Gvx4yMzO63/xsF6gbifONeVeBvnveo3OTcYWWtG
         Fe2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHIMMWn6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53df643c6c9sor1847236e87.3.2024.12.02.05.14.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHIMMWn6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145289; x=1733750089; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mmqERnKJTYNHU5Lv8qXJWCaRjH14PqNpgofF/931Yw=;
        b=nHIMMWn6BWeGABQaHTD/OGyEF9ojxcv67EBfvhY3wEa6sgAT9ToB8G/jX6SzrLqU21
         RjS/l/mOUf8paew3EpOEUMxNgIXocJnY8s0Vs7yyP61sg/RQ53M3P+R3ZeGq2V306icG
         1s8RY+KoHIDU1NTKAfLn0Fs5j5EpgzdJnub0OHRpwBIYnJFHvvXCQcx50zWY6e+EUFeC
         ULbhGA9f2mrkf5nShvvzulMhul8ovGYTK/qMkH2RwdGQdmekJB3XSAPxbO+yXk/GrJpU
         9hui8xH6NAiYWUQniGHM8ng9Vgy/5anFWcblfYOPqPYqxt/JhU8hRaYPynaSkDserzw6
         K8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145289; x=1733750089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mmqERnKJTYNHU5Lv8qXJWCaRjH14PqNpgofF/931Yw=;
        b=ZYIRA9Y5mEgzJB8fdNUrx/lssyezyDYaxi+O3KW5vWp+WgPMXJs9F6UU2partxwpI3
         /N60ZlAu1dHkk2epHovrMTyr/4KOtFG9GgSAA23jjozQN9M49HWKmnOOWmlsuIiAuAlx
         TFLtbryVYeE32BS47NplTPs8wO+jmZ6o+NPUU8tsJAbI0EMuJ+B3QvH/SxJz4UBSGHEh
         8rcLq3QcuUsxWVd/PwGQUAhFW+DXY+ABiuQoZNN9NEa9GDxfEcTpeoqCt1y0p7lmZKRm
         AFEtvZGkdTni/JMM7opAkgDBknbyY1pif/ZWPLiAcFagtxE2UmWaY9Ssf98Hi+XSM2Qv
         aWGg==
X-Forwarded-Encrypted: i=1; AJvYcCVi4N78VRAY+OtBoa2M1Nz6uX7nq3rddg9Ql26X880fNm3Oe4FdQGNR59tooIiskRXrZAK2871eEobBSw==@linaro.org
X-Gm-Message-State: AOJu0YyofeagltXzFLWBS3ZVRW6OpduMZlzhTEBlWor5UWCN9TQDkGn0
	sTkpkCvz3Iix4FYTX4WLe9Gt4udXtV/L+2BN8CmbptCR+Fv0bE3x5BVytOwzgrNCaA==
X-Gm-Gg: ASbGncvrqSTo3v/vyRw3m40HbqNssEKv1LJy2iQlB54u0wbQxpSe8eXUDnd9tzZgwWe
	qxwL+mVP2ftc+fLjMPB9qXjCfYNmOJG63oNCDFq17M73tDu8t+pbyF1BAYgXQ+LlK8EpyOINkh/
	J2CS2OsZhT4bd/bvcPGqYC6MffVNgJUNA1kzHeVZGwVhE/zN3g1+N/nlCWd+hk1zXVcVvQgCqvE
	Ud8yMjbizUp8SGecx1bh6CdHksyKBYPENafSg+nFM7f9hbC9Slp6BU=
X-Google-Smtp-Source: AGHT+IHoNh9oBV49L/bH9Rnq+59oW7g+9/k/G/yiTTjNWH4zraotaaGroDgjZj+LGtjioc8WBOrUTw==
X-Received: by 2002:a05:6512:400f:b0:53d:a93c:649e with SMTP id 2adb3069b0e04-53df0109024mr13214815e87.35.1733145287794;
        Mon, 02 Dec 2024 05:14:47 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 42/54] target/m68k: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:35 +0000
Message-Id: <20241202131347.498124-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: udLtgDAmrbIS

Set the default NaN pattern explicitly for m68k.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/cpu.c              | 2 ++
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 13b76e22488..9de8ce67078 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -105,6 +105,8 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
      * preceding paragraph for nonsignaling NaNs.
      */
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
+    /* Default NaN: sign bit clear, all frac bits set */
+    set_float_default_nan_pattern(0b01111111, &env->fp_status);
 
     nan = floatx80_default_nan(&env->fp_status);
     for (i = 0; i < 8; i++) {
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index b5ec1944d15..ecb7a52ae7c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -136,7 +136,7 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
     uint8_t dnan_pattern = status->default_nan_pattern;
 
     if (dnan_pattern == 0) {
-#if defined(TARGET_SPARC) || defined(TARGET_M68K)
+#if defined(TARGET_SPARC)
         /* Sign bit clear, all frac bits set */
         dnan_pattern = 0b01111111;
 #elif defined(TARGET_HEXAGON)
-- 
2.34.1
