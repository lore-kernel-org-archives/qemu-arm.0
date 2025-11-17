Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DECCEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:58:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxqE-0000mJ-Il; Mon, 17 Nov 2025 06:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpi-0008W0-EA
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpZ-0005lU-Fl
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so44804035e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380536; x=1763985336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pLA117aLx8OKVEuzuGnq17EtRt0jncWZQKbHjbOJms=;
 b=DZypyh8ZLj5d2jZe/fWt7O0r0V7rYGVAsFDAeJQI1RWWJB5Z8pMb+ZPpJwlFU0IuVy
 lhCJKugFBqIQ9Ewt1LCDp3CihxDw5aM/ZBHEc0zUIYwjUsL+RBLwv4CHRumLq8BJ9XmJ
 M7qvyk/MNL3EpqYJHElZbx6gsvSN7C2nOSd6zPYfXMwVf3t17L/kZQmW7K/Q910C1RC8
 i733K/xim3SOxst1oGAPpEwrF9ZFIL+pteMHm7iZSdCGDTADOz2lbXPlijAATqwuytvr
 TZIuEdutDLEUaEeuwAgxp7z23Sp4p6PdWDKTedR08NPmLV96t++1HtfUe99zcJV0s8G7
 +4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380536; x=1763985336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0pLA117aLx8OKVEuzuGnq17EtRt0jncWZQKbHjbOJms=;
 b=BtLB5DgZRCG9ITwcnEz+9YNP+7xBwo1ITtoao0pv7wA77i7qMuteB25FrY/A41hbNn
 Im2G7V3FRL0O80Mwsjp3JC0TMHC1HN/C+UwaMXLhn0EtfSZQFEZXWXIVKlhlM+8415kB
 oAURP847C5YLuNzk5l4UDeYSmJJPp2AgmM6aBTqdw1t2qf42IfeofPW9qmxe2zb4QpPt
 BGlL08twpRyYBKl6hLwjz75XWo4jUMj9jhdnfvVKuf6r5/NK8jYdEYc2cy06gQO+tf6Y
 NEmBj4DmQmu4wMkD2LtoYDYKUvHajx3TnivolO/hMtxt9tZYhb6a8pEoAtkzHY2nKWeJ
 /uXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCCITbiHAcWM5p8jgXFxKZaTSrEbz4Baz4gvugF/gOWmJwmeFOQrjQSo9zd76vtU6BjwWAed5n+w==@nongnu.org
X-Gm-Message-State: AOJu0Yy5vItjzCSW7DBsC2NBMX6qdf8j4dOKN/G1fbl5iJKpwTRsgTOY
 ssd/OVcr5jhCShvu59Ci1Kj6kFN5nST1ZG1Aq4curuE1c0YKpCPtk0PjB/X19zFJts8=
X-Gm-Gg: ASbGnctlL/TVOGXpMkSiPkXwekSSGjIv7Ny1qZgqAr+m5gppxj3xQFXov8Al1J3SZS0
 o1xYxuVydU0FZu5NfhIqKVBvNy8wc8P7kzlfJZo0RAhQiWpzJjYThPP8MeHvtqg6Ja4iGxntCCN
 2tr/dBw7t1/sa88+QRzBF2aKo8auoBS1GbwobRlfmEa/a6ebuVyR5KjqD5SuPAXxoa6zkB2XWJX
 bkAs2rXa3+vU88sQUqcLvxzeC1/c6aeBLXFk37H5LUYtwuSPvfLT8g3iG8MAR49KRvWpQkCrHTc
 bGnR9V0BJFEhzwLc4knWz/NuVZVoVfDpCbAq+l7EiuI7CqnirR9unr4kiMQ+miiP4foiGArzKwP
 SJKAYcY1AfOhSn24fKQOGRqYX//HZOIF+GyCDo4LAtpu+RjVgm+w1Wt8XcGw8X9+VMYYxMci0d+
 /K
X-Google-Smtp-Source: AGHT+IE7YgioKwfMhYCDyzcq02gmWYCc9GX4ehCIAAZ+KH4Uq9aGyHcTfizgT9lBJEikg1oQOPKUwA==
X-Received: by 2002:a05:600c:8b22:b0:475:dd89:abc with SMTP id
 5b1f17b1804b1-4778fe583f0mr109107985e9.11.1763380535691; 
 Mon, 17 Nov 2025 03:55:35 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779cec0f2fsm47031315e9.10.2025.11.17.03.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A55E25F886;
 Mon, 17 Nov 2025 11:55:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 14/18] gitlab: simplify the ubuntu-24.04-aarch64 rules
Date: Mon, 17 Nov 2025 11:55:19 +0000
Message-ID: <20251117115523.3993105-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
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

We don't need to duplicate the if rules to get the allow_failure and
manual behaviour we want. Clean that up to keep all the rules in the
same place.

Message-ID: <20251113102525.1255370-15-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .../custom-runners/ubuntu-24.04-aarch64.yml   | 43 +++++--------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
index ee13587d99e..6f950baee0d 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch64.yml
@@ -46,26 +46,16 @@ ubuntu-24.04-aarch64-all:
   extends: .ubuntu_aarch64_template
   variables:
     MAKE_CHECK_ARGS: check
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-      when: manual
-      allow_failure: true
-    - if: "$AARCH64_RUNNER_AVAILABLE"
-      when: manual
-      allow_failure: true
+  allow_failure: true
+  when: manual
 
 ubuntu-24.04-aarch64-without-defaults:
   extends: .ubuntu_aarch64_template
   variables:
     CONFIGURE_ARGS: --disable-user --without-default-devices --without-default-features
     MAKE_CHECK_ARGS: check
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-      when: manual
-      allow_failure: true
-    - if: "$AARCH64_RUNNER_AVAILABLE"
-      when: manual
-      allow_failure: true
+  allow_failure: true
+  when: manual
 
 ubuntu-24.04-aarch64-alldbg:
   extends: .ubuntu_aarch64_template
@@ -78,34 +68,21 @@ ubuntu-24.04-aarch64-clang:
   variables:
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-ubsan
     MAKE_CHECK_ARGS: check
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-      when: manual
-      allow_failure: true
-    - if: "$AARCH64_RUNNER_AVAILABLE"
-      when: manual
-      allow_failure: true
+  allow_failure: true
+  when: manual
 
 ubuntu-24.04-aarch64-tci:
   extends: .ubuntu_aarch64_template
   variables:
     CONFIGURE_ARGS: --enable-tcg-interpreter
     MAKE_CHECK_ARGS: check
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-      when: manual
-      allow_failure: true
-    - if: "$AARCH64_RUNNER_AVAILABLE"
-      when: manual
-      allow_failure: true
+  allow_failure: true
+  when: manual
 
 ubuntu-24.04-aarch64-notcg:
   extends: .ubuntu_aarch64_template
   variables:
     CONFIGURE_ARGS: --disable-tcg --with-devices-aarch64=minimal
     MAKE_CHECK_ARGS: check
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-      when: manual
-    - if: "$AARCH64_RUNNER_AVAILABLE"
-      when: manual
+  allow_failure: true
+  when: manual
-- 
2.47.3


