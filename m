Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp879138njc;
        Fri, 20 Jun 2025 06:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaAusVE1ey7e3C+GuZrrJTuF3NhBFEBoLvXPFa1Lks7nD/QeuuNW26KMtZmFFwcdjJXmJqd6RELJSl1A==@linaro.org
X-Received: by 2002:a05:600c:871b:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-45365e3dfc0mr23253975e9.7.1750424980379;
        Fri, 20 Jun 2025 06:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424980; cv=none;
        d=google.com; s=arc-20240605;
        b=HQJn8+EaA6+osVAYp4JTmeSheOQFcLmSXwR3faNlz4mn7B026zzh/eKYKpmCIfyHqQ
         0LkEwM02+HyYL8BqXsN3pWG77u+V6iZgd1eyQh1MBVu5nCDRZiaFndq63dAx3QF17w2Q
         9rsYbG9uKxtmApB5ELWtlEyMEDOFgruT4xV9vjn9JgdgupO3Cxuj5o6uZMQW5fCRr2XC
         BY1/V9A4D6dr6YY06/F/nIt67kFD26tNV/3fSDWRThiGsEXvnqkKXlAf2z6OXj+ngFKA
         urVlgs2vxvlwiAFMtZYSl1YENddCePy3ybxtPqBdkVRdOL232O/Lk33UgN1YxQvv3ZbA
         32+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w6n2BSSxRh+KStXe1TUl7/blQoxrrxglxVgcpHIzilA=;
        fh=MlqdZkVcUKkw0O12bks8ReIiOrLZk4yzhA1RfXob17c=;
        b=d3WpKPVBaZ/FGDuO3V9y5Pm+Xwe5TuQoM9lgDjJWGOQA5uHH54m/fzBg8qDvxCiPtH
         rDj4KgLjHjTqphlC4OV2x8UxAghGddm31wKRFH21jx9m1Qrrjyjre3i/Anetyf9hejWt
         t1R4gPEY8WtkyteVUbKuZtLC562EYDh4XbwmREWpTSdqjUf+qunm9FqIcLyl+WR352yR
         eFuWxRr0Pyhq1sgn5Y0eWUI4SEgcJ1HqPG69JPycCrA1oL8P4dMpEtnlW+LPY74Eeq/F
         QCszM3HOvitnrffRSGqFHmWZyvHAQxVjPz0FzHT2dIjqTaobgDeFSgPuGEht9G9FxUOz
         q6NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UI1Bim2L;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4535efbb401sor14672005e9.5.2025.06.20.06.09.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UI1Bim2L;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424980; x=1751029780; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6n2BSSxRh+KStXe1TUl7/blQoxrrxglxVgcpHIzilA=;
        b=UI1Bim2LmjtMwrIcD7r4sJb9GS+s2R0dDVHTE7eQtdp9ZAbkc2k4pualumRvu2wZg1
         2a3Yfy2Mrf+EqiDZ0CjuFvvssjC/bMQqJ6t/u//E46ggsVtKas5G2j44dxnL+BXEqG1T
         hSTHAvefTXA1P2LmEjzFVN0AXeMdq80g4DUv1UIF92+cqJ+Oj6FlRaimOuQrfSseFsCO
         /J/Fy3P85iM/a5Qj7U+G44rXvjFkAWVtZaLNpLT5xO2XvpkHAjR6k5Tmt3f0XUwOmCZD
         RAAJIFL/I18VbmI14e3owU6jCqE1lr1p8pEmLa7MApxHjqKLghPUIfaZZOJGBqLpAOGw
         quhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424980; x=1751029780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6n2BSSxRh+KStXe1TUl7/blQoxrrxglxVgcpHIzilA=;
        b=qGFQCpxHVkKUP871n95ggCFtByaj6gFgD4HrP6e6E7oRFrC1Ul/NjytjlqbKxb4K05
         UHXfcN4RhRXqTn2dQc9CXCsQRFagNNLnChRRdVOs+og3tKAnO1IvM3YYc1LnUEhoZXrI
         b4SDxOoftL8Akt/EM+FVapuQvGhLL5Isuj7yknom0HNncchwJgmV8Ii6OKU3H1on8FcJ
         E0vnk7a6C5SELcgYY33m65eipdCWtTKDnOsU9QrnUtgZdlYNINm6cbaJt+uh21DZ7oEA
         h9argtzUD7r9i/e5bIByzjOX3s+dEUG0KBBbOTU5ntiGRi6b31v0rB3SosTCnYYphv0p
         F2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWHOnSZ8ZIuzFLrcyQYMSN4tZIofdWiTk1yNb7zpjjJtOimYUu5m1XWupdhvxbnVy21mUj7D5NCyU4v0Q==@linaro.org
