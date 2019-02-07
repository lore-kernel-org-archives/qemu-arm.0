Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 126sm121182wmd.1.2019.02.07.10.37.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:48 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DA5B11FF86;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 06/16] archive-source.sh: Clone the submodules locally
Date: Thu,  7 Feb 2019 18:37:34 +0000
Message-Id: <20190207183744.5054-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: U/6C0Hm0uf0+

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We cloned the QEMU repository from the local storage. Since the
submodules are also available there, clone them too. This is
quicker and reduce network use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[AJB: incorporated review suggestions from danpb]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/archive-source.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 6eed2a29bd..d3a88f71e9 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -38,6 +38,13 @@ else
 fi
 git clone --shared . "$vroot_dir"
 test $? -ne 0 && error "failed to clone into '$vroot_dir'"
+for sm in $submodules; do
+    if test -d "$sm/.git"
+    then
+       git clone --shared "$sm" "$vroot_dir/$sm"
+       test $? -ne 0 && error "failed to clone submodule $sm"
+    fi
+done
 
 cd "$vroot_dir"
 test $? -ne 0 && error "failed to change into '$vroot_dir'"
-- 
2.20.1
