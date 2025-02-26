Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba57145esm22493425e9.30.2025.02.26.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 38416603F4;
	Wed, 26 Feb 2025 14:03:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 13/25] tests/tcg: fix constraints in test-i386-adcox
Date: Wed, 26 Feb 2025 14:03:31 +0000
Message-Id: <20250226140343.3907080-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JwrEviz6fPwA

Clang complains:

  clang -O2 -m64 -mcx16 /home/alex/lsrc/qemu.git/tests/tcg/i386/test-i386-adcox.c -o test-i386-adcox -static
  /home/alex/lsrc/qemu.git/tests/tcg/i386/test-i386-adcox.c:32:26: error: invalid input constraint '0' in asm
          : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
                           ^
  /home/alex/lsrc/qemu.git/tests/tcg/i386/test-i386-adcox.c:57:26: error: invalid input constraint '0' in asm
          : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
                           ^
  2 errors generated.

Pointing out a numbered input constraint can't point to a read/write
output [1]. Convert to a read-only input constraint to allow this.

[1] https://lists.llvm.org/pipermail/cfe-commits/Week-of-Mon-20101101/036036.html

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/tcg/i386/test-i386-adcox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/i386/test-i386-adcox.c b/tests/tcg/i386/test-i386-adcox.c
index 16169efff8..b56dbc00f2 100644
--- a/tests/tcg/i386/test-i386-adcox.c
+++ b/tests/tcg/i386/test-i386-adcox.c
@@ -28,7 +28,7 @@ void test_adox_adcx(uint32_t in_c, uint32_t in_o, REG adcx_operand, REG adox_ope
         "adox %3, %2;"
         "adcx %3, %1;"
         "pushf; pop %0"
-        : "+r" (flags), "+r" (out_adcx), "+r" (out_adox)
+        : "=r"(flags), "=r"(out_adcx), "=r"(out_adox)
         : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
 
     assert(out_adcx == in_c + adcx_operand - 1);
@@ -53,7 +53,7 @@ void test_adcx_adox(uint32_t in_c, uint32_t in_o, REG adcx_operand, REG adox_ope
         "adcx %3, %1;"
         "adox %3, %2;"
         "pushf; pop %0"
-        : "+r" (flags), "+r" (out_adcx), "+r" (out_adox)
+        : "=r"(flags), "=r"(out_adcx), "=r"(out_adox)
         : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
 
     assert(out_adcx == in_c + adcx_operand - 1);
-- 
2.39.5
