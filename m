Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802469njk;
        Mon, 2 Dec 2024 05:14:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTjmjjH7xPBjEAqY+8l1dg9CthmBB0owoOF9EIzEj+gguVrb4BOd6A33uXDEeLBgaYPjhPt0lw9TyB9w==@linaro.org
X-Received: by 2002:a5d:648f:0:b0:385:f07a:f4cb with SMTP id ffacd0b85a97d-385f07af738mr4130757f8f.8.1733145287630;
        Mon, 02 Dec 2024 05:14:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145287; cv=none;
        d=google.com; s=arc-20240605;
        b=OT5vKsyFdYUyDJfEHJ+WVHa3jrCMFZex6040TOnUuAZay4gIe5al0j1HEouvYK6w2l
         9KHAX5NXb7wgKGSX9A9M85rFtN6iiRNHJfrkw1IM/05HT8m7c6RidfTRhJCrpBtpE2cF
         GOttIAyqXMusIpK4akRkKVoQPNMyrxb/oS0E+EiDt8alJoqaBMiGl24c73S1UhWDQMA8
         jJzLrDJex5l5yv5czCnlFgiNrvJoiIBxRpw865msW9sOQp23bSc8ELrejK3imIXUgDOs
         ngrY0KFFqQYJE3cJu7aQBa2nBNn4xaErbnRQL2HzwGBSb/FmxIF6AobRvIOZxPxp/XuF
         Tbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mc9TdQ5B4JVTfGpbGlyL+6fSC7bsW93adDUcKdH34tw=;
        fh=7CJXe6U5VPOd07Bg8jBnfZ8cNqyZwVfafiy4Y4WjqZU=;
        b=IsMKf3krs22+82//IDaguFFF+GkfN5trmBvFHdD3XqpzH0yaEBp9EkaRw/GGFXXuUi
         AoJepb+pftnf7PsxS3q0rUdhHcpbIAVVzSikcfShPr8ROEWbz89J+VKLXQHhgRWoksDI
         Xxi6vPWvgvcJ/6OSMVfTJanm9qWkUO+qm6oXCvOBzRPHRMsrb7cHoCVkinLSqkNK8iAH
         t+TCOqgTZH/b8NejiauFzspvyqwM7DSYN/NqU9OzawH2BMTre9jYBCq/kHCBiikkJ1QO
         Ihbq84+k05h8U/WMdf27E9LiAmE/l4JxgRo5YKjrpGkQTc1X5WNGfuV0bbRuNbsr+S48
         6Q+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhxWY1pI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385eaa5a0cesor973117f8f.4.2024.12.02.05.14.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhxWY1pI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145287; x=1733750087; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc9TdQ5B4JVTfGpbGlyL+6fSC7bsW93adDUcKdH34tw=;
        b=PhxWY1pIuZ+BRDCCR+Fjs8VAcrAHd5qcEx2jKp5OE6szBWMcvsdA/umkn0nSZdwMRT
         TNJRkP98aG6MwcUcg4IhcAM0zePiAgAJ8UZgE+52OFOghBXgYOKm+kpRfRqFWDYT4m20
         ZgKgRKQmhD9c5bw80CGWON7xdNeYLlb7ipaQfWMEhgTEwLA2pXuJLLQ7TzewPs+8LpGJ
         uP8Kww9/lQVicgThLCuXFn5ZUflXo3NPq6OpQgnY0Lf+s/Uev3YfLrd7FakHh2EKOrsg
         2hwIFklJo5Ywvt1cjDh/6w2dYWsCyoz9YznqYZ8zdIFmsRycCTFOjEUwZDxUPdP/CcH9
         mAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145287; x=1733750087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mc9TdQ5B4JVTfGpbGlyL+6fSC7bsW93adDUcKdH34tw=;
        b=oigy/6hwSVYCcIuBdskYiMfDxFLscZ8b4R3ht0LoIpFSg/LyPt6NliMkM7Te3Lkgbf
         Nma4nRjPNE6i3a+Jpl4axDpVpZGeGgudhImlH9aIlF/6GG3oYklCKYA5NqE3iZ6MAhS9
         HmZdoOX5Ys/q6t0a/KTci5bpTHrqZjLAAMi/pCuzSUWNxSlg1B+lfThgVVph+q9/NbiO
         9zjyVbAy7M9Cku3ZOpSwWvWLaUUVEfyExN4FJQzREuybGUJf4fJQZSlMLgT3v2MJFa89
         AiXzuFB36IY/qsjy+t2qAN9ljCsv8qU5+329CDMwylXaHIvAtT141O7n/Msl9JihP02N
         st0w==
X-Forwarded-Encrypted: i=1; AJvYcCVR/Em7szgY2aq6HPOGJew4rU0Vr9FzemEuc5i7P8DqPXauiircjbvXLklQ4ZraBFet1ZxD5vGCGvHEpg==@linaro.org
X-Gm-Message-State: AOJu0Ywz1+xpt8Z2Hr7ohDRC5ncBeVXWLKELW1373D6b5vAnEZUzEJQZ
	plImm2cLEjCWtkfOPlL6/YU9wdb0HG3qANT4kLmLZnU23kFnQOKbF6snCEZic0GtoQ==
X-Gm-Gg: ASbGnctYnm82u53XhHmtXNpBkd9VQFFIO7qwpSWFRIfNej/MAp0APR3e0/DgokFs3Tv
	IgHPaPd6LHcghF2zROS2QkS+nF+HE5S5A926IQ8Mt6QE0uoVBdVYoVP/FpDIpPDdn2M8+rxvVtE
	uu+/jdNq10N60vPSz9zzxDuwueP74Ymvel6ZEHRZ/Keik7KkZKIzNHevZ9kInDCyXMSTtl7K9WC
	Hy/ewIoqht+8omPNYYb+dTYoJLwQBCY7TwSZleZL6y7/i2W+3LZoqk=
X-Google-Smtp-Source: AGHT+IE7TZ9HLEylyGxlNLd8UOKgZcyVAZG/YDCLYYUz45z1whmCbtIPbHtQM9QMqlWtZ+JyMGgcIQ==
X-Received: by 2002:a5d:64c7:0:b0:385:f7e5:de88 with SMTP id ffacd0b85a97d-385f7e5dfe3mr1852046f8f.3.1733145286878;
        Mon, 02 Dec 2024 05:14:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:46 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 41/54] target/loongarch: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:34 +0000
Message-Id: <20241202131347.498124-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1LnxKprWC07x

Set the default NaN pattern explicitly for loongarch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/loongarch/tcg/fpu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index aea5e0fe5e6..a83acf64b08 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -38,6 +38,8 @@ void restore_fp_status(CPULoongArchState *env)
      */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
     set_float_3nan_prop_rule(float_3nan_prop_s_cab, &env->fp_status);
+    /* Default NaN: sign bit clear, msb frac bit set */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
 }
 
 int ieee_ex_to_loongarch(int xcpt)
-- 
2.34.1
