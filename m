Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315AAFCA166
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 17:50:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzejZ-0000oo-BY; Mon, 09 Mar 2026 13:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzein-0000Zk-Ir
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzeik-0002oj-GH
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4852e09e23dso20358235e9.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 10:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773078524; x=1773683324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhvJ30u4SjKjKGIAS0IRtyTM16wsKwTzLGcYfkxCVc0=;
 b=rhPopMlXstd5OeHVGDbY99KJUyq0nEuE96vXmTs9BoOqen82Sss5fvu7h7wJr7ynZa
 sVkcBhq0hFpqWIMm4P2+P2aNmi1sTHXAx6sJQwoLH+RxlkFjsNQdtjuDo2T07572dhhB
 Pjecrwn1T2D76HZzCDAjbBAXaai50Ku+s5aLk+/SmBRiqWVWTcG/8akrIO2OspH7Ss46
 oEm3Nr5AXEsNcwgjcgyhf2VLPPhY+cDy6bn76nhwP8MXwgkQyVukStkqtLqv5oahy5V3
 HNXoiSCS8exusl73vrxqs2Ud9n5LrlBNZVhjw19t2IrRWGhandbGLmqehtnZTOuAJxKA
 gdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078524; x=1773683324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YhvJ30u4SjKjKGIAS0IRtyTM16wsKwTzLGcYfkxCVc0=;
 b=YTIIEBxN6YK36kElrIVwXLoV9nrLTPn+POYXsJ3le1sBge6FzrYDP6ieYCVSmiCE7T
 i7xY0KPrTLdlf5QgpuauvD3FYKecGpCnnJQP45X64Gg3mid/hGJJiNAm0QxBTdWhFMdM
 l6BnH2nH+o5JNyjdk+cDstVaUTTO3QM5QXqTt4VVKMc+I3aEvTm6rTCT2aN8gnpn3IxM
 nobcXJ+FiqnIJ/uNhUyQ3xjOzGuOJ+UGO4amGu/onP5k4pX/pmczjqZQYpsqYXKULDz6
 3hWAM2OxVR/EpnHxUvV9QdqKvqdl+MbejUZhiv9DGiObthziitzYLUkLozG1+p08YNBP
 0BwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ToLlz/lOSg3GDNUHxbMJ0qyoyoFxiDkfzs+HWNCpYAqbn28kXqoN6LJ2DMnRUb5aIjantwJ0vA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7r7nYlbURyyWQHcK5MV+jajRieaAcOVTuDKxV13mQhAXoY3vX
 IpodrAZnuQ/VlTdCQUO25HqKLuU7dYOQGAbYKoobVHEl6qh8FW95RDVXtBVUsk4SCVQ=
X-Gm-Gg: ATEYQzzdUIj/TSBkhi/qbF7//bHZYbS82EICDgV0FMceOYiKKuT9qy/Xa0ApjIvXjlY
 5eWlTo2Y+1pfEoeWyRDBLp3QZSwZLFa50BgaA3ok6CQN6XD7LHXwuKIgp+tqZ9QoqqHCbMXr2Pv
 SMcmbmYGaoqoeNAHqpVYAZcYgWFHQUj2ik6B73pAzy12+cxm1FGBV4cIB4D5GhKaoP1+wQ6797o
 Znfgp/cwUYQQNvFxGOXhYB5M5eS2+gZErJE9hf2S7BMvs2JtLkH1EE6v9seFmCt9fL9c5/PKz1l
 GK/3NxUK54LSn0oO4UQsJdpU0l6PEbFvBRhIn8liZTjhna2oxALXuSUIwLiawsIyt8ePqvYiXc2
 oCgMXm9XDIfK+4yfmeQfC94q1kgoSgh2bEsC+b1UEpy8peTSeQXy5QkpjfnmpboDjt+cYUTCSJh
 e8xhvBlP/72eVBwznUxSETrInb9qCLxWo+Ng==
X-Received: by 2002:a05:600c:3114:b0:485:40c6:f516 with SMTP id
 5b1f17b1804b1-48540c6f648mr28269355e9.33.1773078523879; 
 Mon, 09 Mar 2026 10:48:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aad45fsm8048965e9.15.2026.03.09.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:48:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E4EA55F94A;
 Mon, 09 Mar 2026 17:48:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v2 3/5] tests/tcg/multiarch/linux-test: use portable
 alternative for dirent64
Date: Mon,  9 Mar 2026 17:48:39 +0000
Message-ID: <20260309174841.4184117-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309174841.4184117-1-alex.bennee@linaro.org>
References: <20260309174841.4184117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>

dirent64 and readdir64 are glibc-specific and not portable to other
C libraries such as musl. Define _FILE_OFFSET_BITS=64 instead, which
portably instructs all libc implementations to use 64-bit file offsets,
making readdir() and struct dirent equivalent to their 64-bit variants.

Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <af31d21c4d668cfb940ba4159f584fa6454c3d82.1772107448.git.matheus.bernardino@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/linux/linux-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
index bf6e0fda262..0fa3165602f 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -16,6 +16,7 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+#define _FILE_OFFSET_BITS 64
 #define _GNU_SOURCE
 #include <stdarg.h>
 #include <stdlib.h>
@@ -83,7 +84,7 @@ static void test_file(void)
     struct utimbuf tbuf;
     struct iovec vecs[2];
     DIR *dir;
-    struct dirent64 *de;
+    struct dirent *de;
     /* TODO: make common tempdir creation for tcg tests */
     char template[] = "/tmp/linux-test-XXXXXX";
     char *tmpdir = mkdtemp(template);
@@ -191,7 +192,7 @@ static void test_file(void)
         error("opendir");
     len = 0;
     for(;;) {
-        de = readdir64(dir);
+        de = readdir(dir);
         if (!de)
             break;
         if (strcmp(de->d_name, ".") != 0 &&
-- 
2.47.3


