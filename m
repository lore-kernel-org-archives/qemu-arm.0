Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c23sm9110099wme.37.2021.06.04.08.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 96AC31FF92;
	Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH  v16 96/99] tests/qtest: split the cdrom-test into arm/aarch64
Date: Fri,  4 Jun 2021 16:53:09 +0100
Message-Id: <20210604155312.15902-97-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7puSIcVkxNEH

The assumption that the qemu-system-aarch64 image can run all 32 bit
machines is about to be broken and besides it's not likely this is
improving out coverage by much. Test the "virt" machine for both arm
and aarch64 as it can be used by either architecture.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/cdrom-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 5af944a5fb..1e74354624 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -220,13 +220,16 @@ int main(int argc, char **argv)
             "magnum", "malta", "pica61", NULL
         };
         add_cdrom_param_tests(mips64machines);
-    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
+    } else if (g_str_equal(arch, "arm")) {
         const char *armmachines[] = {
             "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
             "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
             "vexpress-a9", "virt", NULL
         };
         add_cdrom_param_tests(armmachines);
+    } else if (g_str_equal(arch, "aarch64")) {
+        const char *aarch64machines[] = { "virt", NULL };
+        add_cdrom_param_tests(aarch64machines);
     } else {
         const char *nonemachine[] = { "none", NULL };
         add_cdrom_param_tests(nonemachine);
-- 
2.20.1
