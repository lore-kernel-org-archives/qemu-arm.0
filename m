Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b002c7b229b1basm4160135wrt.15.2023.03.18.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AD8971FFB8;
	Sat, 18 Mar 2023 11:46:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 01/31] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Sat, 18 Mar 2023 11:46:14 +0000
Message-Id: <20230318114644.1340899-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: af+D1TWQLy+Z

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

To test Alpine boot on SBSA-Ref target we need Alpine Linux
'standard' image as 'virt' one lacks kernel modules.

So to minimalize Avocado cache I move test to 'standard' image.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
Message-Id: <20230315174331.2959-2-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 25dab8dc00..a90dc6ff4b 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -38,11 +38,11 @@ def test_alpine_virt_tcg_gic_max(self):
         :avocado: tags=accel:tcg
         """
         iso_url = ('https://dl-cdn.alpinelinux.org/'
-                   'alpine/v3.16/releases/aarch64/'
-                   'alpine-virt-3.16.3-aarch64.iso')
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
 
         # Alpine use sha256 so I recalculated this myself
-        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
         iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
 
         self.vm.set_console()
@@ -65,7 +65,7 @@ def test_alpine_virt_tcg_gic_max(self):
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
         self.vm.launch()
-        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
+        self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
 
 
     def common_aarch64_virt(self, machine):
-- 
2.39.2
