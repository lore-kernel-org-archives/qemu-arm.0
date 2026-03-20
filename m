Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7191098797
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 15:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3c84-0007Xj-9Y; Fri, 20 Mar 2026 11:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c82-0007WV-DE
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:14 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c7z-0005VD-JH
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b97a06d7629so258399266b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774021870; x=1774626670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhvJ30u4SjKjKGIAS0IRtyTM16wsKwTzLGcYfkxCVc0=;
 b=tjJRdRWMsDXLUItS0XY4kFlktsP+z85kwp8DDbXpdk3J1qXXHvIaCy9PtYu4pz0fZM
 3PmDm1DCPQhNUnNEoPlMlDRDxCN4zOmPt9hMkz+MPdnZFsfSFGhHTI4wOQ74FKgmfWVX
 FeoCxshp7zMU4yY/O2l6AOTyTAYmX56kLAkbt7psChu+A3VxpMk4JBZr0MYENghAtHEC
 TZmtmPX0BHSRDxQsH0jiKO+/vJR3ARZHNrpDB/go1/QxpXgRS6eWiMInA3NMup95qzSC
 4BENJ4NF02+CODexkfzYX8M4r9TSAs4Nrk6XtAVH/FDUzfB7YcMd6pI4xmukU08T/xz6
 l0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774021870; x=1774626670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YhvJ30u4SjKjKGIAS0IRtyTM16wsKwTzLGcYfkxCVc0=;
 b=lQ4WQ+7xOYyqptcpbRsJ13nXp12WVVglTFaO5VC4GFFWpxV7xKTPjs4glZpgFxlZXx
 D5n3VcMzpfoRgXY3rwMXEXiVJ+U3q9fQidg2Je0/OIa9Ve44LuXmRSyAyccUBg8y2vsj
 mkzFc9sUhSM6XPaxXIP6v+fvl8NTQ/Df/Uc3jE1OI1VBDgBM5QHEOSRM1qb7J8pJu1Pz
 nZ/KBqOBtoOKOTs6OaniSn68msA+nz8p6uLzh/wnIF8igQYiLQYg0kpRzrfLHXD9At0j
 uwEYhJQS7HdJPiqWLoiDSomwzz+LRFe5XApoz8fYdiMBn02Jt4eBSjQsd8wWk2gmqLEn
 wmsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZA7Wyekig/aJf9SwEOT4JwYCPN+y+M36oxN/40SOWIAUTrKGDV7KWRC6WWOVUc6U2OCwDwq/vBQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywx10gMx4WPjvykFu4C29xuk9P3nE5LUI4oS5J3qIyKI/ivCn7G
 FquMb3E+KL8fBoFgXcWIqBOe1XidsT51hbyiJkaERGdh6fVIpGKh66aZM51bgxnREfw=
X-Gm-Gg: ATEYQzwm9lcr3MKYNZaItYFqKZW6wlLrK4tKnad5d/YdRv/BlZSXFqueDpJcX+RNc9e
 YW3IaDbAs9t9RLPjLWB/Pi0jX14LKDud+Xa8HBORfUZ1+aqBLH9Vpexg2aojqssUYf/whfDeTf/
 TYyFJU3aFvuWYKgiRpk0Wn0NhtDJZ5r3QUGX3X7PHoJvKyqlhRPlT+G8gNATfFYUXozP5eam0ym
 TQdFi9A4IPdd0SaRWVhC1Rk2jySzgD1Zs/xQOVA7Sdddlw9O1ppODLm6X8RtOebhUD5ekf3ITXF
 a1/uPI7Umbw98OnzMiD0sAGYfy0eZOgmmwfeuuhSDxiw66Eref0i75XM5UXp2Y95Ntab3+DENf/
 uMzpyoWS3/oGsWYl03eX1bOyItEuTA+k+Y8Fyckd6PocC+cjWRbpT/FaMkDpERb1KkNQfzGHGPr
 1ml6zbint1QaeVabl3nrW2qkQ=
X-Received: by 2002:a17:907:c50a:b0:b94:858:5807 with SMTP id
 a640c23a62f3a-b982f235fabmr226643666b.25.1774021869554; 
 Fri, 20 Mar 2026 08:51:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832fd7147sm172006866b.27.2026.03.20.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:51:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E79F65F910;
 Fri, 20 Mar 2026 15:51:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 2/8] tests/tcg/multiarch/linux-test: use portable
 alternative for dirent64
Date: Fri, 20 Mar 2026 15:51:01 +0000
Message-ID: <20260320155107.2143191-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320155107.2143191-1-alex.bennee@linaro.org>
References: <20260320155107.2143191-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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


