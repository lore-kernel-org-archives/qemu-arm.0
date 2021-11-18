Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c1sm644533wrt.14.2021.11.18.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:46:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 490751FF98;
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
Subject: [kvm-unit-tests PATCH v8 01/10] docs: mention checkpatch in the README
Date: Thu, 18 Nov 2021 18:46:41 +0000
Message-Id: <20211118184650.661575-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211118184650.661575-1-alex.bennee@linaro.org>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pINLSvlji9pk

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 README.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/README.md b/README.md
index b498aaf..5db48e5 100644
--- a/README.md
+++ b/README.md
@@ -182,3 +182,5 @@ the code files.  We also start with common code and finish with unit test
 code. git-diff's orderFile feature allows us to specify the order in a
 file.  The orderFile we use is `scripts/git.difforder`; adding the config
 with `git config diff.orderFile scripts/git.difforder` enables it.
+
+Please run the kernel's ./scripts/checkpatch.pl on new patches
-- 
2.30.2
