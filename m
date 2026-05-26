Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82630CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:03:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpYm-0002ZZ-Gb; Tue, 26 May 2026 07:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYh-0002XU-Jn
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYd-0005v1-LS
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso89873825e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793366; x=1780398166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2bsmuO+kVEMUScCu/3Tp/3Q2iWfYkMTotzXmGMcKJo=;
 b=EBC7A4tDyAeyJlDe9pR1uhQcx/FJSa2mRI59ORDQhi2wc/5Bup/6G+oSJlJZEhUVF0
 wVg/zHfndCXu+VdLdthAr//l2mD9oFEqWr1fTBkk5w53rIMoOW2phj4brwOeRB8WQQ+R
 75HBBgHEQ+hJ3c29m7RFuBikNK8JqUdHqAw5TdpTAZ5+NYFHscnYHJ0C0KnHI5AN+3qI
 6eqaD5eWB1XrafATSHyolkFIW78I4IIEmrYGga5BejyMbf0AZWXBQ0ITPHBrcXLNWcMS
 dL1GDwcH+Qkv4Yk6p9BVZRF+TKkZmreOf15GY5ZHuzfGWBvgDtxpUCTdK8Q7zbPOq407
 G1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793366; x=1780398166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/2bsmuO+kVEMUScCu/3Tp/3Q2iWfYkMTotzXmGMcKJo=;
 b=T2mQq3hGLFptNvgNKV+IZ4NBH3ld+8GPCNNy1LPeRqMEjOY1wAu2hU8uJEcjDnWKxq
 YzqbOM1XRQsKHYTz0NaYtu/QQ1hKisFCFCTTqqO9l7dPxXhffpsR3PjJAtNHi+DMZU1A
 ic3A9YGLvOLrWq12srgItMrcqYKM7QwMFhsMR3lyPqdzt+RN4/FzIt8EL/HAe98P/EHy
 nr18cCHuoY52Cc+hr+uwtuM0g8WAYiGnyxqCHstXamCg8LCDGCU+SWegW7jtMbfThZPN
 l7EcEFeitXc68Fj8fg28J8MvOKfHY12cKqe8m8RLU2f37IlebAGHfWABWPHDB5E2zuqT
 hEJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tlq7AkoQ6oJg2NcYXrX9u17ZuK8i2qvRi/8UkJoKl2ZJ8c+PG00wnnUis7uCrdeX76MTnLlJqAQ==@nongnu.org
X-Gm-Message-State: AOJu0YyDUIDzKPnjA3lXLhw8lYuI6rD+WRvCY7akXxBn997CV/Euqdhz
 2AMSVS724vKonoTCmCAWMhzOmsPOH/bBQjfA/it1EpyxHaHdu8uJzjht3UKz3pcEYcE=
X-Gm-Gg: Acq92OFllKXLBwy+YwbA8VSvROKZom6q8XHm4Lo1MIO0BmmF6dMKxFq3inJMxao5Kz0
 P3cNyttb/rvBXoxesHCQG+r4/o2qwRCWEsSTaIKguL6QXdqLr8wuGSZgQjxpMCgn4qWthaA0nb7
 87bSd+7OGAqCGHZVpoQtAcHK3PHPglbodOWrHejHwuYC6cx5reeb78Q8Hkdj+MgrCau3m8StvBW
 YSuY6Fbs/tXkEDT0oKziAhoFs2E06eQv4LFDdGfw3htK9+ObQUfY/BPJV5mQPsoP8edas7uj3te
 W6lIUtiQXjy5B2D6h53VUkiJGyZOJYwg9XfXGeOA0ocFMPekGpAszcU2y+NuCEvVOOMC8EBkFp/
 5PE8ukjMAPSxoD/4gidU24xA7tdfMKk/qQGURRMHrJV3b8LjoWmAE7pkc8MRYmEJ7bTI+URV9vH
 9DMC/h7vPYxCZR5L/oq7BFi1I=
X-Received: by 2002:a05:600c:138c:b0:490:60cb:55f0 with SMTP id
 5b1f17b1804b1-49060cb56femr170900035e9.21.1779793365544; 
 Tue, 26 May 2026 04:02:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454ac6a6sm326946015e9.12.2026.05.26.04.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:44 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B59185F873;
 Tue, 26 May 2026 12:02:43 +0100 (BST)
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
Subject: [PATCH v3 02/14] tests/Makefile.include: fix typo in comment
Date: Tue, 26 May 2026 12:02:30 +0100
Message-ID: <20260526110243.470002-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index a063a1d60fe..3b1af78ca1e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -42,7 +42,7 @@ SPEED = quick
 
 
 # TCG_TESTS_WITH_COMPILERS represents the test targets we have cross compiler
-# support for, CONFIGURED_TEST_TARGETS it what meson has finally
+# support for, CONFIGURED_TCG_TARGETS it what meson has finally
 # configured having rejected stuff we can't build.
 CONFIGURED_TCG_TARGETS=$(patsubst %-config-target.h, %, $(wildcard *-config-target.h))
 
-- 
2.47.3


