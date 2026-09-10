Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AEC88E40
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 18:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4jIp-0003xa-EG; Thu, 10 Sep 2026 14:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x4jIm-0003ta-Oo
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 14:15:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x4jIl-00072v-48
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 14:15:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4956869750eso1293295e9.2
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789064109; x=1789668909; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=E0D8WpUOmZ6uQghtDZOgPlvKzwogse6TvsFAvnzbc3k=;
 b=MlAUtgPCjDjscYAwFtooISaIKSUFsoFtjNZZg6zKMAoNh927CIWCC+hWZs6pocRWz5
 nXYnQbdpeKlkSm72QR4JfMzaEJ68Tbdyxfen7YerVfszQPax//6/+Yr3TRCRXn/jWJ/r
 TlLVNAYwkUAUIJmUn/tEEUT6s85RSG+8Bk9h0Cal+oPiOMUz5ERyRYm8tMuVM43Xfu2B
 9rJH9vrQenxz30PgX/JSx4FSYEJsIXalR3GZrJpUHvYWsJegWFVm7ZYVGS9ACw+QN9WJ
 pdcqDaM+BfG2aNpgzdTlpIDVjrR2eomu05CO9ciU60gTZnLkHpYAZzKgbUfGWniKWq/c
 SqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789064109; x=1789668909;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=E0D8WpUOmZ6uQghtDZOgPlvKzwogse6TvsFAvnzbc3k=;
 b=oTSQ5uF/cSw4UclA7bFAzb4/hMnzrrTxTI4DB6a0y/o3il6ruAMDF/FhltNSEaxVkj
 VZkGjpqK+Em2QcNCQ4YAdp8B3i3NDO0E/cOFro/Ox9FQQXdk9T3kf+9Dw9L9LKz0b8hn
 F6Ge7PzI0hStgcj+wmV+hL0Aad0eyjo6/NQQvXcEyYc3QjlQD1U28BpVm+qaFx5aiE08
 svmojbdyAFMGAIO/Dvbpg41ulwgtKkBa7eM9NJR+/tov4/NnVscRiU4+mEhMPaMO85wJ
 Rk8FPoKXcDotyoPYWNiQJUTeMbATv8TBJim6RGpHlq/ZCDuqVih8unKgRsuGPY+dFtaf
 AFtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqzaDeuMeJqjQw6msPH9sbSYLJIxizqP+hCc1/ClDfmHmKOf4vepXN1Ic/OTU32Rrih2ztBkNmwg==@nongnu.org
X-Gm-Message-State: AFuF++lcetwFE6tsY0yBML98nGqNx72K3NLzgEvl1LBg/vMGa9PGx3HV
 5Bzc+9gKZ4M5Yl+CJyoPDl7zAeX3o+vzZ4+KM6fiuf5YXEo/TS1rKopH74DmC7UkCOQ=
X-Gm-Gg: AYBFou3cVETJ72RfuUV65ITrtn/XGELpySPUsV+5Qoj0JgMmgFIAeFJ4pmirpWhklSE
 czCpNXJVgqSqKAtfJ9+6Brs6QGZtTLusX2HEASWO1xAUeDwDTJRdIBtyE42oyxUHOmmN0lbzR+F
 6J/+IZrdo5Z7QApXKgh1XUb3A6bX8Lx0D5RwwL1jNCm40ZSokm+NrmsDDZpJc/WafSYLHx2E52g
 lkVIK95RVyNXyWmkvPuroinMkkgbNly3QWJUoirPlDtXYk2EAYlgQajCw26QnXRM9uBEpo/WvRJ
 D93uSVpCTKVZwAcQe0BeSsveOc4DBfHcf/3THuBifw+jF1YRfDDVwk5m0t4NerNr6qAp8416ICi
 AZd/Va+UnIXXXcN1yW1L18w+hqv/1nu1Y/GIhEbhhrbRUNTeJ+QEFcrVI4Ggf/WugiAFlkFM680
 ucmgjyCNGhHQGsbezIqyeD2DLqTgyLtPqxCgfIJG1rMreiym/GKoa5bnoysIpIGdw+eEYPcC4=
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbff with SMTP id
 5b1f17b1804b1-49e619c18a3mr3062245e9.22.1789064109542; 
 Thu, 10 Sep 2026 11:15:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eaccaa1asm446824f8f.0.2026.09.10.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:15:06 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0C1565F834;
 Thu, 10 Sep 2026 19:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 0/9] testing: various docker clean-ups post meson tcg
 conversion
Date: Thu, 10 Sep 2026 19:14:55 +0100
Message-ID: <20260910181504.1010916-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

This cleans up a few bits and pieces although doesn't totally solve
the issue of an apparent stall while meson builds the docker image.
However with these changes there should be no difference between the
meson build and the equivalent "make docker-image-foo" invocation.

We also finally get rid of the ill-advised magic caching support in
docker.py.

Please review.

Alex.

Alex Bennée (8):
  scripts/meson-buildoptions.sh: update missing options
  tests/tcg: prefix meson built docker tags with qemu/
  tests/tcg: use --add-current-user when building containers
  tests/docker: add container registry to configure and use
  tests/docker: remove used _read_qemu_dockerfile
  tests/docker: strip remaining caching logic from docker.py
  tests/docker: add specific command to parser
  tests/docker: swap --quiet for --verbose

Daniel P. Berrangé (1):
  tests/tcg: improve check for working cross compilers

 configure                               |   8 +
 tests/tcg/test_cc.c                     |   6 +-
 meson_options.txt                       |   3 +
 scripts/coverity-scan/run-coverity-scan |   2 +-
 scripts/meson-buildoptions.sh           | 142 ++++++++++++++++++
 tests/docker/Makefile.include           |  14 +-
 tests/docker/docker.py                  | 188 +++++++++---------------
 tests/lcitool/libvirt-ci                |   2 +-
 tests/tcg/meson.build                   |  15 +-
 9 files changed, 243 insertions(+), 137 deletions(-)

-- 
2.47.3


