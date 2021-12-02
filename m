Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z8sm2493015wrh.54.2021.12.02.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:53:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 874C31FF98;
	Thu,  2 Dec 2021 11:53:52 +0000 (GMT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v9 1/9] docs: mention checkpatch in the README
Date: Thu,  2 Dec 2021 11:53:44 +0000
Message-Id: <20211202115352.951548-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211202115352.951548-1-alex.bennee@linaro.org>
References: <20211202115352.951548-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +9cata8abWqk

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20211118184650.661575-2-alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>

---
v9
  - slightly more weaselly statement about checkpatch
---
 README.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README.md b/README.md
index 6e6a9d04..245052b4 100644
--- a/README.md
+++ b/README.md
@@ -182,3 +182,6 @@ the code files.  We also start with common code and finish with unit test
 code. git-diff's orderFile feature allows us to specify the order in a
 file.  The orderFile we use is `scripts/git.difforder`; adding the config
 with `git config diff.orderFile scripts/git.difforder` enables it.
+
+We strive to follow the Linux kernels coding style so it's recommended
+to run the kernel's ./scripts/checkpatch.pl on new patches.
-- 
2.30.2
