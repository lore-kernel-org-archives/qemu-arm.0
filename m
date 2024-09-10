Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd46819sm4453099a12.31.2024.09.10.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:39:01 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C93A85F9CC;
	Tue, 10 Sep 2024 18:39:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 04/10] docs/devel: fix duplicate line
Date: Tue, 10 Sep 2024 18:38:54 +0100
Message-Id: <20240910173900.4154726-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910173900.4154726-1-alex.bennee@linaro.org>
References: <20240910173900.4154726-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cXmC2jXHAOZ2

I guess the same change came in via two patch series. Remove the
repetition.

Fixes: 2a851fca9f (docs/devel: remind developers to run CI container pipeline when updating images)
Message-Id: <20240910140733.4007719-4-alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing/main.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/devel/testing/main.rst b/docs/devel/testing/main.rst
index e9921a4b10..09725e8ea9 100644
--- a/docs/devel/testing/main.rst
+++ b/docs/devel/testing/main.rst
@@ -500,12 +500,6 @@ first to contribute the mapping to the ``libvirt-ci`` project:
    `CI <https://www.qemu.org/docs/master/devel/ci.html>`__ documentation
    page on how to trigger gitlab CI pipelines on your change.
 
- * Please also trigger gitlab container generation pipelines on your change
-   for as many OS distros as practical to make sure that there are no
-   obvious breakages when adding the new pre-requisite. Please see
-   `CI <https://www.qemu.org/docs/master/devel/ci.html>`__ documentation
-   page on how to trigger gitlab CI pipelines on your change.
-
 For enterprise distros that default to old, end-of-life versions of the
 Python runtime, QEMU uses a separate set of mappings that work with more
 recent versions.  These can be found in ``tests/lcitool/mappings.yml``.
-- 
2.39.2
