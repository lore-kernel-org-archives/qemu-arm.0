Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510430dyb;
        Mon, 23 Jun 2025 05:21:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXj8Jv2IFCZ6+/jMoNSehFVkWCN/jH6COgKrGEl3cnXEx4FqZuYa/bGY8WWKPgRyPkevH0jKJ0H3kIYoQ==@linaro.org
X-Received: by 2002:a05:6000:2308:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a6d1325a45mr9830536f8f.52.1750681260813;
        Mon, 23 Jun 2025 05:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681260; cv=none;
        d=google.com; s=arc-20240605;
        b=kuUP6rfoag0lDHaMudRFA88sJ09n2+VfsTfl3qgaxJ1csu0MhlP7zQsgb0S222X9VA
         d4yop8ZcMH27j/PbIvWfQWIeXyrrMEAK0prU2cfyXMIl2S8gUeBUFP/WnB2637J/UJQ4
         Uk6Z1XLWUTITQazpnLoJwCpG4AhH71YQINkfMNk1rpn5p6ynGJSDE+Z6eJ0j6NytIRML
         MfsbnDUD4mLJIHgX8hFiXFnMegotzV344g/L7+PLF1Un9Hk1VmwdHMPUqntOvIRQRxDY
         ow8j51pDwcqclks/Tx+pGxNaUrxArKIQqutq7B7LhxOBGUtFGSfvaEN3FpoeGXmp/tBi
         RLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=udXllEXY1gPSi8pgPr+YWAsY2WGcZfddjVlJVNiCuOE=;
        fh=egEn7dwixqXaU+PHumaWZxIWRBiDnJDyDDSjl9U/L+E=;
        b=UIIEwVE7nlSpom8YEOLaK7J8C1e8z/Mza+sAlmY7DCsgHM3rFC6QSaiiAHwqkOVoyP
         LOQzk7NCN92FW4V4k6H1X41hmep7kufC5qExJhu7KrVOaxbJ7IH5E6UvX1spS17P11sr
         1DmR3mHUpvYEzqgt0vIlPmmUOGzFPWu0eWnn/bSDx4+aXKWnpq6Zj2a3lmEJdPGMAJYO
         6b4PS6j3ZHIgw0etLjkVEjihx2i7IigntEg4rgnv6drYcaROvn/RVo+UD4TnQmB5sK1x
         XjJJ5PcpYhqTDTccNmebxtzEhw5DtMv+O6NnAqPGGA9Jit0PIgnkQEtzrlY0laXL5Hyy
         /iZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IJAlvsu4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d1363b1csor2710623f8f.0.2025.06.23.05.21.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IJAlvsu4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681260; x=1751286060; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udXllEXY1gPSi8pgPr+YWAsY2WGcZfddjVlJVNiCuOE=;
        b=IJAlvsu4Yq1YaN36ghkG9EoQe0gtQiIaeYLWQUhLsVJcQlyOg3vACUlxI5k/1N3tVh
         RSEq19VeSgoU+8ziIx8LZ2v3U+z37O0m05SNrdjfhpp24LE3it9MCA7A2w4tKkvrc1OA
         kKngE+qAmhA5Fa9Q1Ge3O1XEsGoQh/WwIvcJ953MphpDgitzs6WYtJWfURxjBUcaTJmp
         wIzUIoMDx9/Hor6zd91k7qG9Ghhxw3u0++8T0OiwaeAjntYoRtWyhhQeNH0za0oCbLwG
         x+BoYFNCqohGYThR/wbRrYE+3+3eT7hudxA1NbIKRqDVvQTfvqcukmsgkZwgadCZ/UeE
         tNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681260; x=1751286060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udXllEXY1gPSi8pgPr+YWAsY2WGcZfddjVlJVNiCuOE=;
        b=Rc20j3Y0Q6ZmFae/M78PgcQJLXZTRtnGvNRbQ9Tml9g6dpBUafAHsonns1d4YwI2ul
         nmcP3AEg8B8zjldQcSXBD1V2mtogfNt5abvks/mCUDQvMNDUG68zOU0Zjik1hmieO1XV
         4+w2GmGO5BTDoNGFWT0Ii3sdSorRiWH0ffFQ963WKLgEBwex42aaD81gT1BGS5UBBnrF
         Hz/j6YymIGsHIXQo4ZUaHF5H40AOYJzEK2rP2b66Rl5DCz2H4K8AdKpYzu47WptIYHL3
         nmz97SPaobXsO0+SirqwAHxcR+MRrxQvdSD2p9xzVCUAR3wY0j4ok8HQWBZRqmD254vn
         XSYg==
