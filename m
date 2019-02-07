Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x12sm21890909wrt.20.2019.02.07.10.37.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:45 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ABCA01FF82;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 02/16] .travis.yml: stop requesting libffi & gettext from homebrew
Date: Thu,  7 Feb 2019 18:37:30 +0000
Message-Id: <20190207183744.5054-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9JoSv8UPn/tF

From: Daniel P. Berrangé <berrange@redhat.com>

The default package set installed on macOS builders from Travis already
includes libffi and gettext as shown by log messages:

  Skipping install of libffi formula. It is already up-to-date.
  Using libffi
  Skipping install of gettext formula. It is already up-to-date.
  Using gettext

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 87d9fa971c..beea941408 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -40,8 +40,6 @@ addons:
       - gcovr
   homebrew:
     packages:
-      - libffi
-      - gettext
       - glib
       - pixman
 
-- 
2.20.1
