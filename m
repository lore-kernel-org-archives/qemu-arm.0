Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f85917sm25733145e9.35.2025.03.19.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A6B99602A5;
	Wed, 19 Mar 2025 18:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 05/10] target/ppc: expand comment on FP/VMX/VSX access functions
Date: Wed, 19 Mar 2025 18:22:50 +0000
Message-Id: <20250319182255.3096731-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S5JHCMwov9D+

Mainly as an aid to myself getting confused too many bswaps deep into
the code.

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
