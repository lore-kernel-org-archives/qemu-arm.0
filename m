Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C4CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:58:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabae-0007J7-7n; Fri, 19 Jun 2026 11:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabac-0007Gm-Gn
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaa-0001HZ-VL
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so1866826f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884623; x=1782489423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQ0mCK9OBs7IJHUAjQclNgTtgQfnuHREMin9AW2vkCY=;
 b=l+qYL8kialigA/wgqVFu5cio0RdrbvPq0qZ2DiOEuvMkyHjRA5MlhAmH/tS+nNEkK0
 4Hjo7oI4KJG8w1IYBrxYp2CA83odsEcLo/7HxJKShCs6miVAldkHtHxi0GR/4t+RdZxF
 NQ9PYi3MR/HyhPFkpQFHB1XhC2gSGYdCl8Vvibpr90DGEbtl1YHu2nrHQSpZmA4RPngL
 s21PM1CBvdtBq1G03A7eQp3HFwxHl3BpVDWMVlJ900X7LBnBAVYfVbMK5jZS+DvAyXUb
 ixTX2rpnFCKWk2PDLSjkHVXn+f8Gk2NLhY67ZjIhfjrJEkzKCaijeUlSpPOaBbN2Ob26
 Du0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884623; x=1782489423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WQ0mCK9OBs7IJHUAjQclNgTtgQfnuHREMin9AW2vkCY=;
 b=bMjmdOOo3sRA9UsTnp2v15VfJZ2GLqq2iqU7jyF0WZwcQ6LIUsZUV+EDffKFXUm7wJ
 RgDy0BX77Fht5mD8eR5sDB/u3KEZSxtDPWz1D3HWJ3fSIX1wCTSY/fPGK8oq2xUBgGgz
 AGgTtatAT22iGuBaU6tMiNsU7QOuE3AR8LNXodJaaJS7cd20WG6IPh+X4nWS6JfHvUP1
 2Ru8YZQcpjA/bJzpgG0260OZIlmBDAqhM8e9q5AdJdckcnnCYx40GDSlJyAnKBQbJk65
 B7fo9Et4UTEckyWXPbH7XTJze9GHxc3Kqwn20kh7ftzXG22xEN6Rlj2VpwMfKP1PiuNt
 31lQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CCg+YLaeINTwC+OuH/S0KjYFMpq5YEYHo0aJONvkwDPeo7TUQj0qCJlImb/zvdACPU2tamJak6A==@nongnu.org
X-Gm-Message-State: AOJu0YyHKD8VXlDGSkjAcOT2EvzYNUKaggfVwkKML03Sq7DRh8NV2aUS
 hUqHBC6ah1AkWNtYtaD5kg/Z4K0ROPGzQfEuVJgCHwQ7k6zDYieYe5e3Oso3Z1yFTXw=
X-Gm-Gg: AfdE7cnI/YwG8VrOGfOxDZHA/hoP/9F3XW5vDAVOpoSrcdGmCmJo+XM7Ew32lmZWVsC
 +GBDroFCmMeh2j/Fp8F1KTrGukhtUUv0lP/cBkFyZAOUfxdXIEedxYnHm8ej6+te3hKZTLCIPcS
 QqIJrwwMqLmUvlcpRyebWn5nY7BPwEVh6EQjGJHh71I+hTK4Gwk3jKY29uE6EB3bHX1pseqw7yO
 DHH8EaJldJl1+wzmNnFJwQmX36YtX+CeUlhRpVvh+JLrCP8LyrLSf5lkxmvHy0VdNCazwAlJESL
 HI9g5cVOwLWz7nTNdqEwSzKZAm1XhzkX4LeEgXDzP1+gVc11avAhT5nJXRXrsyZPFVLhPZbWkYJ
 +yaHFBSAH1DsFk7dD1bWN4LPr0KD/J4HNkWcGk7V69k84VHWBZs4snw9Ae2KSIhw2WIY2tiuKWl
 rPPujP/S/EQ95E
X-Received: by 2002:a5d:5885:0:b0:464:7fc2:d9f0 with SMTP id
 ffacd0b85a97d-464fff62bd4mr7465486f8f.3.1781884623528; 
 Fri, 19 Jun 2026 08:57:03 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5413sm63989f8f.11.2026.06.19.08.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:57:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D6F9D6000E;
 Fri, 19 Jun 2026 16:56:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Cleber Rosa <crosa@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH 6/7] gitlab: remove build target hacks
Date: Fri, 19 Jun 2026 16:56:55 +0100
Message-ID: <20260619155657.944220-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619155657.944220-1-alex.bennee@linaro.org>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

Since eef29e060dc (meson: build macOS signed binary as part of the
default target) we should be able to do a plain build and everything
just work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/macos.yml | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index 8366b4ad564..efa0fb666e2 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -29,7 +29,6 @@
     - cd build
     - ../configure --enable-werror $CONFIGURE_ARGS || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - $MAKE -j$(sysctl -n hw.ncpu)
-    - for TARGET in $TEST_BINARIES ; do $MAKE $TARGET ; done
     - for TARGET in $TEST_TARGETS ; do $MAKE $TARGET ; done
 
 aarch64-macos-15-build:
@@ -45,8 +44,7 @@ aarch64-macos-15-build:
         --cross-prefix-i386=i686-elf-
         --cross-prefix-x86_64=x86_64-elf-
         --disable-plugins
-    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x86_64
-    TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
+    TEST_TARGETS: check-unit check-tcg
 
 aarch64-macos-26-build:
   extends: .macos_job_template
@@ -62,5 +60,4 @@ aarch64-macos-26-build:
         --cross-prefix-i386=i686-elf-
         --cross-prefix-x86_64=x86_64-elf-
         --disable-plugins
-    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x86_64
-    TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-tests-i386-softmmu run-tcg-tests-x86_64-softmmu
+    TEST_TARGETS: check-unit check-tcg
-- 
2.47.3


