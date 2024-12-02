Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801926njk;
        Mon, 2 Dec 2024 05:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4pHSRlJdiJCDf8HSvOifMbJ5QEyysZNGBfgXfvHsLZmlM5W81h44acHYGjD93BTVqiSu1kqsarKMsWA==@linaro.org
X-Received: by 2002:a05:6000:178d:b0:385:e013:b844 with SMTP id ffacd0b85a97d-385e013b96amr15250150f8f.15.1733145256093;
        Mon, 02 Dec 2024 05:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145256; cv=none;
        d=google.com; s=arc-20240605;
        b=XeS/aX1Qzq2RjxeGLOrmkReoM0WCx38W56RHoSHFi2qO1LL1fqU86EouohX7VHwrPT
         Eln74cmlxQQN1BvNBV3T4QzhXPTjkwX7XjT03iCivTSv7x0TD62PV4AazURYrGiEh/0P
         s/K0ODDx4/y1htGutni6hjp2CP8ycEDb/C0qAmv7K6gqheL7bhggZavhrMWkn+xT2JfY
         y4LA0AazCHGEqFDvPeIqxCx2F/XygIwVrp+7whNEiAApyZJMsP+j9Vp3ENtNmxUOVyQD
         Z6VTBhI5wNBi997cDtt296ke0KB0rA7oHicWRO5oq7NNSHUm6AvTelBIazUUVMQWmNw/
         4fUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I1o8XZNdx+7TX2Hd+GlCvP6YeG8j6TyLd31LJRVrH9U=;
        fh=/40VXJSArTxI5wMs+Hp3U+R85mdIlL2TFn6FaNCMUas=;
        b=L6iIMduVEv0wdpRngZmeZCKYLbgZoLnZiQXJ8D8ICrdbwU0YYAn7l4WZEE7JnNF+OS
         +cKqKFPMO7VNiDUdy5OarRjQARbihzCqJmsmma/18v4Cx0Z1n7XHc0vd5NL8fXbmwE6z
         aAX83bJFzI/IrZtilUkwPblqu2B9GJQCMkbSd5rJ3Y2dQspFrxfaJMwuPAQz/peaKMFW
         pqBRzG2jWJUC1UlSECDVDMVMafvClkuPBryjUGMvOSYofHu+7sM3j/t6gBxxA/quJSpZ
         FWSSfnBgkWf694VOQ97T1ziGcdQ+xpQKhSeBgwNoLlb3gpOaPY/AGj/VWSwXetrqca9f
         W4qQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kzfODde0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1055debsor43070675e9.5.2024.12.02.05.14.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kzfODde0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145255; x=1733750055; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1o8XZNdx+7TX2Hd+GlCvP6YeG8j6TyLd31LJRVrH9U=;
        b=kzfODde06G6w5+4qDqGOW3D2pSdDVIFF6JyWPrRrIdtIpm4a4MEb1GsYzPRPy8e6nD
         s6iOQmRZ6MIZjiP1js1+CBvfqf4gY4FcS3f0IL8p57L1W6w4aWpNlq1NCby0h32OyDz4
         bolx5OOCkk+GC1EHSx2XmMLwNJZYXgJB2xIKMZwZunvnQUn3xnbGeQd6z8U5W8aj8jUn
         vWnCSzWlwXxgYLrOdwCBSb7VAVUd9amgZgao51ClhGQlhISVCK/wbt+jae+U4UFfY5xb
         cGnP+/ml3sXsGtz2A9lloZ2ODdPtmoKH4m4bwLnknO+iNoGy0UHoYcnd19/kc6ppgiWa
         r2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145255; x=1733750055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1o8XZNdx+7TX2Hd+GlCvP6YeG8j6TyLd31LJRVrH9U=;
        b=hu3wRHJGutD8Ap1lhWJH2+HKtLaY411jqdvluUjE76XSaGU/r35nFGk1cZGa7OVnRx
         sNxYQqg2Lc0BbEbrGLBBBwAjD2ntVa26oS6ocmqBxk/zB18GqruwARBKAYiZ8LVTVUAa
         Zw3TPuI+h4kLBcyylMa1i9DuNfpA0+enM/gLnPDcGbaGFZuTMZSviTx66y7N3x9QCKnM
         7KjjhzeDSrpPl60EFl6LYqH9lxMFmCgxa62H4TvvjCjnw1CMD1JwRu4MiDzwMuH0fuSX
         d4hEreXoyAS7vASCE5uC03BqBLmtW/gSojtAECUt+UwPFexj46OWdfD4oVFwBVQoTrh1
         wXLw==
X-Forwarded-Encrypted: i=1; AJvYcCU8c85TWbwhuU6qdboOyG40KXf1tYSRJPpjfjlq4V8RFxJSL4LpbxKibpRHWdGQEXzaQ2B4YvaQXVOBZQ==@linaro.org
X-Gm-Message-State: AOJu0Yy5p5j/ref3tRc5DwVbB8mpONCessMyh4l+VMvQuXZNqlU1BfOt
	asQfWmmHucWHEHzzsKVNIG+q29xrFzCuTFD6v8ZpWjIwtMo7/kAYAME2WrYIy59V9Q==
X-Gm-Gg: ASbGnctzyT+a8t8wLLAo4Yjv59/6mRxr8/yKcCDoiso+DGxgpJoVTur717K9Hxa6MdZ
	Pkf9WLtrB/k6TVKqnfEm8uVYfO8AvYJU7+as7Byva0ZsLIkZF4ZSvf9dKBdiToKDcbir/fiTl+P
	BTmcmbaNR8na01pBROQ2/ZBqB5R8pobVasxn1bXhnimsIRXSx1sm4QvRpQ3oJoiFCBEVEwlIOQV
	a5dIz8jVDoxehtuBqsWhznSkN4D7IbAgYmO4caD+rtt3yt//qWVluk=
X-Google-Smtp-Source: AGHT+IHC0YjjZ9AQjXw67UBGp3IT7FRgmD1pMeQ/h0Fw/MRF7TXN1I7D+96J+L1KlfsQ3kwY/1WEJQ==
X-Received: by 2002:a05:600c:5024:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-434a9dbb663mr276864655e9.3.1733145255500;
        Mon, 02 Dec 2024 05:14:15 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:15 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 16/54] tests/fp: Explicitly set 3-NaN propagation rule
Date: Mon,  2 Dec 2024 13:13:09 +0000
Message-Id: <20241202131347.498124-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7rPii/GU/Bik

Explicitly set a rule in the softfloat tests for propagating NaNs in
the muladd case.  In meson.build we put -DTARGET_ARM in fpcflags, and
so we should select here the Arm rule of float_3nan_prop_s_cab.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/fp/fp-bench.c | 1 +
 tests/fp/fp-test.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index fde64836194..39d80c9038f 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -493,6 +493,7 @@ static void run_bench(void)
      * doesn't specify match those used by the Arm architecture.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &soft_status);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, &soft_status);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &soft_status);
 
     f = bench_funcs[operation][precision];
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 251c278ede9..f290d523ab1 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -940,6 +940,7 @@ void run_test(void)
      * doesn't specify match those used by the Arm architecture.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, &qsf);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &qsf);
 
     genCases_setLevel(test_level);
-- 
2.34.1
