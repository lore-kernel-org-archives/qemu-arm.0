Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802476njk;
        Mon, 2 Dec 2024 05:14:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7Hg7F+4USjPen82HVB7DMaqmYNO/XUTN4xGcNEQQInzAXvnnRK5a2Tbw4237xRbVfKYcwWlX76j43Bg==@linaro.org
X-Received: by 2002:a5d:64ec:0:b0:385:f677:85a9 with SMTP id ffacd0b85a97d-385f67788a8mr1807449f8f.44.1733145283328;
        Mon, 02 Dec 2024 05:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145283; cv=none;
        d=google.com; s=arc-20240605;
        b=kbcF5gZRYCtvGSDp6uRrSKR6lN+mEtBtQ3MJTuFilQ/kzmcIY0xwR5VEXwVQ1tqh6T
         iPljxxmF47F2aH17PysuXjilhr68Sszqoy3DMNWhNjYWsiyFovZEhh+56PP2yonKMFMk
         QrYdd/AOvO58crBk2hnvgbpxTEVXAhlGBqs3uz99OiPC/mv5Z37DmbhUX2CAKrp59lMt
         //b4ZPS97hfbgtoU0YSEVZ4PZuVWeecUTPo3/+FI3o26hqdDkTJQuh2zOnSeUXkyZi54
         iBvFuu1ZNpeEPWtT6GZBUoAXmLfdLOouT+6vzJYyHf3QvddtgRZVuC7P5hqOV8KFQnCG
         Kf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eg5CLJnIGFMP+7pRukJjMkkCwPMh6g96Ep2h3Ltgz5o=;
        fh=myh8s+AK7QvLd+GFNUsqJ92btZNRADpUoFAnkL0X83w=;
        b=dsZx95b96AJU8F0p+iUJOoiUryJQuiAeRAvOkjYokt3eZXM8dRhmuiw8gZ9NjqmSGI
         5/UiuJLC4Sc6Co5yDeY2n4qaaiDBFysglgVJ+TE2ggCQT1W8bqz7Y3e/XwWUpMp//kfn
         Qp4QBkAxJz7B/gJNUbGeNGvbIb1CVjhG2VwNoHG5jxFbIkPGzccsc1HzrRZg04TRDjGI
         lxEp59bB4mc7JwxP6HbHHf00fyA3ibsb6SlZhn+acTLPj3xChagSlnInbh1qlrcvoGtB
         AtdWRKl1crOTd3RCDXc5UmwlFri1O9MvNmy+C1BNAXMqPIwluejDHvpzGNw5cmSYRdSa
         iZTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOFuEnEW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e4129b72sor1107932f8f.7.2024.12.02.05.14.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOFuEnEW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145283; x=1733750083; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg5CLJnIGFMP+7pRukJjMkkCwPMh6g96Ep2h3Ltgz5o=;
        b=kOFuEnEWQYqGiGjJaJLUI//o+8vhlC/4tmfbxPeD1xEwKT6F5hIxkuQaCOn+ck7foZ
         DGzgXaTwfdiVi3N52fQfdlKKZnlwbahw2fFmdqqH1tafgMF/Ywa99/cG4G2JEJF+wVEV
         t6fcs2vO6gnqKJsQPsVQhuw/doMYpTvT1af7UwQ0UQCxN+i5XeDWiYPwNOvZxjAIEHzC
         Lww/E516RE5LwOwAsXEP6hyZRjmE2q/Ujg1wLpWMCvW8pS8rNx6ePqsWH74w4ouzBSrT
         HB57aHrlZDoN6LC1I/jWHRQ8eNTZUsDVZzZHLRAK7QX/Ug2fpolBFE/Ws4Wk+j8LSKCg
         u9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145283; x=1733750083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg5CLJnIGFMP+7pRukJjMkkCwPMh6g96Ep2h3Ltgz5o=;
        b=dHdTthLAOQl8cAqrBuEac3oo1WqyTLPi0RSbBKDP/4VOSHBvyXVNgDmVTGLVG5bdyg
         7l8yc7J9OqrUkDAZmDLZaWgK+T3dTC3rI6q7vNVno3p+JEdSAfKkNCXtje5nOsfAxCuX
         8d3fdVn17HVXJuB6BrRv5FWtLxNqpej9+YZ9ikZ/Tb77Tj4H/08Fl2ebTfhOBcvGGF57
         R1GicznPGigk8dG8GfwOj1tTlREdPSL6aHJQFsfXFLBFW9KXRQxrxl3Z/gKDvVdAtDh1
         jRLOW5lOUxauHKuHpkSyFba43vgFZ7wPutltNb8rMvvuQPASQp2wCq1bPDeuxwpKPgGA
         aGXw==
