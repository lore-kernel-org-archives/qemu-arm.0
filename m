Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253339njc;
        Thu, 19 Jun 2025 06:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1pZERX0Ipxup0alRL9Zxq1qJ0uN543BwV727ts+Sbz9mJj9xkTyQ18JcycnXFwzTgGmfwJWti7h1Lfg==@linaro.org
X-Received: by 2002:a05:600c:1c28:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4533cb4bc8fmr168632695e9.22.1750338893089;
        Thu, 19 Jun 2025 06:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338893; cv=none;
        d=google.com; s=arc-20240605;
        b=UmI7CP3e6aZQ1PgP2wRnI+pifOoSwNiP32K8V0FKeWxqY3KWzazA+EkQz9uMIMOuFu
         J1BlLj8mB3FHJxKLDZ6IoSg3DaiUoiTCIZTQvliX4Ad8ndtXB9S7qOMBLNahIHI2DSVv
         FSMWVfcIPDIIhfHAtYxLMPMaESL0nOYelVx1J/zOcxqGIu7KrBKPH4f7+EBC5x51eEhX
         UQnJftVdutPUQwtiBvpFwMqqi2kJ42K24Joh32iTa6YO6v/mFH46krO5yC3LITApq2hz
         TXbaQ+M7qA5ZuxfQppDD7WPS5iBtI2uYtD0xVlCGVfRMkApAoJtQa9PN7J5QxPaTzGyA
         3dgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        fh=GqMC3pFYk/yuAKZ3TquFSSY0EIHiEIm1yEc8P3E8q3Y=;
        b=K63Ah1e/ODuUraUrg/hkBZcFFe7UZaGTNanilv6yJTYlMBYPG7vsNLLnBAS2HMd8rj
         HLzx2kK/5ql7+xmEGUAjJMO0pgiqIZp08ex+XclGN3I1MXjxIbiAXhERLSB1xL5HNmAh
         FEbdV8HZgNIQ1DrrNcs2pBoGqI+2Y7jQ0TObDCtW7PKifN2x/wZqNvVFeB5zDD4eOh1x
         gsbKAVIZwSUEfepKmutdXS/UV7D6q+m34WhyltqJOL2n/fR+THpR0bIWNro4M6/NczlH
         NCxlugvoomP5/XWaAs2anpilDT7jwuK8PpgdkCe1Rmr+6qVKNS5PhPGbSqT7lKUtsA5o
         P3Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPBlYwTX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a56196dba2sor5444244f8f.1.2025.06.19.06.14.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPBlYwTX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338892; x=1750943692; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        b=uPBlYwTX/iwbytikOavRsyvjoa6Fi6jK3AqDEkifFmzlTS+kbIhdgsnOy4t8VTaobs
         wmre3q+pwGFq5sLH6jC+gKm+FnTQrofBVdsoj7z4GtNzIdVeJ2S0HDXhyeea83JPP1hU
         qNmDaMEBe625bY2FPwmRF4TaqlDiv6PPqzEBweiyXthgAORbvei4HIQDIY8FuRc3rM9N
         sDuHqVXDpxmryizNwPJnR9zkbBDOOrVlsgFZMfrrinnr/qlpiTskze6IxZ2xrjZkVtSH
         io7nVCnEudxoa9QfYU8PwLafrEclhTCnBaJK0PP8tNDU9j7+lwaiCRG4kPQtvD2p6Bvv
         cHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338892; x=1750943692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        b=GwxPLnWiz28jCW3Wlyhz+RFrjVhIceDa0Blr++vIyUJplsFxT6vkadgacGz8AnJnyh
         TdBPGUmBEIPhgl1xA0NHGddiZnU2o1Y4fO8shzrPivNb/Jd2WKIlc5Plj6jw99YuHaHb
         JD5tHpHrQazE9UZEjsIw/4Au0vY6dAijS6k6AphPVAtId3cpbfiDqk+i17bHip7GpPy3
         3+MmB5I0PnBUd6CAFPXkmEuGtZv9VCBVYObDlXoBHS5SEDxoMyr2K+b7To7/4Y37Q1md
         BI1M7YhUXU7bptJ4RRhoUnW9QNef6g/Iz6kzvYZOj6FNzLZKxsf3+F5IVvWLinzAG89F
         9qhg==
X-Forwarded-Encrypted: i=1; AJvYcCVFkp0K8qtNNbP9Acv+d2dubFlE0Mt7OEkInFlnj4b/LXJIOapFi5ZU06HCAh0kMF5YBidbkc/MkH2vRQ==@linaro.org
X-Gm-Message-State: AOJu0YyxO8TwQuiZ3rOzhLpuPZ/KGJ6Xzks8+oKhd9kS1GQouwY0QhM8
	ELAtSjZ+uTObLq4TOIvl4/DjDXjApu25z/siFob119tVB3zfcfcohMMZfJlARTAaCqJ4Xg==
X-Gm-Gg: ASbGnctcvt5szI4dpwTCH+TDhmOGEj8UDYHVoDrTNqGEKeyOXpEJ7UNU1LYtDg8hDxT
	CS7EZGHibWmqDRUL1J9OdNHxO4jmrjnrXM92hCgrdMFwpiR9Ft5vRLUA1EP/spJEqvBeikZ02mh
	j9wlDCcYJ3oaJ9v7QPu96wcVjTpCSG7a9ypnop86ShEQ88iu4ryjqgUpRZSrTw2VHvshiTU3hIH
	XOHQdaTvw5AsyhCEoTb2JFTzbvBYJ8uIlNz9OBsL/VBzMnwTTbxaVxoXpjRxcVz4LGkjmBg0WkX
	nF1r+LYYGY6UkQdBDp7kPUgm6rwlx6qsk0IfRDLUSWM5c+51OGV3TeQU0g/4nIHiPPFUesms//Q
	3kutw2201ZOgSi2SHmFPhSykDI/l/3+P3L22i
X-Google-Smtp-Source: AGHT+IFRzQ9UxBLRQDMQufclV3QAFXCf4Tt17IF9sdJksupv+14Rk4NJ6wBb4VS4a8pKINqsmbco+Q==
X-Received: by 2002:a5d:64ce:0:b0:3a3:6b07:20a1 with SMTP id ffacd0b85a97d-3a572e8c1dfmr16026113f8f.40.1750338892503;
        Thu, 19 Jun 2025 06:14:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08a2bsm19821758f8f.62.2025.06.19.06.14.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:51 -0700 (PDT)
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
Subject: [PATCH 17/20] hw/arm/virt: Only require TCG || QTest to use virtualization extension
Date: Thu, 19 Jun 2025 15:13:16 +0200
Message-ID: <20250619131319.47301-18-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oAMFGHmwkvbm

We can not start in EL2 / EL3 with anything but TCG (or QTest);
whether KVM or HVF are used is not relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b49d8579161..a9099570faa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2210,7 +2210,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.49.0
