Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h25-20020a17090634d900b00a46196a7faesm7416406ejb.57.2024.03.20.09.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:13:41 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 505025FB8B;
	Wed, 20 Mar 2024 16:13:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org (open list:SBSA-REF)
Subject: [PULL 4/5] tests/avocado: sbsa-ref: add Alpine tests for misc 'max' setup
Date: Wed, 20 Mar 2024 16:13:39 +0000
Message-Id: <20240320161340.391798-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240320161340.391798-1-alex.bennee@linaro.org>
References: <20240320161340.391798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YLDOUNZIfMJs

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

PAuth makes run timeout on CI so add tests using 'max' without it
and with impdef one.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240318-sbsa-ref-firmware-update-v3-3-1c33b995a538@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 259225f15f..cf8954d02e 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -140,18 +140,36 @@ def boot_alpine_linux(self, cpu):
     def test_sbsaref_alpine_linux_cortex_a57(self):
         """
         :avocado: tags=cpu:cortex-a57
+        :avocado: tags=os:linux
         """
         self.boot_alpine_linux("cortex-a57")
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
         :avocado: tags=cpu:neoverse-n1
+        :avocado: tags=os:linux
         """
         self.boot_alpine_linux("neoverse-n1")
 
+    def test_sbsaref_alpine_linux_max_pauth_off(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:linux
+        """
+        self.boot_alpine_linux("max,pauth=off")
+
+    def test_sbsaref_alpine_linux_max_pauth_impdef(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:linux
+        """
+        self.boot_alpine_linux("max,pauth-impdef=on")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
+        :avocado: tags=os:linux
         """
         self.boot_alpine_linux("max")
 
-- 
2.39.2
