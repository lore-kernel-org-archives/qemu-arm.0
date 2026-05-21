Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E082CD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:20:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I4-0004K5-Ih; Thu, 21 May 2026 09:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hj-00044F-2D
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008Qi-Op
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43d73422431so4282945f8f.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369463; x=1779974263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dhi0yYpKFaxwEdsneAb6BI4LLBY0LWLrqFgh9GqtIPc=;
 b=WMOICJicqIBlwMaUpuvPZuM3J380ZxI0ZRLmE2aDU0erD5m2YmVoHG2BxCZZNMR9nA
 ha6lwUMPevGHkKAZ9DWi6I5RDF10g4undG3M3Vjl8PMmBMxEneHXPFbiqC1yAbSBBk/h
 24FqCJtn4yZoc+LANqb9IOzMTMPxHaMLZMMVF6y9LL+t+ipmo5Z8HUGGGlWKhtLmu+HK
 irEzv6WEDo6HUjhxCeGUN0Q+PkBYWYNNJWfPX/PLZSoKurAROUj+Z6TyIuUJ5b8y+Y1+
 q81RePZ5aMCdDGkPYrBsk4AT3N8uGatc5zvPfmI89f/evXzixvnN3b+nY9xk2AEr7iW9
 nTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369463; x=1779974263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dhi0yYpKFaxwEdsneAb6BI4LLBY0LWLrqFgh9GqtIPc=;
 b=V/AqahYr8RR8i+5O0FSZIbdVUeXVoKemkBRgQ5i1g17p2xbfM9OGkDJf/3Pbc6dRU3
 GS+FZTSrKdtYr99nT08ZskPztntefbnABPzFJCbGQkouzT1v3Q5nAWmJihO2U4y0APVv
 JFtEQ9KxkP67jXeZdCqsAI78/vd260rQsSvjWrKf22sK2vG4mzjdPKgeFtp4clu8kVsz
 iA+wOmaEJODqJGSXr3z5LvQfApJRnUp11wIwoSbexo6MxEMdXtt2cZfAcsrqWXIZcsDb
 km1j+6v37qhMiLLyTwkVcvXAckjrEuiMDC/L/59bHNssAZmAUC4/ROJY+0YtAISEJAAA
 cHEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9f11tCP2R/kyLPgEXqhZhxMzE+YybI7TUOGRVxGrZEX4FYtZYQVUfM9oR71lXZDy13vUU79d3CTg==@nongnu.org
X-Gm-Message-State: AOJu0YzI3HDk1IsK+ZmbtaLgFXmlD18li0GK/laRR+vhw9RqKgh9fh18
 61AhQ8uhxXrFRe3UFj7K9Hop06alWJfhprZxh6MK2kb6YPMocLYZqMusTIFUHr5tAgQ=
X-Gm-Gg: Acq92OFiRuCOg4uXPJvtHen+FZmdK/tL/DhAj+fHJqCS0oBOu9yov0fHxH80PxSY2Ig
 sr7biJXbIeJUyKFiKw4mMuNZSQFkopVSjYyank7E4JDl+4c2g3QsDKpETYBQFNS8JUj2hBs2JuA
 SHawaYljgq0Yfbxi7tIUc1heKiyH6lxTLtgWgv23tyMVlypVM/UBkR/COx52oWCLoqWYm58D0yg
 GaXMKVyDJ11n6CB0Haj45w9Ss6lowFFzoLSZo1lL/citXzofzdO7EWTI7ebRXLE5c3wnzogx58j
 hTX5ma8wKInunmMsBnX86t9VAm7ObxN77Aan3/sTVsT0BwBMZdhKEK404ZjNlRFsOLsPOfMda5V
 lv9ztxiaBcuKU2bS9mCN5IxtCsePN/KwvdP4jALs6bLudLEJ1ObA0By9raULMl6Fk+W9MYxomyx
 LwBtjv0PhN1NY/PX1SN7iY1MdcrqHkYgzLYw==
X-Received: by 2002:a05:6000:4205:b0:44f:db87:8919 with SMTP id
 ffacd0b85a97d-45ea37be492mr4736360f8f.4.1779369462831; 
 Thu, 21 May 2026 06:17:42 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa92de9asm2805614f8f.17.2026.05.21.06.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 838A25FA16;
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
Subject: [PATCH v2 03/16] tests/Makefile.include: add binary dependency to
 run-tcg-tests-% rules
Date: Thu, 21 May 2026 14:17:25 +0100
Message-ID: <20260521131739.540157-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Explicitly set the appropriate QEMU binary as a dependency so we can
ensure they get built. This is especially important for MacOS which
otherwise only builds the unsigned binaries on a normal "make all"
run.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ce6a0dccaf4..cf6f9e68245 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -57,6 +57,12 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 $(foreach TARGET,$(TCG_TESTS_TARGETS), \
         $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
+# $1 = the stem (e.g., arm-softmmu or x86_64-linux-user)
+get-qemu-bin = $(if $(findstring softmmu,$1),qemu-system-$(subst -softmmu,,$1),qemu-$(subst -linux-user,,$1))
+
+$(foreach TARGET,$(TCG_TESTS_TARGETS), \
+        $(eval .ninja-goals.run-tcg-tests-$(TARGET) += $(call get-qemu-bin,$(TARGET))))
+
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
-- 
2.47.3


