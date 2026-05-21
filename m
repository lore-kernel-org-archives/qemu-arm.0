Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB9BCD5BB5
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:21:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I6-0004Up-Vc; Thu, 21 May 2026 09:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Ho-00047Q-Sl
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008RP-UU
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so35008715e9.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369464; x=1779974264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bul/NPQCy5f4BoTanQnpnei+z/q7g1Dscne+o+Wvxt0=;
 b=wee2ghKEFwdJlNMbD1xRMHejlGX8tK5aSuv9urXuDbcbzMurayC5mKE1PyWfvzjM+9
 eB8alKx0vzBgXzZ7d15YpTMeiU/DtQdehAbK4JYtPasn7Yr3mm+fiFeJEBq3aYLxOvtC
 VckU8MBTtPslR+1f9GE57ayhcke0giUqWAHfdFOifOB/GBAWj1BGuZA9dWE5PwLu0an1
 A8wPelrXIvbgTLFNBEaBwrD01B4m7j7aiktuDPKcDyUszNrXo2n2LyVHM+KP5hovKFda
 Uaj+gAxySdpVl5t9cJTTZl+g/k+tBKGUTVobetQ3BnetmzT+o1hkqzbaOAGgGC/q1wun
 1Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369464; x=1779974264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bul/NPQCy5f4BoTanQnpnei+z/q7g1Dscne+o+Wvxt0=;
 b=XB+n0QeMieKPpbxFY4CmbOkLOSqhBqmKk33m9nWTZkPd6UX5FO63Rcjs4pdB3U5UsD
 EOAoPuzIWxvcedtgh0O80rdPag7kDV2FHSm5skV7ohkxcad1uwYqYer3gli98jjtkgp8
 GJGpa9OKFXeUtOS8emepao+hsIJXO5ry8U3tE8NszYcMt6ZsQFTgPtR8B7Pbaqt/gwtQ
 F6BHH5NmEBuFWbXaMqg9yuqjFHCLw/WFpPckoJ7eTPKg3F9QAmdfi+etPnqVxS9j8wX9
 dDYbjDiJN/4emGrKQJ0OKDQFiQuCsyLCpsXnoQyWA7+2aBOmRSOPF5yHQlorlMwYrpFw
 MpKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/jyn5YTG6Nc1hAndEI3SSFlAUY/o9WSz8+oIH7a0CNwy0OYmGt//l+CcPtgSAbNLAb2mrvt+WMcQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywxd3iq8WK3x5VZ3LoUlH0qdFDDPpHw7SteqlICXnQHMAlAc7ny
 YDucyvuyxuFUGe6QYDjxRSEULEahIBHjj4i0SpfAYxV5WXMbog4Q6dXfsR3jSokmvkQ=
X-Gm-Gg: Acq92OER40245ySMz40atJyqHTG1XDcaQSKfLzmdHN0e+wOaPj57nGMNIf2qPEznO/F
 ytYDNx+Lvd/1POhkT9W7poPNm7apGhFaFvnG0r3726YI6QnJXWmBTj6XmNAHLW8mV+bbFAffqKv
 mpsilm1BSTPU9BU/pVSqSN0f2nZt884pn18v5FTKrCmSwRIj1Ml8qI5srOZ0Wir1FMn3tUoM5Kg
 /vlOefoZ74HNmjQLwAHj84csAVSajDoksywHFAM4/eaKMbVLtiTRSoz0B48cjY1eAmJ25YQOjBo
 f9CtW9g8o59YfiQSHkAc0No8LUuw9dGJKDWqQQqRupEKhDJ6tgVPo1HqLXiR5XT479lNNsG+UZn
 84ydf/fF7JhwcUS0BVnLXUfeULLK/SSUuhted5ONorrn+7YnAx73mSNleXrMCsSOs2EeP6UcXO9
 ly1qEKwq/YQyt3WlnYXQj5o1faRq8H4zgxRw==
X-Received: by 2002:a05:600c:c104:b0:48a:534a:eed8 with SMTP id
 5b1f17b1804b1-49036047933mr23536725e9.1.1779369463818; 
 Thu, 21 May 2026 06:17:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903c99cb43sm25940995e9.4.2026.05.21.06.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E806B60200;
 Thu, 21 May 2026 14:17:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 07/16] gitlab: add MacOS 26 job on gitlab runner
Date: Thu, 21 May 2026 14:17:29 +0100
Message-ID: <20260521131739.540157-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


