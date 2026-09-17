Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD30C982DA
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:56:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FPV-0007la-GW; Thu, 17 Sep 2026 12:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPB-0007dw-0W
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:14 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FP8-0000ZT-Rs
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:12 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so6700605e9.1
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664169; x=1790268969; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oPOWxHS0d1jT7jykpKpVrwVuMvWtlcCbSwn8vdkbyyI=;
 b=vRWVRomMvsD8Pjy/CmcmhvAXlQC0M3G4V52toN1fNlDb2CYtKdyLzHdUZW/SMfYlGw
 gKatg+MSAGP2UPoKowMx54drTALjRiJ79khF21FpMOc6JTD69ZQ9yL5p0M7YVHIChWx8
 PEVdpLRXmEx/t0UVmJMO+maSZcPYPjHSAg5XR7CKMeCvUTEfu0CfYoPWTavZkGtOnnwH
 NTIINSYuiaYs5RJLyPdJrrDbze57a6QVOC71NFQ9jgqdrPHrIqHhjq8yFTJqJLNnii11
 xWSVF2VtJRFuvAMv3K2Bwy3e+4E91yuPP26VnV7aUUAsJigY4gRXUDSjqR/WAVrXDBfg
 NMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664169; x=1790268969;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oPOWxHS0d1jT7jykpKpVrwVuMvWtlcCbSwn8vdkbyyI=;
 b=xmveixMck75SJ+sYAoqdTTqY9ulhuHCRd1OjaAGpuFkJgHb5GyGm2EIbr0b0wamKMs
 tsOBxaFwZx80sc5rLhjXzBqoD8NBkS2YRloYA4XXOgHoVve9+YOCz1gP7Zrtew87pueM
 AibNtwxo3bu1suAr9+l0qNg4xzJEyb3ndIGXB1XoxDw5zOvK0o8ZxMwnC2f+pww+GNaK
 EQ6JlIsrM+8kchypVeXkYsnen15crb8YyXPnbHDycWu8XruZQm/pI+JUtl44Vx53z+3y
 SLLvF/hLzxOCdeKKNg1TRmc39YAWTRQij5SuMGFZbgZSTG8RBaaEo1KWwY+iZ585nm0w
 P6ag==
X-Forwarded-Encrypted: i=1;
 AKwUvByHCyiFZK9OVwP9hlZkfs5vhtpJCGiT/w+a+5rn0ibKaDu3f0VsS891afhoEBmUdRO1fVxs1qGYlA==@nongnu.org
X-Gm-Message-State: AFuF++kiegPiLQEPP1RDbNNBNU1/tM3iEjs7pMiPrqbs+pe/b7HpwLke
 yi3Mk0iNQGVueKD2VhcYcxgk4Iy6jIg0Cao9jcUzKyrfJM5SwgICc3u+esvUXE71zak=
X-Gm-Gg: AYBFou0yenPLyx5agjUYoW+U75yvk8rfWQtu0wiuYuWXN34GwAdXI7x7sPG4IPen8NE
 MmHJvBYJIzy3me+gigP92VsRuL0srtNqEJYuy32d86Fi8vKdsGaWTFPa/AE6PNDbnjPny/DZsbD
 BoAHpPsjg/5d1trQKuxGHsc/AWeYbMegt2OYSsNeLWj5V+fRfzqUaQSkbBLBwIImJMDxFX76X8k
 BnneBfnyiawbUXrvb9YyhQNy1xuoI4RQoWk8QcO0aFfmcVljIHHdHT8I6WYNdtOurlj5zSuEgQA
 p0jBuya0f3oDXNo6SxSVweDZMa+QmNdS7jtLxY2LAR6buHmU2w/onJ7+WjnmC29SFP2JL6KpqA9
 qq2Jd52zr7J18qIlsV9lBF1IvJZW12NtQ1htF1+OsIVF7Rm/7h2eYb/VaDO5N6CeQ2gPvqplICM
 1E/AL4vYIW/onO8XQfv0HucDnsc9/4wfmGWGSaCNqaeFPEHRwBR+i7MO4A4ULSY9nxONwOXNo=
X-Received: by 2002:a05:600c:1da8:b0:49d:2555:1a6d with SMTP id
 5b1f17b1804b1-49ec0549868mr185819935e9.16.1789664169311; 
 Thu, 17 Sep 2026 09:56:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd22dbf2sm82495085e9.10.2026.09.17.09.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:06 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AF6845FA6C;
 Thu, 17 Sep 2026 17:56:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v5 05/17] tests/tcg/s390x: Provide the libc bits needed by the
 system tests
Date: Thu, 17 Sep 2026 17:55:49 +0100
Message-ID: <20260917165602.3405537-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

The meson conversion dropped the SLOF libc include path that commit
3fa010d5317 ("tests/tcg/s390x: Use the SLOF libc headers for the
multiarch tests") had added, breaking the build on systems without a
cross-libc, such as Fedora.

Rather than reintroducing a dependency on the SLOF submodule, which no
other tcg test has, declare the three functions that the reused pc-bios
code actually needs: memcpy(), memset(), and printf().

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Closes: https://patchew.org/QEMU/20260910100120.2076092-1-berrange@redhat.com/
Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Fixes: cd81cf86834 ("tests/tcg/s390x: system tests")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260915110959.492195-1-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/s390x/libc/stdio.h       | 11 +++++++++++
 tests/tcg/s390x/libc/string.h      | 12 ++++++++++++
 tests/tcg/s390x/system/meson.build |  2 ++
 3 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/libc/stdio.h
 create mode 100644 tests/tcg/s390x/libc/string.h

diff --git a/tests/tcg/s390x/libc/stdio.h b/tests/tcg/s390x/libc/stdio.h
new file mode 100644
index 00000000000..c3e45995f65
--- /dev/null
+++ b/tests/tcg/s390x/libc/stdio.h
@@ -0,0 +1,11 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef QEMU_TESTS_S390X_STDIO_H
+#define QEMU_TESTS_S390X_STDIO_H
+
+#include <minilib.h>
+
+#define printf ml_printf
+
+#endif
diff --git a/tests/tcg/s390x/libc/string.h b/tests/tcg/s390x/libc/string.h
new file mode 100644
index 00000000000..1cabeb90adf
--- /dev/null
+++ b/tests/tcg/s390x/libc/string.h
@@ -0,0 +1,12 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef QEMU_TESTS_S390X_STRING_H
+#define QEMU_TESTS_S390X_STRING_H
+
+#include <stddef.h>
+
+void *memcpy(void *dest, const void *src, size_t n);
+void *memset(void *dest, int c, size_t size);
+
+#endif
diff --git a/tests/tcg/s390x/system/meson.build b/tests/tcg/s390x/system/meson.build
index ca07f503058..1e360e70821 100644
--- a/tests/tcg/s390x/system/meson.build
+++ b/tests/tcg/s390x/system/meson.build
@@ -6,11 +6,13 @@ link_script = files('../softmmu.ld')[0]
 head64 = files('../head64.S')[0]
 console = files('../console.c')[0]
 ipl_inc = meson.project_source_root()/'include'/'hw'/'s390x'/'ipl'
+libc_inc = meson.current_source_dir()/'..'/'libc'
 cflags = ['-nostdlib',
           '-ffreestanding',
           '-Wa,--noexecstack',
           '-I', minilib_dir, minilib_printf,
           '-I', ipl_inc,
+          '-I', libc_inc,
           '-march=z13',
           head64, console]
 asmflags = ['-nostdlib',
-- 
2.47.3


