Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F813FCB61E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXs2-0007nF-B5; Fri, 06 Mar 2026 11:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXrr-0007Bf-S5
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXro-0007jF-VU
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-480706554beso102626115e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772813851; x=1773418651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mLlYhevNBx1GJAJSsKhF0X5f1ICD6COWMYXfp0jSceg=;
 b=akb0ncBVVZMQMcgoGQVk7DnKpT4DgXNSSc9DgXnPs9xaL+ExSsz2au3UeXLgYLnU6e
 xhy0WdS/nQBXgpZ10SofaSOT6uzfiTkLcYFVSG6TpqC0n7U6rHWSCnEYrhe1wlGHgpKa
 YK9u6UPbA1C8gp/PdmALS9pAoFsFlrZexgm4BuowlxMt2knnpZmHAFRqRpFbjanI9Qi7
 UaF92ANELQgJ5niQzunaSLTDJZVudtfkyCIYbei/zmMyhzY3VIvK25cOo1Xi1Zs6n0ZE
 E4cJt6QJBOkfAVReGxINwc85YUjr/n9WdZV58RzNjw1CXwveyWl9o19q1rRV8MyK1YqM
 NJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772813851; x=1773418651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLlYhevNBx1GJAJSsKhF0X5f1ICD6COWMYXfp0jSceg=;
 b=F0jvyxcBZ9tmKwrPfx1E+WuGvtfW2RCWHM00o8F+TN+sAnb0R2tnYghzwsKZXRKuF8
 ssKDyWZQ6vGTccLzAiO/PSgnr6nWqCSSwtFjjUnxBfLGlCVBC7376thZg8E2uAjSaA70
 mwaxDTCC2haPuefotdq/oObnvIWMAwa2Pj2f34uFA4p41ZnZ/405KFW8bHgE2m8pz2Kb
 HqcS1xFv5mXd9P4+cREwTienEXKAdN0vVFhA5WK5lD/uAVyv9NVm9dESutRDNTb+dlGw
 +pW8DfghQJ9vO59gE+S/G6Y1D7G8umVGo+GGuYvMpfvn/KVRM59CWuqLAclDQNwczPRR
 YmKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6qvOFQcB4+ElV6fHndI8A1uvq28NinAutwv3pqscNAfzgxQYWLFmLJIZWuQtSunuY/wOQcnl4LA==@nongnu.org
X-Gm-Message-State: AOJu0YwUmmC7fi7EZ2QNgW8Pgc2CqTWHmz87Lg2IVa14dI+2E39vxaAH
 ngDg3K2KRylFt1tErrPPOI3ofyOIt1Ab4R99MSkHPiWyL37ja0g4Y6zDqKLwKtUGcEA=
X-Gm-Gg: ATEYQzyaCjRjF7Qr6+WFYP1UkzJiPt5LjpbgxTkoHQigIJnpKwzpqZ4y62eFkA5rkjp
 5uYv3WtzhM4m+bBuRFFKteAcgYrT8qSowZnuikKun7DC8UI+p0hlQ3ttqvc297hlw1uH4t8M+jE
 XwHH7Gp9sl99b0z/qgcli9EmF5GPUO6/xk34vonpTVNTOxVdVM4kYwln5cfrDlZMwAYmbHxHKIF
 R++PMvG2w1IYb2kY+h+aJ/0c2uuPRq7DErWbnpRbaublSfpSrXxDPtCEuXCNJozaBWZw+Ju32gd
 HSlOax42aIBcER9aMAb2Frg2jkjHHEVGa0/HM79PACJxdheWX7L7u+BRZCQJ/755peluahqhDfR
 e64l6MN33fJRP6Ocxf0Xyc+kuqj0hpXPJdmvicNplafhwe7Kg8sAYlmufvt5UYEu8FwoyYkE6lh
 R1wt07R0MLHPfZ91wfVTpHmFg=
X-Received: by 2002:a05:600c:3d90:b0:482:f564:d613 with SMTP id
 5b1f17b1804b1-48526930529mr45918845e9.15.1772813850868; 
 Fri, 06 Mar 2026 08:17:30 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb277e3sm113616975e9.10.2026.03.06.08.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:17:29 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D5B9D689CF;
 Fri, 06 Mar 2026 16:17:28 +0000 (GMT)
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
Subject: [PATCH 0/7] testing/next: gdb-multiarch, check-tcg, vbsa tests
Date: Fri,  6 Mar 2026 16:17:21 +0000
Message-ID: <20260306161728.2657486-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

This is the current status of my testing tree. The gdb-multiarch and
filtering changes should be pretty uncontroversial. Due to the
enhancements I needed to make to get the vbsa linux tests running they
may want to cook a bit longer and wait until the 11.0 release is out
of the way.

Please review

Alex.

Alex Bennée (6):
  tests/docker: add gdb-multiarch to all-test-cross
  tests/tcg: allow filtering of TCG tests
  tests/functional: teach uncompress about zip files
  tests/functional: allow tests to define decompression target
  tests/functional: add the ability to send keys
  tests/functional: add VBSA linux tests

Matheus Tavares Bernardino (1):
  tests/tcg/multiarch/linux-test: use portable alternative for dirent64

 tests/tcg/multiarch/linux/linux-test.c        |   5 +-
 tests/Makefile.include                        |   8 +-
 .../dockerfiles/debian-all-test-cross.docker  |   1 +
 tests/functional/aarch64/test_virt_vbsa.py    | 123 ++++++++++++++++--
 tests/functional/qemu_test/__init__.py        |   3 +-
 tests/functional/qemu_test/cmd.py             |  15 +++
 tests/functional/qemu_test/testcase.py        |   9 +-
 tests/functional/qemu_test/uncompress.py      |  25 ++++
 tests/lcitool/refresh                         |   1 +
 tests/tcg/Makefile.target                     |  12 +-
 10 files changed, 181 insertions(+), 21 deletions(-)

-- 
2.47.3


