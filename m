Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878993njc;
        Fri, 20 Jun 2025 06:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9IhJlyF4amXdkBmFIA8pWS0bEvULjr1Im9u1SUiwg/dOwKB8xbiesb6ff4S0FUSmEOvATKuDCfpIPCw==@linaro.org
X-Received: by 2002:a05:600c:c08b:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-453659ec1ecmr19715625e9.24.1750424968973;
        Fri, 20 Jun 2025 06:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424968; cv=none;
        d=google.com; s=arc-20240605;
        b=jbH4qzHKvfifeEbidpiAuvKc3HzECjlFQ3Q4wbzovfsEtb3PDD557yaoN3ZLq/Vmp/
         YiOiTgQmBGnMgOUZ7Yrknty0kii3veGMqrnZnXvrcP3q2bVKXIEvw2JY9IEgQUDCdjAn
         gS9uHLLhlxGgqteXI0CcUM0oUMNYllqPBztp2W9tSAwH4JbdpLV0jDw6dCZxsYcwD4Kh
         9B0113r3LYpQxqYhNWxMor6zF0Cj+Z5365y3eFNCJp0QMIqikx7mzlCbfqm95ihl2mXW
         hfVY4qgJE8XH4JyIhhM1QygeTPCrxRlKrYyDAK22mnF8wMjyxAKIDqeInYuUrWWtgE81
         sGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ho90gmr9LBnf0X5r6n+/qD5b6A/rnGinNhmNB6fBLQ=;
        fh=sMvKE+qW3yHgoGF40IDkfMOW31ZpwRrYY0CcBFQ1VMM=;
        b=jjmKYBI+rG6+RhSwnT/Io/8KjUTjon7iWzz78zl4iC+z+l6o146eoPm1Xaqg8uC0Pw
         KNtf44soto7tLcdkaSx10vCXXXKc/5IjFHYQn6MyzJ0oUJ4uw4t09wGnbhoJm0/WI4FP
         kXVG9b2PwnYUHgx5g5TrS9UjC5U/ty97mP3fEoCUz0NNGG4xei1XlnpAFLhOHzq9fLIZ
         T4d2TNyOA9iYZmPzSoqu1OI4XjJ8PU5aVB2LmdDe8kntaCmqMnEBz/XW7kcR7zo/sdwP
         Kx7SZPYqFWa+mJVSPsir3Lc57Wo1YIxcpWfSVL5iieGnIjlVnqGaGy5EOs9GlRlPqgq9
         wbJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eS7gpdbt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646dfeb1sor8057705e9.4.2025.06.20.06.09.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eS7gpdbt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424968; x=1751029768; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ho90gmr9LBnf0X5r6n+/qD5b6A/rnGinNhmNB6fBLQ=;
        b=eS7gpdbt9jCyqjWnR4LOzf+ew3JCs1CO2pSS24XRJCJO4QCyqqqNURabGeGHS2uSCe
         xIPmtCebz1VXWuIf0vQhSqRn16bZSxi/lslgaG/DZz1EPlcAVrhL4/gyEt3r3wH/lSJx
         eT1QvBhN33K7x6oZYT6KkDmvS29pozxCpOafsPOaqkBp2OzAvNjLzz0lFAgYx35Qvh2j
         KAzefL+TTUZGUeWxsI9+Jmx2Jb85gzsoqpTPOMZs20lE6bbVtg1t4/7Q9yWoWZW4XLsB
         5o0MnLL3R4upRqUnjSwBArwOdu3BeS2oh3qCBPMC6j1gWD4cXI6TszLgqjwM8eaXhcjk
         agyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424968; x=1751029768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ho90gmr9LBnf0X5r6n+/qD5b6A/rnGinNhmNB6fBLQ=;
        b=OEqYM1zT3ubj1DVmDtNWujJ1W+ZJ8ntovPi7dGi8Kt5/8OWsEOCA3UEdo9lSgeq1UL
         hSMGoKW4t/FbSteofqRaWajeJEBfjxMnaJFjp1t5D56o7SX3OYClpNlHaeCyaDwF1uVF
         zvjnbUw9+x1vT7TMgWKrSlstgXC1z5BxjSXjaix3XfpuvJ7W4Koet4/B1Qnz/s4tMzFN
         l5rYb3QRhPtR94PaonS4c/bmP4heaC6og5UcIWr1hIAJI6ynxaMJwlKVC66QDheXQ2v6
         RSfvdUhYO2ool2sNoqOGQqi6t5p0V+ZimYS7HpEcKx/8W7J6Hf9qAuUzDae/ya/VLrD2
         WmqA==
X-Forwarded-Encrypted: i=1; AJvYcCU0X+JspETE9izKHbwk3J7oml4YI3egwMmDNXPq2hHLMoBdu3J1MAu4qYCWGYoditMafaBLOHOMhCzDCg==@linaro.org
X-Gm-Message-State: AOJu0Yz5I7oAu6K0MmgbyHFlz2hrFh+oyQ4UQXJ2V4ZYYwOua9kxzS2Y
	4enRXbookTzT7fbRaoUDwmLYq4WBHFBlPjwQ0Va0iySrQvIjFNuzBZ5b8U53uHyQyzXANQ==
X-Gm-Gg: ASbGncsKKkEhgVquiiQ2BbeyEHRzT0xnNi9vOmta7JeCyjLH28QMXapAeps56uU64vQ
	bOT97AcBi6W+xPPHn6NaXrO5qDWE+nxHacI0DTqy4iobWzxdlMv1Z7YsTYCaO+AeNEuMbLNMX2t
	gzYPaO6n8ZwrCs7DVWPe9ZvhTBZssa8xL7gIcA1i9rx0jB00d0YuE/j78ZwdzPlhYa2YdRyxt1v
	LziCzuXQOBR+lYIvO+c9NpoBrydJoE87q1zgZFBp9ydgQqOL8MGfbXKSMLj7kXffq+vkd0+HSTY
	r55xmIR8Uv/Uhox2hQrzS4P9aUfDvL81YhaGPKDhQ29rg1ZV/wAbadthZ994JqmGdKX/cXRMSrJ
	WpHPy8Bb+OOtU6ZNSFXhQqMYFrdkK30ZF+5u6
X-Google-Smtp-Source: AGHT+IGF8bB+qSx4ZvZXQLjUAOyAVozgjbRUMGz4uRoQ08Z1w2S6A2LTzrO9vB7Kb0AUvy301GjaBg==
X-Received: by 2002:a05:600c:4747:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-453659c0a51mr22550685e9.13.1750424968380;
        Fri, 20 Jun 2025 06:09:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190c9asm2073452f8f.93.2025.06.20.06.09.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 24/26] tests/functional: Require TCG to run Aarch64 imx8mp-evk test
Date: Fri, 20 Jun 2025 15:07:07 +0200
Message-ID: <20250620130709.31073-25-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: d8IPJoGm3rIB

The imx8mp-evk machine is only built when TCG is available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_imx8mp_evk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/test_aarch64_imx8mp_evk.py
index 638bf9e1310..99ddcdef835 100755
--- a/tests/functional/test_aarch64_imx8mp_evk.py
+++ b/tests/functional/test_aarch64_imx8mp_evk.py
@@ -49,6 +49,7 @@ def setUp(self):
                      self.DTB_OFFSET, self.DTB_SIZE)
 
     def test_aarch64_imx8mp_evk_usdhc(self):
+        self.require_accelerator("tcg")
         self.set_machine('imx8mp-evk')
         self.vm.set_console(console_index=1)
         self.vm.add_args('-m', '2G',
-- 
2.49.0
