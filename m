Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253516njc;
        Thu, 19 Jun 2025 06:15:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZEN6CN4sl2mQW4tWQgd/ckIrtZ205b1raGSqrbpDlaAMaJ02txhJnshN1pHLE/93jC2z/jHt21XLXkA==@linaro.org
X-Received: by 2002:a05:6000:2209:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3a6c96cd6e5mr3067001f8f.12.1750338908536;
        Thu, 19 Jun 2025 06:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338908; cv=none;
        d=google.com; s=arc-20240605;
        b=L349Ul7s4fteJhL5toDHbpS/iQtq4RfOGZbcbj5k4EKfeEOH8O2fv0B/QE+dtHjLiw
         RrUsMh5Am7Z/AumfB7xN1CyZHvl2T0nDslTwHE9TFtcOvZPzTaxhtV+i+b6AyQQanYs6
         k7iGVRCdbYKUob6VldF1G9Eiw76mX69Ks0oq8eWGf5/psQcSpk6snVFzLSRoT6DDqGZ7
         53yI9h4131dnSq1OMCTx8sd4D1RNOKng2CYUi4AjUpETjYRCJsVCib3ZNGpIaZc/N5vD
         tdGrn0HXHYMvXfgYpGF8I5oVgY+49c/qRd0O4x7v88Zd1Zc9bClWJCJyok9HU/4S2zEn
         6mDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yfbZh25j/JWcO06w+c80OaMwV9tGFnS1KSANu6xFbyE=;
        fh=5aMBti8fJM8P3jVtRKu7n2tAZScmCAUCOPzBuzMT5l0=;
        b=JxI41uyOJI/DBIaIe8zOgVi14ryVeCPKIxhFzFVQ4prMvZ4iVYSmZGrNAaTvJhbF8W
         sz0nyUX65ebN1Mtz+vMWjbe4Gssv/ft+M3pH7k9OMibMZyoogsQTpp04fE1V4PTVUvLU
         f1l4m6i6pdQRtOC3m7lG17+uTLYp/RG26cSa/kTSIIR48lij8r0o7EAZlNRMXWPYqvxH
         2+BnyFqxAgAYjAdV+lzNHOTiJeFMfwC502qK/j1yLI198tYNAYUwIkFBaOaTb7hEzMv7
         g5swSyjK6Bev0AH+5bxUxbekxFNjT1jgaNHXipzcrAiDMT/X3w/a85JbbcPMRjWLkC0C
         TJDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElbIbaF0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6c9629239sor613240f8f.5.2025.06.19.06.15.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ElbIbaF0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338908; x=1750943708; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfbZh25j/JWcO06w+c80OaMwV9tGFnS1KSANu6xFbyE=;
        b=ElbIbaF0fBpBfbDyUiZzsZxjLuxMa2qMJ0YC/s+lVkhC539pmEuSxp6ROmWtVb1XFK
         BNyU6Wa9rjwXnTI1mkZ5m47/pFuS40fIXzU91q4O8Gv7A/YWfJkwwdaKv+0+jY8xk6Uc
         P1f2wyLgI2ly/ek6oqItciDil2bckDXgrKfo3ptuTV2eSkdRr9QhiJsSw67mvXD9MS1R
         OPWXRDEBTLc/M3KWSo2wjtMCgmxMwpiV2F2yLpU1PN5CoqkZ/ROpBbXF1dEjLtCmfnEJ
         HR2fQmslKtOl4A2qkqhsnXicI7imd7KMFoFkA0VmdZyvMjjJ55ubc2+kMROcE6KyB7xw
         Ui8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338908; x=1750943708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfbZh25j/JWcO06w+c80OaMwV9tGFnS1KSANu6xFbyE=;
        b=Gp71BOrFfZfEkOFL7ycOHuynePIHrmx5BGn1xf1afND55MZMxK3hHIsRyXxftFbLMz
         zD91+XpAg5VFcwAZqF4eIHe8luMjV7oSlqOdWrqpmrdeUroyN1ik5FzyxFsvFZslEy3y
         oQjkK3uhsEEHvsJCSErfAI7cEXxVh/f/F/1fNH7OZ7GMuEJwV4jczpBBHfYrq83DQZTF
         0yjBta5z8pI1R/85A6qkJpDT7/cENKDZsjjaXDbR8WltnajhiXTEb7ctS5N4eMWMSiPt
         dn2kwfTigWizbuwN0XzWZ/u+s60m4/XMqcmg595woFd7Wl1P5aMXlCCVgQ85rsVEVhOk
         +7wA==
X-Forwarded-Encrypted: i=1; AJvYcCXJb6acIh4I70LJJrsnAmWufA+Ja5lkwOBe9bHuvbZzgbxVTupnumAVeGVYkcjIT/Q7nVzJYPwA5w92VA==@linaro.org
X-Gm-Message-State: AOJu0Yyswx+/dE/yONp5pvUfxV93bxsi1m5danAoD6QM49frzYCkpCf9
	/K01FuoU1+d6Y8PeJCFX3LTVK0gsn6/nZrdNnuYQI7wJvLsQf8m964jD7PIC18w4wHvotw==
X-Gm-Gg: ASbGncsG4rPGX4VplnEGsvnbLS5zxWcvu05OghVsbCyvuhxNmeHlnKHHHN2ljJ0Z0YL
	rkF2OZUHyabO0/GcBkmjmyLUexcmP2O5O3eD3XXQwPh+cNjnXAbvDXUX8cuI3+MV8pzLIoACm9b
	b2IMGEo8Mggk5A+n487ua+9LiVXbXLdl53AupSmTn9FbvbkRuRjI8G2FP1X7boU0vKbXuLuNswY
	la5M1zr9YSWZ5lIXe8dDuGfnxYylFecRukw3R9ktNU5dTKirW2jxI1N7a7GieG81mrr5c3i57uL
	7oprvpqFuNb9TsQhAyhyB8rsLsHbQsDRQRI2s0ehodMKqtZ/GgcsNue7xj84w2pcUzKxQhLLCU1
	+Y2WkMFGmJv7f7HiHqb1yOCfZHP9w9azR0K53
X-Google-Smtp-Source: AGHT+IFW6hA3yAKdFTUe8EEI5kic43ZIITMi78xKgEZunkyJSkx0t16xPuunedGwf+ZaxjadES0vkQ==
X-Received: by 2002:a05:6000:648:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a6c96c102bmr2506122f8f.16.1750338907890;
        Thu, 19 Jun 2025 06:15:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2f80asm19552864f8f.78.2025.06.19.06.15.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:15:07 -0700 (PDT)
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
Subject: [PATCH 20/20] tests/functional/sbsa-ref: Move where machine type is set
Date: Thu, 19 Jun 2025 15:13:19 +0200
Message-ID: <20250619131319.47301-21-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GJtPFx/btA9/

fetch_firmware() is only about fetching firmware.
Set the machine type in test_sbsaref_edk2_firmware().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_sbsaref.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
index e6a55aecfac..5536ec622e6 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -40,7 +40,6 @@ def fetch_firmware(test):
         with open(path, "ab+") as fd:
             fd.truncate(256 << 20)  # Expand volumes to 256MiB
 
-    test.set_machine('sbsa-ref')
     test.vm.set_console()
     test.vm.add_args(
         "-drive", f"if=pflash,file={fs0_path},format=raw",
@@ -70,6 +69,7 @@ def test_sbsaref_edk2_firmware(self):
 
         fetch_firmware(self)
 
+        self.set_machine('sbsa-ref')
         self.vm.add_args('-cpu', 'cortex-a57')
         self.vm.launch()
 
-- 
2.49.0
