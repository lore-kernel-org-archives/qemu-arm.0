Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802613njk;
        Mon, 2 Dec 2024 05:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWt4oXeprNDRjPkIzAomEMozCX/FHxDEqnuo/QVWTPFQ/twkUAOv6QIvowXjkNpH1sJ88eeAoq4TQgeEQ==@linaro.org
X-Received: by 2002:a05:600c:4f12:b0:434:a902:97cf with SMTP id 5b1f17b1804b1-434a9dc5308mr215454295e9.14.1733145294300;
        Mon, 02 Dec 2024 05:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145294; cv=none;
        d=google.com; s=arc-20240605;
        b=O/BI8yg3X5C48SXPbY2SlBz82l+kqxx2GR+wgbnnp7JqLXuJQB3oltTwCl8uXQBDZB
         OrBF5Bz1PD4H8+N+xo/uY/UAOGWoxNhv3vhKH2DwDv/AHLyyW451zaq5oQpCT2LZDUNH
         lXDmMqd9Jz2Ja7vYy5nilJqtDSrlzXTziGoWBVtNNfv+vEgnJsNJUxbOFfFRzYdpTntu
         /VCq3tGsmOe94AI4JOkuenWpkv8HxnZ/soZ5+jJfubF77rcP9QyqP8soWZDwpv8IXJjP
         7n98t5x7QTUuSkl29173IUyV9uZX9xsQbAu6SODNB97XESMs2HrSZ2uFN7orBzstBGld
         IAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wIjZFE7UkHdsOrQTCFo+cXQ64MiE8Y6c27yOZdc2SmU=;
        fh=5jvsHA83T77Xo2yQxBiHCo4ckdE17VbbVXHjbjzHndI=;
        b=dSIofbKd6AYXS9F7D9swTMbZJ0sGk61z+j7gG0uYuvvM/fUfiiPpjZ7qzxkD8Sni3b
         ZpNIgVnF2bauifV7qTW+6Q+R+yTfktmtpfc101Ei3UkkQkwje8JZqR477xV5/WavlwVu
         iO8uV2BU7Q4Zvya/ZgNc5YCMRmT8XkU+hAMAZJ5WNxz5j7mWnEWKiK0q6qeWbk/86Mq3
         rPFutpNr3JwhO+KPp5jK69dp4nOKyd8Wy0Z6VXFgOmlEnR7dmshYW50jnFuzEElZLmAc
         q6v5Dlq6TVH66WaC4NlsgdolO+EFAkQ/oDch2UWE41cWzefGQ8J4i6/nxqJAkc+TcUKw
         sOaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtPxAJ0p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e9f88eb1sor885312f8f.10.2024.12.02.05.14.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtPxAJ0p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145294; x=1733750094; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIjZFE7UkHdsOrQTCFo+cXQ64MiE8Y6c27yOZdc2SmU=;
        b=xtPxAJ0pxlk8VLzXQD8/cgN/5Q6ifWjfXLzOJL/f5ZgEng4Rlp3Vnag+0SjoILlGBu
         fpDQWRW1g8CCm/HuhSePKagRqui0NCqPKcKRE5WRYGyvwLlc04xRl4/Lx/iMWl71uM/o
         jCelNdNFCTgqiXpQZy+5zy0lrh3QUSpBYOah/KxSWqhglnuLp41F2jbwftj0vuh7vnv0
         MaX5gzBlaJNZOyoei++RMl8bVRN73flj73MLzpVwzm2oIKlx4IxgAtG0Wo0CPFMRLyVB
         xBFNnByD04Tll+T+xDFOODlVZGqFkL4ElkFgsc2Nc48k8aCWzqALtClMDvwa0GVvH4nX
         KoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145294; x=1733750094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIjZFE7UkHdsOrQTCFo+cXQ64MiE8Y6c27yOZdc2SmU=;
        b=dEZRyYrRO2u8UolbV/o6o422u1+7gSSqXalIVjp072o0S8mJtWxe/xZ38oiHZeD9Nj
         jQDMQby3HmR2qaNL2QTUxg7PbsrfSp+vC6F9aiOXkmXFUFDydPa5eAb3TmJGPtTUoH3o
         nLSdlaFstPvrDEZrWGBVxUfrgtrV9YWjBhiiSFoef4FiwAMpipJYBh6cEnRp2FHb2oid
         mtrSHgFWJLmp5qXiS5/a6I8UubbnrHFk5GwkBV6dScckg06htD1ZotG1PZBnZeMSvNY+
         GjAToLOoMSogubvi0FMj1WobnC9OYm3WhdEgt8oQZ/9TQwU2Dp4XG6PkutpAheEXyMje
         IkMA==
X-Forwarded-Encrypted: i=1; AJvYcCV3xeAxss9sK010ZNMPf1YHbMeBSsBHs3p6+P+TSrBSAp0lQTKJEQj+WeVY4lr3RKFVd8ggreuFmnp1lg==@linaro.org
X-Gm-Message-State: AOJu0Yye6ci+hKQtOwllxGNHHH9BCNJsPiDGxPYhBhi7qYDLgCMqpcG1
	mAfOPyFb3UJ7k8iGedSFIiN0MfkYmkeW+Q0PWbf+xpz324WgibO4wJCOSXAmDZI/LQ==
X-Gm-Gg: ASbGnct6yMz6fFncGMSW/WjhURCREiIK1Q2+tmgvB+3K6p0PCVc+lZ/66sTxLzec2qV
	4mXezrcEfISmL4jXFG66NlJrPx8GXWAY8hY7LUt0L2P3KoCBr3O1kJeJwRR9s5aLsI5CivbpFh5
	suB/9cjfIPZ45eO/MzMUtStp3PFb7nBlQGc2wSfj0Ahc0AKrLTAZnMdmlFQzQYagaPhpZFtrGWd
	7tJ0+HPpsgUpE5XvrqwMtJOmhUSXHymOpt8sZGZnY1T5v0GnKLkZ3c=
X-Google-Smtp-Source: AGHT+IFnOp/qmDxoo8maoUW0HNCIhHY/AycOvqAK/YMRFl3NaZIfSnFpJn5BqDRmNnLF2XpRV+ImjA==
X-Received: by 2002:a05:6000:1565:b0:385:f062:c2df with SMTP id ffacd0b85a97d-385f062c5d3mr3670273f8f.11.1733145293503;
        Mon, 02 Dec 2024 05:14:53 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:53 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 47/54] target/rx: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:40 +0000
Message-Id: <20241202131347.498124-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EEuGkXpH+dm/

Set the default NaN pattern explicitly for rx.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/rx/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 65a74ce720f..69ec0bc7b3d 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -100,6 +100,8 @@ static void rx_cpu_reset_hold(Object *obj, ResetType type)
      * then prefer dest over source", which is float_2nan_prop_s_ab.
      */
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
+    /* Default NaN value: sign bit clear, set frac msb */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
 }
 
 static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
-- 
2.34.1