X-Forwarded-Encrypted: i=1; AJvYcCUF9kHGGw9TGfVWbdfk/x7HD5Pzl7G01QMUTQ7oU8KahgrJBywkyJz4YmOUGwqGSllUH3woESgoH0/SIw==@linaro.org
X-Gm-Message-State: AOJu0YyUbOusT2SEN2eUZy3GF4qm/enwa5Q84RThcGWODd2faNoqI3L0
	4Y2edIfG4ppZxxjiqcbeGjhF9nNyNJTynKksuqTTP0FMpP/ZpHUPbkgp6urAqUQkkQ==
X-Gm-Gg: ASbGncvLyyJwwvRA7nAc62tws4Y4ecilT9IJrbVJMWiqHJ/ntIFtCgaRXZ+gL2rf4OG
	pewQ2Whu0XCIyuxIbOip0yiT2x8DuKCPMYi9M02tFMgQzSjrY/S9yXd7BfNaCr9XYhGAHq2AtHZ
	FxTMImY7ua4sow+KCgsXORqmb2tZVHsi8A2CkqiJpBIQ73931uap3P6R9iQIUrHHlMCAaN3wSNv
	1hupwfmwUQAE/7fAumQFLm5UxHpZ7B4MHsH1u6Z9kzgnQNmPajimOg=
X-Google-Smtp-Source: AGHT+IGmlpAUQ7RrQZuvyRgb2/PxGBA8A9Osg4UR1KnKKv3AR4gZEx/FzXh11xp1F7xPsGgXaZ4/jQ==
X-Received: by 2002:a05:6000:1865:b0:382:4a3b:5139 with SMTP id ffacd0b85a97d-385c6ef598emr19334141f8f.59.1733145282505;
        Mon, 02 Dec 2024 05:14:42 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:42 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 36/54] target/microblaze: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:29 +0000
Message-Id: <20241202131347.498124-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: K+KmSWmatPQo

Set the default NaN pattern explicitly, and remove the ifdef from
parts64_default_nan().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu.c        | 2 ++
 fpu/softfloat-specialize.c.inc | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 710eb1146c1..0e1e22d1e8e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -207,6 +207,8 @@ static void mb_cpu_reset_hold(Object *obj, ResetType type)
      * this architecture.
      */
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
+    /* Default NaN: sign bit set, most significant frac bit set */
+    set_float_default_nan_pattern(0b11000000, &env->fp_status);
 
 #if defined(CONFIG_USER_ONLY)
     /* start in user mode with interrupts enabled.  */
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index b1ec534983c..d77404f0c47 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -139,8 +139,7 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
 #if defined(TARGET_SPARC) || defined(TARGET_M68K)
         /* Sign bit clear, all frac bits set */
         dnan_pattern = 0b01111111;
-#elif defined(TARGET_I386) || defined(TARGET_X86_64)    \
-    || defined(TARGET_MICROBLAZE)
+#elif defined(TARGET_I386) || defined(TARGET_X86_64)
         /* Sign bit set, most significant frac bit set */
         dnan_pattern = 0b11000000;
 #elif defined(TARGET_HPPA)
-- 
2.34.1
