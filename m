Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9921DC531D0
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 20:10:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmzjL-00066l-E7; Thu, 23 Jul 2026 16:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjH-00062B-B5
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjD-0006ed-BW
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so7364775e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784837349; x=1785442149; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ewk2okeydBULGob4WuhT+omCLum4orlAHzQ00DpKv+k=;
 b=Ju3M3g2HxEZYi3ZVJuO5CbsrmfftkU4ZvPbNLMZtWRDRrq8vb2xe344F1oj1EnF/Os
 w9V31gwNx9YpeuVwDrCcE1NScRUPT6Cdzk23zRWsuGc9ogIrqQprBXOiQGt5q9iusEFX
 64CBineI2O4hanYMyQooAU0sm8dn+o+wOmMk2VmE/Ract6hFZGyuQXCCye577H+x4DJZ
 yxMINoRl62F3yVro/62h2o/Xb+8fYOjnjRg+0QZhnUhB3FSZ2asjjCdjkXMC//NnLTnj
 RwO4IFyaaCrgi+D0FGKQquyOMB+EvLeLJsnm/cAdHHi6+8vUXV9MNXqbW+bkdOpLD7Tx
 daXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784837349; x=1785442149;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ewk2okeydBULGob4WuhT+omCLum4orlAHzQ00DpKv+k=;
 b=nRXXcRG8KLhYhnO7u25Z1t2CZM70cP2SQpQ27B6J+tE/YELrUUHqmzpPKlWxvsRCtb
 O/VI3Z/sx2hJU+jZGDJsxx7LggmF0UljcnY2O9sZqVGRjVriLH7KH1ma23wQ83EeC5j4
 sI3hTNLSjnL8IOG62j9NyVBfRzxM+N6cjWpAmsq33FXXyhIOxNPR747kEpCX+xv2RxnZ
 a/P8I6XwgVI0kC+MXMUVfH5WmOQUS2nQAZ9dKu4BOj9hSbWksMiIUrjYS4S0tmqTri4b
 JkiKt7lNJfhXa4DjJ3NqEzFvnp/fIYpUm73sS5GJbhAr8cktE+t0mYNlYTzSqzjxLnhK
 oVzA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZ8nOKDBtVQT1S3neKnMD6zlV0FtC49IfQYz4WrSYC+3Pk6NRp7g0FNRwKNlFW+alyD5Y3twpZsA==@nongnu.org
X-Gm-Message-State: AOJu0YxpsiMHm8HInurG+Td2qDGjA3yqRlqZCM8jd/0+ogXbRo9R7aoK
 mRUCif9dD+1kRSw0r/Uk6ry2SUBvI1FBt/RvIt0ZxH9MQRqGTTmC18iOvDluDJE0UHg=
X-Gm-Gg: AR+sD10UmuCroaonR2xgCaC1IXro7qlc0M0BRZMEXOwrx5+N1UcswgiCftE3VXMyw+0
 tp5yJtwR+kvUtn9L3GMvV/r4tp14zsGa2VrVY9gYhRHPbibi1KuaIESduoXNeSDtS0uEGWbjOQi
 ub2jD8+DwiUuSMqb/kNsSPR7R3LzHDe1a1G/14b9PHatTrKuiXlud3sQ5LlWts6+Zh0XvePVHB+
 BseqQNWD+X+FcAKhCqZXWAGpGrjXBEKDlAnGu7gKstGr1UPWNkfwqCSp1PuV/EHjMgOF6sGscRt
 l0iOdiixyeBdrNO354Hc39x3mWk71ps/mUcm8iZr+MQUPOKPlJpn066l19+V0nTz6fYL/gvjLDt
 +cgALHy9IKcodEV8ZXz2YszphnAjBsywFESggNjtXFR3FRJeRJhpKK67hksyD6ldYEh+TXCS3F4
 RcJrtNXY/MzPd/
X-Received: by 2002:a05:600c:4fcd:b0:492:4a50:41fe with SMTP id
 5b1f17b1804b1-49573cfc9b6mr69453315e9.22.1784837348700; 
 Thu, 23 Jul 2026 13:09:08 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957af5d8c1sm19938515e9.1.2026.07.23.13.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 13:09:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D1E635F8BA;
 Thu, 23 Jul 2026 21:09:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Brad Smith <brad@comstyle.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 2/3] tests/arm: add explicit CFLAGS for system build
Date: Thu, 23 Jul 2026 21:09:03 +0100
Message-ID: <20260723200904.224413-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723200904.224413-1-alex.bennee@linaro.org>
References: <20260723200904.224413-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

The brew toolchain on macOS (arm-none-eabi-gcc) is a little different
from the default on Debian (arm-linux-gnueabihf-gcc) as a result it
defaults to an older architectural baseline (without isb's), assumes
softfloat and will get confused by including stdint.h without being
told it is compiling freestanding code.

Make these all explicit so we can build arm-softmmu tests on macOS.
The test-armv6m-undef is unaffected as it has it's very own build
stanza.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index b66074b0b43..3e8a9b4073e 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -29,7 +29,7 @@ ARM_TESTS+=$(patsubst $(ARM_SRC)/%.c, %, $(ARM_TEST_SRCS))
 CRT_PATH=$(ARM_SRC)
 LINK_SCRIPT=$(ARM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT)
-CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
+CFLAGS+=-march=armv7-a+fp -ffreestanding -nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 # building head blobs
-- 
2.47.3


