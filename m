Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h6-20020a1ccc06000000b003e118684d56sm17047627wmb.45.2023.03.07.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 03:28:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9FED91FFB8;
	Tue,  7 Mar 2023 11:28:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvmarm@lists.cs.columbia.edu
Cc: kvm@vger.kernel.org,
	qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v10 1/7] Makefile: add GNU global tags support
Date: Tue,  7 Mar 2023 11:28:39 +0000
Message-Id: <20230307112845.452053-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307112845.452053-1-alex.bennee@linaro.org>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AcEAYhCvSnDL

If you have ctags you might as well offer gtags as a target.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211118184650.661575-4-alex.bennee@linaro.org>

---
v10
  - update .gitignore
---
 Makefile   | 5 ++++-
 .gitignore | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6ed5deac..f22179de 100644
--- a/Makefile
+++ b/Makefile
@@ -145,6 +145,9 @@ cscope:
 		-name '*.[chsS]' -exec realpath --relative-base=$(CURDIR) {} \; | sort -u > ./cscope.files
 	cscope -bk
 
-.PHONY: tags
+.PHONY: tags gtags
 tags:
 	ctags -R
+
+gtags:
+	gtags
diff --git a/.gitignore b/.gitignore
index 33529b65..4d5f460f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,6 +12,9 @@ tags
 patches
 .stgit-*
 cscope.*
+GPATH
+GRTAGS
+GTAGS
 *.swp
 /lib/asm
 /lib/config.h
-- 
2.39.2
