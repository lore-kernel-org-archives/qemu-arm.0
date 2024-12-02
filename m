Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802411njk;
        Mon, 2 Dec 2024 05:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyFdn5KIoR9HV+3SN3PEu1rRNF036Q+E3FzxF9VANVu1Quob+DUwhQRvYDIaCixHvf/FcwDvYqFHqalg==@linaro.org
X-Received: by 2002:a05:600c:4708:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-434a9dcffa3mr237786095e9.17.1733145284958;
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145284; cv=none;
        d=google.com; s=arc-20240605;
        b=JFMZ3fd4MIs1M/MvokUZdb8y/jcMuqYBshXR490yexknbgsDNk2MGgeFfH9PO3YBT+
         bducX4WZEfosOJarQAbpdgh7fhqlZ1X4on3JSJBiZniTozi3ZkrVJr66ACleMEUdcvpK
         6dsgU58R/Zr2rLDpdjMAbMhMazrqKEe/GzoCsQKQppYx5h+vNaXDJ3BDeWEcBBlCUjHW
         aWYMINRFfitnUXLmuN55yNvlU6vXTiLRu8HRO+MrXZftsxrNLfNGuqe1chErPiz79j+W
         VeGmu+QBuigfi74NcRddFibwfInRQKrNPK867L0xFmvhoS1Sk5LHwmMXvI7w7KYbB2SW
         K1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3RxyO1FT5e89Qph7T+rokhc4ELopzGup08oCLW4wD4=;
        fh=jzE0MZeeshmYEFJcxB9xSqXY0O2FOPCYcuAJqArjAXo=;
        b=j3l5d07rxJMcpvuVEhdnbfulWLNSc9sSk4dfy7+x20nyBIXMW0OGm9AK8biyVpV97A
         jMpqM+9xz2SS/uj8PaWSX/2USZjA3ffswVSCzuy3Q/bD6Vbg/8pnQPt9OkwNLasWCw8q
         EO07fJBjR0GrDhXkknSHQLIKSilVitD1RYZzmggRizR9ZLSsuOH9vpLcxunadw5XiJPX
         y0H6n1+esYre6aIYI+yDbAa5INs05q/hqT8/bn3iZlF0rbAq3xU4j7zZCXwpE0+Vy2Zr
         3JFRq4/DtjANZuD3cDfRDANKcuIPGZu2Tg9vzHOcanurZ3VGPTq1c/Au+Gp4nJKZEkyl
         1t5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NGsYTaKJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a27c5sor28133375e9.12.2024.12.02.05.14.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NGsYTaKJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145284; x=1733750084; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3RxyO1FT5e89Qph7T+rokhc4ELopzGup08oCLW4wD4=;
        b=NGsYTaKJZjIAxG3k6hB1g3L5Hauc0tCuE5uL06BBk+mhCuUMRiRhnRTTbbFL0F+lDv
         Wt4Qd6ptEUJkqmJVdPwJQ+0vup14xafmXHw6Aq8rAYU3ZMuP+BnIjfQe43wwEPnxisqA
         4h/t6BuOYkrAUsU+r/3J4KnCrguJYS4nlJe4yvxrlrYQtx3qcIX9qiQ5JnW6Fonqo+53
         Kuscm1xI1NDYms68lR3aPA/8A4Lenlp/rITAqsuCXih5Meuoox8cJgpnizP8ldrfMEE/
         80CSWjJIIE1R58RyNEgdO9OIp8O997rBFXhwHmSsDZoeWuTZ+h+cmAbpeoPn5baQZ9Gg
         MTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145284; x=1733750084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3RxyO1FT5e89Qph7T+rokhc4ELopzGup08oCLW4wD4=;
        b=SPxcxNH2xaOxT/nz8OoCAJlKsHNsmEC4NxnF0mhgmx+PZdZJn4sl8kfWWCIvF5A/i2
         Ma/WG4SM7wcofWzKVEu4XzzLYtfrvXjFnAoPezGJcVBrSx2Ed0qO+6fRV1r/srxo8w8B
         1j0Lh7C8hqeZxQZ9FJaeZa6DUWbwAyn+RfaURkhHIAdfGGddRNNIto4PeWjQYzWVrpOP
         a91xncj2PUkvuaEDF1ur+9dBc+TS2cdfR1fcKpqf/xupkqQHqOR3TUKOEGTvHrrdPaO1
         qyiedBYeUSxTJ/lVpvHHcfZnVKwYu4KrgCZDWtY85UM7e+cWfS0u9xor2sHGLnY8bfKM
         Ctvw==