X-Gm-Message-State: AOJu0Yy7JKLR/0B45TV3s7MjbNH4/61GXnYHc7Pw4RYNIgEXOcYFCjOy
	LoALkSj5eWjmANxSHY8WVbnknNUF1f0KwaPqE1pZPchz9A1Se4TMmGcJYcENXvltOwvQXQ==
X-Gm-Gg: ASbGncs/AC/7m0PfpZspb3twidtwqUce/VM1BCYU/CD9or80zPva8VScVcGQhg47P6v
	CpAS7tvYSVRCTjVPJ0UyRfAUgZCSCNdYQsd51xIGcV/+sq8NH4vFu7U8vQr7R2m98zE5uCVf8iu
	l/3v9H+D9N7V3KSbkj2RM61AhDAnxsXrAZtZs6f+y+uQPAT9KRlFwxRihGYqKPDq6X9rJzX1rIO
	hECyCp9KZiTwmsk82U1toQEEVLPHCn+WrqKuQQGJqywjG7aUACje4mRpMJvv1JqSYphxMR1IK7O
	C3ffe+hrtuHYQyLhlDfa3YH/IL44krZ2f3jP+wrMw/6uOgZTfkdG81o0ngLwg/r28kRQ2EExnbn
	SaytjZ14Q4xpSduU3xCJFigo6zEj4TAXot24t
X-Google-Smtp-Source: AGHT+IGXwFQFfwW7rAMovUtfDAuB9Dz2J3aZxTUZqf2DF7gPQ8T5LAmGCEyFfgo/pTiyQMieyUC1PQ==
X-Received: by 2002:a05:6000:26c8:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a6d27e16f5mr2027646f8f.19.1750424979716;
        Fri, 20 Jun 2025 06:09:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1188804sm2015800f8f.79.2025.06.20.06.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:39 -0700 (PDT)
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
Subject: [PATCH v2 26/26] tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator
Date: Fri, 20 Jun 2025 15:07:09 +0200
Message-ID: <20250620130709.31073-27-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kw1CvXy7cGZP

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_smmu.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/test_aarch64_smmu.py
index c65d0f28178..59b62a55a9e 100755
--- a/tests/functional/test_aarch64_smmu.py
+++ b/tests/functional/test_aarch64_smmu.py
@@ -22,6 +22,7 @@
 
 class SMMU(LinuxKernelTest):
 
+    accel = 'kvm'
     default_kernel_params = ('earlyprintk=pl011,0x9000000 no_timer_check '
                              'printk.time=1 rd_NO_PLYMOUTH net.ifnames=0 '
                              'console=ttyAMA0 rd.rescue')
@@ -45,11 +46,11 @@ def set_up_boot(self, path):
         self.vm.add_args('-device', 'virtio-net,netdev=n1' + self.IOMMU_ADDON)
 
     def common_vm_setup(self, kernel, initrd, disk):
-        self.require_accelerator("kvm")
+        self.require_accelerator(self.accel)
         self.require_netdev('user')
         self.set_machine("virt")
         self.vm.add_args('-m', '1G')
-        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-accel", self.accel)
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "iommu=smmuv3")
         self.vm.add_args("-d", "guest_errors")
@@ -201,5 +202,9 @@ def test_smmu_ril_nostrict(self):
         self.run_and_check(self.F33_FILENAME, self.F33_HSUM)
 
 
+class SMMU_HVF(SMMU):
+    accel = 'hvf'
+
+
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.49.0
