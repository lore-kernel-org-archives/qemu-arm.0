Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252620njc;
        Thu, 19 Jun 2025 06:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpRijoJYjxfl8WBJgHyWXZsMR9HQHyYh5fsXy7BIsRwwPvbcbAgHRRlXKr9W3gDfRHdVc8oX2u75cSlA==@linaro.org
X-Received: by 2002:a05:6000:43d8:b0:3a5:8cc2:a4a1 with SMTP id ffacd0b85a97d-3a58cc2a4f9mr4742187f8f.39.1750338824781;
        Thu, 19 Jun 2025 06:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338824; cv=none;
        d=google.com; s=arc-20240605;
        b=ksaxnzU4t437qAYxa1Hx2hF32UqSGmN+u6epdTPTapF1wsFdQXoGVPCZcrPuf2JxEz
         o/g3XQGGszjbia5R4+vjiH7BXtAegHg4lHSEtrNRfxJB1fFTqcqZLedQd9mMHQ6w8b03
         US47f8lPv9Xt3AY8fsVy5T4FcBsuWwEsJR4BhD5MpmEqTcfxoflDwQVuMvQywaGZcVTD
         fZm8S9KAVujISaNx8IZyGclMVfvt9C73UKqUYXKUSf08NivadRwjGC7Oz7QUbeFyN9jL
         Xhqabk+L8PPbuORKEcZOSnVE3fvrHa+45I0furYpLmyU7Gnw/BB95M3ZWSiZcLAvBxV6
         jMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8AfBQUbCa0g6ZkI9T2sAPEVDRyQTsrNETxFPLqSkQ4k=;
        fh=KtI1oVLocwW5xKUkG+pCYeeSQzunjU2dS3SpIJRPZlQ=;
        b=Ic3fcK7NiOJHwFETOfMOsXqOQCsW9oNCiUqETbFBSL+Sba9ZV6h+Rs89hLPAcftInm
         x0B6yyQDpezcxYS+NbFCIZNqrvuDVUzv3m0MuhPA2IMSB/6GXK3JF6DR5+xv385qDZND
         EO4lUzP+7t57vsIL8xBRJg/9P1k07I68R5tIs2tax+WEO+Uymbj5fWNGtQLFYuF/Iigr
         KTOCM2necuF8fW+nz4c4IVnZKKuQRph1TW5mtS3uwjmOUdYlZRXCgYWDaOsNyuuJA2ed
         EBXL5h0+uxj6tH3B4D34ycx3HAInIh9EDl/LOQ7JkA/QzwFfv+hkogleghy+6eTIFwcF
         FTmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fmG3yYMa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5618d1e27sor5085059f8f.0.2025.06.19.06.13.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fmG3yYMa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338824; x=1750943624; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AfBQUbCa0g6ZkI9T2sAPEVDRyQTsrNETxFPLqSkQ4k=;
        b=fmG3yYMaLXLXotknTGxkjUzwCeReUBGyLjcHsJWLWNHQrkzRWmQMwOfLC34YeVCnII
         ceArFqIaaO0lPFATD1mtpZoVTxOir5L+ISN/HRQP3BV8hyu+6sxORudIePvue6uf10lm
         Vp3GWfe9lEhzVwnFo0xEGMuPBw7aH6dxSajzYOpe84eHs7/CpCQRLrepHlWqYKZLi0O8
         NfGse3ugl9FuPIKiya8p3diK0fhgFDY0BojB2tBm2ia/Qb9ssXQBagtt4AtwjxYyZR4t
         wD6vLpLZ4+Nchp5QBZRusG7aI298v5QnNBNiuB4YETQDkTP4ScOjS9iqaGVjsTEZkXjs
         6J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338824; x=1750943624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AfBQUbCa0g6ZkI9T2sAPEVDRyQTsrNETxFPLqSkQ4k=;
        b=ZEz9Fffkz1nKeA1xHk048jM34VAaXg/FUpucFThwWpvAS68akvnwLSQregTFFVlEV9
         ENIuXhrPT22DnLUhBJXdGKlNKwRGbKoSvThLN7m3Ltg4ig5iiBogWwNizOlFl243ebzi
         ePqkQGQGM+B+r9FwwKShDlLtF9OkYTR7T5ICINdSjFB1j+PYZctaVw+vf6qWyfO17Sjz
         EoVaExo58SzT5H40RoPyjgNRVNZxm1nQwWO01qZeLZb5O34DLhKRExI2I5qQ1EQHeIbg
         q0jAuwlvzKPNTF56qJ7iE/aTxusvgjjWYy2rNTyjeoI3vA3/950vsG77ms3E+iqccylJ
         h9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUApXCHkmtyz7v/IvuX2LeVxLZJRjvONBe6xCa/+y5jJ1LnW2mZbENxdNAUb8/UUYk7D7g8NeJFb3+l4Q==@linaro.org
X-Gm-Message-State: AOJu0Yzne0DNDH5lYbVdQilLEWQPkzsejSxuDKjLj6kn7wsvKfm/c+yR
	v4SuurCzIIQUCg5U3avUSHlmzajhCRC6UZegk4jHlzgEmjRGg0CyMdgD0kxs2zZgRLrOHQ==
X-Gm-Gg: ASbGncvrXaZPXQR0IkJWXaukhvqIVmzcCsm5rrxOs/bPqayvpZR3j6eq+sDJKpS4Vuk
	hY6FJF52ORCJysCKJqlxMctiO6rghIoLCPg/+xL8QZO5b40fbcj6BFBWhG6J6qGnNkxIS0AHX76
	xK46dMF5gMGwrGlZ7zP23MhQGKxa7tcIW9Z6WmBgfwS900vBvBWi5+INevepRHKJgPrtHJpdroH
	iHfophNfT6I48/JtXvo6TVVH3CL+NbGyS0c7YzscgJeauyHPpG6lVSlV+zOS8O/37GdKwNDaPFC
	k0QV48MpQaJaZR3aXXGWjHwczksHIRZu7i/jRRIYRFEIS8JWNlb2/Wy39AHRL2IEvw/qShBQmx8
	f9XcyhgirY8xP3VQwPNWyH+Yp7nWxwzhaySFm
X-Google-Smtp-Source: AGHT+IF5e/MuVYJRmblkXpvIfqjyXNK9gk5KRckaMD59FVUxTzSpN5L9R5TIl76Grn5AxAQzY7bE9w==
X-Received: by 2002:a05:6000:2c0f:b0:3a5:1c71:432a with SMTP id ffacd0b85a97d-3a5723a1889mr19428150f8f.14.1750338824180;
        Thu, 19 Jun 2025 06:13:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebcecdcsm27991485e9.36.2025.06.19.06.13.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 04/20] target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
Date: Thu, 19 Jun 2025 15:13:03 +0200
Message-ID: <20250619131319.47301-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XHAhq7k6Ti+M

Only update the ID_AA64PFR0_EL1 register when a GIC is provided.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 42258cc2d88..06cfb7ba253 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1057,11 +1057,13 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->mp_affinity);
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
-    assert_hvf_ok(ret);
-    pfr |= env->gicv3state ? (1 << 24) : 0;
-    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
-    assert_hvf_ok(ret);
+    if (env->gicv3state) {
+        ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
+        assert_hvf_ok(ret);
+        pfr = FIELD_DP64(pfr, ID_AA64PFR0, GIC, 1);
+        ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
+        assert_hvf_ok(ret);
+    }
 
     /* We're limited to underlying hardware caps, override internal versions */
     ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
-- 
2.49.0