X-Forwarded-Encrypted: i=1; AJvYcCVQX0NTsdUCvIG6OmxEnq5ZaX5rmzIYcxvpmbzj8RNAi7q3ZLmI2J4pKo/Z52YY+bjgTjqx5e6SP4GsJQ==@linaro.org
X-Gm-Message-State: AOJu0Yz+/PeXbtGWqGv2BBYfzQuMuPVhuRKky2adS3OFDdwTaAdscD53
	GsaAIsjDnZ3q8/MQ6NOvFTTrP56zYs61VkGb3nIIzaS2xBtX9iWWxIk/Ypq7SO4k41SVHA==
X-Gm-Gg: ASbGncucS7bgXjHyqKjdwKaztOFh4lNmOzOSdiL9pEpnZNWwEzcdKAlc4ytTtOh8kgX
	xO65SxEjkFd/2YUMWl1j/Wwx5ghFe2/r3V8QO02Ns+88G9pqLvN9kIWtpzoYibC2hNz+8bqWMfx
	LqhDCQZJxD1B43+KQLb0RpEjMGPAiAzvh57WPVFiwDfNMYd1qveFgv4QDZ+VZKJumx0O72iEKmk
	upefSPfIwLGdCSeHgtCWG0Kar7I25SR5zgD8WJFwz23fwW3l2yBeh1V2lvhao7Yw5h1FkNxIosE
	0Uvzm1DyS+YHSMQ1Gvr1lCa+FhtZxm3JaPtsQB5nVrF9pnp4jhOKwcImslfHEbsXZ4q8xiDpO3v
	VpA01BiYT19MGidmA75Kt5WTLk3HMaExcsqyc
X-Google-Smtp-Source: AGHT+IGSZgVi8a4ONdtjF7+uNRguyN8Xn3B71Lmx7xCfC5fcG/JmZoeL4oP6TQwKjqTxGU0oRlOa5A==
X-Received: by 2002:a05:6000:2d11:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a6d130707cmr5965156f8f.32.1750681260192;
        Mon, 23 Jun 2025 05:21:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0ec947fsm9340220f8f.0.2025.06.23.05.20.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 26/26] tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator
Date: Mon, 23 Jun 2025 14:18:45 +0200
Message-ID: <20250623121845.7214-27-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bCTf3tn0eUi9

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_smmu.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/test_aarch64_smmu.py
index c65d0f28178..e0f4a922176 100755
--- a/tests/functional/test_aarch64_smmu.py
+++ b/tests/functional/test_aarch64_smmu.py
@@ -17,7 +17,7 @@
 
 from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
 from qemu_test import BUILD_DIR
-from qemu.utils import kvm_available
+from qemu.utils import kvm_available, hvf_available
 
 
 class SMMU(LinuxKernelTest):
@@ -45,11 +45,17 @@ def set_up_boot(self, path):
         self.vm.add_args('-device', 'virtio-net,netdev=n1' + self.IOMMU_ADDON)
 
     def common_vm_setup(self, kernel, initrd, disk):
-        self.require_accelerator("kvm")
+        if hvf_available(self.qemu_bin):
+            accel = "hvf"
+        elif kvm_available(self.qemu_bin):
+            accel = "kvm"
+        else:
+            self.skipTest("Neither HVF nor KVM accelerator is available")
+        self.require_accelerator(accel)
         self.require_netdev('user')
         self.set_machine("virt")
         self.vm.add_args('-m', '1G')
-        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-accel", accel)
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "iommu=smmuv3")
         self.vm.add_args("-d", "guest_errors")
-- 
2.49.0
