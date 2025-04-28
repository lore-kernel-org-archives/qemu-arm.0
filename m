Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f808b23ad5sm781881a12.66.2025.04.28.05.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:59:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6FC5E5F9D6;
	Mon, 28 Apr 2025 13:59:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 2/9] gitlab: disable debug info on CI builds
Date: Mon, 28 Apr 2025 13:59:11 +0100
Message-Id: <20250428125918.449346-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428125918.449346-1-alex.bennee@linaro.org>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ijcGvG/1SCDh

Our default build enables debug info which adds hugely to the size of
the builds as well as the size of cached objects. Disable debug info
across the board to save space and reduce pressure on the CI system.
We still have a number of builds which explicitly enable debug and
related extra asserts like --enable-debug-tcg.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index d4f145fdb5..d9e69c3237 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -24,6 +24,7 @@
     - ccache --zero-stats
     - section_start configure "Running configure"
     - ../configure --enable-werror --disable-docs --enable-fdt=system
+          --disable-debug-info
           ${TARGETS:+--target-list="$TARGETS"}
           $CONFIGURE_ARGS ||
       { cat config.log meson-logs/meson-log.txt && exit 1; }
-- 
2.39.5
