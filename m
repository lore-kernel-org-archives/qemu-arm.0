Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109BDFCB61E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:23:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXs4-0008CB-J1; Fri, 06 Mar 2026 11:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXru-0007Lm-RJ
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:42 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXrr-0007jt-4t
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so62311625e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772813854; x=1773418654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UxgbQsvSQBKFdx+AfZhaXSCPSowJMiI/wfdv1r8smw=;
 b=YILes6DTX/iXGbph0hDaeI9FdWc14OAVN2GZzZx2lmX9hStUV4AmoaWacXAqbTpF92
 wq0SA4mWoDGhf31p2mzDGmBAaJFT/FYic4InAcbFk8sLVJIvxhzwZVqOC1uavxNapWqd
 H/ZzModWehgDxAWW1sRWV4A5xm13hhMfES2UuU/cV9hnmeqqL/ehzQ++yDvoS3Xp3+NB
 9ttYJdQrLyClGknAQXELM6AFCoB/apOQGFj53jSLL/QTEQVdRwc+zBPDG3aYGF0Hb9Q/
 luULm+L0VCWDiisj6ysG+bpjmAdOiOldsNjjj76QY7dPOf1eUQtsAgz27wPqu7X3wBNJ
 KSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772813854; x=1773418654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8UxgbQsvSQBKFdx+AfZhaXSCPSowJMiI/wfdv1r8smw=;
 b=gAmbjr5fJzgdBgE8fp9/N5EDWDjcf6SDpXQnkwug+9y04UgOcaFkU5enEPy5YNFgCC
 ER4Wbm1UP2p7KLdfN9QF+MBPE0yFdWUPu/On0G6tQubUyDuhcqlh6uued0En/HZK9BCT
 0TpmZpIP0E7ODJVG6c5pwhnt6M+J83Z2eo1P+8VsGnI9DOiw/Q8Zvk+QhWT7zh1mJZHF
 iz4RvtQj0pa/dJgGFzazF73Es2e2hQkay4+bdEnNaZlcFNfjs2Zy0FoGHytiPiS8FykK
 k+oti1wfVGiAoYMSTtH8VufWqdvqe0beZsj0W1+/6IYImz3VEK1n7tel+Cu5xue67XZ4
 19FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzEXSH6Iajou7ujSnmKXyOcof1ocltThJPiz0IAXUnKjwviXKCFMajqPOB0RCT1O/QT0BjLtIHVw==@nongnu.org
X-Gm-Message-State: AOJu0YzKObrJpPRwWOdDB8VVK+fMlTTWohtST/DbZkMSGSyiErcI99X8
 Lnahaqcx0teU8Qd+QHORj57srzQmlshkdzPa7AdzvO8dNojX8EXssK4wSf7FKKprdFc=
X-Gm-Gg: ATEYQzzIBCejecxmNaulra3/kR1jSUwT52t0NgAhw2eH51m61WyNjxUkQ0ppmjZgmc/
 yuS1wIoVCPyBmERqbxdeQGfvh2m8cy3piTOusKwHwRahxx+uhCCacz5sYH73CZDVjaqd0d+a8AS
 /7zKHl427DEVef+tmh5pvuJKFaBzZ85/I4uTsDJVsFGizEcNefxyBK+g4RlpwC8sjtYv7QkZMmO
 jt+1Mc6l4Dak2c43Q1B45d2XASpV2ZBnVlEnLqjWB6Bxmmen2EEjUUWykob7c8qpqa/K7d3hSbp
 PcHUA6JdiMu9HdPsJT7v4Yp6ktfJAlyPAeUrEdqUOmH2+0coVDxEWesoXLs79EKlh4Sj7gPxFKU
 PMziELQocOSMtzgqZzCjZVroe656a2n64SwiJEbdFfV64kTNG4SYG36F4PAynNizuvTFxtFSRYe
 mEAglhrJdvtEKgfCn8bCgBGuo=
X-Received: by 2002:a05:600c:6085:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-4852692fec0mr46154375e9.15.1772813853662; 
 Fri, 06 Mar 2026 08:17:33 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fad2812sm207962835e9.1.2026.03.06.08.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:17:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 26982689D2;
 Fri, 06 Mar 2026 16:17:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH 3/7] tests/tcg/multiarch/linux-test: use portable alternative
 for dirent64
Date: Fri,  6 Mar 2026 16:17:24 +0000
Message-ID: <20260306161728.2657486-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306161728.2657486-1-alex.bennee@linaro.org>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


