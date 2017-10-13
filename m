Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t143sm930996wmt.45.2017.10.13.09.24.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:24:38 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7A2063E06B0;
	Fri, 13 Oct 2017 17:24:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [RFC PATCH 01/30] linux-user/main: support dfilter
Date: Fri, 13 Oct 2017 17:24:09 +0100
Message-Id: <20171013162438.32458-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bryQe8+wLQmd

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 829f974662..5072aa855b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -3854,6 +3854,11 @@ static void handle_arg_log(const char *arg)
     qemu_set_log(mask);
 }
 
+static void handle_arg_dfilter(const char *arg)
+{
+    qemu_set_dfilter_ranges(arg, NULL);
+}
+
 static void handle_arg_log_filename(const char *arg)
 {
     qemu_set_log_filename(arg, &error_fatal);
@@ -4054,6 +4059,8 @@ static const struct qemu_argument arg_table[] = {
     {"d",          "QEMU_LOG",         true,  handle_arg_log,
      "item[,...]", "enable logging of specified items "
      "(use '-d help' for a list of items)"},
+    {"dfilter",    "QEMU_DFILTER",     true,  handle_arg_dfilter,
+     "range[,...]","filter logging based on address range"},
     {"D",          "QEMU_LOG_FILENAME", true, handle_arg_log_filename,
      "logfile",     "write logs to 'logfile' (default stderr)"},
     {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
-- 
2.14.1
