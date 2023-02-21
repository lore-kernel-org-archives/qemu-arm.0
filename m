Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b003e21f01c426sm3194687wmn.9.2023.02.21.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 037621FFB8;
	Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [PATCH v2 01/14] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Tue, 21 Feb 2023 09:45:45 +0000
Message-Id: <20230221094558.2864616-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7hVN88HNo5K7

From: Anton Johansson <anjo@rev.ng>

* 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
  version, which returns curl_off_t instead of a double.
* 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
  favour of *_STR variants, specifying the desired protocols via a
  string.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230123201431.23118-1-anjo@rev.ng>
[AJB: fixed author]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 block/curl.c | 44 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index cbada22e9e..8efd97b349 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -38,8 +38,15 @@
 
 // #define DEBUG_VERBOSE
 
+/* CURL 7.85.0 switches to a string based API for specifying
+ * the desired protocols.
+ */
+#if LIBCURL_VERSION_NUM >= 0x075500
+#define PROTOCOLS "HTTP,HTTPS,FTP,FTPS"
+#else
 #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
                    CURLPROTO_FTP | CURLPROTO_FTPS)
+#endif
 
 #define CURL_NUM_STATES 8
 #define CURL_NUM_ACB    8
@@ -510,9 +517,18 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
          * obscure protocols.  For example, do not allow POP3/SMTP/IMAP see
          * CVE-2013-0249.
          *
-         * Restricting protocols is only supported from 7.19.4 upwards.
+         * Restricting protocols is only supported from 7.19.4 upwards. Note:
+         * version 7.85.0 deprecates CURLOPT_*PROTOCOLS in favour of a string
+         * based CURLOPT_*PROTOCOLS_STR API.
          */
-#if LIBCURL_VERSION_NUM >= 0x071304
+#if LIBCURL_VERSION_NUM >= 0x075500
+        if (curl_easy_setopt(state->curl,
+                             CURLOPT_PROTOCOLS_STR, PROTOCOLS) ||
+            curl_easy_setopt(state->curl,
+                             CURLOPT_REDIR_PROTOCOLS_STR, PROTOCOLS)) {
+            goto err;
+        }
+#elif LIBCURL_VERSION_NUM >= 0x071304
         if (curl_easy_setopt(state->curl, CURLOPT_PROTOCOLS, PROTOCOLS) ||
             curl_easy_setopt(state->curl, CURLOPT_REDIR_PROTOCOLS, PROTOCOLS)) {
             goto err;
@@ -670,7 +686,12 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     const char *file;
     const char *cookie;
     const char *cookie_secret;
-    double d;
+    /* CURL >= 7.55.0 uses curl_off_t for content length instead of a double */
+#if LIBCURL_VERSION_NUM >= 0x073700
+    curl_off_t cl;
+#else
+    double cl;
+#endif
     const char *secretid;
     const char *protocol_delimiter;
     int ret;
@@ -797,27 +818,36 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     }
     if (curl_easy_perform(state->curl))
         goto out;
-    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)) {
+    /* CURL 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of
+     * the *_T version which returns a more sensible type for content length.
+     */
+#if LIBCURL_VERSION_NUM >= 0x073700
+    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD_T, &cl)) {
+        goto out;
+    }
+#else
+    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &cl)) {
         goto out;
     }
+#endif
     /* Prior CURL 7.19.4 return value of 0 could mean that the file size is not
      * know or the size is zero. From 7.19.4 CURL returns -1 if size is not
      * known and zero if it is really zero-length file. */
 #if LIBCURL_VERSION_NUM >= 0x071304
-    if (d < 0) {
+    if (cl < 0) {
         pstrcpy(state->errmsg, CURL_ERROR_SIZE,
                 "Server didn't report file size.");
         goto out;
     }
 #else
-    if (d <= 0) {
+    if (cl <= 0) {
         pstrcpy(state->errmsg, CURL_ERROR_SIZE,
                 "Unknown file size or zero-length file.");
         goto out;
     }
 #endif
 
-    s->len = d;
+    s->len = cl;
 
     if ((!strncasecmp(s->url, "http://", strlen("http://"))
         || !strncasecmp(s->url, "https://", strlen("https://")))
-- 
2.39.1
