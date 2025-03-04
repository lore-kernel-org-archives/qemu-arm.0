Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e382a04bsm277988166b.163.2025.03.04.14.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E509B6007F;
	Tue,  4 Mar 2025 22:24:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 15/32] tests/tcg: fix constraints in test-i386-adcox
Date: Tue,  4 Mar 2025 22:24:22 +0000
Message-Id: <20250304222439.2035603-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: frhW/rdIZGqz

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
v2
  - followed rth's suggestion and removed additional matches.
---
 tests/tcg/i386/test-i386-adcox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/i386/test-i386-adcox.c b/tests/tcg/i386/test-i386-adcox.c
index 16169efff8..d653fa86a7 100644
--- a/tests/tcg/i386/test-i386-adcox.c
+++ b/tests/tcg/i386/test-i386-adcox.c
@@ -53,8 +53,8 @@ void test_adcx_adox(uint32_t in_c, uint32_t in_o, REG adcx_operand, REG adox_ope
         "adcx %3, %1;"
         "adox %3, %2;"
         "pushf; pop %0"
-        : "+r" (flags), "+r" (out_adcx), "+r" (out_adox)
-        : "r" ((REG)-1), "0" (flags), "1" (out_adcx), "2" (out_adox));
+        : "+r"(flags), "+r"(out_adcx), "+r"(out_adox)
+        : "r" ((REG)-1));
 
     assert(out_adcx == in_c + adcx_operand - 1);
     assert(out_adox == in_o + adox_operand - 1);
-- 
2.39.5
