Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id qa44-20020a17090786ac00b006dbe1ca23casm1817451ejc.45.2022.03.15.05.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C02601FFBF;
	Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 7/8] semihosting: clean up handling of expanded argv
Date: Tue, 15 Mar 2022 12:12:50 +0000
Message-Id: <20220315121251.2280317-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9q+HWMkSV5xU

Another cleanup patch tripped over the fact we weren't being careful
in our casting. Fix the casts, allow for a non-const and switch from
g_realloc to g_renew.

The whole semihosting argument handling could do with some tests
though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/semihosting/config.c b/semihosting/config.c
index 137171b717..50d82108e6 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
     Chardev *chardev;
-    const char **argv;
+    char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
 } SemihostingConfig;
@@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
     if (strcmp(name, "arg") == 0) {
         s->argc++;
         /* one extra element as g_strjoinv() expects NULL-terminated array */
-        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
-        s->argv[s->argc - 1] = val;
+        s->argv = g_renew(char *, s->argv, s->argc + 1);
+        s->argv[s->argc - 1] = g_strdup(val);
         s->argv[s->argc] = NULL;
     }
     return 0;
-- 
2.30.2
