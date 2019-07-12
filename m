Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q1sm7089808wmq.25.2019.07.12.04.18.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9F66B1FF92;
	Fri, 12 Jul 2019 12:18:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH  v1 5/7] tests/migration-test: don't spam the logs when we fail
Date: Fri, 12 Jul 2019 12:18:47 +0100
Message-Id: <20190712111849.9006-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nEmMxxqSzcwA

Quite often the information about which test failed is hidden by the
wall of repeated failures for each page. Stop outputting the error
after 10 bad pages and just summarise the total damage at the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/migration-test.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index b6434628e1c..ce041f80c2a 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -308,7 +308,7 @@ static void check_guests_ram(QTestState *who)
     uint8_t first_byte;
     uint8_t last_byte;
     bool hit_edge = false;
-    bool bad = false;
+    int bad = 0;
 
     qtest_memread(who, start_address, &first_byte, 1);
     last_byte = first_byte;
@@ -327,15 +327,20 @@ static void check_guests_ram(QTestState *who)
                 hit_edge = true;
                 last_byte = b;
             } else {
-                fprintf(stderr, "Memory content inconsistency at %x"
-                                " first_byte = %x last_byte = %x current = %x"
-                                " hit_edge = %x\n",
-                                address, first_byte, last_byte, b, hit_edge);
-                bad = true;
+                bad++;
+                if (bad <= 10) {
+                    fprintf(stderr, "Memory content inconsistency at %x"
+                            " first_byte = %x last_byte = %x current = %x"
+                            " hit_edge = %x\n",
+                            address, first_byte, last_byte, b, hit_edge);
+                }
             }
         }
     }
-    g_assert_false(bad);
+    if (bad >= 10) {
+        fprintf(stderr, "and in another %d pages", bad);
+    }
+    g_assert(bad == 0);
 }
 
 static void cleanup(const char *filename)
-- 
2.20.1
