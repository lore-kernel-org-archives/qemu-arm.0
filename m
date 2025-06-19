Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252894njc;
        Thu, 19 Jun 2025 06:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGAsn+V9jVJ0JHwtS8Ry4BQdDNV9y4mdP50XaQC60O3UodVvzsZhkMuNIAod6Db5LCGM3RZXhDiyBneA==@linaro.org
X-Received: by 2002:a05:6000:188b:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3a572e79551mr17401470f8f.40.1750338851351;
        Thu, 19 Jun 2025 06:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338851; cv=none;
        d=google.com; s=arc-20240605;
        b=CTMZbzpMQ8yum3a8plpbHfQWENxDaPwcZzv9neYpagc29SYKGqrZQlBXWD5CaPESYM
         MsYoUemOI/uBi3Lsibu/Digmn5zIFGN/Kgrku4s08weAXED46jShx9ysmUQp373MLtlj
         QvcVKC/GrCrLpR9AE57KkGNYC9ySLlg0fjev0BhtOidzPXUEvXaMhxYYwTYTo6bKE6h5
         J5/YwdzDo1ioTVdAwnewpr3+ONcaUkuplKEiafwrj1wLaXE1BAPbXNMp2nXabrVgo55z
         LaH0aoQqFpr/BCjBpvzuNKIb3dnCLN6wbY+lNgVuvfQjJXwn8BIDfFaU7dmVdZJtgfTi
         +Hpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z/Q0SIuMdB5kC3di/CRNsGxXg4ReG9T7xi6w1cajMnM=;
        fh=pXMaJc2edpHgqAtLGNHsLmBH3c7y/ValXaeyKHY20dg=;
        b=CUiqD7DI4y68yp0+PqI9FhiDu0wqAKhyBBtkyuoDYJtU8jCyfCINGG2SF4yzOuDvSo
         YH8do3tme6tLvATig7nsYFccX9dIRbVbJ0OWMJVMsfgaH2O1ZRyHG6QdnRPpcjDPypNK
         pYgtLwcv8oc9k0se8KMJrbjKL06Vua5vGrn6vxkqlV8IKuIdr0TvjsTF3kD7P66lv8yg
         nDDJ58ek1Qd5ZMw9D1xeNYati8vZk3/ENX022E2NrslCBE0CvqbKo3PW/R5zvdEmyaBo
         +tSnRSN9IsZm7qXr1e3UhQal9EhyzDHQs3fN1+ZGtZZ34mtxrD9Zc9Ssu35aA8bW/oDv
         Rp1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7zWUx7F;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5619762c5sor5973796f8f.1.2025.06.19.06.14.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7zWUx7F;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338851; x=1750943651; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Q0SIuMdB5kC3di/CRNsGxXg4ReG9T7xi6w1cajMnM=;
        b=w7zWUx7FbaDjLIJgMpC8ycjbiH72epYcDQLFsg8Z/zuvTXPAnThvbg6pMwUgKsYZld
         kcN3zoofFhfceLyiwdrSkC2q4E7AaSoluSie2ub6yM4Sm9GuAy13FhkXY5OehHiSlhrf
         mnl5uhYE/MT7zNSLR952DCKJ1Yx9uq9aKzWgNNLSOw05RpoImNzA3h32hi6Y4fXSML6v
         rxkBGUUfFP/MrFfbsZa16+gka5AUJE/etg1UH+1CT0MKRm1Cs+KVo7V2lSxlOgVLCtwW
         N9c2SGZbb/x8TS2Gi50tBP497iyVfZzHKR8UViXzcr2csmQpS6TNgLjcE+Wo8ag86oKn
         l9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338851; x=1750943651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Q0SIuMdB5kC3di/CRNsGxXg4ReG9T7xi6w1cajMnM=;
        b=BTIcpy1T5tiTe0UZHTDsYbUkQM0KmD84wYX/PJ/Tb3x2w+sz9y3JnJVAIAkwQDdAAk
         jqyiIZL0nsPY/YsBKJllU/IDtHhVClj0qNBK29TnXFsXhDQsTYIJz5R+WuieXu2z9dqa
         Smnvtip4dYhd6CR0pLMGXNJJlKikhTDqOCpZElr0JCnD5cTSle6+yd+30mO2aGq7LbsO
         Abw2uZv5TTUgik51VwvQtO1DnG1cz2AndzqNYN/nVPNxTdX0Cr6TOfD4GLjy/4DaLecz
         5D/NEATs40zl6PWwLojn+6lQ0vpK49fUePcFu3qTcoM5hFsqyCLnXSmQToCUfU23+F8B
         DMmw==
X-Forwarded-Encrypted: i=1; AJvYcCVzdndruR4EyQaLZb0PZqCBg5MN9NVED34FriIUP+wG79VlQsj1Vcb4g3WEN7MB7hiV5XRsupFSiogh9g==@linaro.org
X-Gm-Message-State: AOJu0Yx7DZz77RtcsBgA/uML7ySLfJp/K8t1cKofOZoJX93uCmIzFZLX
	LKjAUZxJrxLXt4o83lvblKYQHx9J5P0UPxuTK6KmXZqKpxzPRL8zlp3/OopGLD3FGH21/Q==
X-Gm-Gg: ASbGncsFG85ke2lMWe5js6qALsqk44JKGQTO46YgbuKCJ32dItWhsmu7nYhG6VNhH6e
	Qz8SnTAP/NpLOxU4/UwnLQcpGfqPGN+ofwYl/qAHEaS2Rx+VdMDKdp0shA/8shq6UlH8Ip+O0nS
	3ej53BUfUZik6nsMFTN7J4htA6gUFXtlCEfELIPmDRdHHhNR5g2pu7wQNrcAq3Invmq7q3O+H+l
	knAm8U1krfEO7Z+RhPqcNGA/L+sYowndWchtCHfaftFUiaqsA/eeZGUgje8ijYai7quNIXdVA2r
	J8QgVw8OFAmXoaQ8+ZWlQ9uLmElZyjZQOy+IfvBaB8r874yuv3uq44gxdWo/n8OLvGO/LPvWLy1
	Tc/n9PuDMGEhlYPbRKbHB3qKlvkvdpFcq556+
X-Google-Smtp-Source: AGHT+IEMesaFDUXPkq9vBoDM2hPTxmREKnLlDZqzwkocsesMeu1920AjGfkyio/UWMmuivmVqCXHzw==
X-Received: by 2002:a05:6000:18a5:b0:3a4:fbaf:664a with SMTP id ffacd0b85a97d-3a572e6ba5bmr17438618f8f.29.1750338850782;
        Thu, 19 Jun 2025 06:14:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45360b1ffacsm14079235e9.36.2025.06.19.06.14.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:10 -0700 (PDT)
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
Subject: [PATCH 09/20] target/arm/hvf: Correct dtb_compatible value
Date: Thu, 19 Jun 2025 15:13:08 +0200
Message-ID: <20250619131319.47301-10-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KIy+1CZMfsRM

Linux kernel knows how to parse "arm,armv8", not "arm,arm-v8".

Fixes: 585df85efea ("hvf: arm: Implement -cpu host")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ccdadce4766..1fbfdaed59f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -879,7 +879,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_exit_t *exit;
     int i;
 
-    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->dtb_compatible = "arm,armv8";
     ahcf->features = (1ULL << ARM_FEATURE_V8) |
                      (1ULL << ARM_FEATURE_NEON) |
                      (1ULL << ARM_FEATURE_AARCH64) |
-- 
2.49.0
