Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18281C624C2
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU2-0001GU-JH; Mon, 02 Mar 2026 04:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU0-0001F3-Ok
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzTx-0007fH-VY
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so31042615e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443348; x=1773048148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wljGdEyS4Z9nZiKech0RsOezG0RP3oczbwrNM7h6IQs=;
 b=QKE8jOb1LK56HESk1k/u2NCagJ6uueaZDW1zAJUW/EYqbqQcNTcA0VBzEe7RaEQwkz
 IPwrRu1wpGb4zBa2TTuvQRWxNhhfuKWdLAd4dgCg7QOiE1XgP1L92EJhI1ur1bvKXUCu
 A/elhuYeon2iLQ/1twBIV9mGeOchHBjfKIVlDMZq841TxbLHW3XwOTDkWS6HidBeDKfG
 7xP1wwBxjmOriSr8pt/LQMel3AP0OTmMxtDAKINxUsfIjTCZJiRegpmXoB913dzIimMU
 8riogaUrpPDKd8oZPkuPuWkFQ9Ye53dXjyK8lKfergDlgZHRjoDuDuOSoUPaOSQJ8pXn
 MZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443348; x=1773048148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wljGdEyS4Z9nZiKech0RsOezG0RP3oczbwrNM7h6IQs=;
 b=KX1EB7CfAMTeAU3kPyrX1qXgcuin8MrMgEubkBhuE0b43uED2uVLidSo3rKSr/nZSy
 fcNG4vw2MfaJgGYcPdNyz7z1++/HcCWOqPU0di2fPsEni+VbbiBBQnB6q47qlLlyHZ0w
 r1WK3NaT1uuImxOkDUruEkSfMNz0X9XwvKiHyLVNpXNghB+R0o1Oulv8nTSjx+cJD8v8
 ON9dgh084NBI10cgAiqDLGZhoFeoZrAb0PW5izc7aYICZ3BVy3VxppGssRFrgutzNuNk
 fEWe1j5NE2n9G/G3gTZ4D/PXmnH+yzO+cUI+9ORPjA/TCnVPdl6JC50mXgk4yVfBWoHq
 WSag==
X-Gm-Message-State: AOJu0Yw0hxmhh4qUHKe8i17SB8R9YPbGkuDx009O4ma4zTmA2t5xp4H5
 eoLAelDIlnTqlvNZ7h/YRomX7n8udX+oE9dO+bzT3eQj2VjI1COruD2z3lqQj4sSSnZ0iokz3Q5
 6JJNA
X-Gm-Gg: ATEYQzyNhCAlwprzYnTlM2ikF3G0I5+KPsCnxcM6k5iuELQilcoYcXDW1mmheuiFyuC
 nFEQXBNX71fXCxmEfs89GFUkBDO1EJkoQ0vgAtkZUcb8MAhWzleeqe7WgrGhvPavZFBd3n3wPW0
 nQYGrFuUJfOq17d0vBRQpUdPqu5aj0WA6UXxkBC5rSJ0JknCfIGBO5HrdBnKxDLTU6cOghd1PTo
 LMllt46mqcijNeF+FPqkS/wpI07rWSpnwwkn453tqBL52xpaRtYKEfkurBAXa0QrilDNlUAuH/9
 Z4Yf0ZjjDpgftr9DTobu7fmeJxaH7NSrE5lhX4dhGorc/4O8XWbzJp5LY/R4ZvKUTrWqcBHdZlZ
 BfQjG2m+2YxDdEJFZG2deRn1X4BKfjX61ETn3xTPa7Hb9BOT25kOBPbgEDVAcmli2hQUyVlGqnc
 dQvx8ATrHn6fw1jylX49D1uHw3+LRrlmVUEIycha/tcaM2Y6BTFHCt9kgppMrF1LJluCxqTkR9I
 x2honai6eTNHOg21sHE5Xj5v1gNRjk=
X-Received: by 2002:a05:600c:4fd4:b0:483:43d8:8d68 with SMTP id
 5b1f17b1804b1-483c9c191d0mr188677755e9.28.1772443348335; 
 Mon, 02 Mar 2026 01:22:28 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/9] scripts: Move lsan_suppressions.txt out of oss-fuzz
 subdir
Date: Mon,  2 Mar 2026 09:22:17 +0000
Message-ID: <20260302092225.4088227-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The oss-fuzz code uses an lsan_suppressions file to suppress certain
leak-sanitizer cases that are known issues or not our code's bug.
This is useful more widely than just for the fuzzer harness: if you
want to build QEMU with the leak sanitizer enabled and run 'make
check' then you will want to suppress some bogus leak reports.

Move the file up a directory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2: just move the file so we keep git log --follow happy;
fix up reference in tests/docker/test-fuzz
---
 .gitlab-ci.d/buildtest.yml                   | 2 +-
 scripts/{oss-fuzz => }/lsan_suppressions.txt | 0
 tests/docker/test-fuzz                       | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename scripts/{oss-fuzz => }/lsan_suppressions.txt (100%)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 1b656b9eb0..7548057c54 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -626,7 +626,7 @@ build-oss-fuzz:
     IMAGE: fedora
   script:
     - mkdir build-oss-fuzz
-    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
+    - export LSAN_OPTIONS=suppressions=scripts/lsan_suppressions.txt
     - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
       ./scripts/oss-fuzz/build.sh
     - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/lsan_suppressions.txt
similarity index 100%
rename from scripts/oss-fuzz/lsan_suppressions.txt
rename to scripts/lsan_suppressions.txt
diff --git a/tests/docker/test-fuzz b/tests/docker/test-fuzz
index 7e506ae1f6..d2bdc8afba 100755
--- a/tests/docker/test-fuzz
+++ b/tests/docker/test-fuzz
@@ -18,7 +18,7 @@ cd "$BUILD_DIR"
 cp -a $QEMU_SRC .
 cd src
 mkdir build-oss-fuzz
-export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
+export LSAN_OPTIONS=suppressions=scripts/lsan_suppressions.txt
 env CC="clang" CXX="clang++" CFLAGS="-fsanitize=address" ./scripts/oss-fuzz/build.sh
 export ASAN_OPTIONS="fast_unwind_on_malloc=0"
 for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f | grep -v slirp); do
-- 
2.43.0


