Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253284njc;
        Thu, 19 Jun 2025 06:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4qCMYVvl9QM8JBn5VHcGsXWSAS6XcKjyXcBEJJ9gpE212kKg9yzATziCwLcd7DDkeOkkM+Vx3ahP9Ng==@linaro.org
X-Received: by 2002:a05:600c:c48f:b0:453:9bf:6f7c with SMTP id 5b1f17b1804b1-4533ca654b7mr217071645e9.9.1750338887876;
        Thu, 19 Jun 2025 06:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338887; cv=none;
        d=google.com; s=arc-20240605;
        b=XG4SwsePgMU9d4UR6IofyYEXyjsPPRwDNWrWiZK+KjdCkmZE8Ob7of1RnpgK7wxgYd
         Fo5AOhhjOgdFbG20mduv5x7ps1GFcvBiyRXEYzwhmOWCDjrcx+hBjo0at+R3THrB0wee
         wALaokAqLhawGvocZH6uv6iGZClte4c0JDq5O3nAByQC0T0R6U/LuOr9KzEGPZye62nw
         ZyYgNNSrcTiyodCVg9r/2MSvbha3rzvU7/jzjdMLogR+nBZkAvidKOG9iWoH0140wNuP
         Pm8yBXSrntDHu83L/yPULouQOzEIfHj8yi7EQGsl9ytIfOi9C9EF0RYq6/M53gsLdRMs
         G/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qEhVLrdb7gQcxLJ9m8XmAJvi0CaJW+OAP6dVQwdaX2k=;
        fh=SCNvECtkXuuRRah0ppHuqphuLp3ZnZinKfu00ZtklVQ=;
        b=fL+CTMNtU6gwHkPwZn2MFLhEtjiNKSVv9lRhO2rmfXBy8kjtpNBMYXRAQIbGAST/zq
         Q17M3uJHNKAn0jqcJPrWA6wNw00gELE6d/OT8bnUhbpzhy+hRKoW7+neSqlBwdRQbY9g
         t4wUDWf0OfYRQyD6Xu01BV7ldDX7PEM5npFDrzPzOgdZMVWYhbGdFKPCCo6AhMxnYmxp
         rdBoTXIXsgsGE81r3E5Q3cd5tuk/j7zr3+1lgC2kxQ4yl+8NL0/UOk9y/JxeYFbuQ5Wx
         lGHD1GONEkKAM1c9ejuGrXKfS+6iGVEQ1Xlux4yENBopILZaX1xE0EyPAXyVGEFt7yNi
         z37g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8gvyRbo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5619e21f4sor5793690f8f.6.2025.06.19.06.14.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8gvyRbo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338887; x=1750943687; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEhVLrdb7gQcxLJ9m8XmAJvi0CaJW+OAP6dVQwdaX2k=;
        b=Z8gvyRboGLia22Gns+eJIgtoQ4l6dDiumqALMFjU/xklWhX1M7kra9W/Tc/sx2uGAk
         zRhc0k7KBknhaUbJPGMGV44DqrotMtnuYuZcEGwMzw4bCw6c6jTJpqtTt3ZM7JH9nxxs
         Oz3xN0Fi/jeJvYHTfBtEghgdSGeAHFf+x3V3iazq3FuQDiHhhOdmj+d6nxOI3OgLNNIx
         vhDq+kXDdWx8Tk0gVvyApRMKiGBroq/Qd46fYSehwkOpKEItF/C74OyZ1MJP7kVyQKzY
         5+KHSP83cGnxPUWTlm9EsnQB962gWmSmTS73fqGJqhR2NEj3wb2ARhnvjqhTe8gzfMnj
         HTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338887; x=1750943687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEhVLrdb7gQcxLJ9m8XmAJvi0CaJW+OAP6dVQwdaX2k=;
        b=M9awiXJVncuFTZw7Vn7cZ9dEMpG1zJumOpcRwVHgWXYaCBR9RXl7IO+mfE5uuJtgHz
         55hOQsdT70n5O6mnBjmLKv4+OQqJdefKMFfgLNA9is/tIBIQqWqffot4VntseugXmyzF
         w86c4N2oaSWUdpzqIRZRLRNoWEcS3xhp73F5UyVvR6y3gKa9Jz+DUNcrxay3lmTVgeaM
         nWEX+Q8nNxLRqfwGbCczMf3oGvxTWvjAP2huyAk9rVwQ09NDA9pOrICjrRbKTjDrBTK1
         yrGKhXon/mZU1/uTu9CPipO/mxTy/vitMEh3X6X4L5SEfNQLZP7aVNQY4jVlShhBV513
         UETw==
X-Forwarded-Encrypted: i=1; AJvYcCUMRqNTgpyTjfelAH1G3Fp5odRz6FrzbcUK/EIQ0RYPKXlKB16czyFiwIjHj+mf1CGAoHniwfIYL8cBKg==@linaro.org
X-Gm-Message-State: AOJu0YwbcBHkCtHE3czD0t+x/EuMLc6ghCHCKOkBofTs3xHcVurmnAp/
	73BNiU4fv3v0aCmZaunrKS9cF1CMcZhvWTUYtXl3Pqv+p+lksDDVKNbpTFKp7ydwHCSfgA==
X-Gm-Gg: ASbGncuivAYUwZ3dkQONnCLcn3XIRtUZphmnI3icKiIe6ONEMWp9Y22PpRy/grb7Jw8
	74eX3LTJcOnOnw0mkY14hHTc4yeN/WlNDc/6MWyw2STr5wL79DE+fd+/qUULtQEwRCVNMWamwb9
	N103l86NEuSjrV5DhFqU0IZODWi18TY2nAD+azPZduWYREAT8Brm7Dg1YsSvMdyyooAOocUsacs
	C1xjskEbj0ixysakKT5r2ufv9y7kwFc7TWqoIZKMnsc8U+VEIx91HKWWWoWO/q6rcQdHGBL4bAw
	Y4PZU1rYq724TTcW0/mc6oBwYhd9PEnc0PtZWGqPGfpg20vPKXvyWevIKmnPbPD4T4cqSZSHJR7
	uDQDMiNnHp4fikx4tQ+CgDsLVfYBqG5N/6mvu
X-Google-Smtp-Source: AGHT+IFYyws/hie04Gs7cz38N8DD6RmjvKvx7LAHAf6xXnGxdc9ttG/TDPs6rEuwn9zHE+u/jqYJ/g==
X-Received: by 2002:a05:6000:18ac:b0:3a4:f6fe:5244 with SMTP id ffacd0b85a97d-3a572367b13mr17405974f8f.12.1750338887297;
        Thu, 19 Jun 2025 06:14:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b3c0d3sm19567460f8f.79.2025.06.19.06.14.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:46 -0700 (PDT)
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
Subject: [PATCH 16/20] hw/arm/virt: Only require TCG || QTest to use TrustZone
Date: Thu, 19 Jun 2025 15:13:15 +0200
Message-ID: <20250619131319.47301-17-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MOM+9dhO2YbI

We only need TCG (or QTest) to use TrustZone, whether
KVM or HVF are used is not relevant.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99fde5836c9..b49d8579161 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2203,7 +2203,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
+    if (vms->secure && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
                      current_accel_name());
-- 
2.49.0
