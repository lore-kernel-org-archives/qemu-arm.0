Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB3CCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3IA-0004eC-4v; Thu, 21 May 2026 09:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hn-000477-Aw
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008Tq-Rm
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so40009515e9.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369468; x=1779974268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffNTZsOoJb72T97S2Idm/k/at+IhxpF2B8d702ojQE4=;
 b=hpvaZe8tyRHs196TrERg5V38mbYenLQ7fA3pnqJ8NyB5r7UHh5EIqo4ynXhRua8Gx0
 Gtw14y/o+BevuPj+cABTe7hca40nAVXoM76boeAU9uWIPD7ja/R+K6Cag3Fv3OHctCz8
 U1iQIhg4iu3zSL9HvyTnxnS5bVTmK+yw4+rGHass8lOOtHWr6tf64hw6VuX9sGrJnPlK
 0DQPLiZ66IOnsiyENJFYpoBOf46V5iiPWS4KfxJGlK/Q6q3Qf3EV0o/OK7j70S+KrYHA
 IFstrlMUhld3sVI7KmIQgnM2zfbOQLB8RS8XeCtCF/n1HQ4ounlUji6+bY1FK7f7LVMM
 po7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369468; x=1779974268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ffNTZsOoJb72T97S2Idm/k/at+IhxpF2B8d702ojQE4=;
 b=VjRO1mMzA9jT8SaLnYR13BeF5sSmkwnDYhITGnOYrzuhuFNLVtMbeCq7ciIewMjXaH
 wu/AKDAwOMD+CzezOeQ9xPXxiJ1pbWwewR2yBrvwA4TwnLOW8usraObSZ4aNOdU7Tn1n
 5p/xrxyGwfzgCAOG4/fzjnlK6tHhvv+DjiHfSkPbYe++3hCnsuud7tUKcOhGVIvXN+H+
 QyfWyqZlGwCF0vnMkK8kku1UDZ6IoA1X6hYLd8704r91JP1IJVOlPgEWVnKXG1oK3L06
 HgBxqDXlmSkFKPHLg6HnqwUizhvxY6eq5EgIJOWRTcjv+Wxz1FlMQ1CB3nhRf3LUGZlQ
 brAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9kq6fwMvGUrL/K8mSg7NgpFR+thH9P6sOlgoMY5jAf4+mc2Jdgj6PaLKG9ELHhryz3n5vfPIk+2A==@nongnu.org
X-Gm-Message-State: AOJu0YzD7T9xK76NJx+E6K023hUQgBNq1SiFlamewBkWPdnos/Ng216t
 LWxpRculmDXHHhjTL2xprdRbw25k+cm7V1PbIeZ9xZ1ZsI2p2y71r1BLmX8aPQN68Io=
X-Gm-Gg: Acq92OEwPPSv+TLYKSu1D+o2NQDrEMfSj1k5G6sF1FOz7kHNmVGpnD0s2kVg6UZWumq
 mJoUylGA1SOTKwRg5o7oqQ7CRoRnKVySNmCvy1mIOiTUrmTWnxM+c4+VYJNBFgg/xHTz2fWCtlT
 wJfycVXvQ2oNmeHNIT3nCMt1VrJDLSf3VmUUIG/e44V8kip5gfHH5vFcX9LKxETIh031/R87zVH
 fMDs61VSxB+t8lle0hRPtqCT1aJC+oiFKcByHqhdK4HoLEv9GgbPHa5ZOyE44yr/+GX0u6VUGcP
 pb6HmTZ7pXbu1T1lGMVuCsfY/c7cEnLyWohAP3vooIlFIQnwFNW4eXv6EFrh7kzeQA2yQ3qXBsi
 Xh1uITumLUSRzWx4lt4WdyRdhE40cO1s9Zc/fszSzPW0c12CaMA8pr2/pYPwuSCYh4E5ivj+LyB
 0cfuTEt/ZKXzaJnI7zBO5vtlg=
X-Received: by 2002:a05:600c:c086:b0:48f:e230:c3fb with SMTP id
 5b1f17b1804b1-490360dfc18mr33017965e9.33.1779369468280; 
 Thu, 21 May 2026 06:17:48 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035adf173sm23145475e9.0.2026.05.21.06.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 36CBF60570;
 Thu, 21 May 2026 14:17:40 +0100 (BST)
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
Subject: [PATCH v2 10/16] MAINTAINERS: Fix
 docker/dockerfiles/debian-hexagon-cross.docker path
Date: Thu, 21 May 2026 14:17:32 +0100
Message-ID: <20260521131739.540157-11-alex.bennee@linaro.org>
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Fixes: afbdf0a44ea ("docker: Add Hexagon image")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260518102222.80735-2-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b61a23893a..5fadf2cfcc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -257,7 +257,7 @@ F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
 F: configs/targets/hexagon-linux-user/default.mak
-F: docker/dockerfiles/debian-hexagon-cross.docker
+F: tests/docker/dockerfiles/debian-hexagon-cross.docker
 F: gdbstub/gdb-xml/hexagon*.xml
 T: git https://github.com/quic/qemu.git hex-next
 
-- 
2.47.3


