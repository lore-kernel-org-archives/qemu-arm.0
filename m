Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf5290dsm660596666b.48.2024.07.05.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8CE49620ED;
	Fri,  5 Jul 2024 09:40:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 09/40] tests/tcg/aarch64: Explicitly specify register width
Date: Fri,  5 Jul 2024 09:40:16 +0100
Message-Id: <20240705084047.857176-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IGjlCWUE91q8

From: Akihiko Odaki <akihiko.odaki@daynix.com>

clang version 18.1.6 assumes a register is 64-bit by default and
complains if a 32-bit value is given. Explicitly specify register width
when passing a 32-bit value.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240627-tcg-v2-3-1690a813348e@daynix.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240630190050.160642-5-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/bti-1.c | 6 +++---
 tests/tcg/aarch64/bti-3.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 99a879af23..1fada8108d 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -17,15 +17,15 @@ static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 #define BTI_JC    "hint #38"
 
 #define BTYPE_1(DEST) \
-    asm("mov %0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x16")
 
 #define BTYPE_2(DEST) \
-    asm("mov %0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_3(DEST) \
-    asm("mov %0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %0,#0" \
+    asm("mov %w0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %w0,#0" \
         : "=r"(skipped) : : "x15")
 
 #define TEST(WHICH, DEST, EXPECT) \
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index 8c534c09d7..6a3bd037bc 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -11,15 +11,15 @@ static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 }
 
 #define BTYPE_1() \
-    asm("mov %0,#1; adr x16, 1f; br x16; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; br x16; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_2() \
-    asm("mov %0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x16", "x30")
 
 #define BTYPE_3() \
-    asm("mov %0,#1; adr x15, 1f; br x15; 1: hint #25; mov %0,#0" \
+    asm("mov %w0,#1; adr x15, 1f; br x15; 1: hint #25; mov %w0,#0" \
         : "=r"(skipped) : : "x15", "x30")
 
 #define TEST(WHICH, EXPECT) \
-- 
2.39.2
