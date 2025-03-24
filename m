Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfae189sm5784268a12.37.2025.03.24.03.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ACFDA5F90B;
	Mon, 24 Mar 2025 10:21:42 +0000 (GMT)
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
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 01/11] include/exec: fix assert in size_memop
Date: Mon, 24 Mar 2025 10:21:32 +0000
Message-Id: <20250324102142.67022-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m594zLCxd7GW

We can handle larger sized memops now, expand the range of the assert.

Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - instead of 128 use 1 << MO_SIZE for future proofing
---
 include/exec/memop.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 407a47d82c..6afe50a7d0 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -162,8 +162,8 @@ static inline unsigned memop_size(MemOp op)
 static inline MemOp size_memop(unsigned size)
 {
 #ifdef CONFIG_DEBUG_TCG
-    /* Power of 2 up to 8.  */
-    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
+    /* Power of 2 up to 128.  */
+    assert((size & (size - 1)) == 0 && size >= 1 && size <= (1 << MO_SIZE));
 #endif
     return (MemOp)ctz32(size);
 }
-- 
2.39.5