X-Forwarded-Encrypted: i=1; AJvYcCWN18qbUzLlgARAfXs/NgR1P7BrqP2faw/DFWYEoQHryjl/3eqf4PtqsyoXV/5NWnfj0et3qvlbKVdZGw==@linaro.org
X-Gm-Message-State: AOJu0Yx1KEyU5p/CHRdWhkSroizl0UUiN0raEsbNHJIC01QNqTWiu93a
	QZucixJG9veOsBomDUh+rxsnYptfsa/Hd45tKstyoQHjz+B8o+7xAtGPKHYDXvmQ6w==
X-Gm-Gg: ASbGncvhmryzdgBktZNFbBX9opxJHDRvD4FL8GnZZJbOsdR52yRWRlX11sn7pcP5jOe
	HzmRvdJ193BdxPxAec3oh0oaewESWp03bT4bZWO01EBWoPjB1D4pdJqb6axbtZif8SLL6To3C1S
	BVWGP9b4o+GpyDF13+Eq2F0xaAIu6ydvc+jMzhFxzmnOxySdoPa/eDBIGOwrxl17fzc127EjS6y
	bLcA4TBN7etPBEDqGhyZUx9PM44vhoWBkxd4kfQAjs3MKOgR+eyGPE=
X-Google-Smtp-Source: AGHT+IEA90ND8eTV2giPp+MwkpvqJJK38DP4tDMh/u88DHbZNoiGJzMtroz6wvzk5/iNtqmnHykbYA==
X-Received: by 2002:a05:600c:4686:b0:434:882c:f740 with SMTP id 5b1f17b1804b1-434a9df79e2mr192275555e9.32.1733145284279;
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 38/54] target/hppa: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:31 +0000
Message-Id: <20241202131347.498124-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0L257oDy0fvO

Set the default NaN pattern explicitly, and remove the ifdef from
parts64_default_nan().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/hppa/fpu_helper.c       | 2 ++
 fpu/softfloat-specialize.c.inc | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/hppa/fpu_helper.c b/target/hppa/fpu_helper.c
index 69c4ce37835..239c027ec52 100644
--- a/target/hppa/fpu_helper.c
+++ b/target/hppa/fpu_helper.c
@@ -65,6 +65,8 @@ void HELPER(loaded_fr0)(CPUHPPAState *env)
     set_float_3nan_prop_rule(float_3nan_prop_abc, &env->fp_status);
     /* For inf * 0 + NaN, return the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
+    /* Default NaN: sign bit clear, msb-1 frac bit set */
+    set_float_default_nan_pattern(0b00100000, &env->fp_status);
 }
 
 void cpu_hppa_loaded_fr0(CPUHPPAState *env)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 452fe378cd2..b5ec1944d15 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -139,9 +139,6 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
 #if defined(TARGET_SPARC) || defined(TARGET_M68K)
         /* Sign bit clear, all frac bits set */
         dnan_pattern = 0b01111111;
-#elif defined(TARGET_HPPA)
-        /* Sign bit clear, msb-1 frac bit set */
-        dnan_pattern = 0b00100000;
 #elif defined(TARGET_HEXAGON)
         /* Sign bit set, all frac bits set. */
         dnan_pattern = 0b11111111;
-- 
2.34.1
