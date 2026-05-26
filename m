Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404BCCD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:05:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpZ8-0002j2-Gy; Tue, 26 May 2026 07:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYo-0002ak-AA
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:59 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYj-00067W-6d
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4905529b933so21205265e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793371; x=1780398171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpNFrHwCTegluEwEkg7Y+CXfscfOfe38FMBiShMQhEM=;
 b=I22g7ic+dKyJE6x9j5ggXN4LZOOpY03bIRiPQtzd2Cv5Hj7opQ0C/i85R+5AF7C370
 QrL/pbHHD/ZygVT/PZ19LnwNbSOucYLE+VzhIy6MLNNJq4tN4JmwCaTErp+hWk9uX7BF
 xH95hAA3tKVOIRKhX460z/s+JHA25i7+TSsrbrm7XaOCZ57bop5U0THWR59k0M6TbYrY
 ZSyjADcB19WmX7IevOol+uaiU2ziVLd5dffH9YZOgAQvas8OA+2Fzj+KJFYZKfdNtXZG
 e+dRSkKGEJ4nzYCSOMaLPW8BpXzJKRRAYSkiTknmP+buoxcZouLlgE7DUX7/UjQIudZ/
 k3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793371; x=1780398171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GpNFrHwCTegluEwEkg7Y+CXfscfOfe38FMBiShMQhEM=;
 b=GmVVyDp/McGhB58LeuafvUBk+BsipHPw1SSjofrQzGVXPNPCCI/4EBMoZXjJA07nEe
 4qRPTsEDVio3mfqpepCc2D8BWpV67DYJbnY7R5NCJlHGUOr+8GHdaDCZJDKBq28nSqPR
 GBmWVoSsnKk239o3AuUWt5fgvCzVP+o200900MJH/2yZAL+pixkQiafYvHkbDQJzlCj6
 dJYgY98F6FQzXV62+VA0bamcoYW2/0WiiCOhjl5jjr3CvmeuBvybr47Tx+8YmC+gBtnj
 pM2bEt8pUDIc8xl10WUmS/sHrT5WfiULcSLMfn8D1QwFFXxPNEZWNXomCVGytCdl4wWX
 DmAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8g+TOHltIeFRmrCDsLj7ZJuqgtz2HaBhgLjJ6ynXszSqxxqCh3xMTF5Ke/c8BsSASANVddp4O/4w==@nongnu.org
X-Gm-Message-State: AOJu0YwgzbNWcgOtOTrIKD3Yncs4WFkiOsk734H2eHJelxCJ57bPORgi
 hzIJWIDUr7K3kvqhYGaQuQMMwDWcBnJmUDDTRqbfpJSikzXHqfgmJxLhSQHq5k3gESc=
X-Gm-Gg: Acq92OFiY6uC424hlMDG8LNyKzJ42jWtidDubwqBI43K0sybMll1LcnEfQV9zjyqAh2
 +oe88MWgLxLVcJExNHz8gzg7xO+HrCXp5vkpt/gsDo6Q+IPMOviQgzfSa7FXQPfGHpaRGpeetCG
 dd7AMtcHZTj32KluuFLiBypO26b8U3Eg8/6bEQRVTAqJEvoeo3BNz1wkbuyNcISE0ULiIX39KbD
 5zFxurcj6DjhiSHoZPDotigJO94vhnCIG4MH26VOyKFGnm8OmYvpod/RG+odPYmxHYCAfGCePVU
 lI/4dzZip1FuAJ1S8VIlKrpvbfip5Nb294OYivpKxFXfhIFw1OGmg/YDSH0q02jpSzYB2uvnl9F
 mpM8GNrjja/wogDnvPKGCJqND8c1tfkWN+tHez+z5jIr5RhFaNkvu9pcJIF1bLfViVF5gtUVQsa
 Ne/eSPa1fKlAL0E3TsTbDMprs=
X-Received: by 2002:a05:600c:1c0b:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-490426aa7acmr338149405e9.14.1779793371347; 
 Tue, 26 May 2026 04:02:51 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454ac6a6sm326948035e9.12.2026.05.26.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2FE8360434;
 Tue, 26 May 2026 12:02:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 07/14] gitlab: add MacOS 26 job on gitlab runner
Date: Tue, 26 May 2026 12:02:35 +0100
Message-ID: <20260526110243.470002-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

gitlab supports 3 MacOS images with 15 and 26 being the current
supported ones. To get ahead of the curve lets enable 26 as well.

It re-uses the same brew list but also attempts to work around python
configure failure by setting DYLD_LIBRARY_PATH:
/opt/homebrew/opt/expat/lib/

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---

v2
  - call runners directly, seems to be working now
  - drop debug lines
---
 .gitlab-ci.d/macos.yml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index c93bf12a294..f61750a3f4a 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -45,3 +45,19 @@ aarch64-macos-15-build:
         --cross-prefix-x86_64=x86_64-elf-
         --disable-plugins
     TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
+
+aarch64-macos-26-build:
+  extends: .macos_job_template
+  image: macos-26-xcode-26
+  variables:
+    NAME: macos-26
+    DYLD_LIBRARY_PATH: /opt/homebrew/opt/expat/lib/
+    PATH_EXTRA: /opt/homebrew/gettext/bin
+    PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
+    CONFIGURE_ARGS:
+        --target-list=aarch64-softmmu,i386-softmmu,x86_64-softmmu
+        --cross-prefix-aarch64=aarch64-elf-
+        --cross-prefix-i386=i686-elf-
+        --cross-prefix-x86_64=x86_64-elf-
+        --disable-plugins
+    TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
-- 
2.47.3


