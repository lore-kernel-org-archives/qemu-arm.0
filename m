Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA1CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:21:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I6-0004SZ-I8; Thu, 21 May 2026 09:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hm-00046A-KS
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008Pq-RN
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490229aa522so27286075e9.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369461; x=1779974261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVTDcNZTZsftd7VvIbQIcjuB5bDqzo96ZpCh3xbnQvU=;
 b=XH36zsa5lQ4oS6RauoKEW8kvSb5icx4M+6hJJm9FUjybgFORXh28803waSTxask3cc
 dH3JjHeUhTK0+3h/CroNTLk8RnHiVnd+cJgyCejDFsR4vxA3O9L11AQirIyZyBSJIqsA
 1tctQz4BFgfSVGzl7i2mJwurOOvDjuAVUXTzJjR5/F+cG9xP24ZkXFvEw87oayDYMvj/
 6RQ9cn1o1neVPEa5sDYtJWufzmYeJ1diaus7a7fEEv0xN6wRC/m9P8Iyl2UKbGkGuHsL
 lwPOTiKB4ibEhXY0P5CsYxkjnsErRaNT6Ukj9965HXz5WeUfgfIOe8B7R6Wsrme+AKrg
 S2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369461; x=1779974261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uVTDcNZTZsftd7VvIbQIcjuB5bDqzo96ZpCh3xbnQvU=;
 b=A+L4v3+QwzvuCsjg0YGis45k1I9rpdUoHIaS/497NvWaQAKgzn+IrEW0LF5Tmdtpgr
 955OFw5PNzhTqEB6ZjVUq3HGhDHCRG01/Mw9G7mZfWipknUEqUzx0NWTiE0KGaA7C3Yr
 o5G/+RqDEFsBTaHBoNQVzoUfYfUhUzlkoSuN+Nc1YEkuaNGtvPCS8Sk5DcsrR3PLJFwZ
 olGBRYt9Dfx3nUf1xU1a+BvzHPRcl7ndxjqWswuCmsEvN4A+HkJWp+78woUSEmO5djAr
 fu1wkR02Ezf2pjtmQT+OjW7+uhVJJ15CrQ3tiQkq2TTccK/4+m5q5945rkTbCT4RxOh+
 Xhaw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JLEhI6YRpQXFSWfz+1LE9qMZ7Ij8uuKRHfENfHvGt23NJDa1ubdnjr34MzcMccp388bCGyjFatg==@nongnu.org
X-Gm-Message-State: AOJu0YwFKfc5nYO6hAva4W4Rbb/U1RzGgesJlhi99L4qgSjJIz4fgXRh
 ZwLeem6Tmu8KHk0llxpQvDSoNIDpP0E4HYtC08zO1FYt8Jd9UWhoeoWM62REhRyEdlU=
X-Gm-Gg: Acq92OE67C7T+T8XsQuVUCzWoS9BsW7NsgQx3kDEw4UHui5N4kzJg4StGur2p9xYre2
 Jl5rcKw0Vu6jzVQezXygJaIjzR4Tn49SXY5jsU+E/Mp3OzY8miyYhljQu5JlAf8HgE1Nuu6eiF+
 6ge+FrP0IQl312heEj0BwOnAK+P7NnjxVFyxN0iVzdlgan6EtIZFlWBLZqQh7d1t+Dj3kedsgex
 V09AYkVQk8nwX6Lj82cgrGiG2Bgj9DxKJnQxWCoCMHanUj8yWBU3gXlrbPZtk1JiYnJrkavRFCh
 ed1SaghxASJ6g2Za2kh7+mgo8DzZLPMrigPbQelIRDR86UB4whS+VprqzaRCnuBU3vlbOvsdXF7
 anRLHXQCMGqOJo7Vq6FojVLU0ctsb+ShJvcTpEIfHSu1x/2sfJaQLPWpyCH6NJj/TzLUHa2cotx
 9dseTOkHsvrLUJAUoo+uAWRUAK2zVSwP4BSw==
X-Received: by 2002:a05:600c:c0cc:b0:489:1f97:6b1d with SMTP id
 5b1f17b1804b1-490360e4a0bmr35200645e9.28.1779369461163; 
 Thu, 21 May 2026 06:17:41 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d3514esm73435165e9.3.2026.05.21.06.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6BC5B5FA15;
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
Subject: [PATCH v2 02/16] tests/Makefile.include: fix typo in comment
Date: Thu, 21 May 2026 14:17:24 +0100
Message-ID: <20260521131739.540157-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index f257288194d..ce6a0dccaf4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -41,7 +41,7 @@ SPEED = quick
 
 
 # TCG_TESTS_WITH_COMPILERS represents the test targets we have cross compiler
-# support for, CONFIGURED_TEST_TARGETS it what meson has finally
+# support for, CONFIGURED_TCG_TARGETS it what meson has finally
 # configured having rejected stuff we can't build.
 CONFIGURED_TCG_TARGETS=$(patsubst %-config-target.h, %, $(wildcard *-config-target.h))
 
-- 
2.47.3


