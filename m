Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cfccsm435948166b.148.2024.07.02.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:35:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC8685F93D;
	Tue,  2 Jul 2024 17:35:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com,
	drjones@redhat.com,
	thuth@redhat.com
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	kvmarm@lists.linux.dev (open list:ARM)
Subject: [kvm-unit-tests PATCH v1 2/2] arm/mmu: widen the page size check to account for LPA2
Date: Tue,  2 Jul 2024 17:35:15 +0100
Message-Id: <20240702163515.1964784-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240702163515.1964784-1-alex.bennee@linaro.org>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w4ke7bfcmf0Z

If FEAT_LPA2 is enabled there are different valid TGran values
possible to indicate the granule is supported for 52 bit addressing.
This will cause most tests to abort on QEMU's -cpu max with the error:

  lib/arm/mmu.c:216: assert failed: system_supports_granule(PAGE_SIZE): Unsupported translation granule 4096

Expand the test to tale this into account.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 lib/arm64/asm/processor.h | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 1c73ba32..4a213aec 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -110,31 +110,30 @@ static inline unsigned long get_id_aa64mmfr0_el1(void)
 #define ID_AA64MMFR0_TGRAN64_SHIFT	24
 #define ID_AA64MMFR0_TGRAN16_SHIFT	20
 
-#define ID_AA64MMFR0_TGRAN4_SUPPORTED	0x0
-#define ID_AA64MMFR0_TGRAN64_SUPPORTED	0x0
-#define ID_AA64MMFR0_TGRAN16_SUPPORTED	0x1
+#define ID_AA64MMFR0_TGRAN4_OK	        0x0
+#define ID_AA64MMFR0_TGRAN4_52_OK       0x1
+#define ID_AA64MMFR0_TGRAN64_OK	0x0
+#define ID_AA64MMFR0_TGRAN16_OK	        0x1
+#define ID_AA64MMFR0_TGRAN16_52_OK      0x2
 
 static inline bool system_supports_granule(size_t granule)
 {
-	u32 shift;
 	u32 val;
-	u64 mmfr0;
+	u64 mmfr0 = get_id_aa64mmfr0_el1();
 
 	if (granule == SZ_4K) {
-		shift = ID_AA64MMFR0_TGRAN4_SHIFT;
-		val = ID_AA64MMFR0_TGRAN4_SUPPORTED;
+		val = ((mmfr0 >> ID_AA64MMFR0_TGRAN4_SHIFT) & 0xf);
+		return (val == ID_AA64MMFR0_TGRAN4_OK) ||
+		       (val == ID_AA64MMFR0_TGRAN4_52_OK);
 	} else if (granule == SZ_16K) {
-		shift = ID_AA64MMFR0_TGRAN16_SHIFT;
-		val = ID_AA64MMFR0_TGRAN16_SUPPORTED;
+		val = ((mmfr0 >> ID_AA64MMFR0_TGRAN16_SHIFT) & 0xf);
+		return val == ID_AA64MMFR0_TGRAN16_OK;
 	} else {
 		assert(granule == SZ_64K);
-		shift = ID_AA64MMFR0_TGRAN64_SHIFT;
-		val = ID_AA64MMFR0_TGRAN64_SUPPORTED;
+		val = ((mmfr0 >> ID_AA64MMFR0_TGRAN64_SHIFT) & 0xf);
+		return (val == ID_AA64MMFR0_TGRAN64_OK) ||
+		       (val == ID_AA64MMFR0_TGRAN4_52_OK);
 	}
-
-	mmfr0 = get_id_aa64mmfr0_el1();
-
-	return ((mmfr0 >> shift) & 0xf) == val;
 }
 
 #endif /* !__ASSEMBLY__ */
-- 
2.39.2
