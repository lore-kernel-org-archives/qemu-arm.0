Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5702FCB61C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXs1-0007cE-8R; Fri, 06 Mar 2026 11:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXru-0007LE-O2
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXrq-0007jh-JS
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48529c325f0so3428265e9.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772813853; x=1773418653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vllX98KGLiZLLrBT8HEqhhUqOqA+FrnDnUy3NTzv/l0=;
 b=YeCXZtqFDHDCAaHNjRUbYeQYZK+0+Ea2oA7dmM/04Dp6aDZTVqCSvpJUnarfDlS4S6
 4rupG8FVo6aF+eC5gmQ6bPM8OiUa1Gn8Snc8e6dJVyhcHOxPV/kIMvy1dvrPhY7fGKqn
 zY36HbsRIGjl166CXuvEDoLtHgRjDDM0TeUn4HyoqTKcKhIz/KKhGrKf7Z6XShFXCWc6
 qk+6sTZR6WKHWAckJvppnmkMIgtmrstJnAVZUYW5GnHPClR5TcWo+CENXKiEe2qIhPGp
 GndeS1eHJ8aKl/vgRLFfJbyR9kcN8Yo+VZTPFR39SYDpEtMgAw1F7xCva51wz/LGGcx0
 S+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772813853; x=1773418653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vllX98KGLiZLLrBT8HEqhhUqOqA+FrnDnUy3NTzv/l0=;
 b=Lxni+RsJ1S4aD+D8sA5T8gKFw2+UgYmsjskIkPxgsHd6k+JnPqjNnAmAe05de+kP/N
 39PUixJK1hRsF0w8Sx5aeQb0JyJpfLYGwYoidrMd5FJU91LrGdpP7WuRHI+gMFcp+NCC
 52b2FguBtlNm9RlkrkTOoHv13ZNcg67DV9aW1bnhqbWbhE+Tq2cHcoVJH5fnGiAJ4DhD
 R/5I0lM/hQsySLGX4OkrWeHbCKhk9zK1eeK8pRpV1xSOGvwn5tYCKmMAaxyISomqVQ0C
 /qqbVKZnOPw6MaNs9/lrBa+UAEYzs8/xxUfbtJ6I7gG9WvvAL9k51JP7KZ/32LmV+PzS
 HLtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqWjKfIpnWvP4KMkzpe4L0OVdRTjz0jsOywCKN9pdCIbZQWYsE28mqauwOC9HKVEXwkfdaxXhIag==@nongnu.org
X-Gm-Message-State: AOJu0Yx0AhN967qB4QSUffpBeIFSX6DOKFdyEQ0HdVChW50Ev+c+HlwD
 qnujinzPf5z4l2gDs9SVG69ByAIhYTaTJaU7bPosJlsYB3js9AKuLEKfAEMQJqrFevA=
X-Gm-Gg: ATEYQzzjhX1P8v8OsqzRQfu15tQl9Q6koykWvdTf4fr20uHzuSNBRum5luPxyVzXPts
 GbQFh0tckIAgNpHdLo9JeCcQIXhcZYYARsWkeVB9vCtbLK3TGtx8u9+bM9zikyVVrT30uieV+EN
 KLit2+C4NMWW+FpGNJlPMsdCY7FrRMXsJINpEbGjrqIvRorK28L5yskXde6bBfLLRWRtpQZrYjm
 E0Q3VsR7SU7ByrjquQhqXFeTKY1MfJlhvqYWnL+p6hPG/MMWciwJzuEtsW5c+MvSOCTts5QY2mc
 hlT5sn2mpT9y4hMOb/KnyUkQqhLyh1wd1sqUdyAwi1qRCcxQC+Iqs+ihrSLNIMBRh1+9/pT3riQ
 VcEVT4Xv7+LZaqvq2MYiQgX3H0gWFNfPDkEreQKiMaDfpHcLX9iOX8AV0dAaXdGCjTj5YqN9Qqu
 ReOoD5t14thnkYCFV1gQ4/B70=
X-Received: by 2002:a05:600c:c491:b0:480:20f1:7aa6 with SMTP id
 5b1f17b1804b1-4852695880emr47085425e9.21.1772813853014; 
 Fri, 06 Mar 2026 08:17:33 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fad2812sm207962975e9.1.2026.03.06.08.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:17:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3D204689D3;
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/7] tests/functional: teach uncompress about zip files
Date: Fri,  6 Mar 2026 16:17:25 +0000
Message-ID: <20260306161728.2657486-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306161728.2657486-1-alex.bennee@linaro.org>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

Yes people still use them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/uncompress.py | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/functional/qemu_test/uncompress.py b/tests/functional/qemu_test/uncompress.py
index 5bbdf8fe323..f1a0e583a5b 100644
--- a/tests/functional/qemu_test/uncompress.py
+++ b/tests/functional/qemu_test/uncompress.py
@@ -12,6 +12,7 @@
 import os
 import stat
 import shutil
+import zipfile
 from urllib.parse import urlparse
 from subprocess import run, CalledProcessError
 
@@ -58,6 +59,26 @@ def zstd_uncompress(zstd_path, output_path):
     os.chmod(output_path, stat.S_IRUSR | stat.S_IWUSR)
 
 
+def zip_uncompress(zip_path, output_path):
+    if os.path.exists(output_path):
+        return
+    with zipfile.ZipFile(zip_path, 'r') as zip_in:
+        try:
+            # Get the first file from the archive
+            names = zip_in.namelist()
+            if len(names) != 1:
+                raise Exception(
+                    f"Zip file {zip_path} should contain exactly one file, "
+                    f"but contains {len(names)}")
+            with zip_in.open(names[0], 'r') as archived_file:
+                with open(output_path, 'wb') as raw_out:
+                    shutil.copyfileobj(archived_file, raw_out)
+        except:
+            if os.path.exists(output_path):
+                os.remove(output_path)
+            raise
+
+
 def uncompress(compressed, uncompressed, format=None):
     '''
     @params compressed: filename, Asset, or file-like object to uncompress
@@ -81,6 +102,8 @@ def uncompress(compressed, uncompressed, format=None):
         gzip_uncompress(str(compressed), uncompressed)
     elif format == "zstd":
         zstd_uncompress(str(compressed), uncompressed)
+    elif format == "zip":
+        zip_uncompress(str(compressed), uncompressed)
     else:
         raise Exception(f"Unknown compression format {format}")
 
@@ -103,5 +126,7 @@ def guess_uncompress_format(compressed):
         return "gz"
     elif ext in [".zstd", ".zst"]:
         return 'zstd'
+    elif ext == ".zip":
+        return 'zip'
     else:
         raise Exception(f"Unknown compression format for {compressed}")
-- 
2.47.3


