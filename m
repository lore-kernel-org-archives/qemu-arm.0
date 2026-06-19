Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0217CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:57:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabab-0007GR-Op; Fri, 19 Jun 2026 11:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaZ-0007EW-V5
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaY-0001Fu-6i
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4624a44e152so1888926f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884621; x=1782489421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMMNTERO31F+8kCv4Mg7Yr6Pae5QtEx8Xzxb3fKzqfI=;
 b=pgXrVUk8Jd5yJDML9xGNnOgQ54g3rMrnVXtlnRRF7ibCrBJ1gcuv6h1UAqi9X5e070
 2jEwlibqBI9zDGpGpVCvNwMa9CxmwIYHv9sXKSCJNXO2/XA0jvGsPK3YU3GWYSthi8CH
 BECxWbLU3uGX6Dd5pvSChUPyLXf5dPrlQbrTccYGXZ7R25dI0QV17Asuee900r6zwzad
 isVPXzMQfhj9S17UKjjgaFCt1/5rqXGqocNCSIFxQSlVaK/B/bOcDzinlRR4vv4qPh9Q
 GkkgbDWW8N0DfjmsjCONisDSfGXfH+UGyLXpknX1icinU8hFadzdAi9iNTwzFCsseA81
 +J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884621; x=1782489421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iMMNTERO31F+8kCv4Mg7Yr6Pae5QtEx8Xzxb3fKzqfI=;
 b=sF2nG/pNjSB/epgRr+7hQ/ZssB6GtTd03Bcyox2gdeB3lWl73YCNX7yjgcTMkjpmmE
 Muqn6MHrzfnzTDq0bAguk6K1XiJIY1VUQ+jkCjgR0KkZx47inPKtWbvE1KzcBlHykoUI
 zarpetzNcrHCsWRnEJNlwmkb3byJVsItE/HkI6df6N94Z+C5sLZnokXFYw0/PlHZgW0r
 ygCz6xbtko8q7UOvC7N58K5Q3QVRXNx/1QbneiHXaNzq2N+otDX8N6vGnDYt4o9hpO+2
 MJZZxh94C/RjfxzEeOIRvX7s2KToRc87NkL8nXqSw7ItjTp51yO71MnOm234ZYDBtrH6
 8oyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LjY6nokuJIH7hHjvGszyQiaQxMxPrf2KOIy2A7ferY7tdg+f5/qDVMBfvoh9S/5iK3otAXQRAew==@nongnu.org
X-Gm-Message-State: AOJu0YxzUTjKxAvyke+VlE3YSF2wSrbkNZx1+41Pn9r917fdiTceOfqL
 Pa/LnG6GMg0bhmYCvSOLa68KlCTfZhs+ONATqVdGiI4HIDRxbjCrc0vjQ+XG5vE4CWo=
X-Gm-Gg: AfdE7clsl78FLjna+OhBZ0xh/c0l1w8EpBYVXu8+W2czskN4tCmpVbF5dJqDzDOTc9w
 yhB4Mvogd+Ikpzt6Q2Iz/8O1hcP2a5lIHwMbX57UA0bDAwk3jSpJuFYlnzbhy9r6k3Va4eYD1b4
 W2G3wtvxyesBrd0+qKRsihCvlBo4rkvd/NmFLkXwOnjgSlRZYPXCdyvVjor3/IMF7PE7qRUR3YZ
 koC5xwdX3f7ux7pwupE5HVb9x3iIlncUgyoPqKO5nSBLWE754I4rPCiewtZK2AVeyKuEbIR6uDS
 HCnimsjys3KQPLJau9crbAbQ1Ozx7xxvgn1/+AT+HkZGGBkc0NJhIdPW+H6koIayK4p5mwUlIkt
 lrTv0Nsxp+wclNm4M6QyKDFFeUpDo5wfK6oFohjYcBLSpYcBE0MfwltdMYiA9GkSqU3VuTPsrDb
 QrLpsEWsJTpKKqZIcJvk6b0SA=
X-Received: by 2002:adf:e3c1:0:b0:460:18cc:dcfe with SMTP id
 ffacd0b85a97d-46508afa647mr6460257f8f.34.1781884620553; 
 Fri, 19 Jun 2026 08:57:00 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c57a0esm2723f8f.27.2026.06.19.08.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:56:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 819AF5F917;
 Fri, 19 Jun 2026 16:56:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Cleber Rosa <crosa@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/7] python/qemu: split console from harness args
Date: Fri, 19 Jun 2026 16:56:51 +0100
Message-ID: <20260619155657.944220-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619155657.944220-1-alex.bennee@linaro.org>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
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

Before we mess with the console output lets create a new helper just
for that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20260614100902.885698-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 python/qemu/machine/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index e8973a87394..18ee5ec0147 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -306,7 +306,11 @@ def _harness_args(self) -> List[str]:
                 moncdev = f"socket,id=mon,path={self._monitor_address}"
             args.extend(['-chardev', moncdev, '-mon',
                          'chardev=mon,mode=control'])
+        return args
 
+    @property
+    def _console_args(self) -> List[str]:
+        args: List[str] = []
         for _ in range(self._console_index):
             args.extend(['-serial', 'null'])
         if self._console_set:
@@ -372,6 +376,7 @@ def _pre_launch(self) -> None:
             self._wrapper,
             [self._binary],
             self._harness_args,
+            self._console_args,
             self._base_args,
             self._args
         ))
-- 
2.47.3


