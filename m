Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e5152sm646514266b.47.2025.03.24.03.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9CAA85FE0C;
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
Subject: [PATCH v2 11/11] include/gdbstub: add note to helpers.h
Date: Mon, 24 Mar 2025 10:21:42 +0000
Message-Id: <20250324102142.67022-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: enZn6xzg0z1e

We've not yet deprecated but we should steer users away from these
helpers if they want to be in a single/heterogeneous binary.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/helpers.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 6f7cc48adc..9b3a535b03 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -2,7 +2,9 @@
  * gdbstub helpers
  *
  * These are all used by the various frontends and have to be host
- * aware to ensure things are store in target order.
+ * aware to ensure things are store in target order. Consider using
+ * the endian neutral registers.h if you want the architecture to be
+ * included in an eventual single QEMU binary.
  *
  * Copyright (c) 2022 Linaro Ltd
  *
-- 
2.39.5
