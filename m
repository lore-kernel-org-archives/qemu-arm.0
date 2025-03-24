Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47f39sm642345566b.169.2025.03.24.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 457295FD05;
	Mon, 24 Mar 2025 10:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 07/11] target/ppc: expand comment on FP/VMX/VSX access functions
Date: Mon, 24 Mar 2025 10:21:38 +0000
Message-Id: <20250324102142.67022-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zHGgkS9sVq8u

Mainly as an aid to myself getting confused too many bswaps deep into
the code.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/cpu.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index efab54a068..1e833ade04 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2906,7 +2906,12 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
            (start + nregs > 32 && (rx >= start || rx < start + nregs - 32));
 }
 
-/* Accessors for FP, VMX and VSX registers */
+/*
+ * Access functions for FP, VMX and VSX registers
+ *
+ * The register is stored as a 128 bit host endian value so we need to
+ * take that into account when accessing smaller parts of it.
+ */
 #if HOST_BIG_ENDIAN
 #define VsrB(i) u8[i]
 #define VsrSB(i) s8[i]
-- 
2.39.5
