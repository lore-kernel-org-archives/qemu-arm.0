Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n1sm655518wmq.6.2021.11.18.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:46:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 56B171FF9A;
	Thu, 18 Nov 2021 18:46:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v8 03/10] Makefile: add GNU global tags support
Date: Thu, 18 Nov 2021 18:46:43 +0000
Message-Id: <20211118184650.661575-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211118184650.661575-1-alex.bennee@linaro.org>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QSE5k9loN9AV

If you have ctags you might as well offer gtags as a target.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b80c31f..0b7c03a 100644
--- a/Makefile
+++ b/Makefile
@@ -122,6 +122,9 @@ cscope:
 		-name '*.[chsS]' -exec realpath --relative-base=$(CURDIR) {} \; | sort -u > ./cscope.files
 	cscope -bk
 
-.PHONY: tags
+.PHONY: tags gtags
 tags:
 	ctags -R
+
+gtags:
+	gtags
-- 
2.30.2
