Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95341CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:03:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpYz-0002fu-IJ; Tue, 26 May 2026 07:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYn-0002Ze-Hf
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYj-00066i-5b
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45e6a4d0be0so4585976f8f.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793371; x=1780398171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxcKqoYGT56UThLLQ8nq8BYxr3paAETNRWypqwIxJZ8=;
 b=wq+TAOgFvoxftiLLSE7e2nmu0dq8PASCsqx/0ENIIO4tppvDfEsl+MT/foXI+feC7y
 FMXSumgJ18KF0AhmRWo+7JmkIPpc/heJxrpY3CRr21/8RMaY8zSLcYduFJu7BPEyHCnW
 umgeq/6Aq6x1XZh3QMPl3bLqNCI57JMKTcOAoX46yAc7nlo1ucUahRiVQYuYQVKm7ivI
 xOL0TKMGPw56W7tzmrNLv3LaJcPAqC83j+J7cs710hlRF9JSURZAq6Dhuzj6cbC0XBAT
 t+ES6Kv8jzfU+Pns1ZZzkOleA29T1Bnj6bVAWCSlnwPEY41Wj3Wrz80aRG7B9Li4D2Tp
 4yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793371; x=1780398171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uxcKqoYGT56UThLLQ8nq8BYxr3paAETNRWypqwIxJZ8=;
 b=bEiEYjniSnB3Zm2/cFqmcOpjagIiRrezZyQVBKvecLmhZXb9qTWGBAj2ezlEBtjsEs
 mSwetHw/tpUkv/PyzGdV/Astf1MAR8XZBEE96D5fe3CZnE2T7pU4YHVn+NLQjwaE3Zl6
 uozCdY0qeNgvWg+B41PqXUig3l1FyaC3xLnr2kWk6OVgcYH3Za6Tn8calDoXi6+tNJh8
 AGfCO0NQgfSI3c1z8ZSjgOPmZcT1Ghppds3TosC6joTvi1AIueAIHfQ0M5EZhRWCQ4Qs
 qkrAJ0I/yQEMMdT7mgP7EGvv5QcCKX1FdoohmcE1mDZ7bm6NqnlPABguv9FhNjR8/33r
 Hhxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9eqbsa2Eau5aqiBIF4UJAMl/DNo6XAI4mrlNPphpRSC9wcPn3LgUxods9xdceYUl8rk9W7BqcHIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwoMFjdTOidoOHonL65b8OeIyBHizSsfkZ1+Ed2OxjgGaycwVoP
 H1dRbR+sAbUn8WS2nkD2eOy2wzRim0gPNxsNGWDQTGTime6zsI0d0Z41Rj21JwcSn9Q=
X-Gm-Gg: Acq92OEeKq2iLTvukqXOpz86apod3uLOkos4M3Zgyat7kKLVUjCzRklqpfPSYoND4fR
 RYCxEMMytYpgCdE3bU5kYQkUiU8pDq0N+rHwq+BNQ6930hp2YD6S6gsDBkPqLr/5uGAfQeqbFkm
 ODvcV4fBwNaozLJb5L6/inmlntqoxeEfiCnl41Oo57txkHyI44oArUKvZ/XMF5Sy1zDe4syBktt
 i9StxBlS7dpnrX09riL1gG/k67YeVWN1YtU75kxV8XwPH7Bay/uO/W4VISu0faeT0yd2SenQkMF
 v05ODCmLnitq/mQpqyjwlHvR2xLRbWPmGRu6jxT7XjlcLBtDNFAadX824eroeaqf6e9tcy3xcU7
 tUwvuTLL5Hoo2yBcLiL7wiHBB/YqO0ZtUoEtCgWJEzc5f8I4wyPhewN/Su5nH00NUClbk03HCrB
 Dm3OKBJz6QIgrWj/p5tNEZLMc=
X-Received: by 2002:a05:6000:2f81:b0:45e:a0ab:8bd1 with SMTP id
 ffacd0b85a97d-45eb3688839mr31116058f8f.7.1779793370954; 
 Tue, 26 May 2026 04:02:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4741bsm36069874f8f.22.2026.05.26.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7780A60484;
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
Subject: [PATCH v3 10/14] MAINTAINERS: Fix
 docker/dockerfiles/debian-hexagon-cross.docker path
Date: Tue, 26 May 2026 12:02:38 +0100
Message-ID: <20260526110243.470002-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
index 520f7678287..506f8d62467 100644
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


